TunnelVision vulnerability and Tailscale · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# TunnelVision vulnerability and Tailscale
Last validated: Oct 29, 2025
TunnelVision is an attack that abuses legitimate network configuration tools that can potentially be exploited by malicious actors.
If the TunnelVision vulnerability is detected on a macOS device running the Tailscale client, the following pop-up notification will display:
If you receive this notification on macOS, a setting called DHCP option 121 was detected and is used on the network you connected to. Although the network might be using DHCP option 121 for non-malicious purposes, there's a possibility that someone might have tried to exploit it to perform this attack.
On macOS and iOS devices, Tailscale cannot override DHCP option 121. This issue is not known to impact tvOS.
## [How the attack works](#how-the-attack-works)
Most computer networks use a service called Dynamic Host Configuration Protocol (DHCP). DHCP acts as a helpful guide on your local network by assigning addresses to devices as they join and ensuring they know where to send and receive information. Typically, DHCP is used solely to assign addresses, DNS name servers, and a single default route. However, it can also provide instructions (known as DHCP options) to devices when they join the network. These instructions may indicate to your device what services are available on the network, and how to use them automatically.
A TunnelVision attack occurs when someone maliciously uses a network setting known as DHCP option 121 on your local network to instruct devices to send data to the attacker when it should have gone to your tailnet or a site on the internet instead.
## [How to take action](#how-to-take-action)
### [Home networks](#home-networks)
If you're using a home network, check your network configuration and ensure DHCP option 121 is not being used. Your internet provider might also have enabled DHCP option 121 for you. If that's the case, you can safely select **Keep Tailscale Running** and check **Don't warn me again** to hide these warning messages.
### [Work networks](#work-networks)
If you're using a work network and receive the pop-up notification, contact your network administrator and notify them that Tailscale has detected DHCP option 121 in use. Your administrator can determine whether the warning was a false positive. Your administrator may also disable the warnings using a [Tailscale system policy](/docs/features/tailscale-system-policies).
### [Public networks](#public-networks)
If you're using a public network such as one in a coffee shop or co-working space, and you receive the pop-up notification, we recommend that you select **Disconnect** and connect to a different network.
## [Additional information](#additional-information)
For more in-depth information, refer to our blog post [Tailscale and TunnelVision: our analysis](/blog/tunnelvision-analysis).
On this page
* [How the attack works](#how-the-attack-works)
* [How to take action](#how-to-take-action)
* [Home networks](#home-networks)
* [Work networks](#work-networks)
* [Public networks](#public-networks)
* [Additional information](#additional-information)
Scroll to top