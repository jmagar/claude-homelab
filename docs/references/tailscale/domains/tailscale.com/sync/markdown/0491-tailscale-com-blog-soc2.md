Tailscale’s SOC 2 Compliance: Strengthening Data Security
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|May 17, 2022
# Tailscale is officially SOC 2 compliant
At Tailscale, we are ridiculously passionate about security and privacy—so much so that we built a product that, by design, can’t see your data. We don’t even *want* to see your data. Behind the scenes, we’ve been completing security audits, working with expert cryptographers to validate our [key management](/blog/tailscale-key-management/), and ensuring we lock down access to our production environment.
**We’re excited to announce that we’ve received our SOC 2 Type I report, reaffirming our commitment to security**. Let’s dig into how Tailscale applies security controls to protect your information.
### Tailscale already has stringent security controls in place
Essentially, our SOC 2 Type I report allows you to verify that our internal procedures and policies are in line with what we should be doing to keep your information safe, as validated by an independent auditor.
Tailscale has a number of security controls in place. At a high level, these include:
* Tailscale requires employees to have a business need to access the production environment, using SSO and MFA. Source code changes require a peer review.
* Tailscale encrypts data at rest and in transit.
* Tailscale backs up data regularly.
* Tailscale works with the security consulting firm [Latacora](https://www.latacora.com/) to operate our application, cloud, network and corporate security programs. These include traditional assessments, but also monitoring, maturity model review, design review and advisory services.
* Tailscale responds to security issues reported to [security@tailscale.com](mailto:security@tailscale.com), and discloses issues in [security bulletins](/security-bulletins/).
* Tailscale requires employees to regularly complete security awareness training.
* Tailscale reviews vendors’ security practices regularly.
The SOC 2 Type I report contains more detailed explanations of these controls. Downloading the SOC 2 report is now self-serve if you have a Tailscale account. Download the SOC 2 report from [our legal page](https://tailscale.com/legal).
### We’re never done working on security
Though it’s great that we can point to this report as proof of the security work we’ve been doing, our work in security is never done. Compliance is not a one-and-done thing—we’ve already started the work on our SOC 2 Type II report. And compliance isn’t security—simply meeting compliance requirements isn’t enough.
We’ve built security into Tailscale by design, from the beginning:
* **Tailscale connections are end-to-end encrypted with [WireGuard®](https://www.wireguard.com/)**. WireGuard is a modern VPN which uses state-of-the-art cryptography and was explicitly designed for usability, performance, and security.
* **Tailscale sees your metadata, not your data**. Your data is end-to-end encrypted and transmitted point-to-point. Your devices’ private encryption keys never leave their respective nodes. Tailscale never sees information you transmit over the Tailscale network, or your public Internet traffic.
* **Your network remains available, even if Tailscale is not**. Tailscale’s coordination server is used to help your nodes find each other. Once this information is exchanged, however, Tailscale is not in the critical path for connections allowed in the network. That means you don’t have a single point of failure for your users to connect to your services.
* **Tailscale is written in Go**. Tailscale uses [wireguard-go](https://github.com/WireGuard/wireguard-go), and is written in Go. Go is a language that provides automatic memory management, which prevents a whole class of memory safety vulnerabilities.
We’ve also built features in Tailscale to let you take control and follow security best practices:
* **Single sign-on**: Tailscale relies on your [existing identity provider](/kb/1013/sso-providers/) to authenticate users, so you can use the same SSO and MFA you use everywhere else.
* **Role-based access control**: Tailscale’s [ACLs](/kb/1018/acls/) allow you to define what users and devices can connect to each other in your network, defined in terms of user identities, rather than in terms of IP addresses.
* **Separation of duties**: Tailscale provides multiple [user roles](/kb/1138/user-roles/) that restrict who can modify your tailnet’s configurations, and allow you to separate admins who manage users and devices from those who manage network configurations.
To take advantage of all of Tailscale’s security features and best protect your network, we recommend following our [hardening guide](/kb/1196/security-hardening).
To learn more about how Tailscale secures your information, see our [Security page](/security).
We believe trust is earned through transparency, which is why we at Tailscale are inclined to (over)share about how our company works and [why we make the decisions we make](/blog/free-plan/). We hope that by opening up a bit more about how we keep your information safe, we’re helping you trust us even more.
Share
Authors
David Anderson
Rachel Lubman
Denton Gentry
David Crawshaw
Authors
David Anderson
Rachel Lubman
Denton Gentry
David Crawshaw
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