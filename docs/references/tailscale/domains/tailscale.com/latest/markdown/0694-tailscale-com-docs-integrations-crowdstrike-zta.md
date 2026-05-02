Restrict device access with CrowdStrike ZTA scores · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Restrict device access with CrowdStrike ZTA scores
Last validated: Jan 28, 2026
This integration is available for [the Standard, Premium, and Enterprise plans](/pricing).
CrowdStrike Falcon [Zero Trust Assessment](https://www.crowdstrike.com/press-releases/crowdstrike-extends-zero-trust-to-endpoint-devices) calculates a numeric trust score (from 0 to 100) for each device that runs a Falcon agent. Using that score as part of access rules in Tailscale can allow organizations to grant access to sensitive resources only to devices that have a high enough level of trust.
You can achieve this with Tailscale's [device posture](/docs/features/device-posture) features:
* CrowdStrike Falcon posture integration, which synchronizes Zero Trust Assessment scores from CrowdStrike to device posture attributes in Tailscale.
* [Device Identity Collection](/docs/features/access-control/device-management/how-to/manage-identity), which collects identifiers such as serial numbers and MAC addresses, used to match devices in Tailscale to devices in CrowdStrike.
* [Posture conditions in access rules](/docs/features/device-posture#posture-conditions), which lets you configure access restrictions based on device attributes.
This guide explains how to enable Device Identity collection for your Tailscale network (tailnet) and configure CrowdStrike Falcon posture integration.
## [What is CrowdStrike Falcon posture integration?](#what-is-crowdstrike-falcon-posture-integration)
The CrowdStrike Falcon integration syncs data between Falcon and Tailscale on a recurring schedule.
During each sync, Tailscale performs the following actions:
1. Fetches a list of hosts and their ZTA score from your Falcon account.
2. Matches Falcon hosts to devices in your tailnet based on serial numbers.
3. Writes the Falcon data to a device posture attribute on each matched device.
The integration writes the following device posture attribute to matched devices:
|**Attribute key**|**Description**|**Allowed values**|
|`falcon:ztaScore`|Falcon ZTA score for the device|`number`|
## [Prerequisites](#prerequisites)
Before you can set up the CrowdStrike Falcon integration, make sure you have:
* [Device Identity Collection](/docs/features/access-control/device-management/how-to/manage-identity) enabled, and devices in your tailnet are reporting identifiers.
* A CrowdStrike Falcon account for which you have permission to create an API client.
## [Create CrowdStrike Falcon API credentials](#create-crowdstrike-falcon-api-credentials)
To authenticate your CrowdStrike Falcon account with Tailscale, you'll need to create a CrowdStrike Falcon API client.
The Falcon integration uses these to fetch a list of hosts and their ZTA score from Falcon.
To create a CrowdStrike Falcon API client:
1. In Falcon, open **Support and resources** and then **API clients and keys**.
2. Select **Create API client**.
3. Add a name. For the **Hosts** scope add **Read**, and for the **Zero Trust** scope add **Read**.
4. Select **Create**, then make sure to copy the displayed **Client ID** and **Client Secret**. These will be only displayed once.
Also make a note of the **Base URL** (for example, `https://api.us-2.crowdstrike.com`).
## [Configure CrowdStrike Falcon posture integration](#configure-crowdstrike-falcon-posture-integration)
To configure Tailscale to fetch the ZTA score for hosts from CrowdStrike Falcon:
1. Open the [Device management](https://login.tailscale.com/admin/settings/device-management) page of the Tailscale admin console.
2. Under the **Device Posture Integrations** section, locate the CrowdStrike Falcon integration, then select **Connect**.
3. Select your **CrowdStrike Cloud Region** (the **Base URL** from the API client).
4. Enter your **Client ID** and **Client Secret**.
5. Select **Connect to CrowdStrike Falcon**.
## [Review the integration status](#review-the-integration-status)
Next, check to ensure the CrowdStrike Falcon integration has run successfully.
1. Go to the **Device Posture Integrations** section of the [Device management](https://login.tailscale.com/admin/settings/device-management) page.
2. Locate the CrowdStrike Falcon integration under the **Integrations** section.
After the CrowdStrike Falcon integration runs successfully, it shows the time of the most recent sync, the number of synced devices, and any errors that occurred while synchronizing.≈
## [Check node attributes](#check-node-attributes)
After you set up the CrowdStrike Falcon integration, you can confirm that Tailscale is writing the new node attribute for your CrowdStrike Falcon devices from the Tailscale admin console.
1. Open the [Machines](https://login.tailscale.com/admin/machines) page of the Tailscale admin console.
2. Select a device to inspect.
3. The node attributes for the device are in the **Machine Details** section. This should include the `falcon:ztaScore` attribute.
You can also check device attributes using the [Tailscale API](/api#tag/devices/GET/device/{deviceId}/attributes).
## [Adjust Tailscale access rules](#adjust-tailscale-access-rules)
After you set up the CrowdStrike Falcon posture integration, and your devices have device posture attributes that reflect their signals as reported by CrowdStrike Falcon, you can use those device posture attributes as part of your posture rules.
For example, to only permit access to `tag:production` from devices that have a CrowdStrike ZTA score of 70 or higher, you can create a new posture and use it as part of a corresponding access rule:
```
`"postures": {
"posture:trusted": ["falcon:ztaScore \>= 70"],
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
* [What is CrowdStrike Falcon posture integration?](#what-is-crowdstrike-falcon-posture-integration)
* [Prerequisites](#prerequisites)
* [Create CrowdStrike Falcon API credentials](#create-crowdstrike-falcon-api-credentials)
* [Configure CrowdStrike Falcon posture integration](#configure-crowdstrike-falcon-posture-integration)
* [Review the integration status](#review-the-integration-status)
* [Check node attributes](#check-node-attributes)
* [Adjust Tailscale access rules](#adjust-tailscale-access-rules)
Scroll to top