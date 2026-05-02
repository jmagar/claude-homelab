Tailscale's Regional Routing: Scale Globally for Enhanced Performance
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|December 12, 2023
# Scale globally using Regional Routing with Tailscale
As organizations grow, so does the expectation of reliable performance and uptime for employees and workloads. Today, we are excited to announce the release of Tailscale [Regional routing](/kb/1115/high-availability/), which helps teams scale their [app connectors](/kb/1281/app-connectors) and [subnet routers](/kb/1019/subnets) globally by routing & balancing traffic across the nearest available infrastructure. We’re also making a few welcome changes to existing high availability options.
## Scaling that really scales
If you’ve ever managed networks at a growing business, you know that scale comes in many forms. Teams can scale across the globe, but they can also scale in volume, throughput, business needs… the list goes on.
That’s why we built Tailscale Regional routing with scalabilityin mind. Regional routing lets you scale your workforce in whatever way your business needs – horizontally, vertically, or otherwise. Regional routing has a few flavors: global geo-steering, in-region load balancing, and failover.
Regional routing allows customers to deploy a global fleet of overlapping connectors (that is, app connectors that advertise the same apps, or subnet routers that advertise the same routes). Regional routing can help provide high availability and increased performance when you have a global workforce or a highly distributed application.
## Regionally routed
Overlapping connectors are grouped into regions that map to Tailscale’s [DERP regions](/kb/1232/derp-servers). Upon connecting to Tailscale, client devices identify which regional routing group is closest to them by finding the closest DERP server. Each client is then instructed to send traffic bound to a given applicable destination directly to the closest connector. The chosen connector is constantly re-evaluated as clients move and connectors go online or offline, permitting highly-available access to resources via the lowest latency path.
Regional routing brings performance and reliability benefits to a global workforce.
If multiple overlapping connectors exist within a region, the specific connector used within that region depends on one of the following two behaviors.
## In-region load balancing
Within a DERP region, if multiple connectors exist, then load is spread evenly across the connectors on a best-effort basis. The algorithm is as follows: each client has a stable pseudorandom order of routing preference for the set of nodes in a region. If the top preferred node is unavailable the client is directed to the next most preferred node. As a side effect, this behavior creates a ‘stickiness’: clients will be routed to a specific connector within a region, unless that connector is unavailable. If no connectors are available within a region, another region is selected.
If a whole region is offline, the next closest is used.
So you can add scale to a specific region as needed, perhaps where there’s a throughput-heavy production database or a large in-office corporate hub.
## In-region failover
Administrators can instead opt to use Tailscale’s High availability failover instead of in-region load balancing where needed. Failover allows customers to deploy a series of overlapping connectors for the purpose of redundancy. In a failover scheme, one connector is used at a time by all clients within a DERP region. If it goes offline another connector is used in that region. If no connectors are available within a region, another region is selected.
## Global failover
If you don’t need the scale that Tailscale Regional routing offers, global failover may be for you. Failover allows customers to deploy a series of overlapping connectors for the purpose of global redundancy. In a failover scheme, one connector is used at a time by all clients, globally. If it goes offline another connector is used.
Failover allows for global high availability across multiple connectors.
Failover, previously only available to customers on the Premium and Enterprise plans, is now available for use on the Free, Starter, Premium, and Enterprise plans.
## Redundancy, your way
Remember, none of the infrastructure you’re routing across is tailscale-owned. Everything is encrypted to the last app connector or subnet router, and Tailscale can’t see the contents of your traffic. This is global high availability, with no configuration necessary, on infrastructure you manage and trust.
To learn more about how to set up high availability, [head over to our documentation](/kb/1115/high-availability/).
Share
Authors
Kabir Sikand
Jairo Camacho
Authors
Kabir Sikand
Jairo Camacho
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