Tailscale + BlueBubbles makes an iMessage on Windows and Android less complex
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|insightsJanuary 22, 2026
# Tailscale + BlueBubbles puts iMessage on Windows, Android, or anywhere
This post is part of an occasional series highlighting applications and services that work quite well with ("+") Tailscale.
It is well documented that [Apple executives understand iMessage's effectiveness](https://www.wired.com/story/4-internal-apple-emails-helped-doj-build-antitrust-case/) as a lock-in tool. The weird [cultural stigma of “green bubbles](https://arstechnica.com/tech-policy/2024/03/apples-green-bubbles-targeted-by-doj-in-lawsuit-over-iphone-monopoly/),” the convenient multi-device access, the end-to-end encryption—it’s hard to beat, and [even harder to work around](https://arstechnica.com/gadgets/2023/12/apple-partly-halts-beepers-imessage-app-again-suggesting-a-long-fight-ahead/). You cannot get iMessage on Android, Windows, or Linux—unless you’re up for running [BlueBubbles](https://bluebubbles.app/) on a Mac.
BlueBubbles is an open-source Mac server app that lets you read, send, and get notified about iMessage chats (and SMS texts, if you’re an iPhone user) on basically every major computing device. BlueBubbles is the main reason I’ve got a Mac Mini bolted to the underside of my desk. I’ve used the BlueBubbles client to trade messages on a Linux laptop, a Chromebook, my Windows gaming desktop, and through a webapp. BlueBubbles provides a nearly complete iMessage experience, including read/unread status, “tapbacks” and emoji reactions, group chat features, and message editing. And, like the name implies, all your bubbles are "blue."
The author, catching up again with an iPhone-using coworker, on an Android phone.
Setting up BlueBubbles requires a Mac you can easily connect to, at a known IP address, with an accessible port. That’s a bit intimidating, even before you consider it’s your personal messages you now have to secure. We at [Tailscale](https://login.tailscale.com/start/?utm_source=blog&amp;utm_medium=content&amp;utm_campaign=bluebubbles) think we provide a great solution for this. But the thing is? [Others](<https://www.reddit.com/r/BlueBubbles/s/Buvf3Zg2zv https:/www.reddit.com/r/BlueBubbles/s/Buvf3Zg2zv>), including [BlueBubbles itself](https://docs.bluebubbles.app/server/advanced/byo-proxy-service-guides/tailscale-vpn-setup), tend to agree.
“We always recommend users use Tailscale if they have the technical know-how to set it up (even though it's almost too easy to not do),” wrote Zach, one of BlueBubbles’ [main developers](https://docs.bluebubbles.app/client), in an email exchange.
## [What Tailscale replaces in a BlueBubbles setup](#what-tailscale-replaces-in-a-bluebubbles-setup)
BlueBubbles is not something you can set up on a lunch break (this is not a challenge). The initial setup is a notable lift—providing extensive system permissions, disabling System Integrity Protection, choosing a notification scheme—before you get to the connection part. Luckily, connections are where Tailscale shines.
Here are the upgrades Tailscale brings to the BlueBubbles experience:
* A stable IP address or URL, instead of setting up dynamic DNS
* No open ports or port-forwarding on your router
* Fully encrypted traffic and optional HTTPS connections, rather than setting up certificates, tunnels, and proxies
* Setting up [a second BlueBubbles user](https://docs.bluebubbles.app/server/basic-guides/multiple-users-on-the-same-mac) on the same Mac made easier with [machine sharing](https://tailscale.com/kb/1084/sharing)## [Three ways to use Tailscale with BlueBubbles](#three-ways-to-use-tailscale-with-bluebubbles)
BlueBubbles’ [own guide to using Tailscale](https://docs.bluebubbles.app/server/advanced/byo-proxy-service-guides/tailscale-vpn-setup) suggests using Tailscale’s [Funnel](https://tailscale.com/kb/1223/funnel), which creates a publicly accessible URL with an encryption certificate (HTTPS). It works, but it’s the least secure route. You can run BlueBubbles through Tailscale a few ways, which I’ll call “Vanilla,” “Serve,” and “Funnel” setups:
* **Vanilla: **Best for BlueBubbles on desktops or laptops running Tailscale
* **Serve: **Like Vanilla, but with a HTTPS URL, useful for webapp access[[^1](/blog/bluebubbles-tailscale-imessage-android-pc-no-port-forwarding#fn1)]
* **Funnel: **If you need webapp access from any browser or devices running BlueBubbles, but not Tailscale.
You don’t have to make a firm choice between setups. All three “versions” of BlueBubbles-via-Tailscale are roughly one click and one terminal command apart, and easy to roll back. Let’s get into it.
## [Setting up BlueBubbles with Tailscale](#setting-up-bluebubbles-with-tailscale)
This is not a full BlueBubbles setup guide. It is the gist of setting up BlueBubbles, derived from [the standard instructions](https://bluebubbles.app/install/), with a note from developer Zach, along with a guide to making it reliably accessible anywhere with Tailscale.
The thrust of Zach’s note is that the “Notifications & Firebase” screen is far more optional than it seems. To get notifications of new messages on Android and Chromebooks, you can alternatively [set up ntfy](https://docs.bluebubbles.app/client/usage-guides/using-unified-push-for-notifications), or keep your BlueBubbles app [running as a foreground service in Android](https://docs.bluebubbles.app/blog/deimos-release#fcm-less-notifications) (desktop clients on Windows and Linux keep an active background connection and don’t need separate notifications).
The other thing a Firebase cloud server does is send out URL changes to your BlueBubbles clients; Tailscale’s dedicated IP addresses and magicDNS names make this unnecessary.
Let’s run it down.
1. Download and install [the latest DMG of the BlueBubbles server](https://github.com/BlueBubblesApp/bluebubbles-server/releases/latest) on the Mac you plan to keep running to serve up iMessage
2. Move through the installation, granting the permissions BlueBubbles requests.
3. Set up, or skip, the Google Firebase creation step (see above)
4. If you haven’t already, [install Tailscale on the message-serving Mac](https://tailscale.com/kb/1016/install-mac). The [standalone variant](https://pkgs.tailscale.com/stable/#macos) is recommended, as it allows for easier [command-line access](https://tailscale.com/kb/1080/cli?tab=macos).
5. Make Tailscale’s command-line interface (CLI) far easier to access by running the `alias` command once on your Mac terminal, as [detailed in our docs](https://tailscale.com/kb/1080/cli?tab=macos).
6. Install the BlueBubbles client (and ntfy, if needed) on devices needing iMessage access
If you’re going the “Vanilla” route (all devices use Tailscale), the next steps are simple.
1. Get the Tailscale IP address (`100.xxx.yyy.zzz`) for this Mac by running `tailscale status` on any device connected to your tailnet, or by looking in your [web admin console](https://login.tailscale.com/admin/machines).
2. On any BlueBubbles client you use, during setup or in the settings, enter your (http) Tailscale IP address and port 1234, like so: `http://100.xxx.yyy.zzz:1234`
Before digging further into the “Serve” or “Funnel” setups, I’d recommend checking if you can connect to your BlueBubbles server from a client device.
For the “Serve” version, granting webapp access to Tailscale-connected clients, there are a few more steps.
1. Enable HTTPS certificates in your [Tailscale DNS settings](https://login.tailscale.com/admin/dns)
2. On the Mac running BlueBubbles, open the command line and run: `tailscale serve --bg --https=443 1234` (port 443 is the default, but 8080, 100000, or others can work)
3. Note the URL sent back, like [`https://mac.tailnet-name.ts.net:443`](https://mac.tailnet-name.ts.net:443)
4. Use that full URL (https and port included) to set up the BlueBubbles server on Mac (under **Settings \> Proxy setup \> Dynamic DNS / Custom URL**) and your BlueBubbles clients
The “Funnel” setup, which lets any computer or the webapp access your BlueBubbles server with a password (please use a strong one, unused elsewhere), is fairly similar:
1. Ensure [HTTPS certificates](https://login.tailscale.com/admin/dns), [MagicDNS](https://tailscale.com/kb/1081/magicdns), and [Funnel](https://tailscale.com/kb/1223/funnel#funnel-node-attribute) are enabled on your tailnet
2. On the Mac running BlueBubbles, run: `tailscale funnel --bg --https=443 1234`, substituting the 443 port if needed
3. Note the URL provided ([https://mac.tailnet-name.ts.net:443](https://mac.tailnet-name.ts.net:443)), then use it in both BlueBubbles server settings and your clients.## [A few tips on running a BlueBubbles server](#a-few-tips-on-running-a-bluebubbles-server)
Now that you’ve made it possible to reach your Mac full of iMessages, you’ll want to keep the Mac always running and easy to reach.
If it’s already in use as a desktop, with a keyboard, mouse, and monitor attached, set it so it doesn’t go to sleep: head to **System Settings \> Energy/Battery \> Options **(small button at bottom-right), and select “Prevent automatic sleeping when the display is off.” Also, look for **Start up automatically after a power failure **in that section, and if available, enable it.
If you’re looking to run your Mac (especially a Mini) “headless,” with no monitor attached, we’d recommend adding a few more steps:
* In BlueBubbles’ settings, under **Features**, look for **Auto Start Method** and choose **Launch Agent (Crash Persistent)**
* Search for “Remote Management” in the Mac's System Settings and enable **Remote Management **(for remote screen control) and **Remote Login** (for SSH)**.**
* If you’re okay with turning off FileVault (disk encryption), you can disable it and enable automatic login (**System Settings \> Users & Groups \> Automatically log in as …**)
* Consider using [the RustDesk/Tailscale combo](https://tailscale.com/blog/tailscale-rustdesk-remote-desktop-access) for remote screen access
* Note that, with another Tailscale device serving as a [subnet router](https://tailscale.com/kb/1019/subnets) in your home, you can now [unlock a Mac over the command line](https://www.youtube.com/watch?v=833pTn_3HYI), even after a power outage.BlueBubbles, handling iMessage in one of its least native environments: a Pop!\_OS desktop.## [Your iMessages, encrypted, wherever you want](#your-imessages-encrypted-wherever-you-want)
Opening up iMessage to all your devices certainly isn’t for everyone. But for those willing to take on the task, using Tailscale should remove some complicated layers. It takes a popular encrypted chat system and keeps its messages encrypted, its helpful Mac server protected, and you in touch from whatever you’ve got with you.
Tell us how this project worked for you, or share your own lock-in-defying Tailscale projects, on [Reddit](https://www.reddit.com/r/Tailscale/), [Discord](https://discord.com/invite/tailscale), [Bluesky](https://bsky.app/profile/tailscale.com), [Mastodon](https://hachyderm.io/@tailscale), or [LinkedIn](https://www.linkedin.com/company/tailscale/product/).
[1]: About the [BlueBubbles webapp](https://bluebubbles.app/web/): It works as of this writing, but Zach, a BlueBubbles developer, notes that it has not received an update “in some time,” and is “essentially unsupported.” It’s due for an overhaul at some point, but there is no timeline set for it just yet. So if you need it, it’s around, but Zach suggests most people and devices (even Chromebooks) should stick with dedicated apps.[[Back ⤴︎](#backfrom1)]
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