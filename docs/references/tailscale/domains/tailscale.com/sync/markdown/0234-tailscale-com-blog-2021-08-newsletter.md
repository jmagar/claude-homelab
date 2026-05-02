August Tailscale newsletter
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|August 26, 2021
# August Tailscale newsletter
>
> 👉 We’d love to hear your thoughts on Tailscale.
[> Filling out this feedback form
](https://forms.gle/FA9UJwiTbdoRzKsK7)> helps us build a better product for you.
>
August has been a heads-down month for our team as we work away on a few larger features. This month also brings version 1.14 of the Tailscale client, which improves our ability to make peer-to-peer connections on many home networks. Read on for details!
### From the community
* [**Let’s install Tailscale (a VPN option with Zero configurations) [video]**](https://www.youtube.com/watch?v=EYbh6bAXYRc)
Alan from Sauber-Lab shares how to install Tailscale on an openmediavault server.
* [**Running Tailscale on a Mango\* Router**](https://bitsnbobs.kertho.me/en/posts/running-tailscale-on-a-mango-router/)
Community member and cat wrangler, Peekay, documents how to set up Tailscale on a Mango GL-MT300N-V2 router.
* [**The BlackMatter Interview — Security Now episode 830 [audio]**](https://www.youtube.com/watch?v=34nYFxUTauw)
We’re honored to be called an “interesting looking Hamachi’esque overlay for WireGuard” in the security-focused podcast hosted by Steve Gibson and Leo Laporte. For those who prefer to read, [see the show notes](https://www.grc.com/sn/SN-830-Notes.pdf).
* [**44bits 팟캐스트 123.log : tailscale VPN, 판교 부동산 [video, Korean]**](https://www.youtube.com/watch?v=V5SddHg8ea8)
For Korean readers, the 44bits podcast walks through an explanation of what Tailscale is, how it works, and why you might want to use it. The conversation about Tailscale starts around 13:45.
* [**How Tailscale Makes Managing WireGuard Easy [video]**](https://www.youtube.com/watch?v=bcRVkoeSN0E)
Tom from Lawrence Systems provides an in-depth walkthrough of Tailscale, including a demo from his lab showing speed ratings. This is a follow-up from his earlier video [comparing Tailscale and ZeroTier](https://www.youtube.com/watch?v=lAhD2JDVG08&amp;t=0s).
* [**How I use Tailscale**](https://stanislas.blog/2021/08/tailscale/)
Stanislas shares their Tailscale setup, including how they reverse proxy to self-hosted home services, and to connect private servers together.
* [**First impressions: Tailscale**](https://jlelse.blog/thoughts/2021/08/tailscale)
Jan-Lukas Else shares how he uses Tailscale to eliminate port-forwarding, access his home network remotely.
Want to be highlighted in our newsletter? Tag us [on Twitter](https://twitter.com/tailscale) with your tutorials, guides, or rants.
### From Tailscale
* [**Programming the Windows firewall**](/blog/windows-firewall/)
Dave Anderson explores Windows’ firewalling functionality, and how you can play with it yourself in Go.
* [**Frequently asked questions about IPv4 vs. IPv6**](/kb/1134/ipv6-faq/)
For fans of in-depth technical reading, this new article talks about the history of IPv6, its adoption, and some common misconceptions.
* [**Tailscale on fly.io**](/kb/1132/flydotio/)
We’ve added a new guide for running Tailscale on [fly.io](https://fly.io), one of the neatest hosting platforms out there. It’s a great option for running applications around the world, and Tailscale can make it easy to connect it with other services you may be running outside of Fly.
* [**Run a private Minecraft server with Tailscale**](/kb/1137/minecraft/)
A new guide which shows how to set up a Minecraft bedrock\_server and connect to the server from anywhere using Tailscale. A simpler alternative to our earlier guide on running a [NixOS Minecraft server](/kb/1096/nixos-minecraft/).
### Tailscale v1.14 & improved NAT traversal
Tailscale 1.14 is out! The latest Linux and Windows clients are available today (see our [update instructions](/kb/1067/update/)), and macOS, iOS, and Android will be available over the next day or two, pending App Store reviews.
Tailscale 1.14 is primarily a bug fix release. Notably, 1.14 should be substantially better at making direct peer-to-peer connections. We’ve added support for [Port Control Protocol](https://en.wikipedia.org/wiki/Port_Control_Protocol), which many home routers use to help with NAT traversal. We’ve also expanded on our experiments with UPnP support in v1.12 versions. The result should be more peer-to-peer connections (and hence, faster traffic) for many home and small-business settings!
And for FreeBSD users, this release also provides the ability to use a FreeBSD device as an exit node.
### ICYMI: Taildrop (alpha) for Android is here
Taildrop is now available on Android too, so you can easily beam encrypted files between every major platform: Android, iOS, macOS, Windows, and Linux.
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