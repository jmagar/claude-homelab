Restrict device access with 1Password Extended Access Management (XAM) · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Restrict device access with 1Password Extended Access Management (XAM)
Last validated: Jan 28, 2026
This integration is available for [the Standard, Premium, and Enterprise plans](/pricing).
[1Password Extended Access Management](https://1password.com/xam) (previously, [Kolide](https://kolide.com/)) collects a series of signals from its agent installed on each device that can be used to determine the security posture of a device. Tailscale can fetch these signals from XAM and use them as device posture attributes in access rules, which can then be used by organizations to grant access to sensitive resources only to devices that have a high level of trust.
You can achieve this Tailscale's [device posture management](/docs/features/device-posture) features:
* [Device Identity Collection](/docs/features/access-control/device-management/how-to/manage-identity), which collects identifiers (for example, serial numbers), used to match devices in Tailscale to devices in XAM.
* XAM posture integration, which synchronizes signals from XAM to device posture attributes in Tailscale.
* [Posture conditions in access rules](/docs/features/device-posture#device-posture-conditions), which lets you configure access restrictions based on device attributes.
This guide explains how to enable Device Identity collection for your Tailscale network (tailnet) and configure XAM posture integration.
## [What is 1Password XAM (Kolide) posture integration?](#what-is-1password-xam-kolide-posture-integration)
The 1Password XAM (Kolide) integration syncs data between XAM and Tailscale on a recurring schedule.
During each sync, Tailscale performs the following actions:
1. Fetches a list of hosts and their reported data from your XAM account.
2. Matches XAM devices to devices in your tailnet based on serial numbers.
3. Writes the XAM data to device posture attributes on each matched device.
The integration writes the following device posture attributes to matched devices:
|**Attribute key**|**Description**|**Allowed values**|
|`kolide:authState`|Authorization status of the device|`Good`, `Notified`, `Will Block`, `Blocked`|
## [Prerequisites](#prerequisites)
Before you can set up the 1Password XAM (Kolide) integration, make sure you have:
* [Device Identity Collection](/docs/features/access-control/device-management/how-to/manage-identity) enabled, and devices in your tailnet are reporting identifiers.
* A 1Password XAM (Kolide) account for which you have permission to create an API token.
## [Create 1Password XAM (Kolide) API Key](#create-1password-xam-kolide-api-key)
To authenticate your 1Password XAM (Kolide) account with Tailscale, you'll need to create a 1Password XAM (Kolide) API Key.
The 1Password XAM (Kolide) integration uses these to fetch a list of devices and their data from 1Password XAM (Kolide).
To create a 1Password XAM (Kolide) API Key:
1. Select your user avatar in the upper-right corner of the [1Password XAM (Kolide) UI](https://app.kolide.com/).
2. In the dropdown menu, select **Settings**.
3. In the menu on the left, select **Developers**.
4. In the sub-menu that appears, select **API Keys**.
5. On the next screen, select **Create New Key**.
6. In the modal that appears, provide a name for the Key and the name of a XAM administrator who will be responsible for the API Key's usage, and select **Save**.
7. Once saved, the secret token is available in the table. Select the duplicate button to copy the token to your clipboard.
## [Configure 1Password XAM (Kolide) posture integration](#configure-1password-xam-kolide-posture-integration)
To configure Tailscale to fetch data about devices from 1Password XAM (Kolide):
1. Open the [Device management](https://login.tailscale.com/admin/settings/device-management) page of the Tailscale admin console.
2. Under the **Device Posture Integrations** section, locate the 1Password XAM (Kolide) integration, then select **Connect**.
3. Enter your **API Key**.
4. Select **Connect to 1Password XAM (Kolide)**.
## [Review the integration status](#review-the-integration-status)
Next, check to ensure the 1Password XAM (Kolide) integration has run successfully.
1. Go to the **Device Posture Integrations** section of the [Device management](https://login.tailscale.com/admin/settings/device-management) page.
2. Locate the 1Password XAM (Kolide) integration under the **Integrations** section.
After the 1Password XAM (Kolide) integration runs successfully, it shows the time of the most recent sync, the number of synced devices, and any errors that occurred while synchronizing.≈
## [Check node attributes](#check-node-attributes)
After you set up the 1Password XAM (Kolide) integration, you can confirm that Tailscale is writing the new node attributes for your 1Password XAM (Kolide) devices from the Tailscale admin console.
1. Open the [Machines](https://login.tailscale.com/admin/machines) page of the Tailscale admin console.
2. Select a device to inspect.
3. The node attributes for the device are in the **Machine Details** section. This should include the set of `kolide:` attributes listed previously.
You can also check device attributes using the [Tailscale API](/api#tag/devices/GET/device/{deviceId}/attributes).
## [Adjust Tailscale access rules](#adjust-tailscale-access-rules)
After you set up the 1Password XAM (Kolide) posture integration, and your devices have device posture attributes that reflect their signals as reported by 1Password XAM (Kolide), you can use those device posture attributes as part of your posture rules.
For example, to only permit access to `tag:production` from devices that are reported as good by the 1Password XAM (Kolide) agent, you can create a new posture and use it as part of a corresponding access rule:
```
`"postures": {
"posture:trusted": [
"kolide:authState != 'Blocked'",
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
* [What is 1Password XAM (Kolide) posture integration?](#what-is-1password-xam-kolide-posture-integration)
* [Prerequisites](#prerequisites)
* [Create 1Password XAM (Kolide) API Key](#create-1password-xam-kolide-api-key)
* [Configure 1Password XAM (Kolide) posture integration](#configure-1password-xam-kolide-posture-integration)
* [Review the integration status](#review-the-integration-status)
* [Check node attributes](#check-node-attributes)
* [Adjust Tailscale access rules](#adjust-tailscale-access-rules)
Scroll to top