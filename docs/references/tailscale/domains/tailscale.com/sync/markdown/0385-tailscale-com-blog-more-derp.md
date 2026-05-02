Now with more DERP
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|September 19, 2022
# Now with more DERP
Tailscale clients make [direct connections](/blog/how-tailscale-works/#encrypted-tcp-relays-derp) to each other, *[almost all the time](/blog/how-nat-traversal-works/)*. To do that, they need reliable communication infrastructure to determine how to connect (using [DISCO](https://github.com/tailscale/tailscale/blob/main/disco/disco.go) packets), and a communication path of last resort to use when the local network on one or both ends is hostile enough that direct connections are not feasible. Tailscale runs a global network of DERP relay servers to cover both of these needs.
**This week, we added nine additional DERP locations to complement our existing relay network.** By operating in more locations globally, your devices are more likely to be closer to a server. That means you can more quickly and easily establish network connections. And, if your connection goes through a closer relay, it’ll likely be faster.
### New locations
We added DERP sites in nine new locations:
* Amsterdam
* Denver
* Hong Kong
* Johannesburg
* Los Angeles
* Madrid
* Miami
* Paris
* Toronto
Map of Tailscale’s DERP server locations.
You can use [`tailscale ping` to see if a given connection uses DERP](/kb/1023/troubleshooting/#how-do-i-know-if-my-traffic-is-being-routed-through-derp). To find the closest DERP server to a device, look at the list of Relays on the device details page in the [admin console](https://login.tailscale.com/admin/machines) or run `tailscale netcheck --verbose`.
Adding new servers in regions with a high density of users reduces the load on existing servers — but we also embiggened the existing servers. This should improve throughput for all users that rely on DERP servers. Tailscale will also continue to add more DERP locations to reduce latency for discovery and relayed connections.
Share
Authors
David Crawshaw
Denton Gentry
Authors
David Crawshaw
Denton Gentry
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