Granular Network Policies with IP Sets and Route Filters in Tailscale
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|productJuly 08, 2024
# New options for granular network policy
Today we’re excited to announce two new configuration methods for how traffic flows throughout your tailnet. IP sets allow you to define granular networks in policies, so that designated users or devices can only access necessary parts of a subnet. Via introduces a powerful routing filter to appropriately route traffic across a global fleet of exit nodes, subnet routers, or app connectors.
## [What are IP sets?](#what-are-ip-sets)
IP sets allow multiple subnets, CIDRs, IP addresses, or hosts to be grouped into a single referenceable entity, enabling ACL policies to be applied to the `ipset` itself, rather than the individual hosts or subnets. IP sets can similarly be used to customize `autogroup:internet`, excluding some private or public subnets from global exit node access.
An IP set is an array with one or more transformative “add” and “remove” operations. Operations are evaluated in-order, and the resulting set of IPs and CIDRs is used in any ACL grants or rules in which the IP set is later referenced.
```
`// Seattle and Toronto networks are joined into a global corp net, excluding prod infrastructure
// Each office gets access to their local office network, and the global dev group gets access to all non-prod infrastructure, and devops gets acces to prod
"ipsets": {
"ipset:seattle": ["10.2.3.0/24"],
"ipset:toronto": ["10.2.6.0/24"],
"ipset:corp-net": [
"add ipset:seattle",
"add ipset:toronto",
"remove host:prod",
]
},
{
"grants": [{
"src": ["group:seattle"],
"dst": ["ipset:seattle"],
"ip" : ["\*"]
},{
"src": ["group:toronto"],
"dst": ["ipset:toronto"],
"ip" : ["\*"]
},{
"src": ["group:dev"],
"dst": ["ipset:corp-net"],
"ip" : ["\*"]
},{
"src": ["group:devops"],
"dst": ["host:prod"],
"ip" : ["22"]
}]
}
`
```
Customers can use IP sets to construct complex network topologies and grant granular access across the tailnet to groups of users.
## [Route filtering with Via](#route-filtering-with-via)
Via allows customers to specify which users or devices can use specific exit nodes, subnet routers, and app connectors, for target destinations on a grant-by-grant basis.
Route filters are useful when multiple subnet routers and app connectors advertise the same IP space, or when using multiple exit nodes across a tailnet. Administrators can configure each ACL grant for the target IP space to be accessible through specific sets of exit nodes, subnet routers, and app connectors.
Alongside this feature, we fixed a [longstanding issue](https://github.com/tailscale/tailscale/issues/1357) around filtering routes that were not withdrawn if a user did not have access to them. This means reliable network segmentation is even easier to achieve across the tailnet.
Below are a few examples of common use cases for route filtering in concert with IP sets.
### [Use an in-office router when device posture is not met](#use-an-in-office-router-when-device-posture-is-not-met)
You can use route filters to segment access to resources through different routers based on device posture management rules.
The following example demonstrates a scenario in which the engineering team (`group:eng`) can access a resource (`ipset:corp`) using any available router, but only if they comply with the `latestMac` posture (which ensures they are running the latest stable version of the Tailscale client for macOS). Anyone else (`autogroup:member`) can access the corp network resources using the designated office router (`tag:office-router`).
```
`"postures": {
"posture:latestMac": [
"node:os == 'macos'",
"node:osVersion == '13.4.0'",
"node:tsReleaseTrack == 'stable'",
]
},
"ipsets": {
"ipset:corp": ["10.0.0.0/24"]
},
"grants": [{
// Allow eng to reach the office network
// through any means as long as they
// are running a stable client.
// Omitting via is equivalent to `"via":["\*"]`
"src": ["group:eng"],
"srcPosture": ["posture:latestMac"],
"dst": ["ipset:corp"],
"ip": ["\*"]
},{
// Otherwise, allow everyone to use the
// designated router.
"src": ["autogroup:member"],
"dst": ["ipset:corp"],
"via": ["tag:office-router"],
"ip": ["\*"]
},]
`
```
Engineering can access the prod infrastructure directly, if their devices have the latest Mac software installed. Everybody else can access prod infrastructure via the in-office routers.### [Segment exit nodes to users for hybrid work](#segment-exit-nodes-to-users-for-hybrid-work)
Control user internet access based on geographical location or device status using exit nodes.
The following example demonstrates a scenario in which users can access internet resources through an exit node based on the user's home office location.
Users in the London (`group:lhr`) and Seattle (`group:sea`) offices can access internet resources using exit nodes near their home offices (or directly from their device when exit nodes are not selected). Users on the engineering team (`group:eng`) can access internet resources using any exit node on the tailnet (or directly from their device when exit nodes are not selected).
```
`"grants": [{
// Allow users in London to use exit nodes near them.
"src": ["group:lhr"],
"dst": ["autogroup:internet"],
"via": ["tag:exit-node-lhr"],
"ip": ["\*"]
},{
// Allow users in Seattle to use exit nodes near them.
"src": ["group:sea"],
"dst": ["autogroup:internet"],
"via": ["tag:exit-node-sea"],
"ip": ["\*"]
},{
// Allow eng to use all exit nodes (no via)
"src": ["group:eng"],
"dst": ["autogroup:internet"],
"ip": ["\*"]
}]
`
```
Seattle and London employees can access the internet from exit nodes in the Seattle and London office; Engineering can access from both exit nodes.## [Unlock the Full Potential of Tailscale’s Network Policies](#unlock-the-full-potential-of-tailscales-network-policies)
There’s a lot more you can do with the combination of IP sets and route filtering. Maximize your network segmentation and traffic routing with Tailscale’s granular policy options.
To learn more, read our knowledge base articles on [route filters](https://tailscale.com/kb/1378/via) or [IP sets](https://tailscale.com/kb/1387/ipsets).
If you’d like to share how you’ve gotten IP sets and route filtering working for you, connect with Tailscale on [Reddit](https://www.reddit.com/r/Tailscale/), [X](https://twitter.com/tailscale) or [Mastodon](https://hachyderm.io/@tailscale).
Share
Authors
Kabir Sikand
Maisem Ali
Adrian Dewhurst
Authors
Kabir Sikand
Maisem Ali
Adrian Dewhurst
Share
Loading...
## Try Tailscale for free
[
Get started
](https://login.tailscale.com/start)
Schedule a demo
[
Contact sales
](/contact/sales)