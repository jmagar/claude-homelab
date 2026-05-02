Mendix Cloud Private Connectivity powered by Tailscale, now in public beta
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|productJanuary 08, 2026
# Mendix Cloud Private Connectivity powered by Tailscale now available in public beta
Today we are thrilled to welcome [Mendix](https://www.mendix.com/) as a Tailscale partner. Together with the Mendix team, we’ve developed **Mendix Cloud Private Connectivity powered by Tailscale,** making it easier for customers to securely connect their cloud-hosted applications to private infrastructure anywhere, without exposing internal systems to the public internet.
Mendix is the leading low-code application development platform, supporting every stage of the app lifecycle, from ideation to deployment. With Mendix Cloud, customers can run and scale the applications they’ve built with AI accelerations and single-click deployment. But many of these applications also need to talk to systems that live elsewhere: in private data centers, on-premises environments, or other cloud platforms.
Until now, connecting Mendix Cloud apps to those systems typically meant exposing those systems to the public internet. While these setups can be secured by using HTTPS, reverse proxies and client certificates, not all Mendix Cloud customers are willing, able or allowed to expose internal systems to the public internet.
## [A simpler, more secure connection](#a-simpler-more-secure-connection)
**Mendix Cloud Private Connectivity powered by Tailscale** changes that. Customers can now establish private, secure connections between their Mendix Cloud apps and their own infrastructure—without the hassle of complex networking set ups and arduous security reviews.
Here’s what that means for Mendix Customers:
* **Secure connectivity, out of the box.** Mendix Cloud apps can now securely reach on-premises or cloud-based systems without exposing them to the public internet.
* **Zero-Trust by default: **Mendix customers receive the benefits of a zero trust security model that verifies every connection, every time, by default.
* **No separate subscriptions.** Connectivity is fully managed by Mendix—customers don’t need to buy or maintain third-party services.
* **Powered by Tailscale.** Behind the scenes, Tailscale’s mesh networking makes the connections simple, secure, and scalable.## [How it works](#how-it-works)
With Mendix Cloud Private Connectivity powered by Tailscale, Mendix creates a dedicated, isolated Tailscale network for a customer’s account. Lightweight agents running in the customer’s infrastructure securely join that network and expose only approved resources, like a subnet, database, or service endpoint.
Mendix applications can then connect directly (peer-to-peer) to those resources whenever possible. If a direct path isn’t available, Tailscale automatically routes encrypted traffic through our global DERP relay network. If you need even higher throughput and want full control, [Tailscale Peer Relays](https://tailscale.com/blog/peer-relays-beta) provide a node that can relay over UDP inside hard firewalls and cloud architecture, at performance that rivals direct connections. Either way, your data never leaves an encrypted tunnel—and your systems never need to be exposed publicly.
## [Why this matters for Mendix customers](#why-this-matters-for-mendix-customers)
With this integration, Mendix customers can focus on what matters most: building applications that deliver value. They don’t need to become networking experts or spend time wrestling with VPNs.
Whether it’s connecting to a private database, calling internal APIs, or integrating with enterprise systems, Mendix Cloud Private Connectivity makes it possible to do so securely, without leaving the Mendix environment or opening unnecessary holes in the network.
This public beta is just the beginning. It marks the first step toward a fully managed, seamless networking experience within Mendix Cloud.
## [Get started](#get-started)
**Mendix Cloud Private Connectivity powered by Tailscale** is available today in public beta, free of charge for all Mendix customers. During the public beta, Mendix customers have free reign to test the solution and explore the partnership's various capabilities. If you’re a Mendix customer and want to try it out, reach out to your Mendix representative to learn more.
Start your free trial today! Read the [details at Mendix's docs site](https://docs.mendix.com/control-center/private-connectivity/), and you can check out Mendix's [announcement at their blog](https://www.mendix.com/blog/introducing-mendix-cloud-private-connectivity-public-beta/) as well.
Share
Author
Rachele Gyorffy
Author
Rachele Gyorffy
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