October Tailscale newsletter
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|October 29, 2021
# October Tailscale newsletter
>
> 👉 We’d love to hear your thoughts on Tailscale. Filling out
[> this feedback form
](https://forms.gle/FA9UJwiTbdoRzKsK7)> helps us build a better product for you.
>
It’s been another productive month for the team here at Tailscale. We’ve got a slew of amazing community contributions, including a [powershell based updater for Windows](https://github.com/NeedsCoffee/Tailscale-Updater-Windows) by Nick Clark and a video tutorial by Sauber-Lab UK on installing [Tailscale on Home Assistant](https://www.youtube.com/watch?v=na3Zuz9pwWk). Let’s jump in:
### From the community
* [**Ansible Install Dockpack**](https://galaxy.ansible.com/dockpack/base_tailscale)
Bas Meijer created an Ansible role to install Tailscale on several platforms.
* [**Let’s install Tailscale in Home Assistant [Video]**](https://www.youtube.com/watch?v=na3Zuz9pwWk)
In this video, they demonstrate step by step how to install Tailscale in Home Assistant. “It’s so simple it’s almost pointless to make this video.”
* [**Map DNS**](https://github.com/bahlo/mapdns)
[Arne Bahlo](https://twitter.com/arnebahlo) built a super simple DNS server that allows an internal domain resolve to either the VPN or local lP. A DNS server that’s configured with a static JSON file.
* [**Setting up a Remote Dev Environment When You’re a Cloud Skeptic**](https://blog.tilt.dev/2021/10/11/old-school-remote-dev-clusters.html)
Nick Santos uses Tailscale and Kind to duct tape together a dev environment.
* [**Tailscale-systray**](https://github.com/mattn/tailscale-systray)
GitHub user [mattn](https://github.com/mattn) created a Linux port of tailscale system tray menu.
* [**Expose web services at home via Tailscale for fun**](https://init8.lol/expose-web-services-at-home-via-tailscale-for-fun/)
[@faultables](https://twitter.com/faultables) shares how to expose web services via Tailscale, which generally talks about Reverse Proxy as a Service™ using the Fly.io platform (and network).
* [**Tailscale Updater Windows**](https://github.com/NeedsCoffee/Tailscale-Updater-Windows)
Nick Clark built a powershell based updater for Windows. It’s pretty neat! It runs as a scheduled task, and checks for new versions daily as well as each time a machine boots up.
* [**Tailscale Terraform Registry**](https://github.com/davidsbond/terraform-provider-tailscale/releases/tag/v0.4.0)
David Bond’s Version 0.4.0 of their Tailscale Terraform provider makes it easy to interact with Tailscale APIs while deploying servers using Terraform. This release adds support for custom DERP servers in your ACL files.
Want to be highlighted in our newsletter? Tag us [on Twitter](https://twitter.com/tailscale) with your tutorials, guides, or rants.
### From Tailscale
* [**Hey linker, can you spare a meg?**](/blog/go-linker/)
A blog on how Tailscale optimized our iOS network extension by changing the Go linker.
* [**Enable device authorization and set key expiry in the admin console**](/blog/authentication-settings/)
We’ve made a few settings easier for you to manage in the admin console: device authorization and key expiry.
* [**You can use Tailscale with Kubernetes, you know**](/blog/kubecon-21/)
Making Tailscale work well with container workloads is something we’ve been working on for a long time. This post details a few of the improvements that make Tailscale and Kubernetes work well together.
* [**Tailscale joins the Synology Package Center**](/blog/tailscale-synology-package/)
Tailscale is officially in the Synology package center. Securely access your
Synology from anywhere in the world, on any device.
* [**Rolling out the red carpet for remote meetings**](/blog/red-carpet/)
Tailscale is fully remote. Making sure everyone gets a chance to speak and be heard in our internal meetings matters. How do we do that? With a virtual red carpet of course!
* [**Tailscale for developers: Connect to your resources from Gitpod**](/blog/gitpod/)
We partnered with Gitpod, and as an added bonus, anyone on a paid plan for Tailscale gets 1-year of Gitpod for free. To redeem, [follow these instructions](https://docs.google.com/forms/d/e/1FAIpQLSfgqYYNgVLUON6rLu2VvBxIHy4Lfd7sq5gV0WvS-2GUflDLaQ/viewform).
* [**Tailscale for developers: Connect to your resources from GitHub Codespaces**](/blog/github-codespaces/)
Access resources on your tailnet from your IDE, or share your development environment with others.
* [**Tailscale for developers: Connect to your resources from Coder**](/blog/coder/)
Coder is a remote coding platform, and now you can officially connect it back to your private dev and prod infrastructure with Tailscale.
### What we’ve been working on
**Tailscale 1.16**
Tailscale 1.16 arrived earlier this month and is available on all clients (see our [update instructions](/kb/1067/update/)).
**Improved container support**
This release brings container support, updates to HTTP and SOCKS5 proxy support, as well as mobile battery life improvements. The expiration of the original Let’s Encrypt certificate in September caused difficulty for a number of operating systems, so Tailscale now includes the current certificate built-in."
We focused a lot of our time this cycle on making Tailscale work better with containers. This release adds support for storing node state as a Kubernetes secret, which means containers no longer need to have separate persistent storage configured in order to save their state, and can instead store it within the Kubernetes infrastructure.
`tailscaled` in userspace-networking mode can now run an HTTP proxy server in addition to the prior SOCKS5 proxy server support.
We continue to work to improve battery performance on mobile devices. Of interest to users with older Android devices, Taildrop is now backward compatible with more Android versions. Even Android 6 can share files quickly and securely with Taildrop.
**Suspend and Restore User**
You can now suspend and restore users in your network. Suspend a user to prevent them from using Tailscale without permanently deleting their devices. Read how [in our docs](/kb/1145/remove-team-members/).
**Device Authorization and Key Expiry**
You can now manage device authorization and key expiry in the admin console.
**IPv4-only Peers and Ephemeral Nodes**
If you previously used [ephemeral nodes](/kb/1111/ephemeral-nodes/) and ran into problems accessing IPv4 addresses from your ephemeral node, good news: Ephemeral nodes, like regular nodes, now get both an IPv4 and IPv6 address.
**Tailscale x Kubernetes Office Hours**
We hosted our first virtual Office Hours event this month. It was really nice to connect with our community and answer questions directly around Kubernetes. If you missed this one and want to get on our mailing list for future Office Hours, [sign up](https://docs.google.com/forms/d/e/1FAIpQLSfAI6y1ydGwDDVnC2h-jHWTyOMkbpNHVEOEjh9mE8hUOK7-0w/viewform?usp=sf_link).
**We’re Hiring!**
We are always on the lookout for great people.
One of the roles we’re hiring for is SIGSUP, a technical support role where being an enthusiastic Tailscale user knowledgeable about the product goes a long way.
If you think you’d be a good fit take a look at our open positions on our [careers page](/careers/).
**More Documentation**
It’s also worth highlighting the work that has gone into documentation this month. Here are a handful of new Knowledge Base articles focused on the cloud:
* [Access Azure Linux VMs privately using Tailscale](/kb/1142/cloud-azure-linux/)
* [Access Azure Windows VMs privately using Tailscale](/kb/1143/cloud-azure-windows/)
* [Access AWS RDS privately using Tailscale](/kb/1141/aws-rds/)
* [Access Google Compute Engine VMs privately using Tailscale](/kb/1147/cloud-gce/)
* [Access Oracle Cloud VMs privately using Tailscale](/kb/1149/cloud-oracle/)
* [Access Hetzner Servers privately using Tailscale](/kb/1150/cloud-hetzner/)
*Phew!* That’s all for now — stay well!
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