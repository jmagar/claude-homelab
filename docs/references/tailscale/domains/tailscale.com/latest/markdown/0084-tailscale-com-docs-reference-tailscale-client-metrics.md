Tailscale client metrics · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Tailscale client metrics
Last validated: Jan 28, 2026
You can expose and collect Tailscale client metrics for use with monitoring systems such as [Prometheus](https://prometheus.io/) or [Grafana](/docs/integrations/grafana) for your Tailscale network (known as a tailnet). These metrics provide insights into client behavior, health, and performance. For example, you can monitor information about client connectivity to [subnet routers](/docs/features/subnet-routers) configured in your tailnet.
Tailscale client metrics are supported in Tailscale v1.78.0 and later.
## [Available metrics](#available-metrics)
You can collect the following metrics from the Tailscale clients in your tailnet:
### [Subnet router](#subnet-router)
Use the metrics in this section to collect Tailscale client information related to subnet routes.
`tailscaled\_advertised\_routes`
* The metric type is `gauge`.
* Displays the number of routes advertised by the client.
* Includes routes that are not approved.
* Does not include exit nodes.
`tailscaled\_approved\_routes`
* The metric type is `gauge`.
* Displays number of advertised routes that have been [approved](/docs/features/subnet-routers#enable-subnet-routes-from-the-admin-console) by an administrator.
### [Peer relay servers](#peer-relay-servers)
Use the metrics in this section to collect information about the local [peer relay](/docs/features/peer-relay) instance.
`tailscaled\_peer\_relay\_forwarded\_packets\_total`
* The metric type is `counter`.
* Displays the number of packets forwarded by the local peer relay instance.
* Labels:
* `transport\_in`: The transport protocol used for incoming packets. Possible values are `udp4` for UDP over IPv4 and `udp6` for UDP over IPv6.
* `transport\_out`: The transport protocol used for outgoing packets. Possible values are `udp4` for UDP over IPv4 and `udp6` for UDP over IPv6.
`tailscaled\_peer\_relay\_forwarded\_bytes\_total`
* The metric type is `counter`.
* Displays number of bytes forwarded by the local peer relay instance.
* Labels:
* `transport\_in`: The transport protocol used for incoming packets. Possible values are `udp4` for UDP over IPv4 and `udp6` for UDP over IPv6.
* `transport\_out`: The transport protocol used for outgoing packets. Possible values are `udp4` for UDP over IPv4 and `udp6` for UDP over IPv6.
`tailscaled\_peer\_relay\_endpoints`
* The metric type is `gauge`.
* Displays number of endpoints (tunnels) currently served by the local peer relay instance.
* Labels:
* `state`: The endpoint state. Possible values are `connecting` when one or both peers are negotiating a connection, and `open` for endpoints able to forward traffic.
### [Health](#health)
Use the metrics in this section to collect Tailscale client information related to health.
`tailscaled\_health\_messages`
* The metric type is `gauge`.
* Displays the number of health messages currently reported by the Tailscale client.
* This metric has a `type` label, reporting health message type. For example, `warning`.
You can collect details about the health messages by running [`tailscale status`](/docs/reference/tailscale-cli#status).
### [DERP](#derp)
Use the metrics in this section to collect Tailscale client information related to [DERP relay servers](/docs/reference/derp-servers).
`tailscaled\_home\_derp\_region\_id`
* The metric type is `gauge`.
* Displays the [DERP region](/docs/reference/derp-servers) ID of this node's home relay server.
### [Throughput](#throughput)
Use the metrics in this section to collect Tailscale client information related to throughput.
`tailscaled\_inbound\_packets\_total`
* The metric type is `counter`.
* Displays the number of packets received by the node from other peers.
`tailscaled\_inbound\_bytes\_total`
* The metric type is `counter`.
* Displays the number of bytes received by the node from other peers.
`tailscaled\_outbound\_packets\_total`
* The metric type is `counter`.
* Displays the number of packets sent by the device to other peers.
`tailscaled\_outbound\_bytes\_total`
* The metric type is `counter`.
* Displays the number of bytes sent by the node to other peers.
All throughput metrics contain a `path` label, indicating [the type of connection](/docs/reference/connection-types) that
a packet took. The `path` label can contain one of the following values:
* `direct\_ipv4`: Packets sent or received directly over IPv4.
* `direct\_ipv6`: Packets sent or received directly over IPv6.
* `derp`: Packets sent or received through a [DERP relay](/docs/reference/derp-servers).
* `peer\_relay\_ipv4`: Packets sent or received through a [Tailscale Peer Relay](/docs/features/peer-relay) over IPv4.
* `peer\_relay\_ipv6`: Packets sent or received through a [Tailscale Peer Relay](/docs/features/peer-relay) over IPv6.
### [Dropped packets](#dropped-packets)
Use the metrics in this section to collect Tailscale client information related to dropped packets.
`tailscaled\_inbound\_dropped\_packets\_total`
* The metric type is `counter`.
* Displays the number of packets dropped after being received from other peers.
`tailscaled\_outbound\_dropped\_packets\_total`
* The metric type is `counter`.
* Displays the number of packets dropped while being sent to other peers.
Both the `tailscaled\_inbound\_dropped\_packets\_total` and `tailscaled\_outbound\_dropped\_packets\_total` metrics contain a `reason` label with one of the following values:
* `acl`: The reported packets dropped by [Tailscale access control](/docs/features/access-control).
* `multicast`: The reported packets dropped because they were multicast.
* `link\_local\_unicast`: The reported packets dropped because they were link-local unicast.
* `too\_short`: The reported packets dropped because they were too short.
* `fragment`: The reported packets dropped because they were IP fragments.
* `unknown\_protocol`: The reported packets dropped because they had an unknown protocol.
* `error`: The reported packets dropped because of an error.
## [Collect metrics](#collect-metrics)
You can collect Tailscale metrics either from the Tailscale [web interface](/docs/features/client/device-web-interface) or the [Tailscale CLI](/docs/reference/tailscale-cli#metrics).
### [Web interface](#web-interface)
The Tailscale [web interface](/docs/features/client/device-web-interface) exposes client metrics on the conventional `/metrics` path.
#### [Access metrics locally](#access-metrics-locally)
Each client exposes metrics locally through the [`http://100.100.100.100/metrics`](/docs/reference/quad100) URL. You can use this URL when the monitoring server (or agent) is running on the same host as the Tailscale client.
#### [Collect metrics over Tailscale](#collect-metrics-over-tailscale)
To collect metrics over your tailnet, you must:
* Enable the Tailscale [web interface](/docs/features/client/device-web-interface) on each device that you plan to expose metrics by running using the [`tailscale set --webclient`](/docs/reference/tailscale-cli#set) command.
* Grant your monitoring server access to port `5252` of each device in your [tailnet policy file](/docs/features/tailnet-policy-file).
We recommend using this method when your monitoring server is running on another device in your tailnet.
#### [Expose metrics to other networks](#expose-metrics-to-other-networks)
You can make the web interface available through another network interface on your machine by running the [`tailscale web`](/docs/reference/tailscale-cli#web) command. For example, if you have a local interface with an IP address `203.0.113.5`, running `tailscale web --readonly --listen 203.0.113.5:8080` makes metrics accessible at `http://203.0.113.5:8080/metrics`.
The `tailscale web --readonly` command starts a separate server that listens only on the provided IP address and port number. It does not expose metrics over a Tailscale IP address.
### [Command line](#command-line)
To use metrics in a script or to inspect them in the [Tailscale CLI](/docs/reference/tailscale-cli) command:
```
`tailscale metrics print
`
```
#### [Write metrics to a file](#write-metrics-to-a-file)
You can use the `tailscale metrics write` command to write metric values to a text file provided as its only argument. You can use this alongside [Prometheus node exporter](https://github.com/prometheus/node_exporter) to let the [textfile collector](https://github.com/prometheus/node_exporter#textfile-collector) consume and export Tailscale client metrics.
For example:
```
`tailscale metrics write /var/lib/prometheus/node-exporter/tailscaled.prom
`
```
On this page
* [Available metrics](#available-metrics)
* [Subnet router](#subnet-router)
* [Peer relay servers](#peer-relay-servers)
* [Health](#health)
* [DERP](#derp)
* [Throughput](#throughput)
* [Dropped packets](#dropped-packets)
* [Collect metrics](#collect-metrics)
* [Web interface](#web-interface)
* [Access metrics locally](#access-metrics-locally)
* [Collect metrics over Tailscale](#collect-metrics-over-tailscale)
* [Expose metrics to other networks](#expose-metrics-to-other-networks)
* [Command line](#command-line)
* [Write metrics to a file](#write-metrics-to-a-file)
Scroll to top