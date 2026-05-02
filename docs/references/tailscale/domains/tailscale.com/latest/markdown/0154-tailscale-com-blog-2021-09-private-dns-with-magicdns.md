Secure Your Network with Tailscale DNS and MagicDNS
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|September 10, 2021
# Private DNS with MagicDNS
One of Tailscale’s features is called [MagicDNS](/kb/1081/magicdns/). Its main visible
feature is that it lets you access all the nodes on your tailnet by
their names instead of the Tailscale IPs.
That may not sound particularly new; after all, DNS maps names to
numbers. Systems like
[mDNS](https://en.wikipedia.org/wiki/Multicast_DNS) even do it
automatically. What is interesting about MagicDNS is how it can do so
securely, without name lookup information leaving your device, and how
it can upgrade the security of non-Tailscale DNS queries.
### The current state of DNS security
But first, why are we concerned about DNS security at all? What does
that even mean? Why would it be insecure?
It all dates back to the early days of the Internet (back when it was
capitalized) when people largely trusted each other, or at least
didn’t know better to not trust each other. Maybe they were more
focused on getting computers talking at all rather than worrying about
security.
In any case, early DNS was not encrypted or authenticated. Anybody on
your network or along its path could see your DNS queries or modify
their responses. You might think today’s internet has since fixed all
that insecurity and DNS is secure now. And you would be wrong. Change
takes time, especially when it comes to changing big moving Rube
Goldberg machines like the internet.
But there’s been progress.
A reductive history of DNS through the ages, so you don’t need to read
a few dozen RFCs:
* **DNS over UDP**: the classic. Hope they get it! Hope nobody
modifies it! Hope nobody’s spying on you!
* **DNS over TCP**: slower but more reliable. Just as easy to spy on,
marginally but not really harder to tamper with.
* **DNSSEC**: maybe we could put keys in DNS and then sign things?
This has been [dragging on for
ages](https://stats.labs.apnic.net/dnssec), kinda like IPv6. It’s
also [not exactly loved](https://cr.yp.to/talks/2016.12.08/slides-djb-20161208-dnssec-a4.pdf)
by everybody. DNSSEC does have some merits,
but it’s largely outside the scope of this post. For our purposes,
the security we care about is the confidentiality and integrity of
DNS traffic from your Tailscale devices and your resolver.
* **DoT**: DNS over TLS over TCP. Put some TLS on it. Now people can’t
spy on traffic between your DNS client and your resolver.
* **DoH**: DNS over HTTP over TLS over TCP (or over QUIC, a blend of
all those protocols) This is like DoT but with some HTTP smeared
in the protocol sandwich. Everybody loves HTTP.
Ignoring DNSSEC:
||UDP DNS|TCP DNS|DoT|DoH|
|**Transport**|UDP|TCP|TCP|TCP or QUIC (UDP)|
|**Cold start round-trips**|1|3-4|1-2 more|Same as DoT; better with QUIC|
|**Security**|-|-|TLS|TLS|
|**HTTP?**|-|-|-|yes|
|**Client/OS support**|everything|nearly everything|minimal|browsers, the new OSes|
### How MagicDNS works in Tailscale
Tailscale runs a DNS server built-in on every node, running at
`100.100.100.100`.
Yes, Tailscale on your phone includes a DNS server. (We admit that
“even on your phone!” is a little silly when phones are basically
supercomputers these days.)
The IP `100.100.100.100`, usually pronounced “quad one hundred,” is part
of the [private Carrier-Grade NAT
range](/kb/1015/100.x-addresses/). That means,
just like IPs in the common private ranges, `192.168.1/24`, `172.16/12`,
and `10/8`, it is not routable on the public internet. So when software
on your computer sends a traditional, unencrypted UDP packet to
`100.100.100.100`, no standard router will send it anyway.
We then tell your OS that its DNS server is `100.100.100.100`. Because
operating system DNS clients are largely stuck in 1987, they then
forward all their DNS queries over old-school insecure UDP DNS to
`100.100.100.100`. Tailscale also installs a route to `100.100.100.100/32`
back into Tailscale and it then hands those packets over to
Tailscale’s built-in DNS server, so unencrypted queries don’t leave
your device.
### Push, not pull
Now it is time for MagicDNS to answer queries. For resolving public
domains (e.g. “wikipedia.org”) the local Tailscale process will
forward the query onto whatever name server your OS was originally
configured with, or whatever name server you override it within your
Tailscale admin settings. For looking up private names on your
tailnet: the query goes nowhere! Instead, when your local Tailscale is
configured with a map of your tailnet, it is pushed all of the private
DNS names your computer has access to. In addition to there being no
external service that can log your private name lookups, there is an
extra benefit to a push-based DNS database for small networks (where
“small” means “not billions”): no TTL.
In standard DNS, every query response includes a Time To Live
(TTL). Your local computer, and other, usually helpful, intermediaries
like your local network router will store a copy of a query response
for however long the TTL says it can. Your subsequent queries look in
the stored cache and if the record has not expired yet, no new lookup
is done.
That is great for saving bandwidth and more importantly, latency when
you use a program that makes many separate connections to the same
destination. But it has a downside: if you change your DNS records for
a domain, they don’t propagate completely until the TTL has expired in
all the cached resolvers around the internet. That is fine for large
public sites, there are several workarounds engineers use to change
records slowly without breaking anyone. But it can be extremely
annoying when configuring and reconfiguring your own personal
network. We want to see changes immediately. That is a benefit to the
push-based approach: as soon as you change your tailnet, by adding a
host or editing a name, the new network map is immediately sent to
every computer in your tailnet and the new name is there ready to
go. No need to think about caching resolvers in home internet routers.
### Key Features of MagicDNS in Tailscale
Once the MagicDNS resolver has the queries, we can do fun things:
* We can answer things directly, so you can `ssh pi@dogcam` and get to
your device `dogcam` by name, rather than remembering `ssh pi@100.127.2.95`. The latency on such queries is great, too, since
we never need to go get the results from the internet; they’re all
in memory.
* We can race DNS answers from different upstreams servers (when
appropriate).
* If your upstream DNS (or one of your upstream DNS servers) is a
Tailscale IP or behind a Tailscale subnet router, we can forward
plain old UDP DNS over Tailscale so they’re encrypted with WireGuard
* If your upstream DNS supports DoH, the MagicDNS forwarder can then
be a DoH client to query Cloudflare `1.1.1.1`, Google Public DNS
`8.8.8.8`, or Quad9 `9.9.9.9`, without anybody able to see or mess with
your traffic.
### Future work
MagicDNS is still in beta because we’re not entirely done with all the
features we’d like to add and fixing the long tail of OS integrations
([it can be a nightmare](/blog/sisyphean-dns-client-linux/)).
Some of the features we’re exciting about adding:
* Relaying DNS queries over Tailscale through [Exit
Nodes](/kb/1103/exit-nodes/), when you’re using an exit node.
* Letting you add extra, custom records into your tailnet that all
clients then answer directly, without forwarding.
* Arbitrary DoT and DoH client support to hit arbitrary upstream
resolvers. (Currently we just hardcode the most used ones)
### Try it out
To enable MagicDNS, go to the DNS settings of the admin console at
[https://login.tailscale.com/admin/dns](https://login.tailscale.com/admin/dns) and click “Enable MagicDNS”.
If you’re using split DNS, the built-in `100.100.100.100` MagicDNS
resolver won’t be used unless it’s needed to resolve a name in your
tailnet. To force your clients to use DoH for their upstream queries,
you can click *“Override local DNS”* and set a global nameserver to
Google (`8.8.8.8`), Cloudflare (`1.1.1.1`), or Quad9 (`9.9.9.9`) IPs.
Individual devices can opt-out of the tailnet-wide DNS settings by
opening the Tailscale app and unchecking *“Use Tailscale DNS
Settings”* under *“Preferences”* or using the `tailscale up --accept-dns=false` option on the CLI.
Your nodes are assigned automatic DNS names based on their hostnames,
adding numeric suffixes as needed to resolve conflicts. To change
their DNS names, go to the [machines
page](https://login.tailscale.com/admin/machines) in the admin console,
click the three dots on the right of a device to rename, and choose
*“Edit machine name…”*
Share
Authors
Brad Fitzpatrick
David Crawshaw
Authors
Brad Fitzpatrick
David Crawshaw
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