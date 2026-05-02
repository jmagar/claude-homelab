Sharing over Tailscale
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|January 26, 2021
# Sharing over Tailscale
**tl;dr** [Sharing](/kb/1084/sharing) is now in public beta, and available for all Tailscale users. [Learn how to start sharing right away →](/blog/sharing-over-tailscale/)
Since Tailscale launched, we’ve heard from many people who want to give people access to a device within their private network. Tech hobbyists want to share dogcam feeds with their family, friends want to host private Minecraft servers together, and companies want to invite contractors to specific devices for a limited subset of time.
For many people, the only option is to expose these services publicly over the internet. Even if you use a secret URL, or add IP- or password-based authentication, sensitive services exposed on the web in any way are risky. They’re also inconvenient: you have to spin up servers to host reverse proxies, and coordinate URLs, IPs, or passwords with multiple parties.
Sharing is a new Tailscale feature that lets you give users outside your network access to your devices in a private and controlled way. With a few clicks, you can generate an invite link to share a device on Tailscale with family, friends, and collaborators. And like the rest of Tailscale, shared devices talk peer-to-peer over encrypted and private connections.
Sharing has been in private beta for the last month and a half, and today, we’re announcing sharing as a **public beta**, available to every Tailscale user on every plan.
### How to share a device
You can start sharing right away: go to [the machines page of your admin console](https://login.tailscale.com/admin/machines), open the “…” menu for a machine you’d like to share, and press “Share this machine…”.
From this panel, generate an invite link (along with a label for your reference) which you can share with any Tailscale user. Once they accept your invite, they’ll be able to see and connect to your device.
Only the user you shared with can see and connect, no one else in their network. And shared devices are quarantined: they can only respond to incoming connections, not make outgoing ones.
Read [our sharing documentation](/kb/1084/sharing) for full details.
### How does sharing work?
Tailscale is designed to be secure-by-default, and sharing is no exception. You can comfortably share devices, and accept invites to other devices with minimal risk to your private network.
Only the shared device from network A and the share recipient’s devices in network B can talk across network boundaries.
Here’s a few qualities that make sharing secure-by-default:
* **Shares are from a device to a user**, not device-to-device or device-to-network. When you share a device, you know exactly who can access it. The shared device isn’t visible or accessible to anyone else on your recipient’s network.
* **Only network admins can create or accept invitations**, and either party can revoke access at any point in time.
* **Shared devices are quarantined** meaning they can only respond to incoming connections. They can’t initiate unprompted connections to recipient’s devices.
* [**Subnets**](/kb/1019/subnets)\*\* aren’t shared between networks\*\*, avoiding unintentionally leaked traffic. Only devices running Tailscale can be shared.
* [**ACLs**](/kb/1018/acls)\*\* from the sharer’s domain still apply.\*\* If you share `my-server` but your ACLs don’t allow anyone to talk to `my-server`, invited users aren’t exempt from those rules.
* **MagicDNS will work** with shared devices as of the upcoming Tailscale v1.4 release. One caveat: **shared devices are only accessible via the FQDN** (eg. not `shared-server` only `shared-server.example.com.beta.tailscale.net`). This is far less convenient to type, but eliminates the risk of a malicious sharer inviting you to add a device named `google.com` to your network to hijack your traffic.
### What’s next?
Sharing remains a beta feature because there’s still a lot to do to make sharing work more elegantly with other Tailscale features: MagicDNS short names should be safe to use between networks, subnet sharing should be possible, and admins should be able to disable quarantine for bidirectional communication. As people start using sharing, we’ll look to lift these restrictions in safe, opt-in ways.
However, the core feature has proven to be stable over the past two months of private testing. We’re opening it up to the public today to let everyone start using it!
Our team is really excited to see what people build on top of sharing. During the private beta, we’ve already seen tons of amazing uses such as:
* Sharing an open-source receipt tracking server with a spouse
* Sharing a home media server with family in another province
* Hosting private Minecraft servers and Factorio games with friends
* Sharing a Raspberry Pi with sensors to help parents monitor and manage their home utility bills
* Sharing personal devices with a work account to emulate multi-login
* And inviting contractors to help manage a webserver
We’d love to hear about how you use Tailscale and sharing! [Email](mailto:support@tailscale.com) or [tweet us](https://twitter.com/tailscale) with any feedback, stories, or questions.
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