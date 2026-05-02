Restrict device access with Fleet · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Restrict device access with Fleet
Last validated: Jan 29, 2026
This integration is available for [the Standard, Premium, and Enterprise plans](/pricing).
[Fleet Device Management](https://fleetdm.com/) collects a series of signals from its agent installed on each device that can be used to determine the security posture of a device.
Tailscale can fetch these signals from Fleet and use them as device posture attributes in access rules, which can then be used by organizations to grant access to sensitive resources only to devices that have a high level of trust.
You can achieve this with Tailscale's [device posture management](/docs/features/device-posture) features:
* [Device Identity Collection](/docs/features/access-control/device-management/how-to/manage-identity), which collects identifiers (for example, serial numbers), used to match devices in Tailscale to devices in Fleet.
* Fleet posture integration, which synchronizes signals from Fleet to device posture attributes in Tailscale.
* [Posture conditions in access rules](/docs/features/device-posture#device-posture-conditions), which lets you configure access restrictions based on device attributes.
This guide explains how to enable Device Identity collection for your Tailscale network (tailnet) and configure Fleet posture integration.
## [What is Fleet posture integration?](#what-is-fleet-posture-integration)
The Fleet integration syncs data between Fleet and Tailscale on a recurring schedule.
During each sync, Tailscale performs the following actions:
1. Fetches a list of hosts and their reported data from your Fleet account.
2. Matches Fleet devices to devices in your tailnet based on serial numbers.
3. Writes the Fleet data to device posture attributes on each matched device.
The integration writes the following device posture attributes to matched devices:
|**Attribute key**|**Description**|**Allowed values**|
|`fleet:present`|whether the device is managed by Fleet|`true`, `false`|
|`fleetPolicy:{name}`|whether the device matches a Fleet policy|`true`, `false`|
## [Prerequisites](#prerequisites)
Before you can set up the Fleet integration, make sure you have:
* [Device Identity Collection](/docs/features/access-control/device-management/how-to/manage-identity) enabled, and devices in your tailnet are reporting identifiers.
* A Fleet account for which you have permission to create an API token.
## [Create Fleet API token](#create-fleet-api-token)
To authenticate your Fleet account with Tailscale, you'll need to create a Fleet API-only user and API token.
The Fleet integration uses these to fetch a list of devices and their data from Fleet.
You can find instructions for creating a Fleet API-only user and API token [in the Fleet documentation](https://fleetdm.com/guides/fleetctl#using-fleetctl-with-an-api-only-user).
## [Create Fleet policies](#create-fleet-policies)
[Fleet policies](https://fleetdm.com/securing/what-are-fleet-policies) let you monitor whether your devices meet specific security and compliance criteria.
These policies are specific to your Fleet account.
The Fleet integration can add [node attributes](/docs/reference/syntax/policy-file#nodeattrs) to devices that are passing Fleet policies.
To enable adding these node attributes, add the string `Tailscale: fleetPolicy:{attributeName}` to your Fleet policy description.
For each Fleet policy a device passes, the Fleet integration will add a `fleetPolicy:{attributeName}` node attribute to that device.
You can check for the presence of a given Fleet policy in a device's node attributes in access rules, then adjust its access accordingly.
## [Configure Fleet posture integration](#configure-fleet-posture-integration)
To configure Tailscale to fetch data about devices from Fleet:
1. Open the [Device management](https://login.tailscale.com/admin/settings/device-management) page of the Tailscale admin console.
2. Under the **Device Posture Integrations** section, locate the Fleet integration, then select **Connect**.
3. Enter your **Fleet URL** and **API Token**.
4. Select **Connect to Fleet**.
## [Review the integration status](#review-the-integration-status)
Next, check to ensure the Fleet integration has run successfully.
1. Go to the **Device Posture Integrations** section of the [Device management](https://login.tailscale.com/admin/settings/device-management) page.
2. Locate the Fleet integration under the **Integrations** section.
After the Fleet integration runs successfully, it shows the time of the most recent sync, the number of synced devices, and any errors that occurred while synchronizing.
## [Check node attributes](#check-node-attributes)
After you set up the Fleet integration, you can confirm that Tailscale is writing the new node attributes for your Fleet devices from the Tailscale admin console.
1. Open the [Machines](https://login.tailscale.com/admin/machines) page of the Tailscale admin console.
2. Select a device to inspect.
3. Check the node attributes for the device in the **Machine Details** section. This section should include the set of `fleet:` and `fleetPolicy:` attributes listed previously.
You can also check device attributes using the [Tailscale API](/api#tag/devices/GET/device/{deviceId}/attributes).
## [Adjust Tailscale access rules](#adjust-tailscale-access-rules)
After you set up the Fleet posture integration, and your devices have device posture attributes that reflect their signals as reported by Fleet, you can use those device posture attributes as part of your posture rules.
For example, to only permit access to `tag:production` from devices that are managed by Fleet, you can create a new posture and use it as part of a corresponding access rule:
```
`"postures": {
"posture:managed": [
"fleet:present",
],
},
"grants": [
{
"src": ["autogroup:member"],
"dst": ["tag:production"],
"ip": ["\*"],
"srcPosture": ["posture:managed"]
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
* [What is Fleet posture integration?](#what-is-fleet-posture-integration)
* [Prerequisites](#prerequisites)
* [Create Fleet API token](#create-fleet-api-token)
* [Create Fleet policies](#create-fleet-policies)
* [Configure Fleet posture integration](#configure-fleet-posture-integration)
* [Review the integration status](#review-the-integration-status)
* [Check node attributes](#check-node-attributes)
* [Adjust Tailscale access rules](#adjust-tailscale-access-rules)
Scroll to top