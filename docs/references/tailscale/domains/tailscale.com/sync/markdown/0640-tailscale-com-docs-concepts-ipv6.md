Tailscale IPv6 support · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Tailscale IPv6 support
Last validated: Jan 12, 2026
Internet Protocol version 6 (IPv6) is defined in [RFC8200](https://www.rfc-editor.org/rfc/rfc8200.html) and is the latest version of the Internet Protocol and the successor to IPv4. Tailscale supports both IPv4 and IPv6 and even facilitates connections between IPv4-only devices and IPv6-only devices using DERP servers.
## [Private and public IPv6 addresses](#private-and-public-ipv6-addresses)
Similar to IPv4 addresses, there are two types of IPv6 addresses: private IPv6 addresses and public IPv6 addresses.
Private IPv6 refers to the internal IPv6 addresses used within your Tailscale network (known as a [tailnet](/docs/concepts/tailnet)). These addresses are not exposed to the public internet. Tailscale assigns every device in your tailnet a private IPv6 address from the `fd7a:115c:a1e0::/48` [unique local prefix](https://en.wikipedia.org/wiki/Unique_local_address). This prefix is part of Tailscale's [reserved IP addresses](/docs/reference/reserved-ip-addresses). As a result, IPv6 connectivity always works within your tailnet, even if your internet service provider (ISP) doesn't support IPv6. In [userspace networking mode](/docs/concepts/userspace-networking), Tailscale emulates IPv6 support. This ensures IPv6 functionality even on devices that don't natively support it.
Public IPv6 refers to using IPv6 addresses provided by internet service providers (ISPs) for communication over the public internet. Tailscale can use public IPv6 addresses from a device's ISP when negotiating connections between devices, but only if both devices have public IPv6 addresses.
[Exit nodes](/docs/features/exit-nodes) fully support IPv6. This means you can route traffic through an IPv6-supporting exit node even if your ISP doesn't provide IPv6 connectivity.
## [IPv4 interoperability](#ipv4-interoperability)
Tailscale's [DERP servers](/docs/reference/derp-servers) can facilitate connections between IPv6-only and IPv4-only devices when direct connections aren't possible. For direct connections where one device lacks an IPv6 address, Tailscale defaults to using an IPv4 connection. The following table shows the IP address type two devices use given different conditions.
|**Device A**|**Device B**|**Connection**|
|IPv6-only|IPv4-only|[Relayed connection](/docs/reference/derp-servers)|
|IPv4 and IPv6|IPv4-only|IPv4|
|IPv4 and IPv6|IPv6-only|IPv6|
|IPv4-only|IPv4-only|IPv4|
|IPv6-only|IPv6-only|IPv6|
IPv6 can improve [network address translation (NAT) traversal](/blog/how-nat-traversal-works) efficiency or eliminate the need for it entirely. However, Tailscale functions effectively over IPv4 when public IPv6 isn't available on both ends.
For more information about IPv4 and IPv6, refer to the [IPv4 vs. IPv6 FAQ](/docs/reference/faq/ipv6).
On this page
* [Private and public IPv6 addresses](#private-and-public-ipv6-addresses)
* [IPv4 interoperability](#ipv4-interoperability)
Scroll to top