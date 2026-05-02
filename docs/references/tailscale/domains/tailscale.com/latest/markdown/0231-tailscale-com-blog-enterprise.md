Tailscale Enterprise: Advanced Security, Compliance & Support
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|April 18, 2023
# Announcing Tailscale Enterprise: Advanced Security, Compliance & Support
Since launching four years ago, Tailscale has been adopted by thousands of companies seeking easier and more powerful ways to build networks and interconnect devices. Customers like Instacart, Mercari, Duolingo, and Mercury Bank are using Tailscale in wide-scale deployments, often with more than 1,000 users, as key parts of their respective network infrastructures.
Built on the open source project WireGuard®, Tailscale uses the principles of Zero Trust Networking to create “endpoint first” peer-to-peer networks. An alternative to legacy networking and VPN architectures, Tailscale private networks (“tailnets”) operate as overlays on top of customers’ existing network infrastructure, ensuring that all traffic between devices is encrypted, and that devices are authenticated and reachable regardless of how or where they’re connected to the Internet.
By building encryption, authentication, identity, and traffic routing rules into the network itself, rather than assembling them into a composite of separate layers and components, Tailscale delivers essential features and security capabilities with unique ease and manageability. Creating or joining a tailnet is easy: a user need only install a small software client and login using their company’s existing single sign-on (SSO) authentication system. Tailscale’s cloud service coordinates and facilitates connections between all devices on the tailnet, and provides the administrative tools to monitor activity, create access policies, and manage users.
As Tailscale has become more popular, we’ve seen it deployed in virtually every environment you can imagine: hobbyists building home labs and automation, developers securing access to development and production systems, and companies managing the new reality of remote work. We’ve been working closely with some of our largest customers to learn how they have been using Tailscale and how this new networking model helps address their unique and evolving needs.
To that end, we are happy to announce the launch of Tailscale Enterprise, a new offering designed for organizations that have sophisticated compliance, security, and support requirements.
>
> “Every IT team wants to implement zero trust, but it’s always on the other side of the horizon,” said Clint Sharp, co-founder and CEO of Cribl. “Tailscale’s overlay network for enterprises brings us one step closer to making it a reality. Now our teams can work on mission-critical projects without worrying about security gaps and tedious configurations.”
>
### Tailscale Enterprise features and capabilities
Tailscale Enterprise includes security features specific to the needs of large organizations, such as logging and identity management, plus higher levels of support and flexible payment options.
* [**Network flow logging and streaming**](/kb/1219/network-flow-logs/)**:** Customers can monitor network activity on their tailnet for all devices that are connected to it. These logs are associated with device identities, which makes it easier to correlate, analyze, and attribute activity patterns over longer periods of time compared to logging solutions that rely solely on IP addresses. Included with Enterprise is the new ability to stream network activity logs to existing Security Information and Event Management (SIEM) systems for monitoring and alerting, allowing Tailscale to integrate with established security processes.
* [**User and group provisioning**](/kb/1180/sso-okta-scim/) **(using SCIM):** As part of securing a network, companies protect resources by limiting the set of users authorized to access them. Tailscale makes this possible with fine-grained access control lists (ACLs), which can be used to restrict which users, groups, devices, and IP addresses can connect to each other. In particular, ACL groups make it possible to manage network access and permissions based on a company’s structure so, for example, only the finance team can access the payroll application. Companies can also automatically on and offboard users from their tailnets and sync user group membership — reducing or eliminating manual errors, and keeping application access up to date.
* [**Custom OIDC providers**](/kb/1240/sso-custom-oidc/): In Tailscale, users authenticate with their existing identity provider. This means that organizations can use SSO and multi-factor authentication for securing access, without users needing to remember yet another password. In addition to existing identity providers like Okta, Azure AD, and Google, Tailscale now offers custom OpenID Connect (OIDC) providers. Enterprise customers with complex identity requirements (that could include self-hosting their own identity solution) can authenticate to Tailscale with the OIDC-compliant identity provider of their choice, including JumpCloud, Duo, GitLab, and Auth0.
* [**Tailnet lock**](/kb/1226/tailnet-lock/): In addition to providing controls over which users can join a tailnet, Tailscale Enterprise introduces new ways of managing how devices join the network. With tailnet lock, administrators can allow their own Tailscale devices, rather than the Tailscale control server, to act as the public key validator for new devices. This puts device authorization completely in the hands of the customer and eliminates the risk that an attacker could use a piece of Tailscale’s infrastructure to add devices to a tailnet.
* **Usage-based billing**: Tailscale Enterprise, as well as the other Tailscale plans, now include usage-based billing, meaning that companies only pay for what they use rather than a fixed number of seats (or licenses). Billing is based on the number of active users in a tailnet, with activity calculated on a per-month basis.
### Get started with Tailscale Enterprise
[Join our upcoming webinar](https://us02web.zoom.us/webinar/register/WN_KpLpzkNDRWeeEzw-n9eylA#/registration) on May 17th to learn more about Tailscale Enterprise.
Additional details about Tailscale Enterprise are available on our [pricing page](/pricing/), or if you have any questions about migrating an existing account, please [contact sales](/contact/sales/).
Share
Author
David Carney
Author
David Carney
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