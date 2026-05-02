Tailscale Monthly Update: June 2025
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|productJune 23, 2025
# This month at Tailscale: Grants, App Connectors, and updates across the stack
We continuously ship updates to make your network more reliable, manageable, and secure. Each month, we highlight some of the most impactful changes across clients, admin tools, integrations, and infrastructure — so you can stay on top of what’s new and what’s better.
June was a full month at Tailscale. We made [grants](https://tailscale.com/blog/grants-ga) and [app connectors](https://tailscale.com/kb/1281/app-connectors) generally available, made some refinements and optimizations to the Tailscale admin console, and released updates across the client apps for Docker image, [Kubernetes operator](https://tailscale.com/kb/1236/kubernetes-operator), and [`tsrecorder`](https://tailscale.com/kb/1246/tailscale-ssh-session-recording). For instructions on how to update to the latest version, visit our [update guide](https://tailscale.com/kb/1067/update).
### [Grants are now generally available](#grants-are-now-generally-available)
[Grants](https://tailscale.com/blog/grants-ga) are now available to everyone, providing unified access controls across the network and application layers. Grants are a superset of our original ACLs — anything you can write as an ACL can be expressed as a grant.
Grants bring several syntax improvements over our older ACL format, making it easier to write and read policies. We’ve also introduced **application capabilities** in grants, which allow you to unify app-level permissions alongside the traditional network-level access controls.
New tailnets and any tailnet policy file that has never been edited will now use the `grants` syntax by default. This change maintains existing permissions while making policies easier to manage.
We also introduced support for the `via` keyword. It lets you control traffic routing between users and resources, such as through exit nodes, subnet routers, or app connectors.
For more information on grants and how they work with current ACL setups, please see the [grants documentation](https://tailscale.com/kb/1324/grants).
### [App connectors are generally available](#app-connectors-are-generally-available)
[App connectors](https://tailscale.com/kb/1281/app-connectors) let you securely route traffic to external apps—like SaaS or third-party services—over your Tailscale network. Now generally available, app connectors offer connectivity for all applications, replace fragile cloud gateways, and modernize your VPN architecture. To learn more about app connectors, read more at our documentation [here](https://tailscale.com/kb/1281/app-connectors).
### [Client updates](#client-updates)
#### [Tailscale v1.84.2 (June 9)](#tailscale-v1842-june-9)
* Windows: Now signed with a new code signing certificate.
* Docker: Fixed an issue with `--accept-dns` in `TS\_EXTRA\_ARGS` introduced in v1.84.0.#### [Tailscale v1.84.1 (May 29)](#tailscale-v1841-may-29)
* macOS: Fixed DNS issues when switching networks.
* iOS: Added a setting for subnet routing and fixed Taildrop notification bugs.
* Android: Resolved subnet routing defaults and improved UI for directory access prompts. Also fixed display of Mullvad nodes.### [Docker, Kubernetes, and `tsrecorder` updates](#docker-kubernetes-and-tsrecorder-updates)
#### [Docker image v1.84.2](#docker-image-v1842)
Restores support for `--accept-dns` using `TS\_EXTRA\_ARGS`. Available on Docker Hub and GitHub Packages.
#### [Kubernetes operator v1.84.2](#kubernetes-operator-v1842)
Now lets you specify the protocol for services behind high-availability Ingress setups. This improves configuration clarity for multi-cluster deployments.
#### [tsrecorder v1.84.2](#tsrecorder-v1842)
Includes library updates only. No changes to functionality, but staying current is recommended.
### [In case you missed it: Tailscale v1.84.0](#in-case-you-missed-it-tailscale-v1840)
Released in late May, v1.84.0 introduced Always On mode for Windows, macOS, and iOS. It also improved DNS-over-TCP fallback, added a `ReconnectAfter` policy, and tightened CLI argument validation. You can review the full release notes for more details.
That’s everything for this month. If you have questions or feedback, [we’re here to help](https://tailscale.com/contact/support). Thanks for using Tailscale!
Share
Author
Natasha Sawires
Author
Natasha Sawires
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