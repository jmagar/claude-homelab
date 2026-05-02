Restrict device access with Iru · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Restrict device access with Iru
Last validated: Jan 28, 2026
This integration is available for [the Standard, Premium, and Enterprise plans](/pricing).
Iru is formerly known as Kandji. Several references to Kandji may still be found in instructions, code examples, and user interfaces.
[Iru](https://www.iru.com/) collects a series of signals from its agent installed on each device that can be used to determine the security posture of a device. Tailscale can fetch these signals from Iru and use them as device posture attributes in access rules, which can then be used by organizations to grant access to sensitive resources only to devices that have a high level of trust.
You can achieve this Tailscale's [device posture management](/docs/features/device-posture) features:
* Kandji posture integration, which synchronizes signals from Kandji to device posture attributes in Tailscale.
* [Device Identity Collection](/docs/features/access-control/device-management/how-to/manage-identity), which collects identifiers (for example, serial numbers), used to match devices in Tailscale to devices in Kandji.
* [Posture conditions in access rules](/docs/features/device-posture#device-posture-conditions), which enables configuration of access restrictions based on device attributes.
This guide explains how to enable Device Identity collection for your Tailscale network (tailnet) and configure Kandji posture integration.
## [What is Kandji posture integration?](#what-is-kandji-posture-integration)
Kandji posture integration lets you connect your Tailscale network to Kandji. The integration runs periodically and copies signals from Kandji to device posture attributes.
When configured, it will periodically:
* Fetch a list of devices recorded in your Kandji account, and their details.
* Match Kandji devices with corresponding devices in your tailnet, based on the serial number associated with a device.
* Write the data from each device into the following Tailscale device posture attributes:
|**Attribute key**|**Description**|**Allowed values**|
|`kandji:mdmEnabled`|whether the device is enrolled in Iru (Kandji) MDM|`true`, `false`|
|`kandji:agentInstalled`|whether the Iru (Kandji) agent is present on the device|`true`, `false`|
## [Prerequisites](#prerequisites)
Before you can set up the Kandji integration, make sure you have:
* [Device Identity Collection](/docs/features/access-control/device-management/how-to/manage-identity) enabled, and devices in your tailnet are reporting identifiers.
* A Kandji account for which you have permission to create an API token.
## [Create Kandji API Token](#create-kandji-api-token)
To authenticate your Kandji account with Tailscale, you'll need to create a Kandji API Token.
The Kandji integration uses these to fetch a list of devices and their data from Kandji.
To create a Kandji API Token:
1. In Kandji, in the left-hand panel, select **Settings**.
2. From the top menu, select **Access** and select **Add Token**.
3. Add a name for the API token and select **Create**.
4. The **API Token** will be shown once, make sure to copy it for use later and select **Next**.
5. In the new dialog, select **Configure** to configure the permissions for the API token.
6. Under **Prism**, select **Device Information** (`/api/v1/prism/device\_information`) and select **Save** in the right corner.
7. Under **Access**, make note of your organization's API URL, for example `https://your-organization.api.kandji.io`.
## [Configure Kandji posture integration](#configure-kandji-posture-integration)
To configure Tailscale to fetch data about devices from Kandji:
1. Open the [Device management](https://login.tailscale.com/admin/settings/device-management) page of the Tailscale admin console.
2. Under the **Device Posture Integrations** section, locate the Kandji integration, then select **Connect**.
3. Enter your **Kandji API URL**, the URL you use to access the Kandji console.
4. Enter your **API Token**.
5. Select **Connect to Kandji**.
## [Review the integration status](#review-the-integration-status)
Next, check to ensure the Kandji integration has run successfully.
1. Go to the **Device Posture Integrations** section of the [Device management](https://login.tailscale.com/admin/settings/device-management) page.
2. Locate the Kandji integration under the **Integrations** section.
After the Kandji integration runs successfully, it shows the time of the most recent sync, the number of synced devices, and any errors that occurred while synchronizing.
## [Check node attributes](#check-node-attributes)
After you set up the Kandji integration, you can confirm that Tailscale is writing the new node attributes for your Kandji devices from the Tailscale admin console.
1. Open the [Machines](https://login.tailscale.com/admin/machines) page of the Tailscale admin console.
2. Select a device to inspect.
3. The node attributes for the device are in the **Machine Details** section. This should include the set of `kandji:` attributes listed previously.
You can also check device attributes using the [Tailscale API](/api#tag/devices/GET/device/{deviceId}/attributes).
## [Adjust Tailscale access rules](#adjust-tailscale-access-rules)
After you set up the Kandji posture integration, and your devices have device posture attributes that reflect their signals as reported by Kandji, you can use those device posture attributes as part of your posture rules.
For example, to only permit access to `tag:production` from devices that have an active Kandji agent, you can create a new posture and use it as part of a corresponding access rule:
```
`"postures": {
"posture:trusted": [
"kandji:agentInstalled == true",
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
* [What is Kandji posture integration?](#what-is-kandji-posture-integration)
* [Prerequisites](#prerequisites)
* [Create Kandji API Token](#create-kandji-api-token)
* [Configure Kandji posture integration](#configure-kandji-posture-integration)
* [Review the integration status](#review-the-integration-status)
* [Check node attributes](#check-node-attributes)
* [Adjust Tailscale access rules](#adjust-tailscale-access-rules)
Scroll to top