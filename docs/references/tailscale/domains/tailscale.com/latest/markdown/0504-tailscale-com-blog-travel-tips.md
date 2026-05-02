Travel tips from Tailscale
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|December 12, 2023
# Travel tips from Tailscale
It’s the holiday season, which means many of us are traveling to be close to family or loved ones, but that also means being far from our home networks. Tailscale can be a real help on the road, and traveling to familiar and faraway places can be an opportunity to set up connections that can come in handy for the rest of the year. In both cases, though, you may need a little bit of preparation.
Today we’re sharing a few of our suggestions for Tailscale users headed out from home in the next few weeks. We’ve also adapted this blog post into a video on our YouTube channel, if you prefer to watch it that way!
### Set up an exit node and Tailscale SSH at home
Before you leave home, it’s a good time to set up a spare computer, or a device like a Raspberry Pi or an Apple TV to [work as an exit node](/kb/1103/exit-nodes/). An exit node at home means that wherever you go, you can route your internet traffic through your regular network and get access to any geo-restricted content or sites you’re used to. It can also come in handy while traveling and connecting through unfamiliar (and sometimes sketchy) Wi-Fi connections in airports and hotels.
We put together a video on installing Tailscale on an Apple TV that might be helpful for getting started:
You may also want to [enable Tailscale SSH](/kb/1193/tailscale-ssh/) for any computer you might want to access while away. WIth Tailscale handling the SSH authentication, you can even log in from a phone or tablet if that’s what you’ve got, without having to figure out a key exchange or any port forwarding in advance.
### Think about what you can set up at your destination
If you’re going to visit family out of town, this could be an opportunity to install an off-site Tailscale node. You could drop a [NAS box for remote backups](/kb/1307/nas/), to help keep your data safe in the event of some physical disruption at your home.
You could also set up another small computer that could serve as a second exit node. An Apple TV is a great choice for this again, because it’s likely to stay powered on (and Tailscale continues to work even when it’s in low-power mode) and connected to the internet. You could log in with Tailscale on these devices yourself, or if your family wants to set up a tailnet, they could log in and then share those nodes over to you.
### Ease future remote tech support with a subnet router or a PiKVM
For many of us, part of the holiday travel ritual involves tech support operations for family members who are not quite as good with home networking. It can be tough to debug these issues remotely, so they wait until we’ve got physical access — and then it eats up precious time together!
Tailscale can help with this, too. Maybe you want to plan to set up a [subnet router](/kb/1019/subnets/) at the family home, so you can connect remotely to whatever devices they have set up on their home Wi-Fi. You could also [set up a PiKVM](/kb/1292/pikvm/) to allow full low-level access to a given machine remotely — and because it’s Tailscale, you don’t have to worry about opening a port to allow connections to such a sensitive device.
Perhaps it’s not surprising that Tailscale — a tool for building small, trusted, human-scale networks — has so many applications at a moment when people bring their human networks together. No matter how far you or your packets are traveling, we hope this has been a helpful guide.
Share
Author
Parker Higgins
Author
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