June Tailscale newsletter
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|June 30, 2021
# June Tailscale newsletter
>
> 👉 We’d love to hear your thoughts on Tailscale. Filling out this feedback form helps us build a better product for you:
[> https://forms.gle/FA9UJwiTbdoRzKsK7
](https://forms.gle/FA9UJwiTbdoRzKsK7)
>
It’s been another productive month for the team here at Tailscale, and we are brimming with community contributions including [a getting started video tutorial](https://www.youtube.com/watch?v=jDYyC9gF774) from David Burgess and a new guide by Justin Rhee on setting up a [Tailscale VPN on Kubernetes](https://blog.getporter.dev/kubernetes-x-tailscale/). Let’s jump in:
#### New Pricing
Monday we announced a new pricing model for Tailscale that makes it less expensive for everyone, and easier to scale. As always, **non-profits and open-source projects receive a 50% discount.**
Spin up more devices or subnet routers, try out ACL rules—we want you to experiment and update your payment settings after the fact. We’re building the most inclusive pricing model possible, and we’ll be able to do that [with your feedback](mailto:support@tailscale.com).
#### GitHub Authentication
Users can now sign up for Tailscale using their GitHub account. We do not (yet) support creating your own teams, but if you are part of an existing GitHub organization you’ll get the option to join that org when you sign up.
#### Tailscale v1.10
[Tailscale v1.10](https://tailscale.com/kb/1067/update/) is primarily a bugfix and stabilization release. It also lays the groundwork for an upcoming feature to support HTTPS certificates that we’re hoping to release in the coming weeks. For all platforms `tailscale ping --until-direct` (the default) now exits with a non-zero exit code if no direct connection was established.
On macOS we’ve added a UI to allow access to the local LAN while using an exit node. We’ve also added support for the new macOS 12 and iOS 15 betas announced at WWDC. For Android, macOS, and iOS we have fixed use of Tailscale IP addresses as DNS servers.
#### From the community
[
](https://www.youtube.com/watch?v=jDYyC9gF774)
David Burgess at DBTech walks through how to set up Tailscale on Windows and Linux.
* **[Guide: Setting up a Tailscale VPN on Kubernetes](https://blog.getporter.dev/kubernetes-x-tailscale/)**
Justin Rhee shares how to deploy Tailscale to Kubernetes via Helm or Porter to securely access k8s services by cluster IP.
* **[Creating virtual networks with Tailscale [Spanish, audio]](https://ugeek.github.io/post/2021-06-17-creando-redes-virtuales-y-saltando-todas-la-barreras-y-cg-nat-con-tailscale.html)**
This Spanish-language podcast takes a conversational look at creating virtual networks and jumping all barriers and CGNAT with Tailscale.
* **[Securing your home NAS with a VPN](https://blog.nootch.net/post/securing-home-nas/)**
Bruno Antunes reasons step-by-step on why and how to secure your NAS with a VPN using Tailscale.
* **[Wake-on-LAN server](https://github.com/macoshita/wakeonlan-server)**
Community member [@macoshita](https://twitter.com/macoshita/status/1400872545956491265) shared an app that sends a magic packet to a specified mac address to boot a PC from an external network without opening any ports.
* **[“Taildrop“ verspricht AirDrop über (Netzwerk‑)Grenzen [German]](https://www.iphoneblog.de/2021/06/01/taildrop-verspricht-airdrop-uber-netzwerk-grenzen/)**
Alex Olma writes about Taildrop for his German-language based iPhone blog.
* **[Custom VyOS 1.4.x build that includes Tailscale](https://github.com/DMarby/vyos-tailscale)**
David Marby created a small utility for building VyOS images with Tailscale pre-installed and configured to persist state between upgrades.
* **[Tailscale-sidecar ](https://github.com/markpash/tailscale-sidecar)**
Mark Pashmfouroush designed this side-car to expose services onto a tailscale network without needing root or routing.
* **[Build the same segment network between bases using tailscale VPN and Raspberry Pi User](https://qiita.com/tinoue@github/items/ebcdf5423d87df0ad7cc?utm_source=dlvr.it&amp;utm_medium=twitter)**
Takeshi Inoue shares how to use Tailscale with a Raspberry Pi on the Japanese developer site, Qiita.
* **[Tailscale explained [French]](https://korben.info/tailscale-reseau-prive-virtuel.html)**
French community member @korben shares what Tailscale is and why it is important for ‘the non-command line experts’ who want to use WireGuard.
* **[Taildrop file transfer [German]](https://www.itopnews.de/2021/06/app-des-tages-tailscale-neu-mit-datei-austausch/)**
was highlighted as the app of the day in the German publication iTop News.
* **[Newcade now supports Tailscale](https://mobile.twitter.com/newcadecom/status/1400921112712785924)**
The decentralized cloud gaming platform now allows players to access games securely via Tailscale.
> >
> Just want to give
[> @Tailscale
](https://twitter.com/Tailscale)> a big shoutout for how easy it is to do remote printing after Google killed Cloud Print. I set up a Raspberry Pi with CUPS as a print server, joined it to Tailscale network and boom, now I can print from anywhere.
>
[](https://twitter.com/jpan613/status/1401276416012947458)>
#### From the Tailscale team
* **[Taildrop was kind of easy, actually](https://tailscale.com/blog/2021-06-taildrop-was-easy/)**
Taildrop was the first test of an experimental p2p app discovery layer in Tailscale. Tailscale CEO Avery Pennarun talks about why it was so easy to build, and where we go from here.
* **[NAS from anywhere with Tailscale](https://tailscale.com/blog/2021-06-nas-access-from-anywhere/)**
In this informational post we dive through how to use Tailscale to set up your NAS for access from any device.
* **[NAS 101: An intro chat about Network Attached Storage](https://tailscale.com/blog/nas-101/)**
Lots of folks use Tailscale with NAS devices. In an effort to make this tech more accessible we’ve published a chat about the basics between our past co-op student Naman Sood and our Archmage of Infrastructure, Xe Iaso.
We’d love to hear any feedback you have about how we can make Tailscale better. [Send us an email](mailto:info@tailscale.com) or [reply to @Tailscale on Twitter](https://twitter.com/tailscale).
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