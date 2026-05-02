Can't connect to internet · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Can't connect to internet
Last validated: Dec 10, 2025
Use the following steps to help you troubleshoot why a device can't connect to the public internet.
Before checking anything else, ensure neither device is experiencing any [fundamental network connectivity problems](/docs/reference/troubleshooting/basic-network-troubleshooting).
1. **Make sure the device has internet access**.
You can do this by trying to open a website such as [`https://tailscale.com`](https://tailscale.com) in a browser or using a terminal application to ping a well-known IP address, such as one of Google's DNS servers (`8.8.8.8`).
If you can ping an IP address but can't open a URL in a browser, the device is likely [unable to resolve domain names](/docs/reference/troubleshooting/resolve-domain-names-failure).
2. **Check for a captive portal**.
Tailscale has the ability to [detect captive portals](/docs/integrations/captive-portals). However, if you haven't received a captive portal alert and you still suspect the device might encounter a captive portal, open [`http://neverssl.com`](http://neverssl.com) in a browser. This should reveal a captive portal if one exists.
If you encounter a captive portal (and you trust the network): Disconnect from Tailscale, login to the captive portal, then reconnect to Tailscale.
3. **Ensure you aren't using a service that uses the same CGNAT IP address range as Tailscale**.
Because Tailscale uses the [CGNAT](https://en.wikipedia.org/wiki/Carrier-grade_NAT) IP address range for [Tailscale IP addresses](/docs/concepts/tailscale-ip-addresses), you might encounter problems accessing other non-Tailscale IP addresses in this range.
You can resolve an issue like this, you can [update your tailnet policy file to disable IPv4](/docs/reference/syntax/policy-file#disableipv4) or use a custom [IP pool](/docs/reference/ip-pool).
4. **Check for other Tailscale configurations that might prevent a connection**.
For example, if the device uses an exit node, make sure the exit node is online and has access to the resources you're trying to access. For example, ensure no access control policies prevent the exit node from reaching the destination.
5. **Disconnect from any other virtual private network (VPN) software**.
While Tailscale doesn't deliberately conflict with other VPNs, it's difficult to avoid conflicts in all environments. Many VPN programs also try to prevent other software, such as Tailscale, from making network configuration changes.
6. **Disconnect from Tailscale**.
If the problem persists, continue troubleshooting [basic network connectivity (beyond Tailscale)](/docs/reference/troubleshooting/basic-network-troubleshooting).
Scroll to top