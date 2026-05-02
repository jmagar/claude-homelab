Troubleshoot overlapping subnet route failover · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Troubleshoot overlapping subnet route failover
Last validated: Mar 16, 2026
When multiple subnet routers advertise overlapping routes with different prefix lengths (for example, `10.0.0.0/16` and `10.0.0.0/24`), Tailscale uses [longest prefix matching](/docs/features/subnet-routers#use-overlapping-routes-with-different-prefix-lengths) to select the most specific route. However, if the subnet router advertising the more-specific route goes offline, Tailscale does not automatically fall back to the less-specific route. Tailscale drops traffic to the more-specific prefix instead.
This behavior differs from dynamic routing protocols like OSPF or BGP, where a router going offline causes route withdrawal and automatic fallback. Tailscale evaluates each advertised prefix independently. When multiple routers advertise the same prefix, Tailscale removes offline routers from consideration and fails over to a healthy one. However, this failover does not cross prefix boundaries. If all routers for a more-specific prefix go offline, Tailscale does not promote a less-specific prefix as a substitute. Refer to [avoid black holes with overlapping routes](#avoid-black-holes-with-overlapping-routes) for how to ensure a prefix has multiple candidate routers.
Tailscale enforces access control policies through routing, so automatically redirecting traffic to a different subnet router advertising a broader prefix could send traffic to an unintended or unauthorized destination. For example, if an exit node advertises `0.0.0.0/0` and a subnet router advertises a specific LAN prefix, you would not want LAN traffic to egress through the exit node if the subnet router goes down.
## [Avoid black holes with overlapping routes](#avoid-black-holes-with-overlapping-routes)
To prevent black holes when using overlapping routes, configure all subnet routers that advertise a broader prefix to also advertise the more-specific prefix. This ensures the more-specific prefix has multiple candidate routers.
For example, instead of:
* Subnet router A advertising `10.0.0.0/16`.
* Subnet router B advertising `10.0.0.0/24`.
Configure:
* Subnet router A advertising `10.0.0.0/16` and `10.0.0.0/24`.
* Subnet router B advertising `10.0.0.0/24`.
With this configuration, both subnet routers are candidates for the `/24` prefix, and Tailscale can fail over between them if one goes offline. Subnet router A continues to serve the `/16` route for addresses outside the `/24` range.
When multiple subnet routers advertise the same route, Tailscale distributes traffic differently depending on whether [regional routing](/docs/how-to/set-up-high-availability#regional-routing) is enabled for your tailnet.
* **Regional routing off (failover):** This is the default. Tailscale sends all traffic for the route to a single primary subnet router, selected by the date the subnet router was added to the tailnet (oldest first). The remaining subnet routers are passive standbys. If the primary goes offline, Tailscale fails over to the next subnet router after approximately 15 seconds.
* **Regional routing on:** Tailscale distributes traffic across subnet routers based on each client's proximity to the nearest [DERP region](/docs/reference/derp-servers). Clients in different locations might use different subnet routers simultaneously.
Tailscale does not currently support designating a preferred subnet router for a given route for failover.
If you need high availability for a specific subnet, the recommended approach is to have multiple subnet routers advertise the exact same prefix. Refer to [high availability](/docs/how-to/set-up-high-availability) for more information.
On this page
* [Avoid black holes with overlapping routes](#avoid-black-holes-with-overlapping-routes)
Scroll to top