Cloudflare vs. Tailscale | Compare Access and Gateway to Tailscale
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Go back](/compare#vpn-comparisons)
[Compare](/compare)
Cloudflare Access
# Cloudflare Access vs. Tailscale
On this page
[
Use Tailscale
](https://login.tailscale.com/start)[
Contact Sales
](/contact/sales)
**Cloudflare Access** is a gateway for application access, which integrates with your identity provider and endpoint protection solutions, and **Cloudflare Gateway** provides DNS filtering. Access and Gateway is part of Cloudflare One, a bundle that includes several separate features such as Cloudflare Teams and Magic WAN. Tailscale encompasses features from all of these, but it’s most similar to Cloudflare Access.
Both Tailscale and Cloudflare Access allow you to manage access to your applications based on your existing identity provider and from disparate geographical locations. Here, we’ll compare the two so you can choose the solution that’s best for you.
### [Overview of Cloudflare Access](#overview-of-cloudflare-access)
Cloudflare is a cloud computing and website security company that offers a range of services: a global content delivery network, distributed denial of service (DDoS) protection (through Cloudflare Spectrum), and zero-trust authentication services. Cloudflare runs a globally distributed network of proxy servers and data centers, so that their services are low latency to users no matter where they are geographically located. Cloudflare provides a content delivery network which acts as an intermediary between site servers and visitors, by caching copies of users’ websites in Cloudflare’s network, so that visitors can reach their desired site from their local data center. Their network also has security protections built in, blocking a variety of threats.
Of Cloudflare’s offerings, Cloudflare Access is functionally most similar to Tailscale. Access allows users to login from anywhere to access protected resources, using their existing identity provider and integrating with their existing endpoint protection. Cloudflare’s globally distributed network means it has low latency for users–although all traffic must pass through Cloudflare.
### [Comparison matrix](#comparison-matrix)
||Tailscale|Cloudflare Access|
|Mesh VPN|Yes|No
Uses Cloudflare’s global network to intermediate connections|
|Service to Service (East-West)|Yes, via Mesh or Relays|Yes, via Reverse Proxy|
|User to Service (North-South)|Yes, via Mesh or Relays|Yes, via Reverse Proxy|
|Open source|Yes (clients), [learn more](https://tailscale.com/opensource)|No|
|End-to-end encryption|Yes|No
Encrypted data in transit via HTTPS, but not end-to-end encryption. Cloudflare’s edge network terminates TLS connections and can inspect traffic.|
|Role-based access controls|Yes|Yes|
|Integrates with identity providers for single sign-on|Yes[
Google, AzureAD, GitHub, Okta, OneLogin, and more](https://tailscale.com/kb/1013/sso-providers/)|Yes
Google, AzureAD, GitHub, Okta, LinkedIn, and more.SSO is only available on Enterprise plans.|
|Client required for users|Yes|No for web only apps
Yes for other uses|
|Pricing|Free for personal use and open source
Paid for enterprise|Free for up to 50 users
Paid for more than 50 users|
### [Initial setup](#initial-setup)
Both Cloudflare Access and Tailscale are managed services, making installation simple. To get started, you will need to set up clients for users and configure any desired access controls.
Cloudflare Access offers a client-less solution for users only looking to connect to web applications; and a client for all other connections.
Tailscale requires the user to install a client on their device to access their tailnet. Applications or servers can either run the Tailscale client, or can be made accessible via a subnet router, to expose a private network to your tailnet.
### [Connectivity](#connectivity)
Tailscale’s peer-to-peer mesh VPN is designed to improve connectivity through direct communications, whereas Cloudflare routes traffic through a centrally managed service.
For this type of north-south traffic (that is, traffic coming into and going out of the private network perimeter), Cloudflare Access offers low latency connections from a user to the service they are accessing, as user requests are authenticated on Cloudflare’s network, with their data centers acting as a reverse proxy and enforcement point.
Tailscale’s nodes may talk directly, without a reverse proxy server sitting in the middle. The vast majority of Tailscale users’ communications don’t go through Tailscale servers; Tailscale connects devices directly peer-to-peer in a mesh network. Each node on the Tailscale network instead acts as its own enforcement point.
Tailscale’s mesh networking also enables performant service-to-service communication (east-west traffic between services in your private network). Without a reverse proxy in the middle, Tailscale enables direct communication between two nodes on the network and granular service-to-service access controls.
### [Security](#security)
Both Cloudflare Access and Tailscale offer zero trust remote access solutions. Role-based access control (RBAC) limits what users, devices, or applications can connect to each other on the network. Both work with the most popular identity providers to support single sign-on.
Given that Cloudflare users never actually have access to a full virtual private network, they cannot make lateral movements within a network, accessing resources that they’re not authorized to use. With Cloudflare Access’ granular, zero trust approach, Cloudflare claims an advantage over legacy corporate VPNs, which provide scant visibility into user activity, showing usernames and IP addresses, at most. Cloudflare Access provides detailed logging of user activity so that any suspicious activity can be detected.
The vast majority of Tailscale users’ communications don’t go through Tailscale servers; devices form direct peer-to-peer connections in a mesh network, and all of their communications are end-to-end encrypted, improving data security and privacy. Two servers side by side on the same LAN can form an encrypted Tailscale link between them, providing a true zero-trust environment without any additional latency.
Tailscale lets its users define security policies that determine, by rule, which nodes can access which IP addresses. Each node in the Tailscale mesh network acts as its own stateful firewall and audit trail. Tailscale users can also define which nodes can access which services and groups of users. Since each Tailscale node logs its connections to a central logging service, every connection is logged twice (since both partners in a connection log their connection), making log tampering easy to detect, without the need to funnel network traffic through a central provider.
### [Performance](#performance)
With Cloudflare Access, users connect to the closest entrypoint for Cloudflare’s network. Cloudflare’s routing technology finds the data center closest to the user for low latency connections. However, all traffic must go through here before reaching its destination.
With Tailscale, devices connect directly peer-to-peer in a mesh network. These communications are low latency and limited by the performance of the connections. Two servers side by side on the same LAN can form an encrypted Tailscale link between them, without any additional latency of passing through a centralized service.
### [Network administration](#network-administration)
Both Cloudflare Access and Tailscale are managed services. There is no need to host infrastructure.
### [The bottom line](#the-bottom-line)
If you’re looking for a remote access service for users accessing web applications, or you are already using or need features provided by other Cloudflare services like CDN, DDOS, and WAF, try Cloudflare Access.
If you’re looking for a programmable zero trust network, you need end-to-end encryption, you have additional non-web applications, you’re looking for a control plane for service-to-service traffic, or are connecting on local networks where latency matters, [try out Tailscale](https://tailscale.com/download).
## Try Tailscale for free
[
Get started
](https://login.tailscale.com/start)
Schedule a demo
[
Contact sales
](/contact/sales)