Seamless Offboarding: Sync Azure AD Users & Groups to Tailscale
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|August 18, 2023
# Sync Azure AD users and groups to Tailscale
Onboarding a new or transferred employee when they join a team can be time consuming, but it’s a good problem to have. Offboarding, on the other hand, not so much. Offboarding is not only inconvenient, but doing it poorly can put organizations at risk — as former employees may inadvertently retain access to shared company resources and services after their departure date.
That’s why we’re happy to share that we’re introducing [user & group provisioning for Azure AD](/kb/1249/sso-azure-ad-scim/), now in beta, so you can automatically sync [deleted users](https://learn.microsoft.com/en-us/azure/active-directory/fundamentals/add-users-azure-active-directory#delete-a-user) from Azure AD to Tailscale as part of offboarding, and sync [group membership](https://learn.microsoft.com/en-us/azure/active-directory/fundamentals/how-to-manage-groups) to use in your [access rules](/kb/1018/acls/). This means you only have to update users in one place — your IdP — to ensure that team and personnel changes are reflected in Tailscale.
### **Tailscale uses your identity provider for authentication, and access rules for authorization**
When you use Tailscale with Azure AD, your users login and authenticate with your existing [identity provider](/kb/1013/sso-providers/) (IdP), which means that if you remove a user from Azure AD, they’ll no longer be able to log into Tailscale.
For more granular control, you can also manage access to shared resources on your Tailscale network (tailnet) by editing your [tailnet policy file](/kb/1018/acls/), which includes access rules for who can connect to what on your network. Admins can define [groups](/kb/1018/acls/) to easily give a large number of users, like a team, or those with the same role, access to the same resources.
This is great for small teams, but can quickly become time-consuming and out of date for large organizations with a lot of organizational changes.
### **Sync Azure AD group membership to Tailscale ACLs**
Thankfully, many organizations define groups in their IdP for more efficient user & team management. The benefit of defining groups is that when someone’s role changes, instead of manually updating permission in every app, an admin can make the change in their IdP — a single time — to update which applications that user has access to.
If a user’s role changes, or your company reorganizes, you should update groups and their membership to reflect the new organization. Keep in mind that changes in membership will only be reflected in Tailscale as long as the group name specified in your ACL policy doesn’t change. If the name of your group changes as a result of a reorganization, the ACL will no longer apply. However, Tailscale will fail closed — and you’ll get a warning in the admin console to update the group name or ACL policy to resolve the issue.
To automate changes between systems, such as from Azure AD to Tailscale, the open protocol system for cross-domain identity management ([SCIM](https://learn.microsoft.com/en-us/azure/active-directory/fundamentals/sync-scim)) can be used. With SCIM enabled, Tailscale lets you refer to groups that you’ve already defined in Azure AD as part of your access rules in your tailnet policy file. Admins can choose groups in their IdP, and push those to Tailscale, which will dynamically recognize changes to the group name and membership.
To configure user & group provisioning for Azure AD, provision the tenant URL for Tailscale, and the secret token you generated in the Tailscale admin console for provisioning.
### **Sync Azure AD users to Tailscale**
In addition to syncing group membership, Tailscale uses SCIM to sync new and deleted user accounts.
If you have SCIM enabled, when you add a new employee in Azure AD, their account will automatically get created in Tailscale. If an employee leaves or is terminated, and their account is deleted in Azure AD, that user (and their devices) will be suspended in Tailscale. As part of your offboarding checklist, you should be sure to re-authenticate devices that you would like to remain in your network before deactivating a user from your IdP.
### **Get started with Tailscale user & group provisioning for Azure AD**
To enable user & group provisioning for Azure AD, you must first be using Azure AD as your identity provider in Tailscale. Then, to configure SCIM, you’ll need to enable user & group provisioning in both Tailscale and Azure AD, and link your Tailscale and Azure AD accounts. To get started, read the documentation on [configuring SCIM integration on Azure AD](/kb/1249/sso-azure-ad-scim/).
*User & group provisioning is available in Tailscale *[*Enterprise*](/pricing/)*. *[*Contact sales*](/contact/sales/)* to test it out.*
Share
Authors
Andrew Dunham
Jeff Spencer
Authors
Andrew Dunham
Jeff Spencer
Share
Loading...
## Try Tailscale for free
[
Get started
](https://login.tailscale.com/start)
Schedule a demo
[
Contact sales
](/contact/sales)