Tailscale Peer Relays · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Tailscale Peer Relays
Last validated: Feb 4, 2026
Tailscale Peer Relays let you use devices in your Tailscale network (known as a [tailnet](/docs/concepts/tailnet)) as high-throughput relay servers when [direct connections](/docs/reference/connection-types) aren't possible due to network conditions such as [a strict NAT environment](/docs/reference/device-connectivity).
Normally, Tailscale relies on its globally distributed [DERP servers](/docs/reference/derp-servers) to relay traffic when Tailscale can't establish direct connections between devices. While DERP servers are effective at relaying traffic, they can introduce additional latency, especially for high-throughput applications. When you configure a device as a peer relay, other devices in the same tailnet can use it to relay traffic for client-to-client connections when a direct connection isn't possible. Tailscale first attempts to use any available peer relays in the tailnet before falling back to DERP servers.
The following related video provides additional context and examples.
## [Use cases](#use-cases)
Peer relays are particularly useful in scenarios where you can't establish direct connections between devices due to network restrictions and you require lower latency and higher throughput than what DERP servers can provide. Common use cases include:
* **Access restricted infrastructure**: Accessing devices behind strict NATs or firewalls where direct connections are not possible, such as in certain corporate or cloud environments.
* **File transfers**: When transferring large files between devices, peer relays can offer higher throughput, speeding up the transfer process.
* **Media streaming**: For streaming high-definition video or audio between devices, peer relays can help maintain a smooth streaming experience with less buffering.
Peer relays are not intended to replace DERP servers. They complement DERP by providing an additional option for relaying traffic within a tailnet, particularly when you require lower latency and higher throughput. DERP servers still play a crucial role in negotiating connections and providing fallback relay options when peer relays are unavailable.
## [How it works](#how-it-works)
When you configure a device as a peer relay, it listens for incoming relay traffic on a specified UDP port. Other devices in the tailnet can then use this device to relay traffic for client-to-client connections when direct connections aren't possible.
When a device attempts to connect to another device in the tailnet, it first checks if a direct connection is possible. If not, it looks for available peer relays in the tailnet. If a peer relay is available and accessible, the device establishes a connection through the peer relay. If no peer relays are available, the device falls back to using DERP servers to relay the traffic.
## [Prerequisites](#prerequisites)
Before you can use the peer relay feature, ensure you meet the minimum requirements for your Tailscale account and the devices you want to configure as peer relays:
### [Account requirements](#account-requirements)
To use the peer relay feature, you must have:
* A Tailscale account with access to the tailnet where you want to set up peer relays.
* At least one device in the tailnet that meets the peer relay device requirements.
* An account with [Owner, Admin, or Network admin](/docs/reference/user-roles) permissions.
### [Peer relay device requirements](#peer-relay-device-requirements)
A device must meet the following requirements to function as a peer relay:
* A device running a supported operating system. You can use any operating system other than iOS, Apple TV, or Android.
* Tailscale version 1.86 or later.
* Sufficient network bandwidth and low latency to effectively relay traffic for other devices.
* At least one configurable UDP port you can use for peer relay traffic. This port must be accessible from other devices in the tailnet. Refer to [security and access control](#security-and-access-control) for more information about configuring network settings.
### [Other tailnet devices requirements](#other-tailnet-devices-requirements)
Devices in the tailnet that use peer relays must meet the following requirements:
* Access to the peer relay devices (through applicable [access control policies](/docs/features/access-control)).
* Tailscale version 1.86 or later.
* Access to the UDP port configured for peer relay traffic on the peer relay devices.
There are no operating system restrictions for devices that use peer relays; they can run any supported Tailscale operating system, including iOS and Apple TV.
## [Get started](#get-started)
Setting up peer relay functionality in a tailnet involves two primary steps. First, you need to configure a device to act as a peer relay. Then, you need to create a [grant policy](/docs/features/access-control/grants) to permit other devices in the tailnet to use the peer relay.
### [Step 1: Configure a device as a peer relay](#step-1-configure-a-device-as-a-peer-relay)
To use the peer relay feature for faster relayed connections, you must configure at least one device in the tailnet to function as a peer relay. Only devices that meet the [peer relay requirements](#peer-relay-device-requirements) and that you explicitly designate can act as peer relays.
To set up a device as a peer relay:
1. On the device you want to configure as a peer relay, start the Tailscale client and authenticate it to your tailnet.
2. Open a terminal or command prompt on the device.
3. Use the [`tailscale set`](/docs/reference/tailscale-cli#set) command with the `--relay-server-port` option to specify the UDP port for peer relay traffic. For example, to configure the device to use UDP port `40000` for peer relay traffic, run the following command:
```
`tailscale set --relay-server-port=40000
`
```
You can also use the `--relay-server-static-endpoints` flag with the `tailscale set` command to specify additional [static endpoints](#static-endpoints) to advertise to peer relay participants.
### [Step 2: Create a peer relay policy](#step-2-create-a-peer-relay-policy)
Before devices in the tailnet can use devices you designate as peer relays, you need to create a [grant](/docs/features/access-control/grants) policy that lets them do so. The grant policy uses the `tailscale.com/cap/relay` [application capability](/docs/features/access-control/grants/grants-app-capabilities) to specify which devices can use the peer relay functionality. You can create the grant policy using the admin console's JSON editor, the [visual policy editor](/docs/features/visual-editor), or the [Tailscale API](/docs/reference/tailscale-api).
To create a grant that enables peer relay capabilities using the JSON editor:
1. Open the [Access controls](https://login.tailscale.com/admin/acls/file) page of the admin console.
2. Select the **JSON editor** tab to update the tailnet policy file using JSON.
3. Locate the `grants` section of the policy file.
4. Add a policy to the `grants` section of the policy file that specifies the `src` (devices behind a restrictive NAT that need to be accessed through the peer relay), the `dst` (the peer relay device), and the `peer-relay` application capability. For example, the following example lets all devices with the tag `tag:us-east-vpc` use peer relays tagged with `tag:us-east-relays`.
```
`{
"grants": [
{
"src": ["tag:us-east-vpc"], // Devices that can be accessed through the peer relay
"dst": ["tag:us-east-relays"], // Devices functioning as peer relays for the src devices
"app": {
"tailscale.com/cap/relay": [] // The relay capability doesn't require any parameters
}
}
]
}
`
```
You can reference peer relay devices using [tags](/docs/features/tags), hostname, [IP set](/docs/features/tailnet-policy-file/ip-sets), or Tailscale IP addresses in the `dst` field of the access rule. The `app` field must include the `tailscale.com/cap/relay` capability to enable peer relay functionality for the specified devices. It does not require any additional parameters.
After you create the peer relay grant policy, devices in the tailnet can start using the peer relay for client-to-client connections when direct connections aren't possible. When a device can't connect directly to another device, it first checks for available peer relays in the tailnet. If no peer relays are available, the device falls back to using DERP servers.
Avoid using overly permissive targets for the `src` field of the grant policy (such as `\*`). For example, using `\*` would make all devices in the tailnet attempt to use the peer relay devices in the `dst`, potentially leading to unintended traffic routing and high latency. Instead, specify precise device [tags](/docs/features/tags), hostnames, or [IP sets](/docs/features/tailnet-policy-file/ip-sets) to limit which devices can use the peer relay.
As a rule of thumb, the `src` devices in the grant policy should typically be devices in a stable physical location behind a strict NAT or firewall that prevents direct connections. This typically includes devices in corporate networks or cloud environments. It usually does not include mobile devices or laptops that frequently change locations and network conditions.
### [Step 3: Observe peer relay traffic](#step-3-observe-peer-relay-traffic)
Generate traffic to test the peer relay configuration. Then, use the `tailscale status` command to monitor the device's status and verify that it is functioning as a peer relay. When a tailnet device uses a peer relay, the connection type of that device changes to `peer-relay`.
Run the [`tailscale status`](/docs/reference/tailscale-cli#status) command and filter the output for `peer-relay` entries:
```
`tailscale status | grep peer-relay
`
```
When a device is using a peer relay, it returns the device's connection type as `peer-relay` (instead of `direct` or `relay`). For example:
```
`\<tailscale-ip-address\> \<hostname\> \<user\> \<os\> active; peer-relay \<ip-address\>:\<udp-port\>:vni:\<vni-id\>, tx \<bytes-sent\> rx \<bytes-received\>
`
```
You can also use the [`tailscale ping`](/docs/reference/tailscale-cli#ping) command to test connectivity between devices and observe whether the connection uses a peer relay.
## [Disable Peer Relay](#disable-peer-relay)
To disable peer relay for a device use the [`tailscale set`](/docs/reference/tailscale-cli#set) command with the `--relay-server-port` flag set to an empty string:
```
`tailscale set --relay-server-port=""
`
```
## [Examples](#examples)
Example scenarios in which you would use Tailscale Peer Relays include:
* Accessing devices in a specific geographic region using peer relays located in that region to reduce latency.
* Using peer relays to connect to devices behind strict NATs or firewalls where direct connections are not possible.
* Setting up dedicated peer relay devices to handle high-throughput traffic for specific applications or services.
The following peer relay policy examples illustrate what the grant policy looks like in different scenarios.
### [Use tagged peer relay devices](#use-tagged-peer-relay-devices)
The following example lets all devices with the tag `tag:us-east-vpc` use peer relay devices tagged with `tag:us-east-relays` as underlay network relays when communicating with other devices on the tailnet. That means that other devices in the tailnet can use a device tagged with `tag:us-east-relays` as an underlay network relay when communicating with devices tagged with `tag:us-east-vpc`.
```
`{
"grants": [
{
"src": ["tag:us-east-vpc"], // Devices behind a restrictive NAT that need to be accessed through the peer relay
"dst": ["tag:us-east-relays"], // The devices functioning as peer relays for the src devices
"app": {
"tailscale.com/cap/relay": []
}
}
]
}
`
```
For this to work, you must also [configure the peer relay devices](#step-1) using the `tailscale set` command and create a grant access control policy that permits overlay network access to devices with the `tag:us-east-vpc` tag.
For example, this grant policy lets all members of the tailnet access devices with the `tag:us-east-vpc` tag on TCP ports 80 and 443.
```
`{
"grants": [
{
"src": ["autogroup:member"],
"dst": ["tag:us-east-vpc"],
"ip": ["tcp:80","tcp:443"]
}
]
}
`
```
### [Use self as peer relay](#use-self-as-peer-relay)
It's possible for devices to use themselves as a peer relay. The following example lets the device with the hostname `us-west-1` use itself as a peer relay. You might use this configuration in a scenario where you need to block all incoming ports to a device except for the UDP port used for peer relay traffic.
```
`{
"grants": [
{
"src": ["us-west-1"],
"dst": ["us-west-1"],
"app": {
"tailscale.com/cap/relay": []
}
}
]
}
`
```
For this to work, you must also [configure the device as a peer relay](#step-1) using the `tailscale set` with the UDP port for peer relay traffic.
## [Security and access control](#security-and-access-control)
Peer relays can only relay traffic for devices in the same tailnet. The grant rule that assigns the `tailscale.com/cap/relay` capability acts as the access control mechanism — a device without that grant can't allocate relay bindings on the peer relay. You don't need a separate network grant to the peer relay device itself.
The UDP port you configure for peer relay traffic must be open and accessible from other devices in the tailnet. For example, if you configure a peer relay to use UDP port `40000`, ensure that any firewalls or network security settings allow incoming traffic on that port.
## [Static endpoints](#static-endpoints)
You can use the `--relay-server-static-endpoints` flag with the [`tailscale set`](/docs/reference/tailscale-cli#set) command to specify one or more additional static endpoints for the peer relay to advertise to other tailnet devices. Doing so is useful in network environments where users use port forwarding or users use load balancers like AWS Network Load Balancer ([NLB](https://aws.amazon.com/elasticloadbalancing/network-load-balancer/)). In these scenarios, the peer relay might not automatically discover all possible endpoints because it can't send outbound endpoint discovery packets over all possible paths.
It accepts a comma-separated list of `ip:port` pairs (or an empty string to not advertise any static endpoints). Each `ip:port` pair corresponds to an additional endpoint that the peer relay advertises to other tailnet devices.
```
`tailscale set --relay-server-port=\<port\> --relay-server-static-endpoints="\<ip-address-1\>:\<port\>,\<ip-address-2\>:\<port\>"
`
```
For example, to configure the peer relay to advertise two additional static endpoints (`[2001:db8::1]:40000` and `192.0.2.2:40000`), you would run the following command:
```
`tailscale set --relay-server-port=40000 --relay-server-static-endpoints="[2001:db8::1]:40000,192.0.2.2:40000"
`
```
On this page
* [Use cases](#use-cases)
* [How it works](#how-it-works)
* [Prerequisites](#prerequisites)
* [Account requirements](#account-requirements)
* [Peer relay device requirements](#peer-relay-device-requirements)
* [Other tailnet devices requirements](#other-tailnet-devices-requirements)
* [Get started](#get-started)
* [Step 1: Configure a device as a peer relay](#step-1-configure-a-device-as-a-peer-relay)
* [Step 2: Create a peer relay policy](#step-2-create-a-peer-relay-policy)
* [Step 3: Observe peer relay traffic](#step-3-observe-peer-relay-traffic)
* [Disable Peer Relay](#disable-peer-relay)
* [Examples](#examples)
* [Use tagged peer relay devices](#use-tagged-peer-relay-devices)
* [Use self as peer relay](#use-self-as-peer-relay)
* [Security and access control](#security-and-access-control)
* [Static endpoints](#static-endpoints)
Scroll to top