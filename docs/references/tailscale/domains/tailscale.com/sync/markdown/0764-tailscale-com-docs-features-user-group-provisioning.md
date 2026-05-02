User & group provisioning · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# User & group provisioning
Last validated: Dec 8, 2025
This feature is available for [the Standard, Premium, and Enterprise plans](/pricing).
Tailscale supports [System for Cross-domain Identity Management](/learn/what-is-scim) (SCIM) to integrate with several identity providers, as described in the following topics:
* [User & group provisioning for Google Workspace](/docs/integrations/google-sync)
* [User & group provisioning for Microsoft Entra ID](/docs/integrations/identity/entra/entra-id-scim)
* [User & group provisioning for Okta](/docs/integrations/identity/okta/okta-scim)
## [Impact of enabling SCIM in a tailnet that already has users](#impact-of-enabling-scim-in-a-tailnet-that-already-has-users)
When you enable SCIM, if you already had any users from your identity provider using Tailscale, the users stay in Tailscale. You can review these users when you enable SCIM in your identity provider, such as Okta or Microsoft Entra ID, and decide what action to take for them.
## [SSO and SCIM considerations](#sso-and-scim-considerations)
If you are *using the same app for single sign-on (SSO) and SCIM* (that is, you're not using a custom Microsoft Entra ID app), users can sign up for Tailscale only if they are allowed to by the identity provider (if they have the app assigned).
If you are using different apps for SSO and SCIM, we recommend you use
[user approval](/docs/features/access-control/user-approval) to restrict which users are authorized to join your tailnet.
## [Inviting users](#inviting-users)
* You can still [invite users](/docs/features/sharing/how-to/invite-team-members) from other domains and identity providers. You need to be an [Owner, Admin, or IT admin](/docs/reference/user-roles) to invite users.
## [Syncing a user suspension](#syncing-a-user-suspension)
When syncing a user suspension:
* For Okta, if you deactivate a user in Okta they are suspended in Tailscale. If you suspend a user in Okta, nothing happens in Tailscale—only deactivation.
* For Microsoft Entra ID, if you delete (soft delete) the user in Microsoft Entra ID they are suspended in Tailscale.
* For Google Workspace, if you suspend a user, they are suspended in Tailscale.
## [Syncing a user deletion](#syncing-a-user-deletion)
When syncing a user deletion:
* For Okta, you cannot sync deletions from Okta to Tailscale.
* For Microsoft Entra ID, when you delete a user, they are first soft deleted (suspended in Tailscale), then 30 days later they are hard deleted (deleted in Tailscale).
* For Google Workspace, if you delete a user, they are suspended in Tailscale. When you recreate a previously deleted user in Google Workspace, Tailscale treats them as a new user.
You can also manually delete users from your tailnet, including users created prior to enabling provisioning, synced users who have been suspended in Tailscale, and users from other domains. You cannot manually delete users who are being synced, as they will get recreated at the next sync.
## [Syncing group membership](#syncing-group-membership)
Tailscale syncs group membership from SCIM-integrated identity providers to Tailscale. You can use the same
human-readable group names you have in a SCIM-integrated identity provider to refer to groups in your
[access control policies](/docs/features/access-control/acls). For example, if Alice and Bob are in the "security-team" group in a SCIM-integrated
identity provider, then the [access rule](/docs/reference/syntax/policy-file#acls) can refer to the "security-team" group:
```
`{
"grants": [
{
"src": ["group:security-team@example.com"],
"dst": ["tag:logging"],
"ip": ["\*"]
}
],
"tagOwners": {
"tag:logging": ["group:security-team@example.com"]
}
}
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
When someone's role changes, instead of updating their permissions in every application you manage, you
can instead make a single change in the SCIM-integrated identity provider, to update what applications
they should have access to, and with which permissions.
Synced groups cannot be used to assign [user roles](/docs/reference/user-roles).
## [Known Limitations](#known-limitations)
* A user suspended in a SCIM-integrated identity provider will remain logged into Tailscale, and maintain access to all of their nodes and permissions granted by access control policies. They will only lose access as their device keys expire and they are blocked from re-authenticating new sessions with the SCIM-integrated identity provider. Instead, disable the user in the SCIM-integrated identity provider to suspend them in Tailscale.
* For additional limitations, refer to the specific topics for each identity provider.
On this page
* [Impact of enabling SCIM in a tailnet that already has users](#impact-of-enabling-scim-in-a-tailnet-that-already-has-users)
* [SSO and SCIM considerations](#sso-and-scim-considerations)
* [Inviting users](#inviting-users)
* [Syncing a user suspension](#syncing-a-user-suspension)
* [Syncing a user deletion](#syncing-a-user-deletion)
* [Syncing group membership](#syncing-group-membership)
* [Known Limitations](#known-limitations)
Scroll to top