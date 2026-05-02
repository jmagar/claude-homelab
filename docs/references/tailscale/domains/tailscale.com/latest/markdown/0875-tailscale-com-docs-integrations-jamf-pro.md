Restrict device access with Jamf Pro · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Restrict device access with Jamf Pro
Last validated: Jan 28, 2026
This integration is available for [the Standard, Premium, and Enterprise plans](/pricing).
[Jamf Pro](https://www.jamf.com/products/jamf-pro/) collects a series of signals from the MDM profile installed on devices and these signals can be used to determine the security posture of a device. Tailscale can fetch these signals from Jamf Pro and use them as device posture attributes in access rules, which can allow organizations to grant access to sensitive resources only to devices that have a high enough level of trust.
You can achieve this Tailscale's [device posture management](/docs/features/device-posture) features:
* [Device Identity Collection](/docs/features/access-control/device-management/how-to/manage-identity), which collects identifiers (for example, serial numbers), used to match devices in Tailscale to devices in Jamf Pro.
* Jamf Pro posture integration, which synchronizes signals from Jamf Pro to device posture attributes in Tailscale.
* [Posture conditions in access rules](/docs/features/device-posture#device-posture-conditions), which lets you configure access restrictions based on device attributes.
This guide explains how to enable Device Identity collection for your Tailscale network (tailnet) and configure Jamf Pro posture integration.
## [What is Jamf Pro posture integration?](#what-is-jamf-pro-posture-integration)
The Jamf Pro integration syncs data between Jamf Pro and Tailscale on a recurring schedule.
During each sync, Tailscale performs the following actions:
1. Fetches a list of hosts and their reported data from your Jamf Pro account.
2. Matches Jamf Pro devices to devices in your tailnet based on serial numbers.
3. Writes the Jamf Pro data to device posture attributes on each matched device.
The integration writes the following device posture attributes to matched devices:
|**Attribute key**|**Description**|**Allowed values**|
|`jamfPro:remoteManaged`|Whether the device is managed by Jamf Pro|`true`, `false`|
|`jamfPro:supervised`|Whether the device is supervised by Jamf Pro|`true`, `false`|
|`jamfPro:firewallEnabled`|Whether the macOS firewall is enabled|`true`, `false`|
|`jamfPro:fileVaultStatus`|Status of FileVault disk encryption|`ALL\_ENCRYPTED`, `SOME\_ENCRYPTED`, `BOOT\_ENCRYPTED`, `NOT\_ENCRYPTED`, `NOT\_APPLICABLE`|
|`jamfPro:SIPEnabled`|Whether macOS System Integrity Protection is enabled|`NOT\_COLLECTED`, `NOT\_AVAILABLE`, `DISABLED`, `ENABLED`|
## [Prerequisites](#prerequisites)
Before you can set up the Jamf Pro integration, make sure you have:
* [Device Identity Collection](/docs/features/access-control/device-management/how-to/manage-identity) enabled, and devices in your tailnet are reporting identifiers.
* A Jamf Pro account for which you have permission to create an API token.
## [Create Jamf Pro API Token](#create-jamf-pro-api-token)
To authenticate your Jamf Pro account with Tailscale, you'll need to create a Jamf Pro API Token.
The Jamf Pro integration uses these to fetch a list of devices and their data from Jamf Pro.
To create a Jamf Pro API Token:
1. In Jamf Pro, in the left-hand panel, select **Settings**.
2. Select **API roles and clients**.
3. Select **+ New** in the upper right corner.
4. Add a Display Name for the API role and add "Read Computers" to **Privileges** and then select **Save**.
5. Go back to the **API roles and clients** screen and select **API Clients** and select **+ New** in the upper right corner.
6. Add a Display Name for the API Client and select the API Role created in the previous step, toggle **Enable API client**, and then select **Save**.
7. Select **Generate client secret** and select **Create secret** in the pop-up dialog. Make sure to copy the **Client ID** and **Client Secret** for use in the next section.
## [Configure Jamf Pro posture integration](#configure-jamf-pro-posture-integration)
To configure Tailscale to fetch data about devices from Jamf Pro:
1. Open the [Device management](https://login.tailscale.com/admin/settings/device-management) page of the Tailscale admin console.
2. Under the **Device Posture Integrations** section, locate the Jamf Pro integration, then select **Connect**.
3. Enter your **Jamf API URL**, the URL you use to access the Jamf Pro console.
4. Enter your **Client ID**.
5. Enter your **Client Secret**.
6. Select **Connect to Jamf**.
## [Review the integration status](#review-the-integration-status)
Next, check to ensure the Jamf Pro integration has run successfully.
1. Go to the **Device Posture Integrations** section of the [Device management](https://login.tailscale.com/admin/settings/device-management) page.
2. Locate the Jamf Pro integration under the **Integrations** section.
After the Jamf Pro integration runs successfully, it shows the time of the most recent sync, the number of synced devices, and any errors that occurred while synchronizing.
## [Check node attributes](#check-node-attributes)
After you set up the Jamf Pro integration, you can confirm that Tailscale is writing the new node attributes for your Jamf Pro devices from the Tailscale admin console.
1. Open the [Machines](https://login.tailscale.com/admin/machines) page of the Tailscale admin console.
2. Select a device to inspect.
3. The node attributes for the device are in the **Machine Details** section. This should include the set of `jamfPro:` attributes listed previously.
You can also check device attributes using the [Tailscale API](/api#tag/devices/GET/device/{deviceId}/attributes).
## [Adjust Tailscale access rules](#adjust-tailscale-access-rules)
After you set up the Jamf Pro posture integration, and your devices have device posture attributes that reflect their signals as reported by Jamf Pro, you can use those device posture attributes as part of your posture rules.
For example, to only permit access to `tag:production` from devices that are actively managed and supervised by Jamf Pro, you can create a new posture and use it as part of a corresponding access rule:
```
`"postures": {
"posture:trusted": [
"jamfPro:remoteManaged == true",
"jamfPro:supervised == true",
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
* [What is Jamf Pro posture integration?](#what-is-jamf-pro-posture-integration)
* [Prerequisites](#prerequisites)
* [Create Jamf Pro API Token](#create-jamf-pro-api-token)
* [Configure Jamf Pro posture integration](#configure-jamf-pro-posture-integration)
* [Review the integration status](#review-the-integration-status)
* [Check node attributes](#check-node-attributes)
* [Adjust Tailscale access rules](#adjust-tailscale-access-rules)
Scroll to top