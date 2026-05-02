Group devices with tags · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Group devices with tags
Last validated: Dec 4, 2025
Tags are available for [all plans](/pricing).
All plans include 50 tagged devices. If you need more than 50 tagged devices, contact our [Sales team](/contact/sales).
Tailscale tags are how you authenticate and identify non-user devices, such as servers and [ephemeral nodes](/docs/features/ephemeral-nodes). They serve two primary purposes: to provide an identity to non-user devices and to let you manage [access control policies](/docs/features/access-control) based on *purpose*. In this context, a purpose could be anything from hosting a web server to serving as a [subnet router](/docs/features/subnet-routers) for employees in a specific geographic location.
Tags are essentially service accounts, but with more flexibility⎯you can assign multiple tags to a device to account for multiple purposes. For example, you might have a device that runs a PostgreSQL database and serves as a web server for internal access. In such a scenario, you could assign the device the following tags (each of which you could target individually using access control policies): `tag:postgresql`, `tag:internal-access`, and `tag:web-server`.
Other key characteristics of tags include:
* Applying a tag to a device removes any user-based authentication.
* Each non-user device can have as many tags as you need.
* Tags are defined in the tailnet policy file in the `tagOwners` section.
* Only designated tag owners can apply tags to devices; each tag can have as many owners as necessary.
## [Requirements](#requirements)
Tags are a free feature and are available for all pricing plans. However, you must have permission to perform some tag-related operations:
* You must be an [Owner, Admin, or Network admin](/docs/reference/user-roles) of a tailnet to define a tag in the tailnet policy file.
* You must be a tag owner to assign a tag to a device. [Owner, Admin, or Network admin](/docs/reference/user-roles) can apply any tag, even if they don't own the tag.
## [Limitations](#limitations)
Tags have the following limitations and restrictions:
* You cannot remove all tags from a device. A device with a tag-based identity must have at least one tag.
* You cannot remove tags using the `--advertise-tags` flag if the device uses an auth key. Instead, generate a new auth key with the latest set of tags.
* [IP sets](/docs/features/tailnet-policy-file/ip-sets) do not support tags.
* Devices with a tag-based identity can only SSH into other tagged devices; they cannot SSH into devices with a user-based identity.
* Some restrictions exist around using tags to define a group or as the SSH source.
## [Use cases](#use-cases)
Tags are ideal for managing devices you don't want to link to a specific user (such as a server hosting a web application) because removing a user also removes all their devices. If you link a service-providing device to a user, you lose that device if you remove the user. Removing a user won't affect the device if you use tags to manage the device instead. Do not use tags to associate a user device with a user account. Tags are not designed to tie individual users to a device. They're intended to manage devices with service account roles. Using tags as a substitute for users poses a security risk because the user's devices will remain on your network even if you remove the user.
Tags provide a way to allow multiple users to manage a device. When you manage devices with users, you must link each device to a single user, which isn't ideal for devices that host shared resources. However, when you manage devices with tags, you can assign one or more users as tag owners with tags. These users can manage all the devices with the tags they own.
**Warnings about tags**
Only use tags for non-human machines. Users can only access and use Tailscale through their designated user accounts. Using tags to annotate user devices is poor practice because a device cannot simultaneously have a user and a tag. Adding a tag to a device removes the associated user. Devices can have tags or a user account, not both.
Use tags to:
* Manage devices you don't have tied to a specific user (such as a server hosting a web application).
* Manage devices you want to allow multiple users to manage.
Do not use tags to:
* Annotate user devices.
* Link a user device with a user.
* Authenticate end-user devices, such as laptops or mobile devices.
## [Ownership](#ownership)
There's no "tag" section of the tailnet policy file. Instead, you define tags by their owners in the `tagOwners` section of the tailnet policy file. Only owners of a tag can apply that tag to devices in your Tailscale network (known as a tailnet). Tag owners can be users, groups, or even other tags, which means you can create complex tag [ownership hierarchies](#advanced-tag-hierarchies).
A tagged device's identity is the combination of all its tags (not the intersection). You can assign any number of tags to a device and manage the permissions for each tag separately. For example, if you have a device with the tags `tag:postgresql`, `tag:prod`, and `tag:ci-cd`, an access control policy for any one of these tags would apply to the device.
[Owner, Admin, or Network admin](/docs/reference/user-roles) can apply any tag, even if they aren't tag owners.
## [Tag vs. user authentication](#tag-vs-user-authentication)
Tags are parallel to user authentication. They serve the same role as a user account, except they're intended for service-based devices, such as a web server or an app connector. As a result, it's impossible for a user account identity and a tag identity to exist on the same device. Applying a tag to a device previously authenticated with a user account removes the user account. Similarly, authenticating a device with a user account removes all tags from the device.
Because tags are for non-user devices, they have qualities and limitations that make them unsuitable for authenticating end-user devices, such as a MacBook or a mobile device. For example, devices with a tag-based identity cannot use SSH to connect to a device with a user-based identity.
## [Key expiry](#key-expiry)
When you apply a tag to a device for the first time and authenticate it, the tagged device's key expiry is disabled by default.
If you re-authenticate a device tagged before March 10, 2022, its expiry will be disabled by default.
If you change the tags on the device from the admin console, [Tailscale CLI](/docs/reference/tailscale-cli), or the [Tailscale API](/docs/reference/tailscale-api), the device's key expiry will not change unless you re-authenticate. After you re-authenticate, Tailscale disables the device's key expiry.
You can enable or disable key expiry on a device from the [Machines](https://login.tailscale.com/admin/machines) page of the admin console or by using the Tailscale API.
## [Tags in the Tailscale ecosystem](#tags-in-the-tailscale-ecosystem)
Like many aspects of a tailnet, you can define and manage tags in the tailnet policy file. While limitations prevent you from using them to authenticate end-user devices, they work seamlessly with nearly every other Tailscale feature, including exit nodes, subnet routers, app connectors, access control lists, and grants.
### [Exit nodes](#exit-nodes)
Using a device as an [exit node](/docs/features/exit-nodes) means that other tailnet devices can choose to route all their internet traffic through that device. Routing all traffic through an exit node lets you encrypt internet traffic and access internal networks. For example, you could run a device as an exit node in a corporate office. That way, employees can access the corporate office's internal network when they use that exit node. Although end-user devices can function as exit nodes, it's more common for exit nodes to use a tag-based identity.
### [Subnet routers](#subnet-routers)
A [subnet router](/docs/features/subnet-routers) is a tailnet device you use to advertise subnet routes to the rest of your tailnet. They're a great way to add entire subnets to your tailnet without installing the Tailscale client to any of the devices (except the subnet router). Although end-user devices can function as subnet routers, it's more common for subnet routers to use a tag-based identity.
### [App connectors](#app-connectors)
An [app connector](/docs/features/app-connectors) is a device that routes app-specific traffic in your tailnet. A device running as an app connector is strictly a service-based device. As a result, you must use a tag-based identity to authenticate a device you plan to use as an app connector.
### [Access controls](#access-controls)
You can use tags to select and target service-based devices in your tailnet to create access control policies using ACLs and grants. Because Tailscale can identify tagged devices by any one of their assigned tags, the access control policies that apply to a device with many tags could become complex. As a result, it's best practice to maintain clear documentation of how you leverage and manage tags in your tailnet.
#### [ACLs](#acls)
You can use tags as part of [access control lists (ACLs)](/docs/features/access-control/acls) to make it easier to manage which types of devices should be able to communicate. For example, you might use a tag named `tag:prod` for production servers and production databases, then allow all devices with the `tag:prod` tag to communicate with each other.
The following example [tailnet policy file](/docs/reference/glossary#tailnet-policy-file) lets all devices tagged `tag:prod` communicate with each other.
```
`{
"acls": [
{
"action": "accept",
"src": ["tag:prod"],
"dst": ["tag:prod:\*"],
},
],
}
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
You can also ensure that the ACLs for your tagged devices work as expected with [tests](/docs/reference/syntax/policy-file#tests), which verify your tailnet policy file before saving and applying it.
For example, to verify that your tailnet policy file lets users in the `tag:sre` group to access devices tagged `tag:prod`, you might write an ACL like the following example:
```
`"tests": [
{
"src": "group:sre",
"accept": ["tag:prod:1234"],
},
],
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
#### [Grants](#grants)
Like ACLs, you can use tags in grants to target a group of tagged devices. The following example grants devices with the `tag:prod` tag access to devices with the `tag:tailsql` tag.
```
`{
"grants": [
{
"src": ["tag:prod"],
"dst": ["tag:tailsql"],
"ip": ["\*"]
}
]
}
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
### [Autogroups](#autogroups)
[Autogroups](/docs/reference/targets-and-selectors) are pre-defined groups of devices in your tailnet that would be difficult to create as custom groups. One of these autogroups is `autogroup:tagged`, which selects all devices with a tag-based identity.
You cannot use `autogroup:tagged` to define an IP set or a custom group.
## [Advanced tag hierarchies](#advanced-tag-hierarchies)
Designating tag owners is flexible by design. You can assign as many tag owners as you need to a device, and these tag owners can be users, groups, or other tags. Because you can assign a tag as an owner of another tag, it's possible to create complex hierarchies of tag ownership. As a result, it's best practice to maintain clear documentation of how you use tags and to audit tags using tools such as [access control policy tests](/docs/reference/syntax/policy-file#tests).
## [Best practices](#best-practices)
To leverage tags effectively, consider the following best practices:
* **Define clear naming conventions for tags**. Ideally, tag names should follow a consistent and descriptive pattern throughout your tailnet. Defining and enforcing a naming convention early on reduces the likelihood of problems such as ambiguous tag names later on. For example, a tag named "foo-bar" doesn't tell you anything about what the tag is intended for, but a tag name "prod-postgresql-server" tells you that the tag is for PostgreSQL servers in a production environment. However, even with descriptive names, it's a good idea to document your organization's tag conventions.
* **Use auth keys**. By using [auth keys](/docs/features/access-control/auth-keys) with pre-assigned tags, you can streamline the process of authenticating and approving tagged devices.
* **Don't use tags to authenticate user-owned devices**. Tags are intended to authenticate servers and devices that provide a service, which means they have qualities that make them unsuitable for end-user devices, such as a MacBook or an Android phone. Additionally, a device cannot simultaneously use tag-based and user-based identities. Adding a tag to a previously user-authenticated device removes the user's identity.
* **Carefully consider each tag's owners**. Tags are defined by their owners in the `tagOwners` section of the tailnet policy file. Because of their flexibility and the ability for a tag to own another tag, tags can take on [complex ownership hierarchies](#advanced-tag-hierarchies).
### [Common patterns for tag names](#common-patterns-for-tag-names)
Tags let you reflect access patterns and network segments based on your organization's requirements. These access patterns and network segments usually fall into a few common categories. Use consistent patterns for tag names based on these categories to make your access control policies easier to understand and maintain over time. Some common categories of access to consider in your tag names are:
* **Server role**: for example, application server, database, or queue.
* **Application name**: for example, support console, finance reporting, or operations dashboard.
* **Environment**: for example, production, staging, or development
* **Location**: for example, Americas, EMEA, South Asia.
While a device can have many tags assigned to it, tags are not "joined" for access rules. For example, you cannot define a rule that permits access to devices with both `tag:prod` and `tag:database`. Instead, you can use a composite tag such as `tag:prod-database` to represent this type of segmented access pattern. Below are some examples of composite tags.
|**Tag**|**Access control**|
|`tag:prod-app`|To production application servers|
|`tag:nonprod-db`|To non-production database servers|
|`tag:prod-app-finance-reporting`|To the production finance reporting application|
|`tag:prod-emea-app-support-console`|To the production support console application in EMEA|
|`tag:prod-asiasouth-ingest-logging`|To the production logging ingest endpoint in South Asia.|
## [Working with tags](#working-with-tags)
Use the following sections to find more information about working with tags:
* [Define a tag](#define-a-tag).
* [Define tag owners](#define-tag-owners).
* [Apply tags to a device](#apply-a-tag-to-a-device).
* [Apply a tag from another tag](#apply-a-tag-from-another-tag).
### [Define a tag](#define-a-tag)
Before assigning a tag to a device, you must create the tag in the [tailnet policy file](/docs/reference/syntax/policy-file) and define who can use that tag to authenticate devices. You create a tag by defining it in the [`tagOwners`](/docs/reference/syntax/policy-file#tag-owners) section of the tailnet policy file.
The following example creates the tag `tag:server` and assigns `dave@example.com` as the sole owner. Only the tag owner can apply the tag.
```
`{
"tagOwners": {
"tag:server": ["dave@example.com"], // dave@example.com can authenticate devices with the tag:server tag
}
}
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
Tailscale ignores tag name case and parses all tags in the tailnet policy file as lowercase.
### [Define tag owners](#define-tag-owners)
You must explicitly define who can use a tag to grant its permissions on a device. You can define tag owners in the [`tagOwners`](/docs/reference/syntax/policy-file#tag-owners) section of the tailnet policy file.
A tag can also have an empty list of owners in the tailnet policy file. All tags are implicitly owned by [Owners, Admins, and Network admins](/docs/reference/user-roles) of a tailnet. You can apply these tags to devices from the admin console and as part of an [auth key](/docs/features/access-control/auth-keys).
The following example shows the `tag:infrastructure` with no tag owners.
```
`{
"tagOwners": {
"tag:server": ["dave@tailscale.com"],
"tag:infrastructure": [], // No tag owners defined
}
}
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
### [Apply a tag to a device](#apply-a-tag-to-a-device)
You can tag devices using the admin console, the [Tailscale CLI](/docs/reference/tailscale-cli), or the Tailscale API.
When you re-authenticate and tag a device, it generates a new [node key](/docs/concepts/node-keys) for the device. The [Tailscale IP address](/docs/concepts/tailscale-ip-addresses) for the device does not change.
#### [Apply a tag to a device in the admin console](#apply-a-tag-to-a-device-in-the-admin-console)
You must be an [Owner, Admin, or Network admin](/docs/reference/user-roles) of a tailnet to tag a device from the [admin console](https://login.tailscale.com/admin). You don't need to re-authenticate because the current user is automatically used to authenticate the device.
To tag a device from the admin console:
1. Open the [Machines](https://login.tailscale.com/admin/machines) page in the admin console.
2. Find the row corresponding to the device you are interested in.
3. Select on the menu at the far right, then select the **Edit tags** option.
4. Add, change, or remove desired tags. To apply a tag, it must already exist in the [tailnet policy file](/docs/reference/glossary#tailnet-policy-file).
5. Select **Save** to apply tags.
[Owners, Admins, and Network admins](/docs/reference/user-roles) can apply any tag from the admin console even if they don't own the tag.
You cannot remove all tags from a tagged device in the admin console because the device must have an identity. Either assign the device a new tag or re-authenticate to Tailscale from the device.
#### [Apply a tag to a device with the CLI](#apply-a-tag-to-a-device-with-the-cli)
You can use the [Tailscale CLI](/docs/reference/tailscale-cli) to add and remove tags from devices running Linux, macOS, or Windows. To tag other devices, use the admin console.
To assign tags to a device using the CLI, run `tailscale login` command with the `--advertise-tags=tag:\<tag-name\>` flag.
```
`sudo tailscale login --advertise-tags=tag:server
`
```
To assign multiple tags to a device, pass multiple tags (separated with commas) to the `--advertise-tags` flag.
```
`sudo tailscale login --advertise-tags=tag:server,tag:development
`
```
To remove all tags from a device, use the `--advertise-tags=` flag without any values.
```
`sudo tailscale login --advertise-tags=
`
```
You cannot remove tags using the `--advertise-tags` flag if the device uses an auth key. Instead, generate a new auth key with the new set of tags.
You might need to change the signed-in user on the device if it's already authenticated with another user. To re-authenticate with the current user, add the `--force-reauth` flag to the `tailscale up` command:
```
`sudo tailscale up --advertise-tags=tag:server --force-reauth
`
```
#### [Apply a tag to a device using the API](#apply-a-tag-to-a-device-using-the-api)
You can apply a tag to a device using the [Update device tags](/api#tag/devices/POST/device/{deviceId}/tags) method from the [Tailscale API](/docs/reference/tailscale-api).
To apply a tag this way, send a `POST` request for a device, with the body specifying the desired `tags`. For example:
```
`curl https://api.tailscale.com/api/v2/device/11055/tags \\
-u "tskey-\<key\>" \\
-H "Content-Type: application/json" \\
--data-binary '{"tags": ["tag:foo", "tag:bar"]}'
`
```
### [Apply a tag from another tag](#apply-a-tag-from-another-tag)
You can apply different tags from those in the [auth key](/docs/features/access-control/auth-keys) when you authenticate. However, doing so replaces the device's existing tags.
**Important for OAuth authentication**: When an OAuth client or auth key assigns tags to a device, the requested tags must either exactly match the full set of tags on the OAuth client or auth key, or each requested tag must be owned by one of the authenticating entity's tags as defined in the `tagOwners` section. The exact-match check does not consult `tagOwners`—it merely verifies the requested tags are identical to the authenticating tags. For any other combination, including applying a subset of tags, ownership must be explicitly configured in `tagOwners`.
Applying a tag from another tag is useful for larger infrastructure deployments, where you might need to tag many servers, typically using a deployment tool. For example, you could have your deployment system tagged with `tag:deployment-1`, which owns both `tag:prod-2` and `tag:test-2`:
```
` "TagOwners": {
"tag:deployment-1": ["alice@tailscale.com"],
"tag:prod-2": ["tag:deployment-1"],
"tag:test-2": ["tag:deployment-1"],
},
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
In this configuration, an OAuth client with `tag:deployment-1` can apply either `tag:prod-2` or `tag:test-2` to devices. An OAuth client whose only tag is `tag:prod-2` can also apply `tag:prod-2`, since the tags are an exact match. However, if an OAuth client holds multiple tags and needs to apply only a subset of them, each requested tag must be owned by one of the authenticating tags. To support this, add the tag as its own owner:
```
` "TagOwners": {
"tag:deployment-1": ["alice@tailscale.com"],
"tag:prod-2": ["tag:deployment-1", "tag:prod-2"],
"tag:test-2": ["tag:deployment-1", "tag:test-2"],
},
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
You could generate an [auth key](/docs/features/access-control/auth-keys) `\<key-1\>` with the tag `tag:deployment-1`, and make it available to the deployment tool. Then, depending on what workload you deploy, the system authenticates the device and applies the correct infrastructure tag, which enforces the correct [access controls](/docs/features/access-control). When spinning up a new production server, the deployment tool could tag the device as `tag:prod-2`:
```
`sudo tailscale up --auth-key=\<key-1\> --advertise-tags=tag:prod-2
`
```
On this page
* [Requirements](#requirements)
* [Limitations](#limitations)
* [Use cases](#use-cases)
* [Ownership](#ownership)
* [Tag vs. user authentication](#tag-vs-user-authentication)
* [Key expiry](#key-expiry)
* [Tags in the Tailscale ecosystem](#tags-in-the-tailscale-ecosystem)
* [Exit nodes](#exit-nodes)
* [Subnet routers](#subnet-routers)
* [App connectors](#app-connectors)
* [Access controls](#access-controls)
* [ACLs](#acls)
* [Grants](#grants)
* [Autogroups](#autogroups)
* [Advanced tag hierarchies](#advanced-tag-hierarchies)
* [Best practices](#best-practices)
* [Common patterns for tag names](#common-patterns-for-tag-names)
* [Working with tags](#working-with-tags)
* [Define a tag](#define-a-tag)
* [Define tag owners](#define-tag-owners)
* [Apply a tag to a device](#apply-a-tag-to-a-device)
* [Apply a tag to a device in the admin console](#apply-a-tag-to-a-device-in-the-admin-console)
* [Apply a tag to a device with the CLI](#apply-a-tag-to-a-device-with-the-cli)
* [Apply a tag to a device using the API](#apply-a-tag-to-a-device-using-the-api)
* [Apply a tag from another tag](#apply-a-tag-from-another-tag)
Scroll to top