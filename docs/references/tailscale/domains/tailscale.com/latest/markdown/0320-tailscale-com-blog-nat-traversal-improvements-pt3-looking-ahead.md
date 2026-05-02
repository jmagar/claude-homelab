Improving NAT traversal, pt. 3: looking ahead
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|insightsOctober 24, 2025
# NAT traversal improvements, pt. 3: looking ahead
This is the third in a series of posts about how Tailscale makes secure connections between devices, and the challenges on the path between them. Read on for a peek into how the market is moving under heavy demand for peer connections, and what Tailscale is thinking about in improving direct connectivity.
*See [the first post in this series](https://tailscale.com/blog/nat-traversal-improvements-pt-1) for details on what makes certain NATs so hard, and [part two](https://tailscale.com/blog/nat-traversal-improvements-pt-2-cloud-environments) for some thoughts on public clouds, and how Tailscale can work through all of them. Stay tuned for a final post next week.*
Despite all the [improvements in NAT traversal](https://tailscale.com/blog/nat-traversal-improvements-pt-1), there will always be cases where a relay is needed; some networks are just too locked down.
Currently, Tailscale’s DERP relays fill this role. [DERP is essentially a TCP-based relay](<https://tailscale.com/blog/how-nat-traversal-works/#:~:text=Instead, we created DERP ,on the destination’s public key>) (operating over TLS, often on port 443) that forwards encrypted packets when peers can’t reach each other directly​. DERP has been highly reliable, since virtually any network allows outbound HTTPS traffic, but it isn’t optimized for high performance. Being TCP-based, it incurs extra latency due to TCP handshakes, buffering, and the like. If a connection has packet loss, TCP will introduce retransmission delays that wouldn’t affect a pure UDP tunnel as much. Additionally, DERP servers enforce rate limits and fair usage policies that can throttle throughput (since they’re a [shared resource](https://tailscale.com/blog/kubernetes-direct-connections))​.
Recognizing this, we've been exploring options to make the fallback relay faster—in particular, by using UDP for relaying. We’ve seen multiple conversations on the Tailscale social channels and Github [discussing the concept of a “UDP DERP,”](https://github.com/tailscale/tailscale/issues/10953) or a community-run UDP relay that could be used when direct peer-to-peer fails. The idea would be to have a relay server that accepts UDP packets from clients and forwards them to the peer, functioning similarly to DERP but without the overhead of TCP. This is analogous to a [TURN server](https://webrtc.org/getting-started/turn-server) (which is used in WebRTC to relay UDP when peers can’t connect).
A UDP-based relay could significantly improve throughput and reduce latency in worst-case connectivity scenarios. The key challenge is coordinating this securely and efficiently—it’s a non-trivial addition to the mesh logic. Regardless, DERP will get faster. Whether through an official Tailscale TURN network or some clever multi-path aggregation, even the worst-case scenario should improve over time.
Just as Tailscale invested in more [DERP locations globally](<https://tailscale.com/blog/more-derp#:~:text=This week, we added nine,relay, it’ll likely be faster>) for lower latency​, the next investment might be in what protocol we relay your packets with.
## [Broader trends: A more P2P-friendly future?](#broader-trends-a-more-p2p-friendly-future)
Peer-to-peer is no longer fringe. Tools like WebRTC, video calls, gaming, and VPNs like Tailscale have made NAT traversal mainstream. As a result, equipment defaults are shifting: longer UDP timeouts, [hairpin NAT](https://forum.mikrotik.com/t/hairpin-nat-the-easy-way/146718) enabled, and more endpoint-independent mapping support.
Enterprise policy is also evolving. Instead of blanket “block P2P,” admins are learning to distinguish between unauthorized file-sharing and approved business tools that rely on peer connectivity. Guidelines like [NIST SP 800-41](https://csrc.nist.gov/pubs/sp/800/41/r1/final) now explicitly address how to balance security with real-world application requirements.
Finally, [IPv6 adoption](https://www.google.com/intl/en/ipv6/statistics.html), [slow as it is](https://thenewstack.io/mythbusting-ipv6-why-adoption-lags-and-what-will-change-it/), promises a world where many of these NAT problems simply go away. Tailscale already prefers IPv6 when available, and as more ISPs and mobile carriers provide it natively, more peers can talk directly without any NAT at all.
The overall trend is positive. As demand for seamless connectivity grows, vendors and admins are under pressure to make “Easy NAT” the default and “Hard NAT” the exception.
## [Toward a truly seamless connectivity](#toward-a-truly-seamless-connectivity)
As of 2025, NAT traversal is both a solved problem, and an active area of refinement for the tricky edge cases. Tailscale’s approach of combining multiple strategies—STUN, hole punching, DERP relays, and pushing for upstream NAT improvements—has paid off in making peer-to-peer VPN networking remarkably reliable.
It’s not far-fetched to imagine a future where enterprise firewalls have a mode specifically for WireGuard® or peer-to-peer VPN traffic to allow it more directly. Cloud providers could offer premium connectivity features for P2P applications. Each improvement in these chains reduces the need for fallbacks like DERP, bringing us closer to a world where your encrypted packets always take the most direct route possible.
In the meantime, Tailscale will continue operating its DERP network, and investigating other enhancements, to ensure that, no matter how hostile the network, your devices can communicate one way or another.
The trend is clear: connectivity is getting more direct, more peer-to-peer, and more efficient year by year. NAT traversal, once a niche art, is now a critical piece of Internet infrastructure, and it’s becoming faster and more reliable than ever.
Share
Authors
Will Moore
Kevin Purdy
Kabir Sikand
Contributors
Avery Pennarun
Jordan Whited
James Tucker
Authors
Will Moore
Kevin Purdy
Kabir Sikand
Contributors
Avery Pennarun
Jordan Whited
James Tucker
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