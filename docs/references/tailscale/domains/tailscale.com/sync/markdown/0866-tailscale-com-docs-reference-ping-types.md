Tailscale ping message types · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Tailscale ping message types
Last validated: Jan 13, 2026
The standard `ping` command uses [Internet Control Message Protocol](https://www.rfc-editor.org/rfc/rfc792.html) (ICMP) echo request and echo reply messages to test connectivity between two devices on a network. When you run a standard ping command, your system:
1. Sends ICMP echo request packets to the target IP address.
2. Waits for ICMP echo reply packets from the target.
3. Measures the round-trip time.
4. Reports packet loss statistics.
The standard `ping` command primarily tests basic IP connectivity and measures latency. Many firewalls and network configurations block ICMP traffic, which can cause standard `ping` commands to fail even when other types of connectivity exist.
The Tailscale ping command extends beyond standard ICMP ping functionality. It lets you test [connectivity](/docs/reference/device-connectivity) using multiple protocols to provide more comprehensive information about your Tailscale network (known as a [tailnet](/docs/concepts/tailnet)) to help troubleshoot Tailscale-specific connectivity issues.
You can use the [Tailscale CLI](/docs/reference/tailscale-cli) ([`tailscale ping`](/docs/reference/tailscale-cli#ping)) to send Tailscale ping messages. Tailscale ping supports four distinct ping message types, each serving a specific purpose in [diagnosing network connectivity](/docs/reference/troubleshooting/connectivity). The supported ping types are DISCO, ICMP, TSMP, and peer API.
## [DISCO](#disco)
DISCO (discovery) is Tailscale's protocol for peer-to-peer path discovery and [NAT traversal](/blog/how-tailscale-works). By default, the Tailscale ping command uses the DISCO protocol. DISCO ping messages test direct connectivity between tailnet devices.
To send a DISCO ping message, use [`tailscale ping`](/docs/reference/tailscale-cli#ping) command without any flags.
```
`tailscale ping device-name
pong from device-name (100.100.100.123) via DERP(nue) in 20ms
pong from device-name (100.100.100.123) via 1.2.3.4:56126 in 20ms
`
```
The ping output also shows the path taken to reach the target device, which starts off as a [DERP connection](/docs/reference/derp-servers), then establishes either a direct connection or a peer relay connection. The following is an example of a DERP connection followed by a [peer relay](/docs/features/peer-relay) connection, then a direct connection:
```
`tailscale ping device-name
pong from device-name (100.100.100.123) via DERP(iad) in 39ms
pong from device-name (100.100.100.123) via peer-relay(198.51.100.167:7777:vni:7) in 35ms
pong from device-name (100.100.100.123) via peer-relay(198.51.100.167:7777:vni:7) in 36ms
pong from device-name (100.100.100.123) via peer-relay(198.51.100.167:7777:vni:7) in 35ms
pong from device-name (100.100.100.123) via 203.0.113.5:37597 in 41ms
`
```
For more information about Tailscale connection types, refer to [connection types in Tailscale](/docs/reference/connection-types).
## [ICMP](#icmp)
Tailscale ICMP ping messages send a normal ICMP ping message over Tailscale's [encrypted](/docs/concepts/tailscale-encryption) WireGuard connection. Tailscale ICMP ping message test end-to-end IP connectivity between Tailscale devices.
To send a ICMP ping message, use the `--icmp` flag with the [`tailscale ping`](/docs/reference/tailscale-cli#ping) command.
```
`tailscale ping --icmp device-name
pong from device-name (100.100.100.123) via ICMP in 20ms
`
```
## [TSMP (Tailscale Message Protocol)](#tsmp-tailscale-message-protocol)
TSMP is a Tailscale-specific protocol designed to test connectivity when ICMP might be blocked. Tailscale TSMP ping messages test end-to-end IP connectivity over Tailscale's encrypted [WireGuard](/docs/concepts/wireguard) tunnel but they bypass the device's operating system's IP stack.
To send a TSMP ping message, use the `--tsmp` flag with the [`tailscale ping`](/docs/reference/tailscale-cli#ping) command.
```
`tailscale ping --tsmp device-name
pong from device-name (100.100.100.123, 12345) via TSMP in 20ms
`
```
## [Peer API](#peer-api)
Peer API ping tests the HTTP-based peer API connectivity between tailnet devices. It's useful when troubleshooting Tailscale features like [Serve](/docs/features/tailscale-serve), [Taildrive](/docs/features/taildrive), and [Taildrop](/docs/features/taildrop).
To send a peer API ping message, use the `--peerapi` flag with the [`tailscale ping`](/docs/reference/tailscale-cli#ping) command.
```
`tailscale ping --peerapi device-name
hit peerapi of 100.100.100.123 (device-name.corp.ts.net.) at http://100.100.100.123:12345 in 20ms
`
```
On this page
* [DISCO](#disco)
* [ICMP](#icmp)
* [TSMP (Tailscale Message Protocol)](#tsmp-tailscale-message-protocol)
* [Peer API](#peer-api)
Scroll to top