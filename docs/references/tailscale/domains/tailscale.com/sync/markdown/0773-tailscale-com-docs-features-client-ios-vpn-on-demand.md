Using VPN On Demand for iOS and macOS · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Using VPN On Demand for iOS and macOS
Last validated: Jan 5, 2026
VPN On Demand is currently only available in the iOS and macOS versions of the Tailscale client.
Tailscale 1.48 for iOS was the first version of the Tailscale client to support this feature.
Support for macOS was added in Tailscale 1.60.
VPN On Demand is a feature that VPN providers on iOS and macOS can adopt to automate
the establishment of a VPN connection. When VPN On Demand is used, your device can
automatically start or stop the Tailscale VPN tunnel based on a number of criteria.
For instance, you can create a VPN On Demand configuration that will connect Tailscale
when your iPhone leaves your Wi-Fi network, and disconnect once you're back
under Wi-Fi coverage.
## [Setting up VPN On Demand](#setting-up-vpn-on-demand)
To set up VPN On Demand:
[iOS](/docs/features/client/ios-vpn-on-demand?tab=ios)[macOS](/docs/features/client/ios-vpn-on-demand?tab=macos)
1. Open the Tailscale app on your iOS device.
2. After logging in, open the settings by tapping on your profile picture on the top right.
3. Tap on **VPN On Demand**. If you don't see this item, your system administrator might have
hidden the VPN On Demand settings, or you might be running an older version of the Tailscale
client. You should update to a newer version from the App Store.
4. You can now enable VPN On Demand and set up your rule set based on the instructions below.
### [Choosing your connection rules](#choosing-your-connection-rules)
Connection rules are available for the Wi-Fi, Cellular, and Ethernet interfaces on your device.
For Wi-Fi interfaces, you can choose from one of the following options:
* **Always**: Tailscale will always connect when a Wi-Fi connection is active.
* **Only On**: Tailscale will always connect when a Wi-Fi connection is active, provided that the
current Wi-Fi network is included in the configuration. If the current Wi-Fi network is not in the
list of included networks, Tailscale will disconnect.
* **Except On**: Tailscale will always connect when a Wi-Fi connection is active, however it will
disconnect if the current Wi-Fi network is included in the list of excepted networks.
* **Never**: Tailscale will always disconnect when a Wi-Fi connection is active.
* **Do Nothing**: Tailscale won't automatically connect or disconnect, allowing you to manually
manage the state of the VPN.
For Cellular and Ethernet interfaces, you can choose from one of the following options:
* **Always**: Tailscale will always connect when a cellular data or Ethernet connection is established.
* **Never**: Tailscale will always disconnect when a cellular data or Ethernet connection is established.
* **Do Nothing**: Tailscale won't automatically connect or disconnect, allowing you to manually manage the state
of the VPN.
### [Using MagicDNS hostname matching](#using-magicdns-hostname-matching)
You can also use VPN On Demand to automatically connect Tailscale when iOS or macOS detect a connection
to a hostname that ends in `\*.ts.net`. This feature is available only when you have set
the connection rule for an interface to **Do Nothing**. When any other rule is active, MagicDNS matching
will not be available.
## [Common issues](#common-issues)
VPN On Demand rules can determine whether the Tailscale app is allowed to establish a VPN on your device,
and if your rules are not set up correctly, they can prevent Tailscale from connecting.
For instance, if your rules are set to **Never** for an interface, iOS/macOS will disconnect Tailscale. If you attempt
to reconnect manually, iOS/macOS will immediately disconnect the VPN again. To get out of this state, you must adjust
your connection rules to allow the connection, or disable VPN On Demand entirely.
If you are experiencing any problem or have an enhancement request,
[file a GitHub issue](https://github.com/tailscale/tailscale/issues).
## [Using other VPNs](#using-other-vpns)
On both iOS and macOS, you can only have one VPN app with On Demand enabled at any given time. If you connect to
any other VPN while On Demand is enabled for Tailscale, iOS/macOS will disable it for Tailscale
until you manually connect Tailscale again. For more information about using other VPNs
together with Tailscale, refer to [this entry](/docs/reference/faq/other-vpns).
On this page
* [Setting up VPN On Demand](#setting-up-vpn-on-demand)
* [Choosing your connection rules](#choosing-your-connection-rules)
* [Using MagicDNS hostname matching](#using-magicdns-hostname-matching)
* [Common issues](#common-issues)
* [Using other VPNs](#using-other-vpns)
Scroll to top