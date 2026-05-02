macOS and iOS shortcuts · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# macOS and iOS shortcuts
Last validated: Jan 5, 2026
Tailscale works with the Shortcuts app on macOS and iOS to provide several built-in shortcut actions, allowing you to automate tasks. For example, you can create shortcuts to connect your device to a tailnet, use an exit node, or switch user accounts.
You can combine the Tailscale actions with other available actions to customize tasks, such as automatically connecting to your tailnet if your device is not on your home Wi-Fi. Depending on how you set up your shortcuts, you access shortcuts in the Shortcuts app, the menu bar, in Spotlight, and other places.
For general information about macOS and iOS shortcuts, refer to Apple's [Shortcuts User Guide for Mac](https://support.apple.com/guide/shortcuts-mac/welcome/mac) and [Shortcuts User Guide for iOS](https://support.apple.com/guide/shortcuts/welcome/ios).
## [Prerequisites](#prerequisites)
To use Tailscale with the Shortcuts app, you must meet the following requirements:
* Tailscale version 1.36 or later
* macOS Monterey 12.0 or later
* iOS 15.0 or later
## [Available actions](#available-actions)
The Tailscale client offers actions for interacting with accounts, devices, exit nodes, and your tailnet.
### [Accounts](#accounts)
The following Tailscale actions let you manage your Tailscale accounts:
* [Find Accounts](#find-accounts)
* [Switch Accounts](#switch-accounts)
#### [Find Accounts](#find-accounts)
Retrieve accounts signed into the Tailscale client that match the provided criteria. You can filter accounts by **Display Name** or **Login Name**. You can also specify the sort by, sort order, and limit of the results.
#### [Switch Accounts](#switch-accounts)
[Switch Tailscale user accounts](/docs/features/client/fast-user-switching). You can optionally specify the account username to which to switch. If you don't specify an account username, the action will ask you to select one when it runs.
### [Devices](#devices)
The following Tailscale actions let you manage devices:
* [Find Devices](#find-devices)
* [Ping Devices](#ping-devices)
* [Send File](#send-file)
#### [Find Devices](#find-devices)
Retrieve all devices in your tailnet that match the provided criteria. You can filter devices by **Name** or connection status (**Is Online** or **Is Offline**). You can also specify the sort by, sort order, and limit of the results.
#### [Ping Devices](#ping-devices)
Send a [ping](/docs/reference/tailscale-cli#ping) to a device in your tailnet and retrieve the ping result. You can ping a device by its device name, [Tailscale IP address](/docs/concepts/tailscale-ip-addresses), [MagicDNS](/docs/features/magicdns) name, device ID, IPv4 address, or IPv6 address.
#### [Send File](#send-file)
Use [Taildrop](/docs/features/taildrop) to send one or more files to a device in your tailnet. You specify the files to send and the device to which to send the files.
### [Exit nodes](#exit-nodes)
You must already have an exit node in your tailnet before using it from a macOS or iOS shortcut.
Exit node actions are sensitive actions because an exit node affects all network traffic on your device. On iOS, you must unlock your device before using an exit node action.
The following Tailscale actions let you manage [exit nodes](/docs/features/exit-nodes):
* [Use Exit Node](#use-exit-node)
* [Stop Using Exit Node](#stop-using-exit-node)
#### [Use Exit Node](#use-exit-node)
Set your device to use an exit node by its [name](/docs/concepts/machine-names) or [Tailscale IP address](/docs/concepts/tailscale-ip-addresses).
#### [Stop Using Exit Node](#stop-using-exit-node)
Set your device to stop using an exit node.
### [Tailnet management](#tailnet-management)
The following Tailscale actions let you manage your tailnet:
* [Connect](#connect)
* [Disconnect](#disconnect)
* [Get Status](#get-status)
* [Set Tailscale DNS](#set-tailscale-dns)
* [Toggle](#toggle)
#### [Connect](#connect)
Connect your device to your tailnet.
#### [Disconnect](#disconnect)
Disconnect your device from your tailnet.
#### [Get Status](#get-status)
Retrieve status information about the Tailscale client. It returns the following values:
* **Connected** (`boolean`): Whether the device is connected to a tailnet.
* **Account Name** (`string`): The Tailscale username (such as `alice@example.com`).
* **Using Exit Node** (`boolean`): Whether the device currently uses an exit node.
* **Exit Node Name** (`string`): The name of the exit node.
#### [Set Tailscale DNS](#set-tailscale-dns)
Modify whether your device uses [Tailscale DNS](/docs/reference/dns-in-tailscale). You can use this action to:
* Turn on Tailscale DNS.
* Turn off Tailscale DNS.
* Toggle using Tailscale DNS (the result varies depending on the status when the action runs).
#### [Toggle](#toggle)
Toggle the connection status of your device. You can use this action to connect to or disconnect from your tailnet. After the action runs, it returns either **Yes** or **No** to indicate whether the device is connected (Yes) or disconnected (No).
## [Examples](#examples)
### [Switch accounts](#switch-accounts-1)
This example shows how to create a [macOS shortcut](https://support.apple.com/guide/shortcuts-mac/welcome/mac) that switches between Tailscale accounts. The example uses the [Get Status](#get-status) and the [Switch Account](#switch-accounts) actions.
1. In the **Shortcuts** app, select **File** and then select **New Shortcut**.
2. Select **Shortcut Name** and provide a name, such as **Switch Tailscale user**.
3. In the right-hand panel, select **Apps**.
4. Search for or scroll to the **Tailscale** app and select it.
5. Drag the **Get Status** action to the shortcut editor.
6. In the right-hand panel, search for the **If** action, and drag the **If** action to the shortcut editor and place it below the **Get status** statement. You can also find the **If** action by selecting **Categories**, **Scripting**, and then **Control Flow**.
7. For the **If** statement, select **Status** and choose the Tailscale **Account Name** variable.
8. Select **Condition**, select **Is**, and then select **Text**. Enter a user account, such as `alice@example.com`.
9. From the right-hand panel, drag the **Switch Account** action to the shortcut editor, and place it below the **If** statement but above the **Otherwise** statement.
10. For the **Switch account to** statement, select **account name**. For the value, use a different user account, such as `alice@gmail.com`.
11. From the right-hand panel, drag another **Switch Account** action to the shortcut editor, and place it below the **Otherwise** statement but above the **End if** statement.
12. Edit this **Switch account to** statement to use the original user account value, `alice@example.com`.
13. Test your shortcut by selecting the **Run** icon at the top of the shortcut editor.
You can access and run the shortcut you created in the Shortcuts app **All Shortcuts** folder. You can also add the shortcut to the **Menu Bar** folder, which makes the shortcut appear in the macOS taskbar.
### [Connect to your tailnet](#connect-to-your-tailnet)
This example shows how to create an [iOS shortcut](https://support.apple.com/guide/shortcuts/welcome/ios) that automatically connects your device to your tailnet when your devices joins a specific Wi-Fi network. The example uses the [Connect](#connect) action.
In this example, the Wi-Fi network name is *PangoLAN*.
1. Launch the **Shortcuts app**, then select **Automation**.
2. Select the **＋**, then select **Create Personal Automation**.
3. From the **Wi-Fi** category, choose the "PangoLAN" network.
4. Select **Next**.
5. Select **Add Action**.
6. From the **Tailscale** app group, select the **Connect** action.
7. Select **Next**.
8. Select **Done**.
On this page
* [Prerequisites](#prerequisites)
* [Available actions](#available-actions)
* [Accounts](#accounts)
* [Find Accounts](#find-accounts)
* [Switch Accounts](#switch-accounts)
* [Devices](#devices)
* [Find Devices](#find-devices)
* [Ping Devices](#ping-devices)
* [Send File](#send-file)
* [Exit nodes](#exit-nodes)
* [Use Exit Node](#use-exit-node)
* [Stop Using Exit Node](#stop-using-exit-node)
* [Tailnet management](#tailnet-management)
* [Connect](#connect)
* [Disconnect](#disconnect)
* [Get Status](#get-status)
* [Set Tailscale DNS](#set-tailscale-dns)
* [Toggle](#toggle)
* [Examples](#examples)
* [Switch accounts](#switch-accounts-1)
* [Connect to your tailnet](#connect-to-your-tailnet)
Scroll to top