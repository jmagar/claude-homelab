How Tailscale assigns IP addresses · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# How Tailscale assigns IP addresses
Last validated: Jan 12, 2026
Tailscale makes it easy to connect to your Tailscale network (known as a tailnet) by providing you with a **stable IP address** for each node such as a device or a server. These addresses stay the same, no matter where nodes move to in the physical world, which means you can share them without worrying about them changing.
By default, every device receives an IP address in the [`100.x.y.z` range](/docs/concepts/tailscale-ip-addresses). This IP address is auto-assigned based on the device and authorization credentials. [Admins](/docs/reference/user-roles) can change the [IP address](/docs/reference/ip-pool) later.
## [Finding your Tailscale IP address](#finding-your-tailscale-ip-address)
[Tailscale admin console](/docs/concepts/ip-and-dns-addresses?tab=tailscale+admin+console)[Linux](/docs/concepts/ip-and-dns-addresses?tab=linux)[Windows](/docs/concepts/ip-and-dns-addresses?tab=windows)[macOS](/docs/concepts/ip-and-dns-addresses?tab=macos)[iOS](/docs/concepts/ip-and-dns-addresses?tab=ios)[Android](/docs/concepts/ip-and-dns-addresses?tab=android)
View the IP address for a device with the Tailscale admin console.
You must be an [Owner, Admin, Network admin, IT admin, Billing admin, or Auditor](/docs/reference/user-roles) of a tailnet to access the admin console.
1. Go to the [Machines](https://login.tailscale.com/admin/machines) page of the admin console.
2. Find the row corresponding to the device you are interested in. You can use the [search bar](/docs/features/access-control/device-management/how-to/filter#filter-with-the-search-bar) or [filters](/docs/features/access-control/device-management/how-to/filter) to find a device.
3. Under the **Addresses** column, select the dropdown icon and then select either the device's IPv6 address or IPv4 address to copy it to your clipboard.
## [Mapping machine names to IP addresses using DNS](#mapping-machine-names-to-ip-addresses-using-dns)
For information on this topic, refer to [How DNS works in Tailscale](/docs/reference/dns-in-tailscale).
## [Forcing an IP address to change](#forcing-an-ip-address-to-change)
A node's IP address will not change for as long as the node remains registered unless an [Admin](/docs/reference/user-roles) changes it.
A node gets a new IP address when it rejoins a tailnet if:
* It is removed from the tailnet, by selecting **Remove** in the [Machines](https://login.tailscale.com/admin/machines) page of the admin console
* The IP range is specified, or an individual IP address is manually changed using [IP pool](/docs/reference/ip-pool)
* Tailscale is [reset and reinstalled](/docs/features/client/uninstall) on the node
* The disk is wiped, and the node key is lost
## [Tailscale IPv6 local address prefix](#tailscale-ipv6-local-address-prefix)
Tailscale IPv6 addresses are assigned from the [unique local address](https://en.wikipedia.org/wiki/Unique_local_address) prefix of `fd7a:115c:a1e0::/48`. For a complete list of IPv4 and IPv6 addresses that Tailscale reserves, refer to [reserved IP addresses](/docs/reference/reserved-ip-addresses).
Previously IPv6 addresses were assigned from `fd7a:115c:a1e0:ab12::/64`.
On this page
* [Finding your Tailscale IP address](#finding-your-tailscale-ip-address)
* [Mapping machine names to IP addresses using DNS](#mapping-machine-names-to-ip-addresses-using-dns)
* [Forcing an IP address to change](#forcing-an-ip-address-to-change)
* [Tailscale IPv6 local address prefix](#tailscale-ipv6-local-address-prefix)
Scroll to top