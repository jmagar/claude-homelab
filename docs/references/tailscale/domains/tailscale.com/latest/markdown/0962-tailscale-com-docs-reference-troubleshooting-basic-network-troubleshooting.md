Basic network troubleshooting · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Basic network troubleshooting
Last validated: Nov 14, 2025
This topic provides information about general network troubleshooting, that is, not specific to Tailscale. For troubleshooting Tailscale-specific issues, refer to [Troubleshoot device connectivity](/docs/reference/troubleshooting/connectivity) and [Troubleshoot network configuration](/docs/reference/troubleshooting/network-configuration).
Troubleshooting basic network connectivity varies by operating system, environment, and other variables. However, you might consider trying the following:
1. Gather basic information about the device's network configuration and connection to the website or device.
The tools available to gather this information vary depending on the operating system.
[macOS](/docs/reference/troubleshooting/basic-network-troubleshooting?tab=macos)[Windows](/docs/reference/troubleshooting/basic-network-troubleshooting?tab=windows)[Linux](/docs/reference/troubleshooting/basic-network-troubleshooting?tab=linux)
On macOS devices, you can:
* Use a CLI tool like [`ping`](https://www.ibm.com/docs/en/aix/7.3?topic=p-ping-command), [`ifconfig`](https://www.cs.unh.edu/cnrg/people/gherrin/linux-net.html#tth_sEc3.2.2), or [`traceroute`](https://www.ibm.com/docs/en/aix/7.3?topic=analysis-traceroute-command).
* Record a [packet trace](https://developer.apple.com/documentation/network/recording-a-packet-trace?language=objc).
* Use a [third-party tool](https://developer.apple.com/documentation/network/taking-advantage-of-third-party-network-debugging-tools?language=objc) like [MTR](https://en.wikipedia.org/wiki/MTR_(software)) or [Wireshark](https://www.wireshark.org/).
Tool availability for other platforms and embedded systems might vary.
* Check the device's network configuration, such as the network interface card (NIC), subnet masks, default gateway, and DNS servers.
* Check the device's CPU and RAM usage.
* Ensure there aren't any physical problems with the device, such as worn cables or a low battery.
* Check for updates to the device's operating system or firmware.
* Contact your internet service provider (ISP).
* Restart the device.
Scroll to top