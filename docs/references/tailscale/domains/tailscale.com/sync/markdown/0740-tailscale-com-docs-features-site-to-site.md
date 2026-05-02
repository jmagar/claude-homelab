Site-to-site networking · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Site-to-site networking
Last validated: Dec 8, 2025
Site-to-site networking (also known as [layer 3 (L3) routing](/docs/concepts/tailscale-osi)) creates a bridge between two or more distinct networks, letting devices in different subnets communicate with each other without a direct connection. You can create a site-to-site connection using Tailscale [subnet routers](/docs/features/subnet-routers), which lets you connect entire networks (such as different physical locations or cloud environments) together securely through your Tailscale network (known as a tailnet). Example use cases include connecting branch offices to a central office or connecting cloud environments to on-premises networks.
Using Tailscale to create a site-to-site connection is a powerful alternative to traditional methods of connecting networks, such as [VPNs](https://en.wikipedia.org/wiki/Virtual_private_network) or [multi-protocol label switching (MPLS)](https://en.wikipedia.org/wiki/Multiprotocol_Label_Switching), which often require complex configuration and management. It lets you leverage Tailscale's encrypted connections to securely connect networks without complicated configurations or management overhead.
## [Requirements and limitations](#requirements-and-limitations)
The subnets and subnet router devices within a tailnet must meet the following requirements for site-to-site networking to work:
* The subnets must **not** have identical [CIDR](https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing) ranges. If you need multiple subnet routers advertising the exact same subnet (for example, two routers both advertising `10.0.0.0/24`), use [high availability](/docs/how-to/set-up-high-availability) or [4via6 subnet routing](/docs/features/subnet-routers/4via6-subnets).
* Both subnet routers must use a Linux-based operating system.
### [Overlapping subnet routes with different prefix lengths](#overlapping-subnet-routes-with-different-prefix-lengths)
Tailscale supports subnet routers advertising overlapping routes with different prefix lengths. When multiple subnet routers advertise overlapping subnets, Tailscale uses longest prefix matching (LPM) to route traffic to the most specific route available.
For example, if you have:
* Subnet router A advertising `10.0.0.0/16`
* Subnet router B advertising `10.0.0.0/24`
Traffic will be routed as follows:
* `10.0.0.1` routes through subnet router B (matched by the more specific `/24` route)
* `10.0.1.1` routes through subnet router A (only matched by the `/16` route)
This behavior follows standard IP routing principles and can be useful for scenarios where you want more granular control over routing for specific subnets within a larger address space.
## [Create a site-to-site connection](#create-a-site-to-site-connection)
Creating a site-to-site connection involves configuring a device in each subnet to act as a subnet router, approving the subnet routers from the [Machines](https://login.tailscale.com/admin/machines) of the admin console, updating the tailnet access control policies, and configuring the devices in each subnet to use the designated subnet router for the correct routes.
### [Step 1: Select a subnet router](#step-1-select-a-subnet-router)
The first step is to select a device within the subnet to act as the designated subnet router. This device must use a Linux-based operating system.
### [Step 2: Configure the subnet router](#step-2-configure-the-subnet-router)
After selecting a device in the subnet to function as the subnet router, you must configure it to act as a subnet router. Configuring the subnet router involves [installing the Tailscale client](/docs/install), enabling IP address forwarding, starting the Tailscale client with the correct configuration options, and configuring the device's `iptables` settings.
#### [IP address forwarding](#ip-address-forwarding)
If your Linux system has a `/etc/sysctl.d` directory, use:
```
`echo 'net.ipv4.ip\_forward = 1' | sudo tee -a /etc/sysctl.d/99-tailscale.conf
echo 'net.ipv6.conf.all.forwarding = 1' | sudo tee -a /etc/sysctl.d/99-tailscale.conf
sudo sysctl -p /etc/sysctl.d/99-tailscale.conf
`
```
Otherwise, use:
```
`echo 'net.ipv4.ip\_forward = 1' | sudo tee -a /etc/sysctl.conf
echo 'net.ipv6.conf.all.forwarding = 1' | sudo tee -a /etc/sysctl.conf
sudo sysctl -p /etc/sysctl.conf
`
```
#### [Subnet router configuration options](#subnet-router-configuration-options)
Configuring a device as a subnet router involves specifying the subnet routes to advertise, disabling source network address translation (SNAT), and enabling the device to accept routes. You can use the [`tailscale up`](/docs/reference/tailscale-cli#up) or [`tailscale set`](/docs/reference/tailscale-cli#set) CLI commands to set these configuration options.
|**Configuration option**|**CLI flag**|**Description**|
|Advertise subnet routes|`--advertise-routes=\<CIDR\>`|The `--advertise-routes` flag specifies a CIDR range of the IP addresses to be exposed to the tailnet. Access to those addresses is controlled by Tailscale access control policies.|
|Disable source network address translation (SNAT)|`--snat-subnet-routes=false` (Linux only)|The `--snat-subnet-routes=false` flag disables source NAT (SNAT). By default, a device behind a subnet router sees traffic as originating from the subnet router. This reduces routing complexity but prevents traversing multiple networks. By disabling source NAT, the end device sees the IP address of the originating device as the source, which might be a Tailscale IP address or an address behind another subnet router.|
|Accept routes|`--accept-routes`|The `--accept-routes` flag accepts the advertised routes of all other subnet routers in the tailnet.|
When setting up subnet routers for high availability (HA), be careful with the `--accept-routes` flag. If you turn on `--accept-routes` for subnet routers that share the same routes in the same region, the standby router will accept its own advertised routes from the primary router.
This leads to an inefficient routing path. The standby router will send traffic for its directly connected subnet through the primary router instead. For example, if both subnet routers advertise and accept the same route, such as `192.168.1.0/24`, the standby router will send all `192.168.1.0/24` traffic through the primary router, even though it is directly connected to that network.
For most HA subnet router setups, use the `--advertise-routes` flag alone. Avoid using `--accept-routes` unless you specifically need that routing behavior.
#### [Clamp the MSS to the MTU](#clamp-the-mss-to-the-mtu)
You should also clamp the [maximum segment size (MSS)](https://en.wikipedia.org/wiki/Maximum_segment_size) to the [maximum transmission unit (MTU)](https://en.wikipedia.org/wiki/Maximum_transmission_unit). You can do this using [`iptables`](https://en.wikipedia.org/wiki/iptables). The following command updates the Tailscale network interface (`tailscale0`) to clamp MSS to MTU.
```
`iptables -t mangle -A FORWARD -o tailscale0 -p tcp -m tcp \\
--tcp-flags SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu
`
```
### [Step 3: Approve the subnet router](#step-3-approve-the-subnet-router)
After selecting and configuring the subnet router, you must approve it from the Machines page of the admin console. If you used an [auto approver](/docs/reference/syntax/policy-file#autoapprovers) policy in the tailnet policy file for the device, you don't need to approve the subnet router manually.
1. Open the [Machines](https://login.tailscale.com/admin/machines) page of the admin console.
2. Locate the subnet router devices by locating the **Subnets** badge or using the [`property:subnet`](https://login.tailscale.com/admin/machines?q=property:subnet) filter.
3. For each subnet router:
1. Select the menu \> **Edit route settings**.
2. Approve the device.
You might prefer to [disable key expiry](/docs/features/access-control/key-expiry) on your subnet routers to avoid having to periodically reauthenticate. If you are using [tags](/docs/features/tags), [key expiry is disabled by default](/docs/features/tags#key-expiry).
### [Step 4: Update tailnet access control policies](#step-4-update-tailnet-access-control-policies)
You must update the [access control policies](/docs/features/access-control) for your tailnet to allow communication between the subnets by creating access rules ([grants](/docs/features/access-control/grants)) to permit the subnets to connect.
You can do this from the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console using either the [visual editor](/docs/features/visual-editor) or the JSON editor.
The following examples permit all traffic between the subnets.
#### [JSON editor](#json-editor)
To use the JSON editor to create access rules between the subnets, you must create two access rules: one for each direction of traffic between the subnets.
1. Open the [Access controls](https://login.tailscale.com/admin/acls/file) page of the admin console.
2. Select the **JSON editor** tab to update the tailnet policy file using JSON.
3. Locate the `grants` section of the policy file.
4. Add two access rules to the `grants` section of the policy file: one for each direction of traffic between the subnets.
The end result should look similar to the following example, which permits all traffic between two subnets. Replace `\<first-subnet-CIDR\>` and `\<second-subnet-CIDR\>` with the actual CIDR ranges of the subnets.
```
`{
"grants": [
{
"src": [ \<first-subnet-CIDR\> ],
"dst": [ \<second-subnet-CIDR\> ],
"ip": ["\*"]
},
{
"src": [ \<second-subnet-CIDR\> ],
"dst": [ \<first-subnet-CIDR\> ],
"ip": ["\*"]
}
]
}
`
```
#### [Visual editor](#visual-editor)
To use the [visual editor](/docs/features/visual-editor) to create access rules between the subnets, you must create two access rules: one for each direction of traffic between the subnets.
1. Create an access rule to allow traffic from the first subnet to the second subnet:
1. Open the [Access controls](https://login.tailscale.com/admin/acls/file) page of the admin console.
2. Select the [Visual editor](https://login.tailscale.com/admin/acls/visual) tab.
3. Select **Add rule**.
4. In the **Source** field, enter the CIDR range of the first subnet.
5. In the **Destination** field, enter the CIDR range of the second subnet.
6. In the **Port and protocol** field, select **All ports and protocols**.
7. (Optional) Add a descriptive note to the access rule to help you identify it later.
8. Select **Save grant**.
9. Create an access rule to allow traffic from the second subnet to the first subnet:
1. Open the [Access controls](https://login.tailscale.com/admin/acls/file) page of the admin console.
2. Select the [Visual editor](https://login.tailscale.com/admin/acls/visual) tab.
3. Select **Add rule**.
4. In the **Source** field, enter the CIDR range of the second subnet.
5. In the **Destination** field, enter the CIDR range of the first subnet.
6. In the **Port and protocol** field, select **All ports and protocols**.
7. (Optional) Add a descriptive note to the access rule to help you identify it later.
8. Select **Save grant**.
This creates two access rules using the grants syntax. They apply immediately as soon as you save them.
### [Step 5: Configure the other subnet devices](#step-5-configure-the-other-subnet-devices)
After configuring and approving the subnet router, make sure the devices in the subnet use the designated subnet router for the correct routes. The best way to configure the devices in the subnet depends on your infrastructure. For example, if the subnet devices already use the subnet router as the default gateway, you don't need to configure them because they will automatically use the subnet router for all traffic (unless a more specific route applies). If the subnet devices don't use the subnet router as the default gateway, you must configure them to use the subnet router for the correct routes.
For example, on Linux devices, you can use the [`ip route` command](https://www.man7.org/linux/man-pages/man8/ip-route.8.html). You don't need to configure the subnet devices if the subnet router you selected for the subnet is already the default gateway for the subnet.
```
`ip route add \<first-subnet-CIDR\> via \<first-subnet-router-IP-address\>
ip route add \<second-subnet-CIDR\> via \<second-subnet-router-IP-address\>
`
```
The `ip route` commands do not persist after rebooting. You must run them again after each reboot. Depending on your setup, you can make the route settings persistent by adding them to your network manager or [`netplan`](https://netplan.io/) configuration. Alternatively, you can manage route settings with a DHCP server on your network.
If the subnet is in a cloud environment, such as [AWS](/docs/install/cloud/aws), you can usually update the cloud provider's routing tables instead of configuring each device directly.
## [Example scenario](#example-scenario)
The following sections demonstrate using two subnet routers to connect two subnets within a tailnet. The following table documents the example subnets and subnet routers.
|**Subnet name**|**Subnet CIDR range**|**Subnet router IP address**|
|Subnet A|`192.0.2.0/24`|`192.0.2.2` (subnet router A)|
|Subnet B|`172.16.100.0/24`|`172.16.100.2` (subnet router A)|
To create a site-to-site connection between subnet A and subnet B, follow these steps:
1. Configure both subnet routers (subnet A at `192.0.2.2` and subnet B at `172.16.100.2`):
1. [Install the Tailscale client](/docs/install) on each subnet router.
2. [Enable IP forwarding](#ip-address-forwarding).
3. [Configure the Tailscale client](#subnet-router-configuration-options).
For the `192.0.2.2` subnet router, use `192.0.2.0/24`:
```
`tailscale up --advertise-routes=192.0.2.0/24 --snat-subnet-routes=false --accept-routes
`
```
For the `172.16.100.2` subnet router, use `172.16.100.0/24`:
```
`tailscale up --advertise-routes=172.16.100.0/24 --snat-subnet-routes=false --accept-routes
`
```
The `--snat-subnet-routes` flag only works if the operating system is Linux.
4. Configure `iptables` to [clamp the MSS to the MTU](#clamp-the-mss-to-the-mtu).
5. [Approve the subnet routes](#approve-the-subnet-router).
6. [Configure the subnet devices](#configure-the-other-subnet-devices) by running the following commands on each device in the subnet (except the subnet router):
1. For each device in the `192.0.2.0/24` subnet (except the subnet router), run the following commands:
```
`ip route add 100.64.0.0/10 via 192.0.2.2
ip route add 172.16.100.0/24 via 192.0.2.2
`
```
2. For each device in the `172.16.100.0/24` subnet (except the subnet router), run the following commands:
```
`ip route add 100.64.0.0/10 via 172.16.100.2
ip route add 192.0.2.0/24 via 172.16.100.2
`
```
3. Update the tailnet [access control policies](/docs/features/access-control) to allow communication between the subnets. In the following example, the tailnet policy file permits all traffic between the subnets using [grants](/docs/features/access-control/grants):
```
`{
"grants": [
{
"src": ["100.64.0.0/10"], // CIDR range of subnet A
"dst": ["192.0.2.0/24"], // CIDR range of subnet B
"ip": ["\*"]
},
{
"src": ["192.0.2.0/24"], // CIDR range of subnet B
"dst": ["100.64.0.0/10"], // CIDR range of subnet A
"ip": ["\*"]
}
]
}
`
```
4. Test the [connectivity](/docs/reference/troubleshooting/connectivity) between subnet A and subnet B:
Now a device in subnet A can connect to a device in subnet B (and vice versa) without either needing to install the Tailscale client. You can test the connection by running the `ping` command from a subnet A device to a subnet B device. For example, ping `172.16.100.3` from `198.0.2.3`:
```
`ping 172.16.100.3
PING 172.16.100.3 (172.16.100.3) 56(84) bytes of data.
64 bytes from 172.16.100.3: icmp\_seq=1 ttl=64 time=9.34 ms
64 bytes from 172.16.100.3: icmp\_seq=2 ttl=64 time=3.85 ms
`
```
On this page
* [Requirements and limitations](#requirements-and-limitations)
* [Overlapping subnet routes with different prefix lengths](#overlapping-subnet-routes-with-different-prefix-lengths)
* [Create a site-to-site connection](#create-a-site-to-site-connection)
* [Step 1: Select a subnet router](#step-1-select-a-subnet-router)
* [Step 2: Configure the subnet router](#step-2-configure-the-subnet-router)
* [IP address forwarding](#ip-address-forwarding)
* [Subnet router configuration options](#subnet-router-configuration-options)
* [Clamp the MSS to the MTU](#clamp-the-mss-to-the-mtu)
* [Step 3: Approve the subnet router](#step-3-approve-the-subnet-router)
* [Step 4: Update tailnet access control policies](#step-4-update-tailnet-access-control-policies)
* [JSON editor](#json-editor)
* [Visual editor](#visual-editor)
* [Step 5: Configure the other subnet devices](#step-5-configure-the-other-subnet-devices)
* [Example scenario](#example-scenario)
Scroll to top