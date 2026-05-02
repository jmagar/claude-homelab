Tailscale's web-based SSH is the easiest way to log into weird little computers
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|insightsJuly 30, 2025
# The wonderfully lazy way to SSH into your computers
My favorite little feature of Tailscale for personal users is the one that helps me avoid feeling like a dummy. It is a subtly powerful thing, lacking the flash of a [Taildrop](https://tailscale.com/kb/1106/taildrop?tab=android) transfer or [Taildrive](https://tailscale.com/kb/1369/taildrive?tab=linux) hack, or the broad benefit of "All my stuff is securely connected.” But it is still worth telling people about, because nobody enjoys staring at a command line and feeling dumb.
That favorite little thing of mine is Tailscale's [web-based SSH tool](https://tailscale.com/kb/1216/tailscale-ssh-console) in the [admin console](https://login.tailscale.com/admin/machines). Since putting my devices onto a tailnet, I have rediscovered my enthusiasm for Raspberry Pis, home servers, Network Attached Storage (NAS), and other weird little always-on computers. Using a terminal and SSH to control them can be intimidating, but Tailscale makes it less so. And Tailscale SSH might just save you from a few frantic searches for HDMI cables, keyboards, and mice.
## [**Why do you need SSH for your little computers?**](#why-do-you-need-ssh-for-your-little-computers)
SSH is an acronym (with some weird letter choices) for the [Secure Shell Protocol](https://en.wikipedia.org/wiki/Secure_Shell), a way of securely logging into a computer that is somewhere else, whether across your network or across the globe. Having SSH access to your devices allows you to install and configure applications, shut down or restart the hardware, and do the kinds of things that neat little computer projects require.
The tricky part, for most people, is that first "S" in SSH, "Secure." To authenticate prevent your username, password, and computer details from leaking to the wider internet, [SSH uses pairs of keys for identity and encrypting the connection](https://www.digitalocean.com/community/tutorials/understanding-the-ssh-encryption-and-connection-process). Key management isn't too difficult on a small personal network, but an SSH client can sometimes freak out (a technical term) if a host's IP address or other details change.
Even when SSH works as it should, it requires things you might not always have, or remember, especially for getting into a Raspberry Pi you set up months ago. You need:
* A terminal app, or an SSH client, like [PuTTY for Windows](https://www.putty.org/), [Termius](https://termius.com/download/ios) on iOS, [JuiceSSH](https://juicessh.com/) on Android.
* An address, or hostname, where the host (remote) computer resides, such as `192.168.0.45`, or a public IP address with a specific port open.
* The right username on the remote system
* The password for that username
You might not have access to a terminal on some systems. If you can't remember your gadget's IP address or hostname while you are on your home network, you can log into your router’s admin page. Away from home? You’re typically dealing with [dynamic DNS](https://gist.github.com/taichikuji/6f4183c0af1f4a29e345b60910666468) and port forwarding, which is both tricky and a potential security hole, or [reverse SSH tunnelling](https://www.howtogeek.com/428413/what-is-reverse-ssh-tunneling-and-how-to-use-it/), which is as fun as it sounds. As for the username and password, even if you have them, typing or pasting them for each connection is a time tax.
Cue the [2000s cable commercial](https://archive.org/details/as-seen-on-tv-infomercials-from-the-2000s-720p): "There's *got* to be a better way!" Enter: Tailscale SSH, a browser-based, key-and-password-handling alternative to all that fuss. Everything, except remembering your username, is handled when you use Tailscale to log in via SSH to your Raspberry Pi, your old laptop, your headless Mac Mini, or whatever you are running without a screen.
"SSH" doesn't show up for every tailnet device—only the cool ones.
Here's what logging into a Tailscale-connected device over SSH requires:
* Logging into your [Tailscale web admin console](https://login.tailscale.com/admin/machines)
* Clicking the "SSH" button when hovering over the right device
* Choosing a username, if it's not the default `root`
* Authenticating your Tailscale identity one more time, for good measure
That's it—that's the process, at least the first time. If you have recently logged into Tailscale and connected to the device, you can skip the last two steps. You will be logged in, securely, with a command prompt, ready to type (or paste) commands into your device.
## [**How SSH in a browser works**](#how-ssh-in-a-browser-works)
Our documentation on [the Tailscale SSH Console](https://tailscale.com/kb/1216/tailscale-ssh-console), or browser-based SSH, details how and why this works at length. The really short version is that, because your tailnet already authenticates who you are and uses encrypted connections, Tailscale can run its own SSH session.
The medium-length explanation is:
* Tailscale loads a stack of software, including an SSH client and networking tools, into a pop-out browser window
* Tailscale creates an ephemeral authentication key and node on your tailnet for that tiny browser computer, one that disappears when the session is over
* An SSH session, end-to-end encrypted and unable to be seen or read by Tailscale, is initiated by that ephemeral node, over [Tailscale's TCP (DERP) relays](https://tailscale.com/kb/1232/derp-servers)
* The target device in your tailnet, on which Tailscale is watching for tailnet traffic on the SSH port (22), routes the session to Tailscale's own SSH server
All that, so that we can get onto our machines with a couple clicks. But it's worth it!
You want to click that "SSH" button quickly, but remember to change the username. Let's not make ephemeral computers for nothing!
After configuring [Tailscale SSH](https://tailscale.com/kb/1193/tailscale-ssh#configure-tailscale-ssh) on my Mac and Linux devices—with "Linux" covering all kinds of other devices, including most NAS and single-board (Pi) gear—future connections are trivial. SSH-ing into the Raspberry Pi I have running [Pi-hole](https://pi-hole.net/) and a few other services used to require a battle plan. Now it is just opening my [Tailscale admin page](https://login.tailscale.com/admin/machines) and clicking a button on the `pihole` device.
Note that if you're trying to access a Mac, you have to be running [the open-source version of Tailscale's Mac client](https://github.com/tailscale/tailscale/wiki/Tailscaled-on-macOS) for it to work with Tailscale SSH, for [various Mac-ish reasons](https://tailscale.com/kb/1016/install-mac). And Synology and QNAP operating systems cannot run a Tailscale SSH server.
## [**You deserve enterprise SSH for your goofy gear**](#you-deserve-enterprise-ssh-for-your-goofy-gear)
[Tailscale SSH](https://tailscale.com/kb/1193/tailscale-ssh#) does a lot more than let tinkerers get into their quirky little boxes. Organizations with lots of developers need lots of SSH keys, and sometimes need to [record SSH sessions](https://tailscale.com/kb/1246/tailscale-ssh-session-recording) for troubleshooting or compliance reasons. Tailscale's granular access tools let them fine-tune which person can SSH into which device, and whether they get a second identity check. It's a big upgrade from a patchwork of key management and access systems.
For those of us who just want to jump into a system now and then, Tailscale's web-based SSH is one of those tools you tuck into your travel bag. You won't always need it, but when called upon, you can produce it and marvel at your preparedness. It makes me want to go to more far-away places and marvel at how it feels like I’m still on my local network. [Give it a try](https://login.tailscale.com/start) and see what I mean.
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