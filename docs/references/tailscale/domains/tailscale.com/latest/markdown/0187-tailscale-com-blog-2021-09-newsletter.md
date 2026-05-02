September Tailscale newsletter
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|September 30, 2021
# September Tailscale newsletter
A new month, a new set of updates! The team has been busy building new features, including HTTPS certificate support and GitHub Marketplace integration. We also launched [free pricing for open source GitHub orgs](/blog/community-github-pricing/). Community members shared [CircleCI integrations](https://blog.threecomma.io/circleci-meet-tailscale), [a custom DERP Docker image](https://github.com/fredliang44/derper-docker), and more. Let’s dive in!
**Windows admins:** to maintain connectivity, please upgrade to Tailscale 1.14.4 or later before updating Windows. [Read how and why the upgrade is needed.](/blog/windows-updates/)
### From the community
* [**Tailscale at DeepSource**](https://deepsource.io/blog/tailscale-at-deepsource/)
How Tailscale made working remotely at DeepSource secure and convenient as they transitioned from OpenVPN.
* [**CircleCI meet Tailscale**](https://blog.threecomma.io/circleci-meet-tailscale)
The folks at Three Comma describe how to easily connect CircleCI to your private Tailscale network.
* [**Scale-out your Raspberry Pi Kubernetes cluster to the cloud**](https://nativecloud.dev/scale-out-your-raspberry-pi-k3s-cluster-to-the-cloud/)
A complete guide on how to scale out your Raspberry-Pi Kubernetes cluster to the cloud using Gardener Machine-Controller-Manager and Tailscale.
* [**Secure remote access to Synology NAS using Tailscale —Getting Started**](https://mwarkentin.medium.com/secure-remote-access-to-synology-nas-using-tailscale-getting-started-6cba7a0dbb7c)
Community member Michael Warkentin details using Tailscale on a Synology NAS for remote access.
* [**Community-built Docker image for Tailscale’s custom DERP server**](https://github.com/fredliang44/derper-docker)
Fred Liang shares a Tailscale docker image for running your own DERP server on GitHub.
* [**The Easiest VPN for Home Assistant —Tailscale Install [video, English]**](https://www.youtube.com/watch?v=5rFWcukwCzU)
This video from the folks at Everything Smart Home walks through setting up Tailscale with Home Assistant so that you can access it no matter where in the world you are.
* [**Build a Swarm cluster on a Tailscale network [Japanese]**](https://blog.bridgey.dev/2021/09/19/docker-swarm-with-tailscale/)
This post from Yusuke presents how to build a Docker Swarm cluster with a Tailscale IP.
* [**Full Circle Weekly News #229 [audio]**](https://fullcirclemagazine.org/podcast/full-circle-weekly-news-229/)
A short weekly podcast on FOSS/Ubuntu/Linux news highlights Headscale, the open source version of Tailscale. Headscale was also [featured on Hacker News](https://news.ycombinator.com/item?id=28572013).
* [**A more secure VPS with SSH via Tailscale**](https://www.keybits.net/blog/a-more-secure-vps-with-ssh-via-tailscale)
Tom Atkins walks through using Tailscale with the VPS websites they serve.
* [**OctoApp Tutorials: Remote access with Tailscale! [video]**](https://www.youtube.com/watch?v=2Ox1JJEEYoU)
This is a simple step-by-step guide to use OctoPrint remotely and securely over the internet with Tailscale.
* [**Host a Dev Environment on Render with VS Code and Tailscale**](https://render.com/blog/host-a-dev-environment-on-render-with-vs-code-and-tailscale)
David Mauskop at Render details building a secure remote dev environment.
Want to be highlighted in our newsletter? Tag us [on Twitter](https://twitter.com/tailscale) with your tutorials, guides, or rants.
### From Tailscale
* [**Even more for free**](/blog/community-github-pricing/)
Tailscale is now officially free for open source projects & friends/family use-cases when using GitHub orgs.
* [**Connect a GitHub Action to your Tailscale network — now in GitHub marketplace!**](/blog/2021-09-github-actions-marketplace/)
Using an ephemeral key, you can connect a runner to an internal server, a private test environment, or a database, secured with Tailscale.
* [**Private DNS with MagicDNS**](/blog/2021-09-private-dns-with-magicdns/)
Brad Fitzpatrick and David Crawshaw detail the current state of DNS security and how to use MagicDNS to create a private DNS setup.
* [**We get stuck opening the socket**](/blog/stuck-opening-the-socket/)
David Crawshaw shares his thoughts on sockets.
* [**Provision TLS certificates for your internal Tailscale services**](/blog/tls-certs/)
We now support automatically obtaining LetsEncrypt TLS certs for devices on your private tailnets, avoiding the need to run an internal CA or manage your own DNS.
* [**Action required: Upgrade Tailscale to 1.14.4+ prior to updating Windows**](/blog/windows-updates/)
For Windows admins, to maintain connectivity, please upgrade to Tailscale 1.14.4 or later before updating Windows.
### New features
**Tailscale + Let’s Encrypt**
Tailscale now makes HTTPS easily available for the machines in your Tailscale network, also known as a tailnet, with certificates provisioned from Let’s Encrypt. Connections were already encrypted by Tailscale, but this lets you get rid of the ugly “insecure” warning displayed by web browsers.
**Tailscale + GitHub Actions**
Our GitHub Action is now available [in the marketplace](https://github.com/marketplace/actions/connect-tailscale)! This means that with the Connect Tailscale action, you can easily pull ‘Connect Tailscale’ into whatever actions you write. Use this to securely deploy your application to internal servers, reach your private test runners for specific platforms, or connect to your database of test data without leaving it exposed on the Internet.
**Tailscale 1.16 coming soon**
We will be releasing Tailscale 1.16 in the coming week — look for Taildrop support on older versions of Android, among other fixes and general improvements.
>
> 👉 We’d love to hear your thoughts on Tailscale. Filling out
[> this feedback form
](https://forms.gle/FA9UJwiTbdoRzKsK7)> helps us build a better product for you.
>
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