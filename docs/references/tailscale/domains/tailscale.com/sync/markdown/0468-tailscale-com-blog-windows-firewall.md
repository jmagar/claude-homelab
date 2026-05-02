Programming the Windows firewall with Go | DevOps Guide
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|August 13, 2021
# Programming the Windows firewall
Tailscale tries to be zero-configuration: you install it, log in, and
it should just work. That means we need to interact with the
underlying OS a bunch.
An example of this is the firewall on Windows: if we did nothing, by
default Tailscale wouldn’t be allowed to receive new incoming
WireGuard tunnels, and the Tailscale network interface as a whole
might not allow incoming traffic.
So, we need to instruct the Windows firewall to allow our traffic to
flow, so that connectivity works and Windows doesn’t interfere with
Tailscale’s centralized ACL enforcement.
This post is going to explore Windows’s firewalling functionality, and
how you can play with it yourself in Go.
#### Firewalling on Windows
At the core of Windows firewalling is the Windows Filtering Platform
(WFP). The WFP is a combination of in-kernel and userspace facilities
to program and enforce packet filtering rules efficiently.
Most Windows users never interact with WFP directly. If you’ve seen a
firewall-related pop-up in the past, you’ve interacted with the
unfortunately named “Windows Defender Firewall with Advanced
Security.” (one wonders what firewall would advertise itself as
having Basic Security)
Windows Defender takes care of fancy things like prompting you the
first time an application wants open a port, and translates high-level
policies like “allow file sharing services on private network
interfaces” into lower level rules that WFP can apply to the network
traffic.
If you have relatively manual needs, then you can stop reading now:
Windows Defender exposes most of WFP’s featureset in an easy to use
GUI form. With a few clicks, new policies are set and forget.
However, if you’re looking for automated firewall reconfiguration from
software, things get a bit less pretty. You can edit Windows
Defender’s policies using `netsh.exe advfirewall`, but that implies
shelling out to netsh.exe when you want to make changes, and manually
keeping your desired rules and Windows Defender’s configuration in
sync.
Fortunately, for more advanced use, we can skip Windows Defender and
use WFP’s API directly! Let’s look at how that works.
#### The Windows Filtering Platform (WFP)
Applications can access WFP through the API exposed by the
`fwpuclnt.dll` system library. Microsoft has extensive [reference
documentation](https://docs.microsoft.com/en-us/windows/win32/fwp/windows-filtering-platform-start-page), so I’ll stick to providing an introductory tour,
through the lens of [`inet.af/wf`](https://pkg.go.dev/inet.af/wf), a package we developed to
interact with WFP from Go.
To interact with WFP, you first need to create a session through which
you’ll send further instructions:
```
`session, err := wf.New(&wf.SessionOptions{
Name: "my WFP session",
Dynamic: true,
})
`
```
WFP sessions have a few options, but the most interesting is whether
the session should be dynamic. Filtering rules created within a
dynamic session are automatically removed when the process that
created the session exits. This is very handy if you only want rules
to exist while your service is running. The alternative, a static
session, lets you create long-lived rules that can persist even across
reboots without further intervention.
With a session open, we can list and create firewall rules. But before
we do, we should look a little more into how the packet filtering
framework is organized.
WFP plugs into the Windows network stack through a set of
**layers**. Layers are inspection points in the packet processing
flow, a place where WFP can look at packets and pass judgement on
them. Each layer has a different set of information to offer, so
filtering rules need to adjust to the information available in a
particular layer.
For example, an IPv4 UDP packet arriving from the network goes through
the following layers:
* `INBOUND\_IPPACKET\_V4`, which has access to IP-level information
only (roughly up to and including OSI layer 3), mainly
source/destination address and arrival interface.
* `INBOUND\_TRANSPORT\_V4`, which has access to UDP-level information
(roughly up to and including OSI layer 4): source and destination
IP and port, the IP protocol (in our case, UDP), and a little bit
of metadata such as IPSec realm IDs.
* `ALE\_AUTH\_RECV\_ACCEPT\_V4`, for the first packet of a UDP session
only. This is the main event, where filters have access to all
information up to OSI layer 7, including such things as the
identity of the process that would receive the packet if we allow
it to proceed.
* `ALE\_FLOW\_ESTABLISHED\_V4`, an informational-only layer that lets
applications get notified for every new session that the ALE
filtering layers (like `ALE\_AUTH\_RECV\_ACCEPT\_V4`) allowed.
* `DATAGRAM\_DATA\_V4`, similar to `INBOUND\_TRANSPORT\_V4` in amount of
detail, but which sees both directions of traffic flow, not just
the inbound direction.
While you can create rules at any of these layers, most applications
will want to focus on the [Application-Layer Enforcement (ALE)](https://docs.microsoft.com/en-us/windows/win32/fwp/application-layer-enforcement--ale-)
layers. These layers only get invoked once per connection, to decide
whether the connection as a whole should be permitted. After that, all
subsequent packets can avoid those heavy layers, for improved
performance.
(You might be wondering what a “connection” means when talking about
UDP. WFP, like many other such systems, thinks of a UDP “connection”
to be a flow of UDP packets between one source and destination, with
an idle timeout of a few minutes.)
#### Rule priority and sublayers
Now that we know what layers are and which ones we should be looking
at, we need to look at rule weights and sublayers before we can add
rules.
Every rule in WFP has a weight, which dictates how the rule orders
itself relative to other rules. To assess a packet, you take all the
rules whose conditions match the packet, sort them from highest to
lowest weight, and run through them in order until you find a rule
that returns either **Permit** or **Block**. That’s your verdict.
But that’s not all! Within layers, WFP has **sublayers**. A sublayer
is a container for rules, which itself has a weight. When a packet
arrives at a layer, *all* sublayers get to have a look at it, and
return a verdict according to their weighted rules.
Once all sublayers have returned a verdict, WFP runs “arbitration” and
collapses all those individual verdicts into a final **Permit** or
**Block**. [The exact rules are quite involved](https://docs.microsoft.com/en-us/windows/win32/fwp/filter-arbitration), but the basic
logic is that **Block** overrides **Permit**, so all sublayers have to
return either **Permit** or **Continue** (a.k.a. “no opinion”) for a
packet to be allowed.
(The reason the full rules are more complex is that sublayers can
return “soft” or “hard” **Permits**, with the latter overriding a
**Block** in a different layer. And then there’s yet another separate
action called a **Veto**, which is an “even harder” **Block** that
overrides even hard **Permits**. You can almost picture the succession
of meetings that led to this rule one-upmanship!)
Sublayers allow us to construct different sets of filtering rules that
do not interfere with each other, but all have a say in what traffic
is permitted. For example, in addition to whatever Windows Defender
does in its own sublayer, we might add a sublayer stating that no
matter what Windows Defender thinks, no inbound connections are ever
allowed on a particular interface. Those sublayers will compose such
that, for that one interface, our **Block** “vote” will overrule
whatever permissions Windows Defender wanted to grant.
#### Adding filter rules
Now that we know a little about how WFP is architected, we can start
adding rules. As a reasonably elaborate example, let’s look at the
“default route killswitch” that’s popular among privacy VPNs. The
privacy killswitch is a set of rules that block all outbound traffic
on interfaces other than the VPN interface.
While privacy VPNs tend to advertise this as an extra safety measure
that guards against traffic accidentally doing the wrong thing, this
killswitch procedure is actually required to make default route VPNs
work at all on Windows! When the VPN adds a default route pointing to
the VPN interface, this only affects *new* connections going forward.
You might think this is a bit of an edge case, but modern browsers
maintain a socket pool to improve performance when browsing
websites. That means that if you load a website before enabling the
VPN, then continue browsing… you’re likely to still be browsing that
site sans VPN.
Fortunately, WFP can help us with that: whenever you change the rules
in an ALE layer, this triggers [ALE reauthorization](https://docs.microsoft.com/en-us/windows/win32/fwp/ale-re-authorization):
already-open connections are resubmitted to the filtering engine, and
the rules (including the new ones you added) get a chance to forcibly
terminate them, even though they were previously authorized.
To begin with, let’s register a new sublayer with WFP:
```
`guid, \_ := windows.GenerateGUID()
sublayerID := wf.SublayerID(guid)
session.AddSublayer(&wf.Sublayer{
ID: sublayerID,
Name: "Default route killswitch",
Weight: 0xffff, // the highest possible weight
})
`
```
(we’ve elided error checking for readability in this post, though of
course for production code you need to check for errors properly at
every step.)
We’ve placed our sublayer at the top of the sublayer cake (Windows
Defender registers itself at `0x1000`, and no core Windows sublayer
ranks higher than `0xD000`), so if we issue a **Block** verdict,
nobody else can overrule it.
Now it’s time to add some rules. First, we want to permit all traffic
in and out of our VPN interface:
```
`layers := []wf.LayerID{
wf.LayerALEAuthRecvAcceptV4,
wf.LayerALEAuthRecvAcceptV6,
wf.LayerALEAuthConnectV4,
wf.LayerALEAuthConnectV6,
}
for \_, layer := range layers {
guid, \_ := windows.GenerateGUID()
session.AddRule(&wf.Rule{
ID: wf.RuleID(guid),
Name: "Allow on VPN interface",
Layer: layer,
Sublayer: sublayerID,
Weight: 1000,
Conditions: []\*wf.Match{
&wf.Match{
Field: wf.FieldIPLocalInterface,
Op: wf.MatchTypeEqual,
Value: uint64(5), // interface ID
},
Action: wf.ActionPermit,
},
})
`
```
Broadly speaking, for every rule we want to add, we have to add it
four times, to the layers for: inbound IPv4, outbound IPv4, inbound
IPv6, and outbound IPv6. The loop above illustrates this, but for
future rules we’ll show just one of the layers, for brevity.
To further simplify these code examples, I hardcoded interface number
5 as the VPN interface ID. In real code, you’d look up the interface
ID (using the [winipcfg](https://pkg.go.dev/golang.zx2c4.com/wireguard/windows/tunnel/winipcfg) package, for example) and then use
that.
Next, we need to allow some traffic to continue using non-VPN
interfaces. Let’s allow DHCP to use any interface it pleases:
```
`guid, \_ := windows.GenerateGUID()
session.AddRule(&wf.Rule{
ID: wf.RuleID(guid),
Name: "Allow DHCP",
Layer: wf.LayerALEAuthRecvAcceptV4,
Sublayer: sublayerID,
Weight: 900,
Conditions: []\*wf.Match{
&wf.Match{
Field: wf.FieldIPProtocol,
Op: wf.MatchTypeEqual,
Value: wf.IPProtoUDP,
},
&wf.Match{
Field: wf.FieldIPLocalPort,
Op: wg.MatchTypeEqual,
Value: uint16(68), // DHCP client port
},
},
Action: wf.ActionPermit,
})
`
```
Here we see a rule with multiple match conditions, all of which must
match in order for a connection to be allowed. We’re saying that any
UDP session with port 68 as the local port is permitted. In real code,
you might want to make this more restrictive, e.g. by constraining on
the remote port as well, or by listing a specific set of interfaces
where DHCP traffic is expected.
We also need to allow the VPN process itself to send its encrypted
packets out through normal interfaces. Fortunately, unlike Linux, the
Windows firewall can have rules that are based on the identity of
particular programs:
```
`guid, \_ := windows.GenerateGUID()
// Get the absolute path of the current program
execPath, \_ := os.Executable()
// Ask windows for the corresponding application ID
appID, \_ := wf.AppID(execPath)
// And let it through the firewall
session.AddRule(&wf.Rule{
ID: wf.RuleID(guid),
Name: "Allow VPN program",
Layer: wf.LayerALEAuthRecvAcceptV4,
Sublayer: sublayerID,
Weight: 800,
Conditions: []\*wf.Match{
&wf.Match{
Field: wf.FieldALEAppID,
Op: wg.MatchTypeEqual,
Value: appID,
},
},
Action: wf.ActionPermit,
})
`
```
Finally, now that we’ve allowed VPN traffic and a few exceptions, we
can add a lower-weight rule to block everything else:
```
`session.AddRule(&wf.Rule{
Name: "Block everything",
Layer: wf.LayerALEAuthRecvAcceptV4,
Weight: 100,
Conditions: nil,
Action: wf.ActionBlock,
})
`
```
#### Life of a blocked packet
With these rules in place, we can see how this would play out for an
incoming connection. Say you’re running a development web server on
TCP port 8080, and when Windows Defender prompted you about it, you
instructed it to allow incoming traffic to port 8080.
A connection comes in over your VPN. Let’s skip the layers we haven’t
touched, and see what happens in the `ALE\_AUTH\_RECV\_ACCEPT\_V4` layer.
Both our sublayer and Windows Defender’s sublayer get a chance to look
at the connection. In our sublayer, the connection matches the
1000-weight rule, because the local interface for this connection is
the VPN, so we issue a **Permit** verdict. Similarly, Windows Defender
issues a **Permit** on the basis of the protocol (TCP) and port
(8080). The layer got two **Permits** from its sublayers, so the
connection is allowed.
Now, someone tries to connect to your webserver over the LAN. Windows
Defender’s sublayer permits this as well (it’s still TCP port 8080),
but in our sublayer none of the **Permit** rules match the connection
any more, so we fall through to the final **Block** rule, and issue a
**Block** verdict. **Block** outranks **Permit**, so even though
Windows Defender was okay with the incoming connection, we overruled
and blocked it.
#### Comparison to Linux
If, like me, you came from the Linux world, it may take a little
adjusting to think like WFP expects you to, but here’s a decoder ring
for some things. It’s also instructive in that we can see where each
system shines or falls short.
|Feature|WFP|iptables|
|Filter organization|Layers|Tables and chains|
|Rule coexistence|Sublayers|No direct analog. Sub-chains, sort-of|
|Rule ordering|Relative weight|Explicit ordering|
|Connection-oriented processing|ALE layers|`-m state --state NEW`|
|Allowing traffic|**Permit** action|`-j ACCEPT`|
|Blocking traffic|**Block** action|`-j REJECT`|
|Custom actions|WFP callouts|Packet mangling|
|Advanced processing|WFP callouts|Send to userspace process|
|Advanced matching|Built-in|Extension match modules|
The main thing that has no analog in the Linux world is sublayers, and
how verdicts flow from sublayers out. In this respect, in Windows we
get a feature that many firewall-altering Linux programs try to
emulate by adding sub-chains, and occasionally by fighting for the
first position in chains to ensure that nothing else can mess with
their traffic.
On the flip side, Linux offers a lot more packet mangling and advanced
processing capabilities out of the box, via iptables extensions. WFP
has a mechanism for this called “callouts”, which let filtering rules
invoke a function that’s been registered with the filtering
framework.
However, there are far fewer callouts available by default, and
implementing new ones requires writing a kernel driver. Combined with
the absence of a mechanism to kick packets up to userspace for
processing, that means the Windows firewall is harder to innovate
with.
With that said, out of the box WFP’s ALE layers offer vastly more
information about a connection than iptables does. Most usefully, you
can match on the ID of the application that is receiving or making a
connection, making it trivial to express rules like “tailscale.exe can
dial out,” something Linux still cannot do well (although you can
somewhat emulate this with user and group matches).
#### Conclusion
The WFP framework is a very interesting take on network
firewalling. We hope we’ve given you a taste of what it can do, and
how to bend it to your will when writing your own software.
Tailscale is using the [`inet.af/wf`](https://pkg.go.dev/inet.af/wf) package in our Windows
client to control the firewall at this point, although the API is
still subject to change. Contributions for missing features or bugs
are most welcome [over on GitHub](https://github.com/inetaf/wf/)!
Share
Author
David Anderson
Author
David Anderson
Share
Loading...
## Try Tailscale for free
[
Get started
](https://login.tailscale.com/start)
Schedule a demo
[
Contact sales
](/contact/sales)