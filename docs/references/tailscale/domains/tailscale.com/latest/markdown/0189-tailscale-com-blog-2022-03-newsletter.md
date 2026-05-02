March Tailscale newsletter
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|April 06, 2022
# March Tailscale newsletter
>
> 👉 If you’d like to be a part of our new User Experience research
[> please fill out this short form and we’ll be in touch
](https://docs.google.com/forms/d/e/1FAIpQLSehTR9iPZOxQJPQ7cPj91Q-Y35MCnUuhKMqoaEcD_BjnsiGPQ/viewform)> . (And yes, if you participate we’ll send you some Tailscale swag.)
>
We took a brief break from your inbox at the end of February. But we’re back to making the Internet a bit more human and sharing some of the meaningful contributions from our community that help make that possible.
Let’s jump in:
### Around the internet
* [**Use Tailscale to connect to your Synology NAS remotely**](https://www.androidcentral.com/accessories/how-to-securely-access-your-synology-nas-from-anywhere)
Android Central takes a look at how you can use Tailscale to connect to your Synology NAS remotely.
* [**12 ways to slash your cloud costs**](https://www.infoworld.com/article/3648050/12-ways-to-slash-your-cloud-costs.html)
Peter Wayner from Info World shares how you can cut your cloud bill by 30 + percent including using Tailscale.
* [**Create a VPN Gateway with Tailscale and Pantavisor on a Raspberry Pi 3**](https://pantacor.com/blog/tailscale-gateway-pantavisor/)
Pantacor shares how to configure a Raspberry Pi 3 as a VPN gateway with Tailscale and Pantavisor.
* [**Tailscale named to Enterprise Tech 30 list**](https://www.enterprisetech30.com/#the-list)
Tailscale is honored to be named #2 for early-stage companies in the Enterprise Tech 30, the startups that have the most potential to tectonically shift how enterprises operate for the better.
### What’s new and improved
* [**ACL tags are generally available**](https://tailscale.com/blog/acl-tags-ga/)
What does this mean for you? You can include tags as part of an authentication key, you can tag devices from the admin console, and tags can be owners of other tags. And we’ve further locked down ACL tags, so that authentication is required when re-tagging a device. ACL tags are a free feature, available in all pricing tiers.
* [**Auto approvers for routes and exit nodes**](https://tailscale.com/blog/auto-approvers/)
We’ve introduced the concepts of auto approvers for routes and exit nodes. This lets you specify in your ACL file which users can self-approve routes and exit nodes. You can now set up a subnet router or an exit node with just one CLI command on the device.
* [**Tagged nodes no longer need key renewal**](https://tailscale.com/blog/tagged-key-expiry/)
Tagged devices now have key expiry disabled by default, which means it’s easier than ever to manage servers. You can also enable or disable key expiry on a device [via the admin console](https://tailscale.com/kb/1028/key-expiry/) and [via API](https://github.com/tailscale/tailscale/blob/main/api.md#device-key-post).
* [**Use Caddy to manage Tailscale HTTPS certificates**](https://tailscale.com/blog/caddy/)
With the beta release of Caddy 2.5, Caddy automatically recognizes and uses certificates for your Tailscale network (\*.ts.net), and can use Tailscale’s HTTPS certificate provisioning when spinning up a new service.
### From the team
* [**How our free plan stays free**](https://tailscale.com/blog/free-plan/)
Avery Pennarun walks through how our free plan remains free.
* [**How To Seamlessly Authenticate to Grafana using Tailscale**](https://tailscale.com/blog/grafana-auth/)
If you use Grafana and Tailscale you can now use them together, Xe Iaso explains it all.
* [**A database for 2022**](https://tailscale.com/blog/database-for-2022/)
Our CTO David Crawshaw details our (latest) database migration.
### From the community
* [**The melancholy lure of the overlay network**](https://www.robinsloan.com/lab/bad-hosts/)
[Robin Sloan](https://www.robinsloan.com/about/) is a fiction writer, and his take on “Bad hosts, or: how I learned to stop worrying and love the overlay network” is a must-read.
* [**Tailscale ARM Template**](https://github.com/jjohnston-cpacket/tailscale-arm-template)
[Jayme Johnston](https://github.com/jjohnston-cpacket) built an ARM template with an Azure Portal UI frontend to deploy a Tailscale single node or gateway.
* [**Home Server Hosting Using Tailscale**](https://techulus.xyz/hosting-public-services-on-your-home-server-using-nginx-and-tailscale/)
[Arjun Komath](https://techulus.xyz/author/arjun/) discusses their home server hosting using NGINX and Tailscale without the use of static IP or DDNS.
* [**What is Tailscale?**](https://tech.davidfield.co.uk/what-is-tailscale/)
David Field, a self-described “bloke on the corner of the web”, blogs about Tailscale “because I think it’s a really good idea.” We happen to agree.
* [**Tailscale and Tablo**](https://jackpal.github.io/2022/02/13/Tailscale_and_Tablo.html)
Twitter member [@palevich](https://twitter.com/palevich) was able to co-watch the Superbowl with his son, who’s 1400 miles away at college, thanks to Tailscale and Tablo.
* [**Install Nextcloud on WSL2 and access anywhere with Tailscale**](https://snippets.page/posts/install-nextcloud-wsl2-tailscale/)
This guide lays out how to make Nextcloud accessible over Tailscale, assuming you have Ubuntu installed on WSL2.
* [**Accéder à Red Hat CodeReady Containers dans Azure depuis Tailscale …**](https://dev.to/deep75/acceder-a-red-hat-codeready-containers-dans-azure-depuis-tailscale--37k) [French]
A deep dive on Red Hat CodeReady Containers with Azure and Tailscale.
* [**Tailscale on NetBSD—Proof of Concept**](https://artemis.sh/2022/02/16/tailscale-on-netbsd-proof-of-concept.html)
Twitter member [@EverfreeArtemis](https://twitter.com/EverfreeArtemis) is currently working on porting Tailscale is currently working on porting Tailscale to NetBSD.
* [**Using a Jump Desktop RDC with a ssh-tunnel over Tailscale**](https://github.com/mmartial/unraid-study/blob/main/rdesktop-JD-ssh-Tailscale.md)
[Martial Michel](https://github.com/mmartial) shares how to create a localhost-only Linux Desktop in a container on Unraid accessed over a non-root ssh tunnel and adding Tailscale to add a zero-configuration VPN over WireGuard.
* [**Run a Tailscale VPN relay on ECS/Fargate**](https://platformers.dev/log/2022-02-22-tailscale-ecs/)
David Norton describes “how we used Tailscale and ECS to help our client build an inexpensive, simple VPN solution.”
* [**Create your free personal VPN using Tailscale**](https://dev.to/thewraven/oracle-cloud-free-tier-create-your-free-personal-vpn-using-tailscale-4dbm)
[Juan Carlos García Martínez](https://dev.to/thewraven) details how to create your personal VPN for free using Tailscale and Oracle Cloud.
* [**Manage your Tailscale device tags via Terraform**](https://github.com/davidsbond/terraform-provider-tailscale/releases/tag/v0.8.0)
[David S Bond](https://twitter.com/David_S_Bond) updates the Tailscale Terraform provider so that you can manage your Tailscale device tags.
* [**Jellyfin and Tailscale**](https://mediahost.weebly.com/blog/tailscale-jellyfin-secure-remote-access-with-no-reverse-proxy-no-router-settings-no-port-hassles)
Access your Jellyfin media server simply and securely from anywhere with Tailscale.
* [**SASE networking and Tailscale**](https://barnes.tech/blog/tailscale/)
Barnes.tech blog features a post on SASE networking and Tailscale.
* [**CodeReady Containers Everywhere and Anywhere with Tailscale**](https://evanshortiss.com/crc-tailscale)
[Evan Shortiss](https://evanshortiss.com/) describes using Tailscale to securely access the OpenShift cluster deployed in their home network from anywhere in the world.
* [**Ubuntu and Tailscale**](https://medium.com/@antongslismith/bare-metal-cloud-provisioning-from-gcp-de4b65747de)
[Anton Gisli Smith](https://medium.com/@antongslismith) on installing Ubuntu 17,000 km away using MAAS, VxLan and Tailscale.
We’d love to hear your thoughts on Tailscale. Filling out this feedback form helps us build a better product for you: [https://forms.gle/FA9UJwiTbdoRzKsK7](https://forms.gle/FA9UJwiTbdoRzKsK7)
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