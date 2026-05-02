Manage multiple tailnets · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Manage multiple tailnets
Last validated: Feb 4, 2026
You can create multiple Tailscale networks (known as tailnets) under a single organization, using a common identity provider and domain.
Multiple tailnets are currently [in alpha](/docs/reference/tailscale-release-stages#alpha).
To create multiple tailnets for your organization, contact our [sales](/contact/sales) team.
An organization with multiple tailnets.
All additional tailnets must use the same domain and identity provider as your existing tailnet. At a future date, Tailscale will allow arbitrary combinations of identity providers and domains in your organization.
## [Create additional tailnets](#create-additional-tailnets)
Currently, users are not able to create additional tailnets in a self-serve manner. Contact your Account Executive or Solutions Engineer to create an additional tailnet on your behalf. You will need to provide:
* The desired [display name](/docs/concepts/tailnet-name#display-name) for your additional tailnet. You can change this display name later.
* Display names can be up to 65 characters and can contain letters, numbers, spaces, apostrophes, and hyphens. You may not use periods or underscores.
* The email address of the user who should be designated as the Owner of the additional tailnet. This must be an existing user in your current tailnet.
* Whether the tailnet should be listed for users that have not joined it.
## [Access the admin console of additional tailnets](#access-the-admin-console-of-additional-tailnets)
**All users in your organization** will be able to join additional tailnets that are created. If you want to restrict who is able to join an additional tailnet, you must turn on [User approval](/docs/features/access-control/user-approval) for that tailnet. At a future date, Tailscale will introduce granular access rules to determine which users are allowed to join additional tailnets.
### [Select an additional tailnet during sign-in](#select-an-additional-tailnet-during-sign-in)
In this example, Amelie has access to three tailnets in total, but has only joined Example tailnet 1 and Example tailnet 2.
When signing in to Tailscale, if your organization has multiple tailnets, you're directed to a tailnet selector that lets you choose the tailnet you wish to sign in to.
Additional tailnets that you have not joined display at the bottom of this selector unless marked as unlisted.
### [Switch to an additional tailnet from the admin console](#switch-to-an-additional-tailnet-from-the-admin-console)
To switch between admin consoles for your organization's tailnets, select your profile picture in the top right corner of the admin console, and choose the correct tailnet from the dropdown.
Only tailnets you have joined display. To join additional tailnets, select **Join additional tailnets**.
## [Add devices to your additional tailnet](#add-devices-to-your-additional-tailnet)
### [Authenticate devices through your identity provider](#authenticate-devices-through-your-identity-provider)
When you create an additional tailnet for your organization, it will appear as an option during the authentication flow for devices. Select the tailnet to which you'd like to add the device.
### [Authenticate devices with auth keys](#authenticate-devices-with-auth-keys)
The steps to add a device to an additional tailnet with an auth key have not changed. Sign into the tailnet's admin console or switch to that tailnet's console, and then follow the [standard steps for creating an auth key](/docs/features/access-control/auth-keys).
## [User and group provisioning](#user-and-group-provisioning)
If you enable [group syncing](/docs/features/user-group-provisioning) in any tailnet in your organization, you can reference those groups in [access control policies](/docs/features/access-control) in each of your organization's tailnets.
If you need to make any changes to your provisioning settings, you can do so only from the original tailnet that enabled provisioning. All other tailnets will have a read-only access for the groups which they can reference in their [access control policies](/docs/features/access-control).
Provisioned users are not yet synced across all your organization's tailnets. Users who are automatically provisioned to the original tailnet must still
manually join other tailnets.
### [Access control policy example](#access-control-policy-example)
Control which groups can access which resources in each of [your tailnet's policy files](/docs/features/tailnet-policy-file) tailnet-by-tailnet. Here's an example:
* In **tailnet 1** allow `group1@example.com` to access `tag:staging:443` resources, but not `group2@example.com`, with a [test](/docs/reference/syntax/policy-file#tests) to enforce this:
```
`{
"grants": [
{
// allow `group1` to access `tag:staging:443`
"src": ["group1@example.com"],
"dst": ["tag:staging"],
"ip": ["443"]
}
],
"tests": [
{
// deny `group2` access to `tag:staging:443`
"src": "group2@example.com",
"deny": ["tag:staging:443"]
}
]
}
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
* In **tailnet 2** allow `group2@example.com` to access `tag:production:443` resources, but not `group1@example.com`, with a [test](/docs/reference/syntax/policy-file#tests) to enforce this:
```
`{
"grants": [
{
// allow `group2` to access `tag:production:443`
"src": ["group2@example.com"],
"dst": ["tag:production"],
"ip": ["443"]
}
],
"tests": [
{
// deny `group1` access to `tag:production:443`
"src": "group1@example.com",
"deny": ["tag:production:443"]
}
]
}
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
## [Unlist tailnets](#unlist-tailnets)
If your organization has multiple tailnets, you may want to prevent users from seeing the tailnets that they have not joined. Unlisting a tailnet will hide it from users who have not joined it in the tailnet selector during login, though users can still join the tailnet by referencing it as a query parameter in the tailnet selector URL. To unlist a tailnet, contact your Account Executive or Solutions Engineer.
### [Give users access to an unlisted tailnet](#give-users-access-to-an-unlisted-tailnet)
Users may still join an unlisted tailnet by adding the `tailnet` query parameter with the [tailnet ID](/docs/concepts/tailnet-name#tailnet-id) in a link to the tailnet selector. This will cause the unlisted tailnet to display in the tailnet selector UI.
For example, if you have an unlisted tailnet with the tailnet ID "T123456789CNTRL", a user can join the tailnet by adding the tailnet query parameter to the tailnet selector URI:
```
`https://login.tailscale.com/welcome?tailnet=T123456789CNTRL
`
```
## [Limitations](#limitations)
* **All users in your organization** will be able to join additional tailnets that are created. If you want to restrict who is able to join an additional tailnet, you must turn on [User approval](/docs/features/access-control/user-approval) for that tailnet. At a future date, Tailscale will introduce granular access rules to determine which users are allowed to join additional tailnets.
* All additional tailnets must use the same domain and identity provider as your existing tailnet. At a future date, Tailscale will allow arbitrary combinations of identity providers and domains in your organization.
* Allow **Everyone** to [join external tailnets](/docs/features/sharing/how-to/invite-any-user#enable-or-disable-joining-external-tailnets) to let users join additional tailnets. You can still use [User and group provisioning](#user-and-group-provisioning) to control which groups and users can access resources within each tailnet.
* A GitHub organization account for [identity](/docs/features/user-group-provisioning) cannot be used to enable or create multiple tailnets.
On this page
* [Create additional tailnets](#create-additional-tailnets)
* [Access the admin console of additional tailnets](#access-the-admin-console-of-additional-tailnets)
* [Select an additional tailnet during sign-in](#select-an-additional-tailnet-during-sign-in)
* [Switch to an additional tailnet from the admin console](#switch-to-an-additional-tailnet-from-the-admin-console)
* [Add devices to your additional tailnet](#add-devices-to-your-additional-tailnet)
* [Authenticate devices through your identity provider](#authenticate-devices-through-your-identity-provider)
* [Authenticate devices with auth keys](#authenticate-devices-with-auth-keys)
* [User and group provisioning](#user-and-group-provisioning)
* [Access control policy example](#access-control-policy-example)
* [Unlist tailnets](#unlist-tailnets)
* [Give users access to an unlisted tailnet](#give-users-access-to-an-unlisted-tailnet)
* [Limitations](#limitations)
Scroll to top