Route traffic · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Route traffic
Last validated: Jun 3, 2025
Use Tailscale routing features to control how network traffic is routed to, from, and within your Tailscale network, known as a tailnet.
## [Access non-Tailscale devices](#access-non-tailscale-devices)
In cases where you can't install Tailscale on every device on your physical network, you can set up a *subnet router* to access these devices from your tailnet. Subnet routers respect features like [access control policies](/docs/features/access-control), which make it easy to migrate a large network to Tailscale without installing the Tailscale client on every device.
[
#### Subnet routers
Use subnet routers to give devices outside your local network access to services within specific subnets. Extend your private network with Tailscale.
](/docs/features/subnet-routers)
## [Route all internet traffic](#route-all-internet-traffic)
Routing internet traffic through an *exit node* is useful when accessing untrusted Wi-Fi in a cafe or using an online service (such as banking) only available in your home country from overseas.
Exit nodes route **all** your network traffic, which is often not what you want. To configure Tailscale to only route traffic to certain subnets (the more common configuration), read about [Accessing non-Tailscale devices from your network](#access-non-tailscale-devices) instead.
[
#### Exit nodes (route all traffic)
Route all internet traffic through a specific device on your network.
](/docs/features/exit-nodes)
[
#### Mullvad exit nodes
Use Mullvad VPN endpoints as exit nodes for your tailnet.
](/docs/features/exit-nodes/mullvad-exit-nodes)
## [Control access to third-party applications](#control-access-to-third-party-applications)
App connectors let you control device and user access to applications without any end-user setup. They let you manage and monitor access to both SaaS and self-hosted apps across your tailnet.
[
#### How app connectors work
Route SasS application traffic in your tailnet using app connectors.
](/docs/features/app-connectors)
## [Manage DNS](#manage-dns)
You can map Tailscale IP addresses to human-readable and memorable names using the Domain Name System (DNS). For example, instead of remembering which IP address maps to an internal expense report server hosted in your tailnet, you can use DNS to map the IP address to the server's name, like "Expenses".
[
#### DNS in Tailscale
Optimize your Tailscale network for DNS management, including custom DNS servers, for seamless access and better control.
](/docs/reference/dns-in-tailscale)
On this page
* [Access non-Tailscale devices](#access-non-tailscale-devices)
* [Route all internet traffic](#route-all-internet-traffic)
* [Control access to third-party applications](#control-access-to-third-party-applications)
* [Manage DNS](#manage-dns)
Scroll to top