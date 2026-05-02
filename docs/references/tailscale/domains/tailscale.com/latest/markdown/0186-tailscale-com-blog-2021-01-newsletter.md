Hello 2021!
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|January 14, 2021
# Hello 2021!
We want to take a moment and thank you for being such an important part of the Tailscale community. 2020 was a stand out year for us — because of you!
### Recent community contributions
* [Running Jellyfin over Tailscale](https://www.ethanmad.com/post/jellyfin_remote_access/) — Ethan Madison’s guide for how he runs Jellyfin, an open-source media server, using Caddy and [our sharing beta](http://tailscale.com/kb/1084/sharing) to give a nice URL to friends and family.
* [Tailscale, I choose you](https://itorres.net/post/2020/12/2020-12-07-tailscale-i-choose-you/) — Ignacio Torres Masdeu documents an Ansible playbook for installing Tailscale.
* [Accessing my k3s cluster from anywhere with Tailscale](https://blog.dsb.dev/posts/accessing-my-k3s-cluster-from-anywhere-with-tailscale/index.html) — David Bond writes how to use Tailscale with k3s to manage a homelab Raspberry Pi cluster. Bonus: in the article he links a [Tailscale Terraform provider](https://github.com/davidsbond/terraform-provider-tailscale) to help manage Tailscale nodes.
* [Mullvad and Tailscale coexisting](https://rakhesh.com/linux-bsd/mullvad-and-tailscale-coexisting-or-hello-nftables/) — Rakhesh Sasidharan explores nftable rules, including how to allow Tailscale traffic through Mullvad’s traffic blocks.
* [Pi-Hole DNS Routing](https://tky.io/2020/11/pi-hole-dns-routing/) — Tim Yocum describes how he configures Pi-Hole to handle some DNS requests on his local network, including over [MagicDNS](http://tailscale.com/kb/1081/magicdns).
With the beginning of the new year, we wanted to highlight how Tailscale developed during 2020, and give you peek at what to expect this year.
### Making Tailscale real…
Before 2020, Tailscale didn’t really exist. 2020 was the year Tailscale moved from a prototype for a single company, to a real, usable zero-config VPN that “just works.” A lot of work went into making this possible, including…
* Rewriting our peer discovery (internally named **“magic disco”**) and NAT traversal logic to make peer-to-peer connections robust, no matter where you are.
* Building out DERP **relay servers**, which covers the last 1% of difficult networks that make peer-to-peer connections impossible.
* And launching our **Android app**, to support every major platform.
### Making Tailscale easy…
Our ambitions don’t stop at connecting devices. We want to ensure accessing and managing your network is as simple as possible. On top of the basics…
* **MagicDNS** rolled out this summer. Access your devices with human-readable names rather than IP addresses, and know what’s what.
* Our **admin console** received an overhaul giving new controls for network administrators to manage devices, DNS, subnets, and access controls.
* Our **sharing beta** took the first steps at making sharing private services with friends & family or contractors & vendors, easy and secure.
### And making Tailscale… scale
In the last year we grew from just the three founders to more than 20 people globally. The team secured both seed and Series A funding totaling $15M USD. We’re incredibly proud of how far we’ve come and the confidence our investors have put in our technology and our team. We have the means to keep improving Tailscale for a while to come.
On the topic of scale, here’s a few team statistics from last year:
* 6 co-op students helped build Tailscale
* 42 GitHub contributors
* 1,532 commits made
* 1 sloth video conference
### What’s next?
Thanks for joining us in reflecting on 2020. We have high hopes and big plans for the year ahead. What to expect in the coming few months:
* Public launch of sharing
* A Tailscale API for automating network administration
* Support for IPv6 inside the tunnel
* Support for default routes
* And much more…
We hope you all are staying safe and healthy. As always, we’d love to hear how you’re using Tailscale and what we can do to make it better.
Share
Author
Laura Franzese
Author
Laura Franzese
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