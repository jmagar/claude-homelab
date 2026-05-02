Restrict device access with SentinelOne · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Restrict device access with SentinelOne
Last validated: Jan 28, 2026
This integration is available for [the Standard, Premium, and Enterprise plans](/pricing).
SentinelOne collects a series of signals from its agents that can be used to determine the security posture of a device. Tailscale can fetch these signals from SentinelOne and use them as device posture attributes in access rules, which can allow organizations to grant access to sensitive resources only to devices that have a high enough level of trust.
You can achieve this Tailscale's [device posture management](/docs/features/device-posture) features:
* SentinelOne posture integration, which synchronizes signals from SentinelOne to device posture attributes in Tailscale.
* [Device Identity Collection](/docs/features/access-control/device-management/how-to/manage-identity), which collects identifiers (for example, serial numbers), used to match devices in Tailscale to devices in SentinelOne.
* [Posture conditions in access rules](/docs/features/device-posture#device-posture-conditions), which lets you configure access restrictions based on device attributes.
This guide explains how to enable Device Identity collection for your Tailscale network (tailnet) and configure SentinelOne posture integration.
## [What is SentinelOne posture integration?](#what-is-sentinelone-posture-integration)
The SentinelOne integration syncs data between SentinelOne and Tailscale on a recurring schedule.
During each sync, Tailscale performs the following actions:
1. Fetches a list of agents and their reported data from your SentinelOne account.
2. Matches SentinelOne agents to devices in your tailnet based on serial numbers.
3. Writes the SentinelOne data to device posture attributes on each matched device.
The integration writes the following device posture attributes to matched devices:
|**Attribute key**|**Description**|**Allowed values**|
|`sentinelOne:operationalState`|Operational state of the agent, the string `na` means that the agent has not been disabled or corrupted. This is the expected state.|`string`|
|`sentinelOne:activeThreats`|Number of active threats detected by the agent|`number`|
|`sentinelOne:agentVersion`|Version of the running SentinelOne agent|`version`|
|`sentinelOne:encryptedApplications`|Whether the agent detects that the disk is encrypted|`true`, `false`|
|`sentinelOne:firewallEnabled`|Whether the agent detects that the firewall is enabled|`true`, `false`|
|`sentinelOne:infected`|Whether the agent detects that the device is infected|`true`, `false`|
## [Prerequisites](#prerequisites)
Before you can set up the SentinelOne integration, make sure you have:
* [Device Identity Collection](/docs/features/access-control/device-management/how-to/manage-identity) enabled, and devices in your tailnet are reporting identifiers.
* A SentinelOne account for which you have permission to create an API token.
## [Create SentinelOne Service User and API Token](#create-sentinelone-service-user-and-api-token)
To authenticate your SentinelOne account with Tailscale, you'll need to create a SentinelOne User and API token.
The SentinelOne integration uses these to fetch a list of agents and their data from SentinelOne.
To create a SentinelOne User and API token:
1. In SentinelOne, in the left-hand panel, select **Settings**.
2. From the top menu, select **Users** and then in the left-hand panel, select **Service Users**.
3. Select **Actions** and then select **Create New Service User**.
4. Add a name and expiration date for the Service User and select **Next**.
5. Choose the site or account that the Service User will have access to and select **Create**.
6. The **API Token** will be shown once, make sure to copy it for use later.
Also make a note of the **Base URL** (for example, `https://example.sentinelone.net/`).
## [Configure SentinelOne posture integration](#configure-sentinelone-posture-integration)
To configure Tailscale to fetch data about agents from SentinelOne:
1. Open the [Device management](https://login.tailscale.com/admin/settings/device-management) page of the Tailscale admin console.
2. Under the **Device Posture Integrations** section, locate the SentinelOne integration, then select **Connect**.
3. Enter your **SentinelOne URL**, the URL you use to access the SentinelOne console.
4. Enter your **API Token**.
5. Select **Connect to SentinelOne**.
## [Review the integration status](#review-the-integration-status)
Next, check to ensure the SentinelOne integration has run successfully.
1. Go to the **Device Posture Integrations** section of the [Device management](https://login.tailscale.com/admin/settings/device-management) page.
2. Locate the SentinelOne integration under the **Integrations** section.
After the SentinelOne integration runs successfully, it shows the time of the most recent sync, the number of synced devices, and any errors that occurred while synchronizing.≈
## [Check node attributes](#check-node-attributes)
After you set up the SentinelOne integration, you can confirm that Tailscale is writing the new node attributes for your SentinelOne devices from the Tailscale admin console.
1. Open the [Machines](https://login.tailscale.com/admin/machines) page of the Tailscale admin console.
2. Select a device to inspect.
3. The node attributes for the device are in the **Machine Details** section. This should include the set of `sentinelOne:` attributes listed previously.
You can also check device attributes using the [Tailscale API](/api#tag/devices/GET/device/{deviceId}/attributes).
## [Adjust Tailscale access rules](#adjust-tailscale-access-rules)
After you set up the SentinelOne posture integration, and your devices have device posture attributes that reflect their signals as reported by SentinelOne, you can use those device posture attributes as part of your posture rules.
For example, to only permit access to `tag:production` from devices that have an active SentinelOne agent, a good operational state, and have zero active threats, you can create a new posture and use it as part of a corresponding access rule:
```
`"postures": {
"posture:trusted": [
"sentinelOne:operationalState == 'na'",
"sentinelOne:activeThreats == 0",
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
## [Limitations](#limitations)
* We have observed that SentinelOne does not report serial numbers for some machines running Linux. Without serial number details, Tailscale will not be able to populate device posture attributes for such machines.
## [Audit log events](#audit-log-events)
The following [audit log events](/docs/features/logging/audit-logging#events) are added for device posture.
|**Target**|**Action**|**Description**|
|Integration|Create posture integration|A new posture integration was created|
|Integration|Update posture integration|A posture integration was updated|
|Integration|Removed posture integration|A posture integration was removed|
|Node|Update node attribute|Device posture attributes for a node were changed|
On this page
* [What is SentinelOne posture integration?](#what-is-sentinelone-posture-integration)
* [Prerequisites](#prerequisites)
* [Create SentinelOne Service User and API Token](#create-sentinelone-service-user-and-api-token)
* [Configure SentinelOne posture integration](#configure-sentinelone-posture-integration)
* [Review the integration status](#review-the-integration-status)
* [Check node attributes](#check-node-attributes)
* [Adjust Tailscale access rules](#adjust-tailscale-access-rules)
* [Limitations](#limitations)
Scroll to top