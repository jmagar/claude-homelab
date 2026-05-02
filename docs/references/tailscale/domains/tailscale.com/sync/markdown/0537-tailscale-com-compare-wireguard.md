WireGuard® vs. Tailscale | Which is Better for You?
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Go back](/compare#vpn-comparisons)
[Compare](/compare)
WireGuard
# WireGuard® vs. Tailscale | Which VPN Alternative is Better for You?
On this page
[
Use Tailscale
](https://login.tailscale.com/start)[
Contact Sales
](/contact/sales)
Should I use Tailscale or WireGuard® to secure my network? The answer is yes!
Tailscale is built on top of WireGuard; we think very highly of it.
We designed Tailscale to make it easier to use WireGuard to secure your network connections. You might decide to use WireGuard directly, without Tailscale. This is a guide to using Tailscale vs. configuring and running WireGuard directly.
### [Configuration](#configuration)
WireGuard is typically configured using the [wg-quick](https://manpages.debian.org/unstable/wireguard-tools/wg-quick.8.en.html) tool. To connect two devices, you install WireGuard on each device, generate keys for each device, and then write a text configuration for each device. The configuration includes information about the device (port to listen on, private IP address, private key) and information about the peer device (public key, endpoint where the peer device can be reached, private IPs associated with the peer device). It’s straightforward, particularly for a VPN. Every pair of devices requires a configuration entry, so the total number of configuration entries grows quadratically in the number of devices if they are fully connected to each other.
To connect devices using Tailscale, you install and log in to Tailscale on each device. Tailscale manages key distribution and all configurations for you. This can be particularly useful if some of the devices belong to non-technical users.
### [Connectivity](#connectivity)
WireGuard ensures that all traffic flowing between two devices is secure. It does not ensure that those devices can connect; that is up to you. WireGuard has a persistent keepalive option, which can keep the tunnel open through NAT devices. But in some cases to ensure that your devices can communicate, you may need to open a hole in your firewall or configure port forwarding on your router. WireGuard can detect and adapt to changing IP addresses as long as a connection remains open and both ends do not change addresses simultaneously. Establishing a connection or re-establishing a broken connection requires updating configuration files.
Tailscale takes care of on-demand [NAT traversal](https://tailscale.com/blog/how-nat-traversal-works/) so that devices can talk to each other directly in most circumstances, without manual configuration. When NAT traversal fails, Tailscale [relays encrypted traffic](https://tailscale.com/blog/how-tailscale-works#DERP), so that devices can always talk to each other, albeit with higher latency in that case. There is no need to modify firewalls or routers; any devices that can reach the internet can reach each other. (Tailscale traffic between two devices on the same LAN does not leave that LAN.)
### [Security](#security)
Tailscale and WireGuard offer identical point-to-point traffic encryption.
Using Tailscale introduces a dependency on Tailscale’s security. Using WireGuard directly does not. It is important to note that a device’s private key never leaves the device and thus Tailscale cannot decrypt network traffic. Our client code is open source, so you can confirm that yourself.
All plans, including [Starter and Premium plans](https://tailscale.com/pricing/), add an ACL layer on top of WireGuard, so that you can further control network traffic. You can do some of this directly with WireGuard by not setting up tunnels between devices that should not communicate or by using the operating system firewall to control traffic flow. Tailscale ACLs allow you to express ACLs for everything in a single place using users, groups, and tags, which are easier to maintain than a list of which device pairs may communicate
Even without the Team or Business plan, Tailscale offers some basic, unidirectional ACL controls. For example, any node may turn on [“Shields Up” mode](https://tailscale.com/kb/1072/client-preferences/), which prevents all incoming connections.
### [Performance](#performance)
Using WireGuard directly offers better performance than using Tailscale. Tailscale does more than WireGuard, so that will always be true. We aim to minimize that gap, and Tailscale generally offers good bandwidth and excellent latency, particularly compared to non-WireGuard VPNs.
The most significant performance difference is on Linux. On Linux, WireGuard is available as a kernel module. Tailscale currently uses the userspace WireGuard implementation, which has more overhead.
The most common scenario in which Tailscale users notice bandwidth or latency issues is when Tailscale is relaying network traffic, which is unavoidably slower. In that case, the devices would be unable to connect at all using WireGuard directly, so no direct comparison is available.
### [Bonus features](#bonus-features)
By design, WireGuard provides secure point to point communication. It is intended to be a building block.
Tailscale has a broader set of features. For example, we offer MagicDNS to make it easier to reach other devices on your VPN. We have out of the box support for subnet routing to allow employees access to an office network via an exit node running Tailscale. And more features are in the works.
### [IT/network administration](#itnetwork-administration)
When using WireGuard directly, you may use any tools desired to administer your network. There is an active community that can answer questions on IRC or a mailing list.
Tailscale’s focus on convenience makes many IT requests self-service. Tailscale has an admin console on our website. As of Dec 2020, Tailscale’s admin API is in beta and available by request. Tailscale offers community support for our free pricing tiers and direct support for all paid plans.
### [The bottom line](#the-bottom-line)
We suspect that using WireGuard directly will be most appealing if you have a small, stable number of Linux servers whose connections you want to secure. Using Tailscale will make the most sense if you want things to Just Work, you are administering a VPN for many different users, or if you want the extra features or centralized ACLs Tailscale offers.
But everyone’s network and needs are different. And we’ve helped debug a lot of networks; when we say everyone’s network is different, we know whereof we speak, and we mean it!
Using WireGuard directly is a very reasonable choice, and if you’re thinking about doing it, we encourage you to [give it a try](https://www.wireguard.com/quickstart/). If you later decide that you want the convenience and extra features that Tailscale offers, it’s easy to switch.
## Try Tailscale for free
[
Get started
](https://login.tailscale.com/start)
Schedule a demo
[
Contact sales
](/contact/sales)