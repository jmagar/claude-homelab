Why the GL.iNet Beryl AX and Tailscale make for a great travel router
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|insightsSeptember 22, 2025
# Upgrade your travel kit with a tiny, Tailscale-friendly router
I’ll be on vacation when this post is published. It’s not a tropical, cultural, or adventure vacation, but a kind of remote staycation, in a big rented house, with fellow indoor enthusiasts. Instead of playing with technology for work, I’ll be playing with technology for fun. One of the tools (toys) I’ll be tinkering with is the [GL-MT-3000](https://www.gl-inet.com/products/gl-mt3000/) (a.k.a. the Beryl AX), a pocket-sized router that comes with [Tailscale](https://login.tailscale.com/login) built in.
The version of Tailscale [available on many of Gl.iNet’s routers](https://docs.gl-inet.com/router/en/4/interface_guide/tailscale/) is not built or maintained by Tailscale (and this post was not sponsored or approved by them). But it’s a handy tool for automatically having access to your other Tailscale-connected devices (your tailnet), whether or not you have Tailscale installed on all the devices connected to it. And it’s a good place to start if you’ve never experienced the benefits of a travel router before.
## [How Tailscale works on GL.iNet routers (and why it’s neat)](#how-tailscale-works-on-glinet-routers-and-why-its-neat)
Most of GL.iNet’s routers have [firmware based on OpenWRT](https://openwrt.org/toh/gl.inet/installation), an open-source router firmware project. OpenWRT got its start when Linksys based its code for its then-ubiquitous, blue-and-black WRT54G on open-source code, and was then compelled by licensing to release all of its modified code. It’s [a fun tale of unanticipated outcomes](https://tedium.co/2021/01/13/linksys-wrt54g-router-history/).
GL.iNet’s routers are pretty flexible, as a result. After community members modified their units to fold in Tailscale, GL.iNet itself started packing Tailscale into its travel-friendly routers. The GL.iNet Tailscale integration still has a “beta” flag on it as of this writing (and firmware version 1.8.4), but it has worked for quite a few Tailscalars who own this router.
What does Tailscale do for you on a travel router? With the right configuration, quite a few things:
* Any devices connected to the travel router can reach devices on a chosen tailnet, regardless of whether they have Tailscale installed
* Going the other way, tailnet devices can reach devices connected to the travel router (and the local network it’s on, if you want)
* All devices connected to the travel router can use one of your tailnet [exit nodes](<https://duckduckgo.com/?q=tailscale+exit+node&amp;ia=web#:~:text=Exit nodes (route all traffic) - Tailscale Docs>), if enabled
GL.iNet’s documentation outlines the process for [getting Tailscale running on their routers](https://docs.gl-inet.com/router/en/4/interface_guide/tailscale/) (Crosstalk Solutions offers [a video walkthrough](https://youtu.be/JQLXMNibLHs?si=imYQnsz7arXtfXVq)). A little clarification: “Allow Remote Access LAN” switch creates a subnet router for **devices connected to the travel router** (typically wirelessly, though also through the LAN port): you will have to approve the subnet on your [Tailscale’s web admin console](https://login.tailscale.com/admin/machines). “Allow Remote Access WAN” creates a subnet for all the devices on the same network through which the travel router is connecting, and also through its WAN port. The LAN subnet is the one you probably want, as it allows your trusted devices to access your tailnet through the router.
How useful these functions are depends on you and your tailnet. You can connect an e-book library like [Calibre](https://calibre-ebook.com/) with devices that cannot typically run Tailscale, like an e-ink reader (Kindle, Kobo, Boox Palma). Streaming media from home can be made available on devices that prevent installing apps like Tailscale for security reasons. And if you’re traveling somewhere and your streaming apps give you guff about not being at your “home location” or whatnot, an exit node can temporarily bring your device back home.
There are some limitations to consider. The Beryl AX I’m using is a tiny, relatively affordable device, and has a similarly modest processor and RAM onboard. GL.iNet rates its maximum speed while using WireGuard™ at [a maximum of 300 Mbps](https://www.gl-inet.com/products/gl-mt3000/#specs). Tailscale is [built on top of WireGuard](https://tailscale.com/kb/1035/wireguard)™, so that limitation applies.
The more things you have this little router do, the slower it is at pushing through bits. It’s likely fine for browsing and most streaming, but for intensive streams, or lots of users, you might be better off having some devices manage their own Tailscale connections through their apps.
Photo via GL.iNet## [The other fun stuff about travel routers](#the-other-fun-stuff-about-travel-routers)
You may already have Tailscale installed on all the devices you use while traveling. That’s great! Enjoy your peer-to-peer mesh VPN vacations. There are, however, quite a few other benefits to having a travel router, such that built-in Tailscale is just a nice bonus.
With a travel router like the Beryl AX, you can:
* Log in just once to hotel or campground Wi-Fi (the router will forward any log-in pages) and share it with everything else
* Run AdGuard Home (built into the admin settings) for all connected devices
* Share the signal from a tethered smartphone or mobile hotspot
* Set up a repeater for locations where the Wi-Fi doesn’t quite reach far enough
* Share or stream [USB-connected storage](https://docs.gl-inet.com/router/en/4/interface_guide/network_storage/) over SMB, WebDAV, or DLNA
* Cast media to a Fire TV Stick or Chromecast that’s hard to reach on hotel Wi-Fi
* Use it anywhere you can lug a decent (5V/3A) portable power bank and USB-C cable.
It’s not something that’s necessary for every trip. But for trips with more than one person, or a lot of little network annoyances in the way, it’s a neat tool to have in your kit. For me, it’s a way to stream my music collection during board game sessions, fix up a vacation house's spotty coverage, and stay connected to the fiddly little things I enjoy, while I’m otherwise disconnected from larger obligations.
## [Bonus for the brave: Make the router switch toggle your exit node](#bonus-for-the-brave-make-the-router-switch-toggle-your-exit-node)
As mentioned, a handful of Tailscalars have already set up GL.iNet travel routers with Tailscale. One of them, Mike O’Driscoll, arrived pretty quickly at the same thought I had. There is a handy, configurable switch on the side of the Beryl AX. Why can’t that switch turn your Tailscale exit node on and off?
By default, the router’s own settings (System \> Toggle Button Settings) let you use that switch as a toggle for *almost* anything: repeater mode, main/guest Wi-Fi networks, a VPN client, Tor, AdGuard Home, or the LED on the front of the device. It made more sense to Mike, and me, as a switch for putting all your traffic back through a trusted location. So Mike modified [a script found inside the GL.iNet forums](https://forum.gl-inet.com/t/feature-req-wifi-on-off-with-side-switch/2896/16) to make a Tailscale toggle.
Before you jump in, the modified script requires comfort with doing a few things:
* [SSH into your travel router](https://docs.gl-inet.com/router/en/3/tutorials/ssh/)
* Using command-line tools to modify a system file
* Being okay with the router settings no longer showing your exit node status
* A general sense that if things go wrong, or an update breaks it, you might have to fix the file or reset the router
If that sounds okay with you, [check out this script](https://github.com/tailscale-dev/glinet-exit-node-switch) and enjoy your on-demand traffic routing.
Do you pack a travel router and use it with [Tailscale](https://login.tailscale.com/login)? Politely brag about your setup, or just offer up some tips, on [Reddit](https://www.reddit.com/r/Tailscale/), [Discord](https://discord.com/invite/tailscale), [Bluesky](https://bsky.app/profile/tailscale.com), [Mastodon](https://hachyderm.io/@tailscale), or [LinkedIn](https://www.linkedin.com/company/tailscale/product/).
Share
Author
Kevin Purdy
Author
Kevin Purdy
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