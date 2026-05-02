Overview: Tailscale and TunnelVision
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|insightsMay 24, 2024
# Tailscale and TunnelVision: our analysis
Since the disclosure of [the TunnelVision bug (CVE 2024-3661)](https://www.leviathansecurity.com/blog/tunnelvision) by researchers at Leviathan Security, some users have asked us whether and how it affects Tailscale. The short answer: it’s complicated. While we don’t think TunnelVision constitutes a major security concern for most Tailscale users, some users may be affected. The longer answer: it depends on a few factors, including how you are using Tailscale, what environment you’re in, and what operating system you’re using, and we dig into those details below.
Tailscale was not among the vendors that Leviathan warned before their public release earlier this month.[¹](/blog/tunnelvision-analysis#fn1) This post distills several weeks of extensive testing that we’ve conducted since then.
First, some context. There are a variety of different use cases for VPN, overlay, and mesh networking systems. Those use cases have subtly different threat models and security and functionality goals. Two of the most common use cases are:
* to access services on a private network, such as in a business or home network
* to defend against eavesdropping or tampering (typically considering only attackers on the LAN, canonically the untrustworthy coffee shop Wi-Fi, although in fact attackers could be able to influence any router or network between your computer and the remote peer)
TunnelVision primarily targets the latter use case.
Tailscale can serve many of these use cases. The most straightforward use of Tailscale is to provide access to services on private networks, but there are also features like [subnet routers](https://tailscale.com/kb/1019/subnets), [exit nodes](https://tailscale.com/kb/1103/exit-nodes), [app connectors](https://tailscale.com/kb/1281/app-connectors), and [Mullvad integration](https://tailscale.com/mullvad) that complicate the analysis of the impact of TunnelVision on Tailscale.
The table below shows what we have found in our testing. The biggest impact occurs when using Tailscale on Apple platforms.
* On Linux, Tailscale’s routing management overrides the DHCP-provided route, preventing the attack.
* The Android DHCP client does not implement DHCP option 121, which is a necessary precondition for the attack. Tailscale on Android is not vulnerable.
* Tailscale on Windows is partially impacted by this issue. Attacks against the CGNAT IPs of Tailscale peers are not effective, and traffic is routed correctly over the WireGuard interface. Attacks against non-Tailscale IPs while Exit Nodes are turned on cause packets to be dropped by the client, creating a denial of service (DoS) condition.
* iOS, and macOS are the most affected as DHCP-provided routes take precedence over those Tailscale provides. On these platforms an attacker can impersonate both tailnet peers and exit nodes, bypassing the WireGuard interface. However, an attacker cannot man-in-the-middle (MitM) the traffic traveling between legitimate tailnet nodes, as the receiving node expects a full WireGuard connection.
* We could not reproduce the attack on tvOS. However, with limited access to system internals on tvOS, we cannot verify that DHCP option 121 is fully propagated to the system routing table.
**UPDATE 2024-06-12:**
On macOS, as of v1.68 or later, the Tailscale client will detect the presence of DHCP Option 121 routes, and will warn the user if any such routes exist by presenting a modal window. The warning provides the option to stop using Tailscale, or to continue anyway. Occurrences of the warning will also be logged in the system log, accessible via the Console app. We hope and expect that occurrences of TunnelVision in the wild will be relatively rare.
Deployments which intend to use DHCP Option 121 for legitimate reasons can enable [the HideDHCP121Warnings system policy key](https://tailscale.com/kb/1315/mdm-keys) to suppress the warning. On the Standalone variant of the Tailscale client for macOS, such key can be set by executing this command in the Terminal:
`defaults write io.tailscale.ipn.macsys HideDHCP121Warnings true`
If using the App Store variant of the macOS client, use the appropriate bundle identifier:
`defaults write io.tailscale.ipn.macos HideDHCP121Warnings true`
On a fleet of managed Macs running Tailscale, user-facing warnings may also be disabled by using an MDM solution to deploy the aforementioned key remotely. For more details, refer to [our documentation on MDM deployments for macOS](https://tailscale.com/kb/1286/macos-mdm).
**We do not currently have a fix to the problem on iOS** as platform restrictions imposed by Apple prevent third-party apps such as Tailscale from reading the current DHCP configuration. If we find an approach to mitigate the problem, we will update this bulletin.
**END OF UPDATE**
### [What can you do about it?](#what-can-you-do-about-it)
First, note that TunnelVision’s adverse effects arise as a result of otherwise normal and expected use of DHCP option 121: the ability to advertise specific network routes. Generally, the ‘network helper protocols’ (DNS, DHCP, ARP, etc.) are not trustworthy, and their trustworthiness should ideally not be necessary. Furthermore, high-specificity/high-priority routes to CGNAT/Tailscale IP addresses/ranges might be expected and legitimate, or they might be indicators of attack or compromise. Unfortunately the Tailscale client has no reliable way to be sure, purely in software and without understanding of a given deployment scenario.
However, it seems unlikely to us that DHCP option 121 for CGNAT IP ranges is in widespread legitimate use.
#### [Manually check for DHCP-provided routes](#manually-check-for-dhcp-provided-routes)
On macOS, you can run the command `ipconfig getsummary en0` in a Terminal window to see whether any CGNAT, Tailscale, or other IP addresses or ranges have been added by your DHCP server for the en0 interface. In the output, look for a line beginning with `classless\_static\_route`. In this example, the DHCP server has provided a route to the 8.8.0.0/16 address range:
```
`% ipconfig getsummary en0
[…]
router (ip\_mult): {10.0.50.1}
domain\_name\_server (ip\_mult): {10.0.50.1}
domain\_name (string): lan
classless\_static\_route (classless\_route): {8.8.0.0/16, 10.0.50.75}
end (none):
[…]`
```
Again, keep in mind that if you do see such routes, that doesn’t mean for certain that someone has deployed the TunnelVision attack. But network administrators can use this to check whether the network is working as intended.
#### [Use secure application protocols](#use-secure-application-protocols)
When using [Tailscale exit nodes](https://tailscale.com/kb/1103/exit-nodes), we strongly recommend you to only use HTTPS websites and not send any sensitive data to web pages using plain HTTP. Most newer browsers offer a [setting to enforce an HTTPS requirement](https://securityplanner.consumerreports.org/tool/install-https-everywhere). Although in ideal circumstances, exit nodes can help protect Internet traffic from the local LAN and upstream ISP, such traffic always traverses many routers, each of which could snoop on your unencrypted traffic. Encrypted protocols such as HTTPS, encrypted forms of DNS, SSH, etc. remain the best practice for Internet traffic.
When using [Tailscale subnet routers](https://tailscale.com/kb/1019/subnets), the same advice applies.
When using [Tailscale app connectors](https://tailscale.com/kb/1281/app-connectors), the app or service should (of course) implement HTTPS on the receiving end, and where possible you should configure your account with the service to use an IP allowlist that includes your App Connector node’s egress IP. (For example, [GitHub Enterprise supports IP allowlists](https://docs.github.com/en/enterprise-cloud@latest/organizations/keeping-your-organization-secure/managing-security-settings-for-your-organization/managing-allowed-ip-addresses-for-your-organization).)
1. We learned after the TunnelVision disclosure that essentially the same bug was [described in 2015 by Andrew Ayer](https://www.agwa.name/blog/post/hardening_openvpn_for_def_con).
Share
Author
Chris Palmer
Author
Chris Palmer
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