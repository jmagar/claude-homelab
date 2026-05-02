VPN Review Guide | Tailscale
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Go back](/compare#vpn-comparisons)
[Compare](/compare)
Reviewer guide
# VPN reviewer’s guide
On this page
[
Use Tailscale
](https://login.tailscale.com/start)[
Contact Sales
](/contact/sales)
This article suggests a set of questions you should ask when considering a modern VPN product. We also provide the answers as they apply to plain WireGuard, and Tailscale’s WireGuard-based product.
### [Basics](#basics)
#### [Which platforms does it run on?](#which-platforms-does-it-run-on)
WireGuard is open source and runs on nearly any platform, including Linux, various BSDs, macOS, iOS, Android, and Windows.
Tailscale runs on all of these platforms.
#### [Does it require special hardware or can it run in a VM?](#does-it-require-special-hardware-or-can-it-run-in-a-vm)
Some VPN products require special hardware, which requires a heavy up-front investment and increases the time needed to roll out. Most modern VPN servers can run as pure software in a virtual machine, which gives you a lot more flexibility.
WireGuard is pure software, as is Tailscale.
#### [Is it open source?](#is-it-open-source)
WireGuard is fully open source. There is the original Linux kernel native implementation, an implementation written in Go (WireGuard-go), and a third-party implementation written in Rust.
Tailscale’s [command-line client for each platform is open source](https://github.com/tailscale/tailscale), while the user-friendly GUI apps are closed source.
### [Reliability](#reliability)
#### [Do I have to re-login whenever I get disconnected?](#do-i-have-to-re-login-whenever-i-get-disconnected)
With most VPNs, you have to reconnect and re-login whenever your machine gets disconnected, or if you suspend/resume your laptop, or if you jump between Wi-Fi networks or from Wi-Fi to LTE. This is probably the single most annoying feature of VPN products.
Both WireGuard and Tailscale remain connected even when your machine disconnects and reconnects, or when you jump between networks.
With Tailscale, you can configure a time period after which users are required to reauthenticate to prove their device is still in their possession.
#### [Is the network TCP or datagram (usually UDP) based?](#is-the-network-tcp-or-datagram-usually-udp-based)
TCP-based VPNs often trigger the [TCP-over-TCP problem](http://sites.inka.de/bigred/devel/tcp-tcp.html) which can lead to hard-to-debug performance problems. Many of them also are designed with excessive [bufferbloat](https://blog.apnic.net/2018/03/19/striking-a-balance-between-bufferbloat-and-tcp-queue-oscillation/) and retransmit times, which makes them nearly unusable for realtime applications such as VoIP, videoconferencing, or remote desktops. In comparison, datagram-based VPNs tend to work well for realtime systems and have more predictable performance.
IPsec VPNs are datagram-based, but can be hard to configure. WireGuard is UDP datagram-based. Tailscale normally uses WireGuard’s datagram-based transport, but automatically falls back to a TCP-based transport when absolutely necessary because of restrictive firewalls (such as often found on airplanes and some hotels).
#### [Does it support a TCP fallback for very restrictive networks?](#does-it-support-a-tcp-fallback-for-very-restrictive-networks)
Some datagram-based VPNs, such as IPsec, don’t work on restrictive networks that block non-TCP or non-HTTP traffic. Others allow the user to choose between UDP and TCP, but most users don’t know which one to choose in which situations; they will often end up sticking to TCP because it works everywhere, even though it’s slower than UDP when UDP works.
Core WireGuard is UDP-only, which means it may not work on some restricted networks.
Tailscale prefers UDP but transparently falls back to TCP when a UDP connection is unavailable. If conditions change, it automatically upgrades back to UDP. This avoids the need for users to choose connection options.
#### [Does it work over LTE?](#does-it-work-over-lte)
Most VPNs basically work on LTE, but some will freeze or disconnect when the connection gets flakey or the signal is low.
Both WireGuard and Tailscale take special effort to stay connected on low-quality connections, and do not need you to log back in after a temporary disconnection.
### [Simplicity](#simplicity)
#### [Can non-technical users set it up?](#can-non-technical-users-set-it-up)
Most VPNs require a baseline amount of networking knowledge in order to get started. For example, you have to designate a machine or VPN to be the VPN gateway, figure out which IP subnet to use, punch a hole in the firewall, configure keys, and install on each device.
WireGuard is a normal VPN in this respect. Although it requires much less in-depth technical configuration than, say, IPsec, it still requires a basic level of technical skill.
In contrast, a simple trial of Tailscale can be installed within minutes, just by logging into a Gmail, GSuite, or Office365 account. You don’t need to understand subnets to get started; just install Tailscale on any two of your devices, and they’ll be able to see each other right away. There is no need to reconfigure the firewall. Later, if desired, you can activate more advanced features like subnet routing and access controls.
#### [Do you need to open a firewall port?](#do-you-need-to-open-a-firewall-port)
Most VPNs require you to open at least one port on the firewall on one end of the VPN connection or the other (or both). This works most easily if the firewall and VPN router are the same device, but that limits your selection of both firewalls and VPN products.
WireGuard is usually not found on router hardware (although some versions of OpenWRT firmware now include it). To make it work, the VPN server usually needs to have a firewall port opened.
Tailscale includes advanced NAT traversal code that removes the need to open firewall ports to establish a connection. That means a computer behind one firewall, and a computer behind another firewall, both on dynamic IP addresses, can connect to each other even without making firewall configuration changes.
#### [Can users just leave it always on, even when they’re at the office?](#can-users-just-leave-it-always-on-even-when-theyre-at-the-office)
Most VPNs and remote access software are intended to only be used remotely. They’re slow and unreliable, so when they’re at the office, users assume they should turn it off to get better performance.
WireGuard is designed as a VPN you can leave turned on all the time. It’s so lightweight and fast that there is usually no noticeable or measurable impact on performance.
Tailscale, based on WireGuard, is intended to be used in the same way. Just connect and leave it connected, and don’t worry about it. When possible, it will automatically create point-to-point connections directly on your LAN for maximum speed.
#### [Can I incrementally roll out just a few servers or users at a time?](#can-i-incrementally-roll-out-just-a-few-servers-or-users-at-a-time)
Some VPN rollouts require a “flag day” where you switch from one system to another. This is especially common when you need to replace the router/firewall hardware, if that hardware is also providing your VPN access.
Tailscale is pure software, and can run in parallel with your other VPN and connectivity systems. You can migrate just a few services, or a few users, at a time to Tailscale while you try it out.
### [Routing](#routing)
#### [Can I connect to multiple datacenters and offices at once?](#can-i-connect-to-multiple-datacenters-and-offices-at-once)
Remote access VPNs typically connect to a single “concentrator” in one central location, or let the end user choose between several concentrators, each in a separate location. Then, you might create point to point VPN tunnels from each location to each other location. This can sometimes result in high latency back-and-forth as packets cross the continent from user to concentrator, then again as they head toward the right datacenter, and then the responses retrace the same path.
WireGuard allows a single node to easily connect to multiple remote locations at once. So if you have a VPN concentrator in each location, it can automatically send the right packets to the right concentrator to keep latency low.
Tailscale takes advantage of that WireGuard feature, but also allows point-to-point connections between individual devices (a configuration called “Zero Trust”), which bypasses the need to set up concentrators at all. (Instead, Tailscale allows [subnet routers](https://tailscale.com/kb/1019/subnets) to be scattered throughout the network, behind firewalls, each offering access to their nearby subnets.)
#### [Can I make point-to-point connections between machines?](#can-i-make-point-to-point-connections-between-machines)
Most VPNs and remote access networks are “hub and spoke” style, with mobile user devices and one or more central hubs where all the servers exist. This architecture nudges everyone toward migrating their servers into the cloud.
Tailscale’s automatic key exchange makes it easy to establish direct point-to-point connections between any pair of machines in the network, which keeps latency to a minimum, even if you’re communicating between your phone in the cafe to your laptop sitting at home.
#### [Do IP addresses depend on physical location?](#do-ip-addresses-depend-on-physical-location)
Usually, when you migrate a server from one location to another (or from one cloud virtual subnet to another), the server’s IP address will change. This requires you to reconfigure all clients that need to talk to that server, or at least change a DNS name. You may have to create a new IPsec tunnel from the old subnet to the new subnet.
With Tailscale, every server has an associated IP address, associated with its public key, that it keeps even as it moves around in the physical world. You can shut down a VM in one location and start it in a different location, and when it comes up, it automatically re-registers with Tailscale so that all clients know where to find it. No DNS reconfiguration required.
#### [Does it work when both ends are on dynamic IP addresses?](#does-it-work-when-both-ends-are-on-dynamic-ip-addresses)
Usually VPNs can only work if one or both ends have a static IP address. This increases costs and makes it harder to migrate or failover between ISPs.
Tailscale will work even if all endpoints are on dynamic IPs and behind NAT firewalls.
#### [If my office has multiple Internet links, can I fail over automatically?](#if-my-office-has-multiple-internet-links-can-i-fail-over-automatically)
Since the central VPN concentrator normally needs to have a static IP address, it can be hard to configure multiple Internet links to support failover scenarios. At best, you at least need to update DNS when one of the links goes down, to point at the other link. In order for both links to be usable as a VPN server, you usually need to buy a static IP address for each.
Tailscale treats every node the same — they can all be on dynamic IP addresses, and they can all hop freely between physical networks, just as your phone hops between Wi-Fi and LTE. Connections are transparently regenerated behind the scenes and no DNS entries or static IPs are needed at all, on either end of the link.
#### [Does it send all my traffic to a vendor’s cloud-based router?](#does-it-send-all-my-traffic-to-a-vendors-cloud-based-router)
The term “VPN” is a bit overloaded. There exist many consumer “VPN” products that are client-only, which route all your traffic through the vendor’s array of servers outside your control. Although touted as privacy services, they can be poor privacy choices since these services can see, log, and interfere with your unencrypted traffic as it passes through their nodes.
This sort of centralized routing can also slow down your Internet latency, since it adds extra hops to your routing. The better vendors minimize this by having many cloud-based routers so that hopefully one is near you.
Tailscale does not ever send your unencrypted traffic through any nodes other than your own. When necessary because of very restrictive networks, Tailscale might bounce your *encrypted* packets through one of our relay servers scattered around the Internet. However, the private keys needed to decrypt your traffic never leave your devices. We never have the ability to see your decrypted packets.
In normal conditions, with reasonable firewalls that don’t necessitate relaying, your packet latency is minimized by sending traffic straight to the remote peer.
#### [Can it route IPv4 traffic over IPv6?](#can-it-route-ipv4-traffic-over-ipv6)
Some VPNs cannot route over IPv6, or are IPv6-only. WireGuard and Tailscale both support routing private IPv4 traffic over both IPv4 and IPv6 Internet links.
Tailscale supports IPv6, both *outside the tunnel* (connecting devices have IPv6-only Internet access), and *inside the tunnel* (you can identify private Tailscale devices via IPv6 addresses). This is true for all Tailscale features, such as [subnets](https://tailscale.com/kb/1019/subnets) and [exit nodes](https://tailscale.com/kb/1103/exit-nodes).
#### [If I add a subnet in one location, does it reconfigure all my nodes?](#if-i-add-a-subnet-in-one-location-does-it-reconfigure-all-my-nodes)
Some VPNs require you to push a new config file to every node every time you make a network topology change.
Plain WireGuard is in this category: every client node needs to know which subnets are offered by every other node.
Tailscale includes code for automatically generating and pushing new configs to every node every time you change the [subnet routers settings](https://tailscale.com/kb/1019/subnets).
#### [Can I connect to external vendors/partners that use IP block lists?](#can-i-connect-to-external-vendorspartners-that-use-ip-block-lists)
A common problem is the need to connect one of your private servers to a vendor, partner, or customer’s private servers. This is often done by manually creating VPC-to-VPC IPsec tunnels, or by making a public-facing service and then restricting it to an IP block list (sometimes called an allowlist).
WireGuard or Tailscale can be used to connect between you and a partner, although sometimes it can be tricky to convince your partner to use WireGuard instead of the IPsec tunnels they are more familiar with.
Instead, you can configure Tailscale to route all traffic to a vendor via a particular node on your own network. Since this node will always have the same public IP address, it allows your partner to have a very short IP block list which almost never needs to be configured, no matter how much you rearrange your network or your employees access the partner servers from different locations. More information is available in [Connecting with IP block lists](https://tailscale.com/kb/1059/ip-blocklist-relays).
#### [Do servers all have to be behind a set of proxies?](#do-servers-all-have-to-be-behind-a-set-of-proxies)
BeyondCorp- or Zero Trust-style products often enforce a particular physical topology for your networks: client devices on one side, an authenticating proxy server network in the middle, and servers on the other side. This topology can be very restrictive especially if you already have a network that’s organized in a more flexible way. Or, to make it work, you might end up with high latency, such as with a proxy server network in California but servers in New York, where users in New York need to bounce their packets all the way to California and back just for the BeyondCorp features to work.
Tailscale gives you similar [ACLs and security policies](https://tailscale.com/kb/1018/acls) to BeyondCorp-style proxies, but without the latency or inflexible network architecture. Clients and servers can be located anywhere.
### [Features](#features)
#### [Does it integrate with ssh authentication?](#does-it-integrate-with-ssh-authentication)
Some VPN and SSL VPN products have built-in special support for certain protocols like ssh and RDP. This is valuable because a misconfigured ssh server, or non-rotating ssh credentials, can result in security vulnerabilities.
Tailscale works great with regular ssh, and allows you to stop opening ssh ports to the outside world, which is an immediate security improvement. It can also alleviate the need to install an ssh jumpbox, because you can set a [Tailscale security policy](https://tailscale.com/kb/1018/acls) that restricts who can access which ssh servers. Employees can only access your internal ssh servers once they have logged into Tailscale using corporate 2-factor authentication, which is a stronger protection than traditional ssh public keys.
We are working on an [experimental new ssh server called tsshd](https://github.com/tailscale/tailscale/tree/main/cmd/tsshd) that will make this even easier, by combining ssh key management with Tailscale key management. But it’s not production ready yet. Comments and patches are welcome!
#### [Can I expose my internal services securely to the public?](#can-i-expose-my-internal-services-securely-to-the-public)
Some VPN-like services allow you to run a command that publishes one of your internal services on a public-facing URL, so you can share them with others.
Tailscale currently does not offer such a service. However, you can use Tailscale to build your own public-facing web servers and load balancers. The general idea is that you construct a public-facing server as usual, and install Tailscale on that server. You could use [Tailscale ACLs](https://tailscale.com/kb/1018/acls) to ensure that server can only make outgoing connections to a limited number of servers or ports — the backend servers providing the web service you want to offer. It could then run a web app with access to your internal database servers, for example, or run a load balancer that proxies to a cluster of backends.
Eventually we are thinking of making this process more integrated and automatic, so you can wire up a new public-facing service with one button. But that isn’t here yet.
### [Security & ACLs](#security-and-acls)
#### [Does it work with my identity provider?](#does-it-work-with-my-identity-provider)
Most VPNs have their own authentication system using either username+password, or other kinds of pre-shared keys (PSKs), or public keys (of which certificates are a specific variant). A few support integration with existing identity providers such as Active Directory. A few, usually BeyondCorp-style or SSL VPN products, support oauth2-style authentication using a web browser.
WireGuard is a public-key based authentication. It’s up to you to distribute and authorize those public keys somehow.
Tailscale combines the convenient oauth2-based authentication of an SSL VPN with the high performance of a native VPN. It can authenticate against the oauth2, OIDC, or SAML provider you already use, which avoids the need to maintain a separate user database.
#### [Does it support native 2FA/MFA?](#does-it-support-native-2famfa)
In recent years, a few VPNs have added support for 2-factor authentication (2FA) or multi-factor authentication (MFA) directly to their VPN protocols, or as an indirect hack (such as entering 2FA tokens into a password field). Many systems still do not support 2FA.
Tailscale is 2FA-agnostic. That is, Tailscale does not involve itself in the authentication process at all. Instead, it sends the user to the normal identity system (often GSuite or Office365), which should be configured to use your preferred 2FA/MFA provider.
We strongly recommend using some kind of 2FA for all Tailscale connections.
#### [How can I know I configured the cipher suites correctly?](#how-can-i-know-i-configured-the-cipher-suites-correctly)
Most VPNs, including IPsec and anything using TLS, have a huge selection of ciphers, hashes, HMACs, and so on to choose from. Typically it requires expert advice to make the right choice, and the expert advice changes over time.
WireGuard has only one cipher suite, chosen by some of the top cryptographers in the field to be both fast and secure. Tailscale uses WireGuard for its connections, so it uses the same cipher suite. There is no need to configure it.
#### [Can it provide user- and role-based access control (RBAC)?](#can-it-provide-user-and-role-based-access-control-rbac)
Most VPNs and remote access products are considered separate from firewall products (unless you happen to buy a VPN that’s part of your firewall device). This is unfortunate, because it means adding a remote access user has at least two steps: creating their account, and granting their IP address access through the firewall.
Plain WireGuard works like other VPNs in this way; it has a simple list of which IP subnets are owned by each node, but that’s all.
In Tailscale these steps are combined through [central ACL policies](https://tailscale.com/kb/1018/acls). You configure a policy that describes which user accounts and groups are allowed to access which servers and ports, and these policies are distributed automatically to each node for enforcement.
#### [Can an attacker port scan to find my VPN server?](#can-an-attacker-port-scan-to-find-my-vpn-server)
Most VPNs require a public-facing port to be open in order to receive incoming requests. This port can usually be port scanned en masse, giving attackers a weak spot to focus their attacks. This is especially dangerous with TCP-based VPNs, especially SSL VPNs or public-facing ssh or RDP ports, which have often been known to contain security vulnerabilities.
WireGuard defends against port scanning attacks by refusing to answer any request that doesn’t come from the right private key. An attacker who doesn’t already know a valid private key, cannot elicit a response from any port. This makes port scanning virtually impossible.
Tailscale takes it one step further: we recommend not opening up any firewall ports at all. Instead, both ends of a Tailscale link make outgoing connections to each other (“NAT hole punching”) that only each other can see. An attacker doing a port scan will see no openings at all, because the firewall is not open to them at all.
#### [Do I have to manage certificates or run a CA?](#do-i-have-to-manage-certificates-or-run-a-ca)
Some VPNs use client certificates for authentication. Client certificates can be very secure, but in order to work, you need to operate a certificate authority (CA) that generates, signs, and distributes these certificates. That’s a lot of work.
WireGuard simplifies the process significantly by using simple public keys instead of old-style X.509 certificates. However, you still need to generate, authorize, and distribute keys.
Tailscale’s central coordination server handles the key generation and distribution process, validating and authorizing keys when a user logs into your identity provider. Keys and certificates are managed, but completely behind the scenes so users never have to care about keys.
#### [Can I configure security policies centrally or is each node separate?](#can-i-configure-security-policies-centrally-or-is-each-node-separate)
When configuring multipoint, peer-to-peer, or mesh networks, normally you have to configure the security policy on each node separately (eg. using iptables).
With Tailscale, there is a central [ACL security policy](https://tailscale.com/kb/1018/acls) that is compiled into a packet filter and distributed to all your nodes for enforcement, within hundreds of milliseconds of making the change.
### [Enterprise needs](#enterprise-needs)
#### [Is there an audit trail? Can it work with an IDS or SIEM?](#is-there-an-audit-trail-can-it-work-with-an-ids-or-siem)
In a traditional hub-and-spoke network, all traffic passes through the hub, which makes it easy to add a bypass for audit trails, intrusion detection systems (IDS), and security information and event management (SIEM) systems.
Point-to-point networks have major scalability and latency advantages, but when there is no central relay, it’s less obvious how to plug into auditing and compliance.
In enterprise deployments, Tailscale nodes can be configured to relay packet headers to a central set of servers for auditing and tracking. Because every Tailscale connection passes through two nodes (client and server), the two streams can both be logged and checked for inconsistencies, which prevents tampering with the logs.
#### [Machine certs: can I allow only corp-authorized machines to join?](#machine-certs-can-i-allow-only-corp-authorized-machines-to-join)
When a VPN allows traditional forms of authentication (username+password, PSKs, or oauth2/SAML), it’s relatively easy to add 2-factor auth (2FA), but it’s hard to control which devices a user is allowed to connect from. The risk is that an employee could use their highly secure 2FA token to log into the corporate network from a malware-infested unpatched Windows XP system, and nobody could stop them, and the malware could do the rest.
The way to prevent this is by installing a special “machine certificate” in the browser on each authorized machine. The machine certificate is combined with the user’s login credentials, and as a pair, they authorize a user to access the network.
Unfortunately, managing and installing machine certificates can be a lot of work, and is hard to integrate with apps for authentication. When machine certificates are enabled, Tailscale automates this process, generating a machine keypair the first time a user successfully logs into a machine. Then an admin can manually approve the machine, or write scripts that auto-approve machines based on set criteria (such as operating systems and installed virus scanners).
#### [Does it require software to be installed on user devices?](#does-it-require-software-to-be-installed-on-user-devices)
Some VPN software (often PPTP and L2TP) work with software that comes with common operating systems. Other products, like BeyondCorp-style proxies and SSL VPNs, can run entirely inside an already-installed web browser. It’s convenient to make the network accessible without needing to install special software on each user machine.
Unfortunately, there is a downside to these no-software-install methods. They usually leave no way to properly enforce machine certificates (see previous section), which means employees can improperly access sensitive corporate resources from insecure machines.
Tailscale currently requires its software to be installed on user devices, if users will access the network remotely. For user devices inside an office, you can use a [subnet router](https://tailscale.com/kb/1019/subnets) instead.
#### [Can I route all a user’s Internet traffic through a central node?](#can-i-route-all-a-users-internet-traffic-through-a-central-node)
The default behavior of many hub-and-spoke VPNs is to capture all traffic and send it through the hub. As a side effect, they also protect end user Internet browsing traffic from hostile local networks (such as cafe Wi-Fi), even when that traffic is using unencrypted HTTP. On the other hand, sending remote employee Internet traffic through the corporate firewall creates a bottleneck at the corporate network, creates latency for the end user, and may encourage users to turn the VPN on and off depending on their activity, which is tedious.
Tailscale is intended to be turned on all the time. As a result, it avoids capturing Internet-facing browser traffic. Instead, it captures traffic to individual corporate IP addresses and internal subnets, but leaves the rest alone.
There is a feature which can be enabled to [route all traffic through an exit node](https://tailscale.com/kb/1103/exit-nodes), in order to protect against hostile local networks and occasionally for regulatory compliance reasons.
#### [Can I deploy the system completely on-premises?](#can-i-deploy-the-system-completely-on-premises)
Traditional corporate VPNs have a VPN concentrator which must be deployed on premises. A newer kind of consumer product, also called a “VPN,” captures your Internet traffic and relays it through a vendor’s remote servers, where it is decrypted and forwarded onward to the Internet.
WireGuard can be used, and has been used, in both kinds of network.
When people hear that Tailscale does not require an on-premises VPN server (instead, you can just install the Tailscale software on multiple nodes and they can all connect to each other), they sometimes assume that Tailscale is the second type of service — the kind with remote cloud servers that see all your traffic. But this is not the case. Unlike VPN services where both the data plane and the control plane are hosted, as we describe in [How Tailscale Works](https://tailscale.com/blog/how-tailscale-works/), only a small amount of control plane traffic goes through Tailscale’s servers. After that, the data is sent point-to-point between your own nodes, and never seen by Tailscale-operated machines.
There is one exception: if Tailscale nodes are behind highly restrictive NATs, so a peer-to-peer connection cannot be established, Tailscale falls back to using our network of relay servers (called DERP). However, these relay servers only ever see encrypted packets; the decryption keys never leave your own nodes themselves. DERP forwarding is therefore comparable to the forwarding done by any backbone Internet router.
Because of this, there is little need to install any “on-prem” Tailscale servers, other than your nodes. The exceptions are Tailscale’s control plane which includes the Tailscale coordination server (used for key exchange), and the Tailscale diagnostics servers (used for logging, etc).
### [Company](#company)
#### [Is there a company that I can count on?](#is-there-a-company-that-i-can-count-on)
When considering a VPN product, it’s important to consider where the product comes from, who will support it, and how trustworthy they are. Some very popular VPN products are purely open source and technically excellent, but leave you at the mercy of a developer who might decide to quit maintaining the product and go work on something else.
WireGuard is an excellent open source product with a small number of developers. Although the core development team is very small, there are now several companies whose livelihood depends on WireGuard continuing to be maintained. It has been officially merged into the Linux kernel. This suggests it will be around for a long time, and there will be multiple companies able to provide long-term support.
Tailscale is a relatively new (founded March 2019) and fast-growing company. The WireGuard product it relies on is solid, but you might have concerns about the Tailscale portions. We will have to earn our users’ trust over time. We have now [raised $15M USD total in our seed round and Series A](https://www.finsmes.com/2020/11/tailscale-raises-12m-in-series-a-funding.html) and have some [customer testimonials and press articles](https://tailscale.com/customers).
#### [Is the product still in a growth phase?](#is-the-product-still-in-a-growth-phase)
There have been a few really excellent VPN products in the past, which Tailscale has been pleased to be compared to. Unfortunately, some of these products were acquired by larger companies and eventually put on life support. When a product is no longer growing in usage or customer base, it’s only a matter of time before it becomes obsolete.
Tailscale is still in a heavy growth phase, and is based on the latest WireGuard technology, which is increasingly accepted as the future of VPN technology. This should give some confidence that the technology will be future proof, and the company will be around for a long time.
## Try Tailscale for free
[
Get started
](https://login.tailscale.com/start)
Schedule a demo
[
Contact sales
](/contact/sales)