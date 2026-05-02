Tailscale’s windowed macOS UI is now in beta
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|productSeptember 26, 2025
# Tailscale’s windowed macOS UI is now in beta
We love that many of you use Tailscale without even thinking about it. We love that, for the most part, Tailscale is out of the way. It’s a utility that runs in your menu bar and doesn’t command your attention, it just works!
Unfortunately, relying on the menu bar alone presents both UX and coding challenges. Menu bar dropdowns don’t allow us to easily convey information through changes in shape or color. They can’t include a search bar for finding that device or exit node you know the name of. They are not great for discovery either: we constantly get the feedback that some of our most loved features are hidden, like [Taildrop](https://tailscale.com/kb/1106/taildrop) and [ping](https://tailscale.com/kb/1080/cli#ping).
This is why we are introducing a new macOS UI: a windowed app that gives us the real estate to provide things like search, better error handling, debugging, and feature discovery. The windowed app runs alongside the menu bar app, which is here to stay. This new UI is currently available on macOS for Tailscale v1.88 and later.
## [Enable the new UI](#enable-the-new-ui)
To try out the new UI, you will first need to enable it through [the Settings tab in the admin console](https://login.tailscale.com/admin/settings/general), under **General \> Feature previews**. Keep in mind this will enable it for everyone on your tailnet: if you want to grant only a few users access to this version, we are working on offering control of this via MDM. The app is very much in beta, as we are at work adding new features, fixing papercuts, and addressing general reliability improvements.
Want the new UI, but only on command, without it sitting in your dock? We’ve got you covered in our latest unstable version (and upcoming 1.90 stable release). When quitting the Tailscale app through the menu bar or Command + Q, you’ll be able to express a preference on whether you want to quit Tailscale completely or keep it running in the menu bar. The latter will remove the app from your dock, and you’ll be able to launch it again from the menu bar dropdown.
## [Explore devices and exit nodes](#explore-devices-and-exit-nodes)
When you open the windowed app, you will see a searchable list of devices you can access, along with their connection status. Selecting one brings up more information and actions. You are one click away from copying MagicDNS and IP addresses, pinging the device, and sending files through [Taildrop](https://tailscale.com/kb/1106/taildrop) (alpha).
Exit nodes are also available for perusal in the windowed app. Search for the one you want, hit the play button, and all your traffic will be routed through that exit node! Similarly to our mobile apps, the app remembers your last used exit node, and also suggests a recommended one [based on latency, performance, and location](https://tailscale.com/kb/1392/auto-exit-nodes#how-it-works).
## [Quick access to troubleshooting information](#quick-access-to-troubleshooting-information)
Because Tailscale normally runs as just a tiny icon in the top right of your screen, it can be hard to notice when things aren’t working as they should, especially if you have notifications disabled (which you should enable, because we only use them to alert you of connectivity trouble!).
While the windowed app sits in your dock, critical errors will be indicated by a very visible red dot. Opening the app will display the error prominently at the bottom of the sidebar, and clicking either the error or the ladybug icon in the top right will open the new debug window. This window contains all current errors and warnings, as well as bug report and reset options.
## [Mini player, for when less is more](#mini-player-for-when-less-is-more)
For folks who don’t need to browse devices and for those who want a more streamlined, minimalist windowed app, we made a mini player! It provides a quick glance at your connection status and lets you control exit nodes and account switching in a much more simplified UI.
To toggle the mini player, you can use the double square icon in the top right corner.
## [That’s all, for now](#thats-all-for-now)
We look forward to [hearing your feedback](https://tailscale.typeform.com/to/TNNlpL58) on this new design. We are hard at work building a similar UI for Windows devices, and addressing the long tail of fixes of this new macOS version in preparation for a General Availability release.
Share
Authors
Megan Walsh
Alessandro Mingione
Authors
Megan Walsh
Alessandro Mingione
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