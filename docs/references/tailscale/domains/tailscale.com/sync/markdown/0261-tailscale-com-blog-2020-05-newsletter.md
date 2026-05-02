May Tailscale newsletter
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|May 12, 2020
# May Tailscale newsletter
A month ago, we [announced Tailscale’s general availability](http://tailscale.com/blog/tailscale-launch/). Since then, we’ve been hard at work improving Tailscale. Today, we’re writing with some updates.
We recently released a new minor version of our client apps. This new version fixes various connectivity issues and squashes some annoying platform-specific bugs. Thanks to everyone who wrote in to report these issues.
A few highlights from [the complete changelog on GitHub](https://github.com/tailscale/tailscale/releases/tag/v0.98):
* **We now prefer IPv6 over IPv4 when sending encrypted packets between nodes**. Note: this does not yet make IPv6 available inside the Tailscale network.
* **Switching between different networks is now smoother than ever**, particularly between Wi-Fi and LTE, or when moving a sleeping laptop between different networks.
* **Windows no longer resets active connections** when new nodes get added to the network.
* We’ve adjusted MTU settings to **avoid packet loss for users on Google Cloud or DSL**.
This is a minor release, so we recommend everyone update to the latest version. You can [learn how to update](http://tailscale.com/kb/1067/update).
#### Improved Okta support
We now welcome teams to use [Okta](https://www.okta.com/) to authenticate to their Tailscale network. Contact us to enable it for your team. (Get a head start by following our [Okta setup guide](http://tailscale.com/kb/1066/sso-okta).)
#### New relay server: Sydney
Our [relay servers](http://tailscale.com/blog/how-tailscale-works/#encrypted-tcp-relays-derp) route encrypted traffic when devices can’t connect directly to each other. Having a closer relay server means reduced latency on troublesome networks. The previous closest nodes for our friends in Oceania were Singapore or San Francisco, so the performance increase should be quite noticeable.
(In unrelated news, one of our developers is currently in Australia. Totally unrelated.)
#### Choosing a VPN for your team
We’ve received a lot of questions about how Tailscale and WireGuard® differ from other VPN options.
Since most online guides only cover personal VPNs, we’ve published our [VPN Reviewer’s Guide](http://tailscale.com/kb/1062/reviewer-guide) a detailed list of questions to ask when searching for a VPN for your team. It’s a big read, but if you’re evaluating several options, we hope it helps you make an informed choice.
#### Contributions of note
We wanted to acknowledge some recent contributions made within the Tailscale community:
* [@mrkaran](https://twitter.com/mrkaran_) wrote [an article detailing how he uses Tailscale](https://mrkaran.dev/posts/home-server-updates/) to connect a VPS to a local Raspberry Pi Kubernetes cluster. His post walks through triaging blocked UDP packets, multiple competing overlay networks, and some DNS fiddling to make it all work.
* [@nirev](https://twitter.com/nirev) created an [open-source package builder for Synology NASs](https://github.com/nirev/synology-tailscale). It requires a manual install, but it’s a great option for NAS users looking to connect over Tailscale today.
Thanks for the great work [@mrkaran](https://twitter.com/mrkaran_) and [@nirev](https://twitter.com/nirev)! 🎉
#### Coming soon: Android beta
Our Android app is (by far) our most requested feature, and we’re happy to announce we have [a working prototype](https://twitter.com/eliasnaur/status/1257733847346708481). We’ll be inviting users to begin beta testing within the next week or so.
If you’d like to participate in our beta, [watch this GitHub issue for updates](https://github.com/tailscale/tailscale/issues/285).
Share
Author
Ross Zurowski
Author
Ross Zurowski
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