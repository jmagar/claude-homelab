July Tailscale newsletter
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|July 28, 2021
# July Tailscale newsletter
>
> 👉 We’d love to hear your thoughts on Tailscale.
[> Filling out this feedback form
](https://forms.gle/FA9UJwiTbdoRzKsK7)> helps us build a better product for you.
>
Lots of community contributions to highlight this month! Thank you to everyone writing and sharing their enthusiasm for Tailscale.
We also released our [new version 1.12](https://github.com/tailscale/tailscale/releases/tag/v1.12.0), including the much-requested [Taildrop (alpha)](/kb/1106/taildrop/) support on Android.
> >
> I have open sourced a Lambda layer that provides a
[> @Tailscale
](https://twitter.com/Tailscale)> SOCKS5 proxy to the function. This is among other things an end run around managed NAT Gateway charges.
[> lastweekinaws.com/blog/corey-wri…
](https://www.lastweekinaws.com/blog/corey-writes-open-source-code-for-lambda-and-tailscale/)>
>
[](https://twitter.com/QuinnyPig/status/1415389387798433793)>
### From the community
* [**Corey Writes Open-Source Code for Lambda and Tailscale**](https://www.lastweekinaws.com/blog/corey-writes-open-source-code-for-lambda-and-tailscale/)
Corey Quinn from Last Week in AWS has built an AWS Lambda Extension. You can use it with any Lambda function to provide communication across your private Tailscale network — without having to configure any firewalls or network rules.
* [**Tailscale Zero Config VPN [Video, Arabic]**](https://www.youtube.com/watch?v=w1-U_QDiW1M)
Hamad Al Absi provides an intro to Tailscale and shares how to set up on Windows and Linux in this informative YouTube video.
* [**The Holy Grail Of Networking**](https://www.thesmarthomebook.com/2021/07/24/the-holy-grail-of-networking-tailscale/)
Andrew Howe found the answer to his networking dreams. What can we say, we agree completely! He walks through accessing Home Assistant remotely and securely, linking subnets, and other Tailscale tips.
* [**Tailscale: Free VPN With WireGuard, Zero Ports and Tunneling on Unraid**](https://ibracorp.io/tailscale-free-vpn-with-wireguard-zero-ports-and-tunneling-on-unraid/)
The folks at Ibracorp have awesome guides to getting started with Tailscale on your Unraid server. Not just the blog post, but also their [docs and a video tutorial](https://docs.ibracorp.io/all-guides-in-order/documentation/tailscale).
* [**How do Mesh VPNs work? Writing my own VPN tool in Golang**](https://www.samlewis.me/2021/07/creating-mesh-vpn-tool-for-fun/)
Sam Lewis gives an excellent illustrated overview of how mesh VPNs work.
* [**Running Tailscale inside a proxmox container**](https://dustri.org/b/running-tailscale-inside-of-a-proxmox-container.html)
Julien Voisin shows how to run Tailscale in a proxmox container in his homelab.
* [**TIL: Tailscale**](https://til.dcpri.me/posts/tailscale/)
Darshil Chanpura wrote a quick introduction to Tailscale from the point of view of an OpenVPN user.
* [**OMV 5: Creation of a virtual private network with Tailscale [French]**](https://lucduke.wordpress.com/2021/07/04/omv-5-creation-dun-reseau-prive-virtuel-avec-tailscale/)
Lucduke shares how to use Tailscale in this French-language blog and accompanying [video tutorial](https://www.youtube.com/watch?v=vDWi43hoqGA).
* [**Tailscale powers retro gaming servers for Newcade**](https://twitter.com/newcadecom/status/1415346583785312257)
A new tool for playing retro multiplayer games online with friends, over a Tailscale network using [node sharing](https://tailscale.com/kb/1084/sharing/).
* [**How to set up a private Sourcegraph.com instance via Tailscale**](https://twitter.com/ollshaw/status/1415049644430610432)
From Ollie Shaw on Twitter.
* [**Tailscale VPN を使ってみたので感想 [Japanese]**](https://blog.tsukumijima.net/article/tailscale-vpn/)
Tsukumi provides a detailed guide to Tailscale in this Japanese-language blog post.
Want to be highlighted in our newsletter? Tag us [on Twitter](https://twitter.com/tailscale) with your tutorials, guides, or rants.
> >
> Literally took 10 minutes to set up
[> @sourcegraph
](https://twitter.com/sourcegraph)> on our encrypted engineering
[> @Tailscale
](https://twitter.com/Tailscale)> network at the MagicDNS address “sourcegraph”
> Anybody on the network can efficiently search code across all of our repositories by typing “http://sourcegraph” into their address bar.
>
>
[](https://twitter.com/ollshaw/status/1415049644430610432)>
### Tailscale v1.12 and other updates
[Tailscale v1.12](https://github.com/tailscale/tailscale/releases/tag/v1.12.0) is available on Linux today, and rolling out to other platforms over the next few days. It’s primarily a bug fix and cleanup release. This release continues to lay the groundwork for some exciting features we will release in the coming months. MagicDNS can now use DNS-over-HTTPS when querying popular upstream resolvers, so there are fewer cases where DNS queries need to be sent in the clear. We also improved DNS support for WSL2 on Windows machines.
We’ve improved integration with [serverless containers](/kb/1112/userspace-networking/). We now support all these container platforms:
* Docker
* Heroku
* Google Cloud Run
* Azure App Services
* AWS Lambda
* AWS App Runner
* AWS Lightsail Containers
* …and other AWS services built on Fargate.
NAT traversal works in even more cases, with new UPnP support. If you haven’t seen it, we highly recommend reading Dave Anderson’s [How NAT Traversal Works](https://tailscale.com/blog/how-nat-traversal-works/).
Teams are now able to [manage their billing from the admin console](https://login.tailscale.com/admin/settings/billing). It’s slightly faster, and you might enjoy that it’s in the same place as the rest of your network settings.
We’ve long had TestFlight for early access to the next iOS release. We now have a similar Open Testing track for Android and are looking for testers:
[Join our Open Testing track](https://play.google.com/apps/testing/com.tailscale.ipn)
Taildrop for Android is now available so you can easily beam encrypted files between Android, iOS, macOS, Windows, and Linux.
### ICYMI: GitHub Authentication
You can sign up for Tailscale with your GitHub account. If you’re part of a GitHub organization, you’ll get an option to join that org when you sign up, and share a private network with everyone else in that org.
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