IPv4 vs. IPv6 FAQ · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# IPv4 vs. IPv6 FAQ
Last validated: Jan 5, 2026
This topic attempts to resolve some of the
most common misconceptions around IPv6.
## [What is IPv6?](#what-is-ipv6)
IPv6 is the next generation of the Internet Protocol (IP), the successor to IPv4.
According to the [history topic on ARIN](https://www.arin.net/resources/guide/ipv6/history), IPv6 design began in the mid-1990s and the first IPv6 draft standard was published in 1998. The first public IPv6 address assignments were made in 1999, officially beginning the rollout process.
IPv6 has several advantages, including a much larger address space. IPv4
had only 232 addresses, less than one per person on earth. IPv6
has 2128 addresses, an immensely larger number which is not
expected ever to be exhausted. Estimates are that this is enough to assign
100 IPv6 addresses to every atom on earth.
IPv6 also has a header that is easier for machines to parse;
a more straightforward extensibility mechanism; and a more carefully
considered approach to multicast, based on decades of experience with IPv4.
On the other hand, IPv6's main disadvantages are additional complexity compared to IPv4, longer
addresses that are hard to memorize, and an
unfortunately slow rollout process that has still not completed, more than
20 years later.
Our CEO has written blog posts about [design goals of IPv6](https://apenwarr.ca/log/20170810)
and [attitudes reflected in IPv4 and IPv6](/blog/two-internets-both-flakey).
## [Is IPv6 faster than IPv4?](#is-ipv6-faster-than-ipv4)
Most of the time, the performance difference is not noticeable.
Still, several factors can create perceived or measured differences in speed between IPv4 and IPv6:
* Performance penalties incurred by [NAT traversal](/blog/how-nat-traversal-works);
* Performance penalties due to MTU and packet sizes;
* Differences in global route optimization between IPv4 and IPv6.
Despite persistent rumors to the contrary, NATs usually have no measurable impact on performance, neither in throughput nor latency. Modern router hardware, even consumer router hardware, can NAT at the line speed of your network. If someone tells you otherwise, we encourage you to benchmark it yourself.
The minimum IPv6 header size (40) is 20 bytes longer than the minimum IPv4 header size (20). Given that the typical network maximum transmission unit (MTU) is 1500, this means IPv6 incurs a 20/1500 = 1.3% throughput slowdown compared to IPv4 on the same network. Such a difference is smaller than the random variation you usually notice in a network speed test, so it can be hard to measure in a benchmark.
The biggest and most measurable performance differences between IPv4 and IPv6 are in route optimization. Internet Service Providers (ISPs) peer with other ISPs in the world to deliver your packets. Because of the way routing works, their IPv4 and IPv6 networks can end up routed completely differently, through different cables, countries, or even continents.
Empirically, some ISPs route IPv4 more efficiently and some route IPv6 more
efficiently. You may find that one protocol or the other is faster depending
which remote ISP you're talking to. Since there is no way to be sure which
path will be consistently better, a heuristic called [Happy Eyeballs](https://en.wikipedia.org/wiki/Happy_Eyeballs) (yes, really) is
used by some software to automatically choose the "better" of the two for
each connection attempt.
To try to encourage migration from IPv4 to IPv6, [Happy Eyeballs (RFC6555)](https://www.rfc-editor.org/rfc/rfc6555.html) and [Happy Eyeballs v2 (RFC8305)](https://www.rfc-editor.org/rfc/rfc8305.html)
recommend preferring IPv6 to IPv4 unless it is much slower, although
implementations vary. The decision may be partly based on DNS response time.
## [Does IPv6 have built-in IPsec encryption for all connections?](#does-ipv6-have-built-in-ipsec-encryption-for-all-connections)
We occasionally notice a rumor that every IPv6 connection is encrypted automatically. This is not true.
It is true that IPsec encryption was designed at the same time as IPv6, and is considered part of the "complete" IPv6
standard. However, IPsec is optional in IPv6 and is almost never used, except for VPN tunnels, just like in IPv4.
The IPsec design included a concept of "opportunistic encryption," which would try to figure out if an endpoint supported IPsec, and switch to an encrypted mode automatically when available. Unfortunately, this never worked; it quickly became obvious that attackers could easily confuse an IPv6 endpoint into thinking its peer was not IPsec capable, so this feature only provided
a dangerous illusion of security. (This is called a [downgrade attack](https://en.wikipedia.org/wiki/Downgrade_attack). In fairness, this type of attack was not well understood in 1998.)
## [Is IPv6 a failure?](#is-ipv6-a-failure)
This is a difficult question to answer. Opinions differ dramatically among network engineers.
Factually, it is safe to say that IPv6 met many of its design goals, but has not been rolled out as quickly or as fully as expected.
IPv6 has also not replaced IPv4, which its designers anticipated it would do. (This seemed like a reasonable expectation at the time. Remember that IPv4 had quickly replaced all previous versions of TCP/IP and its predecessor protocol suites.)
That said, the rollout continues. IPv6 is already a better choice than IPv4 in several important scenarios.
## [Why isn't IPv6 more popular?](#why-isnt-ipv6-more-popular)
This is also a matter of opinion. If you ask around the internet for answers, you will find several candidates: politics, capitalism, fear of change, and an arguably overly complex design.
At Tailscale we believe the main reason for the slow IPv6 rollout is that it simply has not been able to provide enough direct value, when deployed as a hybrid in parallel with IPv4. The intention was to deploy IPv6, then retire IPv4 completely, in which case IPv6 would have made the internet overall simpler and cheaper to manage, which is a big benefit. Unfortunately, this value doesn't materialize until the very end, after IPv6 has been fully deployed to billions of devices. This means companies usually will not recoup the costs of IPv6 deployment on a predictable timeline, which makes investment hard.
We have our own ideas for how to help the IPv6 rollout by providing value more quickly.
## [Where has IPv6 seen major success?](#where-has-ipv6-seen-major-success)
The primary purpose of IPv6 was to expand the address space of IPv4. The place where IPv4 address space is most restrictive is on private networks.
[RFC1918](https://www.rfc-editor.org/rfc/rfc1918.html) reserved several IPv4 address ranges specifically for private network use. Unfortunately, the total number of private addresses reserved in this way is a bit less than 18 million. Some modern data centers need more than 18 million addresses just on their own. But separately from that, such a small number of addresses makes it hard to subdivide into separate routing domains. It's also virtually guaranteed that every organization will choose overlapping private addresses (10.0.0.1 anyone?), which works fine until you merge two companies together, or need to connect to a partner's API server on their private network.
IPv6 completely solves this category of problem both for large data centers and for private personal networks. There are so many addresses available that entire subnets can be assigned randomly or algorithmically with almost no chance of an overlap, so it's easy to merge them back together later.
Data center servers are rarely exposed directly to the internet—there is generally some kind of firewall or load balancer in between—so it works fine to use pure-IPv6 internally, and simply remap addresses to IPv4 on the way out of the private network (that is, a form of NAT). This means your data center can be entirely IPv6 even if your customers or ISP only support IPv4.
Unfortunately, personal networks are less likely to rely on private IPv6 addresses, due to now-mostly-outdated concerns about application compatibility. Many users also continue to prefer IPv4 because of its shorter, more memorable addresses.
## [Does IPv6 give me a permanent, static IP address for free?](#does-ipv6-give-me-a-permanent-static-ip-address-for-free)
Unfortunately not. One of the dreams of having such a large address space was that everyone could have not just their own address, but their own subnet of billions of addresses, which would be globally unique and would never need to be renumbered.
This didn't happen, because the IPv6 address(es) assigned to your network depend on how your ISP's routing is set up. If you switch ISPs, or have multiple ISPs, or your ISP reorganizes their network, you will get entirely new IPv6 addresses assigned. This is roughly the same as how consumer address assignments worked on (pre-CGNAT) IPv4.
As with IPv4, you can apply for your own special IPv6 address allocation, and then arrange for global routing of your addresses. This makes you, effectively, an ISP. These allocations cost money and are complex to manage, so most organizations don't bother.
## [Does IPv6 work with mobile IP or multi-homed devices?](#does-ipv6-work-with-mobile-ip-or-multi-homed-devices)
Yes, in the same way as IPv4 does.
Which is to say, not very well. Your IP address changes whenever your device roams around the network. And if your device is multi-homed (is connected to multiple ISPs at once), it will generally need to have one IP address per connection, just as with IPv4.
Since TCP connections generally get interrupted whenever your IP address changes, you'll experience a glitch in connectivity whenever your device moves around. Although [Mobile IP](https://en.wikipedia.org/wiki/Mobile_IP) issues were discussed during IPv6 standardization, no solution was deployed. It was intended that the Mobile IP problem be resolved later, after IPv6 was fully rolled out.
## [Will IPv6 ever be fully rolled out?](#will-ipv6-ever-be-fully-rolled-out)
That depends what you mean by "fully."
It is unlikely that, in our lifetimes, every device in the world will support IPv6. Imagine all the internet-connected light bulbs and virtual MS-DOS machines whose software will never change. Some kind of IPv4 compatibility layer will always be needed.
On the other hand, many devices, especially smartphones, are running IPv6-only even today, and they can talk to any device on the internet, including IPv4-only devices, with the help of NATs and proxies.
Thus, it is possible that someday, every consumer or client-side device will support IPv6. Some ISPs, especially cell phone carriers, are IPv6-only already. Several major ISPs support dual-stack IPv4 and IPv6.
## [Should I support IPv6 on my server?](#should-i-support-ipv6-on-my-server)
You can if you want, but despite what some people will claim, it probably won't make much difference.
As long as any client devices lack support for IPv6, your server will need to support IPv4. In contrast, thanks to NAT, an IPv6-only client device will always be able to connect to an IPv4-only server.
This asymmetry occurs because servers generally must have "public-facing" addresses not behind NATs, while client devices can easily be behind NATs, and a NAT can translate from IPv6 to IPv4 if needed.
In theory, removing the need for NAT to access your server could give a performance improvement. But as mentioned above, NATs generally do not create a noticeable performance impact.
## [What can I do to encourage adoption of IPv6?](#what-can-i-do-to-encourage-adoption-of-ipv6)
Not much. Petitions, letter-writing, and complaining have not been particularly effective despite 20+ years of trying.
Running an IPv6-only server, so that only clients with IPv6 (either pure or with dual-stack IPv4) can reach your server, is a sometimes-proposed method. Unfortunately, no service that has tried this technique has ever become popular enough to apply any real pressure.
One thing you can do is build your new, private networks primarily on IPv6. This helps ensure that applications support IPv6, saves you the trouble of maintaining IPv4 inside your private network, and ensures you are IPv6-ready even if your ISP is not.
## [Are we really out of IPv4 addresses?](#are-we-really-out-of-ipv4-addresses)
Yes. All the IPv4 addresses have been allocated and no more will appear.
However, there is an active market for IPv4 addresses. Recently (in 2021) it was announced that Amazon purchased millions of IP addresses at a cost of about $40 each. The total amount spent sounds spectacular in aggregate, but a single IPv4 address can be stretched very far. Thanks to [TLS SNI](https://en.wikipedia.org/wiki/Server_Name_Indication), load balancers, and NATs, you can share a single address across many devices. At the current price, even small organizations can easily afford to buy or rent hundreds of IPv4 addresses.
What we expect is that more and more IPv4 addresses will be purchased for server use, while more and more client devices will be hidden behind fewer and fewer IPv4 addresses using [CGNAT](https://en.wikipedia.org/wiki/Carrier-grade_NAT).
The price of an IPv4 address will likely continue to rise, encouraging ever-more-complicated hacks and optimizations to conserve them.
## [Does IPv6 make peer-to-peer apps easier?](#does-ipv6-make-peer-to-peer-apps-easier)
Yes. Kind of.
The dream of an IPv6 world where every device can simply connect to every other device, directly, will never materialize. Refer to our blog post, [Absolute scale corrupts absolutely](/blog/absolute-scale), for why this ideal is no longer considered ideal.
In [How NAT traversal works](/blog/how-nat-traversal-works), we discussed various techniques for opening firewall ports so a direct connection can be established between two devices, both behind firewalls or NATs. Because direct, un-firewalled connections are no longer considered desirable, all peer-to-peer connections will need to do such tricks to work, even in an IPv6 world. Luckily though, the tricks are likely to be easier and to have fewer edge cases in an IPv6 world.
On the other hand, you usually cannot assume all your peers support IPv6, and you will not be able to do so for a very long time. That means every app now needs to support *both* IPv4 and IPv6, which creates more effort and frustration, not less. The resulting code is often poorly tested by developers (usually the IPv6 part).
In Tailscale, our goal is for every device on every tailnet to always have an IPv6 address, and be able to reach every other device in the tailnet using an IPv6 address. This means that if you use Tailscale for your peer-to-peer communication, you can write an IPv6-only app and save time. Tailscale will still carry it over IPv4 when needed.
## [Would fully deployed IPv6 eliminate NATs?](#would-fully-deployed-ipv6-eliminate-nats)
It could, but it probably won't.
First of all, as above, IPv4 is unlikely to completely go away, so you will always need some kind of NAT, whether IPv4-to-IPv4 or IPv6-to-IPv4.
Secondly, various kinds of NATs are useful for network management. For example, some Mobile IP proposals involve NATting your packets so they can always appear to come from the same IP, even as your physical location on the network changes. Or, in complex network topologies, you may want packets forwarded through a mesh endpoint to appear as if they came from the mesh endpoint itself, to make it easier to route returning packets.
IPv6 doesn't make it easy to allocate subnets to every device on a LAN; instead, subnets might be delegated to your local router, and then only individual addresses allocated to each device. If one of those devices then wants to route traffic on behalf of other devices (for example, to a sub-subnet behind a router, where the upstream router doesn't cooperate), it will need to use NAT. For example, this is how Tailscale [exit nodes](/docs/features/exit-nodes) work, even with IPv6.
## [Does IPv6 eliminate CGNAT?](#does-ipv6-eliminate-cgnat)
No, not if you still need to access IPv4-only servers. We expect this to be true for the foreseeable future.
If you have an IPv6-only device, your ISP will need to provide CGNAT
gateways to map your traffic to IPv4.
## [Does IPv6 eliminate the problems of double NAT?](#does-ipv6-eliminate-the-problems-of-double-nat)
In general, no. If you might need a NAT, then you might need a double NAT, for all the same reasons as with IPv4.
The "double NAT problem" is often exaggerated. As mentioned above, NATs generally do not measurably affect throughput or latency. The main problem with double NATs is that protocols like UPnP, NAT-PMP, and PCP mostly don't support them. (PCP was created with the intention to support multi-level NAT, but there seem to be no implementations that actually do.) There is no particular reason that has to be true; we hope to find a port-control standard in the future that works with double NATs and CGNATs.
[Modern NAT traversal techniques](/blog/how-nat-traversal-works), such as those used by Tailscale, generally try not to rely on those protocols, so double NATs mostly don't create problems. (There are some apps, particularly some video games, which unfortunately do not use modern NAT traversal techniques.)
## [Do NATs increase security?](#do-nats-increase-security)
Not exactly.
Some people argue that one advantage of a NAT is it makes it hard for an attacker to even address packets to a device hidden behind the NAT firewall. There is not a way to even make a packet addressed to that device, unless a session is already open.
There are some weaknesses to that argument. First, a device really can be attacked, for example, using a man-in-the-middle attack, if a session is already open, since the UDP or TCP sessions themselves are usually not cryptographically secured. That means "[ping of death](https://en.wikipedia.org/wiki/Ping_of_death)" style attacks are possible even through a NAT, although they require more careful timing.
Secondly, a router may be statically configured to forward certain ports back to devices behind the firewall. The NAT provides no protection in that case.
Thirdly, even without a NAT, [stateful firewalls](https://en.wikipedia.org/wiki/Stateful_firewall) usually provide the same level of protection, refusing to allow packets to enter the network except in response to an existing session. Since nearly all networks are nowadays deployed behind stateful firewalls, the fact that IPv6 does not need NAT usually does not make a difference for security.
On the other hand, it is widely agreed that these stateful firewalls are a major security improvement.
## [Do NATs increase privacy?](#do-nats-increase-privacy)
As with security, there are two schools of thought on this topic.
On one side of the issue, people observe that the severely limited number of IPv4 addresses means that many people could be hidden behind a single NAT or (especially) a CGNAT, which makes it difficult to attribute traffic to a particular device.
On the other hand, in IPv6, there are [privacy extensions](<https://labs.ripe.net/author/johanna_ullrich/ipv6-addresses-security-and-privacy/#:~:text=The IPv6 Privacy Extension is,of protection against address correlation.>) that rotate through addresses periodically to try to make it hard to prove your identity. (Not all IPv6 implementations support privacy extensions, unfortunately. This leads some router manufacturers to use NAT instead, to make sure the addresses of all client devices rotate as expected.)
Other people point out that modern tracking technology is much more advanced than just IP addresses. In particular, web-based tracking uses logins, cookies, and [browser fingerprinting](https://pixelprivacy.com/resources/browser-fingerprinting), which are very reliable techniques even in the face of unpredictable IP addresses.
Most privacy specialists would advise that your privacy on the web is very precarious, and you must use privacy-specific technologies such as Tor if you wish to stay completely anonymous. But others argue that, even so, defense in depth makes NATs and privacy extensions still worthwhile.
## [Could a different design have rolled out faster than IPv6?](#could-a-different-design-have-rolled-out-faster-than-ipv6)
Hindsight is 20/20. It's possible to criticize some of the decisions made in IPv6's design and the process of rolling it out, but it's impossible to be sure what would have happened if we had done it differently.
At this point, most people would say that IPv6 could have benefited from a tighter focus (just add more address bits, don't add so many other features) and more backward compatibility with IPv4. But nobody is sure what exactly that would have looked like.
## [What would a backward-compatible address extension to IPv4 look like?](#what-would-a-backward-compatible-address-extension-to-ipv4-look-like)
Is it possible to design an extension to IPv4 that would increase the address space without requiring a full upgrade of the entire internet?
One common suggestion is to "just add more bits to IPv4." Unfortunately, if implemented in the obvious way, the rollout would have had most of the same problems as IPv6. In particular, it would still be incompatible, so it would have to be rolled out in parallel with IPv4, and would have provided little value to anyone until it was fully deployed and old-IPv4 could be retired.
To work around the problem of incompatibility, one suggestion was to use an IPv4 header extension, which would only need to be parsed by endpoint devices, not routers. This would allow individual endpoints to use the new system even before the various routers on the global internet were upgraded. In particular, if designed carefully, this could mean that your ISP could route the new-style packets even without understanding the new-style packets at all. This might have made deployment easier by reducing a three-sided problem (clients, servers, and routers) to a two-sided problem (clients and servers). But getting both clients and servers upgraded in parallel still would have been hard.
(A variant of this proposal is wrapping an IPv6 packet inside of IPv4 as it traverses the internet. Many variants of this were tried and proposed, and they mostly were not adopted because of the same two-sided problem.)
Following the same line of argument, you could say that NATs are, in fact, exactly where a backward-compatible IPv4 address extension ends up. In a NAT system, only the client-side router needs to know anything about the "new protocol" (which lets a single IPv4 address refer to many possible devices). Neither the routers on the internet, nor the servers, need to know about NAT in order for the new system to work. Sure enough, NATs have let us greatly expand the effective address space of IPv4. (There are far more than 4 billion devices on the IPv4 internet today!) Unfortunately, as we all know, a major limitation of NATs is that there is no way to start a connection in the reverse direction.
One could imagine various extensions to NATs that would let a client specify which IP address, behind the remote NAT, it wants to talk to. But such a protocol would require support from both the client and server, so again, it would be hard to adopt.
In turn, a variation of *that* idea is to simply allow services to occupy nonstandard port numbers, and to map different port numbers back to different servers behind the server-side firewall. This is one of the ideas behind [DNS SRV records](https://en.wikipedia.org/wiki/SRV_record), and it would extend IPv4 to effectively a 48-bit address space. To work, it would require support mainly just from web browsers. So far, though, it has not caught on, perhaps because IPv4 addresses are still too inexpensive.
Finally, a similar proposal has been used at the HTTP layer, namely [TLS SNI](https://en.wikipedia.org/wiki/Server_Name_Indication) and the HTTP Host: header. This lets an HTTP load balancer forward traffic to the right backend server based on name, rather than IP address, thus extending the address space effectively infinitely. Using this method, a cloud provider like AWS could put nearly all their customers' servers behind one giant HTTP proxy on a single IP address, if they someday need to. But given the current price of IPv4 addresses, this will probably not be needed for a long time.
## [Does Tailscale support IPv6?](#does-tailscale-support-ipv6)
Yes. Tailscale [can route its packets peer-to-peer over IPv4 or IPv6](/docs/concepts/ipv6),
with and without NAT, multi-layer NAT, or CGNAT in the path. Inside the tunnel, Tailscale assigns private IPv4 and IPv6 addresses to every node. Your Tailscale private IPv6 addresses are usable even if the internet path it selects is IPv4-only.
On this page
* [What is IPv6?](#what-is-ipv6)
* [Is IPv6 faster than IPv4?](#is-ipv6-faster-than-ipv4)
* [Does IPv6 have built-in IPsec encryption for all connections?](#does-ipv6-have-built-in-ipsec-encryption-for-all-connections)
* [Is IPv6 a failure?](#is-ipv6-a-failure)
* [Why isn't IPv6 more popular?](#why-isnt-ipv6-more-popular)
* [Where has IPv6 seen major success?](#where-has-ipv6-seen-major-success)
* [Does IPv6 give me a permanent, static IP address for free?](#does-ipv6-give-me-a-permanent-static-ip-address-for-free)
* [Does IPv6 work with mobile IP or multi-homed devices?](#does-ipv6-work-with-mobile-ip-or-multi-homed-devices)
* [Will IPv6 ever be fully rolled out?](#will-ipv6-ever-be-fully-rolled-out)
* [Should I support IPv6 on my server?](#should-i-support-ipv6-on-my-server)
* [What can I do to encourage adoption of IPv6?](#what-can-i-do-to-encourage-adoption-of-ipv6)
* [Are we really out of IPv4 addresses?](#are-we-really-out-of-ipv4-addresses)
* [Does IPv6 make peer-to-peer apps easier?](#does-ipv6-make-peer-to-peer-apps-easier)
* [Would fully deployed IPv6 eliminate NATs?](#would-fully-deployed-ipv6-eliminate-nats)
* [Does IPv6 eliminate CGNAT?](#does-ipv6-eliminate-cgnat)
* [Does IPv6 eliminate the problems of double NAT?](#does-ipv6-eliminate-the-problems-of-double-nat)
* [Do NATs increase security?](#do-nats-increase-security)
* [Do NATs increase privacy?](#do-nats-increase-privacy)
* [Could a different design have rolled out faster than IPv6?](#could-a-different-design-have-rolled-out-faster-than-ipv6)
* [What would a backward-compatible address extension to IPv4 look like?](#what-would-a-backward-compatible-address-extension-to-ipv4-look-like)
* [Does Tailscale support IPv6?](#does-tailscale-support-ipv6)
Scroll to top