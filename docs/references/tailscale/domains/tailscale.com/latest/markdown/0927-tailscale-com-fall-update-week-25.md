Fall Update Week 2025
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
Fall Update Week
Simpler, smarter, more connected
We’re making secure networking boring (in the good way) across people, services, and the glue code in-between.
[
See what's new
](/fall-update-week-25#features)[
Get started
](/fall-update-week-25#start)
## Effortless tailnet administration
Simplify policy management and securely scale with independent team environments.
### Visual policy editor
Tailscale lets you manage your tailnet’s access permissions, including which users are allowed to connect to which machines, using our powerful HuJSON (JSON for Humans) policy file. However, there may be times you prefer to use web forms instead of working with HuJSON directly. We've made this possible with our new visual policy editor. The visual policy editor gives you a tabular view of each section of your policy file, and allows you to add, edit, and delete individual policy entries using visual forms.
[
Learn more
](/blog/visual-editor-ga?utm_source=lp&amp;utm_medium=content&amp;utm_campaign=fall-update-2025)
### Multiple tailnets (alpha)
Organizations can now create and manage more than one tailnet, all backed by the same identity provider. But as some teams and products grow, they start to need more separation between tailnets, whether that's for testing new features, running development environments, or managing connectivity for their own customers. Now you can get that separation without setting up a new organization or identity system. It’s the same Tailscale experience, with more flexibility when you need it.
[
Learn more
](/blog/multiple-tailnets-alpha?utm_source=lp&amp;utm_medium=content&amp;utm_campaign=fall-update-2025)
## Secure service connectivity
Securely connect internal services and cloud workloads with granular controls.
### Tailscale Services (beta)
Services allow you to assign virtual tailscale IPv4 and IPv6 address pairs (TailVIPs) to any logical resource in their network, as long as it is reachable by a Tailscale client. Services get a unique human-readable MagicDNS name for ease of reference. Services are a unit of policy on which you can grant access. Maintaining services is entirely automatable via API.
[
Learn more
](/blog/services-beta?utm_source=lp&amp;utm_medium=content&amp;utm_campaign=fall-update-2025)
### Workload identity federation (beta)
Workload identity federation is a better way for your infrastructure and CI/CD systems to securely authenticate to Tailscale without managing long-lived API keys, auth keys, or OAuth clients. It allows cloud-hosted infrastructure in providers like AWS Azure, Google Cloud, or GitHub Actions to authenticate to your tailnet with ephemeral, scoped OIDC-based tokens.
[
Learn more
](/blog/workload-identity-beta?utm_source=lp&amp;utm_medium=content&amp;utm_campaign=fall-update-2025)
## Seamless end-user experience
Optimize connectivity with fast, private relays and boost efficiency with a windowed client.
### Tailscale Peer Relays (beta)
Tailscale Peer Relays provides a customer-deployed and managed traffic relaying mechanism. By advertising itself as a peer relay, a Tailscale node can relay traffic for any peer nodes on the tailnet, even for traffic bound to itself. Peer relays can only relay traffic for nodes on your tailnet (unless you share them), and only for nodes that have access to the peer relay.
[
Learn more
](/blog/peer-relays-beta?utm_source=lp&amp;utm_medium=content&amp;utm_campaign=fall-update-2025)
### Windowed desktop client (macOS)
We're introducing a new macOS UI: a windowed app that gives us the real estate to provide things like search, better error handling, debugging, and feature discovery. The windowed app runs alongside the menu bar app, which is here to stay. This new UI is currently available on macOS for Tailscale v1.88 and later.
[
Learn more
](/blog/windowed-macos-ui-beta?utm_source=lp&amp;utm_medium=content&amp;utm_campaign=fall-update-2025)
## A platform built for seamless, secure connectivity
Enable secure, zero-click login for any app and identity-aware access for any web service.
### Tsidp
We built a lightweight identity provider that's Tailscale-aware, and you can too. With tsnet, application capability grants, and Funnel, it's possible to quickly build and configure secure applications that work both inside and outside of a tailnet.
[
Learn more
](/blog/building-tsidp?utm_source=lp&amp;utm_medium=content&amp;utm_campaign=fall-update-2025)
### App capabilities
Tailscale’s identity-based access controls allow for building powerful, secure applications on entirely private tailnets. You can already leverage user identity with our Go-based tsnet. Now we’re taking that a significant step further with app capabilities. With the latest version of Tailscale’s serve function, third-party applications can accept grants through standard HTTP headers, in whatever language suits your needs.
[
Learn more
](/blog/app-capabilities?utm_source=lp&amp;utm_medium=content&amp;utm_campaign=fall-update-2025)
## Ready to dive in?
Your tailnet is about to get so much better.
### Visual policy editor
An alternative way to edit the human JSON syntax of the tailnet policy file with an interactive graphical user interface.
[
Get started
](https://tailscale.com/kb/1550/visual-editor/?utm_source=lp&amp;utm_medium=content&amp;utm_campaign=fall-update-2025)
### Multiple tailnets (alpha)
Tailscale allows multiple tailnets to be created under a single organization, using a common identity provider and domain.
[
Get started
](http://tailscale.com/kb/1509/multiple-tailnets/?utm_source=lp&amp;utm_medium=content&amp;utm_campaign=fall-update-2025)
### Tailscale Services
A streamlined, secure alternative to traditional load balancers.
[
Get started
](https://tailscale.com/kb/1552/tailscale-services/?utm_source=lp&amp;utm_medium=content&amp;utm_campaign=fall-update-2025)
### Workload identity federation (beta)
A better way for your infrastructure and CI/CD systems to securely authenticate to Tailscale.
[
Get started
](https://tailscale.com/kb/1581/workload-identity-federation/?utm_source=lp&amp;utm_medium=content&amp;utm_campaign=fall-update-2025)
### Tailscale Peer Relays (beta)
A customer-deployed and managed traffic relaying mechanism.
[
Get started
](https://tailscale.com/kb/1591/peer-relays/?utm_source=lp&amp;utm_medium=content&amp;utm_campaign=fall-update-2025)
### Windowed desktop client (macOS)
A windowed app to provide things like search, better error handling, debugging, and feature discovery.
[
Get started
](https://login.tailscale.com/admin/settings/general/?utm_source=lp&amp;utm_medium=content&amp;utm_campaign=fall-update-2025)
### Tsidp
Quickly build and configure secure applications that work both inside and outside of a tailnet.
[
Get started
](https://github.com/tailscale/tsidp)
### App capabilities
Third-party applications can now accept grants through standard HTTP headers, in whatever language suits your needs.
[
Get started
](https://tailscale.com/kb/1312/serve?utm_source=lp&amp;utm_medium=content&amp;utm_campaign=fall-update-2025#app-capabilities-header)
## Try Tailscale for free
[
Get started
](https://login.tailscale.com/start)
Schedule a demo
[
Contact sales
](/contact/sales)