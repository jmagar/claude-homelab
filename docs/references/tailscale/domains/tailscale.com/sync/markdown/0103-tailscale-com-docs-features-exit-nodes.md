Exit nodes (route all traffic) · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Exit nodes (route all traffic)
Last validated: Dec 15, 2025
Exit nodes are available for [all plans](/pricing).
By default, Tailscale acts as an overlay network: it only routes traffic between devices running Tailscale, but doesn't touch your public internet traffic, such as when you visit Google or Twitter. The overlay network configuration is ideal for most people who need secure communication between sensitive devices (such as company servers or home computers), but don't need extra layers of [encryption](/docs/concepts/tailscale-encryption) or latency for their public internet connection.
However, there might be times when you want Tailscale to route your public internet traffic. For example, you might want to route all your public internet traffic if:
* You're in a coffee shop with untrusted Wi-Fi.
* You're traveling overseas and need access to an online service (such as banking) only available in your home country.
You can route all your public internet traffic by setting a device on your network as an exit node, then configuring other devices to send traffic through it. When you route all traffic through an exit node, you're effectively using [default routes](https://en.wikipedia.org/wiki/Default_route) (`0.0.0.0/0`, `::/0`), similar to how you would if you were using a typical VPN.
## [Benefits](#benefits)
* **Secure all traffic**: Exit nodes secure all traffic, including traffic to internet sites and applications.
* **Scale globally**: Deploy exit nodes around the globe to meet your scale and geographical needs.
* **Increase visibility**: [Destination logging](#destination-logging-in-network-flow-logs) provides increased visibility of traffic across the tailnet and forensic analysis during security incidents.
## [Use cases](#use-cases)
* **Traveling workforce**: Ensure all internet traffic is secured for your traveling workforce regardless of the physical network they're using.
* **Testing from different locations**: Test your applications from different locations by deploying and selecting exit nodes around the globe.
* **Meet compliance needs**: If you have regulatory or compliance needs that require your workforce to use a VPN, exit nodes can help.
## [How it works](#how-it-works)
The exit node feature lets you route all traffic through a specific device on your Tailscale network (known as a tailnet). The device routing your traffic is called an **exit node**. There are many ways to use exit nodes in a tailnet. For example, you can:
* Route all non-Tailscale traffic through an exit node.
* Use [suggested exit nodes](/docs/features/exit-nodes/auto-exit-nodes) to [automatically use the best exit node](/docs/features/exit-nodes/auto-exit-nodes) based on client information, such as location and latency.
* [Force devices to use an exit node](/docs/features/exit-nodes/mandatory-exit-nodes) based on system policies, which you can deploy using mobile device management (MDM) solutions.
For security purposes, you must opt in to exit node functionality. For example:
* Every device must explicitly opt in to using an exit node.
* A device must advertise itself as an exit node.
* An [Owner, Admin, or Network admin](/docs/reference/user-roles) must allow a device to be an exit node for the tailnet.
By default, exit nodes capture all your network traffic that isn't already directed to a subnet router or app connector. You can also route specific network traffic using [subnet routers](/docs/features/subnet-routers) or [app connectors](/docs/features/app-connectors). On Android devices, you can also use [app-based split tunneling](/docs/features/client/android-app-split-tunneling).
### [Local network access](#local-network-access)
By default, the device connecting to an exit node won't have access to its local network. If you want to allow the device access to its local network when routing traffic through an exit node, enable exit node local network access.
You can enable the **Allow Local Network Access** setting from the **Exit Nodes** section of your Tailscale client. You can also enable this setting by passing `--exit-node-allow-lan-access` to [`tailscale up`](/docs/reference/tailscale-cli/up) or [`tailscale set`](/docs/reference/tailscale-cli#set).
## [Get started](#get-started)
Refer to the [Use exit nodes](/docs/features/exit-nodes/how-to/setup) quickstart guide for basic instructions on how to configure and use exit nodes.
To get started with exit nodes:
1. Understand the [prerequisites](#prerequisites).
2. [Configure a device to act as an exit node](#configure-an-exit-node).
3. [Allow the exit node from the admin console](#allow-the-exit-node-from-the-admin-console).
4. [Configure other devices to use the exit node](#use-the-exit-node).
### [Prerequisites](#prerequisites)
Before you can configure an exit node, you must:
* [Set up a Tailscale network (known as a tailnet)](/docs/how-to/quickstart).
* Ensure both the exit node and devices using the exit node run **Tailscale v1.20 or later**.
* Ensure the exit node is a Linux, macOS, Windows, Android, or tvOS device.
* Ensure you allow (intended) users to use the exit node.
Check your tailnet's [ACLs](/docs/features/access-control/acls) and [grants](/docs/features/access-control/grants).
If your tailnet is using the [default access control policy](/docs/reference/examples/grants#allow-all), users of your tailnet already have access to any exit nodes that you configure. If you have modified the access control policies of your tailnet, ensure you create an [access rule that includes exit node uses in the `autogroup:internet`](/docs/reference/examples/grants#allow-using-exit-nodes). They do not need access to the exit node itself to use the exit node.
### [Configure an exit node](#configure-an-exit-node)
Use the following steps to configure an exit node:
1. [Install the Tailscale client](#install-the-tailscale-client).
2. [Advertise the device as an exit node](#advertise-a-device-as-an-exit-node).
3. [Allow the exit node](#allow-the-exit-node-from-the-admin-console).
4. [Use the exit node](#use-the-exit-node).
You can also [get a suggested exit node](/docs/features/exit-nodes/auto-exit-nodes#use-a-suggested-exit-node).
#### [Install the Tailscale client](#install-the-tailscale-client)
[Android](/docs/features/exit-nodes?tab=android)[Linux](/docs/features/exit-nodes?tab=linux)[macOS](/docs/features/exit-nodes?tab=macos)[tvOS](/docs/features/exit-nodes?tab=tvos)[Windows](/docs/features/exit-nodes?tab=windows)
[Download and install Tailscale](/download/android) onto the Android device you plan to use as an exit node.
#### [Advertise a device as an exit node](#advertise-a-device-as-an-exit-node)
[Android](/docs/features/exit-nodes?tab=android)[Linux](/docs/features/exit-nodes?tab=linux)[macOS](/docs/features/exit-nodes?tab=macos)[tvOS](/docs/features/exit-nodes?tab=tvos)[Windows](/docs/features/exit-nodes?tab=windows)
Open the Tailscale client on the Android device, go to **Exit Node** and select **Run as exit node**.
### [Allow the exit node from the admin console](#allow-the-exit-node-from-the-admin-console)
You must be an [Admin](/docs/reference/user-roles) to allow a device to be an exit node.
If the device is authenticated by a user who can approve exit nodes in [`autoApprovers`](/docs/reference/syntax/policy-file#autoapprovers), the exit node will automatically be approved.
1. Open the [Machines](https://login.tailscale.com/admin/machines) page of the admin console and locate the exit node.
2. Locate the **Exit Node** badge in the machines list or use the [`property:exit-node`](https://login.tailscale.com/admin/machines?q=property:exit-node) filter to list all devices advertised as exit nodes.
From the menu of the exit node, open the **Edit route settings** panel, and enable **Use as exit node**.
### [Use the exit node](#use-the-exit-node)
Each device must enable the exit node separately. The instructions for enabling an exit node vary depending on the device's operating system.
[Android](/docs/features/exit-nodes?tab=android)[iOS](/docs/features/exit-nodes?tab=ios)[Linux](/docs/features/exit-nodes?tab=linux)[macOS](/docs/features/exit-nodes?tab=macos)[tvOS](/docs/features/exit-nodes?tab=tvos)[Windows](/docs/features/exit-nodes?tab=windows)
1. Open the Tailscale app on the Android device and go to the **Exit Node** section.
2. Select the exit node that you want to use. If you want to allow direct access to your local network when routing traffic through an exit node, toggle **Allow LAN access** on.
3. On the app home screen, confirm that the selected device displays in the **Exit Node** section. When an exit node is being used for the device, the section will turn blue.
To stop a device from using an exit node, go to the **Exit Node** section and select **None**.
The option to use an exit node only displays if there's an available exit node in your tailnet.
You can verify that your traffic is routed by another device by checking your public IP address [using online tools](https://www.whatismyip.com). The exit node's public address displays rather than your local device's IP address.
You can turn off routing through an exit node by selecting **None** from the **Exit Node** drop-down.
## [Destination logging in network flow logs](#destination-logging-in-network-flow-logs)
Destination Logging is available for [the Premium and Enterprise plans](/pricing). To enable this feature, contact [Tailscale Sales](/contact/sales).
By default, destination logging is disabled for traffic flowing through an exit node across all tailnets, for privacy, abuse, and security purposes. Tailnets on the Enterprise plan can, however, enable destination logging across the tailnet for increased visibility of traffic across the tailnet and forensic analysis during security incidents. Destinations are logged in [Network flow logs](/docs/features/logging/network-flow-logs).
You must enable [log streaming](/docs/features/logging/log-streaming) before using exit node destination logging.
To enable destination logging for exit nodes:
1. Open the [Logs](https://login.tailscale.com/admin/logs) page of the admin console.
2. Select **Network flow logs**.
3. Select the **Logging Actions** menu, then select **Enable exit node destination logging**.
To disable destination logging for exit nodes:
1. Open the [Logs](https://login.tailscale.com/admin/logs) page of the admin console.
2. Select **Network flow logs**.
3. Select the **Logging Actions** menu, then select **Disable exit node destination logging**.
## [Caveats](#caveats)
[Android](/docs/features/exit-nodes?tab=android)[Linux](/docs/features/exit-nodes?tab=linux)[macOS](/docs/features/exit-nodes?tab=macos)[tvOS](/docs/features/exit-nodes?tab=tvos)[Windows](/docs/features/exit-nodes?tab=windows)
Tailscale support for running exit nodes on Android is still undergoing optimization. Make sure you plug the device into a power source if you plan to use it as an exit node for an extended time. Android exit nodes are limited to [userspace routing](/docs/reference/kernel-vs-userspace-routers).
Running an exit node on an Android device is not performant—it may be too slow for most cases.
### [Userspace](#userspace)
On Android, the exit node is implemented in userspace, which differs from the default Linux exit node implementation and is not as mature or fully optimized. For details, refer to [Kernel vs. netstack subnet routing and exit nodes](/docs/reference/kernel-vs-userspace-routers).
### [Expired device keys](#expired-device-keys)
When a connector's (such as, app connector, subnet router, exit node) key expires, the connector's advertised routes remain configured on other devices but become unreachable (known as "fail close" policy). Tailscale keeps these routes in place intentionally because removing them could leak traffic to untrusted networks.
To prevent disruption from this behavior, [disable key expiry](/docs/features/access-control/key-expiry#disabling-key-expiry) on the connector or configure [high availability](/docs/how-to/set-up-high-availability). If you prefer to withdraw routes when a key expires, you can use the admin console or [API](/docs/reference/tailscale-api) to enable and disable advertised routes when certain conditions are met.
On this page
* [Benefits](#benefits)
* [Use cases](#use-cases)
* [How it works](#how-it-works)
* [Local network access](#local-network-access)
* [Get started](#get-started)
* [Prerequisites](#prerequisites)
* [Configure an exit node](#configure-an-exit-node)
* [Install the Tailscale client](#install-the-tailscale-client)
* [Advertise a device as an exit node](#advertise-a-device-as-an-exit-node)
* [Allow the exit node from the admin console](#allow-the-exit-node-from-the-admin-console)
* [Use the exit node](#use-the-exit-node)
* [Destination logging in network flow logs](#destination-logging-in-network-flow-logs)
* [Caveats](#caveats)
* [Expired device keys](#expired-device-keys)
Scroll to top