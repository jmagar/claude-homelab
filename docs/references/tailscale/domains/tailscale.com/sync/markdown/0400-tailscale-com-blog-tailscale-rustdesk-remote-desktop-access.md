Tailscale and RustDesk: Secure remote access to all your desktops
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|insightsJuly 10, 2025
# Tailscale and RustDesk: Secure remote access to all your desktops
Every computer has its preferred way it wants you to remotely access that desktop. I prefer none of them. Perhaps you feel the same.
Microsoft now packs its official remote desktop tool inside [the confusingly named app “Windows](https://www.theverge.com/news/627483/microsoft-remote-desktop-windows-app-replacement).” Macs have you flip switches [inside the “Sharing” settings](https://support.apple.com/en-gb/guide/remote-desktop/apde0dd523e/mac) to open access to third-party VNC applications. Linux is, well, Linux, so you can use whatever tool you can configure that agrees with your chosen desktop. Some remote desktop tools have decent mobile clients, and some do not.
You can use free and open-source applications, like the [TightVNC server](https://www.tightvnc.com/download.php) and its inexplicably monikered viewer/client, [Remote Ripple](https://remoteripple.com/download/). You can wiggle into the free plans of paid tools, or just pay for services like AnyDesk or TeamViewer. The free VNC tools make you figure out how to remotely connect to your devices. The paid apps do the hole-punching themselves, and you hope they can get through (and keep your data safe).
But you can do better than all that, in my humble opinion (though [Alex agrees](https://www.youtube.com/watch?v=27apZcZrwks)), with a combination of [Tailscale](http://login.tailscale.com/login) and RustDesk.
## [Better remote control with RustDesk](#better-remote-control-with-rustdesk)
[RustDesk](https://rustdesk.com/) is an open-source remote access tool. It has clients for Windows, Mac, Linux, iOS, Android, and, kind-of-sort-of, through a browser (more on that later on). It uses the latest streaming codecs to feel snappy, it keeps your data on your own devices, and it’s free for non-commercial use. It’s my favorite way to get into a computer and move the mouse around. But it can do a whole lot more, like:
* File transfers
* Remote restarting
* Viewing the system’s default camera
* Using text chats or voice calls when you’re helping others
* Taking screenshots and recordings
* Reversing the mouse wheel direction for your remote session (small, but important to me)
Why don’t more people use RustDesk? Part of it is the name recognition of the established players, like TeamViewer, AnyDesk, and GoToMyPC. But RustDesk also suggests [running your own two-part server](https://rustdesk.com/docs/en/self-host/), or self-hosting, for faster connections. [Self-hosting](https://tailscale.com/blog/guide-self-hosting-proxmox) is something we're keen on at Tailscale, and it would make plenty of sense for a tool with direct access to your computers. But hosting RustDesk is a bit more involved.
RustDesk clients use self-hosted servers to authenticate, monitor devices’ public IP addresses, do the “hole-punching” necessary for two computers to reach each other, and, if necessary, use those servers as a relay between the devices.
Setting up a RustDesk server (technically two servers) is not too hard, code-wise, if you’re [familiar with Docker](https://www.youtube.com/watch?v=YTjYXii4WzI). But you then need to copy a public key from that server and paste it into every client that wants to connect through it. Then you would need a minimum of four TCP and UDP sockets opened up on your router (six, if you want to try for a web interface).
Or you can use Tailscale to make it far simpler: *skip the servers and keys entirely*.
By changing one setting on each Tailscale-connected RustDesk client, you can have your desktops remotely available to one another, connecting directly, securely, and easily. Tailscale already does all the authentication, IP address tracking, hole-punching, and fallback relaying that a RustDesk server would do. No need to duplicate efforts.
Let’s walk through setting up RustDesk to make snappy and secure remote desktop connections through Tailscale.
## [Installing and configuring RustDesk](#installing-and-configuring-rustdesk)
This part is simple if you have direct access to all the computers you want to get into later. If not, you’ll have to find a way in by using a different VNC client, [Tailscale SSH](https://tailscale.com/kb/1216/tailscale-ssh-console), dragging out a keyboard, mouse, and monitor, or, in dire situations, walking your parents through installing an application over a video call.
Download and install [the latest version of RustDesk](https://github.com/rustdesk/rustdesk/releases/latest) on each computer for which you want remote desktops, whether viewing or hosting. Give it the permissions it requests to manage your screen and other system bits, then head into the Settings. The “Settings” are reached inside the three-dot menu next to the ID number on the left-hand side, as of this writing. Inside the “Security” section (click at the top of the section to unlock it), you need to enable one thing to let Tailscale work its magic: “Enable direct IP access,” under the “Security” sub-section.
By checking that box, RustDesk can connect one client directly to another, skipping any self-hosted or RustDesk-owned intermediary server. This would be far more difficult to pull off, especially outside your home network, without Tailscale. But have your computers on a Tailnet makes each of them feel “local,” with encrypted, authenticated connections between them, and definite IP addresses. Tailscale is making RustDesk work, [as one Tailscalar puts it](https://tailscale.com/blog/new-internet), “how you thought the Internet worked, before you learned how the Internet worked.”
While you are in the “Security” section, scroll up a bit to the “Password” section. Decide if you want to set a permanent password that always lets you into a remote desktop session. Otherwise, you’ll need to use the temporary password each RustDesk client shows on its window, which is likely not your goal.
## [Connecting to VNC (and much more) with RustDesk](#connecting-to-vnc-and-much-more-with-rustdesk)
There’s only one more step needed to connect one RustDesk viewer to a RustDesk desktop through Tailscale, and it’s grabbing an IP address.
RustDesk, by default, provides nine-digit IDs for each device, visible from inside the desktop client. That’s useful when you’re connecting to somebody else’s device to provide support, but for connecting directly to our own devices, we can use the IP address that Tailscale provides.
Get a device address from the Tailscale desktop client (in the Mac menu bar, or Windows task tray, for example), or head to [your Machines list in the Admin Console](https://login.tailscale.com/admin/machines). Pick a device and click to copy its numerical IP address (the one that starts with `100`, i.e. `100.11.222.333`).
Paste the Tailnet IP of the device you want to control into the “Control Remote Desktop” section of the RustDesk window. If you’ve enabled the setting for direct IP access, RustDesk should connect, then prompt you for the access password you set up. There it is—your remote desktop network, no subscription needed.
We understand the concern, but we've got it covered.
You might notice a little red shield with an “X” on it near the top of your RustDesk viewing client, reporting a “direct and unencrypted connection.” RustDesk doesn’t know that all the traffic going between two Tailscale devices is encrypted, but it is. Nobody but you, your devices, and those you are helping out will ever see your messy desktops.
Normally, if you are helping somebody else out, you can use RustDesk’s nine-digit ID number to connect. This uses RustDesk’s public, slower relays. There is a better way, if they happen to have Tailscale installed: have them [share their device (node) with you](https://tailscale.com/kb/1084/sharing), so you can directly connect to their Tailscale IP address.
## [What about connecting through a web browser?](#what-about-connecting-through-a-web-browser)
RustDesk does a whole lot of things right, but “clarity about web access” is not one of them. A web socket—a way to access RustDesk desktops when all the ports except the typical 80 and 443 are blocked—requires a RustDesk [subscription at about $20 per month or higher](https://rustdesk.com/pricing/?lang=en).
What about a web-based client, so you can get at a desktop from, say, [a Chromebook](https://tailscale.com/blog/tailscale-chromebook-taildrop-taildrive), or a computer on which you can’t install RustDesk? Also tricky. On their pricing page, RustDesk implies this is only available for plans costing $40/month or more. But RustDesk also offers a [“Preview” of a web client](https://rustdesk.com/web/) that anybody can use, with some catches:
* You can’t connect through your own server
* You have to use RustDesk’s 9-digit ID numbers and public servers, not IP addresses
* The web preview is, in this author’s experience, not always working
There are some ways around this, but they’re not simple. One is a certificate and proxy scheme, [detailed by RustDesk](https://rustdesk.com/docs/en/self-host/rustdesk-server-pro/faq/#set-up-https-for-web-console-manually), spanning eight complex steps and 25 commands and config files. One Reddit user detailed their deployment of RustDesk on a Virtual Private Server or self-hosted space using [a LinuxServer.io image](http://linuxserver.io) to get web browser access, layering another VNC layer on top of RustDesk itself.
So it’s not easy to get RustDesk *everywhere*, but it’s still a good multi-platform access tool. Tailscale makes it even easier to hook up, quickly and securely.
If you have your own remote desktop solution, made smoother with [Tailscale](https://login.tailscale.com/login), tell us about it on [Reddit](https://www.reddit.com/r/Tailscale/), [Bluesky](https://bsky.app/profile/tailscale.com), [Mastodon](https://hachyderm.io/@tailscale), or [LinkedIn](https://www.linkedin.com/company/tailscale/product/).
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