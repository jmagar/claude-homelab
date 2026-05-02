User & group provisioning for Google Workspace · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# User & group provisioning for Google Workspace
Last validated: Jan 5, 2026
This feature is available for [the Standard, Premium, and Enterprise plans](/pricing).
Tailscale's use and transfer of information received from Google APIs to any other app will adhere to [Google API Services User Data Policy](https://developers.google.com/terms/api-services-user-data-policy#additional_requirements_for_specific_api_scopes) including the Limited Use requirements.
Tailscale supports synchronizing Google Workspace users and groups for use in Tailscale [access controls](/docs/features/access-control).
* With group sync, you can refer to a group from Google in your [tailnet policy file](/docs/reference/glossary#tailnet-policy-file), with a human-readable name.
* With user sync, you can onboard and offboard users to Tailscale. For related information, refer to [Offboarding when using user & group provisioning](/docs/features/sharing/how-to/offboard#offboarding-when-using-user--group-provisioning-scim).
## [Prerequisites](#prerequisites)
* You need a Google Workspace account.
* You need a Tailscale network (known as a tailnet).
* Your tailnet's identity provider needs to be Google.
## [Set up Google User & Group sync](#set-up-google-user--group-sync)
You need to be an [Owner, Admin, or IT admin](/docs/reference/user-roles) in Tailscale to complete these steps.
1. Open the Tailscale [User management](https://login.tailscale.com/admin/settings/user-management) page.
2. In the **Google Sync** section, select **Enable**.
3. In the authorization page that opens, select **Authorize with Google**.
4. In the **Choose an account** page, select your Google Workspace super user account.
5. In the **Sign in** page, select **Continue**.
6. When prompted to allow access to your tailnet, select **Allow**.
When you enable Google Sync for the very first time, no users or groups will be added unless you specify
groups explicitly or select the **Sync all users** option.
## [Sync all users](#sync-all-users)
By default, Google Sync only adds users from groups you selected. But if you'd like to mirror all of your Google Workspace users, then you can enable the **Sync all users** option which will immediately start provisioning users to your tailnet.
When **Sync all users** is not enabled, users will be suspended if they are removed from all synced groups. If this is not the desired behavior, enable **Sync all users** or create an additional Google group that includes all the users to sync. For example, you may have a synced group named `all-tailscale-users` that contains all users that should have Tailscale access, and then use other groups to manage access control.
## [Manage groups](#manage-groups)
By default, a group and its members does not sync into your tailnet unless you explicitly select it.
You need to be an [Owner, Admin, or IT admin](/docs/reference/user-roles) in Tailscale to complete these steps.
1. Open the Tailscale [User management](https://login.tailscale.com/admin/settings/user-management) page of the admin console.
2. In the **Google Sync** section, select the menu and then select **Manage groups**.
If a group is renamed in Google Admin Console, the reference does not rename. You will always use the group email to reference the group in your Tailscale access control policies.
## [Unsync unassigned users](#unsync-unassigned-users)
After adding groups and their members to your tailnet, if you want to remove the users whom you previously added using the **Sync all users** option who are not part of the groups you added, you can use the option **Unsync unassigned users**.
You need to be an [Owner, Admin, or IT admin](/docs/reference/user-roles) in Tailscale to complete these steps.
1. Open the Tailscale [User management](https://login.tailscale.com/admin/settings/user-management) page of the admin console.
2. In the **Google Sync** section, select the menu and then select **Unsync unassigned users**.
## [Force a sync](#force-a-sync)
Changes to group membership and users within the Google Admin Console are synced to Tailscale every 40 minutes. You can also force a sync to Tailscale.
You need to be an [Owner, Admin, or IT admin](/docs/reference/user-roles) in Tailscale to complete these steps.
1. Open the Tailscale [User management](https://login.tailscale.com/admin/settings/user-management) page of the admin console.
2. In the **Google Sync** section, select the menu and then select **Force sync**.
## [Use groups in your tailnet policy file](#use-groups-in-your-tailnet-policy-file)
You can refer to a group from Google Workspace in your [tailnet policy file](/docs/reference/glossary#tailnet-policy-file) file, with a human-readable name. For example:
```
`{
"grants": [
{
"src": ["group:admins@example.com"],
"dst": ["\*"],
"ip": ["\*"]
},
{
"src": ["group:employees@example.com"],
"dst": ["autogroup:self"],
"ip": ["\*"]
},
{
"src": ["group:engineering@example.com"],
"dst": ["tag:logging"],
"ip": ["\*"]
}
]
}
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
Groups synced from Google Workspace do not replace [groups](/docs/reference/syntax/policy-file#groups) in Tailscale. You can use Google Workspace group sync and also define groups in the tailnet policy file.
## [Disable Google User & Group sync](#disable-google-user--group-sync)
You need to be an [Owner, Admin, or IT admin](/docs/reference/user-roles) in Tailscale to complete these steps.
1. Open the Tailscale [User management](https://login.tailscale.com/admin/settings/user-management) page of the admin console.
2. In the **Google Sync** section, select the menu and then select **Disable**.
3. Follow the prompts to confirm and disable Google User & Group sync.
## [Limitations](#limitations)
* The maximum number of groups that can be synced is 100.
* After a new group is created in Google Workspace, a Tailscale [Owner, Admin, or IT admin](/docs/reference/user-roles) must open the [Google Group Sync](https://login.tailscale.com/admin/settings/user-management) page and select the group to allow syncing of the group.
* Users that do not share the same domain as the tailnet's domain are skipped.
* Google-synced groups don't work with [Mullvad exit node](/docs/features/exit-nodes/mullvad-exit-nodes) access control policies.
On this page
* [Prerequisites](#prerequisites)
* [Set up Google User & Group sync](#set-up-google-user--group-sync)
* [Sync all users](#sync-all-users)
* [Manage groups](#manage-groups)
* [Unsync unassigned users](#unsync-unassigned-users)
* [Force a sync](#force-a-sync)
* [Use groups in your tailnet policy file](#use-groups-in-your-tailnet-policy-file)
* [Disable Google User & Group sync](#disable-google-user--group-sync)
* [Limitations](#limitations)
Scroll to top