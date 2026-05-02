Security | Tailscale
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Security at Tailscale
Thousands of teams trust Tailscale — and that’s in part thanks to our commitment to security and privacy.
SSO and MFA
Tailscale relies on your existing identity provider to authenticate users, and automatically uses authentication settings like MFA.
Access Controls Lists
ACLs allow you to define which users can connect to which devices in your network.
End-to-end encrypted
Tailscale is built on top of WireGuard®, a modern VPN that provides end-to-end encryption between devices. Tailscale cannot read your traffic.
SOC 2
Tailscale has completed a SOC 2 Type II certification, meeting AICPA's Trust Services Criteria for security, availability, and confidentiality.
Latacora Audits
Tailscale works with Latacora, a security firm that specializes in information security, to conduct security audits.
Security Bulletins
Tailscale publishes security bulletins to disclose security issues in our product.
## [Security by design](#security-by-design)
##### [**Tailscale connections are end-to-end encrypted with WireGuard®**](#tailscale-connections-are-end-to-end-encrypted-with-wireguardr)
Tailscale is built on top of [WireGuard.](https://www.wireguard.com/)
WireGuard is a modern VPN designed for usability, performance, and security. WireGuard uses state-of-the-art cryptography and provides end-to-end encryption for connection between devices. WireGuard’s protocol has been [reviewed by cryptographers](https://eprint.iacr.org/2018/080.pdf) and the [code audited](https://arstechnica.com/gadgets/2020/03/wireguard-vpn-makes-it-to-1-0-0-and-into-the-next-linux-kernel/), with only minor issues discovered and fixed.
We designed Tailscale to make it even easier to use WireGuard to secure your network connections.
##### [**Tailscale sees your metadata, not your data**](#tailscale-sees-your-metadata-not-your-data)
Tailscale does not (and cannot) inspect your traffic. Privacy is a fundamental human right, and we designed Tailscale accordingly. We don’t want your data.
[Your data is end-to-end encrypted and transmitted point-to-point](https://tailscale.com/blog/how-tailscale-works/). Your devices’ private encryption keys never leave their respective nodes, and our coordination server only collects and exchanges public keys. DERP relay servers do not log your data — you can confirm this yourself as the [code is open-source](https://github.com/tailscale/tailscale/tree/main/derp). Even when your connection uses a DERP relay server, the only data Tailscale could see and capture is encrypted.
We never see information about your public Internet traffic. If you use an [exit node](https://tailscale.com/kb/1103/exit-nodes/), they’re your exit nodes, not ours, so we still can’t see your public Internet traffic. If you use [MagicDNS or Split DNS](https://tailscale.com/kb/1054/dns/), your public DNS queries may end up passing through your device’s local Tailscale DNS proxy, but they are not logged. Again, you can verify this yourself because the [code is open-source](https://github.com/tailscale/tailscale).
We do receive metadata about which of your private nodes connect to which other private nodes, including public IP addresses. This is required to provide the service, as the purpose of Tailscale’s coordination server is to help your nodes find each other.
##### [Your network remains available even if Tailscale is not](#your-network-remains-available-even-if-tailscale-is-not)
Tailscale connects devices point-to-point. Even if Tailscale's coordination server is down, you can still access your network.
Tailscale’s coordination server is used to help your nodes find each other. Once this information is exchanged, however, your nodes have all the information they need to connect. Though the coordination server needs to be available for you to make administrative changes, removing this dependency means you don’t have a single point of failure for your users to connect to your services.
Although Tailscale tries to connect devices point-to-point, [that’s not always possible](https://tailscale.com/blog/how-nat-traversal-works/), so we have [globally distributed DERP relay servers](https://tailscale.com/kb/1232/derp-servers) to help devices connect to each other when connections are hard to establish. The DERP servers run in multiple regions and have no shared state between regions, which means a DERP region can have an outage and your Tailscale clients will fail over to a different one.
##### [Tailscale is written in Go](#tailscale-is-written-in-go)
Tailscale uses [wireguard-go](https://github.com/WireGuard/wireguard-go). Tailscale’s core functionality, including the coordination server, logging infrastructure, DERP relay servers, and clients, are written in [Go](https://go.dev/). Go is a language that provides automatic memory management, and so doesn’t rely on the developer to allocate and free up memory — which prevents a [whole class of memory safety vulnerabilities](https://cwe.mitre.org/data/definitions/119.html).
## [Security Features](#security-features)
##### [SSO and MFA](#sso-and-mfa)
Tailscale relies on your existing identity provider to authenticate users. Any authentication settings from your identity provider are automatically used by Tailscale, including MFA and context-aware access. Authenticate to Tailscale with [identity providers including Google, Microsoft AD, GitHub, Okta, and OneLogin](https://tailscale.com/kb/1013/sso-providers/).
##### [Access Controls Lists (ACLs)](#access-controls-lists-acls)
Tailscale’s [ACLs](https://tailscale.com/kb/1018/acls/) allow you to define what users, groups, IP addresses, CIDRs, hosts, and tags can connect to each other in your network. Using ACLs, you can define [role-based access controls](https://tailscale.com/blog/rbac-like-it-was-meant-to-be/) for users accessing services in your network in terms of user identities, rather than in terms of IP addresses. ACLs are directional and default deny.
##### [User roles](#user-roles)
Tailscale provides multiple [user roles](https://tailscale.com/kb/1138/user-roles/) that restrict who can modify your tailnet’s configurations. These allow for separation of duties between admins who can modify users and devices, such as IT administrators, and those who can modify network configurations, such as the networking team.
To take advantage of all of Tailscale’s security features and best protect your network, we recommend following our [hardening guide](https://tailscale.com/kb/1196/security-hardening).
##### [Security disclosures](#security-disclosures)
Tailscale publishes [security bulletins](https://tailscale.com/security-bulletins/) to disclose security issues in our product.
If you’re directly affected by a security issue in Tailscale, and [we have your contact information](https://tailscale.com/kb/1224/contact-preferences/), we will contact you.
Securing a virtual private network requires both the provider and the user to share in the burden of responsibility. To understand how responsibilities are shared between you and Tailscale, see the [shared responsibility model](https://tailscale.com/kb/1212/shared-responsibility).
##### [Tailnet lock](#tailnet-lock)
[Tailnet lock ](https://tailscale.com/kb/1226/tailnet-lock)lets you control which nodes are signed and verified by trusted nodes in your tailnet, meaning you don’t need to trust the Tailscale coordination server for distributing public [node keys](https://tailscale.com/blog/tailscale-key-management/#node-keys) to peer nodes in your tailnet. You can control which nodes are trusted to sign another node’s public key.
## [Compliance & Certifications](#compliance-and-certifications)
##### [SOC 2](#soc-2)
Tailscale has completed a [SOC 2](https://tailscale.com/security-bulletins/) Type II certification.
Achieving SOC 2 compliance means that Tailscale has implemented procedures, policies and controls necessary to meet AICPA's Trust Services Criteria for security, availability, and confidentiality, and that these processes and controls have been tested to ensure that they are operating effectively.
Obtain a copy of the report from our [legal page](/legal).
## [Security policies](#security-policies)
Tailscale publishes the [security policies](https://tailscale.com/security-policies/) we use publicly, so you can transparently see where we are in terms of security maturity.
To track how these change over time, or to use these policies yourself, see the [policies on GitHub](https://github.com/tailscale/security-policies).
## [Security Controls](#security-controls)
Tailscale has many security controls in place to ensure the security of the service.
##### [Network & infrastructure security](#network-and-infrastructure-security)
* Requires business need to access the production environment.
* Requires SSO and MFA to manage the production environment.
* Requires connections over Tailscale or using SSH keys to access the production environment.
* Logs operations in the production environment, and audits these for unusual activity.##### [Data security](#data-security)
* Encrypts data at rest and in transit.
* Backs up data at least hourly, and tests recovery at least annually.
* Retains data in line with our [Privacy Policy](https://tailscale.com/privacy-policy/).##### [Application security](#application-security)
* Requires a peer review for source code changes.
* Regularly conducts audits of our source code.
* Regularly reviews potential vulnerabilities in our environment and applies relevant patches.
* Reviews access permissions at least quarterly.##### [Incident response](#incident-response)
* Responds to security issues reported to [security@tailscale.com](mailto:security@tailscale.com) promptly.
* Discloses security issues in [security bulletins](https://tailscale.com/security-bulletins/).##### [Business practices](#business-practices)
* Checks references for all new employees.
* Requires new and existing employees to regularly complete security awareness training.
* Requires new employees to sign a non-disclosure agreement.
* Reviews new vendors prior to using their services, and existing vendors at least annually.
Tailscale works with [Latacora](https://www.latacora.com/) to conduct security audits and ongoing analysis of our application security, network security, and corporate security. Latacora also provides feedback and guidance on new product features and Tailscale’s architecture.
## [Privacy](#privacy)
In addition to securing your information, we keep it private. Tailscale values and respects your privacy. [You are not the product](https://tailscale.com/blog/free-plan/).
To learn more about what data we collect, and how we use it, see our [Privacy Policy](https://tailscale.com/privacy-policy/).
## Security FAQs
### Can Tailscale decrypt my traffic and see my data?
No. Devices running Tailscale only exchange their public keys. Private keys never leave the device. All traffic is end-to-end encrypted, always.
### Is my traffic routed through your servers?
No. Tailscale routes traffic over the shortest path possible. In most cases, this is a direct, peer-to-peer connection.
In cases where a direct connection cannot be established, devices will communicate by bouncing traffic off one or more geographically distributed [DERP relay servers](https://tailscale.com/kb/1118/custom-derp-servers/#what-are-derp-servers). Your traffic remains end-to-end encrypted when it passes through a relay server, and Tailscale can’t decrypt it.
### Will others be able to access my computer?
Tailscale allows you to connect your computer to other devices logged in to the same Tailscale network. Only devices that are permitted to access your computer as defined in [ACLs](https://tailscale.com/kb/1018/acls/) can initiate connections to your computer. You can also locally [block incoming connections](https://tailscale.com/kb/1072/client-preferences/#allow-incoming-connections) to your device.
### Does Tailscale encrypt my data?
Yes. Tailscale encrypts customer metadata in the coordination server at rest using 256-bit AES and in transit using TLS. Customer data is encrypted in transit using WireGuard.
### Does Tailscale back up my data?
Tailscale backs up customer metadata in the coordination server hourly and tests backups at least annually.
### Does Tailscale conduct security audits?
Yes. We work with Latacora to conduct regular security audits. These include traditional assessments, but also monitoring, maturity model review, design review and advisory services. On top of that, we also have peer code reviews, automated static analysis checks, and dependency vulnerability scans.
### What infrastructure does Tailscale use?
Tailscale’s infrastructure includes the following:
* A client, run on each of a user’s devices. This is available for [many platforms including macOS, Windows, Linux, iOS, and Android](https://tailscale.com/download).
* A coordination server, which distributes public keys and controls settings for the service. Tailscale’s control plane runs on Linux servers in Amazon Web Service (AWS), in AWS Virtual Private Clouds (VPCs). [Coordination server data is stored in SQLite](https://tailscale.com/blog/database-for-2022/) and backed up to AWS S3, with analytics stored in Snowflake.
* [Designated Encrypted Relay for Packets (DERP) relay servers](https://tailscale.com/kb/1118/custom-derp-servers/#what-are-derp-servers), which help clients establish end-to-end encrypted connections where they have trouble connecting directly. Tailscale’s DERP relay servers run on Linux servers in multiple regions on multiple infrastructure providers. Learn more about [How Tailscale works](https://tailscale.com/blog/how-tailscale-works/).
### Is Tailscale’s infrastructure multi-tenant?
Yes. Tailscale’s coordination server, which distributes public keys and controls settings, is multi-tenant. This only stores customer metadata and public keys, not data or private keys.
Tailscale’s DERP relay servers, which help establish point-to-point connections, are multi-tenant. These only route encrypted customer data, never unencrypted data.
### What data does Tailscale collect?
In order to provide the service, Tailscale collects device information, including OS, hardware, public IP addresses, network routing information, information on the installed Tailscale client, and other device settings. Tailscale also uses user account information, such as email addresses, to authenticate users to their accounts.
See our [Privacy Policy](https://tailscale.com/privacy-policy/#collect) for more details on how we collect and use personal information.
### Does Tailscale have a DPA? Who are your subprocessors?
Yes. Tailscale provides a [Data Privacy Addendum](https://tailscale.com/dpa) to all customers, and publishes a [list of subprocessors](https://tailscale.com/dpa-subprocessors).
### Can I opt out of logging?
Tailscale collects customer metadata related to connection attempts, authentication, and routing to help us to monitor and debug networks.
If you opt out of logging, Tailscale may not be able to provide technical support. To learn how to opt out, see [Opting out of client logging](https://tailscale.com/kb/1011/log-mesh-traffic/#opting-out-of-client-logging).
You cannot limit coordination server logs.
### Is Tailscale SOC 2 compliant?
Yes. Tailscale has completed a [SOC 2](https://us.aicpa.org/interestareas/frc/assuranceadvisoryservices/serviceorganization-smanagement) Type II audit covering AICPA’s Trust Services Criteria for security, availability, and confidentiality. Obtain a copy of the report from our [compliance page](https://tailscale.com/compliance). Note that the report is confidential, and prospective customers will need to [contact support](https://tailscale.com/contact/support) and sign an NDA to access the report.
### Is Tailscale HIPAA compliant?
HIPAA defines controls for securing health information.
As Tailscale does not store customer data, only metadata, Tailscale doesn’t have any services in scope for HIPAA. US-based healthcare customers do not need and Tailscale does not execute business associate agreements (BAAs) with our US-based healthcare clients.
Tailscale can be a supporting safeguard for your HIPAA-compliant system to provide integrity and encryption for electronic protected health information transmitted over an electronic communications network (HIPAA 45 CFR § 164.312(e)(1)).
### Is Tailscale PCI compliant?
PCI DSS 4.0 defines controls for securing credit card information and requires eligible merchants to complete the [SAQ A](<https://docs-prv.pcisecuritystandards.org/SAQ (Assessment)/SAQ/PCI-DSS-v4-0-SAQ-A-r2.pdf>) form to demonstrate compliance.
Tailscale does not store credit card information, and instead uses [Stripe](https://stripe.com/) to securely process transactions. [Stripe is certified to PCI DSS Service Provider Level 1](https://stripe.com/docs/security/stripe), which is the highest level of security certification available in the payments industry.
As Tailscale does not directly store or process credit card information**, **Tailscale doesn’t have any services in scope for PCI DSS. However, under the PCI DSS 4.0 requirements, Tailscale has completed the [SAQ A](https://cdn.sanity.io/files/w77i7m8x/production/cf639662e5a5445fc6919c75d434cf8fa462dbad.pdf) form to ensure that our service provider, Stripe, is PCI-compliant and contractually obligated to handle all PCI obligations.
## Have a security concern about Tailscale?
Get in touch with our security team at [security@tailscale.com](mailto:security@tailscale.com) to disclose any security vulnerabilities.
Upon discovering a vulnerability, we ask that you act in a way to protect our users' information:
* Inform us as soon as possible.
* Test against fake data and accounts, not our users' information.
* Work with us to close the vulnerability before disclosing it to others.
Tailscale does not have a bounty program.
## Try Tailscale for free
[
Get started
](https://login.tailscale.com/start)
Schedule a demo
[
Contact sales
](/contact/sales)