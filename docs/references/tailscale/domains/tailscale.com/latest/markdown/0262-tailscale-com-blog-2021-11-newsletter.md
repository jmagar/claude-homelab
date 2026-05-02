November Tailscale newsletter
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|November 25, 2021
# November Tailscale newsletter
>
> 👉 We’d love to hear your thoughts on Tailscale. Filling out
[> this feedback form
](https://forms.gle/FA9UJwiTbdoRzKsK7)> helps us build a better product for you.
>
This Thanksgiving, we are thankful for all the people whose code we
build upon. As a small gesture of gratitude, we’re
[giving out free Personal Pro accounts](/blog/code-thanksgiving/)
to people who’ve contributed to Tailscale’s
repos or to code that Tailscale depends on. If you think that is you -
[please let us know](/contact/support)!
November brought fascinating community contributions, including [creating private Among Us game servers](https://arun.be/2021/11/04/private-among-us-games-on-the-tailscale-network/) and [Tailscale on a Kobo Sage e-reader](https://dstaley.com/posts/tailscale-on-kobo-sage/). Let’s jump in:
### From the community
* [**Synology NAS に Tailscale を設定する | Set Tailscale on Synology NAS**](https://text.baldanders.info/remark/2021/10/tailscale-with-synology-nas/) (Japanese)
Twitter user [@spiegel\_2007](https://twitter.com/spiegel_2007) gives a detailed Japanese-language tutorial on installing Tailscale on their Synology NAS.
* [**Private Among Us games on the Tailscale network**](https://arun.be/2021/11/04/private-among-us-games-on-the-tailscale-network/)
Learn how to set up private Among Us games using Impostor and Tailscale. This enables you to host custom games without depending on the official servers.
* [**Free, private pi-hole hosting with Fly.io and Tailscale**](https://arun.be/2021/11/22/private-pi-hole-hosting-fly-tailscale/)
A short explainer on how to lock down a cloud-hosted pi-hole.
* [**Tailscale tsk**](https://github.com/adamgoose/tsk)
GitHub community member Adam Engebretson shares how to quickly connect to your Kubernetes Cluster with Tailscale (using Pulumi)
* [**Tipi di VPN: quali sono e come crearli con WireGuard e Tailscale | Types of VPNs: what they are and how to create them with WireGuard and Tailscale**](https://www.ilsoftware.it/articoli.asp?tag=Tipi-di-VPN-quali-sono-e-come-crearli-con-WireGuard-e-Tailscale_23717) (Italian)
Michele Nasi at Il Software explores what types of VPNs can be used and how to make any devices communicate directly.
* [**tsnet package on GoKrazy**](https://github.com/tailscale/tailscale/pull/3275)
If you want to make a program listen on Tailscale without listening on any other network interface, you can use the GoKrazy package. Thanks to [Michael Stapelberg](https://twitter.com/zekjur) for making this possible.
* [**Building a secure remote access setup using Tailscale**](https://jussiroine.com/2021/11/building-a-secure-remote-access-setup-using-tailscale/)
Jussi Roine rebuilds his home network with Tailscale.
* [**Self Hosted Show Ep. 054: Ultimate Off-Site Setup**](https://notes.jupiterbroadcasting.com/self-hosted/2021/episode-054/) [Audio, English]
Alex Kretzschmar and Chris Fisher build two ultimate self-hosted off-site servers and take a deep-dive into all the networking, hardware, and software that make it possible.
* [**Oxide Rust interface for Tailscale APIs**](https://github.com/oxidecomputer/cio/tree/master/tailscale)
Oxide Computer’s Rust interface for Tailscale APIs.
* [**Implementing Tailscale at HostiFi**](https://blog.rchase.com/tailscale/)
Reilly Chase, the CEO at HostiFi, walks through their VPN decision-making process and the benefits for a company with 2k VPS instances on Vultr and a global remote workforce.
* [**Using Tailscale with an Azure Linux VM and Terraform**](https://www.merrell.dev/using-tailscale-with-an-azure-linux-vm-and-terraform/)
Sam Merrell automates the process of getting an Azure VM created and added to their Tailscale network using Terraform.
* [**A TCP proxy used to expose services onto a Tailscale network without root**](https://golangexample.com/a-tcp-proxy-used-to-expose-services-onto-a-tailscale-network-without-root/)
Mark Pashmfouroush built a TCP proxy to expose services onto a Tailscale network without root.
* [**A Raycast extension to interact with Tailscale**](https://twitter.com/faultables/status/1462762826037035013)
[Faultable](https://github.com/faultable) built a Raycast extension that shows the devices on your tailnet.
* [**Fedora CoreOS with Tailscale**](https://gitlab.com/mwiget/lab/-/tree/master/fedora-coreos-tailscale)
[Marcel Wiget](https://twitter.com/MarcelWiget) needed a VM on ESXi with Tailscale. So they built an Ignition file that contains setting up a sudo enabled user account, installs Tailscale, mosh and tmux.
* [**Tailscale on Kobo Sage**](https://dstaley.com/posts/tailscale-on-kobo-sage/)
[Dylan Staley](https://twitter.com/dstaley) did, what we believe was a first, and installed Tailscale on his Kobo Sage e-reader. “It’s basically a rite of passage for Tailscale users to put Tailscale on the weirdest device they own.”
* [**TinyPilot + Tailscale — Access Your Device From Anywhere**](https://www.youtube.com/watch?v=hG4qoD53LVE) [Video, English]
A video tutorial of using TinyPilot + Tailscale for easy, secure remote access.
Want to be highlighted in our newsletter? Tag us [on Twitter](https://twitter.com/tailscale) with your tutorials, guides, or rants.
### From Tailscale
* [**Manage access to the admin console with Network admin, IT admin, and Auditor roles**](/blog/admin-roles/)
We’ve added more user roles to make it easier to manage access to your network. Now, in addition to your tailnet Owner, Admins, and Members, you can give users the roles of Network admin, IT admin, and Auditor. This lets users access the admin console without the full permissions of an Admin.
* [**Thanks for all the code!**](/blog/code-thanksgiving/)
As we called out at the top of the newsletter, we are incredibly grateful to our community. If you log in to the Tailscale admin console and you’re on our list, a “Thanks!” heart will appear in the top right corner, letting you upgrade to Personal Pro for free. If you’re either the creator of or a past or current notable contributor to code we use, please [contact us](/contact/support/) with details and we’ll update our list and make sure the Gmail or GitHub account you want to use with Tailscale is on our list.
### What we’ve been working on
**Tailscale 1.18**
Tailscale 1.18 arrived this week and is available on all clients (see our [update instructions](/kb/1067/update/)).
This release brings improved UPnP discovery so that eero devices now work, allowing a port to be opened for direct connections. Additionally, `tailscaled` debug server now exports Prometheus metrics at /debug/metrics. There is also a notable update with Synology allowing users to make their NAS an exit node, but are dependent on the Synology release calendar, look for it in 2022.
**Hello, Changelog**
This month we published our Changelog. You can follow along for updates [on our website](/changelog/), [subscribe via RSS](/changelog/index.xml), or follow [@TailscaleDelta](https://twitter.com/TailscaleDelta) on Twitter.
**New Support Hub**
We’ve built a new support hub with the aim to make things easier to get the answers you need. [https://tailscale.com/contact/support/](https://tailscale.com/contact/support/)
**New Company Page**
Curious about the people behind your favorite software? Wonder no more! We’ve unveiled [a new company page](/company/). A lot of thoughtful effort this month went into defining our vision, mission, guiding principles, and our commitments.
**Okta Integration Network**
Tailscale is now in the [Okta Integration Network](https://www.okta.com/integrations/tailscale/#overview)! This means getting Okta for your org as an SSO is a more streamlined and less manual process. You can select Tailscale from the Zero-Trust Ecosystem or Security marketplace categories. Watch this space as this is the first of many improvements with our Okta integration.
That’s all for now — stay well! And for those in the US — have a happy Thanksgiving!
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