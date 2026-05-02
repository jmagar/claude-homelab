Manage devices using the web interface · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Manage devices using the web interface
Last validated: Jan 5, 2026
The web interface is a browser-based GUI available on all machines running the desktop platform of the Tailscale client, including Linux, macOS, and Windows. This lets you configure settings without needing to use the [Tailscale CLI](/docs/reference/tailscale-cli) or to configure settings on a device that does not have a built-in GUI.
A device must have Tailscale v1.56.0 or later installed to access its web interface. As of v1.64.0, the web interface runs on [`100.100.100.100`](/docs/reference/quad100) by default.
The web interface runs locally over `100.100.100.100` by default, and can also be exposed to your tailnet over `\<tailscaleIP\>:5252`.
## [Expose the web interface on a device](#expose-the-web-interface-on-a-device)
Before accessing the web interface over `\<tailscaleIP\>:5252`, you must enable it using the Tailscale CLI in a terminal session.
To expose the web interface in foreground mode, open a terminal session on the device and run [`tailscale web`](/docs/reference/tailscale-cli#web). When you close the terminal session or press `Ctrl` + `C`, the web interface will no longer be exposed to your tailnet.
To expose the web interface persistently in the background, open a terminal session on the device and run [`tailscale set --webclient`](/docs/reference/tailscale-cli#set).
Your [tailnet policy file](/docs/reference/glossary#tailnet-policy-file) manages access to the web interface.
`tailscale set --webclient` also turns on the web interface locally over `100.100.100.100` for Tailscale v1.62.0 or earlier. For clients v1.64.0 or newer, the web interface runs locally over `100.100.100.100` by default.
## [Open and authenticate to the web interface](#open-and-authenticate-to-the-web-interface)
From your web browser, use one of the following methods to access the web interface for a device in your tailnet:
* Go to [`100.100.100.100`](/docs/reference/quad100) to access the web interface on the device you are currently using
* Go to `\<tailscaleIP\>:5252` to access the web interface on another device, where `tailscaleIP` is the address for the device. This can only be done if the viewing user has access to port 5252 on the destination as permitted in your [tailnet policy file](/docs/reference/glossary#tailnet-policy-file).
* Go to `localhost:8080`, or the address and port provided to `tailscale web` from the device running the web interface.
* Some platforms, including Synology, expose the web interface over the LAN through their management console.
When you initially visit the web interface from a browser, you are always accessing it in the read-only mode, for security reasons. Anyone with access to the page can access the read-only page of the web interface. From here you can access metadata about the device, including its IP address, by selecting **View device details**.
To change device settings in the web interface, you must complete a check mode authentication step. Select your profile photo in the upper right, select **Sign in**, and then complete the authentication flow.
Refer to [Control remote access](/use-cases/remote-access) for how to limit who can access the web interface for a device.
## [Disable the web interface on a device](#disable-the-web-interface-on-a-device)
There are three ways to disable the web interface on a device.
**Option 1**: Disable access for non-local users only, by running the following [Tailscale CLI](/docs/reference/tailscale-cli) command:
```
`tailscale set --webclient=false
`
```
**Option 2**: Disable access for both local and non-local users, by adding the following tailnet policy file entry:
```
`"nodeAttrs": [
{
"target": ["autogroup:member"],
"attr": ["disable-web-client"],
},
],
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
**Option 3**: Disconnect or remove the device from your tailnet.
## [Control remote access](#control-remote-access)
### [Grant read-only access](#grant-read-only-access)
Any user in your tailnet, or any user with whom the device has been shared, with access to the device's port 5252 will be able to access its web interface. To limit read access, limit who has access to the device's port 5252 in the policy. For example:
```
`{
"acls": [
// Allow access only to users' own web interfaces.
{
"action": "accept",
"src": ["autogroup:member"],
"dst": ["autogroup:self:5252"]
}
]
}
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
or, using the new [grants](/docs/features/access-control/grants) syntax:
```
`{
"grants": [
// Allow access only to users' own web interfaces.
{
"src": ["autogroup:member"],
"dst": ["autogroup:self"],
"ip": ["5252"]
}
]
}
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
## [Grant management access](#grant-management-access)
If the device is user-owned (not [tagged](/docs/features/tags)), only the owner is able to manage settings on the device using the Tailscale web interface. Additional users cannot be granted management access by changing the [tailnet policy file](/docs/reference/glossary#tailnet-policy-file).
If the device is [tagged](/docs/features/tags), users can be granted access to manage parts of the Tailscale web interface using [grants](/docs/features/access-control/grants). Use the `canEdit` list of the `"tailscale.com/cap/webui"` app to define what users are allowed to manage. The supported `canEdit` values are:
* `\*` Grants management access for all current and future web interface features
* `ssh` Grants management access for Tailscale SSH
* `subnets` Grants management access for subnet routes
* `exitNodes` Grants management access for exit nodes including the ability to advertise the device as an exit node and use other exit nodes
* `account` Grants management access for account settings including the ability to log out of node and turn on auto-updates
For example:
```
`{
"grants": [
{
"src": ["user@example.com"],
"dst": ["tag:dev"],
"ip": ["5252"],
"app": {
"tailscale.com/cap/webui": [
{
// Grants user@example.com edit access to "tag:dev" devices' web interfaces.
"canEdit": ["ssh", "subnets"]
}
]
}
}
]
}
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
Anyone with management access to a device's web interface, whether tagged or user-owned, will be required to log into the web interface and complete a check mode authentication step to verify their identity before being able to actually change device settings. Check mode also requires that the user be connecting from a Tailscale device of which they are the owner (not from a tagged device).
Tagged device grants for the web interface were added for devices using Tailscale v1.62.0 and later. For any tagged devices running a version less than v1.62.0, access control policies alone give users the ability to manage the tagged device from the web interface.
## [Features](#features)
The web interface lets you configure the Tailscale settings for a device. Not all features are available on every platform. When a feature is not supported for a platform, it will not appear in that device's web interface.
### [Enable exit nodes](#enable-exit-nodes)
To select an [exit node](/docs/features/exit-nodes) to route the device through, go to **This device**, select **Exit node**, then select the exit node you want to use. To stop using the exit node, select **Disable**.
To advertise the device as an exit node, go to **This device**, select **Exit node**, then select **Run as exit node**. To stop advertising the device as an exit node, select **Disable**.
### [Enable a subnet router](#enable-a-subnet-router)
Configuring a device as a [subnet router](/docs/features/subnet-routers) lets you remotely access resources on your network that may not have Tailscale installed, such as a printer.
To use the device as a subnet router, go to **Settings** and select **Subnet router** drop-down. In the text field, enter the combined IP address and subnet mask (CIDR) you want to advertise to your tailnet and select **Advertise routes**. You can enter multiple subnets by separating them with commas. To stop advertising routes, select **Stop advertising** next to the route.
If your advertised routes are pending approval, you can [enable subnet routes](/docs/features/subnet-routers#enable-subnet-routes-from-the-admin-console) from the admin console.
### [Enable Tailscale SSH](#enable-tailscale-ssh)
To enable [Tailscale SSH](/docs/features/tailscale-ssh) on the device, go to **Settings**, select **Tailscale SSH server**, then turn the toggle on. To disable the Tailscale SSH server, turn the toggle off.
On this page
* [Expose the web interface on a device](#expose-the-web-interface-on-a-device)
* [Open and authenticate to the web interface](#open-and-authenticate-to-the-web-interface)
* [Disable the web interface on a device](#disable-the-web-interface-on-a-device)
* [Control remote access](#control-remote-access)
* [Grant read-only access](#grant-read-only-access)
* [Grant management access](#grant-management-access)
* [Features](#features)
* [Enable exit nodes](#enable-exit-nodes)
* [Enable a subnet router](#enable-a-subnet-router)
* [Enable Tailscale SSH](#enable-tailscale-ssh)
Scroll to top