Mullvad exit nodes · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Mullvad exit nodes
Last validated: Jan 9, 2026
This feature is currently [in beta](/docs/reference/tailscale-release-stages#beta). To try it, follow the steps below to enable it for your network using Tailscale v1.48.2 or later.
The Mullvad VPN add-on lets you use [Mullvad](https://mullvad.net/en/why-mullvad-vpn) VPN servers as [exit nodes](/docs/features/exit-nodes) in a Tailscale network (known as a tailnet). Mullvad exit nodes function similarly to regular exit nodes but use [Mullvad's pre-existing VPN infrastructure](https://mullvad.net/en/help/server-list) instead of a device you own.
Mullvad exit nodes support most of the same functionality as other exit nodes, such as [suggested exit nodes](/docs/features/exit-nodes/auto-exit-nodes#use-a-suggested-exit-node) and [mandatory exit nodes](/docs/features/exit-nodes/auto-exit-nodes), but they have some limitations.
## [Requirements and limitations](#requirements-and-limitations)
Review the following requirements and limitations related to the Mullvad add-on:
* You must purchase the Mullvad VPN add-on before you can access Mullvad exit nodes.
* Mullvad exit nodes don't work with [custom DERP servers](/docs/reference/derp-servers/custom-derp-servers).
* Access control policies for Mullvad exit nodes don't work with [Google-synced groups](/docs/integrations/identity/google-sso).
* If you use [Tailnet Lock](/docs/features/tailnet-lock) with the Mullvad VPN add-on, you must [sign each Mullvad exit node](#sign-mullvad-exit-nodes).
* If you use [GitOps](/docs/gitops) to manage your [tailnet policy file](/docs/features/tailnet-policy-file), the Mullvad VPN add-on checkout flow might be locked. To purchase additional licenses, go to the [Billing](https://login.tailscale.com/admin/settings/billing) page of the admin console, then select **Manage add-ons**.
* The Tailscale client for Windows does not support displaying the full list of Mullvad exit nodes. You can access a complete list of Mullvad exit nodes using the [Tailscale CLI](/docs/reference/tailscale-cli).
* You cannot use both the admin console and the tailnet policy file to [manage Mullvad access](#manage-mullvad-access). If you use the tailnet policy file to manage Mullvad access, you must manage all Mullvad access through the tailnet policy file.
### [Important DNS considerations](#important-dns-considerations)
Tailscale v1.48.3 and later don't require additional configuration.
Mullvad exit nodes with Tailscale v1.48.1 and v1.48.2 use the device's local DNS configuration. As a result, you might lose access to DNS (effectively losing internet access) unless you configure one of the following:
* [Allow local network access](/docs/features/exit-nodes#local-network-access) for exit nodes.
* Add a [global nameserver](/docs/reference/dns-in-tailscale#global-nameservers) and [override DNS servers settings](/docs/reference/dns-in-tailscale#override-dns-servers).
Keep the following in mind when configuring either of these settings:
* Overriding local DNS causes Tailscale to configure all clients to use the selected DNS server for all DNS queries while Tailscale is connected, even if you are not using an exit node. When used with the Mullvad Public DNS nameservers, this ensures all DNS routes through Mullvad and provides a green check for DNS leaks on [`mullvad.net/check`](https://mullvad.net/en/help/dns-leaks).
* Allowing exit nodes access to the local network might allow DNS leaks to occur but also ensures that local DNS names, such as a local printer name or a local NAS server name, continue to work.
## [Data privacy and anonymity](#data-privacy-and-anonymity)
When you use Mullvad with Tailscale, you allow Tailscale to generate, manage, renew, and remove Mullvad accounts on your behalf. As a result, there are some important privacy and anonymity considerations:
* Tailscale generates and manages account information on users' behalf.
* Tailscale is identity-aware (Tailscale doesn't support anonymous tailnets). All Tailscale users are connected to an email address or GitHub account.
* Tailscale knows which Mullvad accounts belong to which Tailscale users.
* Users establish [encrypted](/docs/concepts/tailscale-encryption) [WireGuard](/docs/concepts/wireguard) connections with Mullvad servers. Tailscale can identify which users are connecting to which Mullvad servers using logs. As with any traffic in your tailnet, Tailscale cannot access any user traffic sent to Mullvad servers. This is because all user traffic is encrypted in WireGuard tunnels, and Tailscale cannot decrypt this information.
* Mullvad does not receive user identity information from Tailscale.
## [Available Mullvad regions](#available-mullvad-regions)
You can purchase and use the Mullvad add-on for your tailnet in most countries, however, some countries and regions are excluded. If your region is not listed, you can subscribe to [the GitHub tracking issue](https://github.com/tailscale/tailscale/issues/9314) for updates and request updates. After you purchase the Mullvad add-on, you have access to all available Mullvad servers.
For a current list of the Mullvad servers that are available to use as exit nodes by country and city, refer to the Mullvad [Servers](https://mullvad.net/en/servers) page. These regions are also displayed as exit node options in the Tailscale client.
## [Mullvad licensing](#mullvad-licensing)
You must purchase the Mullvad VPN add-on through the admin console before you can access Mullvad exit nodes. The base add-on includes five licenses, but you can purchase additional licenses during the initial checkout flow or afterward through the [Billing](https://login.tailscale.com/admin/settings/billing) page of the admin console.
Users on the [Personal or GitHub Community plans](/docs/account/manage-plans/free-plans-discounts) can purchase the Mullvad add-on on either a monthly or annual basis. Users on the [Standard and Premium plans](/pricing) can purchase the Mullvad add-on on a monthly basis only. Users on the Enterprise plan must contact their account team to purchase the Mullvad add-on.
## [How-to guides](#how-to-guides)
### [Enable Mullvad exit nodes](#enable-mullvad-exit-nodes)
You can enable Mullvad exit nodes by purchasing the Mullvad VPN add-on and configuring device access.
1. From the [General](https://login.tailscale.com/admin/settings/general) settings page of the admin console, scroll down to **Mullvad VPN**.
2. Select **Configure**.
3. Continue with the checkout flow to purchase Mullvad licenses.
If you use [GitOps](/docs/gitops) to manage your tailnet policy file, the Mullvad VPN add-on checkout flow might be locked. To purchase additional licenses, go to the [Billing](https://login.tailscale.com/admin/settings/billing) page of the admin console, then select **Manage add-ons**.
### [Manage Mullvad access](#manage-mullvad-access)
You can configure Mullvad access using the admin console user interface or the tailnet policy file. Using the tailnet policy file to manage Mullvad exit node access offers more flexibility. For example, it lets you assign Mullvad access to more devices than you have Mullvad licenses for.
You cannot use both the admin console and the tailnet policy file to manage Mullvad access. If you use the tailnet policy file to manage Mullvad access, you must manage all Mullvad access through the tailnet policy file.
#### [From the admin console](#from-the-admin-console)
You can manage Mullvad access through the admin console. If you manage Mullvad access this way, you must explicitly configure each device.
To grant devices access to Mullvad:
1. From the [General](https://login.tailscale.com/admin/settings/general) settings page of the admin console, scroll down to **Mullvad VPN**.
2. Select **Configure**.
3. Select **Add devices**.
4. Select the devices to grant access to Mullvad's infrastructure as exit nodes.
5. Then, save your changes.
Each device uses a slot in a Mullvad license. Each Mullvad license will allow up to five devices. Your monthly bill automatically updates as you add or remove devices.
You can revoke a device's access to Mullvad by selecting **Remove**.
#### [From the tailnet policy file](#from-the-tailnet-policy-file)
You can also manage access to Mullvad exit nodes using [node attributes](/docs/reference/syntax/policy-file#nodeattrs) in the [tailnet policy file](/docs/features/tailnet-policy-file).
1. Go to the **Access controls** page of the admin console.
2. Add a [`nodeAttrs`](/docs/reference/syntax/policy-file#nodeattrs) section to your tailnet policy file that assigns the `mullvad` attribute to the device you plan to use with Mullvad exit nodes.
The following example grants access to all devices owned by `joe@example.com`:
```
`"nodeAttrs": [
{
"target": ["joe@example.com"],
"attr": [
"mullvad",
],
},
],
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
When you use the tailnet policy file to manage Mullvad access, devices using a Mullvad license do not appear in the [Configure Mullvad VPN](https://login.tailscale.com/admin/settings/general/mullvad) page of the admin console. You must manage Mullvad access through the tailnet policy file.
##### [Share a pool of licenses](#share-a-pool-of-licenses)
This method lets you assign access to Mullvad for more devices than your Mullvad add-on current plan permits. For example, the following configuration lets all devices in the `mullvad` group to use Mullvad exit nodes:
```
`"nodeAttrs": [
{
"target": ["group:mullvad"],
"attr": [
"mullvad"
],
},
],
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
When you share a license pool in this manner, devices use available Mullvad licenses on a first-come, first-served basis as they connect to the tailnet. **Tailscale allocates Mullvad licenses to devices as they connect to the tailnet, not as they connect to Mullvad servers.** If all paid slots are in use, devices outside the selected quota will not have Mullvad exit nodes as an option.
While it's possible to effectively share a pool of Mullvad licenses, it's important to ensure you have purchased enough Mullvad licenses to cover the needs of your environment.
Consider the following example:
The *Society of Pangolin Enthusiasts* organization has a tailnet with 100 devices in it, and they've purchased the Mullvad add-on with 50 licenses.
Using the tailnet policy file, an administrator set up a `nodeAttrs` policy that lets all 100 devices to Mullvad exit nodes (if they're available). This allows the 100 devices to effectively share the pool of Mullvad exit nodes, even though there isn't a Mullvad exit node for each device.
If 50 devices connect to the tailnet, Tailscale allocates a Mullvad license to each one. The next device (the 51st) won't get a Mullvad license allocated to it. As a result, if that device tries to use a Mullvad exit node, it **won't be able to access any Mullvad exit nodes** until one of the 50 devices releases a Mullvad license.
You can [release a device's Mullvad license](#disable-mullvad-on-a-device) by removing the device from the tailnet policy file or by removing the device from the Mullvad VPN configuration in the admin console.
### [Use Mullvad exit nodes](#use-mullvad-exit-nodes)
After you enable Mullvad exit nodes and configure a device for Mullvad access, you can use the exit nodes from devices in your tailnet. Each device must enable an exit node separately. There might be a slight delay before Mullvad exit nodes appear in your Tailscale client.
You can also [get a suggested Mullvad exit node](/docs/features/exit-nodes/auto-exit-nodes#use-a-suggested-exit-node).
Instructions differ depending on the client operating system:
[Android](/docs/features/exit-nodes/mullvad-exit-nodes?tab=android)[iOS](/docs/features/exit-nodes/mullvad-exit-nodes?tab=ios)[Linux](/docs/features/exit-nodes/mullvad-exit-nodes?tab=linux)[macOS](/docs/features/exit-nodes/mullvad-exit-nodes?tab=macos)[tvOS](/docs/features/exit-nodes/mullvad-exit-nodes?tab=tvos)[Windows](/docs/features/exit-nodes/mullvad-exit-nodes?tab=windows)
1. From the menu, select **Use exit node**.
2. Choose the Mullvad exit node to use.
3. (Optional) If you want to allow direct access to your local network when traffic routes through an exit node, select **Allow LAN access**.
If you do not select **Allow LAN access**, you might need to configure [DNS](#important-dns-considerations). You can also select **None** to disable using an exit node.
### [Disable Mullvad on a device](#disable-mullvad-on-a-device)
You must be an [Owner, Admin, or Network admin](/docs/reference/user-roles) of a tailnet to disable Mullvad exit nodes on a device.
You can revoke a device's access to Mullvad exit nodes through the admin console or the tailnet policy file. Use the same method you used to grant access.
To revoke a device's access to Mullvad exit nodes from the admin console:
1. Open the [General](https://login.tailscale.com/admin/settings/general) settings page of the admin console.
2. Go to the **Mullvad VPN** section and select **Configure**.
3. Select **Remove** next to the device you want to remove, then select **Save**.
To revoke a device's access to Mullvad exit nodes from the tailnet policy file:
1. Go to the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console.
2. Update the `nodeAttrs` section of your tailnet policy file to exclude the `mullvad` attribute from the device.
The exact way to exclude a device's access depends on how you configured its access. For example, if you granted a user explicit access using an email address, you can remove the line that assigns the `mullvad` attribute to that user. However, if you granted access using [groups](/docs/reference/targets-and-selectors#groups), [tags](/docs/reference/targets-and-selectors#groups), or other means, the process might involve more steps (such as removing the device from a group).
### [Remove the Mullvad add-on](#remove-the-mullvad-add-on)
You must be an [Owner, Admin, or Billing admin](/docs/reference/user-roles) of a tailnet to remove the Mullvad add-on.
You can remove the Mullvad VPN add-on from the admin console.
1. Go to the [Billing](https://login.tailscale.com/admin/settings/billing) page of the admin console.
2. Select **Manage add-ons**.
3. Select **Mullvad VPN** \> **Remove add-on**.
### [Migrate from Mullvad to Tailscale](#migrate-from-mullvad-to-tailscale)
If you're migrating from using Mullvad VPN to Tailscale's Mullvad add-on, you might need to disable Mullvad's settings to block connections without a VPN.
Before migrating from Mullvad to Tailscale's Mullvad add-on:
1. Go to the Mullvad VPN application.
2. Disable the Mullvad VPN.
3. Turn off the **Block connections without VPN** setting.
Devices that are registering with Mullvad for the first time might experience a delay when synchronizing with all the Mullvad exit nodes. The synchronization process can take up to two minutes when you first use Mullvad on a particular device or if you have not used it for several weeks. With regular usage, activating Mullvad is instantaneous.
### [Sign Mullvad exit nodes](#sign-mullvad-exit-nodes)
If you use [Tailnet Lock](/docs/features/tailnet-lock) with the Mullvad VPN add-on, you must sign each Mullvad exit node. Additionally, the device you use to sign each Mullvad exit node must have access to the Mullvad exit nodes (it must have a valid Mullvad license). Otherwise, the Mullvad exit nodes are not included in the signing device's netmap and when it runs [`tailscale lock`](/docs/reference/tailscale-cli/lock), the list won't include the unsigned Mullvad exit nodes.
This is an example of signing a single Mullvad exit node:
The following command has a `jq` dependency. You may need to install `jq` on your device.
1. Acquire the `NodeKey` of your chosen Mullvad exit node.
```
`tailscale lock status --json | jq '[.FilteredPeers[] | select(.DNSName | contains("mullvad.ts.net")) | {DNSName, NodeKey: .NodeKey}] | sort\_by(.DNSName)'
`
```
2. Use `tailscale lock` to `sign` the exit node.
```
`tailscale lock sign nodekey \<nodekey-of-exit-node\>
`
```
This `mullvad-script` can be used on Linux. macOS, and Windows devices to automate the signing of multiple Mullvad exit nodes with certain country codes:
[`https://github.com/tailscale-support/mullvad-script`](https://github.com/tailscale-support/mullvad-script)
Either provide a specific two letter country code or `..` (two periods) to sign all Mullvad exit nodes. Refer to the Mullvad [Servers](https://mullvad.net/en/servers) page for the list of supported countries.
On this page
* [Requirements and limitations](#requirements-and-limitations)
* [Important DNS considerations](#important-dns-considerations)
* [Data privacy and anonymity](#data-privacy-and-anonymity)
* [Available Mullvad regions](#available-mullvad-regions)
* [Mullvad licensing](#mullvad-licensing)
* [How-to guides](#how-to-guides)
* [Enable Mullvad exit nodes](#enable-mullvad-exit-nodes)
* [Manage Mullvad access](#manage-mullvad-access)
* [From the admin console](#from-the-admin-console)
* [From the tailnet policy file](#from-the-tailnet-policy-file)
* [Share a pool of licenses](#share-a-pool-of-licenses)
* [Use Mullvad exit nodes](#use-mullvad-exit-nodes)
* [Disable Mullvad on a device](#disable-mullvad-on-a-device)
* [Remove the Mullvad add-on](#remove-the-mullvad-add-on)
* [Migrate from Mullvad to Tailscale](#migrate-from-mullvad-to-tailscale)
* [Sign Mullvad exit nodes](#sign-mullvad-exit-nodes)
Scroll to top