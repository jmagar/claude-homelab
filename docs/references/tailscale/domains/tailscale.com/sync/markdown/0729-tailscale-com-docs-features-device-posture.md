Device posture management · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Device posture management
Last validated: Jan 22, 2026
Device posture is a mechanism to measure how secure or trustworthy a device is. With Tailscale you can collect device attributes and use them as part of connectivity rules within your Tailscale network (known as a tailnet). You can use these rules to limit access for devices in your tailnet that do not meet security requirements.
Device attributes include pre-populated host information such as operating system version, as well as custom attributes from endpoint detection and response tools.
Benefits of device posture include:
* **Enhanced security**—reduce risks from compromised or non-compliant devices by verifying the device security state and configuration before granting tailnet access.
* **Context-aware access controls**—limit access to critical applications and tailnet resources based on the state of a device; providing elevated access for high-compliance devices or completely blocking access for non-compliant devices.
* **Continuous verification**—ongoing assessment of device health and compliance enables adaptive access controls.
## [Usage by plan](#usage-by-plan)
Your Tailscale pricing plan determines which device posture configurations you are entitled to use.
|**Attribute types**|**Plan**|
|Default|All plans|
|Third-party integration attributes (MDM and EDR)|Standard, Premium, Enterprise|
|Geolocation|Standard, Premium, Enterprise|
|Custom|Premium, Enterprise|
For more information, refer to our [Pricing](/pricing) page.
## [Use cases](#use-cases)
* **Remote work security**—ensure employees' devices meet security standards before accessing company resources.
* **Bring your own device (BYOD)**—safely enable BYOD with tiered access to applications and tailnet resources for un-managed and managed devices with device state incorporated.
* **Move toward Zero Trust**—help your organization achieve [Zero Trust](/docs/concepts/zero-trust) with micro-segmentation, least-privileged access, continuous verification, and adaptive policy.
## [How it works](#how-it-works)
### [Authorize device API](#authorize-device-api)
If you have an endpoint device posture solution, you may already know which machines in your tailnet do and do not meet your device posture requirements.
One approach to ensuring devices on your network comply with your device posture policy is to use the [Authorize device API](/api#tag/devices/POST/device/{deviceId}/authorized). This lets you only authorize devices that meet your requirements, de-authorize devices that do not meet your requirements, by temporarily disabling tailnet access until you determine that their posture has been resolved, at which point you can re-authorize the devices.
## [Device posture attributes](#device-posture-attributes)
Device posture attributes are key-value pairs of data attached to devices that you can either read and write for your own use, or use in posture access rules. These attributes are in namespaces. For example, the attribute key `node:os` is in the `node` namespace, and the key `custom:myAttribute` is in the `custom` namespace. Attribute values can be one of three different types: strings, numbers, or Boolean values.
Posture attributes bring together data from several different sources all in one place:
* Host information reported by devices, such as OS version and Tailscale version in the `node` namespace.
* Information about client devices that is collected by Tailscale control plane, such as geolocation data for the public IP of a device in the `ip` namespace.
* Custom posture attributes set by you, or software you have integrated with our API, in the `custom` namespace.
* Attributes set by device posture integrations like [CrowdStrike Falcon](/docs/integrations/crowdstrike-zta) and [others](#edr-and-mdm-integrations).
Posture attributes are distinct from [`nodeAttrs`](/docs/reference/syntax/policy-file#nodeattrs). The existing `nodeAttrs` are set as flags only, not as key-value pairs.
The following posture attributes are currently available by default, for use in access rule postures, and using the node attribute API:
|**Attribute key**|**Description**|**Allowed values**|
|`node:os`|The operating system the device is running|`macos`, `windows`, `linux`, `ios`, `android`, `freebsd`, `openbsd`, `illumos`, `js`|
|`node:osVersion`|The version of the operating system|A version as a quoted string|
|`node:tsAutoUpdate`|Whether the Tailscale client is configured for [auto-updates](/docs/features/client/update#auto-updates)|`true`, `false`|
|`node:tsReleaseTrack`|The release track of the Tailscale client|`stable`, `unstable`|
|`node:tsStateEncrypted`|Whether the Tailscale client state is encrypted at rest|`true`, `false`|
|`node:tsVersion`|The version of Tailscale the client is running|A version as a quoted string|
The `node:tsAutoUpdate` attribute is only set to `true` when Tailscale's
built-in [auto-update](/docs/features/client/update#auto-updates) is enabled. It is set to
`false` when Tailscale is updated using an external mechanism, such as the
Apple App Store or Google Play Store.
The Tailscale control plane also provides device posture attributes with geolocation data.
|**Attribute key**|**Description**|**Allowed values**|
|`ip:country`|Country that the node's public IP address is associated with|Uppercase two-letter country code defined in [ISO 3166-1](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)|
A machine's attributes and respective values are visible in the **Machine Details** page for each device in your tailnet.
### [Examples](#examples)
The following examples demonstrate the formatting to use for each type of attribute key.
|**Attribute key**|**Example**|
|`ip:country`|`ip:country in ['CA', 'US', 'GB', 'NL']`|
|`node:os`|`node:os IN ['macos', 'linux']`|
|`node:osVersion`|`node:osVersion == '13.4.0'`|
|`node:tsAutoUpdate`|`node:tsAutoUpdate == true`|
|`node:tsReleaseTrack`|`node:tsReleaseTrack == 'stable'`|
|`node:tsVersion`|`node:tsVersion \>= '1.42.2'`|
|`custom:attr`|`custom:attr IS SET`|
## [Device posture conditions](#device-posture-conditions)
Postures and posture conditions let you create automated network [access control rules](/docs/features/access-control) based on device posture.
A posture is a set of assertions based on device posture attributes. For example, you might specify that the operating system needs to be newer than a particular version.
Posture conditions are a feature for [access rules](/docs/reference/syntax/policy-file#acls), allowing you to make them conditional on device posture in addition to source, destination, and protocol. This lets you write flexible and fine-grained access controls for your tailnet.
You can use posture conditions to create basic rules, such as denying all access to devices that don't meet your posture requirements, or you can control access with far more granularity. For example, you can require devices to meet stricter security requirements to connect to production. Or you can disallow access to most of your corporate network for devices that don't meet your posture requirements, but still allow them to reach the IT help desk.
### [Postures](#postures)
A posture is a set of assertions made about posture attributes and only apply to devices initiating the connection. Each posture must start with `posture:` followed by a name, and a set of posture attributes and their values, given as a list of strings.
```
`"postures": {
"posture:latestMac": [
"node:os IN ['macos', 'linux']",
"node:tsReleaseTrack == 'stable'",
"node:tsVersion \>= '1.40'",
],
},
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
Currently supported operators:
* `==`
* `!=`
* `IN`
* `NOT IN`
* `IS SET`
* `NOT SET`
* `\<`, `\<=`, `\>=`, `\>` (only for numbers and version attributes: `node:osVersion` and `node:tsVersion`)
Versions are compared using [a compare function](https://github.com/tailscale/tailscale/blob/main/util/cmpver/version.go) which will take into account versions with both numeric and non-numeric fields.
For a posture to match a device, all posture attribute values must be met. In the above example:
* The operating system must be macOS or Linux
* The devices must use the stable release version of the Tailscale client
* Tailscale client version must be 1.40 or later
Posture conditions can be made against any posture attributes, default and custom.
If an attribute defined in the posture is unset for a particular device, the posture will not match that device, irrespective of the operator used. For example, a device that does not have the `custom:tier` attribute assigned to it, will not match a posture that includes an attribute `custom:tier`, even if that condition is negative (for example, `custom:tier != 'prod'`).
You can create multiple postures in one policy file:
```
`"postures": {
"posture:latestMac": [
"node:os == 'macos'",
"node:osVersion == '13.4.0'",
"node:tsReleaseTrack == 'stable'",
],
"posture:anyMac": [
"node:os == 'macos'",
"node:tsReleaseTrack == 'stable'",
],
},
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
### [Posture conditions](#posture-conditions)
A posture condition is an extension to the existing tailnet policy file syntax, allowing you to define access rules dependent on device posture:
```
`"grants": [
{
// Only requirement to access development servers is Mac + stable Tailscale
"src": ["autogroup:member"],
"dst": ["tag:development"],
"ip": ["\*"],
"srcPosture": ["posture:anyMac"]
},
{
// Only devs can access production
// and production access requires macOS is also up to date
"src": ["group:dev"],
"dst": ["tag:production"],
"ip": ["\*"],
"srcPosture": ["posture:latestMac"]
}
]
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
Access rules can require that any of a list of postures is required for access to be permitted:
```
`"grants": [
{
"src": ["group:dev"],
"dst": ["tag:production"],
"ip": ["\*"],
"srcPosture": ["posture:approvedMacs", "posture:approvedWindows", "posture:approvedLinux"]
}
]
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
In this example, access is permitted to production if the connecting device meets any of the three specified postures.
`srcPosture` conditions only apply to traffic originating from Tailscale nodes within the same network, since only those devices have attribute values that can be evaluated against a defined posture. Shared nodes and devices behind [subnet routers](/docs/features/subnet-routers) will not have their traffic restricted based on postures, and will be permitted access if they match IP-based conditions (`src`, `dst`, `proto`).
### [Default source posture](#default-source-posture)
If you want to apply a baseline posture that applies to all of your access rules, you can set a default source posture:
```
`"defaultSrcPosture": [
"posture:basicWindows",
"posture:basicMac",
"posture:basicLinux",
],
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
As with `srcPosture` in access rules, this permits access if any of the supplied postures are met.
If a default source posture is set, it will apply to any access rules that do not have a posture condition. Note that it is not additive, meaning if an access rule specifies a posture condition, only that condition will apply, and the default source posture condition will no longer apply. This can be used to create an access rule that is more permissive than the default:
```
`"grants": [
{
// defaultSrcPosture applies to this rule
"src": ["autogroup:member"],
"dst": ["tag:intranet"],
"ip": ["\*"]
},
{
"src": ["group:dev", "group:sre"],
"dst": ["tag:production"],
"ip": ["\*"],
// This posture condition is instead of, not in addition to, the default source posture
"srcPosture": ["posture:prodWin", "posture:prodMac"]
}
]
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
`defaultSrcPosture` conditions only apply to traffic originating from Tailscale nodes within the same network, since only those devices have attribute values that can be evaluated against a defined posture. Shared nodes and devices behind [subnet routers](/docs/features/subnet-routers) will not have their traffic restricted based on postures, and will be permitted access if they match IP-based conditions (`src`, `dst`, `proto`).
### [Tailscale SSH and Posture Conditions](#tailscale-ssh-and-posture-conditions)
Connections created with the [Tailscale SSH Console](/docs/features/tailscale-ssh/tailscale-ssh-console) are also subject to posture condition restrictions. To allow these connections, you can allow the posture condition `node:os == 'js'`.
### [Shared Nodes and Posture Conditions](#shared-nodes-and-posture-conditions)
Posture conditions specified with `srcPosture` and `defaultSrcPosture` are only
applied to `src` devices within your tailnet. If you have used Tailscale's [node sharing](/docs/features/sharing) to grant access to a device to a user outside of your
tailnet, that user's device will be able to connect regardless of their posture.
If you wish for your posture conditions to apply to external users, consider
[inviting the user into your tailnet](/docs/features/sharing/how-to/invite-any-user).
## [Check device posture status](#check-device-posture-status)
Within the Tailscale admin console, you can check the device posture status for any machine in your network.
To check the device posture status:
1. Open the [Machines](https://login.tailscale.com/admin/machines) page of the admin console.
2. Find the machine whose certificate status you want to check. You can use the [search bar](/docs/features/access-control/device-management/how-to/filter#filter-with-the-search-bar) or [filters](/docs/features/access-control/device-management/how-to/filter) to find a machine.
3. Select the machine.
4. Check the device posture status in the **postures** section of the machine page.
If a machine is not passing a posture, hover over the shield icon to see which posture assertions it is failing.
## [EDR and MDM integrations](#edr-and-mdm-integrations)
Integrate your endpoint detection and response (EDR) and mobile device management (MDM) tools with Tailscale's device posture management capabilities:
* [CrowdStrike Falcon](/docs/integrations/crowdstrike-zta)
* [SentinelOne](/docs/integrations/sentinelone)
* [1Password XAM](/docs/integrations/kolide)
* [Fleet](/docs/integrations/fleet)
* [Huntress](/docs/integrations/huntress)
* [Iru](/docs/integrations/iru) (formerly Kandji)
* [Jamf Pro](/docs/integrations/jamf-pro)
* [Microsoft Intune](/docs/integrations/mdm/intune)
## [Posture attributes API](#posture-attributes-api)
Information about device posture attributes API is available in our [API documentation](/api#tag/devices/GET/device/{deviceId}/attributes).
## [Audit log events](#audit-log-events)
The following [audit log events](/docs/features/logging/audit-logging#events) are added for device posture.
|**Target**|**Action**|**Description**|
|Node|Update node attribute|Device posture attributes for a node were changed|
Changes to built-in attributes (the ones in `node` and `ip` namespaces) are only
logged if an attribute is referenced by any of the postures used in the policy
file. Changes to custom attributes and third-party attributes from device
posture integrations are always logged.
On this page
* [Usage by plan](#usage-by-plan)
* [Use cases](#use-cases)
* [How it works](#how-it-works)
* [Authorize device API](#authorize-device-api)
* [Device posture attributes](#device-posture-attributes)
* [Examples](#examples)
* [Device posture conditions](#device-posture-conditions)
* [Postures](#postures)
* [Posture conditions](#posture-conditions)
* [Default source posture](#default-source-posture)
* [Tailscale SSH and Posture Conditions](#tailscale-ssh-and-posture-conditions)
* [Shared Nodes and Posture Conditions](#shared-nodes-and-posture-conditions)
* [Check device posture status](#check-device-posture-status)
* [EDR and MDM integrations](#edr-and-mdm-integrations)
* [Posture attributes API](#posture-attributes-api)
* [Audit log events](#audit-log-events)
Scroll to top