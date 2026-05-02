Tailscale v0.100
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|July 20, 2020
# Tailscale v0.100
We’re once again happy to announce a new version of Tailscale.
What comes after 0.99? 0.100, of course!
This is a pretty notable release, containing a major rewrite of our
“magicsock” connection code that sits between WireGuard and the
network, finding the best path between peers and getting through NATs.
If you’ve had any connection woes previously, definitely give this a
try.
One catch, though: the new 0.100 connectivity code only kicks in if
two peers trying to connect to each other are both running 0.100 or
later. So make sure you update all your devices.
How to update:
* **Linux**: see [https://pkgs.tailscale.com/stable/](https://pkgs.tailscale.com/stable/) (`apt-get update`, `upgrade`, etc)
* **Windows**: from that same page, download [tailscale-ipn-setup-0.100.0-107.exe](https://pkgs.tailscale.com/stable/tailscale-ipn-setup-0.100.0-107.exe)
* **macOS**: update from the Mac App Store (you’ll likely need to stop Tailscale first; the App Store doesn’t seem to update VPN apps that are running)
* **iOS**: we’re giving it a few days until we mark 0.100 as our stable build on iOS, but you can join our [TestFlight beta program](https://testflight.apple.com/join/tLcYLZJV) to get it today
* **Android**: the latest [Tailscale Android beta](https://play.google.com/apps/testing/com.tailscale.ipn) builds use the new 0.100 connectivity code
In addition to the connectivity improvements, there are a number of
other fixes and cleanups:
* The **Linux client now respects DNS settings** set in the [Tailscale admin console](https://login.tailscale.com/admin/dns).
* The **Windows client now has “About” and “Exit”** menu options. The “About” dialog
will show the current stable version. (No auto-update option yet, but it’s
a start.) Windows service start-up errors are now also surfaced in the UI, which
is still a sad experience if it happens but should make for better
[Windows bug reports](https://github.com/tailscale/tailscale/issues?q=is:issue+is:open+label:OS-windows)
at least. We’re working on those. Long tail is long.
* The **macOS client** now stays off when you turn it off via the OS network settings.
* The `tailscale status` subcommand (only currently included on Linux)
now consistently shows asterisks around a peer endpoint address only when
that path is active, and also now shows asterisks around DERP relays if
that’s what’s being used.
Enjoy!
And as always, [email us](mailto:support@tailscale.com) or tweet us
([@tailscale](https://twitter.com/tailscale)) if you have any problems
and we’ll try to help.
Share
Author
Brad Fitzpatrick
Author
Brad Fitzpatrick
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