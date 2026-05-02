Best practices to secure your tailnet · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Best practices to secure your tailnet
Last validated: Jan 20, 2026
Tailscale has many security features you can use to increase your network security. This page provides best practices for using these features to harden your Tailscale deployment.
Refer to an [overview of Tailscale's security](/security), including how Tailscale builds in security by design, and internal controls we use to help keep your information safe.
## [Baseline practices](#baseline-practices)
*Baseline practices are widely applicable and high-value steps to improve security.*
### [Upgrade Tailscale clients in a timely manner](#upgrade-tailscale-clients-in-a-timely-manner)
**Upgrade Tailscale clients regularly, in a timely manner.** Tailscale frequently introduces new features and [patches existing versions](/docs/reference/tailscale-client-versions), including security patches.
[Check for updates](/docs/features/client/update#check-for-updates) to find the version of the Tailscale client installed on every device in your tailnet and use [auto-updates](/docs/features/client/update#auto-updates) to keep Tailscale clients updated automatically.
### [Subscribe to security bulletins](#subscribe-to-security-bulletins)
**Subscribe to [Tailscale's security bulletins](/security-bulletins)** (by using [RSS](/security-bulletins/index.xml)). Tailscale publishes security bulletins to disclose security issues affecting Tailscale. If you're directly affected by a security issue, and we have your contact information, we will contact you.
### [Set a contact for security issue emails](#set-a-contact-for-security-issue-emails)
**Set a [contact for security issue emails](/docs/reference/contact-preferences#setting-the-security-issues-email)**. If you're directly affected by a security issue, and we have your contact information, we will contact you. If no email is set for a security contact, Tailscale uses the default behavior, which is to send security issue emails to the tailnet owner email address.
If you want multiple users to be notified, consider using an email group. For example, use `security@example.com`, instead of `alice@example.com`, for security issue notifications.
If you are using GitHub as your identity provider, we have no contact email information unless you add an email address
to your [contact preferences](/docs/reference/contact-preferences).
### [Enable MFA in your identity provider](#enable-mfa-in-your-identity-provider)
**Enable multifactor authentication in your identity provider for authenticating to Tailscale, ideally using a hardware token**. Tailscale relies on your existing [identity provider](/docs/integrations/identity) to authenticate users. Any authentication settings from your identity provider are automatically used by Tailscale, including MFA and context-aware access.
Follow your [identity provider's documentation](/docs/multifactor-auth) for how to enable multifactor authentication.
### [Define access control policies](#define-access-control-policies)
**Use access controls to define the connections you want to allow in your network, based on job function and following the principle of least privilege.** Tailscale's [access control policies](/docs/features/access-control) let you define what users, groups, IP addresses, CIDRs, hosts, and tags can connect to each other in your network. Using access control policies, you can define [role-based access controls](/blog/rbac-like-it-was-meant-to-be) for users accessing services in your network in terms of user identities, rather than in terms of IP addresses. Follow the [principle of least privilege](/learn/principle-of-least-privilege) to ensure users are only granted access to the intended resources.
Restrict access to users based on job function and what they need to access. Refer to [grant examples](/docs/reference/examples/grants) for common scenarios.
### [Use groups in access control policies](#use-groups-in-access-control-policies)
**Use groups to manage your users.** Using groups lets identities be controlled based on job function. If someone leaves an organization or changes roles, you can adjust the group membership rather than update all of their access control policies.
Define [groups](/docs/reference/syntax/policy-file#groups) in access control policies for sets of users, and use these as part of access rules. Enable [user & group provisioning](/docs/features/user-group-provisioning) to sync users and groups from your identity provider, to automatically add or suspend users, and use synced groups in access control policies.
### [Use tags in access control policies](#use-tags-in-access-control-policies)
**Use tags to manage devices.** Using tags lets you define access to devices based on purpose, rather than based on owner. If someone leaves an organization or changes roles, common devices they have set up, like a server, will not need to be reconfigured.
Define [tags](/docs/features/tags) in access control policies, and use these as part of access rules. Use an [auth key with an tag](/docs/features/tags#best-practices) so that a device is automatically tagged when it is authenticated.
### [Use check mode for Tailscale SSH](#use-check-mode-for-tailscale-ssh)
**Verify high-risk Tailscale SSH connections with check mode.** Check mode requires certain connections, or connections as certain users (such as `root`), to re-authenticate before connecting. This lets the user access these high-risk applications for the next 12 hours or for a specified check period before re-authenticating again. Check mode is only available for [Tailscale SSH](/docs/features/tailscale-ssh) connections.
In an access control policy's `ssh` rule, [set the `action` field to `check`](/docs/features/tailscale-ssh#configure-tailscale-ssh-with-check-mode) to configure check mode for your high-risk Tailscale SSH connections.
### [Use session recording for Tailscale SSH](#use-session-recording-for-tailscale-ssh)
**Set up session recording to log the contents of Tailscale SSH sessions.** Session recording for Tailscale SSH streams these recordings to special recorder nodes in your tailnet, and Tailscale never has access to these recordings. You can deploy the recorder nodes as Docker containers, and configure recordings to be stored on the Docker host's disk or in Amazon S3 (and other S3-compatible object storage services). Session recording is only available for [Tailscale SSH](/docs/features/tailscale-ssh) connections.
Follow [these instructions](/docs/features/tailscale-ssh/tailscale-ssh-session-recording) to deploy the recorder nodes and update your access control policies to require session recording.
### [Review configuration audit logs](#review-configuration-audit-logs)
**Review who did what, and when, in your tailnet.** [Configuration audit logs](/docs/features/logging/audit-logging) record actions that modify a tailnet's configuration, including the type of action, the actor, the target resource, and the time.
Regularly review the logs, and if needed, use the Tailscale API to [export the logs](/docs/features/logging/audit-logging#accessing-configuration-audit-logs-via-api) for long term storage.
### [Get notified about events in your tailnet](#get-notified-about-events-in-your-tailnet)
**Use webhooks to subscribe to events.** [Webhooks](/docs/features/webhooks) let you subscribe to certain events on your Tailscale network and process the event notifications through an integration or app. For example, you can subscribe to events like adding a node or updating your [tailnet policy file](/docs/reference/syntax/policy-file), and then receive the event notifications in a Slack channel or other app.
Subscribe to tailnet management events to be notified of changes to your tailnet policy file, new nodes, new users, and more.
### [Offboard users when they leave](#offboard-users-when-they-leave)
**Suspend or delete users as part of your offboarding process**. Offboarding Tailscale users ensures that they no longer have access to resources including machine authorization, API keys, and auth keys.
Automatically or manually suspend users when they leave. This process can vary depending on your identity provider and whether or not you use user & group provisioning (SCIM).
For more information, refer to [Offboarding users](/docs/features/sharing/how-to/offboard).
## [Advanced practices](#advanced-practices)
*Advanced practices may not be widely applicable. They may also include features which require more configuration or a more advanced knowledge of security and networking.*
### [Use tests](#use-tests)
**Write tests to ensure access controls don't change unexpectedly**. Access control policy tests let you ensure that your access controls are as expected, so that after making a change, an important permission isn't accidentally revoked, or a critical system accidentally exposed.
Define [access control policy tests](/docs/reference/syntax/policy-file#tests) in access control policies. These are automatically validated when an access control policy is updated.
### [Assign Admin roles](#assign-admin-roles)
**Assign user roles for managing Tailscale as appropriate, based on job function and for separation of duties.** Tailscale provides multiple user roles that restrict who can modify your tailnet's configurations. These allow for separation of duties between admins who can modify users and devices, such as IT administrators, and those who can modify network configurations, such as the networking team.
[Assign the roles](/docs/features/sharing/how-to/change-role) of [Admin, Network admin, IT admin, Billing admin, and Auditor](/docs/reference/user-roles) in the [Users](https://login.tailscale.com/admin/users) page of the admin console.
### [Enable device approval](#enable-device-approval)
**Require devices to be approved before they join your network**. You can require that new devices be manually reviewed and approved by an Admin before they can join the network. This can be used to ensure only trusted devices, such as workplace-managed laptops and phones, can access a network.
[Enable device approval](/docs/features/access-control/device-management/device-approval) from the [Device management](https://login.tailscale.com/admin/settings/device-management) page of the admin console.
### [Customize node key expiry](#customize-node-key-expiry)
**Require users to rotate keys by re-authenticating their devices to the network regularly**. Devices connect to your tailnet using a public [node key](/blog/tailscale-key-management#node-keys) which expires automatically after a period of time, forcing keys to rotate. By default, Tailscale requires devices to re-authenticate every 180 days, but some organizations may have a need for stricter controls.
[Modify key expiry](/docs/features/access-control/key-expiry) from the [Device management](https://login.tailscale.com/admin/settings/device-management) page of the admin console.
### [Protect your network boundary](#protect-your-network-boundary)
**Restrict access to your private network, for example, using a firewall**. Tailscale lets you easily connect your devices no matter their local area network, and ensures that traffic between your devices is end-to-end encrypted. However, Tailscale does not protect your devices from any other traffic.
Set up a firewall for your network or [for your device](/docs/how-to/secure-ubuntu-server-with-ufw). Refer to [Using Tailscale with your firewall](/docs/integrations/firewalls) for additional configuration information.
### [Enable HTTPS](#enable-https)
**Obtain public TLS certificates for internal web tools hosted on your network**. Connections between Tailscale nodes are already secured with end-to-end [encryption](/docs/concepts/tailscale-encryption). However, browsers are not aware of that because they rely on verifying the TLS certificate of a domain. By getting a TLS certificate from a public CA for your internal web tool, you avoid confusing your users with browser security warnings.
[Configure HTTPS](/docs/how-to/set-up-https-certificates) for your tailnet from the [DNS](https://login.tailscale.com/admin/dns) page of the admin console. Note that certificates are added to the Certificate Transparency log, so machine names should not contain private information.
### [Use On-Demand Access](#use-on-demand-access)
**Leverage just-in-time access requests to limit access to network resources**. This lets access be granted and revoked on a just-in-time basis, and can be used to manage temporary access to resources that are managed by Tailscale. Tailscale integrates with a [variety](/docs/integrations/jit-access) of on-demand access products.
### [Remove unused OAuth clients](#remove-unused-oauth-clients)
**Regularly remove OAuth clients that are no longer needed for your network**. This prevents leaked OAuth clients being used for Tailscale API access to your network.
Find existing OAuth clients from the [Trust credentials](https://login.tailscale.com/admin/settings/trust-credentials) page of the admin console, and remove those you no longer need.
### [Remove unused API and auth keys](#remove-unused-api-and-auth-keys)
**Regularly remove API and auth keys that are no longer needed for your network**. This prevents leaked keys being used to add unauthorized users or devices to your network.
Find existing API and auth keys from the [Keys](https://login.tailscale.com/admin/settings/keys) page of the admin console, and remove those you no longer need. If you are using an auth key to only authenticate a single device, consider using a [one-time auth key](/docs/features/access-control/auth-keys).
### [Prevent DNS rebinding attacks](#prevent-dns-rebinding-attacks)
**Ensure a Host header is present for HTTP services**. Web services available in a tailnet over HTTP (not HTTPS) may be susceptible to [DNS rebinding](https://en.wikipedia.org/wiki/DNS_rebinding) attacks, where a Tailscale node visiting a malicious web page can be triggered to run a client-side script and attack other nodes in the tailnet. HTTP services can detect DNS rebinding attacks by validating the Host header of incoming HTTP requests is allowlisted.
Set a Host header field in HTTP request messages sent to a HTTP service running in your tailnet. For example, in the HTTP request message, set:
```
`GET /resource HTTP/1.1
Host: www.example.com
`
```
This could also be a MagicDNS fully qualified domain name, for example:
```
`Host: webserver.example2.ts.net
`
```
### [Manage access control policy updates with GitOps](#manage-access-control-policy-updates-with-gitops)
**Use GitOps to keep the source of truth for your [tailnet policy file](/docs/reference/syntax/policy-file) in code, outside of the Tailscale admin console, and use features in a code repository tool to manage and version access control policies.** Use GitOps for Tailscale with [GitHub Actions](/docs/gitops) or [GitLab CI](/docs/integrations/gitlab/gitops) to manage your tailnet policy file in a code repository, and use protected branches and required reviews to manage changes. Using GitOps also enables versioning and an audit trail of changes to your tailnet policy file.
For example, you can require approvals by specific individuals, or enforce tests pass successfully before merging a change.
### [Set up Tailscale with infrastructure as code](#set-up-tailscale-with-infrastructure-as-code)
**Use infrastructure as code tools to deploy Tailscale infrastructure programmatically.** By using an infrastructure as code tool for deployment, you can deploy (or redeploy) a consistent or prior version of a configuration in case of an issue.
Set up the [Terraform](/docs/integrations/terraform-provider) or [Pulumi](/docs/integrations/pulumi-provider) Tailscale providers to interact with the Tailscale API. Supported features include the ability to define your [tailnet policy file](/docs/reference/syntax/policy-file), set DNS settings, generate [auth keys](/docs/features/access-control/auth-keys), and manage device properties. Restrict access to the Tailscale API to your infrastructure as code tools, so that all configuration changes are centrally managed.
### [Use device postures](#use-device-postures)
**Use [device postures](/docs/features/device-posture) to measure how secure or trustworthy a device is.** Restrict access based on device attributes that signal security issues. For example, you can require specific Tailscale client versions, specific operating systems, or disk encryption. The [Enterprise plan](/pricing) can also restrict access with geolocation. Useful for remote work security, Bring Your Own Device (BYOD) policies, and [Zero Trust](/docs/concepts/zero-trust) enforcement.
### [Use Network flow logs](#use-network-flow-logs)
**Use [Network flow logs](/docs/features/logging/network-flow-logs) to determine how nodes are connecting on your Tailscale network.** When Network flow logs are enabled and clients are running a sufficient client version, and when not using [`tailscaled --no-logs-no-support`](/docs/features/logging#opting-out-of-client-logging), nodes report their network activity to the Tailscale logs service. These logs can be accessed using the Tailscale API.
Regularly review the logs, and if needed, export the logs for long term storage.
### [Restrict multi-user systems](#restrict-multi-user-systems)
Users that share a device with multiple user accounts can potentially allow other users to access resources on the tailnet when they switch to another account without logging out. This applies to Linux, Windows, and macOS.
Use of Tailscale is not recommended on devices used by multiple people, unless shared tailnet access between them is acceptable to your security policies.
On this page
* [Baseline practices](#baseline-practices)
* [Upgrade Tailscale clients in a timely manner](#upgrade-tailscale-clients-in-a-timely-manner)
* [Subscribe to security bulletins](#subscribe-to-security-bulletins)
* [Set a contact for security issue emails](#set-a-contact-for-security-issue-emails)
* [Enable MFA in your identity provider](#enable-mfa-in-your-identity-provider)
* [Define access control policies](#define-access-control-policies)
* [Use groups in access control policies](#use-groups-in-access-control-policies)
* [Use tags in access control policies](#use-tags-in-access-control-policies)
* [Use check mode for Tailscale SSH](#use-check-mode-for-tailscale-ssh)
* [Use session recording for Tailscale SSH](#use-session-recording-for-tailscale-ssh)
* [Review configuration audit logs](#review-configuration-audit-logs)
* [Get notified about events in your tailnet](#get-notified-about-events-in-your-tailnet)
* [Offboard users when they leave](#offboard-users-when-they-leave)
* [Advanced practices](#advanced-practices)
* [Use tests](#use-tests)
* [Assign Admin roles](#assign-admin-roles)
* [Enable device approval](#enable-device-approval)
* [Customize node key expiry](#customize-node-key-expiry)
* [Protect your network boundary](#protect-your-network-boundary)
* [Enable HTTPS](#enable-https)
* [Use On-Demand Access](#use-on-demand-access)
* [Remove unused OAuth clients](#remove-unused-oauth-clients)
* [Remove unused API and auth keys](#remove-unused-api-and-auth-keys)
* [Prevent DNS rebinding attacks](#prevent-dns-rebinding-attacks)
* [Manage access control policy updates with GitOps](#manage-access-control-policy-updates-with-gitops)
* [Set up Tailscale with infrastructure as code](#set-up-tailscale-with-infrastructure-as-code)
* [Use device postures](#use-device-postures)
* [Use Network flow logs](#use-network-flow-logs)
* [Restrict multi-user systems](#restrict-multi-user-systems)
Scroll to top