Tailscale Peer Relays: Use your own devices as high-throughput relays
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|productFebruary 18, 2026
# Tailscale Peer Relays is now generally available
When Tailscale works best, it feels effortless, almost boring. Devices connect directly, packets take the shortest possible path, and performance ceases to be a pressing concern.
But real-world networks aren’t always that cooperative. Firewalls, NATs, and cloud networking constraints can block direct peer-to-peer connections. When that happens, Tailscale relies on relays ([DERP](https://tailscale.com/docs/reference/connection-types#derp-connections/?utm_source=blog&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026)) to keep traffic moving securely and reliably.
Today, we’re excited to announce that [Tailscale Peer Relays](https://tailscale.com/docs/features/peer-relay/?utm_source=blog&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026) is now generally available (GA). Peer relays bring customer-deployed, high-throughput relaying to production readiness, giving you a tailnet-native relaying option that you can run on any Tailscale node. Since their [beta release](https://tailscale.com/blog/peer-relays-beta/?utm_source=blog&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026), we’ve shaped Tailscale Peer Relays to deliver major improvements in performance, reliability, and visibility.
What started as a way to work around hard NATs has grown into a production-grade connectivity option. One that gives teams the performance, control, and flexibility they need to scale Tailscale in even the most challenging network environments.
## [Vertical scaling boost that improves throughput](#vertical-scaling-boost-that-improves-throughput)
We have made big throughput improvements for Tailscale Peer Relays that are especially noticeable when many clients are forwarding through them. Connecting clients now select a more optimal interface and address family when more than one are available within a single relay, which helps bootstrap and improve overall connection quality. On the relay itself, throughput has increased: packets are handled more efficiently on every Peer Relay because of lock contention improvements, and traffic is now spread across multiple UDP sockets where available.
Together, these changes deliver meaningful gains in both performance and reliability across day-to-day tailnet traffic. Even when direct peer-to-peer connections aren’t possible, peer relays can now achieve performance much closer to a true mesh.
## [Static endpoints for restrictive cloud environments](#static-endpoints-for-restrictive-cloud-environments)
In some environments, particularly in public cloud networks, automatic endpoint discovery isn’t always possible. Instances may sit behind strict firewall rules, rely on port forwarding or load balancers in peered public subnets, or operate in setups where opening arbitrary ports simply isn’t an option. In many cases, the infrastructure in front of those instances can’t run Tailscale directly, making standard discovery mechanisms ineffective.
Peer relays now integrate with static endpoints to address these constraints. Using the `--relay-server-static-endpoints` flag with `tailscale set`, a peer relay can advertise one or more fixed `IP:port` pairs to the tailnet. These endpoints can live behind infrastructure such as an AWS Network Load Balancer, enabling external clients to relay traffic through the peer relay even when automatic endpoint discovery fails.
This unlocks high-throughput connectivity in restrictive cloud environments where traditional NAT traversal and endpoint discovery don’t work. Customers can now deploy peer relays behind load balancers and still provide reliable, high-performance relay paths to clients outside those networks.
For many customers, this also means peer relays can replace subnet routers, unlocking full-mesh deployments with core Tailscale features like [Tailscale SSH](https://tailscale.com/docs/features/tailscale-ssh/?utm_source=blog&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026) and [MagicDNS](https://tailscale.com/docs/features/magicdns/?utm_source=blog&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026).
## [Improved auditability and visibility](#improved-auditability-and-visibility)
Now in general availability, Tailscale Peer Relays also integrate more deeply into Tailscale’s visibility and observability tooling, making relay behavior clear, measurable, and auditable.
Peer relays integrate directly with [tailscale ping](https://tailscale.com/docs/reference/tailscale-cli#ping/?utm_source=blog&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026), allowing you to see whether a relay is being used, whether it’s reachable, and how it impacts latency and reliability when testing connectivity. This removes much of the guesswork from troubleshooting. When issues arise, it’s easy to determine whether traffic is being relayed, whether the relay is healthy, and whether it’s contributing to degraded performance.
For ongoing observability, Tailscale Peer Relays now expose client metrics such as `tailscaled\_peer\_relay\_forwarded\_packets\_total` and `tailscaled\_peer\_relay\_forwarded\_bytes\_total`. These metrics can be scraped and exported to monitoring systems like Prometheus and Grafana alongside existing Tailscale client metrics, enabling teams to track relay usage, understand traffic patterns, detect anomalies, and monitor tailnet health at scale.
## [What’s next](#whats-next)
With general availability, Tailscale Peer Relays become a core building block for scaling Tailscale in real-world networks. They enable:
* High-throughput, low-latency connections when direct paths are unavailable
* Deployments in restricted cloud environments through static endpoints
* Full mesh in private subnets, with controlled ingress/egress paths
At the same time, Tailscale Peer Relays deliver intelligent, resilient path selection across the tailnet, along with first-class observability, auditability, and debuggability. All of this comes without compromising on Tailscale’s foundational guarantees: end-to-end encryption, least-privilege access, and simple, predictable operation.
Getting started is straightforward. Tailscale Peer Relays can be enabled on any supported Tailscale node using the CLI, controlled through grants in your ACLs, and deployed incrementally alongside existing relay infrastructure; you can read more [in our docs](https://tailscale.com/docs/features/peer-relay/?utm_source=blog&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026).
Peer Relays are available on all Tailscale plans, including our free Personal plan. If you need deployment support or have specific throughput goals, don't hesitate to [reach out](https://tailscale.com/contact/sales/?utm_source=blog&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026).
Share
Authors
Smriti Sharma
Kabir Sikand
Contributors
Alvin Wong
Larah Vasquez
Jordan Whited
Alex Valiushko
Dylan Bargatze
Authors
Smriti Sharma
Kabir Sikand
Contributors
Alvin Wong
Larah Vasquez
Jordan Whited
Alex Valiushko
Dylan Bargatze
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