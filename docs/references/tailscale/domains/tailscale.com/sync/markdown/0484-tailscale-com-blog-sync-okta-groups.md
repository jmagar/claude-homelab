Sync Okta Groups with Tailscale ACLs for Easy Access Management
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|April 19, 2022
# Sync Okta groups to use in your Tailscale ACLs
Onboarding and offboarding are some of the biggest operational challenges that face organizations today. When an
employee switches teams, goes on leave, or exits, an admin typically deactivates them in their identity provider—and unfortunately,
in 2022, that’s a recurring management burden.
Tailscale already allows you to use your organization’s existing [identity provider](/kb/1013/sso-providers/) to manage
access to devices and services in your network, including authentication settings such as multi-factor authentication.
Then, to manage access to devices on your Tailscale network, you can define [access control lists (ACLs)](/kb/1018/acls/)
that specify which sources, such as users, groups, hosts, or tags, can access which destinations and on which ports.
Access rules can include groups, which allow you to easily grant access to many users for the same resources, such as
those on the same team or in the same role.
However, instead of defining groups in Tailscale, you might prefer to refer to groups you already have defined in your
identity provider. With user & group provisioning, there’s a simpler way: an administrator can select groups within
their identity provider to “push” to Tailscale, including changes to the group name and membership, as and when they
happen. The group defined in the identity provider can be directly referenced in the Tailscale ACL, and stay up to date
with changes to the organization, so no intervention is required when individuals change teams.
**We’re excited to announce that [User & group provisioning for Okta](/kb/1180/sso-okta-scim/) is now available in
beta**. You can sync [group membership](https://help.okta.com/en/prod/Content/Topics/users-groups-profiles/usgp-about-groups.htm)
and [deactivated users](https://help.okta.com/en/prod/Content/Topics/users-groups-profiles/usgp-deactivate-user-account.htm) from Okta, and refer to a synced group in your ACL file.
### You can already use groups in Tailscale ACLs
ACLs in Tailscale let you define in code what a given user, group, host, tag, or other source should be able to access
in your network. Tailscale ACLs are ‘default deny’, which means users will only have access you’ve explicitly granted.
ACLs already allow you to specify groups, to more easily grant many users access to the same resources. For example, to
allow Alice and Bob, who are part of your security team, to apply the tag `tag:logging` and access devices tagged that
way, you might have an ACL like:
```
`{
"groups": {
"group:security": [
"alice@example.com",
"bob@example.com"
],
},
"acls": [
{
"action": "accept",
"src": ["group:security"],
"dst": ["tag:logging:\*"]
},
],
"tagOwners": {
"tag:logging": ["group:security"]
},
}
`
```
It’s great that you can define groups in Tailscale, but this can get unwieldy quickly if you have a lot of users.
### Sync group membership to use in ACLs
If you’re a bigger organization, you might already have groups defined in your identity provider for simplified
maintenance. When someone’s role changes, instead of updating their permissions in every application you manage, you can
instead make a single change in the identity provider, to update what applications they should have access to, and with
which permissions.
How do these changes propagate to your applications? Enter System for Cross-domain Identity Management (SCIM), an open standard to
automate user and group provisioning, specifically meant for brokering information between identity providers and modern
applications. Tailscale uses SCIM to sync group membership from Okta to Tailscale.
Once enabled, you can use the same human readable group names you have in Okta to refer to groups in your Tailscale ACL
file. If Alice and Bob were in the “security-team” group in Okta, then the ACL from earlier can be simplified:
```
`{
"acls": [
{
"action": "accept",
"src": ["group:security-team@example.com"],
"dst": ["tag:logging:\*"]
},
],
"tagOwners": {
"tag:logging": ["group:security-team@example.com"]
},
}
`
```
Add a group synced from Okta by copying it into your ACL file.
In addition to syncing group membership, Tailscale uses SCIM to sync
[deactivated user accounts](https://help.okta.com/en/prod/Content/Topics/users-groups-profiles/usgp-deactivate-user-account.htm).
Users who are deactivated in Okta will be [suspended](/kb/1145/remove-team-members/#suspending-users) in Tailscale.
### Group and user sync helps more easily manage org changes
If a user in your organization’s role changes, or your organization re-organizes, you should update groups and their
membership to reflect your new organization. Changes in membership will be reflected in Tailscale, as long as the name
of a group specified in an ACL does not change. If the name of your group changes, the ACL will no longer apply.
Tailscale will fail closed, and you will see a warning in the [admin console](https://login.tailscale.com/admin/acls).
Update the group name or the ACL to fix the issue.
If a user joins your organization, once you create their account in Okta, their account will also be automatically created in Tailscale. If a user in your organization leaves or is terminated, as part of offboarding, you should deactivate their account in
Okta. This will suspend the user and their devices in Tailscale. Ensure that any devices that should remain in your
network are re-authenticated before deleting the user.
### Get started with user & group provisioning for Okta for Tailscale
To use user & group provisioning for Okta, you must be using Okta as your identity provider in Tailscale. If you haven’t
yet configured this, see [Setting up Okta to work with Tailscale](/kb/1066/sso-okta/).
Ramya demonstrates how to use user & group provisioning.
To configure SCIM integration, you’ll need to enable user & group provisioning in both Tailscale and Okta, and link your
Tailscale and Okta accounts. To get started, see the documentation on [Configuring SCIM integration on Okta](/kb/1180/sso-okta-scim/). Watch our [discussion with Ramya Nagarajan](https://www.youtube.com/watch?v=5bxU3Kltd1g) to learn more.
*User & group provisioning is available in Tailscale’s [Business plan](/pricing/).
[Start a free trial](https://login.tailscale.com/admin/settings/billing) or [contact sales](/contact/sales/) to test it
out.*
Share
Authors
Ramya Nagarajan
Sonia Appasamy
Ross Zurowski
Adrian Dewhurst
Authors
Ramya Nagarajan
Sonia Appasamy
Ross Zurowski
Adrian Dewhurst
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