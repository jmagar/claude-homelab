Network flow logs · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Network flow logs
Last validated: Jan 23, 2026
Network flow logs let you understand how and when nodes on your Tailscale network (known as a tailnet) connect to each other. You can export network logs for long-term storage, security analysis, threat detection, or incident investigation. You can also [stream logs](/docs/features/logging/log-streaming) to a security information and event management ([SIEM](/learn/security-information-and-event-management)) system.
The data captured in network logs is the flow of network traffic, not the contents of network traffic. Tailscale does not and cannot inspect your traffic. For more information about how your data stays private, refer to our [Security page](/security).
Network flow logs are available for the most recent 30 days.
This feature is available for [the Premium and Enterprise plans](/pricing).
Only nodes using Tailscale v1.34 or later can send networking telemetry to the Tailscale logs service.
## [How it works](#how-it-works)
When network flow logs are enabled (and not using [`--no-logs-no-support`](/docs/features/logging#opting-out-of-client-logging)), nodes report their flow information (for both ends of the connection) to the Tailscale logs service. A connection can be between:
* Two nodes
* A node and a device behind a subnet router
* A node and a public device accessed through an exit node
When the connection is between a node and a device behind a subnet router, the subnet router logs the connection. When the connection is between a node and a public device accessed through an exit node, the exit node logs the connection.
Logs occur between transferred and received network connections, and entries exist for both ends.
Logs occur at two layers: the virtual layer and the physical layer. The virtual layer is the Tailscale network (often with IP addresses in [`100.x.x.x`](/docs/concepts/tailscale-ip-addresses)) that Tailscale provides for each device. The physical layer involves all the physical network interfaces on a device. When one node transmits a packet to another, the packet must cross through the physical layer. The summation of all traffic routed at the virtual layer is generally equal to the traffic routed at the physical layer.
Tailscale centrally stores network logs and lets you export them. Tailscale does not log the actual contents or data of the network traffic.
## [Network logs structure](#network-logs-structure)
Network logs contain an array of messages that provide details about network flow activity. Each message contains the following components:
* `nodeId`: The node that generated this log message. It is a globally unique identifier of a node. It is not the same value as the node name. If you want to map `nodeId` to a node name, you can use the [`/api/v2/device/:nodeId`](/api#tag/devices/GET/tailnet/{tailnet}/devices) method and examine the `name` field.
* `logged`: The time in UTC that the Tailscale logs service recorded the message. Generally, the logged time is after the end time within a message.
* `start`: The start time in UTC for the network traffic flow data in the message, as recorded by the node that generated the message.
* `end`: The end time in UTC for the network traffic flow data in the message, as recorded by the node that generated the message.
* `srcNode`: Information about the source node itself, which is the node that generated this log message. Explore the `Node` type in the following section for more information.
* `dstNodes`: List of information about all destination nodes that the source node (for example, this node) communicated with. Explore the `Node` type for more information.
* `virtualTraffic`: Counters for the network flow's virtual traffic. Virtual traffic is traffic that occurs between nodes in your tailnet.
* `subnetTraffic`: Counters for the network flow's traffic routed through an advertised subnet router.
* `exitTraffic`: Counters for the network flow's traffic routed through an exit node. For traffic from a node to a public device through an exit node, the source is the Tailscale IP address, but the protocol, source port, and destination are empty. For traffic responses from a public device to a node through an exit node, the destination is the Tailscale IP address, but the protocol, destination port, and source are empty. Tailscale doesn't gather granular information about individual connections to preserve privacy. If an administrator enables [Destination Logging](/docs/features/exit-nodes#destination-logging-in-network-flow-logs), the protocol, source port, and destination information are logged.
* `physicalTraffic`: Counters for the network flow's traffic on the physical network layer that operates below the virtual Tailscale network. Traffic information at the physical layer is gathered at a slightly different time than the virtual layer, so packets flowing through the virtual layer may not exactly line up with those at the physical layer.
Start and end times are specific to the node that generated the message. Timestamps may be subject to clock skew across different nodes.
The virtual, subnet, exit, and physical traffic counters consist of the following components:
* `proto`: The [IANA Protocol Number](https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml) for the network flow: 6 for TCP, 17 for UDP. Empty for exit traffic, unless [Destination Logging](/docs/features/exit-nodes#destination-logging-in-network-flow-logs) is enabled.
* `src`: The Tailscale IP address and port for the source of the network flow. The port number is not included for exit traffic, unless [Destination Logging](/docs/features/exit-nodes#destination-logging-in-network-flow-logs) is enabled.
* `dst`: The IP address and port for the destination of the network flow. This IP address can be either a Tailscale IP address or an external IP address, such as on a private network or a public IP. Empty for exit traffic, unless [Destination Logging](/docs/features/exit-nodes#destination-logging-in-network-flow-logs) is enabled.
* `txPackets`: Number of packets transmitted.
* `txBytes`: Number of bytes transmitted.
* `rxPackets`: Number of packets received.
* `rxBytes`: Number of bytes received.
## [Enable network flow logs](#enable-network-flow-logs)
Network flow logs are disabled by default.
You must be an [Owner, Admin, Network admin, or IT admin](/docs/reference/user-roles) of a tailnet to enable Network flow logs.
1. Open the [Network flow logs](https://login.tailscale.com/admin/logs/network) page of the admin console.
2. Select **Start logging**.
3. In the **Start logging network flows** dialog, select **Start logging**.
## [Disable network flow logs](#disable-network-flow-logs)
You must be an [Owner, Admin, Network admin, or IT admin](/docs/reference/user-roles) of a tailnet to disable Network flow logs.
1. Open the [Network flow logs](https://login.tailscale.com/admin/logs/network) page of the admin console.
2. Select **Stop logging**.
3. In the **Stop logging network flows** dialog, select **Stop logging**.
## [Access network logs](#access-network-logs)
You must be an [Owner, Admin, Network admin, or IT admin](/docs/reference/user-roles) of a tailnet to access network logs.
You can access network logs using the Tailscale [API](/docs/reference/tailscale-api) or [log streaming](#network-flow-logs-streaming).
### [Access network logs through the API](#access-network-logs-through-the-api)
You need an [API access token](/docs/reference/tailscale-api#authentication) with the `logs:network:read` scope to access network logs.
The response from the `https://api.tailscale.com/api/v2/tailnet/{$TAILNET\_ID}/logging/network` endpoint call is in the form of the `Response` struct:
```
`type Response struct {
Logs []Message `json:"logs"`
}
`
```
Using Go syntax, the `Response` struct contains a slice of `Message` types. The `Message` struct is defined as:
```
`type Message struct {
// NodeID is the stable ID of the node that
// generated this network log message.
NodeID string `json:"nodeId"` // for example, "n123456CNTRL"
// Logged is the timestamp of when the Tailscale logs service
// recorded the network log message from a given node.
// It is guaranteed to be within the start and end time ranges
// specified in the API request.
// All log messages are listed in chronological order
// from oldest to newest.
Logged time.Time `json:"logged"`
// Start and End are the inclusive time ranges for the network
// traffic flow information present in the message.
// These timestamps are recorded by the node and subject
// to clock skew across different nodes.
// Generally speaking, the Logged timestamp is after End.
//
// Network logs are gathered in 5 second windows.
// This may change in the future.
Start time.Time `json:"start"`
End time.Time `json:"end"`
// SrcNode is information about the source node itself,
// which is the node that generated this log message.
SrcNode Node `json:"srcNode,omitzero"`
// DstNodes is information about all destination nodes
// that the source node (i.e., this node) communicated with.
DstNodes []Node `json:"dstNodes,omitzero"`
// VirtualTraffic records connection statistics for
// node to node traffic.
// Both the source and address are Tailscale IP addresses
// (for example, 100.xx.xx.xx). The source is always the
// Tailscale IP address of the current node.
VirtualTraffic []ConnectionCounts `json:"virtualTraffic"`
// SubnetTraffic records node to external traffic
// on an explicitly advertised subnet route.
//
// For nodes using a subnet router,
// the source is the Tailscale IP address of the current node and
// the destination is the external IP address in the subnet range.
// For nodes operating as the subnet router,
// the destination is the Tailscale IP address of the node
// using the subnet router and the source address
// is the external IP address within the advertised subnet range.
SubnetTraffic []ConnectionCounts `json:"subnetTraffic"`
// ExitTraffic records aggregated statistics for all traffic
// flowing through an exit node. For traffic from a node to a
// public device through an exit node, the source will be the
// Tailscale IP address, but the protocol, source port,
// and destination will be empty. For traffic responses from a
// public device to a node through an exit node, the destination
// will be the Tailscale IP address, but the protocol,
// destination port and source will be empty. Fine
// granularity information about individual connections is not
// gathered so that privacy can be preserved.
ExitTraffic []ConnectionCounts `json:"exitTraffic"`
// PhysicalTraffic records traffic on the physical network layer
// that operates below the virtual Tailscale network.
// The source is the Tailscale IP address of remote nodes
// that the current node is communicating with and
// the destination is the external IP address that traffic
// is physically sent to to communicate with that
// remote node.
//
// Traffic information at the physical layer is gathered
// at a slightly different moment in time as the virtual layer,
// so packets flowing through the virtual layer
// may not exactly line up with those at the physical layer.
PhysicalTraffic []ConnectionCounts `json:"physicalTraffic"`
}
`
```
Several fields in the `Message` struct use the type `ConnectionCounts`. The `ConnectionCounts` struct is defined as:
```
`type ConnectionCounts struct {
Proto uint8 `json:"proto"` // for example, 6 for TCP, 17 for UDP
Src string `json:"src"` // for example, "100.11.22.33:4567"
Dst string `json:"dst"` // for example, "192.55.66.77:80"
TxPackets uint64 `json:"txPkts"` // transferred packets
TxBytes uint64 `json:"txBytes"` // transferred bytes
RxPackets uint64 `json:"rxPkts"` // received packets
RxBytes uint64 `json:"rxBytes"` // received bytes
}
`
```
Several fields in the `Message` struct use the type `Node`. The `Node` struct is defined as:
```
`type Node struct {
// NodeID is the stable ID of the node.
NodeID string `json:"nodeId"` // for example, "n123456CNTRL"
// Name is the fully-qualified hostname of the node.
Name string `json:"name"` // for example, "carbonite.example.ts.net"
// Addresses are the Tailscale IP addresses of the node.
Addresses []string `json:"addresses"` // for example, ["100.12.34.56", "fd7a:115c:a1e0::0123:4567"]
// OS is the operating system of the node.
OS string `json:"os"` // for example, "linux"
// User is the user that owns the node.
// It is not populated if the node is tagged.
User string `json:"user"` // for example, "johndoe@example.com"
// Tags are the tags of the node.
// It is not populated if the node is owned by a user.
Tags []string `json:"tags"` // for example, ["tag:prod","tag:logs"]
}
`
```
The `Message.NodeID` field is verified by the Tailscale logs service as the actual node from which the message originated. The `Start`, `End`, `SrcNode`, `DstNodes`, `VirtualTraffic`, `SubnetTraffic`, `ExitTraffic`, and `PhysicalTraffic` fields are produced by individual nodes and recorded by the Tailscale logs service without validation. It is infeasible for Tailscale to verify the accuracy or truthfulness of this information. It is possible for malicious nodes to spoof this information.
When investigating network flow logs, you should identify a set of nodes that you consider more trustworthy (such as a server running in production) in contrast to those that might be more likely tampered with (such as an individual employee's work laptop). Discrepancies in network logs between the two might be indicative of malicious behavior.
You can use the following query parameters with the API:
* `start`: Required. Start of the timeframe, in [RFC 3339](https://www.rfc-editor.org/rfc/rfc3339.html) timestamp format, for the logs to retrieve. For example: `2022-07-20T00:00:00Z`.
* `end`: Required. End of the timeframe, in RFC3339 timestamp format, for the logs to retrieve. If `end` is greater than the latest known timestamp in the log, the API call will not block the call. This means consecutive queries with the same `start` and `end` times range may return different log entries that were not available during the earlier query.
`start` and `end` times are inclusive within nanosecond resolution.
All log messages are listed in chronological order from oldest to newest.
There is no pagination support or maximum page size for the API. All known logged network activity in the specified timeframe is returned.
#### [Example API call](#example-api-call)
This example assumes you have set up the following variables to use for your API call:
* `$ACCESS\_TOKEN`: An [API access token](/docs/reference/tailscale-api#authentication) to use when calling the Tailscale API. You can create an API access token in the [Keys](https://login.tailscale.com/admin/settings/keys) page of the admin console.
* `$TAILNET\_ID`: Your tailnet ID. You can find your tailnet ID in the [General](https://login.tailscale.com/admin/settings/general) page of the admin console.
* `$START`: The start of the timeframe for the logs to retrieve.
* `$END`: The end of the timeframe for the logs to retrieve.
```
`export ACCESS\_TOKEN=tskey-api-k123456CNTRL-0123456789abcdef
export TAILNET\_ID=example.com
export START=2022-10-28T22:40:00.000000000Z
export END=2022-10-28T22:40:04.999999999Z
`
```
This example makes a call to the `https://api.tailscale.com/api/v2/tailnet/{$TAILNET\_ID}/logging/network` endpoint.
```
`curl -u $ACCESS\_TOKEN: \\
"https://api.tailscale.com/api/v2/tailnet/{$TAILNET\_ID}/logging/network?start={$START}&end={$END}"
`
```
(You can also copy the command above from the [Network flow logs](https://login.tailscale.com/admin/logs/network) page of the admin console.)
The following code block contains an example log output:
```
`{
"logs": [
{
"start": "2025-10-28T22:39:51.890385065Z",
"end": "2025-10-28T22:39:56.886545512Z",
"logged": "2025-10-28T22:40:00.290605382Z",
"nodeId": "nBcdef1CNTRL",
"srcNode":
{
"nodeId": "nBcdef1CNTRL",
"addresses": ["100.111.22.33", "fd7a:115c:a1e0::c034:c374"],
"os": "linux",
"name": "pangolin.example.ts.net",
"user": "joe@example.com"
},
"dstNodes": [
{
"nodeId": "n22daC8CNTRL",
"addresses": ["100.111.44.55", "fd7a:115c:a1e0::abcd:0123"],
"os": "windows",
"name": "alice-laptop.example.ts.net",
"user": "alice@example.com"
},
{
"nodeId": "nX8fDaxCNTRL",
"addresses": ["100.44.55.66", "fd7a:115c:a1e0::a1b2:c3d4"],
"os": "linux",
"name": "prod.example.ts.net",
"tags": ["tag:prod"]},
{
"nodeId": "n7sUpZQCNTRL",
"addresses": ["100.99.88.77", "fd7a:115c:a1e0::91ab:84ab"],
"os": "linux",
"name": "logstream.remote.ts.net",
"tags": ["tag:logstream"]}
],
"virtualTraffic": [
{
"proto": 6,
"src": "100.111.22.33:21291",
"dst": "100.111.44.55:63281",
"txPkts": 2,
"txBytes": 108,
"rxPkts": 2,
"rxBytes": 112
},
{
"proto": 6,
"src": "100.111.22.33:864",
"dst": "100.44.55.66:2049",
"txPkts": 6,
"txBytes": 900,
"rxPkts": 3,
"rxBytes": 728
},
{
"proto": 6,
"src": "100.111.22.33:723",
"dst": "100.99.88.77:2049",
"txPkts": 4,
"txBytes": 596,
"rxPkts": 2,
"rxBytes": 432
},
{
"proto": 6,
"src": "100.111.22.33:21291",
"dst": "100.111.44.55:63280",
"txPkts": 2,
"txBytes": 108,
"rxPkts": 2,
"rxBytes": 112
}
],
"physicalTraffic": [
{
"src": "100.111.44.55:0",
"dst": "192.55.66.77:41641",
"txPkts": 4,
"txBytes": 384,
"rxPkts": 4,
"rxBytes": 384
},
{
"src": "100.44.55.66:0",
"dst": "192.168.0.101:41641",
"txPkts": 6,
"txBytes": 1136,
"rxPkts": 3,
"rxBytes": 848
},
{
"src": "100.99.88.77:0",
"dst": "143.110.111.222:41641",
"txPkts": 4,
"txBytes": 752,
"rxPkts": 2,
"rxBytes": 512
}
]
}
]
}
`
```
You can use the Go binary [`netlogfmt`](https://pkg.go.dev/tailscale.com/cmd/netlogfmt) to make the output more readable:
```
`curl -u $ACCESS\_TOKEN: \\
"https://api.tailscale.com/api/v2/tailnet/{$TAILNET\_ID}/logging/network?start={$START}&end={$END}" \\
| go run tailscale.com/cmd/netlogfmt@latest
`
```
The following code block contains an example log output:
```
`===========================================================================================
NodeID: aBcdef1CNTRL
Logged: 2022-10-28 15:40:00.290
Window: 2022-10-28 15:39:51.890 (4.996s)
----------------------------------------------------- Tx[P/s] Tx[B/s] Rx[P/s] Rx[B/s]
VirtualTraffic: 2.80 342.66 1.80 277.01
TCP: 100.111.22.33:864 -\> 100.44.55.66:2049 1.20 180.14 0.60 145.71
TCP: 100.111.22.33:723 -\> 100.99.88.77:2049 0.80 119.29 0.40 86.47
TCP: 100.111.22.33:21291 -\> 100.111.44.55:63281 0.40 21.62 0.40 22.42
TCP: 100.111.22.33:21291 -\> 100.111.44.55:63280 0.40 21.62 0.40 22.42
PhysicalTraffic: 2.80 454.75 1.80 349.07
100.44.55.66 -\> 192.168.0.101:41641 1.20 227.37 0.60 169.73
100.99.88.77 -\> 143.111.222.333:41641 0.80 150.52 0.40 102.48
100.111.44.55 -\> 192.55.66.77:41641 0.80 76.86 0.80 76.86
=============================================================================================
NodeID: uvwXyz2CNTRL
Logged: 2022-10-28 15:40:00.344
Window: 2022-10-28 15:39:53.286 (4.999s)
------------------------------------------------------- Tx[P/s] Tx[B/s] Rx[P/s] Rx[B/s]
VirtualTraffic: 28.60 3.32Ki 46.41 5.87Ki
TCP: 100.44.55.66:37500 -\> 100.103.145.6:22 9.20 1.45Ki 13.60 2.46Ki
TCP: 100.44.55.66:49288 -\> 100.99.88.77:22 12.80 1.22Ki 20.80 2.03Ki
TCP: 100.44.55.66:2049 -\> 100.111.22.33:864 0.60 145.62 1.20 180.02
TCP: 100.44.55.66:49284 -\> 100.99.88.77:22 1.00 88.01 2.00 236.03
TCP: 100.44.55.66:49282 -\> 100.99.88.77:22 1.00 88.01 2.00 236.03
TCP: 100.44.55.66:49278 -\> 100.99.88.77:22 1.00 88.01 2.00 236.03
TCP: 100.44.55.66:49280 -\> 100.99.88.77:22 1.00 88.01 2.00 236.03
TCP: 100.44.55.66:49286 -\> 100.99.88.77:22 1.00 88.01 1.80 193.62
ICMPv4: 100.44.55.66 -\> 100.99.88.77 1.00 84.01 1.00 84.01
PhysicalTraffic: 28.80 4.46Ki 46.41 7.74Ki
100.99.88.77 -\> 143.111.222.333:41641 18.80 2.48Ki 31.60 4.51Ki
100.103.145.6 -\> 64.71.162.170:41641 9.20 1.82Ki 13.60 3.01Ki
100.111.22.33 -\> 192.168.0.102:41641 0.60 169.62 1.20 227.23
`
```
To make it easier to recognize nodes in the output, the `netlogfmt` binary provides flags that resolve IP addresses to readable labels:
* `--resolve-addrs`: Convert Tailscale IP addresses to readable labels. Valid values include `nodeids` (which resolves IP addresses as node IDs), `names` (which resolves IP addresses as hostnames), or `users` (which resolves IP addresses as the user or tags that own the machine). Since Tailscale v1.92, network flow logs automatically embed node information directly into the logs. For logs generated by older clients, you must also specify `--api-key` and `--tailnet-name` as parameters to `netlogfmt` when using the `--resolve-addrs` flag.
* `--api-key`: Specifies the [API access token](/docs/reference/tailscale-api#authentication) to use for the Tailscale API. This can be the same API access token you used for the `network-logs` endpoint or another valid API access token.
* `--tailnet-name`: The same organization name you passed to the `network-logs` endpoint.
This example shows how to use the `netlogfmt` flags:
```
`curl -u $ACCESS\_TOKEN: -X GET \\
"https://api.tailscale.com/api/v2/tailnet/{$TAILNET\_ID}/logging/network?start={$START}&end={$END}" \\
| go run tailscale.com/cmd/netlogfmt@latest --resolve-addrs=names --api-key=$ACCESS\_TOKEN --tailnet-name=$TAILNET
`
```
As mentioned above, the `ACCESS\_TOKEN` and `TAILNET` is only needed to resolve addresses for clients older than v1.92.
The following code block contains an example log output.
```
`=======================================================================================
NodeID: aBcdef1CNTRL
Logged: 2022-10-28 15:40:00.290
Window: 2022-10-28 15:39:51.890 (4.996s)
------------------------------------------------- Tx[P/s] Tx[B/s] Rx[P/s] Rx[B/s]
VirtualTraffic: 2.80 342.66 1.80 277.01
TCP: carbonite:864 -\> prism:2049 1.20 180.14 0.60 145.71
TCP: carbonite:723 -\> diamond:2049 0.80 119.29 0.40 86.47
TCP: carbonite:21291 -\> glass:63281 0.40 21.62 0.40 22.42
TCP: carbonite:21291 -\> glass:63280 0.40 21.62 0.40 22.42
PhysicalTraffic: 2.80 454.75 1.80 349.07
prism -\> 192.168.0.101:41641 1.20 227.37 0.60 169.73
diamond -\> 143.110.111.222:41641 0.80 150.52 0.40 102.48
glass -\> 192.55.66.77:41641 0.80 76.86 0.80 76.86
======================================================================================
NodeID: uvwXyz2CNTRL
Logged: 2022-10-28 15:40:00.344
Window: 2022-10-28 15:39:53.286 (4.999s)
------------------------------------------------ Tx[P/s] Tx[B/s] Rx[P/s] Rx[B/s]
VirtualTraffic: 28.60 3.32Ki 46.41 5.87Ki
TCP: prism:37500 -\> glass:22 9.20 1.45Ki 13.60 2.46Ki
TCP: prism:49288 -\> diamond:22 12.80 1.22Ki 20.80 2.03Ki
TCP: prism:2049 -\> carbonite:864 0.60 145.62 1.20 180.02
TCP: prism:49284 -\> diamond:22 1.00 88.01 2.00 236.03
TCP: prism:49282 -\> diamond:22 1.00 88.01 2.00 236.03
TCP: prism:49278 -\> diamond:22 1.00 88.01 2.00 236.03
TCP: prism:49280 -\> diamond:22 1.00 88.01 2.00 236.03
TCP: prism:49286 -\> diamond:22 1.00 88.01 1.80 193.62
ICMPv4: prism -\> diamond 1.00 84.01 1.00 84.01
PhysicalTraffic: 28.80 4.46Ki 46.41 7.74Ki
diamond -\> 143.110.111.222:41641 18.80 2.48Ki 31.60 4.51Ki
glass -\> 64.71.111.222:41641 9.20 1.82Ki 13.60 3.01Ki
carbonite -\> 192.168.0.102:41641 0.60 169.62 1.20 227.23
`
```
## [Network flow logs streaming](#network-flow-logs-streaming)
Log streaming lets you stream network flow logs into a security information and event management ([SIEM](/learn/security-information-and-event-management)) system. For more information, refer to [Log streaming](/docs/features/logging/log-streaming).
## [Limitations](#limitations)
* Only nodes using Tailscale v1.34 or later send networking telemetry to the Tailscale logs service.
* You can only access network logs using the API and as a [streaming source](/docs/features/logging/log-streaming) for SIEM systems. There is no network logs viewing functionality in the Tailscale admin console.
* Network flow logs are for logging, not monitoring. The admin console does not contain a live readout of the connections between nodes. Additionally, network logs don't include information on whether a node is online or idle. The logs only indicate whether there was network traffic.
* Network logs do not include individual packet transfers. Logs capture when connections are active, which could include multiple data flows.
* Tailscale only logs successful connects. If a connection attempt results in denied access, the attempt isn't logged.
* Traffic information at the physical layer is gathered at a slightly different time than the virtual layer, so packets flowing through the virtual layer might not precisely line up with those at the physical layer.
* Public IP addresses are not logged as either a destination or source. That is, a connection from your tailnet through an exit node does not log where the traffic is going, and a connection from the public internet through an exit node does not log where the traffic is returning from. To preserve privacy, Tailscale doesn't gather detailed information about individual connections.
* If [Destination Logging](/docs/features/exit-nodes#destination-logging-in-network-flow-logs) is enabled by the administrator, the protocol, source port, and destination information are logged.
* The user authenticated on a source or destination host is not logged. To map a node to a user, you can use the [`/api/v2/tailnet/:tailnet/device`](/api#tag/devices/GET/tailnet/{tailnet}/devices) method and examine the `user` field.
* Network logging is performed client-side. Tailscale cannot guarantee the delivery or integrity of the client logs. Tailscale cannot fully guarantee client log latency thresholds—that is, logs are not delivered in real-time.
* Enabling network flow logs might result in a slight performance impact because the client does additional work to track necessary metrics. The incremental load is spread across the fleet, not concentrated on a single host.
On this page
* [How it works](#how-it-works)
* [Network logs structure](#network-logs-structure)
* [Enable network flow logs](#enable-network-flow-logs)
* [Disable network flow logs](#disable-network-flow-logs)
* [Access network logs](#access-network-logs)
* [Access network logs through the API](#access-network-logs-through-the-api)
* [Example API call](#example-api-call)
* [Network flow logs streaming](#network-flow-logs-streaming)
* [Limitations](#limitations)
Scroll to top