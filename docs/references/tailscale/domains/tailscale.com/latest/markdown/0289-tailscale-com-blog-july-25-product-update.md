Tailscale Monthly Update: July 2025
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|productJuly 25, 2025
# This month at Tailscale: Tailnet Lock, Control plane IP changes, and headless Windows runners
We continuously ship updates to make your network more reliable, manageable, and secure. Each month, we highlight some of the most impactful changes across clients, admin tools, integrations, and infrastructure—so you can stay on top of what’s new and what’s better.
This month's updates include the general availability of [Tailnet Lock](https://tailscale.com/blog/tailnet-lock-ga), a shift and simplification in Tailscale's control-plane domains, and a fix to GitHub Actions on headless Windows runners. For instructions on how to update to the latest version, visit our [update guide](https://tailscale.com/kb/1067/update).
## [Tailnet Lock is generally available](#tailnet-lock-is-generally-available)
Tailnet Lock, [first introduced in December 2022](https://tailscale.com/blog/tailnet-lock), provides even more security and control for your tailnet by allowing you to take over control of signing nodes and keys. With Tailnet Lock, you can use Tailscale without having to trust Tailscale. After testing with thousands of tailnets, [Tailnet Lock is now ready for production use](https://tailscale.com/blog/tailnet-lock-ga).
Tailnet Lock uses a Trust On First Use (TOFU) model, letting you create your signing nodes and disablement secrets, then removing Tailscale's role from signing on new nodes to your tailnet. It's up to you whether you share a disablement secret with Tailscale's support team, offering a way to disable Tailnet Lock in case of emergency. Since Tailnet Lock's announcement, we've also added safeguards against removing all signing nodes, and included webhook events to help with node signing, alerts, and audits.
You can read more on how Tailnet Lock works in our [whitepaper](https://tailscale.com/kb/1230/tailnet-lock-whitepaper) and get started with it [using our documentation](https://tailscale.com/kb/1226/tailnet-lock).
## [Changes to Tailscale's control plane IP ranges](#changes-to-tailscales-control-plane-ip-ranges)
Tailscale does not typically require firewall rule changes to function. But if IP-based firewall rules are necessary, Tailscale can be managed with the IPv4 range `192.200.0.0/24` and the IPv6 range `2606:B740:49::/48` . More information is available in [our docs on firewall ports](https://tailscale.com/kb/1082/firewall-ports).
## [GitHub Action fix for headless Windows runners](#github-action-fix-for-headless-windows-runners)
Windows-based [runners](https://docs.github.com/en/actions/about-github-actions/understanding-github-actions#runners) without a graphical interface would fail to run the [Tailscale GitHub Action](https://tailscale.com/kb/1276/tailscale-github-action) on some systems, due to a missing `--unattended` argument to enable [unattended mode](https://tailscale.com/kb/1088/run-unattended).
## [Client updates](#client-updates)
### [**Tailscale v1.84.3 (June 26)**](#tailscale-v1843-june-26)
* Android TV: Internal issue fix; exclusive release for Android TV.## [Docker, Kubernetes, and `tsrecorder` updates](#docker-kubernetes-and-tsrecorder-updates)
### [**Docker image v1.84.3**](#docker-image-v1843)
* Library updates only### [**Kubernetes operator v1.84.3**](#kubernetes-operator-v1843)
* Fixes High Availability (HA) Ingress proxy startup issue with issuing TLS certificates### [**tsrecorder v1.84.3**](#tsrecorder-v1843)
* Library updates only
That's everything for this month. If you have questions or feedback, [we're here to help](https://tailscale.com/contact/support). Thank you for using Tailscale.
Share
Author
Kevin Purdy
Author
Kevin Purdy
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