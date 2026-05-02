ZeroTier vs. Tailscale | Which VPN Alternative is Better for You?
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Go back](/compare#vpn-comparisons)
[Compare](/compare)
ZeroTier
# ZeroTier vs. Tailscale
On this page
[
Use Tailscale
](https://login.tailscale.com/start)[
Contact Sales
](/contact/sales)
As modern enterprises migrate to cloud-based services and remote work, fortified corporate walls are deteriorating, and so is the use for a traditional VPN. Network architects are embracing a new “[zero trust](https://tailscale.com/kb/1123/zero-trust/)” approach, which means physical networks cannot be trusted, and every device must always be end-to-end encrypted and authenticated.
People want to be able to connect to private resources from anywhere in a highly secure way, and this is where ZeroTier and Tailscale come in.
**ZeroTier** is a decentralized network virtualization platform. Their tagline is “decentralize until it hurts, then centralize until it works.” They offer a custom-made protocol that has 2 virtualization layers:
1. “Virtual Layer 1” (VL1) is the [peer-to-peer](https://tailscale.com/blog/how-nat-traversal-works/) network backbone which encrypts communications, ensures endpoint authentication, and verifies credentials using asymmetric keys.
2. “Virtual Layer 2” (VL2) is built on top of VL1 and leverages software-defined networking principles to function as a virtual extensible local area network (VX-LAN). VL2 is responsible for creating secure network boundaries, multicast, enforcing rules and capabilities-based security, and certificate-based access control. ZeroTier’s centralized component is a set of 12 root servers which are distributed across the globe in stable, fast locations. These intermediaries help forge peer-to-peer connections and make everything work.
ZeroTier’s hardware-agnostic technology works on most industrial, commercial, or personal devices. They run on Windows, macOS, Android, iOS, Linux, FreeBSD, and several network-attached storage (NAS) appliances. Their product is open source but subject to their Business Source License.
[Tailscale’s architecture](https://tailscale.com/blog/how-tailscale-works/), in contrast, uses a SaaS central coordination service which is invisible to end users. Nodes are authorized by logging into a [central identity system](https://tailscale.com/kb/1013/sso-providers/) such as Google, Microsoft AzureAD, or Okta. Instead of a custom protocol, Tailscale uses the standard WireGuard VPN protocol for its data transfer.
ZeroTier and Tailscale share a similar purpose, yet they have different underlying structures. Here, we’ll do a head-to-head comparison, outlining their unique strengths and differences.
### [Initial setup](#initial-setup)
**ZeroTier** is designed to be a “zero-configuration” technology. A user starts a ZeroTier node without having to write configuration files or provide the IP addresses of other nodes. ZeroTier’s Virtualization Layer 2 (VL2) acts as the configuration manager. New nodes can be added to a ZeroTier network by sharing a computer-generated secret code, which must be entered by the user at connection time.
**Tailscale** makes connecting devices straightforward: you simply install and log into Tailscale on each device using your organization’s [SSO identity provider](https://tailscale.com/kb/1013/sso-providers/). Tailscale manages key distribution, [key rotation](https://tailscale.com/blog/rotate-ssh-keys/), machine certificates, and all configurations for users, which is very useful if any of the devices on the network belong to non-technical users.
### [Connectivity](#connectivity)
**ZeroTier** peer-to-peer connections are reliable and fast, as they are low latency, direct communications. Like Tailscale, ZeroTier takes care of NAT traversal. ZeroTier’s root servers help individual nodes so that they can establish a peer-to-peer connection. If NAT traversal fails, ZeroTier’s root servers will continue to relay the communications, albeit with higher latency.
**WireGuard** normally requires one end of any connection to have a static IP address. However, **Tailscale** adds atop WireGuard a layer of on-demand NAT traversal so that devices can communicate directly, even through firewalls, without manual configuration. In case NAT traversal is not possible or UDP is blocked, Tailscale automatically relays encrypted traffic over TCP (HTTPS), so that devices can always communicate. It automatically switches WireGuard between these different transport mechanisms depending on network conditions.
### [Security](#security)
**ZeroTier** aims to be a “zero trust” networking solution. Packets are end-to-end encrypted and can’t be read by unauthorized parties. Every peer on VL1 possesses a globally unique 40-bit ZeroTier address, but, unlike IP addresses, these are opaque cryptographic identifiers that encode no routing information. ZeroTier uses modern 256-bit ECC, following best practices set out by the professional cryptographers that created it.
ZeroTier doesn’t support single sign-on (SSO) or multi-factor authentication (MFA) yet, as of May 2021. ZeroTier users must sign on using their private key, and they need to be approved on the control plane individually. Once authorized, the key for each device is trusted permanently, leaving no capacity for enforcing a key refresh or rotation period.
Tailscale also offers full end-to-end data encryption. A device’s private key never leaves the device, so Tailscale cannot decrypt network traffic. New nodes can be added to a Tailscale network by authorizing against your company’s SSO identity provider. The default configuration causes nodes to be expired from the Tailscale network unless they are re-authenticated periodically, which triggers key rotation. Optional device posture checking is also available, preventing devices from joining the network unless they are approved by company policy.
In Tailscale, administrators configure a central RBAC ACL policy so that network traffic can be precisely restricted. Although administrators can express access rules in one central policy, the policy is compiled into a set of packet filters, which are enforced by the individual nodes themselves, giving the security properties expected from a zero trust network.
Tailscale supports multi-factor authentication (MFA) through its identity provider integration.
### [Performance](#performance)
**ZeroTier** offers very low latency connections compared to traditional VPNs, once a peer-to-peer connection has been established. Existing bandwidth is used efficiently and users rarely face latency issues. Like Tailscale, the only case in which ZeroTier users would encounter latency issues would be when peer-to-peer connections are completely blocked and it has to fall back to relaying through external servers.
ZeroTier’s benchmark of version 1.2.3 [came in at 484 Mbit/sec](https://www.zerotier.com/blog/benchmarking-zerotier-vs-openvpn-and-linux-ipsec/).
**Tailscale’s** throughput is similar to ZeroTier’s in most environments. In theory, the WireGuard protocol used by Tailscale has somewhat less overhead and thus lower latency than ZeroTier’s protocol, but in practice the difference is rarely noticeable.
### [Network administration](#network-administration)
Both ZeroTier and Tailscale offer multiple pricing plans with several packages of features. These pricing plans are subject to change.
Both Tailscale and ZeroTier dashboards are web-based and allow users to monitor and reconfigure the network.
### [The bottom line](#the-bottom-line)
ZeroTier and Tailscale both offer peer-to-peer mesh VPN technologies. They use different protocols to offer a functionally similar service. ZeroTier’s protocol is custom, while Tailscale uses the industry-standard WireGuard protocol for its data plane. Both products offer NAT traversal, and encrypted peer-to-peer connections, and administration dashboards.
ZeroTier and Tailscale are both outstanding alternatives to the traditional VPN, and both have great potential use in modern corporate environments.
## Try Tailscale for free
[
Get started
](https://login.tailscale.com/start)
Schedule a demo
[
Contact sales
](/contact/sales)