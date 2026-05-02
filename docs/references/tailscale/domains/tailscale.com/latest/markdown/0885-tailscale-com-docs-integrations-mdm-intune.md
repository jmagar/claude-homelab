Restrict device access with Microsoft Intune · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Restrict device access with Microsoft Intune
Last validated: Jan 28, 2026
This integration is available for [the Standard, Premium, and Enterprise plans](/pricing).
[Microsoft Intune](https://www.microsoft.com/en-us/security/business/microsoft-intune) collects a series of signals from the MDM profile installed on devices and these signals can be used to determine the security posture of a device. Tailscale can fetch these signals from Intune and use them as device posture attributes in access rules, which can allow organizations to grant access to sensitive resources only to devices that have a high enough level of trust.
You can achieve this Tailscale's [device posture management](/docs/features/device-posture) features:
* [Device Identity Collection](/docs/features/access-control/device-management/how-to/manage-identity), which collects identifiers (for example, serial numbers), used to match devices in Tailscale to devices in Intune.
* Intune posture integration, which synchronizes signals from Intune to device posture attributes in Tailscale.
* [Posture conditions in access rules](/docs/features/device-posture#device-posture-conditions), which lets you configure access restrictions based on device attributes.
This guide explains how to enable Device Identity collection for your Tailscale network (tailnet) and configure Microsoft Intune posture integration.
## [What is Intune posture integration?](#what-is-intune-posture-integration)
The Intune integration syncs data between Intune and Tailscale on a recurring schedule.
During each sync, Tailscale performs the following actions:
1. Fetches a list of hosts and their reported data from your Intune account.
2. Matches Intune devices to devices in your tailnet based on serial numbers.
3. Writes the Intune data to device posture attributes on each matched device.
The integration writes the following device posture attributes to matched devices:
|**Attribute key**|**Description**|**Allowed values**|
|`intune:complianceState`|Compliance state of the device|`unknown`, `compliant`, `noncompliant`, `conflict`, `error`, `inGracePeriod`, `configManager`|
|`intune:azureADRegistered`|Whether the device is registered with Azure AD|`true`, `false`|
|`intune:deviceRegistrationState`|Registration state of the device|`notRegistered`, `registered`, `revoked`, `keyConflict`, `approvalPending`, `certificateReset`, `notRegisteredPendingEnrollment`, `unknown`|
|`intune:isSupervised`|Whether the device is supervised by Intune|`true`, `false`|
|`intune:isEncrypted`|Whether the device is encrypted|`true`, `false`|
|`intune:managedDeviceOwnerType`|Owner of the device|`unknown`, `company`, `personal`|
## [Prerequisites](#prerequisites)
Before you can set up the Microsoft Intune integration, make sure you have:
* [Device Identity Collection](/docs/features/access-control/device-management/how-to/manage-identity) enabled, and devices in your tailnet are reporting identifiers.
* An Azure Application credential to connect to Microsoft Intune.
## [Create Azure Application credential to connect Intune](#create-azure-application-credential-to-connect-intune)
To authenticate your Intune account with Tailscale, you'll need to create a set of [Azure Application credentials](https://portal.azure.com/).
The Microsoft Intune integration uses these credentials to connect to the [Microsoft Graph API](https://learn.microsoft.com/en-us/graph/use-the-api) and fetch a list of devices and their data from Intune.
To create an Azure Application and credentials:
1. In [Azure Portal](https://portal.azure.com/), in the **Azure Services** menu, select **App registrations**.
2. Select **New registration**.
3. Enter a name for the application, for example, `Tailscale` and select **Register**. Take note of the **Application (Client) ID** and **Directory (Tenant) ID** for later.
4. Under **Essentials**, select **Add a certificate or secret**.
5. Select **New client secret**.
6. Enter a description for the secret, select an expiration period, and select **Add**. Take note of the **Value** for later.
7. Under **API permissions**, select **Add a permission**.
8. Select **Microsoft Graph**.
9. Select **Application permissions**.
10. Search for and select **DeviceManagementManagedDevices.Read.All** and select **Add permissions**.
11. Select **Grant admin consent for *your-organization*** and select **Yes**.
## [Configure Intune posture integration](#configure-intune-posture-integration)
To configure Tailscale to fetch data about devices from Intune:
1. Open the [Device management](https://login.tailscale.com/admin/settings/device-management) page of the Tailscale admin console.
2. Under the **Device Posture Integrations** section, locate the Intune integration, then select **Connect**.
3. Select your **Microsoft Region**, the region where your Intune account is located.
4. Enter your **Application (Client) ID**, **Directory (Tenant) ID** and **Client Secret**.
5. Select **Connect to Intune**.
## [Review the integration status](#review-the-integration-status)
Next, check to ensure the Intune integration has run successfully.
1. Go to the **Device Posture Integrations** section of the [Device management](https://login.tailscale.com/admin/settings/device-management) page.
2. Locate the Intune integration under the **Integrations** section.
After the Intune integration runs successfully, it shows the time of the most recent sync, the number of synced devices, and any errors that occurred while synchronizing.
## [Check node attributes](#check-node-attributes)
After you set up the Microsoft Intune integration, you can confirm that Tailscale is writing the new node attributes for your Fleet devices from the Tailscale admin console.
1. Open the [Machines](https://login.tailscale.com/admin/machines) page of the Tailscale admin console.
2. Select a device to inspect.
3. The node attributes for the device are in the **Machine Details** section. This should include the set of `intune:` attributes listed previously.
You can also check device attributes using the [Tailscale API](/api#tag/devices/GET/device/{deviceId}/attributes).
## [Adjust Tailscale access rules](#adjust-tailscale-access-rules)
After you set up the Intune posture integration, and your devices have device posture attributes that reflect their signals as reported by Intune, you can use those device posture attributes as part of your posture rules.
For example, to only permit access to `tag:production` from devices that Intune reports as compliant and supervised by Intune, you can create a new posture and use it as part of a corresponding access rule:
```
`"postures": {
"posture:trusted": [
"intune:complianceState == 'compliant'",
"intune:isSupervised == true",
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
We have observed that Intune does not report serial numbers for some machines running Linux. Without serial number details, Tailscale will not be able to populate device posture attributes for such machines.
## [Audit log events](#audit-log-events)
The following [audit log events](/docs/features/logging/audit-logging#events) are added for device posture.
|**Target**|**Action**|**Description**|
|Integration|Create posture integration|A new posture integration was created|
|Integration|Update posture integration|A posture integration was updated|
|Integration|Removed posture integration|A posture integration was removed|
|Node|Update node attribute|Device posture attributes for a node were changed|
On this page
* [What is Intune posture integration?](#what-is-intune-posture-integration)
* [Prerequisites](#prerequisites)
* [Create Azure Application credential to connect Intune](#create-azure-application-credential-to-connect-intune)
* [Configure Intune posture integration](#configure-intune-posture-integration)
* [Review the integration status](#review-the-integration-status)
* [Check node attributes](#check-node-attributes)
* [Adjust Tailscale access rules](#adjust-tailscale-access-rules)
* [Limitations](#limitations)
Scroll to top