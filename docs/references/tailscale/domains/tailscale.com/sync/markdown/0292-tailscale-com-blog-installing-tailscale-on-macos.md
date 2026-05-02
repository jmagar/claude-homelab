Video: Installing Tailscale on macOS
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|insightsJanuary 08, 2025
# Installing Tailscale on macOS
If you’re installing Tailscale on macOS, the best way to do it is through what we call the “standalone variant”. This is the version that comes up on [the “Download Tailscale” page](https://tailscale.com/download/mac), and the one available on our official [package server](https://pkgs.tailscale.com/stable/#macos).
But the standalone variant is just one of three official versions available for macOS. In today’s post—and the accompanying video—we’ll discuss all three options, and when you may want to wander off the beaten path. As always, you can find the most up-to-date information on this topic in our [documentation on Tailscale’s macOS variants](https://tailscale.com/kb/1065/macos-variants).
The standalone variant offers the best combination of security and usability for most users. It takes advantage of features introduced in macOS 10.15, namely support for system extension-based VPN implementations. These system extensions provide a more secure alternative to the older legacy kernel extensions technology. This enhanced security is due to system extensions operating within a sandbox, ensuring that Tailscale remains isolated from the macOS kernel. These modern extensions are more secure than their predecessors, and they can also be distributed outside the Mac App Store.
Which brings us to our second Tailscale version for macOS: the Mac App Store variant. Unlike the standalone variant, this one requires you to sign in with your Apple Account (formerly Apple ID). Also, due to the different sandboxing techniques used, it cannot detect third-party tools that interfere with VPN tunnels and notify you if conflicts are detected.
## The `tailscaled` variant
There’s a third, lesser-known way to run Tailscale on macOS. This method doesn’t include a graphical user interface (GUI) and must be managed entirely from the command line, making it unsuitable for most users. However, experienced macOS administrators may find this method useful as it allows Tailscale to run without requiring a specific user to log in—thanks to the unique way macOS services are tied to user accounts. This variant receives less attention than our other offerings and we don’t recommend it for production use.
## Which version should you use?
We recommend starting with the standalone variant of Tailscale unless you have a solid reason. For instance, you might need to rely on the Mac App Store for installation and updates in environments with strict device management policies, such as workplaces.
It’s crucial to avoid installing both the Mac App Store variant and the standalone variant on the same machine. Having both versions installed simultaneously can prevent the Tailscale extension from launching correctly. To safely switch between macOS variants, first delete the currently installed Tailscale app, empty the trash, and reboot your Mac before installing a different variant.
Our documentation includes a [comparison table](https://tailscale.com/kb/1065/macos-variants#comparison-table) that outlines the major differences in functionality between these three variants.
If you’re interested in bringing Tailscale to work, take a moment to fill out a [sales contact form](https://tailscale.com/contact/sales)—a member of our team will be happy to assist you.
Share
Author
Alex Kretzschmar
Author
Alex Kretzschmar
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