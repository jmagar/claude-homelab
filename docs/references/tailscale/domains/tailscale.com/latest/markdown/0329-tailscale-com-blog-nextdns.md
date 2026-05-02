Enhanced DNS Control and Security: Use NextDNS with Tailscale
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|October 12, 2022
# Use NextDNS everywhere you use Tailscale
Ever wanted to run your own DNS resolver but you don’t actually want to run your own DNS resolver because running DNS is fraught with pain?
**Tailscale now supports **[**NextDNS**](https://nextdns.io/)**!**
NextDNS lets you choose exactly how you want to run a DNS resolver — but they run it for you, all over the world. (It’s a bit more robust and lower latency from other cities than that Pi of yours dangling off the shelf by your cable modem.)
Unlike typical public DNS services that only have one or a few configuration options — like blocking malware, or limiting access to content that isn’t kid-friendly — NextDNS lets you configure dozens of things about how and whether your DNS is filtered and logged.
To use NextDNS with Tailscale, [create a NextDNS account](https://my.nextdns.io/signup), and then set NextDNS as your tailnet’s global nameserver by copying one of the NextDNS profile IPv6 addresses into your [tailnet’s DNS settings](https://login.tailscale.com/admin/dns). Select “Override local DNS” to force your devices to use NextDNS. Congratulations, that’s it.
Your devices need to be running [Tailscale v1.32 or later](/changelog/). Linux and Windows clients are already available. The macOS, iOS, and Android clients will be available soon, after app store review.
If you’d like to go fancier, you can also map certain users, groups, or tags within your tailnet to different NextDNS profiles — for example, to set your kids’ devices to a different profile. For more information, see [our NextDNS documentation](/kb/1218/nextdns).
Share
Authors
Brad Fitzpatrick
Maisem Ali
Jenny Zhang
Authors
Brad Fitzpatrick
Maisem Ali
Jenny Zhang
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