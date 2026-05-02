Set up an app connector · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Set up an app connector
Last validated: Jan 5, 2026
App connectors are available for [all plans](/pricing).
App connectors let you route Tailscale network (known as a tailnet) traffic to your software as a service (SaaS), cloud, and self-hosted applications, letting users and devices on the tailnet access applications by domain names instead of IP addresses. You can also incorporate monitoring, optimization, security, and reliability into your app connector setup.
For more in-depth information about app connectors, refer to [How app connectors work](/docs/features/app-connectors).
You can also [deploy an app connector to your Kubernetes cluster using the Kubernetes Operator](/docs/features/kubernetes-operator/how-to/app-connector).
## [Requirements](#requirements)
To set up an app connector, you must have the following:
* An existing tailnet and user account with the [Owner, Admin, or Network admin](/docs/reference/user-roles) role for editing the tailnet policy file and managing the app connector settings in the admin console.
* The Linux device to use as the app connector with the following:
* A publicly accessible IP address.
* IP forwarding is enabled.
* You can use a physical device or a VM as the app connector device.
* A SaaS or self-hosted application with administrative access.
## [Get started](#get-started)
To add a [preset app](#add-a-preset-app) type app connector in your tailnet, you must complete the following steps:
1. Add the app connector in the admin console to route traffic to your application. When you add a preset app, the `nodeAttrs` section of your [tailnet policy file](/docs/features/tailnet-policy-file) will automatically add a new `target` entry for the app connector. The `tagOwners`, `autoApprovers`, and `grants` entries must be manually added in the tailnet policy file.
2. Update your tailnet policy file with the `tagOwners`, `autoApprovers`, and `grants` entries to let devices in your tailnet use the app connector.
3. Configure a Linux node in your tailnet as an app connector device.
4. (Optional) Restrict application access to only the app connector device by configuring an IP allowlist in your application.
To add a [custom app](#add-a-custom-app) type app connector in your tailnet, you must complete the following steps:
1. Update your [tailnet policy file](/docs/features/tailnet-policy-file) to let devices in your tailnet use the app connector, by adding entries to the `nodeAttrs`, `tagOwners`, `autoApprovers`, and `grants` sections.
2. Configure a Linux node in your tailnet as an app connector device.
3. Add the app connector settings in the admin console to route traffic to your application.
4. (Optional) Restrict application access to only the app connector device by configuring an IP allowlist in your application.
### [Update the tailnet policy file](#update-the-tailnet-policy-file)
Configure your tailnet policy file with the necessary permissions to let devices use the app connector device.
You need to be an [Owner, Admin, or Network admin](/docs/reference/user-roles) to edit a tailnet policy file.
1. Go to the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console.
2. Add a [`tagOwners`](/docs/features/tags) rule to define the tag name and specify which users can assign that tag to other devices, letting them connect to the app connector. The following example defines the `github-admins` group as an owner of the `github-app-connector` tag.
```
`"tagOwners": {
"tag:github-app-connector": [
"group:github-admins",
],
},
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
3. Add an [`autoApprovers`](/docs/reference/syntax/policy-file#autoapprovers) rule to automatically approve specific routes for the app connector tag. After you configure app traffic to route through an app connector, any DNS request to the configured app domains triggers route discovery.
Preset apps, in most cases, do not require an `autoApprovers` rule for routes. Tailscale updates and manages the routes for preset apps and these are automatically approved.
However, preset apps may also discover new routes through DNS. These learned routes are not automatically approved and will require an `autoApprovers` rule.
Custom apps routes always require an `autoApprovers` rule.
The following auto-approval policy example automatically approves all IPv4 and IPv6 routes for devices using the `github-app-connector` tag.
```
`"autoApprovers": {
"routes": {
"0.0.0.0/0": ["tag:github-app-connector"],
"::/0": ["tag:github-app-connector"],
},
},
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
4. Add a [`grants`](/docs/reference/syntax/policy-file#grants) rule to route application-specific traffic through the app connector tag.
You must allow tailnet devices to access the routes an app connector advertises. One way to do this is to add an access control policy to your tailnet policy file that grants access to `autogroup:internet` (any port number) for members of the tailnet, which will also grant users access to any exit nodes in the tailnet.
```
`"grants": [
{
"src": ["autogroup:member"],
"dst": ["autogroup:internet"],
"ip": ["\*"]
}
]
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
Devices require access to the app connector tag for DNS discovery. App connectors use the PeerAPI to perform DoH calls. Grant minimal access using TCP or UDP on port `53` to enable peer discovery:
```
`"grants": [
{
"src": ["autogroup:member"],
"dst": ["tag:github-app-connector"],
"ip": ["tcp:53", "udp:53"]
}
]
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
5. Add a [`nodeAttrs`](/docs/reference/syntax/policy-file#nodeattrs) rule to map the app connector tag to the application-specific domains. The following example node attribute definition configures the `github-app-connector` tag for GitHub domains.
If you are configuring a preset app type app connector, the `nodeAttrs` section is in your tailnet policy file is automatically updated, and you can skip this step.
```
`"nodeAttrs": [
{
"target": ["\*"],
"app": {
"tailscale.com/app-connectors": [
{
"name": "GitHub",
"connectors": ["tag:github-app-connector"],
"domains": [
"github.com",
"\*.github.com"
]
}
]
}
}
]
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
### [Configure a device as an app connector](#configure-a-device-as-an-app-connector)
After updating the [tailnet policy file](#requirements-for-the-tailnet-policy-file), configure the device to function as an app connector.
The app connector device must be running Linux, already added to your tailnet, have a public IP address, and IP port forwarding enabled.
Run the following Tailscale CLI command, making sure to replace the variables in the angle brackets (`\<\>`) with the actual app connector tag name.
```
`tailscale up --advertise-connector --advertise-tags=tag:\<connector-tag-name\>
`
```
The `--advertise-connector` flag enables the device to route traffic for specific domains according to the configuration in the tailnet policy file. The `--advertise-tags` flag tells the Tailscale client to authenticate the device with the provided tags.
#### [Add a preset app](#add-a-preset-app)
Preset apps are the applications we support for automatically adding the necessary domains needed for your application, and can reduce the time needed for app connector configuration. After set up, preset apps periodically fetch domains and routes from the application's authoritative configuration and propagate any changes to the tailnet.
Tailscale supports the following preset apps:
* AWS CloudFront (global)
* AWS Elastic Compute Cloud (EC2) / Elastic Load Balancing (ELB)
* AWS Simple Storage Service (S3)
* Confluence
* GitHub
* Google Workspace
* Jira
* Microsoft 365
* Okta
* Salesforce (Hyperforce environment)
* Salesforce (Salesforce-hosted)
* Stripe
You need to be an [Owner, Admin, or Network admin](/docs/reference/user-roles) of a tailnet to configure a preset app.
1. Open the [Apps](https://login.tailscale.com/admin/apps) page of the admin console.
2. In the **Add an app** dialog, enter the following details.
1. **Name**: Enter a unique name for identifying the application.
2. **Target**: Select a preset app to automatically add the domains for your application.
3. **Connectors**: Select a tag or set of tags that you configured for your app connector in your tailnet policy file.
4. Select **Save**.
A green icon next to the app connector name indicates that it is currently active and working as expected.
Select the app connector you added for additional details you can use to administer settings on both your tailnet and your application.
Traffic to configured domains routes through tagged app connectors before reaching target domains on the internet. This routing occurs even when the originating device uses an exit node. The source IP address for this traffic appears as one of the public IP addresses from the devices running as app connectors.
#### [Add a custom app](#add-a-custom-app)
If your application is not available as a preset app in the admin console, you can manually configure the settings.
You need to be an [Owner, Admin, or Network admin](/docs/reference/user-roles) of a tailnet to add and edit app connectors.
1. Open the [Apps](https://login.tailscale.com/admin/apps) page of the admin console.
2. In the **Add an app** dialog, enter the following details.
1. **Name**: Enter a unique name for identifying the application.
2. **Target**: Select **Custom** and manually enter the application domain names. If you need to add multiple domain entries, separate each one with a comma. When specifying domains, you can use wildcards for subdomains but not for top-level domains (TLDs). For example, `\*.example.com`, `\*.example.co.uk`, `\*.example.info` are valid while `\*.com`, `\*.co.uk`, `\*.info` are not valid.
3. **Connectors**: Select a tag or set of tags that you configured for your app connector in your tailnet policy file.
4. Select **Save**.
A green icon next to the app connector name indicates that it is currently active and working as expected.
Select the app connector you added for additional details you can use to administer settings on both your tailnet and your application.
#### [Edit preset apps](#edit-preset-apps)
The [Apps](https://login.tailscale.com/admin/apps) page of the admin console is the primary way to set up a preset app and automatically updates the `presetAppID` when you add an app connector. You can also manually modify the `presetAppID` for an app in your tailnet policy file.
The following shows an example snippet with GitHub as a preset app.
```
`"nodeAttrs": [
{
"target": ["\*"],
"app": {
"tailscale.com/app-connectors": [
{
"name": "github app",
"connectors": ["tag:code", "tag:ci-cd"],
"presetAppID": "github"
}
]
}
}
]
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
The following is the list of the supported preset apps as they appear in the tailnet policy file.
|**Preset app name**|**`presetAppID` value**|
|AWS CloudFront (global)|`aws-cloudfront-global`|
|AWS EC2/ELB|`aws-ec2-\<region\>-\<availability-zone\>-\<local-zone\>`|
|AWS S3|`aws-s3-\<region\>-\<availability-zone\>-\<local-zone\>`|
|Confluence|`confluence`|
|GitHub|`github`|
|Google Workspace|`google-workspace`|
|Jira|`jira`|
|Microsoft 365|`microsoft-365`|
|Okta|`okta`|
|Salesforce (Hyperforce environment)|`salesforce-hyperforce`|
|Salesforce (Salesforce-hosted)|`salesforce`|
|Stripe|`stripe`|
#### [Remove an app connector](#remove-an-app-connector)
You must be an [Owner, Admin, or Network admin](/docs/reference/user-roles) of a tailnet to remove an app connector.
1. Open the [Apps](https://login.tailscale.com/admin/apps) page of the admin console.
2. Select the menu next to the app connector you want to remove, and select **Remove**.
After you remove an app connector, traffic to the application no longer routes through the app connector. Instead, traffic to the application's domain names routes directly from the client device or through an exit node if the device uses one.
If you no longer need the app connector device in your tailnet, you can [remove it](/docs/features/access-control/device-management/how-to/remove).
### [Restrict application access by IP address](#restrict-application-access-by-ip-address)
Many applications let you control access by specifying which IP addresses can connect to them. When you use an app connector, all traffic from your tailnet to the target application appears to come from the app connector's public egress IP address. This means you can add the app connector's egress IP address to your target application's trusted list of ingress IP addresses (called an IP allowlist). This ensures only users with access to the app connector can access the target application.
To set this up, find your application's IP allowlist settings and add the public IP address of each device running as an app connector. If you use multiple app connectors for redundancy, add all their public IP addresses. You can find these IP addresses in your cloud provider's management interface.
The following is a list of Tailscale's supported preset apps and links for configuring specific IP addresses (IP allowlisting) for providing exclusive access to your app connector devices.
* [AWS](https://docs.aws.amazon.com/dtconsole/latest/userguide/connections-ip-address.html)
* [Confluence](https://support.atlassian.com/security-and-access-policies/docs/specify-ip-addresses-for-product-access/)
* [GitHub](https://docs.github.com/en/enterprise-cloud@latest/organizations/keeping-your-organization-secure/managing-security-settings-for-your-organization/managing-allowed-ip-addresses-for-your-organization)
* [Google Workspace](https://support.google.com/a/answer/12642752?hl=en)
* [Jira](https://support.atlassian.com/security-and-access-policies/docs/specify-ip-addresses-for-product-access/)
* [Microsoft 365](https://learn.microsoft.com/en-us/microsoft-365/enterprise/urls-and-ip-address-ranges?view=o365-worldwide)
* [Okta](https://support.okta.com/help/s/article/How-to-Allow-Access-to-the-Okta-Applications-Only-From-a-Specific-IP-Range)
* [Salesforce](https://help.salesforce.com/s/articleView?id=000386441&amp;type=1)
* [Stripe](https://docs.stripe.com/keys#limit-api-secret-keys-ip-address)
Tailscale automatically finds the preset app's IP addresses. Go to the [Apps](https://login.tailscale.com/admin/apps) page in the admin console, select the app details you'd like to configure, and copy the **Egress IPs** listed. This list includes all IP addresses of all connectors configured on the associated tags. Remember to update your IP allowlist if you add new app connectors.
App connector devices have two different IP addresses. The [Tailscale IP address](/docs/concepts/tailscale-ip-addresses), which is private to your tailnet, and the public IP address, which other applications on the internet can reach. When configuring IP access controls, you need the public IP address, not the Tailscale IP address.
## [Limitations](#limitations)
* Linux is the only operating system that can be used as an app connector device in a tailnet.
* App connectors cannot be shared across multiple tailnets.
* Advertising more than 10K routes on any instance, or across the whole tailnet, will cause significant functionality issues for connecting clients.
* Tailnets are limited to advertising 250 domains across all applications.
* Using frequently changing or [ephemeral](/docs/features/ephemeral-nodes) resources as app connectors is not recommended. App connectors learn over time and build routes to connected domains, so using a stable routing infrastructure provides better performance and reliability.
* If you manage your tailnet policy file using an external provider like [Terraform](/docs/integrations/terraform-provider) or [GitOps](/docs/gitops), any changes you make to app connectors in the admin console will be overwritten during the next sync. Make sure to manage app connectors through your external provider.
On this page
* [Requirements](#requirements)
* [Get started](#get-started)
* [Update the tailnet policy file](#update-the-tailnet-policy-file)
* [Configure a device as an app connector](#configure-a-device-as-an-app-connector)
* [Add a preset app](#add-a-preset-app)
* [Add a custom app](#add-a-custom-app)
* [Edit preset apps](#edit-preset-apps)
* [Remove an app connector](#remove-an-app-connector)
* [Restrict application access by IP address](#restrict-application-access-by-ip-address)
* [Limitations](#limitations)
Scroll to top