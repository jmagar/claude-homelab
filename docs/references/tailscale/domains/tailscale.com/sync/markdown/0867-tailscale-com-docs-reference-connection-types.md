Connection types · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Connection types
Last validated: Jan 7, 2026
Tailscale [connects devices](/docs/how-to/connect-to-devices) within a Tailscale network (known as a [tailnet](/docs/concepts/tailnet)) using three connection types:
* **Direct connections**: Devices send packets directly to each other using UDP.
* **DERP relayed connections**: Devices send packets through [DERP servers](/docs/reference/derp-servers).
* **Tailscale Peer Relay connections**: Devices send packets through another device in the same tailnet acting as a relay.
All three options are end-to-end [encrypted](/docs/concepts/tailscale-encryption) with [WireGuard](/docs/concepts/wireguard). The primary difference between them is performance, not security. Direct connections usually provide the lowest latency and highest throughput, while relayed connections are a fallback when direct connectivity isn't possible.
## [How Tailscale establishes connections](#how-tailscale-establishes-connections)
In a typical scenario, two devices in a tailnet follow a standard sequence when negotiating a [connection between them](/docs/reference/device-connectivity).
The following example scenario shows this sequence of events between two devices connected to the same tailnet, named `device-a` and `device-b`. Because both devices are connected to the tailnet, they each have a connection to the closest DERP server to help them negotiate and establish connections to other tailnet devices.
1. `device-a` starts a connection to `device-b`.
2. `device-a` connects to the DERP server that `device-b` is already using.
3. `device-a` sends the connection request to `device-b` through a DERP server.
4. Devices exchange direct-connection details using their connected DERP servers.
1. `device-a` sends a request for direct connection details.
2. `device-b` responds with its direct connection details.
3. Both devices perform NAT traversal. They try various NAT traversal strategies to establish a direct UDP tunnel between themselves.
1. If NAT traversal succeeds, `device-a` and `device-b` establish a direct (peer-to-peer) connection. They don't need to relay packets through a third device (such as a DERP server or a peer relay server).
2. If the devices can't establish a direct connection, they try to connect using a Tailscale Peer Relay server. For this to be possible, the tailnet must have at least one peer relay device that both `device-a` and `device-b` can access.
3. If there's no available peer relay, the devices remain connected using the DERP server to relay packets between them.
4. Tailscale periodically re-checks if it can establish a direct connection or a peer relay connection.
All connections start as relayed through a DERP server, and Tailscale then tries to upgrade them to a direct connection. If that fails, Tailscale tries to connect them using a peer relay. If that fails, the connection remains relayed through the DERP server.
## [Direct connections](#direct-connections)
A direct connection is a peer-to-peer connection between two tailnet devices where they can send packets directly to each other over UDP. In most cases, a direct connection is preferable to a relayed connection because it offers higher throughput and lower latency.
Tailscale's ability to establish a direct connection depends on its [NAT traversal logic](/blog/how-nat-traversal-works) and the network configuration of the devices. In most environments, Tailscale successfully establishes direct connections, but some network configurations (hard NAT) can prevent this and force Tailscale to use relayed connections instead.
## [Relayed connections](#relayed-connections)
A relayed connection is a connection between two devices that is relayed through an intermediate host instead of going directly between the devices. Tailscale uses two kinds of relayed connections:
* DERP relayed connections: Use Tailscale's DERP servers as relays.
* Tailscale Peer relay connections: Use another device in the same tailnet as the relay.
### [DERP connections](#derp-connections)
Tailscale operates a worldwide fleet of [DERP servers](/docs/reference/derp-servers). These servers primarily:
* Help devices discover each other and negotiate connection details.
* Facilitate the transition between connection types (for example, from relayed to direct).
* Provide a fallback connection when a direct connection isn't possible.
Any device that can open an HTTPS connection to an arbitrary host can build a tunnel using DERP relays. DERP servers are reliable but have limited quality of service ([QoS](https://www.fortinet.com/resources/cyberglossary/qos-quality-of-service)) characteristics, so they are generally slower than direct connections and may offer lower maximum throughput.
Because of this, using a relayed connection when a direct connection would be possible is one of the most common causes of [performance issues](/docs/reference/troubleshooting/connectivity).
### [Peer relay connections](#peer-relay-connections)
Peer relay connections use [Tailscale Peer Relays](/docs/features/peer-relay) to relay traffic through another device in the same tailnet when a direct connection between two devices isn't possible.
Peer relay connections are usually faster than DERP connections because they avoid the extra latency of routing traffic through a geographically distant DERP server. However, they still introduce more latency than a fully direct connection, because traffic must pass through an additional hop.
## [Determine your connection type](#determine-your-connection-type)
You can determine which connection type you're using by communicating between devices and then inspecting [`tailscale status`](/docs/reference/tailscale-cli#status) or [`tailscale ping`](/docs/reference/tailscale-cli#ping).
### [Using `tailscale status`](#using-tailscale-status)
Run [`tailscale status`](/docs/reference/tailscale-cli#status) and examine the connection information for the peer device.
* If the output contains "`direct`", the connection is direct.
* If the output includes "`relay`", the connection is relayed through a DERP server.
* If the output includes "`peer-relay`", the connection is relayed through a peer relay device.
The following output shows an example of a direct connection:
```
`100.113.160.82 device-a tagged-devices linux active; offers exit node; direct 140.82.13.138:41641
`
```
The following output shows an example of a relayed connection using a DERP server:
```
`100.104.93.78 localhost-0 user@ android active; relay "tor"
`
```
### [Using `tailscale ping`](#using-tailscale-ping)
You can also use [`tailscale ping`](/docs/reference/tailscale-cli#ping) to determine if you can establish a direct connection from your current device to another device in the tailnet.
#### [Direct connection example](#direct-connection-example)
The following output shows an example of `your-device` connected directly to `another-device`:
```
`\> user@your-device:\~$ tailscale ping another-device
pong from another-device (100.113.160.82) via DERP(nyc) in 130ms
pong from another-device (100.113.160.82) via DERP(nyc) in 37ms
pong from another-device (100.113.160.82) via DERP(nyc) in 50ms
pong from another-device (100.113.160.82) via DERP(nyc) in 38ms
pong from another-device (100.113.160.82) via 140.82.13.138:41641 in 35ms
`
```
Here, the first few packets go through the nearest DERP server while Tailscale negotiates a direct connection. After the direct connection is established, subsequent packets go directly to the destination.
#### [Peer relayed connection example](#peer-relayed-connection-example)
The following output shows an example of `your-device` connected to `another-device` using a peer relay server:
```
`\> user@your-device:\~$ tailscale ping another-device
pong from another-device (100.97.143.93) via DERP(lax) in 40ms
pong from another-device (100.97.143.93) via peer-relay(192.168.64.2:7777:vni:1) in 4ms
pong from another-device (100.97.143.93) via peer-relay(192.168.64.2:7777:vni:1) in 5ms
pong from another-device (100.97.143.93) via peer-relay(192.168.64.2:7777:vni:1) in 3ms
pong from another-device (100.97.143.93) via peer-relay(192.168.64.2:7777:vni:1) in 4ms
pong from another-device (100.97.143.93) via peer-relay(192.168.64.2:7777:vni:1) in 5ms
pong from another-device (100.97.143.93) via peer-relay(192.168.64.2:7777:vni:1) in 4ms
pong from another-device (100.97.143.93) via peer-relay(192.168.64.2:7777:vni:1) in 4ms
pong from another-device (100.97.143.93) via peer-relay(192.168.64.2:7777:vni:1) in 4ms
pong from another-device (100.97.143.93) via peer-relay(192.168.64.2:7777:vni:1) in 3ms
direct connection not established
`
```
#### [DERP relayed connection example](#derp-relayed-connection-example)
The following output shows an example of `your-device` connected to `another-device` using a DERP server as a relay:
```
`\> user@your-device:\~$ tailscale ping another-device
pong from another-device (100.104.93.78) via DERP(tor) in 53ms
pong from another-device (100.104.93.78) via DERP(tor) in 196ms
pong from another-device (100.104.93.78) via DERP(tor) in 50ms
pong from another-device (100.104.93.78) via DERP(tor) in 214ms
pong from another-device (100.104.93.78) via DERP(tor) in 273ms
pong from another-device (100.104.93.78) via DERP(tor) in 274ms
pong from another-device (100.104.93.78) via DERP(tor) in 282ms
pong from another-device (100.104.93.78) via DERP(tor) in 273ms
pong from another-device (100.104.93.78) via DERP(tor) in 76ms
pong from another-device (100.104.93.78) via DERP(tor) in 152ms
direct connection not established
`
```
## [Why Tailscale can't always use direct connections](#why-tailscale-cant-always-use-direct-connections)
Tailscale can't always establish a direct connection between devices. And if network conditions change, it's possible for an existing direct connection to fall back to a relayed connection if a direct connection is no longer possible. The most common scenarios that prevent direction connections include blocked UDP packets and hard NAT scenarios.
### [Blocked UDP packets](#blocked-udp-packets)
To establish a direct connection, a device must be able to send and receive UDP packets. If something on the network blocks direct UDP connections, devices can't establish direct connections, but they can still use relayed connections using a [Tailscale Peer Relay server](/docs/features/peer-relay) or a DERP server.
In these cases, to prevent relayed connections, work with your network or service provider to allow outbound and return UDP traffic.
### [Hard NAT](#hard-nat)
[Hard NAT](/docs/reference/device-connectivity#hard-nat) scenarios make establishing direct connections difficult, and sometimes impossible. Hard NAT refers to a network scenario in which a device is behind a gateway with two characteristics that break peer-to-peer connections: each outbound connection gets its own port mapping that only accepts replies from that specific destination, and each connection uses a different external port that outside devices cannot predict. Tailscale can't establish a direct connection if both devices are behind a hard NAT.
But, even when a device is behind a hard NAT, you can take steps to improve the chances of establishing a direct connection.
#### [Home and small office networks](#home-and-small-office-networks)
On many routers, there are settings you can adjust to make direct connections more likely. For example, you can enable NAT-PMP or UPnP port mapping on your router to give Tailscale more predictable, reachable ports. This facilitates static port mapping to keep port numbers predictable. Predictable port numbers make it easier for Tailscale to reliably establish direct connections through a firewall.
By default, opening UDP port `41641` on a device's public IP address ensures a direct connection from any peer device, where possible. You can change this port number by passing `--port=\<number\>` to [`tailscaled`](/docs/reference/tailscaled). On Linux, you can set this in `/etc/defaults/tailscaled`.
#### [Cloud platforms and NAT gateways](#cloud-platforms-and-nat-gateways)
Many cloud platforms, such as [AWS](/docs/reference/reference-architectures/aws), use NAT gateways that can behave like hard NATs. When devices are behind these gateways, relayed connections are often the result.
To improve the odds of direct connections, you can:
* Expose public IP addresses (dynamic or static) for your Tailscale devices.
* Ensure that UDP port `41641` is not blocked.
If you can't make these changes, you can set up a [Tailscale Peer Relay](/docs/features/peer-relay) server to relay communication between your devices. A peer relay server is generally faster than a DERP server and runs within your own infrastructure (so there's no need to traverse gateways or egress traffic).
#### [Exit nodes and Terraform](#exit-nodes-and-terraform)
For devices such as [exit nodes](/docs/features/exit-nodes) that intentionally egress through a NAT gateway, you can use Tailscale's Terraform templates to:
* Route incoming traffic through the public interface.
* Route outgoing traffic through the NAT gateway.
Contact the Tailscale Solutions Engineering team at `se@tailscale.com` for assistance deploying this. This enables the egress traffic to have a predictable public IP address, but the ingress traffic establishes a direct connection to the exit node. This pattern also applies for other Tailscale connectors, including subnet routers and app connectors.
On this page
* [How Tailscale establishes connections](#how-tailscale-establishes-connections)
* [Direct connections](#direct-connections)
* [Relayed connections](#relayed-connections)
* [DERP connections](#derp-connections)
* [Peer relay connections](#peer-relay-connections)
* [Determine your connection type](#determine-your-connection-type)
* [Using tailscale status](#using-tailscale-status)
* [Using tailscale ping](#using-tailscale-ping)
* [Direct connection example](#direct-connection-example)
* [Peer relayed connection example](#peer-relayed-connection-example)
* [DERP relayed connection example](#derp-relayed-connection-example)
* [Why Tailscale can't always use direct connections](#why-tailscale-cant-always-use-direct-connections)
* [Blocked UDP packets](#blocked-udp-packets)
* [Hard NAT](#hard-nat)
* [Home and small office networks](#home-and-small-office-networks)
* [Cloud platforms and NAT gateways](#cloud-platforms-and-nat-gateways)
* [Exit nodes and Terraform](#exit-nodes-and-terraform)
Scroll to top