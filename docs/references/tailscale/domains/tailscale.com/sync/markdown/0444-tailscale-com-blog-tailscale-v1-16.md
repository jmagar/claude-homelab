Tailscale v1.16: Linux, Windows, and Android clients now available
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|October 12, 2021
# Tailscale v1.16
Tailscale 1.16 is out! The latest Linux, Windows, and Android clients are available today (see our [update instructions](https://tailscale.com/kb/1067/update/)), while macOS and iOS will be available over the next few days, pending App Store reviews.
We break down the work that’s happened in and around the release of Tailscale 1.16.
### Improved container support
This release brings container support, updates to HTTP+SOCKS5 proxy support, as well as mobile battery life improvements. Notably, 1.16 continues to build on [the LetsEncrypt work released in 1.14](https://tailscale.com/blog/tls-certs/).
We focused a lot of our time this cycle on making Tailscale work better with containers. This release adds support for storing node state as a Kubernetes secret, which means containers no longer need to have separate persistent storage configured in order to save their state, and can instead store it within the Kubernetes infrastructure. (Watch this space for more detailed posts on our Kubernetes work.)
`tailscaled` in userspace-networking mode can now run an HTTP proxy server in addition to the prior SOCKS5 proxy server support.
We continue to work to improve battery performance on mobile devices. Of interest to users with older Android devices, Taildrop is now backward compatible with more Android versions. Even Android 6 can share files quickly and securely with Taildrop.
### More documentation
It’s also worth highlighting the work that has gone into documentation. Here are a handful of new Knowledge Base articles focused on the cloud that can help guide you or your team:
* [Access Azure Linux VMs privately using Tailscale](https://tailscale.com/kb/1142/cloud-azure-linux/)
* [Access Azure Windows VMs privately using Tailscale](https://tailscale.com/kb/1143/cloud-azure-windows/)
* [Access AWS RDS privately using Tailscale](https://tailscale.com/kb/1141/aws-rds/)
* [Access Google Compute Engine VMs privately using Tailscale](https://tailscale.com/kb/1147/cloud-gce/)
* [Access Oracle Cloud VMs privately using Tailscale](https://tailscale.com/kb/1149/cloud-oracle/)
* [Access Hetzner Servers privately using Tailscale](https://tailscale.com/kb/1150/cloud-hetzner/)
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