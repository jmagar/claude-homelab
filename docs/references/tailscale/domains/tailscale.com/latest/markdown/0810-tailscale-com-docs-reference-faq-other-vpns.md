Can I use Tailscale alongside other VPNs? · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Can I use Tailscale alongside other VPNs?
Last validated: Jan 12, 2026
It's theoretically possible to use Tailscale alongside other virtual private networks (VPNs). By default, Tailscale only routes a small subset of your internet traffic (using [Tailscale IP addresses](/docs/concepts/tailscale-ip-addresses)), which leaves the rest of your internet traffic for other VPNs to manage. However, in most cases, you can't use Tailscale alongside other VPNs without a [workaround](#workarounds). Usually, this is due to aggressive firewall rules, device limitations, or IP address conflicts.
* **Aggressive firewall rules**: Most VPNs set aggressive firewall rules to ensure all network traffic goes through them. This can result in the other VPN dropping all Tailscale traffic, which only Tailscale knows how to route. VPNs that don't use aggressive firewall rules might be able to run alongside Tailscale.
* **Device limitations**: Not all devices support using multiple VPNs simultaneously. For example, iOS and Android enforce a limit of running only one VPN at a time. As a result, it is not possible to have more than one active VPN on these platforms.
* **IP address conflicts**: If the other VPN uses IP addresses from the Carrier-Grade NAT (CGNAT) range (`100.64.0.0` through `100.127.255.255`) that Tailscale uses, they will conflict with `100.x.y.z` Tailscale IP addresses. For more information about Tailscale's IP addressing, refer to [reserved IP addresses](/docs/reference/reserved-ip-addresses).
## [Workarounds](#workarounds)
Before pursuing workarounds, determine if features like [Mullvad exit nodes (beta)](/docs/features/exit-nodes/mullvad-exit-nodes) meet your needs.
If you must run Tailscale alongside another VPN and encounter an incompatibility, you might be able to resolve the incompatibility with a workaround, such as [userspace networking](#userspace-networking) mode or [split tunnels](#split-tunnels).
### [Userspace networking](#userspace-networking)
Tailscale can run in either kernel networking mode or [userspace networking mode](/docs/concepts/userspace-networking). In the default kernel networking mode, Tailscale creates a network interface, changes firewall rules, and assigns your device a [Tailscale IP addresses](/docs/concepts/tailscale-ip-addresses). Kernel networking mode can conflict with other VPNs that use the same address space.
You can configure Tailscale to use userspace networking mode instead to work around conflicts with [Tailscale IP addresses](/docs/concepts/tailscale-ip-addresses). In userspace networking mode, Tailscale exposes a SOCKS5 proxy to let you connect out to your Tailscale network (known as a tailnet). Tailscale then proxies any incoming connections to the same port on the localhost address (`127.0.0.1`).
The standard `ping` command doesn't work for tailnet destinations when Tailscale is running in userspace networking mode. Use [`tailscale ping`](/docs/reference/tailscale-cli#ping) instead.
### [Split tunnels](#split-tunnels)
Split tunnel (or [restricted nameservers](/docs/reference/dns-in-tailscale#restricted-nameservers)) is a DNS configuration that resolves DNS queries differently based on the query destination. For example, a split tunnel configuration might send DNS queries for public IP addresses to one nameserver but to another for private IP addresses.
Some VPN providers let you use a split tunnel DNS configuration to bypass traffic for specific applications or address ranges. If the other VPN supports split tunnel DNS, you can add a configuration to handle Tailscale IP addresses separately from the rest of your traffic. Tailscale IP addresses use the subnets `100.64.0.0/10` and `fd7a:115c:a1e0::/48`.
If you use [subnet routes](/docs/features/subnet-routers) in your tailnet, make sure to add those to the split tunnel configuration, too.
The split tunnel workaround does not work for devices using [exit nodes](/docs/features/exit-nodes). This is because when you use an exit node, Tailscale functions more like a traditional VPN and sets its own aggressive firewall rules to route all traffic to your exit node. Exit nodes only support one VPN at a time.
On this page
* [Workarounds](#workarounds)
* [Userspace networking](#userspace-networking)
* [Split tunnels](#split-tunnels)
Scroll to top