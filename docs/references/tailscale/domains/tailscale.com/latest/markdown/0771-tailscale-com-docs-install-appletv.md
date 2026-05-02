Install Tailscale on an Apple TV · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Install Tailscale on an Apple TV
Last validated: Jan 5, 2026
You can add your [Apple TV](https://www.apple.com/tv-home) to your Tailscale network (known as a tailnet) to access your media server content remotely, route your Apple TV traffic through an [exit node](/docs/features/exit-nodes), or advertise your Apple TV as an exit node.
## [Prerequisites](#prerequisites)
* Apple TV with tvOS version 17.0 or later. Version 18.0 or later is recommended.
* Verify that [Apple TV is configured as a home hub](https://support.apple.com/HT207057).
* An [existing tailnet](/docs/how-to/quickstart) for connecting your Apple TV with your other devices.
## [Install Tailscale on tvOS](#install-tailscale-on-tvos)
1. Open tvOS on your Apple TV and select the App Store icon.
2. Search for the Tailscale app and select **Get**. You may be prompted to enter your Apple ID password to confirm.
3. Open the Tailscale app on tvOS. In the **Welcome to Tailscale for tvOS** page, select **Install VPN Configuration**, then select **Allow**.
4. In the Tailscale app interface, select **Connect**.
5. Use one of the following methods to authenticate the Apple TV to your tailnet:
1. (Recommended) Scan the QR code for authorizing the Apple TV to your tailnet. Alternatively, you can type the URL into your device browser, such as a phone or a computer. You may be prompted to log in if your device needs to be authenticated to the tailnet.
2. Using an iPhone or an iPad, go to the Tailscale admin console and [generate an auth key](/docs/features/access-control/auth-keys#generate-an-auth-key), then copy the auth key to your device. Using the [Apple TV Remote](https://support.apple.com/108778) app, select **Use an auth key**, paste the key, then select **Log in**.
If [device approval](/docs/features/access-control/device-management/device-approval) is enabled, the Apple TV will not be accessible in the tailnet until an administrator approves the device.
Once connected to the tailnet, the Tailscale app on the Apple TV will display the app interface, available options, and device information. Also, note that your Apple TV will display in the [Machines](https://login.tailscale.com/admin/machines) page of the admin console.
## [Access remote media servers](#access-remote-media-servers)
If you have a media server such as [Plex](https://apps.apple.com/app/plex-stream-live-tv-channels/id383457673), [Channels](https://getchannels.com), or [JellyFin](https://jellyfin.org/docs) on an existing tailnet, you can access the content from your Apple TV. The following instructions assume that the Tailscale app is already installed and configured.
1. Open the Tailscale app on your Apple TV, and select **My Other Devices**.
2. Locate the media server name of the tailnet (for example, `jellyfin`).
3. Locate the tailnet DNS name. This can be found on the main page of the Tailscale app and in the [DNS](https://login.tailscale.com/admin/dns) page of the admin console (for example, `pangolin.ts.net`).
4. Open the media server app on tvOS. When prompted for the media server address, enter the combined media server and tailnet DNS name (for example, `jellyfin.pangolin.ts.net`).
Additional configuration for the media server may be required. For more information about configuring media server apps on Apple TV, consult the documentation for the specific app you are using.
## [Use a device exit node](#use-a-device-exit-node)
You can route your Apple TV through a device exit node in your tailnet. This is useful if you would like your Apple TV to appear as if it is connected to the internet, from where the exit node is geographically located.
1. Open the Tailscale app on your Apple TV.
2. In the **Exit Node** section, select an exit node that you want to route traffic through.
When your Apple TV is using another device as an exit node, the active exit node connection will display in blue.
## [Use a Mullvad exit node](#use-a-mullvad-exit-node)
This option is only available in the Tailscale app on tvOS if you've already purchased [Mullvad Exit Nodes](/docs/features/exit-nodes/mullvad-exit-nodes#use-mullvad-exit-nodes) for your tailnet.
You can route your Apple TV traffic through a Mullvad exit node in your tailnet. This lets you specify an exit node based on geographical location instead of choosing a tailnet device that is designated as an exit node.
1. Open the Tailscale app on your Apple TV.
2. Open the **Exit Node** section, then select **Location Based Exit Nodes** \> **Location Based**.
3. Select the Mullvad exit node you want to use.
When your Apple TV is using a Mullvad exit node, the active exit node connection in the Tailscale app will display in blue.
## [Advertise Apple TV as an exit node](#advertise-apple-tv-as-an-exit-node)
You can use your Apple TV as an exit node, and configure other devices in your tailnet to route their traffic through Apple TV. This is useful if you would like to route traffic through your home internet connection when you're away.
1. Open the Tailscale app on your Apple TV.
2. Open the **Exit Node** section, and select **None**.
3. Select **Run as Exit Node** and confirm.
4. In your web browser, open the [Machines](https://login.tailscale.com/admin/machines) page of the admin console.
5. Locate the Apple TV in the list, select the button, and select **Edit route settings**. Select the **Use as exit node** toggle to enable.
When your Apple TV is being used as an exit node:
* The active exit node connection will display in orange.
* The Apple TV device will display in the [Machines](https://login.tailscale.com/admin/machines) page of the admin console with the **Exit Node** badge.
## [Advertise Apple TV as a subnet router](#advertise-apple-tv-as-a-subnet-router)
Use these instructions if you want Apple TV to act as a [subnet router](/docs/features/subnet-routers) in your tailnet. This lets you remotely access resources on your home network that may not have Tailscale installed, such as a printer.
1. Open the Tailscale app on your Apple TV, and select **Subnet Router**.
2. Select **Advertise New Route**. A placeholder combined IP address and subnet mask (CIDR) of `192.168.1.0/24` will display. You can accept this default route, edit the route, and add multiple routes to advertise.
When adding or editing an advertised route, you must use the correct CIDR format, such as `192.168.1.0/24`.
## [Disconnect Apple TV from a tailnet](#disconnect-apple-tv-from-a-tailnet)
1. Open the Tailscale app on your Apple TV.
2. At the top of the screen, next to tailnet name, select **Disconnect**.
## [Stop using another device as an exit node](#stop-using-another-device-as-an-exit-node)
Use these instruction to stop your Apple TV from using either a tailnet device exit node or a Mullvad location-based exit node.
1. Open the Tailscale app on your Apple TV.
2. In the **Exit Node** section, select **Disable** next to the exit node currently in use.
The exit node that you stopped using will continue to display at the top of the screen as **Disabled**. If you no longer want it to be displayed there, select **None**, and the exit node will move back down to the **Exit Nodes In My Tailnet** section.
## [Stop using Apple TV as an exit node](#stop-using-apple-tv-as-an-exit-node)
Use these instructions if you want to stop using Apple TV as an exit node in your tailnet.
1. Open the Tailscale app on your Apple TV.
2. In the **Exit Node** section, select your Apple TV in the list to turn off exit node usage for the device entirely, or select another exit node to use instead.
* If you select the Apple TV and no longer want to use an exit node for the device, select **Disable**.
* If you select another exit node to use instead of the Apple TV, select **Stop using as exit node**.
## [Test device latency](#test-device-latency)
You can use the ping feature in the Tailscale app to test the latency (connectivity response time) between your Apple TV and other devices in your tailnet.
1. Open the Tailscale app on your Apple TV.
2. Select **My Other Devices**.
3. Select a device currently connected to your tailnet, and select it. This will automatically display a graph with the following information:
* The name of the device you are pinging.
* The device ping response time in milliseconds.
* The device connection type. Typically, you'll first observe a connection that is relayed by way of a [DERP server](/docs/reference/derp-servers), then a switch to a direct connection to the device over the tailnet, which is the ideal [connection type](/docs/reference/connection-types).
## [Troubleshooting](#troubleshooting)
The most common reason an Apple TV cannot be accessed is because it has gone to sleep and is not configured as a home hub, which lets it remain connected to the network while in sleep mode. Typically, an Apple TV is automatically configured as a home hub during its initial setup. However, this feature can be disabled if:
* The Apple TV is moved to a different physical location.
* Significant configuration changes are made to the network.
* The version of tvOS is version 17. If you're still running tvOS 17, your home devices automatically choose a home hub depending on performance and device availability. This means that your Apple TV might not be automatically configured as a home hub. To check the version of tvOS is installed on an Apple TV, open the Settings app, select **System \> Software Updates** and the version will display.
For more information, refer to the Apple topic [Set up your HomePod, HomePod mini, Apple TV, or iPad as a home hub](https://support.apple.com/HT207057).
### [Configure Apple TV as a home hub](#configure-apple-tv-as-a-home-hub)
To manually configure Apple TV as a home hub using tvOS version 18 and later:
1. Open tvOS on your Apple TV and go to **Settings**.
2. Verify that tvOS is authenticated to an iCloud account by selecting **Users and Accounts**, then select **Default User**, and verify the **iCloud** field contains account information.
3. From the **Settings** main menu, go to **AirPlay and HomeKit**, select the **HomeKit** field, and designate a room name for the Apple TV. This will automatically designate it as the home hub.
### [Verify Apple TV as a home hub](#verify-apple-tv-as-a-home-hub)
There are multiple ways of verifying that an Apple TV is configured as a home hub.
* Put the Apple TV to sleep, then do one of the following:
* In a tailnet device using iOS or Android, open the Tailscale app, tap the Apple TV in the device list, and then select the **Ping** option. A screen will display showing ping response information.
* If the Apple TV is configured as an exit node use another device in your tailnet to verify that you can still connect to the Apple TV exit node.
* Open the Home app on an iOS device, go to **Settings**, select **Home Hubs & Bridges**, and look for the Apple TV.
If none of these options work, try restarting tvOS and verify again.
On this page
* [Prerequisites](#prerequisites)
* [Install Tailscale on tvOS](#install-tailscale-on-tvos)
* [Access remote media servers](#access-remote-media-servers)
* [Use a device exit node](#use-a-device-exit-node)
* [Use a Mullvad exit node](#use-a-mullvad-exit-node)
* [Advertise Apple TV as an exit node](#advertise-apple-tv-as-an-exit-node)
* [Advertise Apple TV as a subnet router](#advertise-apple-tv-as-a-subnet-router)
* [Disconnect Apple TV from a tailnet](#disconnect-apple-tv-from-a-tailnet)
* [Stop using another device as an exit node](#stop-using-another-device-as-an-exit-node)
* [Stop using Apple TV as an exit node](#stop-using-apple-tv-as-an-exit-node)
* [Test device latency](#test-device-latency)
* [Troubleshooting](#troubleshooting)
* [Configure Apple TV as a home hub](#configure-apple-tv-as-a-home-hub)
* [Verify Apple TV as a home hub](#verify-apple-tv-as-a-home-hub)
Scroll to top