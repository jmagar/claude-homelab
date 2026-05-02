User & group provisioning for Okta · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# User & group provisioning for Okta
Last validated: Jan 5, 2026
This feature is available for [the Standard, Premium, and Enterprise plans](/pricing).
Tailscale supports System for Cross-domain Identity Management (SCIM) to integrate with Okta.
## [Features](#features)
The following provisioning features are supported:
* **Create users** in Tailscale from Okta
* **Update user attributes** in Tailscale from Okta
* **Deactivate users** in Okta to suspend them in Tailscale
* **Group push** from Okta to Tailscale
## [Requirements](#requirements)
* Install the Tailscale app from the
[Okta Integration Network](https://www.okta.com/integrations/tailscale) and [configure it](/docs/integrations/identity/okta) to activate Okta for your domain.
If you're using Tailscale through a [custom app integration](https://help.okta.com/en-us/Content/Topics/Apps/Apps_App_Integration_Wizard.htm)
you'll need to replace that configuration with the Tailscale app and configuration.
* You must use **Email** as the **Application username format**, and each Okta user's primary email must be identical to their application username. Failure to do so will result in errors.
## [Step-by-Step Configuration Instructions](#step-by-step-configuration-instructions)
Use the following steps to enable provisioning in Tailscale.
### [Enable Provisioning](#enable-provisioning)
#### [In Tailscale](#in-tailscale)
**Generate a SCIM API key**
1. In the [User management](https://login.tailscale.com/admin/settings/user-management) page of the admin console, under **SCIM Provisioning**, select **Enable Provisioning**.
2. Copy the generated key to the clipboard.
#### [In Okta](#in-okta)
**Copy the key into the Tailscale app**
1. (Optional) On the **Sign On** tab, in **Advanced Sign-on Settings** select the Tailscale instance to connect to. For most users, leave the default option **Tailscale** selected. If you need to connect to the US high compliance server, select **Tailscale (US high compliance) – must be allowlisted** and fill out the [Identity provider configuration or change](/contact/support?type=sso) section of the support form.
2. On the **Provisioning** tab, select **Integration**, then select **Configure API Integration**.
3. Select **Enable API integration**. Paste the generated key into the API Token field. Note that Tailscale-generated SCIM API keys are case-sensitive.
4. If there is an **Import Groups** checkbox, uncheck it.
5. Select **Test API Credentials** to verify the SCIM connection, and then select **Save**.
### [Enable User Sync](#enable-user-sync)
1. In Okta, under **Sign On** \> **Credential Details**, select **Email** as the **Application username format**.
2. Under **Provisioning** \> **Settings** \> **To App**, select to enable **Create Users**, **Update User Attributes**,
and **Deactivate Users**, and then select **Save**.
3. Under **Assignments**, select **Provision User** to ensure that all users previously assigned to the application
are provisioned in Tailscale.
### [Enable Group Sync](#enable-group-sync)
With group sync, you can refer to a group from Okta in your tailnet policy file, with a human-readable name. For example:
```
`{
"acls": [
{
"action": "accept",
"src": ["group:groupname@example.com"],
"dst": ["\*:\*"]
},
{
"action": "accept",
"src": ["group:all employees@example.com"],
"dst": ["autogroup:self:\*"]
},
{
"action": "accept",
"src": ["group:engineering@example.com"],
"dst": ["tag:logging:\*"]
}
]
}
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
Groups synced from Okta do not replace groups in Tailscale. You can use Okta group sync and also
define groups in the tailnet policy file.
#### [In Okta](#in-okta-1)
1. Under **Applications**, select the Tailscale app.
2. Under **Push Groups**, expand the **Push Groups** button, and select the group to push to Tailscale.
3. Select **Save**, or select **Save & Add Another** if you want to push another group.
In practice, changes to groups in Okta tend to be reflected to Tailscale in seconds, but that is not a guarantee.
#### [In Tailscale](#in-tailscale-1)
In the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console, under **Group Sync** you
should find the groups that you pushed from Okta.
To use a pushed group in an [access rule](/docs/features/access-control), either select **Copy** and paste it into a rule, or type it in:
```
`"grants": [
{
"src": ["group:engineering@example.com"],
"dst": ["tag:logging"],
"ip": ["\*"]
}
]
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
Synced group names are treated as lowercase. They can include spaces, but not the `@` symbol.
#### [Updating Okta Group Names](#updating-okta-group-names)
If you change the name of your group in Okta, the Tailscale access control policy for that group will no longer apply. The access control policy is dependent on the name
you configured in Okta, not on a group reference. Tailscale will fail closed, and you will find an error message in the
admin console.
If you modified the name of the group, update the group in the [access control policy](/docs/features/access-control) to the new group name. You can also revert the
name change in Okta if this was unintentional.
### [Disabling Group Sync](#disabling-group-sync)
#### [In Okta](#in-okta-2)
1. Under **Applications**, select the Tailscale app.
2. Under **Push Groups**, expand the **Push Groups** button, deselect the groups you no longer want to push to
Tailscale, and select **Save**.
#### [In Tailscale](#in-tailscale-2)
1. In the [User management](https://login.tailscale.com/admin/settings/user-management) page of the admin console, under **SCIM Provisioning**, select **Disable provisioning**, and then select **Disable provisioning** to confirm.
2. In the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console, update your rules to no
longer reference any group which is no longer pushed.
3. If you no longer want to keep the SCIM API key that you used for Okta, [revoke the key](/docs/features/access-control/auth-keys#revoke-an-auth-key).
### [Known Limitations](#known-limitations)
* If you configured Okta as your identity provider for Tailscale prior to November 2021, you will need to reconfigure your identity provider. To use user & group provisioning, use the new Tailscale app in Okta.
* You must use **Email** as the **Application username format** for Tailscale in Okta.
* Tailscale groups are parsed lowercased in the tailnet policy file, so any casing in Okta is ignored.
* Groups from Okta cannot contain the `@` symbol.
* If the name of your group changes, the access control policy for that group will no longer apply and Tailscale will fail closed. Refer to
[Updating Okta Group Names](#updating-okta-group-names) for recommended actions.
* Users [suspended in Okta](https://help.okta.com/en/prod/Content/Topics/users-groups-profiles/usgp-suspend.htm) are not synced to Tailscale. Only users [deactivated](https://help.okta.com/en/prod/Content/Topics/users-groups-profiles/usgp-deactivate-user-account.htm) or [unassigned from the Tailscale app](https://help.okta.com/en/prod/Content/Topics/users-groups-profiles/usgp-unassign-apps.htm) in Okta are [suspended in Tailscale](/docs/features/sharing/how-to/remove-team-members#suspending-users).
* A user suspended in Okta will remain logged into Tailscale, and maintain access to all of their nodes and permissions granted by access control policies. They will only lose access as their device keys expire and they are blocked from re-authenticating new sessions with Okta.
* Groups [unlinked in Okta that are retained in Tailscale](https://help.okta.com/en/prod/Content/Topics/users-groups-profiles/usgp-group-push-operations.htm), as well as those [deactivated from group push](https://help.okta.com/oie/en-us/Content/Topics/users-groups-profiles/usgp-enable-group-push.htm) are not synced to Tailscale.
* You cannot use group sync to assign Tailscale admins or other [user roles](/docs/reference/user-roles), only manage
permissions in access control policies.
On this page
* [Features](#features)
* [Requirements](#requirements)
* [Step-by-Step Configuration Instructions](#step-by-step-configuration-instructions)
* [Enable Provisioning](#enable-provisioning)
* [In Tailscale](#in-tailscale)
* [In Okta](#in-okta)
* [Enable User Sync](#enable-user-sync)
* [Enable Group Sync](#enable-group-sync)
* [In Okta](#in-okta-1)
* [In Tailscale](#in-tailscale-1)
* [Updating Okta Group Names](#updating-okta-group-names)
* [Disabling Group Sync](#disabling-group-sync)
* [In Okta](#in-okta-2)
* [In Tailscale](#in-tailscale-2)
* [Known Limitations](#known-limitations)
Scroll to top