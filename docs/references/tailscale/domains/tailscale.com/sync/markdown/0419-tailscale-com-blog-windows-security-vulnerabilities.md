Action required: Upgrade Windows clients to v1.32.3
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|November 21, 2022
# Action required: Upgrade Windows clients to v1.32.3
Tailscale has recently been notified of security vulnerabilities in the Tailscale Windows client which allow a malicious website visited by a device running Tailscale to change the Tailscale daemon configuration and access information in the Tailscale local and peer APIs.
**To patch these vulnerabilities, [upgrade Tailscale on your Windows machines](/kb/1067/update/?tab=windows) to Tailscale v1.32.3 or later**, or v1.33.257 or later (unstable).
### What happened?
In the Tailscale client, the local API was bound to a local TCP socket, and communicated with the Windows client GUI in cleartext with no Host header verification.
This allowed an attacker-controlled website visited by the node to rebind DNS to an attacker-controlled DNS server, and then make local API requests in the Windows client, and peer API requests in all clients. An attacker could then change the coordination server to an attacker-controlled coordination server and access the node’s Tailscale environment variables.
The peer API was also vulnerable to DNS rebinding.
There is no evidence of these vulnerabilities being purposefully triggered or exploited.
Further information on these vulnerabilities is available in Tailscale security bulletins [TS-2022-004](/security-bulletins/#ts-2022-004) and [TS-2022-005](/security-bulletins/#ts-2022-005).
### Who is affected?
Tailscale clients prior to v1.32.3 are affected.
Admins of a tailnet can [view affected devices in the admin console](https://login.tailscale.com/admin/machines?q=version:<1.32.3+windows). We have emailed the owners of tailnets with affected Windows devices.
### What do I need to do?
If you are running Tailscale on Windows, [upgrade to v1.32.3 or later](/kb/1067/update/) or v1.33.257 or later (unstable) to remediate the issue.
The Windows client caches the current version for a while, so may not yet have v1.32.3 available on your device.
In that case, you can still pull the latest release from [http://pkgs.tailscale.com/stable](http://pkgs.tailscale.com/stable).
If you have any issues, please [contact support](/contact/support).
Share
Author
David Crawshaw
Author
David Crawshaw
Share
Loading...
## Try Tailscale for free
[
Get started
](https://login.tailscale.com/start)
Schedule a demo
[
Contact sales
](/contact/sales)