February Tailscale newsletter
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|February 09, 2021
# February Tailscale newsletter
A new month, a new set of updates! We’ve got new features to share, along with a slew of writing and podcasts about Tailscale. Let’s dive in!
### Community Contributions
* [**100 台まで無料の VPN サービス「tailscale」、リンクだけでマシンのシェアも可能!?**](https://internet.watch.impress.co.jp/docs/column/shimizu/1303751.html)
A well-researched and thorough summary of how Tailscale works and how to use it in Japanese by Satoshi Shimizu.
* [**Using Tailscale on Windows to network more easily with WSL2 and Visual Studio Code**](https://www.hanselman.com/blog/using-tailscale-on-windows-to-network-more-easily-with-wsl2-and-visual-studio-code)
Scott Hanselman takes readers on a tour of how he got Tailscale to work for his WSL2 configuration, including VS Code remote development.
* [**Episode 383: Scale the Tail**](https://www.bsdnow.tv/383)
Episode 383 of the BSD podcast takes a deep dive of setting up Tailscale with BSD, riffing off of [Rakhesh Sasidharan’s post](https://rakhesh.com/linux-bsd/tailscale-on-openbsd/) we’ve featured in the past.
* [**Terraform, Tailscale, AWS**](https://github.com/Gowiem/terraform-aws-tailscale)
[Matt Gowie](https://twitter.com/Gowiem) has shared a Terraform module for configuring Tailscale on AWS using Terraform. Another useful project for Terraform users, along with David Bond’s [terraform-provider-tailscale](https://github.com/davidsbond/terraform-provider-tailscale) which we featured last month.
### Tailscale on Tailscale
Our team has been active in writing and publishing about our own work this month. A few contributions of note:
* [**“Can networking be simple?”**](https://hanselminutes.com/774/can-networking-be-simple-with-tailscales-avery-pennarun)
Along with the article above, Scott Hanselman brought Avery Pennarun as a guest on his podcast where they talked about how networking has changed over the years, and the historical context Tailscale fits into.
* [**Go at Tailscale**](https://www.youtube.com/watch?v=csbE6G9lZ-U&amp;feature=youtu.be)
Brad Fitzpatrick’s FOSDEM talk focuses on the switch from building Go to building a startup *with* Go, including details about our [inet.af/netaddr](https://github.com/inetaf/netaddr) package.
* [**Tailscale on NixOS: A New Minecraft Server in Ten Minutes**](http://tailscale.com/blog/nixos-minecraft/)
Xe Iaso, one of our resident NixOS experts, explains how to set up a new private Minecraft server using NixOS and DigitalOcean, in just a few minutes!
* [**An unlikely database migration**](http://tailscale.com/blog/an-unlikely-database-migration/)
Brad and David Crawshaw share the database we use behind-the-scenes at Tailscale (hint: it’s not SQL), and what’s changed over the last year of Tailscale’s life. A Japanese-translated translated version, courtesy of itnews.org, can be found here: [非現実的なデータベースの移行](https://itnews.org/news_contents/an-unlikely-database-migration)
### New features
#### Sharing
The feature we’re most excited to announce is our [sharing public beta](http://tailscale.com/blog/sharing-over-tailscale)! With sharing, you can now invite users outside your network secure access to your devices. This is helpful for sharing home media servers with family, Minecraft servers with friends, or giving contractors temporary and controlled access to private servers. Read [the announcement post](http://tailscale.com/blog/sharing-over-tailscale/) for more details.
#### Tailscale v1.4
Our latest client version is out — upgrade your devices! This release reduces bandwidth, battery, and CPU usage in the background, and some initial steps at improving throughput.
Tailscale v1.4 now uses [machine names](http://tailscale.com/kb/1098/machine-names) in the UI (and in `tailscale status`), so [MagicDNS](http://tailscale.com/kb/1081/magicdns) users can see a device name and type directly into their browser or command line and have it “just work.” This pairs with our recent addition of the ability to rename devices in your Tailscale network to more easily manage your devices and DNS on Tailscale.
Learn [how to update Tailscale](http://tailscale.com/kb/1067/update), or read the [full release notes on GitHub](https://github.com/tailscale/tailscale/releases/tag/v1.4.0).
#### What’s on the roadmap?
Our focus for the next release is “exit nodes,” a commonly requested feature to opt-in to routing all non-Tailscale traffic through a particular device on your network. Tailscalar Dave Anderson shared [a sneak peek tweet](https://twitter.com/dave_universetf/status/1351755531904458753) a few weeks back. More to share soon!
Happy networking!
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