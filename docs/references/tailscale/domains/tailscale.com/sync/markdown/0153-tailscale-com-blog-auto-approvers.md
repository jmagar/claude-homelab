Manage Routes & Exit Nodes with Tailscale Auto Approvers
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|February 23, 2022
# Introducing auto approvers for routes and exit nodes
You can use [subnet routers](/kb/1019/subnets/) in Tailscale to easily connect an existing network you have to your tailnet—for example, a virtual private cloud, or an on-premises legacy network. To set up a subnet router, you advertise routes from the device, and then approve these from the admin console. But what if you’re spinning up [multiple subnet routers in high-availability mode](/kb/1115/subnet-failover/)? Or multiple [exit nodes](/kb/1103/exit-nodes/)?
We’re introducing the concepts of [`autoApprovers`](/kb/1018/acls/#auto-approvers-for-routes-and-exit-nodes) for routes and exit nodes. This lets you specify in your [ACL file](/kb/1018/acls/) which users can self-approve routes and exit nodes. This means that you can set up a subnet router or an exit node with just one CLI command on the device.
### Subnet routers let you connect existing private networks
[Subnet routers](/kb/1019/subnets/) are a handy way to incrementally deploy Tailscale to a private network that you already have. If you’re trying to connect these devices to your tailnet, without installing Tailscale on every device, you can do so by running a subnet router in the same local area network, and advertising the routes of the other devices on the network.
Although subnet routers make deployment easier, whether for VPC peering or devices that can’t run external software, they should only be used for trusted networks. WireGuard connections established by Tailscale from the source device terminate on the subnet routers, which then forwards the traffic to the appropriate destination device. This requires you to *fully* trust the connection between the subnet router and the destination device behind it, instead of using Tailscale to encrypt the connection end to end. If you’re trying to implement a zero-trust network, we encourage you to install Tailscale directly on devices wherever possible, for better performance, security, and a zero-configuration setup.
Subnet routers can also be run in a [high-availability mode](/kb/1115/subnet-failover/), so that when one falls over the other router can handle the traffic.
### Automatically approve advertised routes with route auto approvers
To set up a subnet router, install Tailscale on the device, enable IP forwarding, and then run `tailscale up --advertise-routes`. You then need an admin with access to the [machines view in the admin console](https://login.tailscale.com/admin/machines) to review and approve the route settings. If you’re setting up many subnet routers, this can be cumbersome.
`autoApprovers` allows you to delegate who can advertise routes or exit nodes. In this case, rather than requiring approval after the fact, a user who is specified in a route’s `autoApprovers` can advertise that route (or a subset of it) on any device, without requiring further approval. This lets you easily set up multiple subnet routers at once, or move devices in your network.
And that’s not all—you can do the same for exit nodes with `autoApprovers`. This allows nodes authenticated by a user specified in `autoApprovers` for exit nodes to be auto-approved.
To start using `autoApprovers`, [add them to your ACL file](/kb/1018/acls/#auto-approvers-for-routes-and-exit-nodes) in the admin console.
Share
Author
Maisem Ali
Author
Maisem Ali
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