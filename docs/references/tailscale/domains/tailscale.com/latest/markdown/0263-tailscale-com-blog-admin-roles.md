Streamline Admin Console Access with New Tailscale User Roles
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|November 22, 2021
# Manage access to the admin console with Network admin, IT admin, and Auditor roles
We’ve added more [user roles](/kb/1138/user-roles/) to make it easier to manage access to your network. Now, in addition to your tailnet Owner, Admins, and Members, you can give users the roles of Network admin, IT admin, and Auditor. This lets users access the [admin console](https://login.tailscale.com/admin) without the full permissions of an Admin.
The new roles are:
* Network admin, who can manage ACLs and other network settings. Use this role for the Networking team, to manage your network topology including DNS and subnets.
* IT admin, who can manage users and machines. Use this role for the IT team, to onboard and offboard users and their devices.
* Auditor, who can read all configurations. Use this role for the compliance team or an internal or third-party auditor so that they can securely verify that your organization’s Tailscale configuration meets their needs.
Read [our documentation on user roles](/kb/1138/user-roles/) to get a full list of permissions each role has.
Separating Admin permissions into Network admin and IT admin helps larger organizations meet requirements for separation of duties, so that adding a device and changing its ACL will require two users to take action. If you’re a smaller organization or don’t have this need, the Admin role isn’t going anywhere and lets you manage both.
User roles are different from [access control lists (ACLs)](/kb/1018/acls/). User roles are Identity & Access Management (IAM) roles used to restrict access to the admin console, which includes accessing your network configuration; whereas ACLs are used to restrict which users and devices can communicate in your network.
To grant a user a role, open the [**Users**](https://login.tailscale.com/admin/users) page of the admin console, and for an individual’s row, select a new role.
Share
Authors
Sonia Appasamy
Alessandro Mingione
David Crawshaw
Authors
Sonia Appasamy
Alessandro Mingione
David Crawshaw
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