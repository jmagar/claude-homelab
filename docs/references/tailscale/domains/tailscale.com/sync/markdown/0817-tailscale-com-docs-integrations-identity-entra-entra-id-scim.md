User & group provisioning for Microsoft Entra ID · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# User & group provisioning for Microsoft Entra ID
Last validated: Jan 5, 2026
This feature is available for [the Standard, Premium, and Enterprise plans](/pricing).
Tailscale supports System for Cross-domain Identity Management (SCIM) to integrate with Microsoft Entra ID (previously known as Azure AD).
* With group sync, you can refer to a group from Microsoft Entra ID in your tailnet policy file, with a human-readable name.
* You can also refer to a group from Microsoft Entra ID in your tailnet policy file using the `externalGroupId`.
* With user sync, you can quickly onboard and offboard users to Tailscale. For related information, refer to [Offboarding when using user & group provisioning](/docs/features/sharing/how-to/offboard#offboarding-when-using-user--group-provisioning-scim).
* When a user is deleted in Microsoft Entra ID, [they are first 'soft' deleted](https://learn.microsoft.com/en-us/azure/active-directory/app-provisioning/how-provisioning-works#incremental-cycles), which [suspends](/docs/features/sharing/how-to/remove-team-members#suspending-users) the user in Tailscale. The user is then 'hard' deleted approximately 30 days later in Microsoft Entra ID, which causes them to be [deleted](/docs/features/sharing/how-to/remove-team-members#deleting-users) in Tailscale.
* When a user is disabled in Microsoft Entra ID, they are suspended in Tailscale.
This topic shows you how to set up Microsoft Entra ID as a SCIM-integrated identity provider for Tailscale. You can also refer to the
Microsoft tutorial [Configure Tailscale for automatic user provisioning](https://learn.microsoft.com/en-us/azure/active-directory/saas-apps/tailscale-provisioning-tutorial).
## [Features](#features)
The following provisioning features are supported:
* **Create users** in Tailscale from Microsoft Entra ID
* **Update user attributes** in Tailscale from Microsoft Entra ID
* **Delete users** in Microsoft Entra ID to first suspend them in Tailscale; after approximately 30 days they are automatically deleted in Tailscale
* **Disable users** in Microsoft Entra ID to suspend them in Tailscale
* **Group push** from Microsoft Entra ID to Tailscale
## [Requirements](#requirements)
* You need a Microsoft Entra ID subscription.
* You need a tailnet.
* Your tailnet's identity provider needs to be Microsoft Entra ID. If your tailnet is not
using Microsoft Entra ID and you want to use it, [contact support](/contact/support?type=sso) to
migrate from your current identity provider to Microsoft Entra ID.
## [Step-by-Step Configuration Instructions](#step-by-step-configuration-instructions)
### [Enable Provisioning](#enable-provisioning)
#### [In Tailscale](#in-tailscale)
You need to be an [Owner, Admin, or IT admin](/docs/reference/user-roles) in Tailscale to complete these
steps.
**Generate a SCIM API key**
1. In the [User management](https://login.tailscale.com/admin/settings/user-management) page of the admin console, under **SCIM Provisioning**, select **Enable Provisioning**.
2. Copy the generated key to the clipboard.
3. Save the key information in a secure spot. You will need to use it when you configure Microsoft Entra ID. Note that Tailscale-generated SCIM API keys are case-sensitive.
#### [In Microsoft Entra ID](#in-microsoft-entra-id)
You need to have an admin role for the Microsoft Azure portal to complete these steps.
1. Log in to the [Microsoft Azure portal](https://portal.azure.com).
2. Select **Microsoft Entra ID**.
3. Under **Manage** in the left-hand navigation, select **Enterprise applications**.
4. Select **New application**.
5. In the **Browse Microsoft Entra Gallery** page, search for **Tailscale** and then select **Tailscale**.
6. Select **Sign up for Tailscale**.
You will be redirected to sign up for Tailscale. If you already have a Tailscale account, proceed
to the next step. Otherwise, follow the prompts to sign up for Tailscale.
7. In the application **Overview** page, under **Manage** in the left-hand navigation, select **Provisioning**.
8. Select **Get started**.
9. Set **Provisioning Mode** to **Automatic**.
10. Under **Admin Credentials**, for **Tenant URL**, enter
`https://controlplane.tailscale.com/scim/v2/?aadOptscim062020`.
Note that the trailing parameter, `?aadOptscim062020`, is required. For
information about this parameter, refer to the Microsoft Entra ID topic
[Flags to alter the SCIM behavior](https://learn.microsoft.com/en-us/azure/active-directory/app-provisioning/application-provisioning-config-problem-scim-compatibility#flags-to-alter-the-scim-behavior).
11. For **Secret Token**, enter the SCIM API key that you generated in the Tailscale admin console.
12. Select **Test Connection**.
A popup will display a message about whether the supplied credentials
are authorized to enable provisioning.
13. In the **Settings** section, ensure **Send an email notification when
an error occurs** is checked, and provide an email to use for the
notification.
14. In the **Settings** section, under **Scope**, choose to sync all users and groups, or only users and groups that are assigned the application. If you choose to only sync users and groups that are assigned the application, you will need to [assign these](https://learn.microsoft.com/en-us/azure/active-directory/manage-apps/assign-user-or-group-access-portal?pivots=portal) under the **Users and groups** section in the left-hand navigation.
15. Ensure that **Provisioning Status** is set to **On**.
16. Select **Save**.
17. Return to the application's **Provisioning** page. In the top menu, select **Start Provisioning**.
If you encounter issues after provisioning, open the application's **Overview** page and then select
**Restart Provisioning**.
#### [Restricting access to the Tailscale application](#restricting-access-to-the-tailscale-application)
By default all users in the Entra directory service will be allowed to access the Tailscale app.
To control which users are allowed to access Tailscale, go to **Enterprise Applications** \>
**Tailscale** \> **Properties** and set **Assignment Required?** to Yes.
When this setting is enabled, only users who are assigned to the Tailscale application will be
able to access it.
#### [Supported attribute mappings](#supported-attribute-mappings)
Tailscale supports SCIM attributes from the core ["User"](https://www.rfc-editor.org/rfc/rfc7643.html#section-4.1) and ["Group" SCIM resources](https://www.rfc-editor.org/rfc/rfc7643.html#section-4.2). Tailscale only uses the following attributes for Tailscale's functionality; other attributes are stored without being used:
|Attribute|SCIM attribute type|Use in Tailscale|
|`externalId`|Common|Required|
|`userName`|Core user|Required|
|`emails`|Core user|Optional|
|`name.givenName`|Core user|Optional|
|`name.familyName`|Core user|Optional|
|`name.formatted`|Core user|Optional|
|`displayName`|Core user|Optional|
|`active`|Core user|Optional|
|`preferredLanguage`|Core user|Optional|
`userName` must map to the email used by the user to sign in to the tailnet.
`photos` are not an attribute that can be synced, but are populated for users on login.
Tailscale does not support the SCIM [Enterprise User Schema Extension](https://www.rfc-editor.org/rfc/rfc7643.html#section-4.3). If any additional user attribute from these extensions is specified, the request will fail.
### [Referring to Microsoft Entra ID groups in your tailnet policy file](#referring-to-microsoft-entra-id-groups-in-your-tailnet-policy-file)
You can refer to a group from Microsoft Entra ID in your tailnet policy file using either the human-readable name or the Microsoft Entra ID group ID. For example:
```
`{
"grants": [
{
"src": ["group:groupname@example.com"],
"dst": ["\*"],
"ip": ["\*"]
},
{
"src": ["group:all employees@example.com"],
"dst": ["autogroup:self"],
"ip": ["\*"]
},
{
"src": ["group:3ac067a2-f424-87b0-14a3-926482d83980@example.com"],
"dst": ["tag:logging"],
"ip": ["\*"]
}
]
}
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
#### [Updating Microsoft Entra ID Group Names](#updating-microsoft-entra-id-group-names)
If you are using the group name (not the group ID) in your tailnet policy file, and you change the name of your group in Microsoft Entra ID, the Tailscale access rules for that group will no longer apply. Tailscale will fail closed, and you will receive an error message in the
admin console.
If you modified the name of the group, update the group in the tailnet policy file to the new group name. You can also revert the
name change in Microsoft Entra ID if this was unintentional.
If you are using the group ID in your tailnet policy file, renaming the group will not affect the Tailscale access rules for that group.
### [Disable Provisioning](#disable-provisioning)
You need to have an admin role for the Microsoft Azure portal to complete these steps.
#### [In Microsoft Entra ID](#in-microsoft-entra-id-1)
1. Log in to the [Microsoft Azure portal](https://portal.azure.com).
2. Select **Microsoft Entra ID**.
3. Under **Manage** in the left-hand navigation, select **Enterprise applications**.
4. Search for the **Tailscale** application and select it.
5. Under **Manage**, select **Properties**.
6. Select **Delete** and then select **Yes**.
#### [In Tailscale](#in-tailscale-1)
1. In the [User management](https://login.tailscale.com/admin/settings/user-management) page of the admin console, under **SCIM Provisioning**, select **Disable provisioning**, and then select **Disable provisioning** to confirm.
2. In the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console, update your rules to no
longer reference any group which is no longer pushed.
3. If you no longer want to keep the SCIM API key that you used for Microsoft Entra ID, [revoke the key](/docs/features/access-control/auth-keys#revoke-an-auth-key).
### [Known Limitations](#known-limitations)
* Microsoft Entra ID syncs with Tailscale every 40 minutes. This is a [limitation from Microsoft Entra ID](https://learn.microsoft.com/en-us/azure/active-directory/app-provisioning/application-provisioning-when-will-provisioning-finish-specific-user#how-long-will-it-take-to-provision-users) and you cannot change this interval. To force the sync of a user, for example, as part of offboarding, use Microsoft Entra ID [on-demand provisioning](https://learn.microsoft.com/en-us/azure/active-directory/app-provisioning/provision-on-demand). This should sync the user in less than 30 seconds.
* Microsoft Entra ID takes approximately 30 days from 'soft' deletion to 'hard' deletion of a user. You cannot change this interval.
* Microsoft Entra ID [doesn't automatically restore the dynamic membership group](https://learn.microsoft.com/en-us/entra/identity/app-provisioning/how-provisioning-works#deprovisioning) entries when a user goes from 'soft' deleted to active. If this causes issues, you can **Restart provisioning** from Entra ID's app provisioning page to force a refresh.
* Tailscale does not support the SCIM [Enterprise User Schema Extension](https://www.rfc-editor.org/rfc/rfc7643.html#section-4.3). If any additional user attribute from these extensions is specified, the request will fail.
* Tailscale groups are parsed lowercased in the tailnet policy file, so any casing in Microsoft Entra ID is ignored.
* Groups from Microsoft Entra ID cannot contain the `@` symbol.
* If you are referring to the group name in your tailnet policy file, and the name of your group changes, the access control policy for that group will no longer apply and Tailscale will fail closed. If instead, you use the group ID in your tailnet policy file, renaming the group will not affect the Tailscale access rules for that group.
* Groups unlinked in Microsoft Entra ID that are retained in Tailscale are not synced to Tailscale.
* You cannot use group sync to assign Tailscale admins or other [user roles](/docs/reference/user-roles).
* Parent groups of [nested groups](https://learn.microsoft.com/en-us/entra/fundamentals/how-to-manage-groups#add-or-remove-a-group-from-another-group) do not aggregate members of their nested groups. In other words, you cannot use a parent of a nested group in your access control policies and expect it to contain all members of the nested groups.
On this page
* [Features](#features)
* [Requirements](#requirements)
* [Step-by-Step Configuration Instructions](#step-by-step-configuration-instructions)
* [Enable Provisioning](#enable-provisioning)
* [In Tailscale](#in-tailscale)
* [In Microsoft Entra ID](#in-microsoft-entra-id)
* [Restricting access to the Tailscale application](#restricting-access-to-the-tailscale-application)
* [Supported attribute mappings](#supported-attribute-mappings)
* [Referring to Microsoft Entra ID groups in your tailnet policy file](#referring-to-microsoft-entra-id-groups-in-your-tailnet-policy-file)
* [Updating Microsoft Entra ID Group Names](#updating-microsoft-entra-id-group-names)
* [Disable Provisioning](#disable-provisioning)
* [In Microsoft Entra ID](#in-microsoft-entra-id-1)
* [In Tailscale](#in-tailscale-1)
* [Known Limitations](#known-limitations)
Scroll to top