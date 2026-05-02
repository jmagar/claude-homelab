Taildrive · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Taildrive
Last validated: Jan 5, 2026
Taildrive lets you persistently share folders with other users and devices on your Tailscale network (known as a tailnet). Using Taildrive, you can:
* Share folders with your colleagues.
* Access files from your desktop PC or NAS server from your phone, anywhere in the world.
* Connect a backup utility, like [Duplicati](https://www.duplicati.com) or [rclone](https://rclone.org), to a Taildrive folder on your NAS.
Taildrive is currently [in alpha](/docs/reference/tailscale-release-stages#alpha). To try it, follow the steps below to enable it for your network using Tailscale 1.64.0 or later.
## [How it works](#how-it-works)
Normally, maintaining a file server requires you to manage credentials and access rules separately from the connectivity layer. Taildrive offers a file server that unifies connectivity and [access controls](/docs/features/access-control), allowing you to share directories directly from the Tailscale client. You can then use your tailnet policy file to define which members of your tailnet can access a particular shared directory, and even define specific read and write permissions.
Beginning in version 1.64.0, the Tailscale client includes a Web-based Distributed Authoring and Versioning (WebDAV) server that runs on `100.100.100.100:8080` while Tailscale is connected. Every directory that you share receives a globally-unique path consisting of the tailnet, the machine name, and the share name: `/\<tailnet\>/\<machine\>/\<share\>`.
For example, if you shared a directory with the share name `docs` from the machine `nas-device` in the tailnet `example.com`, the share's path would be `/example.com/nas-device/docs`.
## [Configure Taildrive](#configure-taildrive)
Taildrive's server component is only available on Linux, macOS, and Windows devices. iOS and Android devices can access directories shared from these platforms, but cannot share directories themselves.
### [Enable Taildrive in the policy file](#enable-taildrive-in-the-policy-file)
You need to be an [Owner, Admin, or Network admin](/docs/reference/user-roles) to edit the tailnet policy file. Enabling Taildrive requires two steps: Enabling Taildrive on devices by setting a `nodeAttr`, and defining sharing permissions using [grants](/docs/features/access-control/grants).
#### [Add `nodeAttrs` to enable Taildrive on devices](#add-nodeattrs-to-enable-taildrive-on-devices)
To share directories or access directories shared by other devices, you need to enable Taildrive in the `nodeAttrs` section of your tailnet policy file. [Edit your policy file](/docs/features/tailnet-policy-file/manage-tailnet-policies) to make this change.
For example, this policy will enable Taildrive on every member's devices. Every member of your tailnet will be able to share directories from their device and access shared directories.
```
`"nodeAttrs": [
{
"target": ["autogroup:member"],
"attr": [
"drive:share",
"drive:access",
],
}
]
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
The following policy enables Taildrive access on all devices, but only lets tailnet administrators share directories with Taildrive.
```
`"nodeAttrs": [
{
// Any device can access shared directories with Taildrive
"target": ["\*"],
"attr": ["drive:access"],
},
{
// Only tailnet admins can use Taildrive to share directories
"target": ["autogroup:admin"],
"attr": [
"drive:share",
"drive:access",
],
}
]
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
#### [Define sharing permissions](#define-sharing-permissions)
Now that you've enabled Taildrive on your devices, you define specific sharing permissions using [grants](/docs/features/access-control/grants).
The broadest possible policy lets all devices access all shares in the tailnet, no matter which user or tag owns the device:
```
`"grants": [
{
"src": ["\*"],
"dst": ["\*"],
"app": {
"tailscale.com/cap/drive": [{
"shares": ["\*"],
"access": "rw"
}]
}
}
]
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
You may also choose to allow members to read and write to their own shared directories from any of their devices. A policy to allow this would look like this:
```
`"grants": [
{
"src": ["autogroup:member"],
"dst": ["autogroup:self"],
"app": {
"tailscale.com/cap/drive": [{
"shares": ["\*"],
"access": "rw"
}]
}
}
]
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
You can also limit write access or even define permissions for accessing specific shares. The following policy lets all tailnet members read files from the `company-docs` share with the tag `fileserver`, but does not grant access to any other shared directories besides `company-docs` and does not allow write access:
```
`"grants": [
{
"src": ["autogroup:member"],
"dst": ["tag:fileserver"],
"app": {
"tailscale.com/cap/drive": [{
"shares": ["company-docs"],
"access": "ro"
}]
}
}
]
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
Now that you've configured permissions, you can share your folders.
## [Sharing and accessing folders with Taildrive](#sharing-and-accessing-folders-with-taildrive)
[macOS](/docs/features/taildrive?tab=macos)[Windows](/docs/features/taildrive?tab=windows)[Linux](/docs/features/taildrive?tab=linux)[Synology](/docs/features/taildrive?tab=synology)[iOS](/docs/features/taildrive?tab=ios)[Android](/docs/features/taildrive?tab=android)
Tailscale must be running to access Taildrive shares at `100.100.100.100:8080`.
### [Share directories with Taildrive](#share-directories-with-taildrive)
On macOS, open **Settings** then **File Sharing** in the Tailscale client to manage Taildrive sharing. Because Taildrive is in alpha, the Tailscale client hides the **File Sharing** option by default. To show it, run one of the following commands in a terminal.
For applications installed from the App store:
```
`defaults write io.tailscale.ipn.macos FileSharingConfiguration -string show
`
```
For applications downloaded from `tailscale.com`:
```
`defaults write /Users/$(whoami)/Library/Preferences/io.tailscale.ipn.macsys.plist FileSharingConfiguration show
`
```
If the Tailscale application is already running, close and reopen it to pick up the new setting.
Once you've enabled the Taildrive settings in the terminal, you will find a **File Sharing** tab on the Settings screen.
Select **Choose Shared Folders** to start managing your shared folders.
To add a new share, select the **+** (plus) button. Once you select a folder, the share will be automatically named after the selected folder.
You can rename the share by double selecting its name in the list.
To remove a share, select it in the list and select the **−** (minus) button.
### [Access directories shared with Taildrive](#access-directories-shared-with-taildrive)
You can access Taildrive shares by connecting to the Taildrive server at `100.100.100.100:8080`.
1. Open Finder, then select **Go** from the app menu. Choose **Connect to Server**. Alternatively, with Finder open, you can use the keyboard shortcut `Cmd` + `K`.
2. In the **Server address** field, enter `http://100.100.100.100:8080`
You can add this address to your favorites by selecting the **+** icon below the **Favorite Servers** table.
3. When the **Unsecured Connection** prompt appears, select **Continue**. While the connection takes place over HTTP, it is still encrypted in Tailscale's WireGuard tunnels, so your connection is still secure.
4. Choose **Guest** in the **Connect As:** menu and select **Connect**.
macOS will connect to the Taildrive WebDAV server and show a Finder window with your tailnet DNS name as a folder. Inside that folder, Taildrive will load a folder for each device in your tailnet, and any shares that are active on the devices will appear within those folders.
## [Limitations](#limitations)
* A device [shared](/docs/features/sharing) into your tailnet cannot access any Taildrive folders in your tailnet. Similarly, a device you share to another tailnet cannot access any Taildrive folders in the other tailnet
* Using Taildrive with `rclone` on client version 1.64.2 or earlier will fail without the `--inplace` flag. Use [version 1.65.75](https://pkgs.tailscale.com/unstable) or later to avoid this.
On this page
* [How it works](#how-it-works)
* [Configure Taildrive](#configure-taildrive)
* [Enable Taildrive in the policy file](#enable-taildrive-in-the-policy-file)
* [Add nodeAttrs to enable Taildrive on devices](#add-nodeattrs-to-enable-taildrive-on-devices)
* [Define sharing permissions](#define-sharing-permissions)
* [Sharing and accessing folders with Taildrive](#sharing-and-accessing-folders-with-taildrive)
* [Limitations](#limitations)
Scroll to top