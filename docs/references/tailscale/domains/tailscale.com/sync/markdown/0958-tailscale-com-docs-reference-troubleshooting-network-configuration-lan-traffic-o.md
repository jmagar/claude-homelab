Troubleshoot LAN traffic prioritization issues with overlapping subnet routes · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Troubleshoot LAN traffic prioritization issues with overlapping subnet routes
Last validated: Mar 16, 2026
You may have a LAN subnet that contains a mix of both Tailscale devices, and non-Tailscale devices that all must accept routes to communicate with a second subnet. In this condition routing can become asymmetric leading to new configuration challenges. To work around this challenge, there are different solutions depending on the operating system of the affected device.
Using the solutions described below on non-fixed network interfaces, such as Wi-Fi, on a laptop could lead to a situation where the device sends traffic to a public LAN network that was intended for the Tailscale network. We recommend that these solutions only be used where the network configurations of the subnets and devices that access them are well known and fixed.
On both Windows and macOS, routes are accepted by default. The operating system will prioritize routes with the longest prefix match, or in other words the most specific of all configured routes. A solution for overlapping subnet routers is therefore to adjust the Tailscale advertised route to be less specific than the LAN subnets that you wish to avoid routing conflicts with. If for example, you have a LAN subnet of `192.168.2.0/24` and you wish to avoid routing traffic to that subnet through Tailscale when devices are on this LAN segment, you can configure the subnet router to advertise a route of `192.168.2.0/23`.
On Linux, you must explicitly pass the `--accept-routes` flag to `tailscale up` to accept subnet routes from other devices in the tailnet. Tailscale on Linux uses a routing feature known as policy routing that introduces an additional layer of prioritization to routing.
Tailscale uses IP rules in the priority range of `5200` to `5500` to prioritize routes, at this time `5210`, `5230`, `5250`, and `5270`.
On OpenWRT systems detected as running mwan3, Tailscale rules are installed at a lower priority for compatibility reasons. On such systems, IP rules are installed with priorities ranging between `1300`—`1400` instead of `5200`—`5300`.
Install a rule ahead of the Tailscale rules that uses `lookup` to jump over them:
```
`ip rule add to 192.168.2.0/24 priority 2500 lookup main
`
```
The above command installs a rule that matches traffic destined for `192.168.2.0/24` in a rule with priority `2500` (a higher priority than the Tailscale rules). When matched, the rule jumps to the `main` routing table, which is the default routing table. This rule will therefore take precedence over the Tailscale rules, and use the regular LAN routes in the main routing table.
Note that this change is not persistent, and will need to be applied on boot. `systemd-networkd` users may look to the `RoutingPolicyRule` configuration option in `systemd.network(5)`. The configuration can also be applied in a "oneshot" service as described in `systemd.service(5)`.
Scroll to top