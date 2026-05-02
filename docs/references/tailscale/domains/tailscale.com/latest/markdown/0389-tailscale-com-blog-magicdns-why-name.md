Understanding Tailscale DNS and the Magic Behind MagicDNS
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|October 28, 2022
# An epic treatise on DNS, magical and otherwise
Naming products is hard. One of Tailscale’s key features, MagicDNS, has long
been a source of armchair grammar controversy. To wit: Some people think we
should call it Magic DNS because Apple calls their flagship keyboard and mouse
the Magic Keyboard and the Magic Mouse.
But have you noticed that Apple also calls their laptops MacBooks and their
wireless headphones AirPods? The reason they do this is because of an obscure
(and nerdy) rule of the English language that says if removing the adjective
from a noun phrase would change the meaning of the noun, you can remove the
space and make it a compound word. A Magic Keyboard without the magic is still a
keyboard. A MacBook without the Mac is not a book. MagicDNS is one word because
without the magic, it wouldn’t just be DNS; it wouldn’t be anything. Tailscale
already has DNS and split DNS (two words!) configurations; but MagicDNS isn’t
just DNS, it’s something different.
\<**Xe**\> They also can do this for trademark reasons! It’s easier to get trademark status
on non-generic words than it is for things like “bread,” “keyboard,” “book,” or
“pods.”
\<**Avery**\> On the other hand, to avoid the trademark minefield, sometimes big companies
name products in the form \<Trademark\> \<Generic\>, like Microsoft Word
or Google Mail. If a product name contains your company name, you can be pretty
confident nobody else called their product that.
Tailscale lets you [manage your machine’s DNS
configuration](/kb/1054/dns/). This lets you set what DNS
servers machines should prefer for either the entire internet or anything
matching a specific domain (split DNS). This is neat, and it makes local DNS
configuration work more like people often expect it to when they optimistically
add multiple DNS resolvers to `/etc/resolv.conf`.
But that’s not MagicDNS — that’s just DNS a little bit better. MagicDNS builds
*on top* of these features. It makes DNS safe for new use cases by totally
flipping around how name resolution works. It’s a building block that Tailscale
and your infrastructure can build on top of.
Today we’re going to take a look at the problem space of DNS, how complexity has
been layered on over the years, and how MagicDNS cuts through all that
complexity and makes everything more reliable in the process.
## The tragedy of DNS: naming things, but with cache invalidation
DNS is one of those services that sounds simple. It’s a mapping of names to
numbers, right? Yet it’s one of the more complicated things underlying the
modern internet. It predates the modern internet, but let’s not get into that
today.
A diagram explaining how DNS works. The laptop asks the DNS server what the IP address for tailscale.com is and gets back 82.58.46.8.
\<**Xe**\> If you want to learn more about how DNS lookups work in a more visual way, see
[this
explanation](https://www.pingdom.com/blog/a-visual-explanation-of-how-dns-lookups-work/)
by Pingdom. The important takeaway is it’s complicated, and there are many
separate delegation steps, which we’ll discuss more below.
We can think of DNS as the first globally distributed database. DNS is designed
to be globally convergent (read: Over time the entire system will agree what
names point to what IP addresses), so that looking up `google.com` will always
point to the same IP address regardless of whether the request originates in
Ottawa, San Francisco, Seattle, or Palau.
\<**Avery**\> Okay, actually google.com is probably one of the worst examples on the internet,
since they play so many anycast and DNS tricks that you never quite know what IP
address you’re going to get. But for our purposes, let’s imagine that Google
uses DNS like normal people do.
DNS is *globally convergent* because over time, as caches expire, every DNS
server on the internet can eventually agree on the same answers to the same
queries. Every DNS record has a time-to-live (TTL) setting that specifies how
long the answer is valid. Unfortunately, DNS clients and servers may choose to
ignore the suggested time-to-live value and use their own time-to-live instead.
Some ISPs claim to do this in an effort to “reduce network traffic,” but
violating the DNS RFC like this ends up creating subtle problems that are very
hard to debug.
\<**Avery**\> By the way, any kind of polling-based (as opposed to push-based) cache with
static time periods will always have this problem: What cache timeout should you
choose? If you make it too short, you add query latency and overload servers. If
you make it too long, changes take ages (sometimes hours or days!) to propagate.
That’s why intermediaries jump in and try to “fix” the problem by messing with
the TTLs. But they always just end up creating different problems.
This model of one name to one set of IP addresses worked fine when the internet
was only one continent large, and didn’t get rewired very often. But it fails
when you have servers all over the world and you want users to be directed to
the nearest one, or to ignore regions that happen to be down right now. So
operators have pulled DNS servers into their load balancing infrastructure,
pointing users to the closest application servers rather than any kind of One
True Right Answer.
A DNS server providing different answers for two laptops physically located in different areas of the planet. One laptop gets one answer, the other gets another.
That sometimes causes problems with overzealous caching resolvers set up by your
ISP that gives you routers without the ability to use a resolver that actually
follows the specification, or when you use a DNS server hosted elsewhere that
doesn’t get the best localized answer from the load balancer. But overall it
works out more often than not.
\<**Xe**\> Of course this is assuming that your government, ISP, or local cafe Wi-Fi skiddie
isn’t hijacking DNS and up to no good.
As a society, we gave up the rule that every DNS name always maps to the same IP
address everywhere in the world. In practice this mostly doesn’t hurt us, except
when we’re trying to debug it. Then it can be either easy or very hard and make
you want to reconsider your career aspirations and wonder how much it would cost
to get into farming. Cows are [surprisingly
expensive](https://economicdashboard.alberta.ca/livestockprices)!
\<**Xe**\> It is a common misconception to call the way that DNS changes are observed by
people around the world “propagation.” This is technically incorrect. Most of
what you are waiting for is caches to expire and then for your next request to
get forwarded to upstream DNS servers to have accurate information. This is why
people call DNS “globally convergent”: Over time the entire internet will
gradually converge on a set of answers for what names point to which IP
addresses. However, in practice — considering how the data actually moves around
the internet — it’s not entirely wrong to say that the DNS queries have the
effect of propagating out from the origin DNS server. It’s all a matter of
perspective.
## DNS encryption (it isn’t)
DNS is an unencrypted, unauthenticated protocol. Queries and responses are sent
over plain text on the internet. This means that whoever and whatever can get an
IP address just by sending the right name.
\<**Xe**\> The privacy risks of publishing your private hostnames in public DNS can be
minimized by setting up private DNS servers — often called “split horizon” DNS —
that have a different set of domain name responses than the public internet. You
can wire those through your VPN (such as via the Tailscale admin console in the
DNS section), but then you lose out on the global convergence and caching
features of DNS. In many cases, you can get by with returning private IP ranges
in public DNS servers, but it depends on your level of paranoia. And sometimes
public DNS servers [helpfully reject private IP ranges as a security
feature](https://en.wikipedia.org/wiki/DNS_rebinding), yay.
Because there is no encryption or signing of DNS replies, you are also never
quite sure if the DNS response you got has been tampered with in-flight. An
attacker could easily sniff the wires and race back a packet that points
`google.com` to the IP address of `badgooglephish.com`. Your iPhone would be
none the wiser. There is a set of extensions called
[DNSSEC](https://www.cloudflare.com/en-ca/dns/dnssec/how-dnssec-works/) that
tries to fix a lot of these problems using fun cryptography that I’m nowhere
near qualified to explain, but this is where the warts really reveal themselves.
Slack recently had [a pretty terrible production
outage](https://slack.engineering/what-happened-during-slacks-dnssec-rollout/)
that was wholly traceable to trying to enable DNSSEC support, apparently for
FedRAMP compliance reasons.
A DNS server being hijacked, showing that the hijacker can mess with DNS results.
\<**Avery**\> DNSSEC is not as good as it sounds. [@tqbf](https://twitter.com/tqbf) has a
detailed rant called [Against
DNSSEC](https://sockpuppet.org/blog/2015/01/15/against-dnssec/) that
systematically refutes every reason you might have for using DNSSEC. Except
FedRAMP, I guess.
DNSSEC doesn’t look like it will ever be widespread. So in that vacuum, there
are some new protocols that at least carry (part of) DNS over an encrypted
channel. But as part of that process, your machine typically creates an HTTPS
session to Google, Cloudflare, or whomever else. That intermediary will be able
to see (and, in theory, be able to tamper with) the DNS requests and responses
in plain text. Depending on your threat profile, that may not solve all your
security and privacy concerns.
\<**Xe**\> There are new projects like [GNS](https://www.gnunet.org/en/gns.html) that
enable end-to-end request privacy, but they have other disadvantages and aren’t
very widely deployed. It’s great for the people who use it, but most people
don’t use it.
So in normal deployments, DNS has no in-flight encryption, veracity, or
authentication mechanisms. This also means that there’s no way to tell if a
client is authorized to access a given DNS record or not. There is no native way
to establish an identity associated with a DNS request. This means that updating
DNS records (for example, for [dynamic
DNS](https://en.wikipedia.org/wiki/Dynamic_DNS)) can’t be done over DNS itself
and instead has to be delegated to some kind of third party, which then uses a
not-standardized API. There are no good APIs to automate DNS modification; there
are only APIs we tolerate because we have no other choice.
\<**Xe**\> There are things like [DNS UPDATE
requests](https://sssd.io/design-pages/active_directory_dns_updates.html) which
do allow you to update DNS records over DNS, but at this point, this is used
almost exclusively in Active Directory with Windows deployments. It also does
not fix the problems with authentication credentials being sent in plain text,
so this is only really usable from within a private corporate network. It’s not
a generally usable building block for the internet.
## Delegation (can be dangerous)
When you register a domain name with a registrar, they create a record that lets
them delegate responsibility for your domain to some other name server under the
authority of a top level domain such as `.com`. (This is just how domain
registration and lookups work.) You could then delegate responsibility for a
subset of that domain name to another third party, who themselves would need to
set it up with their registrar. For example, you register your website
`example.com` with your DNS registrar, and they delegate it to the `.com`
registrar. But, you want to delegate control over a subset of your domain, say
`cdn.example.com`, back to your CDN vendor so they can make whatever changes
they need as soon as possible without having to involve you. Then
`cdn.example.com` will have its own DNS record.
DNS delegation in action. These round-trips are measured in tens to hundreds of milliseconds. Imagine how this can add up.
Most people reading this have probably never heard of delegating sub-subdomains
like this, because in practice it’s so complicated and fragile that it’s rarely
done unless DNS is a core competency of both parties involved. When big
companies do farm out a domain to another company, they usually use an entirely
separate top level domain name such as `googleusercontent.com` or similar,
partly to reduce confusion. This also helps prevent reputational damage if
something at a partner company gets breached and leads to some random person
using a subdomain of `facebook.com` to send out astronomical amounts of spam.
\<**Avery**\> Sub-subdomains have also gone out of fashion because of accidental sharing of
HTTP cookies between trusted parent and untrusted subdomains. Plus, every level
of subdomain delegation in DNS incurs an extra network round trip to do the
recursive name resolution, which increases latency. It ends up being more
trouble than it’s worth.
## Reverse DNS (is another whole DNS)
Then comes the fun with reverse DNS. Reverse DNS translates from IP address back
into a domain name. In email, reverse DNS is still used as part of risk
assessment for spam filtering, because most well-configured email servers have
the forward DNS name match the reverse DNS name. This is also a large part of
how internet service operators can tell whether IP addresses are residential
addresses or not.
\<**Avery**\> Don’t forget about rlogin, the predecessor to SSH! And [TCP
Wrappers](https://en.wikipedia.org/wiki/TCP_Wrappers). In the olden days, we
used to accept or reject connections based purely on the answer from
(unencrypted of course) reverse DNS. We also used to think that [binding to
ports less than 1024 was more
secure](https://www.staldal.nu/tech/2007/10/31/why-can-only-root-listen-to-ports-below-1024/).
Network security has come a long way!
It used to be that every company had a whole IPv4 subnet delegated to them, so
they also owned their own reverse DNS domain. When the Internet Fairy gave your
company an IP address block, it fell into one of three classes:
* Class A: a `/8` network with 16 million addresses
* Class B: a `/16` network with 65 thousand addresses
* Class C: a `/24` network with 256 addresses
These classes are not used anymore, but you can see the vestigial remains of them
in the way reverse DNS is implemented.
IPv4 addresses are 32 bit numbers that are commonly written as a series of
eight-bit numbers separated by full stops. Consider this address:
```
`82.58.46.8
`
```
This used to denote a strict hierarchy from the root of the internet to the
owner of the `82.0.0.0/8` block, the owner of the `82.58.0.0/16` block, and
finally the owner of the `82.58.46.0/24` block. This same hierarchy is used with
DNS delegation to distribute the ownership of reverse DNS names. In order to
delegate this out, you have to reverse the IP address like this:
Reverse DNS reversing the order of the octets of an IP address.
This is the core of how reverse DNS lookups work and why we’re calling it
another whole DNS. It’s the same semantics as DNS, but backwards. It’s a lot of
fun to implement.
\<**Xe**\>
Tailscale *does* implement reverse DNS lookups in MagicDNS. However, Tailscale
doesn’t use one of those old classful addresses. We use `100.64.0.0/10`, which
is two bits smaller than a `/8`. This conflicts with the ways subnet delegation
works because it only does 8-bit jumps. To work around this, we set a bunch of
reverse DNS routes. You can see them by running `resolvectl` on a machine
running Tailscale and systemd or `scutil --dns` on a Mac running Tailscale.
Here’s the output of my developer machine:
```
`DNS Domain:
telethia-pirhanax.ts.net example.com.beta.tailscale.net
\~0.e.1.a.c.5.1.1.a.7.d.f.ip6.arpa \~100.100.in-addr.arpa \~101.100.in-addr.arpa \~102.100.in-addr.arpa
\~103.100.in-addr.arpa \~104.100.in-addr.arpa \~105.100.in-addr.arpa \~106.100.in-addr.arpa
\~107.100.in-addr.arpa \~108.100.in-addr.arpa \~109.100.in-addr.arpa \~110.100.in-addr.arpa
\~111.100.in-addr.arpa \~112.100.in-addr.arpa \~113.100.in-addr.arpa \~114.100.in-addr.arpa
\~115.100.in-addr.arpa \~116.100.in-addr.arpa \~117.100.in-addr.arpa \~118.100.in-addr.arpa
\~119.100.in-addr.arpa \~120.100.in-addr.arpa \~121.100.in-addr.arpa \~122.100.in-addr.arpa
\~123.100.in-addr.arpa \~124.100.in-addr.arpa \~125.100.in-addr.arpa \~126.100.in-addr.arpa
\~127.100.in-addr.arpa \~64.100.in-addr.arpa \~65.100.in-addr.arpa \~66.100.in-addr.arpa
\~67.100.in-addr.arpa \~68.100.in-addr.arpa \~69.100.in-addr.arpa \~70.100.in-addr.arpa
\~71.100.in-addr.arpa \~72.100.in-addr.arpa \~73.100.in-addr.arpa \~74.100.in-addr.arpa
\~75.100.in-addr.arpa \~76.100.in-addr.arpa \~77.100.in-addr.arpa \~78.100.in-addr.arpa
\~79.100.in-addr.arpa \~80.100.in-addr.arpa \~81.100.in-addr.arpa \~82.100.in-addr.arpa
\~83.100.in-addr.arpa \~84.100.in-addr.arpa \~85.100.in-addr.arpa \~86.100.in-addr.arpa
\~87.100.in-addr.arpa \~88.100.in-addr.arpa \~89.100.in-addr.arpa \~90.100.in-addr.arpa
\~91.100.in-addr.arpa \~92.100.in-addr.arpa \~93.100.in-addr.arpa \~94.100.in-addr.arpa
\~95.100.in-addr.arpa \~96.100.in-addr.arpa \~97.100.in-addr.arpa \~98.100.in-addr.arpa
\~99.100.in-addr.arpa
`
```
But nowadays, with IP addresses
being scarce and frequently reallocated, the reverse DNS domain for a set of IPs
is usually owned by your cloud provider, not you. So providing “correct” reverse
DNS answers requires a lot of coordination that many people do not want to
bother with.
\<**Avery**\> And don’t forget, with the [HTTP Host:
header](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Host) and [TLS
SNI](https://en.wikipedia.org/wiki/Server_Name_Indication), a single IP address
can have many names! With forward DNS that’s no problem: You just set up
multiple DNS names that translate to the same IP. But with reverse DNS, every IP
can only translate back to a single name. It doesn’t work well on the modern
internet.
\<**Xe**\> There were a sizable number of people who would go through all that pain to have
an amusing reverse DNS name visible on IRC to show up as something like
`gimme-your.nickserv.pw` or something else equally amusing. This is a dying art
form as IRC slowly fades from public consciousness.
## It’s always DNS
All of this doesn’t even begin to cover DNS client configuration on every device
and OS. DNS client configuration is unique for every platform and can range from
trivial to Sisyphean, [depending on which platform you use and how many people
have had opinions about how this should be configured in the
past](/blog/sisyphean-dns-client-linux/).
Most of the time you hopefully don’t have to care about it. The next big bucket
is when you do have to care, and there’s an OS native API for it. The last
bucket is when you have to dynamically figure out what is going on with the OS
on the fly and then piece everything together to make things Just Work™️ like
people expect it to.
All of this madness is why, when you see a big website go down, it’s often
because *everything* is down because the DNS servers fell over again. When your
private internal network is acting weird or slow, it’s often a local DNS failure
(or old cached values, or mismatched DNS configuration between nodes, or tidal
forces affecting undersea fiber optic cables due to the literal phase of the
moon).
DNS has led to many memes, artistic creations, and philosophical documents about
the nature of downtime, such as the following:
## MagicDNS is DNS, but different
MagicDNS uses DNS as its query protocol, so you might think it would have all
the same flaws. But in MagicDNS, the equation is totally flipped.
In Tailscale, the coordination service has a list of everything on your tailnet.
You have end-to-end encryption, so you can generally trust that a machine owned
by a person is actually being used by that person, and packets coming from that
machine are related to that person. You only have access to machines that you
have permission to see with Tailscale’s cryptographically enforced ACLs. User
authentication is done by your identity provider, which prevents entire classes
of attacks. All that together makes the network layer secure —
\<**Avery**\> …like we used to pretend it was back in the days of rlogin and TCP Wrappers!
— yes, like in the old days. But then, once the network is secure, we can build
more cool mechanisms on top.
MagicDNS sets up a relatively rare feature of DNS client configuration called
[search domains](https://superuser.com/a/184366). This allows you to connect to
individual machines in your tailnet by simple hostname instead of by IP address
or fully qualified domain name. If your main staging server is named `pandoria`,
you can connect to `pandoria` directly instead of to the fully qualified domain
name `pandoria.example.com.beta.tailscale.net` (or if you have [HTTPS
configured](/kb/1153/enabling-https/),
`pandoria.telethia-pirhanax.ts.net`). This makes it easier to connect to
machines you care about without all that extra typing. You don’t need to set up
SSH aliases, you just `ssh pandoria` and you’re in.
MagicDNS automatically uses a device’s [machine name](/kb/1098/machine-names) as
part of the DNS entry. If you change your device’s name, the MagicDNS entry will
automatically change. If you have a specific name you’d like to use to reference
your device, then you can [edit the machine
name](/kb/1098/machine-names/#renaming-a-machine).
MagicDNS is fed by Tailscale’s control server, so the requests never need to leave your machine.
### Every machine is its own DNS server
One of the big reliability downsides of classic DNS is that if a DNS server goes
down, clients can’t look up hosts on that DNS server anymore, unless the names
are cached. Then, when the caches expire, everything runs into even more issues.
This turns small outages into big ones that get you on the front page of CNN and
Reddit.
MagicDNS fixes this by running the MagicDNS server locally, on every machine on
your tailnet, at the virtual address `100.100.100.100`. The DNS server can’t go
down. It can’t fall over from load (unless your own machine also does), and when
your machine does fall over for some reason every other machine is unaffected.
Because MagicDNS always runs locally, you don’t even need to trust end-to-end
encryption: MagicDNS traffic never leaves your machine. It’s a virtual service
on a virtual network.
If your browser asks for pandoria without a top level domain attached, the OS could try any number of these domains in order to get something working.
\<**Xe**\> You don’t have to worry about the DNS server going down when the DNS server is
running on every machine in your network! If your device’s DNS is down, it’s
because your own device doesn’t work — and then you have bigger problems.
Hopefully not problems with fire. Fire is never good for computers.
MagicDNS uses delegation for Tailscale-specific DNS names, but all the
delegation happens internally on your own box, which means delegation latency is
effectively zero, and you can’t configure it wrong.
MagicDNS never needs to worry about authorizing updates or tampering: Updates
come from a secure channel through the control plane.
In MagicDNS, reverse DNS works by default, because every Tailscale machine gets
its own unique private IP, and MagicDNS handles the reverse DNS domain for that
subnet.
MagicDNS doesn’t suffer from latency issues. The latency is as low as your
device allows for sending packets to localhost.
MagicDNS records are always on your device, so you never need to wait for a DNS server to reply.
### Transparently upgrading your OS’ capabilities
Because Tailscale runs a local DNS server on every machine, MagicDNS can
normalize and upgrade the DNS capabilities of every machine on your tailnet.
For example, MagicDNS can [transparently upgrade as many DNS queries as possible
to DNS-over-HTTPS](/blog/2021-09-private-dns-with-magicdns/) so that DNS
requests to the outside world can’t be tampered with or sniffed in-flight. This
doesn’t protect you against Google, Cloudflare, Quad9, or any other
DNS-over-HTTPS provider being technically capable of viewing every DNS
query you make, but it should protect your non-MagicDNS queries from your ISP or
a local script kiddie on a coffee shop Wi-Fi network. And this works even if a
machine’s underlying OS is too old to support DNS-over-HTTPS, such as Windows 7.
\<**Xe**\> Yes, we do support Windows 7!
This local DNS server can also delegate subdomains if you create a [split
DNS](/kb/1054/dns/) route, even if your OS doesn’t support that natively. When
you [configure split DNS](/kb/1054/dns) in the admin console, these routes will
automatically be pushed out to all devices in your tailnet, and allow you to
route traffic as you want to any subdomains or virtual top-level domains. For
example, you can also use this to access AWS VPC domain names from your non-AWS
Tailscale nodes. Even on Windows 7.
## Push-based cache invalidation
As the cherry on top, MagicDNS fixes the cache invalidation problem completely
because our control plane pushes updates immediately to every device, where DNS
would periodically poll for changes. And because it runs on your device
directly, we eliminate the possibility of middleboxes messing up the caching
parameters. This means you can trust your internal DNS to always be up to date
right now, and never have to worry about configuring another internal DNS TTL.
\<**Avery**\> It also means that MagicDNS can be used as a service discovery tool. Push your
code to a server named `git`. Share text at `http://pastebin`. There are entire
startups doing new service discovery mechanisms that are mainly working around
the limitations of DNS. We’ve been trained not to trust DNS for service
discovery, but it was never the DNS protocol that was the problem. It was
caching, latency, and polling.
## The details are invisible
Some may be tempted to say things like, “Oh, this is just a dynamic DNS server.
I could implement this all in a weekend with at least half of the code these
chuckleheads wrote.” But without running the DNS server on every machine like
MagicDNS does, update latency becomes an issue again. Security and cache
invalidation become issues again. The uptime and load of the DNS server become
an issue. It becomes a point of failure, not a point of resilience.
Regular DNS, over the decades, has evolved toward being a single point of
failure, even when you balance the load. We haven’t fixed the design flaws in
DNS for nearly 40 years, and we are not likely to fix those issues for the next
40 years, either. MagicDNS addresses the key issues in surprising depth, with
surprisingly little code.
So that’s why we call it MagicDNS: Because without the magic, it’s not just DNS.
MagicDNS is built on totally different fundamentals that eliminate most of DNS’s
problems. Just like magic.
Share
Authors
Xe Iaso
Avery Pennarun
Authors
Xe Iaso
Avery Pennarun
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