May Tailscale newsletter
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|May 28, 2021
# May Tailscale newsletter
>
> 👉 We’d love to hear your thoughts on Tailscale. Filling out this feedback form helps us build a better product for you:
[> https://forms.gle/FA9UJwiTbdoRzKsK7
](https://forms.gle/FA9UJwiTbdoRzKsK7)
>
This has been a busy month, with the launch of [Tailscale v1.8](/blog/tailscale-v1.8/) and a new feature, [Taildrop](/blog/sending-files-with-taildrop/), that lets you easily send files between your devices. Here’s a quick preview before we jump into this month’s update:
#### Community Contributions
* [**Statusbar UI for Tailscale**](https://github.com/muchobien/tailscale-ui) Kevin López and Rodrigo Sanabria built a Tailscale UI for Ubuntu. We think it’s a pretty cool contribution and recommend trying it out.
* [**Using Tailscale and FreeNAS (or TrueNAS CORE) Together**](https://butterwhat.com/2021/05/17/using-tailscale-and-freenas-or-truenas-together.html) Brian Moses (who we feature regularly on this newsletter) walks through installing Tailscale on a server appliance, for folks that have a FreeNAS or TrueNAS.
* [**Build a Raspberry Pi Kubernetes Cluster with k3s, Ansible, and Tailscale**](https://samlinville.com/blog/k3s-cluster/) Sam Linville takes a deep dive into how to build and secure a Raspberry Pi cluster. He shares how to secure cluster nodes with Ansible, connect the nodes to Tailscale, prepare images for Raspberry Pi, and assemble the hardware.
* [**Pi-hole, Unbound & Tailscale**](https://0xmachos.com/2021-05-10-Pi-hole-Unbound-and-Tailscale/) GitHub user [0xmachos](https://github.com/0xmachos) details how to configure a mesh VPN with your own DNS using Unbound, Pi-hole, and Tailscale.
* [**Pat and Brian Discuss How They’re Each Using the Zero-Config Mesh VPN**](https://www.youtube.com/watch?v=2RQxY7KgcFA) Pat Regan and Brian Moses talk about computer networking at home. In particular, the number of different ways that they are each using Tailscale, a zero-configuration mesh VPN to securely access things they’re self-hosting.
* [**Tutorial: Tailscale on AWS with Terraform**](https://mediamachine.io/blog/tailscale-on-aws-with-terraform-tutorial/) The team over at Media Machine demonstrates how to setup Tailscale on AWS with Terraform.
#### From the Tailscale team
* [**Sending Files with Taildrop**](/blog/sending-files-with-taildrop/) Want to share files between all your devices without the cloud? Tailscale now makes this possible with a new alpha feature, Taildrop. Sonia Appasamy explains it all in this knowledge base article turned blog post.
* [**Using GitHub Actions and Tailscale to build and deploy applications securely**](/blog/2021-05-github-actions-and-tailscale/) Naman Sood, our most recent co-op student, explains Tailscale + [Ephemeral nodes](/kb/1111/ephemeral-nodes/) + GitHub Actions, so your CI can have ACLed connections to internal services, no matter where they are.
* [**The long wondrous life of a Tailscale packet**](/blog/2021-05-life-of-a-packet/) This post by Josh Bleecher Snyder tracks a single packet from creation in one process to arrival in another, far away, through an encrypted Tailscale mesh network.
* [**Tailscale v1.8 has arrived!**](/blog/tailscale-v1.8/) A blog post detailing everything shiny and new in v1.8.
### Tailscale v1.8
#### General Fixes and Improvements
We’ve added a long-awaited`tailscale logout`command. We also now allow clients access to an exit node’s public IPs.
The`tailscale up`command now warns when options are being changed by omission. For example, if you used`tailscale up --advertise-route=192.168.0.0/24`and then`tailscale up --advertise-exit-node`, it would notice and warn that the`advertise-route`would be removed.
🐛 We added the `tailscale bugreport` command to add a marker in your logs, along with an optional note. If you run it shortly after a problem occurs (or ideally both before and after reproducing a problem) it will make it easier for[support@tailscale.com](mailto:support@tailscale.com)to find the details in your logs. Note that you still need to send an email or file a bug: the bugreport only adds a known point in the logs so we can work with you to solve it more efficiently.
There was a large effort to improve and address DNS configuration issues and MagicDNS across all platforms. This leads nicely into our work on another new feature…
#### Split DNS
Split DNS lets you set a DNS server that is only used for specific domain names —something users with complicated DNS configs have been asking for. Split DNS enables better control over where DNS requests go, and allows you to apply more advanced policies. For example, you could route DNS queries for your AWS VPC to one server, and queries for your Azure private network to another one, without interfering with regular DNS on your LAN.
Split DNS is complementary to MagicDNS. You can create split DNS configs with and without MagicDNS, and this is now generally available to everyone.
#### Admin Console Updates
The admin UI now has a new “Settings” panel, including[a page for “feature previews”](https://login.tailscale.com/admin/settings/features)letting admins to easily toggle features on and off. Use this page to opt your network into new Tailscale features.
#### Taildrop (alpha)
Taildrop makes it easy to send files between your personal devices on a Tailscale network. Like all traffic sent over Tailscale, Taildrop transfers files over encrypted peer-to-peer connections, using the fastest available path. This makes it a great solution for sending sensitive or large files without third-party servers in the middle.
>
> 📢 This feature is in public alpha, with many planned improvements to the UX and capabilities. To try Taildrop today, you’ll need to&nbsp;
[> opt-in for your network
](/kb/1106/taildrop/)> &nbsp;and use Tailscale v1.8 or later.
>
You can transfer any kind of files with Taildrop. Taildrop is currently limited to sending files between your own personal devices.**You cannot send files to devices owned by other users**even on the same Tailscale network.
**To send a file with Taildrop:**
* **macOS:** Right-click on any file and go to “Share → Tailscale.” The first time you use Taildrop, it might be hidden in the “More…” section.
* **iOS:** Open a photo and tap the Share menu. Choose Tailscale and tap the device you’d like to send files to. The first time you use Taildrop, it might be hidden in the “More…” section of the menu.
* **Windows:** Right-click on any file and choose “Send with Tailscale…”
* **Linux:** Use the [tailscale file subcommand](/kb/1106/taildrop/) to choose which files to send. For example, to send a text file to your phone:`tailscale file cp ./my-file.txt my-phone:`
* **Android:** Coming soon!
### What a month!
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