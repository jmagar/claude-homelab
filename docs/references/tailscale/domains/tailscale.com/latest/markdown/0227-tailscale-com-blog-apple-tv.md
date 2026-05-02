Apple TV, now with more Tailscale
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|productSeptember 18, 2023
# Apple TV, now with more Tailscale
Today we’re expanding the list of devices that can run Tailscale, bringing [secure remote networking to the Apple TV](https://apps.apple.com/us/app/tailscale/id1470499037?platform=appleTV). The newly released tvOS 17 offers support for VPNs, and we’re proud to say Tailscale is among the first to use this new feature. You can now [add your Apple TV directly to your tailnet](/kb/1280/appletv/), unlocking three powerful new use cases that we’re excited to share.
Alex shows the power of Tailscale on an Apple TV
First up, if you already have anything like a “media server” in your life, the benefits of integrating your Apple TV into the same Tailscale network are large. Lots of people already use Tailscale with Plex, Channels or Jellyfin servers, [homelab set-ups](https://perfectmediaserver.com/), and [NAS devices](/kb/1307/nas) to securely share their collections and stream from them while on the go. Today’s release makes it that much simpler to do so right on your TV.
With up to three users available [on our Free plan](/pricing/), you’ve got tools to make a media drive available to other trusted people in your life. You can share a collection of family photos and home videos into a faraway relative’s tailnet, without worrying about locking down the server for public internet access.
But even if you don’t have a media server to connect to, you can use Tailscale’s Apple TV app to select another device in your tailnet, like a PC, a Raspberry Pi, or even an Android phone, to use as an exit node. This will route all your Apple TV’s traffic through that connection, providing an extra layer of privacy from the local network where you’re using the Apple TV and making your traffic appear to originate from the machine of your choice.
Compare that to a “traditional” VPN option, where your traffic is routed through a commercial data center (which itself may be blocked by sites and services) and where you must trust the VPN provider not to spy on or tamper with your traffic. With a Tailscale exit node, you’re in control and you get the internet connection you’re used to. This new feature could come in handy if you’re traveling with your Apple TV and want to access the same geo-restricted channels you can see from home.
Finally, the new Tailscale client allows an Apple TV to be an exit node itself for other machines in your tailnet. This one might require a little more explaining; after all, not a lot of Apple TV apps advertise features that are most useful when you’re away from your Apple TV.
But look at it this way: your Apple TV device is a capable little computer, and it stays connected to your tailnet even when it’s not in active use. Download and configure Tailscale now and you can securely route any of your other devices’ traffic through your Apple TV — and by extension, through your home internet connection — even when you’re on the other side of the planet. Whether you want another layer of security and privacy on sketchy Wi-Fi networks or just want to connect back through your personal internet connection when you’re on the road, you’re set with the Apple TV as an exit node.
At Tailscale, we’re the kind of nerds who have home server closets and who will stock up on Raspberry Pis just because they’re available again. Our favorite thing about bringing Tailscale to tvOS is you don’t have to be that kind of nerd to be able to tap into the power of Tailscale in your home.
If you’ve got an Apple TV running the new tvOS 17, [download the Tailscale app](https://apps.apple.com/us/app/tailscale/id1470499037?platform=appleTV) today!
Share
Authors
Andrea Gottardo
Alessandro Mingione
Sam Linville
Parker Higgins
Authors
Andrea Gottardo
Alessandro Mingione
Sam Linville
Parker Higgins
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