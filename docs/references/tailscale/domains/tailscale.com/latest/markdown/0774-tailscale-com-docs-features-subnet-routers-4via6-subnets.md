4via6 subnet routers · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# 4via6 subnet routers
Last validated: Feb 2, 2026
In a large network, you may have existing subnets with overlapping IPv4 addresses. If there are two entirely separate virtual private clouds (VPCs) using the identical set of IP addresses and each has their own subnet router, Tailscale considers those two subnet routers as an [overlapping subnet router pair](/docs/how-to/set-up-high-availability). For example, when a Tailscale node tries to connect to `10.0.0.5`, its traffic will direct to whichever `10.0.0.5` device happens to be behind the primary subnet router of the failover pair at that moment.
The 4via6 ("4 via 6") subnet router feature provides an unambiguous, unique IPv6 address for each overlapping subnet, so a Tailscale node's traffic is routed to the correct device.
This feature is available for [the Personal, Premium, and Enterprise plans](/pricing).
This feature is useful when:
* A network contains subnets with overlapping IP or CIDR ranges
* Cloud resources or SaaS apps are rolled out to a network that contains subnets with overlapping IP or CIDR ranges
* A partner or contractor network contains subnets with IP or CIDR ranges that overlap those of an organization that would like to share access
## [How it works](#how-it-works)
When you use this feature, your subnet router advertises an IPv6 subnet (using a Tailscale-specific address) that maps to the desired IPv4 subnet. Devices connecting to the IPv6 subnet router will have the IPv6 packets rewritten by Tailscale for IPv4, so the IPv4 addresses do not need to be changed.
The Tailscale-specific IPv6 subnet address is of the form:
`fd7a:115c:a1e0:b1a:0:XXXX:YYYY:YYYY`
where:
* `fd7a:115c:a1e0:b1a` is the 64-bit fixed prefix used for Tailscale 4via6-routed packets.
* `0:XXXX` is the 32-bit translator identifier. The site ID is the location that the IPv6 packets should arrive at before being translated to IPv4. Only the lower 16 bits may be used to specify a site ID—allowed values are 0 to 65535 inclusive. You choose which site IDs to assign to your subnet routes. For example, you might want to use `1` for your first subnet route, so the translator identifier would be `0:1`. A site ID of `0` is valid, but note the resulting IPv6 address, while allowed, would have an empty string for the translator identifier: `fd7a:115c:a1e0:b1a**::**YYYY:YYYY`.
* `YYYY:YYYY` is the IPv4 address represented as 16 bit hex numbers.
For example, this would be the IPv6 subnet route for a site with ID `7` and IPv4 subnet address range `10.1.1.0/24` (which is represented as `a01:100/120` in 16 bit hex):
Tailscale uses the IPv6 subnet address to route your tailnet traffic to the appropriate IPv4 destination.
The [Tailscale CLI](/docs/reference/tailscale-cli) provides the `tailscale debug via` command to help you create the IPv6 subnet route.
In versions of Tailscale prior to 1.58, only 4via6 addresses with site IDs from
0-255 (inclusive) could be advertised. This restriction only applies to
advertising a 4via6 subnet; versions of Tailscale prior to 1.58 will be able to
access 4via6 subnets with larger site IDs even if they cannot advertise those
subnets.
## [Setting up overlapping subnet routers](#setting-up-overlapping-subnet-routers)
### [Step 1: Generate the IPv6 subnet route](#step-1-generate-the-ipv6-subnet-route)
Generate the IPv6 subnet route for your IPv4 subnet by running the Tailscale CLI command `tailscale debug via` with arguments for the site ID and IPv4 route. This example generates the IPv6 subnet route for a subnet with site ID `7` and IPv4 route `10.1.1.0/24`.
```
`tailscale debug via 7 10.1.1.0/24
`
```
The resulting IPv6 subnet route is:
`fd7a:115c:a1e0:b1a:0:7:a01:100/120`
### [Step 2: Advertise the IPv6 subnet route](#step-2-advertise-the-ipv6-subnet-route)
Follow the steps for [setting up a subnet router](/docs/features/subnet-routers#set-up-a-subnet-router). However, when you advertise the route, use the IPv6 route that you created in Step 1 above. For example:
```
`# Update to use the values for your subnet
tailscale set --advertise-routes=fd7a:115c:a1e0:b1a:0:7:a01:100/120
`
```
Now a device in your tailnet can connect to distinct overlapping subnets with the same IPv4 addresses.
You can advertise both IPv4 and IPv6 subnet routes in the same subnet router.
Note that if you expose the same IPv6 routes (that is, the same IPv4 routes with the same site ID) from multiple subnet routers, you are using [high availability](/docs/how-to/set-up-high-availability).
## [MagicDNS name for the IPv4 subnet devices](#magicdns-name-for-the-ipv4-subnet-devices)
If you have enabled [MagicDNS](/docs/features/magicdns), you can use an automatically-created MagicDNS name to access devices in the overlapped subnets that you advertised. This name is of the form:
`Q-R-S-T-via-X`
where:
* `Q-R-S-T` is the IPv4 address of the device
* `X` is the site ID of the subnet router used when you created the [Tailscale-specific IPv6 address](#4via6-address-format)
For example, if IP address `10.1.1.16` is in the subnet you advertised by using `10.1.1.0/24` with site ID of 7, you can access it from your tailnet with the name `10-1-1-16-via-7`.
## [High availability with 4via6 subnet routers](#high-availability-with-4via6-subnet-routers)
[High availability](/docs/how-to/set-up-high-availability) is supported for 4via6 subnet routers.
Let's say your tailnet has two separate VPCs, both using `172.16.0.0/16` as the subnet route. The subnet ranges overlap, so to prevent conflicts you use the 4via6 subnet router feature to create two 4via6 subnets routers. For this example, use site ID 1 for the first VPC and site ID 2 for the second VPC. To add subnet failover for the first VPC, advertise the route from another node that is attached to the first VPC as a 4via6 subnet router with ID 1 and the same `172.16.0.0/16` route. Tailscale will treat the two subnet routers with ID 1 as a subnet failover pair and pick one of them to be active. Similarly, you could create a subnet failover for the second VPC, by advertising an additional 4via6 subnet router with ID 2 and the `172.16.0.0/16` route on a node that is attached to the second VPC.
## [Access control rules](#access-control-rules)
When writing [access control](/docs/features/access-control) rules targeting resources behind a 4via6 subnet router, use the IPv6 CIDR or address as the destination, not the IPv4 address.
Use `tailscale debug via` to get the IPv6 CIDR.
## [Limitations](#limitations)
* A 4via6 subnet router requires Tailscale v1.24 or later. Other Tailscale clients that use the 4via6 subnet router to reach the remote devices can use older releases.
* Currently, only the IPv6 subnet address is shown in the admin console, not the IPv4 address that it maps to.
* A tailnet can have a maximum of 65,536 site IDs. For each site ID, you can have any number of IPv4 CIDRs mapped.
On this page
* [How it works](#how-it-works)
* [Setting up overlapping subnet routers](#setting-up-overlapping-subnet-routers)
* [Step 1: Generate the IPv6 subnet route](#step-1-generate-the-ipv6-subnet-route)
* [Step 2: Advertise the IPv6 subnet route](#step-2-advertise-the-ipv6-subnet-route)
* [MagicDNS name for the IPv4 subnet devices](#magicdns-name-for-the-ipv4-subnet-devices)
* [High availability with 4via6 subnet routers](#high-availability-with-4via6-subnet-routers)
* [Access control rules](#access-control-rules)
* [Limitations](#limitations)
Scroll to top