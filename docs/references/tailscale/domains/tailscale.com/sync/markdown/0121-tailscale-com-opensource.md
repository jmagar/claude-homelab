Open source at Tailscale · Tailscale
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
## Open source at Tailscale
We believe that open source is the past, present, and future of software development. When a Tailscalar, or anyone else, contributes to open source code, it benefits everyone.
## [Developing in the open](#developing-in-the-open)
[Tailscale is largely open source](https://github.com/tailscale/tailscale) and consists of the following elements:
1. The client, which runs on each of a user’s devices, is mostly open source. The [core client code for the Tailscale daemon](https://github.com/tailscale/tailscale) used across all platforms is open source, and the full client code is open source for platforms that are also open source.
2. We enthusiastically support open source operating systems such as [Linux](https://github.com/tailscale/tailscale) and [Android](https://github.com/tailscale/tailscale-android), and we believe in directing time and energy to support the communities around these platforms. As a result, where the operating system is open source, the daemon and GUI are open source; and where the operating system is closed, the daemon is open source and the GUI is closed source.
3. This means that you can build the Linux and Android clients yourself, and you can build the Windows and [macOS](https://github.com/tailscale/tailscale/wiki/Tailscaled-on-macOS) clients without the GUI.
4. Open source [Designated Encrypted Relay for Packets](https://pkg.go.dev/tailscale.com/derp) (DERP) relay servers. You might [self-host your own DERP server](https://tailscale.com/kb/1118/custom-derp-servers#reasons-to-run-a-custom-derp-server) for latency or compliance reasons.
5. A closed source coordination server.### [Why bother making any part of Tailscale open source?](#why-bother-making-any-part-of-tailscale-open-source)
* **To improve trust and transparency. **Anyone can review our code and see how Tailscale really works. We hope this increases your trust in using Tailscale.
* **To share what we’ve learned.** When we started Tailscale, mesh overlay networking was complex to set up and use, where it existed at all. By working in the open, we’ve helped lead a shift in considering what’s possible and how approachable it can be.
* **To allow for adaptability.** We understand the desire not to be locked into a specific provider.
* **To make it easier to get feedback.** By keeping our [issues](https://github.com/tailscale/tailscale/issues) and [feature requests](https://github.com/tailscale/tailscale/issues?q=is:issue+is:open+label:fr) public, you can upvote them (with emojis please!) or submit new requests, and we can prioritize what’s really needed for our users right now.
If you’d like to contribute to Tailscale, then by all means do! Please follow our [contribution guidelines](https://github.com/tailscale/tailscale#contributing) and our [code of conduct](https://github.com/tailscale/tailscale/blob/main/CODE_OF_CONDUCT.md). [We appreciate it.](https://tailscale.com/blog/code-thanksgiving/)
### [Financial support for open source projects and maintainers](#financial-support-for-open-source-projects-and-maintainers)
[Tailscale donates annually to WireGuard®](https://www.wireguard.com/donations/). Tailscale is built on [WireGuard®](https://www.wireguard.com/), specifically wireguard-go. As we develop Tailscale and add new functionality, we also upstream those changes to help other users of the project.
Tailscale also supports [several other projects and maintainers we depend on](https://github.com/orgs/tailscale/sponsoring), as well as [Let’s Encrypt](https://letsencrypt.org/), which we use to [issue TLS certificates](https://tailscale.com/kb/1153/enabling-https/).
### [Contributing to open source](#contributing-to-open-source)
Tailscale open sources internal projects that other organizations might benefit from, such as:
* [depaware](https://github.com/tailscale/depaware), for tracking your Go dependencies.
* [ToBeReviewed bot](https://github.com/tailscale/ToBeReviewedBot), for auditing emergency production changes.
* Our [internal security policies](https://github.com/tailscale/security-policies), for reference when developing your own security policies.
When a project originally developed by the community becomes critical to our users, if the maintainers are willing, we adopt the project and take responsibility for ongoing support and development. For example, this is what happened with the Tailscale [Synology package](https://tailscale.com/kb/1131/synology/) (thanks Guilherme de Maio!) and [Terraform provider](https://tailscale.com/kb/1210/terraform-provider/) (thanks David Bond!).
Tailscalars are also encouraged to contribute to other open source projects they rely on as part of their jobs, or that they feel passionate about. Tailscalars contribute to the Go project and community, NixOS, and more.
### [Encouraging Headscale](#encouraging-headscale)
[Headscale](https://github.com/juanfont/headscale) is an open source alternative to the Tailscale coordination server and can be self-hosted for a single tailnet. Headscale is a re-implemented version of the Tailscale coordination server, developed independently and completely separate from Tailscale.
Headscale is a project that complements Tailscale — with its own independent community of users and developers. Tailscale does not set Headscale’s product direction or manage the community, and neither prohibits nor requires employees from contributing to Headscale.
Our opinion is that Headscale provides a valuable complement to Tailscale: It helps personal users better understand both how Tailscale works and how to run a coordination server at home. As such, Tailscale works with Headscale maintainers when making changes to Tailscale clients that might affect how the Headscale coordination server works, to ensure ongoing compatibility.
### [Providing Tailscale to open source projects](#providing-tailscale-to-open-source-projects)
[Tailscale is free for open source projects](https://tailscale.com/blog/community-github-pricing/). With the [Community on GitHub plan](https://tailscale.com/kb/1154/free-plans-discounts/#community-on-github), you can use Tailscale for your project to access and share project resources, like a build tool or a test server. Any open source project with an [OSI license](https://opensource.org/licenses/) can use this plan. Currently, this plan requires using GitHub for authentication.
## [FAQs](#faqs)
### Is Tailscale open source?
Mostly. Tailscale daemon client code is open source. Where the operating system is open source, the daemon and GUI are open source, and where the operating system is closed, the daemon is open source and the GUI is closed source.
Tailscale’s DERP server code is also open source. This lets you verify and build these components yourself. Tailscale’s coordination server is closed source. If you want to run your own coordination server at home, check out [Headscale](https://github.com/juanfont/headscale).
### How do I contribute to Tailscale?
You can contribute code, bug reports, and feature requests to [Tailscale on GitHub](https://github.com/tailscale/tailscale). Please follow our [contribution guidelines](https://github.com/tailscale/tailscale#contributing) and our [code of conduct](https://github.com/tailscale/tailscale/blob/main/CODE_OF_CONDUCT.md).
### What is Headscale? Is it run by Tailscale?
[Headscale](https://github.com/juanfont/headscale) is an open source coordination server for Tailscale clients. It is independent from Tailscale.
### How does Tailscale decide which projects and maintainers to support financially?
Tailscale strives to sponsor open source projects that are critical to our product. Eligible projects must have an [OSI-approved license](https://opensource.org/licenses), code of conduct, and a way to be sponsored, such as GitHub Sponsors or Open Collective. We prefer to sponsor projects rather than individuals, and we don’t typically consider projects that are primarily commercial or corporate-backed. We may not financially support a project that we already support in other ways.
### How does Tailscale decide how much to sponsor?
We’re still trying to figure out when, and how much, we should support projects financially, and don’t yet support all the projects we’d like to. We aim to sponsor projects and individuals at a level equal to a few hours of work per month.
### Why does my account say “Thanks!” on it?
We value open source contributions and the maintainers we rely on. If you’ve contributed to Tailscale or a project we rely on, [we’re saying thanks with a free Personal Pro account](https://tailscale.com/blog/code-thanksgiving/). You should see a heart over your profile in your Tailscale account. (If you should have one and it’s not there, [let us know](https://tailscale.com/contact/support/).)