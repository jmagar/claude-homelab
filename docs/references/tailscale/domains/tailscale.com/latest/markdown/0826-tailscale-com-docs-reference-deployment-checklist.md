Deployment checklist · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Deployment checklist
Last validated: Jan 5, 2026
There are a number of topics to consider for a successful and scalable Tailscale deployment beyond configuration of individual devices and [access controls](/docs/features/access-control). This topic details some of the less obvious, but still important, concerns for using and deploying Tailscale at scale. You can use this topic as your Tailscale deployment checklist.
## [Support](#support)
* **Internal support**—provide documentation to your users on how to get internal support within your organization. Refer to [end-user client configuration](#end-user-client-configuration) for ways to customize the Tailscale client to help with this.
* **Tailscale support**—document how and when to [contact Tailscale support](/contact/support) in internal documentation. Also include relevant departments (for example, IT help desk or production operations teams) and instructions to ask end-users to generate a [bug report](/docs/account/bug-report) when reporting issues internally and share the bug report identifier when contacting Tailscale support.
## [Stay up-to-date on Tailscale news](#stay-up-to-date-on-tailscale-news)
* Subscribe to the Tailscale [newsletter](https://info.tailscale.com/tailscale-newsletter-sign-up) and [blog](/blog#blog-newsletter) to stay up-to-date on general Tailscale news. Use email addresses that go to a group of users rather than a single individual.
* Subscribe to the Tailscale [changelog](/changelog) RSS feed to stay up-to-date on client and service changes.
* Subscribe to the Tailscale [security bulletins](/security-bulletins) RSS feed to stay up-to-date on security notifications.
### [Organization notifications](#organization-notifications)
* Set [contact preferences](https://login.tailscale.com/admin/settings/contact-preferences) to receive email notifications regarding account, configuration, and security updates. Use email addresses that go to a group of users rather than a single individual.
## [Production best practices](#production-best-practices)
* Understand how Tailscale and customers [share security responsibilities](/docs/concepts/shared-responsibility).
* Implement [production best practices](/docs/reference/best-practices/production) related to [security](/docs/reference/best-practices/security), [performance](/docs/reference/best-practices/performance), and specific providers.
* Understand [direct vs relayed connections](/docs/reference/connection-types) and which [firewall ports to open](/docs/reference/faq/firewall-ports), if any, to get the best performance from in your environment.
## [Tailnet management](#tailnet-management)
The following sections detail how to manage your Tailscale network (known as a tailnet) at scale.
### [General settings](#general-settings)
* Configure [tailnet](https://login.tailscale.com/admin/settings/general), [user management](https://login.tailscale.com/admin/settings/user-management), and [device management](https://login.tailscale.com/admin/settings/device-management) settings per your organization's needs and security policies.
* Manage your tailnet settings (such as device approval and key duration, DNS settings, log streaming and posture integrations, and more) with [infrastructure-as-code](/docs/integration-infrastructure-as-code) and [GitOps](/docs/gitops) to have an audit trail of changes to Tailscale access controls and configuration in your version control system with peer review of changes.
### [Tailnet policy file management](#tailnet-policy-file-management)
* Manage your tailnet policy file (which includes access control policies, tags, and other settings) with [infrastructure-as-code](/docs/integration-infrastructure-as-code) and [GitOps](/docs/gitops). This provides an audit trail of changes to Tailscale access controls and configuration in your version control system with peer review of changes.
* Review [common patterns for tag names](/docs/features/tags#common-patterns-for-tag-names) and implement consistent tags that represent access patterns and network segments for your devices.
## [User management](#user-management)
The following sections detail how to manage users in your tailnet at scale, including user provisioning, role assignments, and authentication requirements.
### [User and group provisioning](#user-and-group-provisioning)
* Configure [System for Cross-domain Identity Management (SCIM)](/learn/what-is-scim) with a supported provider to enable automatic [user and group provisioning](/docs/features/user-group-provisioning).
### [Tailscale-specific roles](#tailscale-specific-roles)
* Transfer organization [ownership](/docs/reference/user-roles#owner) to an appropriate team member. Oftentimes, the person that created the tailnet is not who should be the owner long-term.
* Assign appropriate [Tailscale-specific roles](/docs/reference/user-roles) to team members based on their job function and responsibilities. Network admin, IT admin, and billing admin are common roles to assign.
## [Device management](#device-management)
* Set a [custom authentication period](/docs/features/access-control/key-expiry#setting-a-custom-authentication-period) to require users to re-authenticate with your identity provider per your company's security policies.
* Enable [device identity collection](/docs/features/access-control/device-management/how-to/manage-identity) to accurately identify devices in your tailnet.
* Set [default source posture rules](/docs/features/device-posture#default-source-posture) to require minimum operating system and Tailscale client versions.
### [EDR and MDM integrations](#edr-and-mdm-integrations)
* Configure Tailscale with your [EDR and MDM tool](/docs/features/device-posture#edr-and-mdm-integrations).
* Define [device posture conditions](/docs/features/device-posture#device-posture-conditions) based on the node attributes available from your EDR and MDM tools.
### [End-user client configuration](#end-user-client-configuration)
* Deploy Tailscale client applications to end-users using a [mobile device management (MDM)](/docs/mdm) solution.
* Enable [automatic client updates](/docs/features/client/update#auto-updates) for end-user devices to ensure employee devices stay up-to-date.
* Configure end-user client applications using [system policies](/docs/features/tailscale-system-policies) through your MDM solution. Review the full list of system policies to determine which options are important to your organization. Some common system policies include:
* Force client behavior end-users will depend on:
* [`UseTailscaleDNSSettings`](/docs/features/tailscale-system-policies#set-whether-the-device-uses-tailscale-dns-settings) to always or never apply Tailscale DNS configuration when the tunnel is connected.
* [`UseTailscaleSubnets`](/docs/features/tailscale-system-policies#set-whether-the-device-accepts-tailscale-subnets) to always or never accept subnets advertised by other devices in your tailnet.
* [`PostureChecking`](/docs/features/tailscale-system-policies#enable-gathering-device-posture-data) to always or never gather device posture data.
* Hide unused capabilities in the client menu such as:
* [`AdminConsole`](/docs/features/tailscale-system-policies#hide-the-admin-console-menu-item) to show or hide the Tailscale admin console menu.
* [`HiddenNetworkDevices`](/docs/features/tailscale-system-policies#hide-network-devices) to show or hide one or more categories of devices in the **Network Devices** menu.
* [`ManageTailnetLock`](/docs/features/tailscale-system-policies#hide-the-tailnet-lock-settings) to show or hide the **Manage Tailnet Lock** menu.
* [`RunExitNode`](/docs/features/tailscale-system-policies#hide-the-exit-node-picker) to show or hide the **Run as Exit Node** menu.
* Provide information for how to get support from Tailscale administrators or your IT team:
* [`ManagedByCaption`](/docs/features/tailscale-system-policies#set-an-info-message) to specify a caption to be displayed in the **Managed By** section.
* [`ManagedByOrganizationName`](/docs/features/tailscale-system-policies#set-your-organization-name) to specify the name of the organization managing Tailscale, for instance "XYZ Corp IT."
* [`ManagedByURL`](/docs/features/tailscale-system-policies#set-a-support-url) to specify a URL pointing to a help desk webpage or Slack channel.
### [Server configuration](#server-configuration)
* Automate server deployments using [infrastructure-as-code](/docs/integration-infrastructure-as-code) to provision devices in a repeatable manner less susceptible to human error.
## [Monitoring](#monitoring)
### [Client metrics](#client-metrics)
* Collect [client metrics](/docs/reference/tailscale-client-metrics) for use with your monitoring system from your subnet routers, exit nodes, app connectors, and other important devices.
### [Monitor tailnet changes](#monitor-tailnet-changes)
* Configure [webhooks](/docs/features/webhooks) to receive important notifications to your central monitoring and alerting system—for example, your monitoring service or Slack. In particular, we recommend notifications for the following [event types](/docs/features/webhooks#events):
* Device misconfiguration: `exitNodeIPForwardingNotEnabled`
* Device misconfiguration: `subnetIPForwardingNotEnabled`
* Tailnet management: `nodeNeedsApproval`
* Tailnet management: `userNeedsApproval`
* Tailnet management: `userRoleUpdated`
* Webhook management: `webhookUpdated`
* Webhook management: `webhookDeleted`
### [Log streaming](#log-streaming)
* Configure [log streaming](/docs/features/logging/log-streaming) to stream configuration and network flow logs to your [Security Information and Event Management (SIEM)](/learn/security-information-and-event-management) system.
* Configure data retention of logs in your SIEM per your company's security policies.
* Configure alerts in your SIEM to notify you of noteworthy events. In particular, we recommend alerts for events related to settings changed through the Tailscale admin console:
```
`// Other fields omitted for brevity
{
"action": "CREATE",
"origin": "ADMIN\_CONSOLE",
// ...
},
{
"action": "UPDATE",
"origin": "ADMIN\_CONSOLE",
// ...
},
{
"action": "DELETE",
"origin": "ADMIN\_CONSOLE",
// ...
},
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
On this page
* [Support](#support)
* [Stay up-to-date on Tailscale news](#stay-up-to-date-on-tailscale-news)
* [Organization notifications](#organization-notifications)
* [Production best practices](#production-best-practices)
* [Tailnet management](#tailnet-management)
* [General settings](#general-settings)
* [Tailnet policy file management](#tailnet-policy-file-management)
* [User management](#user-management)
* [User and group provisioning](#user-and-group-provisioning)
* [Tailscale-specific roles](#tailscale-specific-roles)
* [Device management](#device-management)
* [EDR and MDM integrations](#edr-and-mdm-integrations)
* [End-user client configuration](#end-user-client-configuration)
* [Server configuration](#server-configuration)
* [Monitoring](#monitoring)
* [Client metrics](#client-metrics)
* [Monitor tailnet changes](#monitor-tailnet-changes)
* [Log streaming](#log-streaming)
Scroll to top