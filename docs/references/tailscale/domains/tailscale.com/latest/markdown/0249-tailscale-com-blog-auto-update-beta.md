Keeping Tailscale Clients Up-to-Date: Auto-Updates Beta Now Available
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|October 31, 2023
# Keeping Tailscale clients up-to-date
At Tailscale, we are constantly making performance improvements, adding new features, and fixing bugs in the Tailscale client. To make it easier for you to get those improvements, we’re adding auto-update support on all platforms where Tailscale runs. For example, when we release a security fix, nodes that enable auto-updates get patched as soon as possible. Some platforms (like Apple App Store and Google Play Store) already do the heavy-lifting for us. Others don’t have anything out of the box, so we built it ourselves.
We’re also improving the UIs (graphical and command line) across all platforms to make it easier to notice when an update is available.
Tailscale Preferences, now featuring an option to "Automatically install updates"
Consider enabling auto-updates on your machines to:
* Patch any security issues quickly, before attackers get a chance to exploit them
* Get access to the latest features, performance improvements and bug fixes
* Reduce the toil of manual updates
### It’s optional
Auto-updates are in Beta and available to everyone starting with Tailscale 1.52. There will be no surprises when you upgrade to 1.52 — auto-updates are off by default. If you choose to enable them, you can do so by following [these instructions](/kb/1067/update/). You can also trigger the update check manually by running `tailscale update` on the CLI.
### What about stability?
We’ve all been burned by things breaking after an update. We build with the recognition that it’s especially important for infrastructure like Tailscale to remain stable!
Tailscale’s Stable track (any even-numbered version, like 1.52) is pretty darn stable. We do thorough testing before cutting a release, and many of us follow the Unstable track to proactively catch regressions before a release.
It is also typically *less* risky to do regular small updates, instead of large multi-version jumps. Keeping Tailscale up-to-date across a company should not be an item in your quarterly planning, after all.
If you manage a large tailnet and want to do a small test you can [install an unstable version](https://pkgs.tailscale.com/unstable/) (any odd-numbered version, like 1.51) of Tailscale on some of your machines. This will give you more confidence that an upcoming stable release will keep working for you.
### What’s next
We are actively improving our update scheduling to make it least likely to disrupt your work. This takes into account the machine’s time zone and level of activity. We are also adding controls for tailnet admins to manage updates across their organization.
Whether you’re running a homelab or managing a corporate fleet, give auto-updates a try. Simply follow [these instructions](/kb/1067/update/) on machines you’d like to opt in, sit back, and relax.
Share
Authors
Andrew Lytvynov
Chris Palmer
Authors
Andrew Lytvynov
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