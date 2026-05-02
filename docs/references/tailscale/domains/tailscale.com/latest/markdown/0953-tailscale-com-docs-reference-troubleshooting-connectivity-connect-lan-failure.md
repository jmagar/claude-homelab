Can't connect to local area network · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Can't connect to local area network
Last validated: Nov 14, 2025
Use the following instructions to help you determine why you can't establish connection to another device on your local area network (LAN).
1. **Ensure there aren't any traditional problems interfering with a local connection**.
There are many reasons why devices on the same local area network might be unable to connect. For example, firewall rules, IP address conflicts, network misconfiguration, and DHCP errors can prevent connections between LAN devices.
To test the local connection in isolation, disconnect from Tailscale, then try to connect to the LAN device again.
2. **Check if you can connect using the device's [Tailscale IP address](/docs/concepts/tailscale-ip-addresses) (instead of its private IP address)**.
If the device runs Tailscale and you have a [subnet router](/docs/features/subnet-routers) that advertises your LAN, then your device and other LAN devices have two ways to reach each other. Tailscale typically configures the routing table to prefer the subnet router (if accepting subnet routes is enabled).
The Tailscale client drops packets with unexpected source IP addresses (in this example, the device's LAN IP address instead of the device's [Tailscale IP address](/docs/concepts/tailscale-ip-addresses)). If the subnet router runs Linux and has SNAT disabled (it can not be disabled on other operating systems), this can lead to a situation where your device's connection attempts successfully reach the LAN device, but it will be unable to respond.
If you do not need a device to use subnet routes, you can disable them by passing `--accept-routes=false` to the [`tailscale up`](/docs/reference/tailscale-cli/up) or [`tailscale set`](/docs/reference/tailscale-cli#set) commands or by disabling the subnets option in the Tailscale client (if applicable).
For more information, refer to [LAN traffic prioritization with overlapping subnet routes](/docs/reference/troubleshooting/network-configuration/lan-traffic-overlapping-subnets).
3. **Ensure the device isn't using an exit node with a configuration that prevents it from connecting to a local device**.
If the device uses an [exit node](/docs/features/exit-nodes), it might not be able to access the private IP of the LAN device because the LAN is untrusted by default when using an exit node. You can resolve this with either of the following methods:
1. Pass `--exit-node-allow-lan-access=true` to the [`tailscale up`](/docs/reference/tailscale-cli/up) or [`tailscale set`](/docs/reference/tailscale-cli#set) commands.
2. Enable the **Exit Node LAN access** option in the Tailscale client (if applicable). This lets the device send LAN connections directly.
Only enable LAN access if you trust the local network. For example, you might trust your home network, but not a public access Wi-Fi at a coffee shop.
Scroll to top