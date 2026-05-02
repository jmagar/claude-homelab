Tailscale Peer Relays: High-throughput relays for secure, flexible networks
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|productOctober 29, 2025
# Introducing Tailscale Peer Relays
Today we’re excited to announce public availability of Tailscale Peer Relays, a traffic relaying alternative to Tailscale’s managed DERP servers that can be enabled on any Tailscale node.
Tailscale Peer Relays provides a customer-deployed and managed traffic relaying mechanism. By advertising itself as a peer relay, a Tailscale node can relay traffic for any peer nodes on the tailnet, even for traffic bound to itself. Tailscale Peer Relays can only relay traffic for nodes on your tailnet, and only for nodes that have access to the peer relay. Because they’re managed entirely by the customer, peer relays are less throughput-constrained than Tailscale’s managed DERP relays, and can provide higher throughput connections for traffic to and from locked-down cloud infrastructure, or behind strict network firewalls.
In testing with early design partners, we’ve seen throughputs nearing that of a direct connection; often multiple orders of magnitude higher than Tailscale’s managed DERP fleet.
## [Moving past hard NAT](#moving-past-hard-nat)
Over the past few weeks, you’ve heard us talk about [improvements we’ve made to](https://tailscale.com/blog/nat-traversal-improvements-pt-1) Network Address Translation (NAT) traversal techniques, so that Tailscale can establish direct connections wherever possible (*hint: it’s over 90% of the time*). However, we’ve also outlined places where this isn’t possible or desirable today for a variety of reasons, [especially in cloud environments](https://tailscale.com/blog/nat-traversal-improvements-pt-2-cloud-environments). And, we’ve postulated a bit about [where we think the industry is going](https://tailscale.com/blog/nat-traversal-improvements-pt3-looking-ahead).
While we’ve been keeping your network reliably connected for years with [DERP](https://tailscale.com/kb/1232/derp-servers), we’ve heard from customers that the throughput and performance aspects of a QoS-aware managed relay fleet makes deployments in certain environments difficult or untenable. Furthermore, customers have noted that it’s non-trivial to deploy and manage [custom DERP fleets](https://tailscale.com/kb/1232/derp-servers#custom-derp-servers) (which run as a separate service and binary).
DERP provides an incredibly valuable service, setting up reliable connections between Tailscale clients anywhere in the world (including negotiating connections through peer relays). But often, DERP’s focus as a reliability and NAT traversal tool results in performance tradeoffs.
By contrast, Tailscale Peer Relays is designed as a performant connectivity tool, and can perform at a level rivaling direct connections. Peer relays can be placed right next to the resources they serve, and peer relays also run on top of UDP, both characteristics beneficial to lower latency and resource overhead. And, they are built into the Tailscale client itself for ease of deployment.
We want to move past even more hard NATs, and put Tailscale’s relaying technology in our customers’ hands, so they can use Tailscale at scale, anywhere, with ease. We believe our new Tailscale Peer Relays connectivity option—unique to Tailscale—gives customers the best performance and flexibility.
## [How it works](#how-it-works)
Peer relays are configured with a single UDP port that must be available to both sides of a connection. Tailscale Peer Relays is built right into the Tailscale client, and can be enabled with a simple command, using the `tailscale set --relay-server-port` flag from the Tailscale CLI. Once enabled via [the steps in our documentation](<https://tailscale.com/kb/1591/peer-relays?utm_source=blog&amp;utm_medium=content&amp;utm_campaign=fall-update-2025 >), clients can connect to infrastructure in hard NAT environments over the peer relay.
**And don’t worry, we still prefer to fly direct.** Tailscale prefers direct connections wherever possible. Clients can then fall back to available peer relays, and finally leverage Tailscale’s managed DERP fleet, or any customer-deployed custom DERPs, to ensure you have connectivity wherever you need it. All of this traffic, over any connection, is still end-to-end encrypted via WireGuard®.
Tailscale Peer Relays is designed for the real world, based on the feedback we’ve received from customers and our own hard-earned networking expertise. It allows customers to make just one firewall exception for connections only coming from their tailnet. Peer relays scale across regions, are resilient to real-world network conditions, and graciously fall back to DERP (Tailscale’s or custom). Your network maintains its shape, but gains all kinds of flexibility.
## [Connectivity, everywhere, at warp speed](#connectivity-everywhere-at-warp-speed)
Customers can now maintain performance benchmarks even where direct connections aren’t possible, by enabling Tailscale Peer Relays to build a deterministic and high-throughput relay topology.
We’ve had customers use peer relays to provide access into unmanaged networks, allowing their partners or customers to provide a controllable and auditable connectivity path without sacrificing performance.
In strict private networks, customers can build predictable access paths. Tailscale Peer Relays can be placed in public subnets with VPC peering to private subnets, allowing security teams to efficiently segment their private network infrastructure, while enabling networking teams to roll Tailscale out in full-mesh mode across the subnet.
Today, customers are using peer relays to establish relayed connections at near-direct speeds across a variety of environments and settings.
* **Enable high-throughput traffic through cloud NATs, like AWS Managed NAT Gateways:** Applications and services behind a Managed NAT Gateway can leverage peer relays to relay traffic that can’t establish direct connections.
* **Relay through network firewalls:** Workloads running in strictly firewalled environments can predictably expose a single UDP port, limiting the Tailscale surface area and fast-tracking the approval process for firewall exceptions.
* **Offload from Custom and Managed DERP: **Minimize data-in-transit through Tailscale‘s managed DERP network, and remove the need for customer-maintained DERP servers.
* **Provide access to locked down customer networks: **Data plane traffic can be relayed through predictable endpoints in customer networks, so that they only need to open minimal numbers of ports to facilitate cross network connections.## [It’s not perfect, but we’re getting there](#its-not-perfect-but-were-getting-there)
Tailscale Peer Relays is available today as a public beta. We’ve yet to establish all the connectivity paths we want to, and there’s still visibility and debugging improvements to work through. However, we’ve reliably seen our early design partners move to peer relay deployments with relative ease, and we’re ready for you to give it a try on your tailnet.
Tailscale Peer Relays can be enabled on all plans, including free (it’s our little way of working through the kinks of the modern internet with our customers). All customers can use two peer relays, for free, forever. As your needs scale, so will the number of available peer relays. To add even more peer relays to your tailnet, [come have a chat with us](https://tailscale.com/contact/sales?utm_source=blog&amp;utm_medium=content&amp;utm_campaign=fall-update-2025P).
Share
Authors
Kabir Sikand
Jordan Whited
Kevin Purdy
Authors
Kabir Sikand
Jordan Whited
Kevin Purdy
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