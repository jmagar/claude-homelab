August Tailscale newsletter
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|August 25, 2020
# August Tailscale newsletter
Happy August from Tailscale HQ. We’ve spent the last month fixing bugs and laying the groundwork for some upcoming features. Here’s what we’ve been working on.
#### Tailscale 1.0
Now available for all platforms! This update contains no new features, only connectivity fixes and groundwork for future changes.
While this update isn’t major (forgive the semver pun), we see 1.0 as a big milestone. Does 1.0 mean Tailscale is completely bug-free? Not yet, it isn’t. Does it mean Tailscale is feature complete? Certainly not. There’s still a long journey ahead to make Tailscale perfectly stable and effortless to use. But 1.0 is a recognition that we’ve come a long way. Today, Tailscale works reliably on almost every network and device and companies around the world are relying on Tailscale for their production networks. The 1.0 label reflects that.
Thanks for your continued support and excitement. We’re thankful for the opportunity to help you keep your networks simple and safe.
[How to update Tailscale](/kb/1067/update)
#### Tailscale for Android
In case you missed it, we also launched [our new Android client on the Play Store](https://play.google.com/store/apps/details?id=com.tailscale.ipn)! Tailscale for Android brings native Google auth and the network device list to Android and ChromeOS devices. Give it a try!
#### Community Spotlight
Big thanks this month to [@thrillifying](https://twitter.com/thrillifying) and /u/mgozmovies, who took it upon themselves to write guides explaining how they use Tailscale to make developing and securing servers easier:
* [**Using code-server with Tailscale on Ubuntu 20.04**](https://www.notion.so/Install-code-server-on-Ubuntu-20-04-with-Tailscale-f73cc18ed34f46ee8c94bb93ec77f288)
@thrillifying’s guide walks through using Tailscale for a secure, low-latency connection to VS Code via code-server. Connecting to remote devices for development is a common way people use Tailscale.
* [**Secure an Ubuntu server with Tailscale and UFW**](/kb/1077/secure-server-ubuntu-18-04)
/u/mgozmovies wrote [a great tutorial on /r/Tailscale](https://old.reddit.com/r/Tailscale/comments/hwnc0l/restricting_ssh_access_to_tailscale_interface_on/) showing how to lock down a server using UFW and Tailscale. We tested and wrote it up into an official guide. For those curious, why we recommend allowing firewall access to the tailscale0 interface even though Tailscale works without it, [this twitter thread](https://mobile.twitter.com/dave_universetf/status/1288887238537838592) provides some extra context.
Inspired by their example, we’ve introduced a [new “Guides” section to the Tailscale docs](/kb/guides/) with step-by-step instructions and ideas for how to use Tailscale. If there’s a guide you’d like to read, let us know by at [info@tailscale.com](mailto:info@tailscale.com) or messaging us [on Twitter](https://twitter.com/tailscale).
#### Meet Laura, our newest team member
We’re happy to welcome our newest Tailscalar, Laura Franzese, to our small team! Laura joined at the beginning of June as our Product Marketing Manager, with experience at companies like CircleCI and StrongDM. She’s been hard at work, talking to and learning from our Tailscale users — you might have already spoken with her. Welcome!
#### New relay servers: Bangalore and Tokyo
This week we deployed two new relay servers to help connectivity on difficult networks. A brief reminder: Tailscale is point-to-point whenever possible, but falls back to end-to-end encrypted relay servers when direct connections are impossible.
Our new relays in Tokyo and Bangalore bring a reduced latency for users in East and Southeast Asia: media latencies dropped in Japan from **83ms to 13ms**; in Korea from **98ms to 40ms**; and across India, from **74ms to 28ms**.
We’ve also improved our tools for measuring user latency, and will be monitoring and deploying new relays as needed. Up next: the UK and Southeastern US.
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