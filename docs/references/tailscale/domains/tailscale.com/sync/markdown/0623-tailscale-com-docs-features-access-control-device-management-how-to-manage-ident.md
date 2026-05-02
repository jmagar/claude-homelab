Use Device Identity Collection · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Use Device Identity Collection
Last validated: Jan 5, 2026
Device Identity Collection is available for [the Enterprise plan](/pricing).
Device Identity Collection collects identifiers such as serial numbers and MAC addresses from devices in your Tailscale network (known as a tailnet). It is required for device posture integrations like [CrowdStrike Falcon](/docs/integrations/crowdstrike-zta), and can be useful for correlating your devices between Tailscale and other systems.
This document provides instructions on:
* How to enable Device Identity Collection for your tailnet.
* How to enable Device Identity Collection on machines in your tailnet.
## [Prerequisites](#prerequisites)
To configure the machines in your tailnet you will need either:
* access to the machine to run the `tailscale` CLI; or
* a Mobile Device Management (MDM) system.
## [Enabling Device Identity Collection for your tailnet](#enabling-device-identity-collection-for-your-tailnet)
1. Open the [Device management](https://login.tailscale.com/admin/settings/device-management) page of the Tailscale admin console.
2. Under the **Device Posture Integrations** section, select the toggle under **Device Identity Collection**.
## [Enabling Device Identity Collection for devices in your tailnet](#enabling-device-identity-collection-for-devices-in-your-tailnet)
Devices in your tailnet need to be individually opted-in to reporting their identity.
Device identity collection was added in Tailscale 1.52.
There are two ways to opt-in a device to reporting its identity: by setting a system policy (for example, by using an MDM), or by using the CLI.
### [Enabling Device Identity Collection by using system policies](#enabling-device-identity-collection-by-using-system-policies)
You can opt a device in to identity reporting by [setting the policy key](/docs/features/tailscale-system-policies) `PostureChecking` to `always`. This lets you opt-in devices using an MDM or configuration management system. Note that the Tailscale client needs to be restarted for this change to take effect. For more information on setting system policies, refer to [Customize Tailscale using system policies](/docs/features/tailscale-system-policies).
Using system policies is the recommended way to enable device identity collection on macOS and Windows. It takes priority over configuration set by using the CLI.
### [Enabling Device Identity Collection by using the CLI](#enabling-device-identity-collection-by-using-the-cli)
You can also opt-in a device by running the [`tailscale set`](/docs/reference/tailscale-cli#set) CLI command on it and then reconnecting the client:
[Linux](/docs/features/access-control/device-management/how-to/manage-identity?tab=linux)[macOS](/docs/features/access-control/device-management/how-to/manage-identity?tab=macos)[Windows](/docs/features/access-control/device-management/how-to/manage-identity?tab=windows)
```
`sudo tailscale set --posture-checking=true
sudo tailscale down
sudo tailscale up
`
```
Using the CLI command is the only way to opt-in a Linux device to identity collection.
## [Check collection progress](#check-collection-progress)
In the **Device Posture** section of the [Device management](https://login.tailscale.com/admin/settings/device-management) page, you will find a summary of serial number collection.
You can select **Inspect** to review which machines have a particular status, for example, to find machines that have not been opted in yet.
## [Check device identifiers](#check-device-identifiers)
You can review identifiers for your devices on the **Machine page** of the admin console.
1. Open the [Machines](https://login.tailscale.com/admin/machines) page of the admin console.
2. Select a machine you want to inspect.
3. Review the device identity and collection status in the **Machine Details** section.
Device identity is also available from the [device API](/api#tag/devices/GET/device/{deviceId}).
By default, Device Identity Collection fetches device serial numbers. Some posture integrations, like [CrowdStrike Falcon](/docs/integrations/crowdstrike-zta), can also use MAC addresses for device matching, which will be collected if required by such an integration.
## [Limitations](#limitations)
* On iOS, tvOS, and Android, third-party apps like Tailscale cannot access the device serial number. On iOS or tvOS, an MDM solution can provide a serial number to the Tailscale client by using the `DeviceSerialNumber` [MDM key](/docs/features/tailscale-system-policies#specify-the-device-serial-number).
On this page
* [Prerequisites](#prerequisites)
* [Enabling Device Identity Collection for your tailnet](#enabling-device-identity-collection-for-your-tailnet)
* [Enabling Device Identity Collection for devices in your tailnet](#enabling-device-identity-collection-for-devices-in-your-tailnet)
* [Enabling Device Identity Collection by using system policies](#enabling-device-identity-collection-by-using-system-policies)
* [Enabling Device Identity Collection by using the CLI](#enabling-device-identity-collection-by-using-the-cli)
* [Check collection progress](#check-collection-progress)
* [Check device identifiers](#check-device-identifiers)
* [Limitations](#limitations)
Scroll to top