March Tailscale newsletter
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|March 17, 2021
# March Tailscale newsletter
We’ve got lots of content and product updates to share this month, so we’ll jump right in.
#### Community Writing
* [**Self-Hosted Cloud Storage with Seafile, Tailscale, and a Raspberry Pi**](https://blog.patshead.com/2021/02/self-hosted-cloud-storage-with-seafile-tailscale-and-a-raspberry-pi.html?r=recent) Pat Reagan, whose writings [we’ve](https://blog.patshead.com/2020/09/making-my-life-easier-with-tailscale.html) [featured](https://blog.patshead.com/2021/01/using-tailscale-to-share-a-single-computer.html) in past newsletters, documented his setup for using Tailscale and Seafile to create a secure, private Dropbox-like system without relying on a third-party storage provider. A useful for NAS users with lots of media, like RAW photos or 4k video.
* [**Running Nomad for a Home Server**](https://mrkaran.dev/posts/home-server-nomad/) Karan Sharma shares an update to [his post a year ago](https://mrkaran.dev/posts/home-server-updates/) about running a home server with k3s. This new post walks through seting up Nomad, as well as configuring it to restrict SSH access to strictly over Tailscale.
* [**リモートワーク向けにセキュアな VPN を構築**](https://4b-media.net/tailscale/) Similar to Satoshi Shimizu’s [overview of Tailscale last month](https://internet.watch.impress.co.jp/docs/column/shimizu/1303751.html), here’s another article for Japanese readers on how to get started with Tailscale, and how it compares to other VPN providers.
* [**Tailscale: A VPN that even Brian can use!**](https://blog.briancmoses.com/2021/03/tailscale-a-vpn-that-even-brian-can-use.html) Brian McMoses describes his journey for remote access to his DIY NAS, and how he makes use of Tailscale’s [subnet router feature](http://tailscale.com/kb/1019/subnets) to privately access his whole home network remotely.
#### From the Tailscale team
* [**Modules, Monoliths, and Microservices**](http://tailscale.com/blog/modules-monoliths-and-microservices/)
The latest of several essays on systems design, Avery Pennarun weighs the trade-offs between isolation and modularity when building software systems.
* [**netaddr.IP: a new IP address type for Go**](http://tailscale.com/blog/netaddr-new-ip-type-for-go/)
Brad Fitzpatrick explains the issues with the Go standard library’s net.IP type, and how we’ve improved upon it with our new netaddr.IP which is now used across Tailscale’s servers and clients.
* [**How often should I rotate my SSH keys?**](http://tailscale.com/blog/rotate-ssh-keys/)
SSH keys are a core part of contemporary authentication practices. Avery discusses the history behind them, why they’re not perfect, and how often you should rotate them.
### Tailscale v1.6
The latest version of Tailscale is available today! [Learn how to update](http://tailscale.com/kb/1067/update) or [read the full release notes on GitHub](https://github.com/tailscale/tailscale/releases/tag/v1.6.0).
The flagship feature for this release is IPv6 support inside the tunnel (v1.6… IPv6… get it?) Supporting IPv6 inside the tunnel means we can finally build a feature we’ve been excited to share for some time: **exit nodes**.
#### Exit Nodes
By default, Tailscale is an *overlay network*: it routes and secures traffic between devices running Tailscale, but doesn’t touch your public internet traffic, such as when you visit Google or Twitter. In most cases, this is the right move. Communication between private devices (company servers, home computers) needs to be secured, but there’s no need to add extra layers of encryption or latency for a public internet connection.
However, there may be times when you *do* want Tailscale to route your public internet traffic: in a cafe with untrusted Wi-Fi, or when traveling overseas and needing access to an online service (such as banking) only available in your home country.
Exit nodes lets you opt-in to routing all non-Tailscale internet traffic through a specific device (an “exit node”) on your network.
Learn more from [our documentation](http://tailscale.com/kb/1103/exit-nodes), or [watch our demo video to see it in action→](https://www.youtube.com/watch?v=ETkqina913I)
#### Admin Console Updates
Alongside our client changes, we’ve also made a few small updates to the admin console.
The admin console now shows any ACL tags claimed by machines on your network.
[ACL Tags](http://tailscale.com/kb/1018/acls#acl-tags) let you define custom permissions for machines without inheriting permissions from the user who authenticated it. For example, tagging web server machines with `tag:server` means you can restrict them to only see a database server, without applying those restrictions to the administrator who configured the server.
This addition should make it vastly easier to configure (and debug) tags across your network.
And a long-overdue update to the way we display the “last seen” timestamp on [the machines page](https://login.tailscale.com/admin/machines) means you can quickly scan through the list to see which devices are currently connected.
We hope you enjoy this release. We’d love to hear any feedback you have about how we can make Tailscale better. [Send us an email](mailto:info@tailscale.com) or [reply to @Tailscale on Twitter](https://twitter.com/tailscale).
That’s all for now — stay well!
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