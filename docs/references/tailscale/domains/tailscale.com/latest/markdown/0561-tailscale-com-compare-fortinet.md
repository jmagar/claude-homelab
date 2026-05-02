Fortinet (FortiClient VPN) vs Tailscale
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Go back](/compare#vpn-comparisons)
[Compare](/compare)
Fortinet
# Fortinet (FortiClient VPN) vs Tailscale
On this page
[
Use Tailscale
](https://login.tailscale.com/start)[
Contact Sales
](/contact/sales)
Fortinet is a cybersecurity company with offerings like FortiGate, a firewall solution that can include a hardware-based network security appliance, and FortiClient VPN, their VPN solution. Compared to Tailscale, there are major differences in approaches to architecture, security, choice of protocol, hardware commitments, ease of setup, and more.
### [Comparison matrix](#comparison-matrix)
Let’s start with a basic feature chart between FortiClient VPN and Tailscale, then we’ll go into greater detail.
||Tailscale|FortiClient VPN|
|Open source|Yes
Tailscale daemon and CLI tool, not the coordination server or GUI for proprietary OS
|No|
|Integrates with identity providers for single sign-on|Yes
[Apple, Google, GitHub, Microsoft, Okta, OneLogin, and more with custom identity providers
|Yes|
|Connection type|Mesh-capable VPN|Client-server VPN|
|Encryption type|Node-to-node encryption using the WireGuard protocol|TLS encryption, IPsec (IKEv1/IKEv2) with configurable ciphers|
|Connection latency|Lower latency and higher throughput with peer-to-peer connections|The client-gateway model increases latency when the client and server are farther apart|
|Endpoint management|Yes, natively|Yes, requires FortiClient EMS|
|ACLs and security policies?|Yes|Yes|
|Forward all traffic through gateway?|Optional([exit nodes](https://tailscale.com/kb/1103/exit-nodes))|Optional|
|Auditing and logging?|Yes|Yes|
|Pricing?|Simple and predictable with flat pricing per user|Variable, requires contacting their sales team for a quote|
### [Fortinet vs Tailscale architecture overview and performance implications](#fortinet-vs-tailscale-architecture-overview-and-performance-implications)
Fortinet’s FortiClient VPN uses a traditional client-server or hub-and-spoke model. A typical setup requires FortiClient, the endpoint agent, and FortiGate—FortiClient and FortiGate are not the same. FortiGate began as the "hub" hardware offering that acts as a firewall, gateway, and policy enforcement point. FortiGate has since evolved into a next-generation firewall (NGFW) that has both physical and virtual offerings for cloud setups. For authentication, FortiAuthenticator is required for identity management and single sign-on (SSO) integration​.
Remote users connect to a FortiGate gateway using FortiClient. All traffic goes through a FortiGate access proxy, which also acts as an enforcer of access policies to internal applications. In other words, the control plane and data plane both flow through FortiGate.
Fundamentally, Fortinet’s design choice impacts speed and performance. The farther the client device is from the gateway, the greater the impact. To counteract this, more FortiGate enforcement points can be set up, adding more management required.
In contrast to Fortinet, Tailscale does not use a traditional model, instead employing an overlay mesh network with direct peer-to-peer connections. These direct connections are the data plane, which is facilitated by encrypted end-to-end WireGuard tunnels. The control plane is separate from the data plane, where Tailscale uses a coordination server to help peers share public keys and addresses to establish direct connections.
Because WireGuard is built into the kernel or runs in a high-efficiency module, it is capable of high throughput with low overhead. Furthermore, the distributed nature of this data plane means there is no single bottleneck like a gateway. Traffic takes the shortest path available, improving reliability and latency.
### [FortiClient EMS vs Tailscale endpoint management](#forticlient-ems-vs-tailscale-endpoint-management)
Fortinet’s FortiClient EMS (Endpoint Management Server) is required to orchestrate and manage endpoints, including distributing policies and device posture profiles. Endpoint registrations can be accepted, deregistered, or blocked through FortiClient EMS. The endpoints themselves can be managed, and outdated versions of FortiClient can be identified with FortiClient EMS.
Tailscale does not require separate software for management of endpoints, policies, or device posture. Everything can be reliably handled in the Tailscale admin console.
### [Fortinet vs Tailscale encryption and security](#fortinet-vs-tailscale-encryption-and-security)
Fortinet’s FortiClient VPN uses TLS encryption (SSL/TLS tunneling) for securing data between the FortiClient endpoint and the FortiGate. It leverages industry‑standard IPsec (IKEv1/IKEv2) with configurable ciphers (AES‑256, 3DES, ChaCha20, HMAC‑SHA variants) for VPN tunnels, plus TLS for HTTPS management sessions and SSL inspection on NGFWs.
Of note, Fortinet is ending support for SSL VPN tunnel mode from version 7.6.3 onwards. Fortinet has been phasing out the functionality and is now forcing a migration to IPsec VPN solutions.
Fortinet’s approach allows for deep inspection for malware or anomalies through NGFW (next-generation firewall) services. However, setups with an inline device broaden the attack surface by adding another target that attackers might try to exploit. Hardware appliances remain an internet-facing entry point and must be secured, while being a security chokepoint for both the control plane and data plane. While these are simply fundamental design decisions, any scenario that increases an attack surface area will present great possibilities of occurrences like zero-day exploits and other vulnerabilities.
An alternative to Fortinet’s approach, Tailscale’s data plane is peer-to-peer and decentralized, which keeps user data private between the endpoints by design. When two devices communicate, they establish a direct WireGuard tunnel with each other’s public keys. In effect, every pair of communicating nodes has its own private, secured channel. Effectively, Tailscale’s data plane is distributed without a singular device bottlenecking traffic.
As for encryption, Tailscale’s control plane employs a custom Noise IK-based protocol with X25519 as described in RFC7748. While it can operate directly over plain TCP in environments that allow it, it also supports being wrapped in TLS when necessary for compatibility or additional security requirements. Tailscale exclusively uses the [WireGuard protocol](https://www.wireguard.com/papers/wireguard.pdf) for its data plane, which has a fixed cryptographic suite including ChaCha20 for encryption and Poly1305 for authentication.
### [Fortinet vs Tailscale authentication](#fortinet-vs-tailscale-authentication)
Fortinet’s FortiClient VPN allows authentication against local FortiGate accounts and enterprise directories like LDAP/Active Directory. Integration with FortiAuthenticator is required to enable federated SSO via SAML/OAuth or other identity providers. Multi-factor authentication (MFA) further requires FortiToken or third-party integrations.
An alternative to Fortinet, Tailscale simplifies authentication natively by relying on identity providers and SSO login. No extra software or setup required, users can authenticate with their provider of choice, such as Apple, Google, Microsoft, Okta, or other custom identity providers.
As for authorizing devices, Tailscale admins can approve new devices or configure auto-approval. This approval process adds an extra layer of security in case a user’s password is compromised. But even once on a tailnet, devices rely on cryptographic keys for trust, and an admin can centrally revoke a node’s key if a device is lost or stolen, instantly cutting off its access.
### [Fortinet vs Tailscale policy enforcement](#fortinet-vs-tailscale-policy-enforcement)
Fortinet’s policy enforcement occurs at the FortiGate, designed to be a security chokepoint. Administrators can define access rules incorporating user identity, device posture, and application attributes. FortiGate will only allow a specific session to any given application if all conditions are satisfied.
Tailscale uses an identity-based ACL system. Administrators define an ACL policy (in JSON format) that specifies which users or groups can access which destinations (IP addresses or tags) and on which ports​. Administrators can specify policies per user and device name instead of IP addresses. Using groups and tags, administrators can implement Role-Based Access controls (RBACs) easily.
### [Fortinet vs Tailscale initial setup and management](#fortinet-vs-tailscale-initial-setup-and-management)
Fortinet’s FortiClient VPN requires a complex setup. It requires installing FortiClient, deploying FortiGate with FortiOS, and setting up FortiClient EMS for endpoint management. This means setting up not only software, but potentially also hardware. All of this has an absolute dependence on an IT team and their resources, even for mobile devices.
Administering FortiClient VPN and FortiOS on FortiGate means dealing with FortiOS policies, possibly FortiManager or FortiClient EMS for large-scale deploys, and coordinating between network and security teams. These policies require planning, though they are appropriately granular if done correctly. When it comes time to offboard, FortiClient VPN requires disabling the user account on the FortiGate or in the directory and possibly uninstalling or locking their FortiClient.
An alternative to Fortinet, Tailscale focuses on simplified installation and administration. There is no hardware to deploy. Tailscale maintains the coordination server to exchange users’ public keys. All you need to get started is to create a Tailscale account (often by logging in with Google/Microsoft), install the client on two devices, and they instantly form a private network​. There’s no need to configure IP ranges, firewall rules, or NAT traversal because Tailscale handles all of that automatically.
### [Tailscale vs FortiClient VPN cost](#tailscale-vs-forticlient-vpn-cost)
FortiClient VPN cost and pricing can vary widely, and require contacting their sales team. Licensing of FortiClient is split across three packages of “VPN/ZTNA”, “EPP/ATP”, and “Managed”. The final cost of FortiClient VPN depends on multiple variables based on your needs.
By contrast, Tailscale has flat pricing that is a straightforward charge per user. No hardware costs with networking appliances, and easy to set up yourself.
### [The bottom line](#the-bottom-line)
FortiClient VPN is a traditional VPN from requirements, architecture, initial setup, and long-term management. Tailscale provides a modern VPN experience with a mesh network built on the secure and performant WireGuard protocol that’s easy to set up and manage over time.
## Try Tailscale for free
[
Get started
](https://login.tailscale.com/start)
Schedule a demo
[
Contact sales
](/contact/sales)