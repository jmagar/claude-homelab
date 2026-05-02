Is my traffic routed through your servers? · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Is my traffic routed through your servers?
Last validated: Jan 5, 2026
No.
Tailscale routes traffic over the shortest path possible. In most cases,
this is a direct, peer-to-peer connection.
In cases where a direct connection cannot be established, devices will
communicate by bouncing traffic off of one or more geographically
[distributed relay servers](/blog/how-tailscale-works#encrypted-tcp-relays-derp), called DERPs. The traffic that bounces
through our relay servers is encrypted and no different security-wise than
the other dozen hops your internet packets already make when passing over
the network from point A to B.
Scroll to top