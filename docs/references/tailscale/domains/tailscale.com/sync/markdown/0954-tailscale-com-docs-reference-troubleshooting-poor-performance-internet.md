Poor performance with internet connections · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Poor performance with internet connections
Last validated: Nov 14, 2025
Network performance problems often emerge as unstable connections, packet loss, high latency, or a failure to make a [direct connection](/docs/reference/connection-types). The cause of these problems can differ depending on the context. Use the following steps to help you troubleshoot why a device is experiencing network performance issues when connecting to the public internet.
1. **Ensure the Tailscale client is up-to-date**.
Make sure both devices are running the latest version of Tailscale. You can [check the version](/docs/features/client/update) of every device in your tailnet from the [Machines](https://login.tailscale.com/admin/machines) page of the admin console.
You can also check the version of each device locally using the Tailscale application or the [`tailscale version`](/docs/reference/tailscale-cli#version) command. This command also has flags available to check the version of the Tailscale client or the [`tailscaled` daemon](/docs/reference/tailscaled) specifically.
If the Tailscale version is outdated, [download and install the latest version](/docs/features/client/update).
2. Gather basic information about the device's network configuration and connection to the website or device using a tool like [`ping`](https://www.ibm.com/docs/en/aix/7.3?topic=p-ping-command), [MTR](https://en.wikipedia.org/wiki/MTR_(software)), or [`traceroute`](https://www.ibm.com/docs/en/aix/7.3?topic=analysis-traceroute-command) (for macOS and Linux). For Windows, you can use [`ping`](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/ping), [WinMTR](https://en.wikipedia.org/wiki/MTR_(software)), or [`tracert`](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/tracert).
3. **Check for Tailscale configurations that might prevent a connection**.
If the device uses an exit node, ensure the exit node is online and has access to the resources you're trying to access. For example, ensure that no access control policies prevent the exit node from reaching the destination's IP address or port number. Additionally, ensure the exit node isn't experiencing performance issues like latency.
If the device functions as an exit node, ensure its performance isn't hindered by the inbound connections. You can do this by checking the bandwidth usage, the CPU usage, and the RAM usage.
4. **Disconnect from any other virtual private network (VPN) software**.
While Tailscale doesn't deliberately conflict with other VPNs, it's difficult to avoid conflicts in all environments. Many VPN programs also try to prevent other software, such as Tailscale, from making network configuration changes.
5. **Disconnect from Tailscale**. If the problem persists, continue troubleshooting [basic network connectivity (beyond Tailscale)](/docs/reference/troubleshooting/basic-network-troubleshooting).
Scroll to top