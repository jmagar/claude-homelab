Restrict device access with Huntress · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Restrict device access with Huntress
Last validated: Feb 2, 2026
This integration is available for [the Standard, Premium, and Enterprise plans](/pricing).
[Huntress Managed EDR](https://www.huntress.com/platform/managed-edr) is a cybersecurity solution that collects signals from enrolled devices (from its agent installed on each device).
Tailscale can fetch these signals from Huntress and use them as device posture attributes in access rules, which you can then use to only grant access to sensitive resources based on each device's level of trust.
You can achieve this Tailscale's [device posture management](/docs/features/device-posture) features:
* [Device Identity Collection](/docs/features/access-control/device-management/how-to/manage-identity), which collects identifiers (for example, serial numbers), used to match devices in Tailscale to devices in Huntress.
* Huntress posture integration, which synchronizes signals from Huntress to device posture attributes in Tailscale.
* [Posture conditions in access rules](/docs/features/device-posture#device-posture-conditions), which lets you configure access restrictions based on device attributes.
This guide explains how to enable Device Identity collection for your tailnet and configure Huntress posture integration.
## [What is Huntress posture integration?](#what-is-huntress-posture-integration)
The integration syncs data between Huntress and Tailscale on a recurring schedule.
During each sync, Tailscale performs the following actions:
1. Fetches a list of agents and their reported data from your Huntress account.
2. Matches Huntress devices to devices in your tailnet based on serial numbers.
3. Writes the Huntress data to device posture attributes on each matched device.
The integration writes the following device posture attributes to matched devices:
|**Attribute key**|**Description**|**Allowed values**|
|`huntress:defenderStatus`|Status of Microsoft Defender AV|`Incompatible`, `Unhealthy`, `Protected`, `Unmanaged`|
|`huntress:defenderPolicyStatus`|Policy status of Microsoft Defender AV|`Unknown`, `Non Compliant`, `Compliant`, `Pending`, `Gpo Conflict`|
|`huntress:firewallStatus`|Whether the firewall is enabled|`Disabled`, `Enabled`, `Pending Isolation`, `Isolated`, `Pending Release`|
## [Prerequisites](#prerequisites)
Before you can set up the Huntress integration, make sure you have:
* [Device Identity Collection](/docs/features/access-control/device-management/how-to/manage-identity) is enabled, and devices in your tailnet are reporting identifiers
* A Huntress account for which you have permission to create an API key and secret.
## [Create Huntress API key and API secret](#create-huntress-api-key-and-api-secret)
To authenticate your Huntress account with Tailscale, you'll need to create a Huntress API key and secret. The Huntress integration uses these to fetch a list of agents and their data from Huntress.
To create a Huntress API key and secret:
1. Go to the Huntress website and log in to your account.
2. In the top right-hand menu, select **API Credentials**.
3. Under **User API Credentials**, select **+ Add**.
4. Under **User**, select a user who has permission to access all your Huntress agents, and select **Create**. Tailscale recommends using a dedicated read-only user for your Tailscale API key.
5. Make sure to copy the **API Key** and **API Secret**. You need these to configure the Huntress integration in the Tailscale admin console.
## [Find your Huntress Organization ID](#find-your-huntress-organization-id)
You can specify a Huntress Organization ID to limit the integration to a specific organization associated with your Huntress account.You might consider doing this if you have multiple organizations within Huntress, but only need to connect one of them to Tailscale.
To find your Huntress organization ID:
1. Go to the Huntress website and log in to your account.
2. In the top right-hand menu, select **Organizations**.
3. In the list of organizations, select the organization you plan to use with Tailscale.
4. In the URL, look for the number after `/org/`. For example, if the URL is `https://example.huntress.io/org/123456`, the Organization ID is `123456`.
5. Save this ID so you can use it when you configure the Huntress integration in Tailscale.
## [Configure Huntress posture integration](#configure-huntress-posture-integration)
To configure Tailscale to fetch data about devices from Huntress:
1. Open the [Device management](https://login.tailscale.com/admin/settings/device-management) page of the Tailscale admin console.
2. Under the **Device Posture Integrations** section, locate the Huntress integration, then select **Connect**.
3. Enter your **API Key** and **API Secret**.
4. (Optional) Enter your [**Organization ID**](#find-your-huntress-organization-id) to limit the integration to a specific organization associated with your Huntress account.
5. Select **Connect to Huntress**.
## [Check the integration status](#check-the-integration-status)
Next, check to ensure the Huntress integration has run successfully.
1. Go to the **Device Posture Integrations** section of the [Device management](https://login.tailscale.com/admin/settings/device-management) page.
2. Locate the Huntress integration under the **Integrations** section.
After the Huntress integration runs successfully, it shows the time of the most recent sync, the number of synced devices, and any errors that occurred while synchronizing.
## [Check node attributes](#check-node-attributes)
After you set up the Huntress integration, you can confirm that Tailscale is writing the new node attributes for your Huntress devices from the Tailscale admin console.
1. Open the [Machines](https://login.tailscale.com/admin/machines) page of the Tailscale admin console.
2. Select a device to inspect.
3. The node attributes for the device are in the **Machine Details** section. This should include the set of `huntress:` attributes listed previously.
You can also check device attributes using the [Tailscale API](/api#tag/devices/GET/device/{deviceId}/attributes).
## [Adjust Tailscale access rules](#adjust-tailscale-access-rules)
After you configure Huntress posture integration, and your devices have device posture attributes that reflect their signals as reported by Huntress, you can use those device posture attributes as part of your posture rules.
For example, to only permit access to `tag:production` from devices that have antivirus (AV) scanning and firewall enabled, you can create a new posture and use it as part of a corresponding access rule:
```
`"postures": {
"posture:trusted": [
"huntress:defenderStatus == 'Healthy'",
"huntress:firewallStatus == 'Enabled'",
],
},
"grants": [
{
"src": ["autogroup:member"],
"dst": ["tag:production"],
"ip": ["\*"],
"srcPosture": ["posture:trusted"]
}
]
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
## [Schedule](#schedule)
For each configured integration, Tailscale will aim to sync device posture
attributes every 15 minutes, with a few exceptions:
* Adding a new integration, or changing configuration of an existing one,
will trigger an out-of-schedule sync.
* If an integration fails due to authentication error (usually caused by invalid
credentials), it will be paused for up to 24 hours.
## [Audit log events](#audit-log-events)
The following [audit log events](/docs/features/logging/audit-logging#events) are added for device posture.
|**Target**|**Action**|**Description**|
|Integration|Create posture integration|A new posture integration was created|
|Integration|Update posture integration|A posture integration was updated|
|Integration|Removed posture integration|A posture integration was removed|
|Node|Update node attribute|Device posture attributes for a node were changed|
On this page
* [What is Huntress posture integration?](#what-is-huntress-posture-integration)
* [Prerequisites](#prerequisites)
* [Create Huntress API key and API secret](#create-huntress-api-key-and-api-secret)
* [Find your Huntress Organization ID](#find-your-huntress-organization-id)
* [Configure Huntress posture integration](#configure-huntress-posture-integration)
* [Check the integration status](#check-the-integration-status)
* [Check node attributes](#check-node-attributes)
* [Adjust Tailscale access rules](#adjust-tailscale-access-rules)
Scroll to top