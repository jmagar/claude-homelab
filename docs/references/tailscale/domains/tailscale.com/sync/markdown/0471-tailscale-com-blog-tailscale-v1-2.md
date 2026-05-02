Tailscale v1.2 is here
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|November 16, 2020
# Tailscale v1.2 is here
The team has been hard at work making Tailscale more Tailscale-y. Today we’re announcing v1.2 is stable and ready for teams and hobbyists alike. Most notably, this release includes MagicDNS for everyone and major improvements for our Windows client.
#### How to update:
* Linux: [update instructions](/kb/1067/update#linux) (apt update, install, etc.)
* Windows: [update instructions](/kb/1067/update#windows)
* macOS: update [via the Mac App Store](https://apps.apple.com/us/app/tailscale/id1475387142?mt=12)\*
* iOS: update [via the App Store](https://apps.apple.com/us/app/tailscale/id1470499037?ls=1)\*
* Android: update [via the Play Store](https://play.google.com/store/apps/details?id=com.tailscale.ipn)
\*For macOS and iOS, you may need to quit Tailscale first; the App Store doesn’t seem to update running VPN apps.
#### What happened to v1.1? (Or, a brief note on version numbers)
Eagle-eyed readers may notice that our last stable release was v1.0, and now here we are at v1.2. What happened to v1.1?
Since v1.0 we’ve begun using an alternating version numbering system. Stable releases use even numbers (1.0, 1.2, 1.4) and unstable releases use odd numbers (1.1, 1.3, 1.5). This format makes it easier to identify which build of Tailscale your devices are running, and can help with troubleshooting issues. For the adventurous, you can find [our latest unstable version (v1.3) on our site](/kb/1083/install-beta).
### What’s Included
#### MagicDNS, available on stable builds!
MagicDNS lets you access devices on your network via hostnames rather than having to remember IP addresses. For example, you could visit your `monitoring` webserver by going to `monitoring/` in your browser, or SSH to your production servers with `ssh username@www-prod-eu-west-1`. Simple!
It works by running an embedded DNS server on your device at 100.100.100.100, serving names for nodes in your network. Requests for regular DNS names are forwarded to your upstream resolver.
MagicDNS is *still in beta*, and needs to be [manually enabled from the admin console](/kb/1081/magicdns#prerequisites). We’re working on fixing several DNS bugs on less common operating systems and configurations before we remove the beta label. But with this release v1.2, MagicDNS is available for everyone to try.
[Learn how to enable MagicDNS for your network →](/kb/1081/magicdns)
#### Unattended Mode for Windows
Unattended Mode lets your Windows device be reachable over the network, even if no Windows user is logged in, like how Tailscale runs on Linux. This is particularly useful for connecting to Windows via RDP or VNC (as Tailscale runs in the background at boot) or running web, database, or other servers.
Unattended Mode can be enabled on Windows with the new “Run unattended” checkbox from the Tailscale tray icon’s context menu.
### Admin Console Improvements
Outside of the Tailscale client, we’ve also introduced a number of improvements to [our ACL editor](https://login.tailscale.com/admin/acls), to help teams manage access controls for their network:
##### ACL Tests
Admins can now define automated tests to ensure specific users have (or don’t have) access to a given device/port. These tests can help ensure you don’t adversely affect your network when changing rules that involve multiple groups, tags, roles and rules. [Learn more →](/kb/1018/acls#tests)
##### ACL Rule Preview
Another way to ensure your network rules behave as expected: ACL Rule Preview lets you preview which devices a particular user on your network can access. It also shows you which rules on which lines allow that access, so you can change or fix broken rules. [Learn more →](/kb/1018/acls#preview-rules)
As always, [email us](mailto:info@tailscale.com) or tweet us ([@tailscale](https://twitter.com/tailscale)) if you have any problems and we’ll try to help.
Share
Authors
Brad Fitzpatrick
David Anderson
Authors
Brad Fitzpatrick
David Anderson
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