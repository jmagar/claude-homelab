Shared responsibility model · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Shared responsibility model
Last validated: Jan 5, 2026
Securing a virtual private network requires both the provider and the user to share in the burden of responsibility. This non-exhaustive list covers responsibilities for both Tailscale and the user.
## [Tailscale's responsibilities](#tailscales-responsibilities)
* **Use secure software development practices** for development of the Tailscale client, the coordination server, and relay servers. This includes conducting peer reviews of source code changes, conducting regular audits of source code, reviewing potential vulnerabilities and developing patches, regularly patching dependencies, and building, signing, and releasing software following a sanctioned process.
* **Harden and protect the coordination server**, including hardening the hosting provider and database configurations, and hardening and patching the operating system. This includes encrypting and backing up data by default, restricting access to the production environment based on business need, and monitoring the production environment for unusual activity.
* **Harden and protect the DERP relay servers**, including hardening the hosting provider configurations, and hardening and patching the operating system. This includes restricting access based on business need.
* **Provide features for securing your tailnet**, such as [integrations with identity providers](/docs/integrations/identity) and [access control policies](/docs/features/access-control).
To understand how Tailscale protects your network, refer to the [Security](/security) page.
## [User's responsibilities](#users-responsibilities)
* **Maintain the devices you run Tailscale on**, including patching the firmware and operating system of those devices, and providing network connectivity to those devices.
* **Configure and maintain your identity provider**, so that only authorized users are able to join your network.
* **Update Tailscale clients regularly to supported versions**. On some operating systems (macOS and iOS), clients are automatically updated. Tailscale is responsible for [responding to security issues](/security-bulletins) and providing patches in a timely manner, but it's your responsibility to upgrade to apply these patches.
* **Provide Tailscale with bug reports or logs** when requested for troubleshooting purposes as part of a support request.
* **Configure security features in Tailscale** to restrict access as appropriate for your environment. For example, use access control policies to restrict access to resources in your network, and use groups and tags to make management of users and devices more simple.
To best protect your network, we recommend following the [hardening guide](/docs/reference/best-practices/security).
On this page
* [Tailscale's responsibilities](#tailscales-responsibilities)
* [User's responsibilities](#users-responsibilities)
Scroll to top