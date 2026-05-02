DERP servers · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# DERP servers
Last validated: Jan 21, 2026
[DERP (Designated Encrypted Relay for Packets) servers](/blog/how-tailscale-works#encrypted-tcp-relays-derp) manage device connections and [NAT traversal](/blog/how-nat-traversal-works). They serve two primary purposes:
1. Negotiating and establishing connections between tailnet devices (direct or relayed).
2. Serving as a fallback option [when a direct connection isn't possible](/docs/reference/device-connectivity) and a [peer relay server](/docs/features/peer-relay) isn't available.
Most connections between tailnet devices only use DERP servers to establish a direct connection to another tailnet device. But as a last resort, when other connection types aren't possible due to hard NAT, firewalls, or another reason, devices can communicate using a DERP server as a relay. DERP servers are dual-stack, meaning they support IPv4 and [IPv6](/docs/concepts/ipv6). As a result, they can facilitate connections between IPv4-only and IPv6-only devices.
## [Relayed connections using DERP servers](#relayed-connections-using-derp-servers)
DERP relayed connections are one of two types of relayed connections in Tailscale. The other type is [peer relay connections](/docs/features/peer-relay). Peer relay connections use other devices in your Tailscale network (known as a tailnet) to relay traffic instead of DERP servers.
When a [direct connection](/docs/reference/connection-types) isn't possible Tailscale first attempts to use any available peer relays in the tailnet. If there aren't any peer relays available, it then falls back to DERP servers. You must set up peer relays to use them; refer to [Tailscale Peer Relays](/docs/features/peer-relay) for more information.
Tailscale [encrypts](/docs/concepts/tailscale-encryption) all data sent between devices using a DERP relayed connection using [WireGuard](/docs/concepts/wireguard). Because Tailscale private keys never leave the local device that generated them, it's impossible for a DERP server to decrypt your traffic. A DERP server blindly forwards already-encrypted traffic from one device to another.
## [DERP server locations](#derp-server-locations)
Tailscale has DERP servers across multiple geographic regions to facilitate [high availability](/docs/how-to/set-up-high-availability) and low latency. Most regions have at least three DERP servers.
Each Tailscale client receives a [DERP map](https://login.tailscale.com/derpmap/default) from the Tailscale [coordination server](/docs/concepts/control-data-planes). This map describes all the DERP servers available to the client. The client selects a *home DERP server* based on latency information and reports its selection to the coordination server. The coordination server then shares each client's selection with the other clients across the tailnet.
Tailscale runs DERP servers in the following locations:
* Australia (Sydney)
* Brazil (São Paulo)
* Canada (Toronto)
* Finland (Helsinki)
* France (Paris)
* Germany (Frankfurt, Nuremberg)
* Hong Kong (Hong Kong)
* India (Bengaluru)
* Japan (Tokyo)
* Kenya (Nairobi)
* Netherlands (Amsterdam)
* Poland (Warsaw)
* Singapore (Singapore)
* South Africa (Johannesburg)
* Spain (Madrid)
* United Arab Emirates (Dubai)
* United Kingdom (London)
* United States (Ashburn, Chicago, Dallas, Denver, Honolulu, Los Angeles, Miami, New York City, San Francisco, and Seattle)
Tailscale clients automatically select the nearest relay for low latency. Tailscale is continually expanding and adding more DERP servers as needed to provide low-latency connections.
With clients that support the [Tailscale CLI](/docs/reference/tailscale-cli), you can use the [`tailscale netcheck`](/docs/reference/tailscale-cli#netcheck) command to get a list of the DERP servers applicable to your Tailscale device.
### [Custom DERP servers](#custom-derp-servers)
In most cases, there's no need to run a [custom DERP server](/docs/reference/derp-servers/custom-derp-servers). DERP servers only serve as the connective tissue between devices in your tailnet (with no visibility into the data exchanged between devices).
If you frequently encounter DERP relayed connections, and they don't meet your performance requirements, it's usually better to set up [peer relays](/docs/features/peer-relay) instead of a custom DERP server. Peer relays:
* Offer lower latency and better performance than DERP servers because they run within your own network or infrastructure.
* Don't incur additional costs associated with egress data transfer through DERP servers (for cloud environments).
* Avoid the overhead and limitations of maintaining custom DERP servers.
That said, there are some rare cases in which it might make sense to run a custom DERP server. To do so, you must build, deploy, and update the [`cmd/derper`](https://github.com/tailscale/tailscale/blob/main/cmd/derper/README.md) binary. Refer to the [custom DERP server](/docs/reference/derp-servers/custom-derp-servers) documentation for more information.
Running your own DERP servers is an advanced operation that requires significant resources on your part to set up and maintain. Additionally, running a custom DERP servers have the following caveats:
* Custom DERP servers don't support device sharing or other cross-tailnet features.
* Custom DERP servers, just like normal DERP servers, have no visibility of the data exchanged between devices because they're encrypted. As a result, DERP servers aren't helpful for network-level debugging.
* Custom DERP servers won't benefit from some optimizations from the Tailscale control plane.
### [Customize your DERP map](#customize-your-derp-map)
You can customize the DERP map that Tailscale uses for your tailnet. To do so, add a `derpMap` object to your tailnet policy file. In the `derpMap` object, you can explicitly disable using a DERP region by setting its `RegionID` to `null`. For example, to disable using DERP servers in the New York DERP region (which has the `RegionID:1`), add the following to your tailnet policy file.
```
`{
// ... other parts of the tailnet policy file
"derpMap": {
"regions": {
"1": null,
},
},
}
`
```
If you don't know the `RegionID` of a DERP region, you can retrieve the official Tailscale DERP map, which includes region IDs, from `https://controlplane.tailscale.com/derpmap/default`. You can visit this URL in a web browser or a `curl` command.
```
`curl https://controlplane.tailscale.com/derpmap/default
`
```
If you have [`jq`](https://jqlang.github.io/jq/) installed, you can use the following command to list Tailscale's default DERP regions and their IDs:
```
`curl --silent https://controlplane.tailscale.com/derpmap/default | jq -r '.Regions[] | "\\(.RegionID) \\(.RegionName)"'
`
```
Contact Tailscale Support to restrict your tailnet to US-only DERP servers for compliance purposes.
## [DERP packets](#derp-packets)
DERP servers relay two types of packets: DISCO packets and encrypted WireGuard packets. In most cases, DERP servers primarily use DISCO packets (discovery messages) to establish and negotiate a direct connection between two tailnet devices. However, when two devices use a DERP server as a fallback connection method, the DERP server relays encrypted WireGuard packets between the two devices.
DISCO is a protocol Tailscale DERP servers use to send discovery messages between tailnet devices before establishing a direct connection. These discovery messages are also called DISCO packets.
## [Availability and downtime](#availability-and-downtime)
The Tailscale coordination server maintains a list of DERP servers and devices running Tailscale retrieve this list of DERP servers from the coordination server and save it list locally. That way, if the [coordination server is down](/docs/reference/coordination-server-down) but the DERP servers are up, the Tailscale client still has the last known state for list of DERP servers. This list of DERP servers persists even if the Tailscale client restarts.
In the event of DERP server (or region) outages, the following occurs:
* If a DERP server is added while the coordination server is down, it won't get advertised as an option to Tailscale clients. It will be added the next time the Tailscale client connects to the coordination server.
* If one DERP server in a region becomes unreachable, the Tailscale client selects a different DERP server in the region.
* If the DERP region becomes unreachable, the Tailscale client selects the next closest region.
On this page
* [Relayed connections using DERP servers](#relayed-connections-using-derp-servers)
* [DERP server locations](#derp-server-locations)
* [Custom DERP servers](#custom-derp-servers)
* [Customize your DERP map](#customize-your-derp-map)
* [DERP packets](#derp-packets)
* [Availability and downtime](#availability-and-downtime)
Scroll to top