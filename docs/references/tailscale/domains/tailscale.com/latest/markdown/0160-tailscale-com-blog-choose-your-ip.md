Customize Tailscale Node IPs for Better Network Management
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|December 07, 2023
# Choose your own IP
Tailscale assigns every one of your nodes a private IPv4 address. We do this from the [CGNAT range](/kb/1015/100.x-addresses/),
which is typically used by ISPs that have run out of public IPv4 addresses. Starting today, you have control over what
IP address from that range is assigned to your nodes. This gives you the ability to decide what subset of the CGNAT
range your tailnet uses to avoid conflicts with other applications.
## Globally unique to locally unique
In the early days of Tailscale we decided to allocate every node a unique IP address within the Tailscale universe. This
was particularly handy for [node sharing](/kb/1084/sharing/), when you let someone from another tailnet access a node in
your tailnet, they got to see it as the same CGNAT address. It also met our needs when we were an early-stage startup;
the CGNAT `100.64.0.0/10` range has some four million IP addresses, plenty for an experimental project that may or may
not be interesting to users. It turns out people like to use Tailscale and we are running out of IPs.
We had a few options — we could add other private IP address ranges to the CGNAT space we allocate, but this would have
at best been a stopgap. Or, we could have required all users to use IPv6 addresses, as we already also allocate nodes
and addresses from the much larger pool of IPv6 ULA addresses. We all know how well IPv6 adoption has gone — this would
have broken legacy software our customers use that does not support IPv6. Rather, we decided to no longer allocate
globally unique CGNAT addresses, and allow the reuse of CGNAT addresses in different tailnets.
It also gives us the flexibility to allow enterprises to limit the range of CGNAT IP addresses that get allocated to
their tailnets, for compatibility with other systems that allocate from parts of the CGNAT range.
## Jump into your own pool
Along with flexible addressing, we are launching a beta feature to let you define the [IP pool](/kb/1304/ip-pool/) that
your nodes are assigned from the CGNAT range. This is done as part of your tailnet policy:
```
` {
"acls": ["..."],
"nodeAttrs": [
{
"target": ["autogroup:admin"],
"ipPool": ["100.81.0.0/16"],
},
{
"target": ["group:dev"],
"ipPool": ["100.85.0.0/16"],
},
],
}
`
```
With this [node attribute](/kb/1337/acl-syntax#node-attributes-nodeattrs) set, all new nodes managed by admins in your tailnet will be
assigned an IP from the range: `100.81.0.0/16`, whereas nodes managed by members of `group:dev` will be assigned an IP
from a subset from the range: `100.85.0.0/16`.
## Change IP of existing nodes
Before these changes, IPv4 addresses were immutable. With locally unique IPv4, however, you can change the address for any node in your tailnet in a couple clicks, even nodes that have been shared to you!
## NATural solutions
Address reuse causes no issue in the common case of a perfectly private tailnet, but if not implemented carefully, it
could wreak havoc with node sharing. If I try to share my node `100.65.1.1` with you, and you already have a node
numbered `100.65.1.1`, where do your packets go?
To address this (no pun intended), we assign shared nodes a new IP address from the tailnet it is shared into. Each
Tailscale node collects a new IP address for each share. Assigning multiple addresses to an interface causes a lot of UX
pain with some software, so instead nodes in the shared-to tailnet 1-1 NAT packets destined for the shared node, right
before they flow into the WireGuard tunnel.
This means the tailnet of the shared node never has to be aware of the IP addresses assigned to it in other tailnets,
which greatly simplifies accounting.
Now, each tailnet can have up to four million nodes with IPv4 addresses. If you are the sort of enterprise that needs
more than that, let’s chat.
One thing you can rely on with IPv4: whatever the problem, Network Address Translation is part of the solution.
Share
Author
Maisem Ali
Author
Maisem Ali
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