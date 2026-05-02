The Tailscale node you mail to your parents
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|insightsNovember 04, 2025
# Why you should mail your parents a Tailscale node
You can install [Tailscale](https://login.tailscale.com/start) across a lot of platforms. One you may not have considered: the mailbox.
Or the stoop, the package locker, or wherever your friends and family get their packages. Tailscale can run on tiny devices, like a [Raspberry Pi](https://www.youtube.com/watch?v=dneNjDu4HKU) or [Apple TV](https://www.youtube.com/watch?v=hYd5etBpsO0), that fit in small boxes. Once plugged in, a pre-loaded Tailscale device can help you troubleshoot devices back home, provide an exit node for VPN purposes, and give you an off-site backup location, among other neat tricks.
Some Tailscale fans have used remote Tailscale gadgets for even more important things, like helping and monitoring family members diagnosed with dementia, or connecting with parents living inside restrictive national firewalls.
If your parents (or aunt, or friends, or whomever) are good with installing Tailscale on their computers, you might get by with the software-only route of [sharing devices, or inviting them as users](https://tailscale.com/kb/1388/inviting-vs-sharing#inviting-a-user). But most people do not have an always-on computer running at home. And if you want to use Tailscale's [subnet router](https://tailscale.com/kb/1019/subnets) feature to reach remote network devices, like routers and printers, that's only available on Linux, Apple TV, Android TV, and our open-source Mac client.
Plugging in an always-on little Tailscale box lets you teleport into your LAN away from home, instantly and securely. Teleport your network presence, that is; we do not yet have the human-body-moving equivalent available for the holidays.
Let's set up some Tailscale care packages and send them out into the world.
## [Choosing your Tailscale Care Package Box](#choosing-your-tailscale-care-package-box)
There are two common hardware options for sending out a low-power, always-on Tailscale device:
* A small computer, like a Raspberry Pi [4B](https://www.raspberrypi.com/products/raspberry-pi-4-model-b/) or [5](https://www.raspberrypi.com/products/raspberry-pi-5/), or a "[thin client](https://arstechnica.com/gadgets/2022/11/used-thin-client-pcs-are-an-unsexy-readily-available-raspberry-pi-alternative/)", running a [supported Linux distribution](https://tailscale.com/kb/1031/install-linux).
* An Apple TV or Android TV box.
What's the difference?
* A tiny Linux computer is versatile, and can be run almost entirely from a remote SSH command line, though it requires more setup.
* An Apple TV is fairly simple to get running, and can provide an exit node and subnet router, but cannot be accessed by SSH or VNC remotely.
* An Android TV is something in the middle, being a bit more involved than an Apple TV, and offering some remote access, but not as robust as a Linux computer.
Tailscalars have set up Apple TVs that are running flawlessly after months of remote duty, and Android TV exit node makers have [reported long-term stability](https://www.reddit.com/r/Tailscale/comments/1nypqwm/comment/nhwgvgk/). Just plan to occasionally hook that TV box up to an actual TV or monitor when you visit home, to apply system updates and keep things secure. (Linux devices can be upgraded over an SSH connection, [set to auto-update](https://tailscale.com/kb/1067/update?tab=linux#enable-auto-updates-on-devices), or updated with a single click from the Tailscale admin console's Machines page).
Whichever route you go, we recommend you send out the device with an ethernet cable and a wall (mains) power plug. You can run your remote node over Wi-Fi, but it requires more setup, and introduces a whole other class of potential troubleshooting.
### [Raspberry Pi (or other Linux system)](#raspberry-pi-or-other-linux-system)
If you're working with the trusty Raspberry Pi, we have a complete YouTube guide to [setting up a Raspberry Pi with Tailscale](https://www.youtube.com/watch?v=dneNjDu4HKU). That guide sets up the Pi with everything you need to start: Tailscale-based SSH access, an exit node, and a subnet router. The other bits, like the demo app and Docker setup, are optional (though rather neat, for your own purposes).
(*Edit, Jan. 7, 2026: There is a very detailed, updated, and helpful guide to this exact setup, [a Tailscale exit node on a Raspberry Pi](https://github.com/johnnyfivepi/tailscale-on-raspberry-pi), posted to GitHub by johnnyfivepi.)*
If you're using a computer other than a Raspberry Pi that runs Linux, it's a similar process (plus the work to get Linux running on that device). While you have the device in your own home, with a monitor, keyboard, and mouse, you should:
* [Install Tailscale](https://tailscale.com/kb/1031/install-linux) and add the Pi to your Tailscale account (tailnet)
* Set up [Tailscale SSH access](https://tailscale.com/kb/1193/tailscale-ssh)
* Set up the device as an [exit node](https://tailscale.com/kb/1103/exit-nodes) (explained [by Alex on YouTube](https://www.youtube.com/watch?v=Ad7D2pkFNdA)) and authorize it in the admin panel
* Prepare the device to be a [subnet router](https://tailscale.com/kb/1019/subnets) and ensure [IP forwarding is enabled](https://tailscale.com/kb/1019/subnets#enable-ip-forwarding)
The subnet router feature, which allows you to access other devices on the far-away network, can be fully set up once the device is plugged in and accessible at the destination. Once it is connected, see what IP address it has been given (visible in your Tailscale [admin console](https://login.tailscale.com/admin/machines)), then [advertise the routes](https://tailscale.com/kb/1019/subnets#advertise-subnet-routes) and [enable subnets from the admin console](https://tailscale.com/kb/1019/subnets#enable-subnet-routes-from-the-admin-console).
### [Apple TV](#apple-tv)
Setting up an [Apple TV with Tailscale](https://www.youtube.com/watch?v=hYd5etBpsO0) is just a few clicks (after agreeing to dozens of Apple's permission and EULAs setting it up):
* Download Tailscale from the App Store
* [Install the Tailscale app](https://tailscale.com/kb/1280/appletv) and give it the permissions it needs, including VPN addition
* Authorize the Apple TV onto your tailnet
* In the Tailscale Apple TV app, select the *Exit Node* section and choose **Run as Exit Node**.
* In the Subnet router section of the Apple TV app, select **Advertise New Route**, then (once connected remotely) configure it in your admin console.
* Make sure it is [configured as a home hub](https://tailscale.com/kb/1280/appletv#configure-apple-tv-as-a-home-hub), so that it does not fall asleep and drop your Tailscale connection.
One important note about a remote Apple TV node: **do not run remote network speed tests on it**. Using too much of an Apple TV's resources, like during an [Ookla speed test](https://www.speedtest.net/), can cause the unit to [kill the network extension that Tailscale relies on](https://github.com/tailscale/tailscale/issues/16125#issuecomment-2932830014) for a persistent VPN connection. There's no defined limit; different generations of Apple TV have different hardware. Most users are not going to encounter this issue during normal connections, or even streaming, but it's worth looking out for.
### [Android TV](#android-tv)
The steps for setting up an Android TV device as a remote Tailscale node are essentially the same as with setting up any Android device:
* [Install Tailscale](https://tailscale.com/kb/1079/install-android), either from the Play Store or Tailscale’s APK builds
* Authorize the device onto your tailnet
* [Enable the device as an exit node](https://tailscale.com/kb/1103/exit-nodes?tab=android#advertise-a-device-as-an-exit-node)
* Prepare the device to be a [subnet router](https://tailscale.com/kb/1019/subnets?tab=android#connect-to-tailscale-as-a-subnet-router)
Once the Android device is set up with Tailscale, head into **Settings \> Network & internet \> Others**, click the gear icon on Tailscale, and enable **Always-on VPN.** This ensures that Tailscale starts when the device boots up, and you can reach the device as an exit node or subnet router.
As with an Apple TV, you will not have remote SSH access to the Android TV device (unless you mess about with jailbreaking and developer mode—do tell us how you did that, if you do!). You *should* be able to finagle VNC access that persists across reboots.
I had success setting up [droidVNC-NG server](https://play.google.com/store/apps/details?id=net.christianbeier.droidvnc_ng&amp;hl=en-US), granting it the permissions it needed, and toggling on **Start on Boot.** After trying out a few VNC clients, I was able to connect to droidVNC-NG after a fresh reboot (with [TigerVNC](https://tigervnc.org/)) through the Android's Tailscale IP address. RustDesk, a [Tailscale-friendly remote control tool](https://tailscale.com/blog/tailscale-rustdesk-remote-desktop-access), requires someone with screen access to approve a prompt for full-screen access before it will allow a remote connection.
## [Testing your node-in-a-box before sending](#testing-your-node-in-a-box-before-sending)
With Tailscale set up as an exit node and/or subnet router on the device, you'll want to test that it works as expected. The easiest way for most people is to use their phone's cellular connection (or a computer tethered to that phone):
* Plug the box you're sending out into your home network.
* Switch off Wi-Fi on your mobile device, so that it is connected by cellular signal.
* Connect to Tailscale through the iOS or Android app, then check if your remote device is offered as an exit node.
* Enable the device as an exit node, then browse to a few websites on your phone to ensure you can reach them.
* If you're setting up a subnet router, try to reach devices that do not run Tailscale on your network through your phone—your router, your printer, or a computer with remote access enabled.
* For Raspberry Pi and Linux devices, from another device, access your [Tailscale admin console](https://login.tailscale.com/admin/machines) and click the **SSH** button from your remote device's row, ensuring a browser window opens with a terminal prompt, and that you can log in.
If you can’t get your remote device plugged into a router by ethernet, you'll need to set up the device with the remote Wi-Fi credentials. During the same step of using the [Raspberry Pi Imager](https://www.raspberrypi.com/documentation/computers/getting-started.html#raspberry-pi-imager) where you would enable SSH and VNC access—"OS customisation settings," in the device's native British spelling—you can add a Wi-Fi SSID (network name) and password.
## [Sending and accessing your node](#sending-and-accessing-your-node)
The author's Raspberry Pi 3B, placed at his childhood home, after deciding it had more use there than serving as a rarely used emulation console.
Send the device to its intended destination. Pro tip: Most Raspberry Pis in cases, Apple TV units, and Android TV devices fit inside a [USPS Priority Mail Flat Rate Small Box](https://store.usps.com/store/product/priority-mail-flat-rate-small-box-P_SMALL_FRB). There might even be room leftover for a couple of treats in there, to thank them for accommodating your nerdery. Alternately, you can bring it with you when you visit, which some interested parties say you should do more often.
After it arrives, walk your friend or family member through hooking it up. Most routers provided by home internet providers have a few ports, labeled with numbers (like 1-4); just ensure they don't unplug their cable/fiber modem or other connection to plug in your device. If you're relying on Wi-Fi, you need them to plug it in somewhere reasonably close to the Wi-Fi router. You can [check the signal strength on a Raspberry Pi](https://linuxconfig.org/how-to-check-wifi-signal-strength-on-raspberry-pi) from the terminal or a remote desktop. If you sent an Apple or Android TV unit, you might have to try a few spots and test.
If it's set up correctly, you should see the device online (with a green dot) in your Tailscale admin console. You should be able to access your remote network's devices over a subnet router, or see that location when you select it as an exit node and visit an IP-finding site like [WhatIsMyIP](https://www.whatismyip.com/).
## [Where to go from here (and great uses)](#where-to-go-from-here-and-great-uses)
Once your device is running on their local network, you can jump into their network to diagnose network issues, provide remote desktop support, and test connections and services from their location with your exit node, among other things.
You could use an uptime monitoring tool like [Uptime Kuma](https://github.com/louislam/uptime-kuma) to monitor your exit node's IP address and ensure everything's okay back home. You could play co-op games that work better over a LAN connection with nieces and nephews.
You could also use this device to nudge your friends or family into trying out Tailscale. You’ve already given them a convenient VPN for when they’re away from home; attaching a shared USB drive to your device might [set up some remote file-sharing](https://www.reddit.com/r/Tailscale/comments/17ut4wr/remote_file_server_on_raspberry_pi_and_tailscale/). Selfishly, you might stash some important files or documents remotely (and perhaps encrypted), in case of hardware or other disaster.
Tailscale enthusiasts have found these devices quite useful. At the Tailscale subreddit, user [caolle shared their story](https://www.reddit.com/r/Tailscale/comments/1nhr30b/comment/nedjqhn/) of using Tailscale to help with caregiving:
> My mom suffers from dementia and is in a home. My sister handles most of the burden of dealing with the home and Mom&#x27;s finances and the piles of paperwork.
> I&#x27;m a couple of hours away across two states. The best way I can help is use my technical expertise to make the experience a bit less stressful (and) easier to deal with.
> I built a
[> nas-pi
](https://www.pcmag.com/how-to/how-to-turn-a-raspberry-pi-into-a-nas-for-whole-home-file-sharing)> with a (Raspberry Pi 5) and the
[> Radxa Penta SATA HAT
](https://radxa.com/products/accessories/penta-sata-hat/)> . It will host
[> Paperless-ngx
](https://docs.paperless-ngx.com/)> and a few other things. Tailscale will be the glue between my location and hers allowing for backups from both locations. I&#x27;m leaning towards using
[> Taildrive
](https://tailscale.com/kb/1369/taildrive?tab=linux)> to facilitate everything. But will see.
User zulcom shared another [uncommon but important use](https://www.reddit.com/r/Tailscale/comments/1nhr30b/comment/nefwjx3/):
> My relatives live in a country which recently blocked even Whatsapp, so [I set up] a self hosted exit node on my home server in another country. So Tailscale not only maintains our chats and video calls, [but] access to state-independent media which is much appreciated to have these days.
Have you set up a back-home device powered by [Tailscale](https://login.tailscale.com/login)? Share what you're using, and how you set it up, on [Reddit](https://www.reddit.com/r/Tailscale/), [Discord](https://discord.com/invite/tailscale), [Bluesky](https://bsky.app/profile/tailscale.com), [Mastodon](https://hachyderm.io/@tailscale), or [LinkedIn](https://www.linkedin.com/company/tailscale/product/).
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