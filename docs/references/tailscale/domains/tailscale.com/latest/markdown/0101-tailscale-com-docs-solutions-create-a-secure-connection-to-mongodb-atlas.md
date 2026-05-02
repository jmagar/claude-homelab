Create a secure connection to MongoDB Atlas · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Create a secure connection to MongoDB Atlas
Last validated: Dec 4, 2025
## [Introduction](#introduction)
Many Software as a Service (SaaS) applications require a list of allowed IP address ranges to restrict connectivity to only intended devices and users. If you connect to public Wi-Fi in places like hotels, airports, or cafés, you likely won't have application access due to the allowed IP address list not containing your IP address. For some organizations, when a new user joins the organization, an admin needs to add their IP address to the set of allowed IP addresses, which slows down onboarding of the user.
Tailscale [app connectors](/docs/features/app-connectors) let you route SaaS applications through dedicated devices in your Tailscale network (known as a tailnet). Instead of maintaining an allowlist of all IP addresses on your tailnet, you maintain an allowlist of only the app connector IP addresses. Your users still have access if they work from a café, and new users on your tailnet have access as soon as they join your tailnet. You can use an app connector to securely connect to SaaS applications like a [MongoDB Atlas](https://www.mongodb.com/products/platform) database, and deny access to anyone that is not in your tailnet.
In this guide, you will update your [tailnet policy file](/docs/features/tailnet-policy-file) to restrict access to a MongoDB Atlas database, configure and run an app connector to route requests to the database, and update the Atlas IP address list to allow access only through the app connector. When you finish this guide, you'll have set access restrictions to let only your tailnet users access the database.
## [Prerequisites](#prerequisites)
Before you begin this guide you'll need the following:
* A MongoDB Atlas database. For information about MongoDB Atlas, refer to MongoDB's [What is MongoDB Atlas?](https://www.mongodb.com/docs/atlas/) topic.
* A user name and password for your Atlas database.
* A MongoDB Atlas role of Project Owner, so that you can edit the Atlas IP access list.
* Your Atlas connection string. This is in the form `\<cluster-name\>.\<hash\>.mongodb.net`. For example, `cluster0.abcdef.mongodb.net`. For information about retrieving your connection string, refer to [Find your MongoDB Atlas connection string](https://www.mongodb.com/docs/manual/reference/connection-string/#find-your-mongodb-atlas-connection-string).
* A Tailscale account. [Create an account](https://login.tailscale.com/start) if you don't have one already.
* A Linux device to use as an app connector for your tailnet. This solution will show you how to start this device as an app connector for Atlas. For now, ensure the device meets the app connector [requirements](/docs/features/app-connectors/how-to/setup#requirements) and is already in your tailnet.
* A different device in your tailnet that has [MongoDB Shell](https://www.mongodb.com/docs/mongodb-shell/) installed. You will use this device to connect to your MongoDB Atlas database.
* A Tailscale role of either [Owner, Admin, or Network admin](/docs/reference/user-roles) so that you can edit your [tailnet policy file](/docs/features/tailnet-policy-file).
## [Step 1: Update your tailnet policy file](#step-1-update-your-tailnet-policy-file)
Configure your [tailnet policy file](/docs/features/tailnet-policy-file) to securely route tailnet traffic to your Atlas database. You need to make the following updates to your tailnet policy file:
* Create a Tailscale group for your Atlas admins.
* Create a tag to use for your app connector devices, which will connect your tailnet users to your Atlas database.
* Configure auto approval of your app connector devices, so that when they join your tailnet, their routes to the Atlas database are automatically approved. This lets you set up an app connector device by running a single [`tailscale up`](/docs/reference/tailscale-cli/up) command on the device.
* Create a grant that lets your tailnet users access the Atlas database.
* Define the set of domains for your specific MongoDB Atlas project. Your Atlas app connector uses these domains to route tailnet traffic to the Atlas database.
You need to be an [Owner, Admin, or Network admin](/docs/reference/user-roles) to edit a tailnet policy file.
### [Create an Atlas admins group](#create-an-atlas-admins-group)
Tailscale [groups](/docs/reference/syntax/policy-file#groups) let you create groups of users, which you can use in access rules (instead of listing users out explicitly). Create a group named `atlas-admins` so that you can add all of your Atlas admins into a single group.
1. Go to the [Visual editor](https://login.tailscale.com/admin/acls/visual) tab of the admin console.
2. Select **Groups**, and then select **Create tag**.
3. For **Group name**, enter `atlas-admins`.
4. For **Members**, select yourself from the dropdown list. If you have others in your tailnet that you want to administer your Atlas app connector, add them to this group also.
5. (Optional) For **Note**, enter any note you'd like to keep for this group.
6. Select **Save group**.
Now that you have the `atlas-admins` group, you can use it in a tag.
### [Create a tag for your app connector devices](#create-a-tag-for-your-app-connector-devices)
Tailscale [tags](/docs/features/tags) let you authenticate and identify non-user devices. A tag consists of an identifier and the users and groups that can apply the tag. Create a `tag:atlas-app-connector` tag so that you and any other members of the `atlas-admin` group can apply the tag to the devices you want to use for your Atlas app connectors.
1. Go to the [Visual editor](https://login.tailscale.com/admin/acls/visual) tab of the admin console.
2. Select **Tags**, and then select **Create tag**.
3. For **Tag name**, enter `atlas-app-connector`.
4. For **Tag owner**, select `group:atlas-admins`.
5. (Optional) For **Note**, enter any note you'd like to keep for this tag.
6. Select **Save tag**.
Now that you have the tag named `atlas-app-connector`, you can use it to auto approve routes to your Atlas database.
### [Create an auto approver for your app connector routes](#create-an-auto-approver-for-your-app-connector-routes)
Add an [`autoApprovers`](/docs/reference/syntax/policy-file#autoapprovers) rule to automatically approve specific routes for devices that have the `atlas-app-connector` tag. After you configure app traffic to route through an app connector, any DNS request to the configured app domains triggers route discovery.
1. Go to the [Visual editor](https://login.tailscale.com/admin/acls/visual) tab of the admin console.
2. Select **Auto approvers**, and then select **Add route**.
3. For **Route**, enter `0.0.0.0/0`.
4. For **Route is approved for**, select `tag:atlas-app-connector`.
5. (Optional) For **Note**, enter any note you'd like to keep for this auto approver route.
6. Select **Add route** again.
7. For **Route**, enter `::/0`.
8. For **Route is approved for**, select `tag:atlas-app-connector`.
9. (Optional) For **Note**, enter any note you'd like to keep for this auto approver route.
10. Select **Save route auto approver**.
### [Provide MongoDB Atlas access to your tailnet users](#provide-mongodb-atlas-access-to-your-tailnet-users)
Add a [`grants`](/docs/reference/syntax/policy-file#grants) rule to route Atlas traffic through the app connectors.
You must allow tailnet devices to access the routes an app connector advertises. One way to do this is to add an access control policy to your tailnet policy file that grants access to `autogroup:internet` (any port number) for members of the tailnet, which will also grant users access to any [exit nodes](/docs/features/exit-nodes) in the tailnet.
1. Go to the [Visual editor](https://login.tailscale.com/admin/acls/visual) tab of the admin console.
2. Select **General access rules**, and then select **Add rule**.
3. For **Source**, select `autogroup:member`.
4. For **Destination**, select `autogroup:internet`.
5. For **Destination and protocol**, select `All ports and protocols`.
6. (Optional) For **Note**, enter any note you'd like to keep for this grant.
7. Select **Save grant**.
### [Set the Atlas domains](#set-the-atlas-domains)
Add your Atlas project domains to your connector, by adding a [node attribute](/docs/reference/syntax/policy-file#nodeattrs) for the `tag:atlas-app-connector` tag that you created. Any device that you run for this app connector will use these domains to map client requests to your Atlas database.
Your Atlas connection string contains the MongoDB Atlas domain for your Atlas project, in the form of `\<cluster-name\>.\<hash\>.mongodb.net`. For example, `cluster0.abcdef.mongodb.net`. For that example, use `\*.abcdef.mongodb.net` for your domain string in the following step. If you want to restrict access to only specific a specific cluster, you can use a domain string like `cluster0.abcdef.mongodb.net`.
Now that you have your Atlas domain, add it to your app connector's node attributes.
Add your Atlas domain to the app connector
Configure your app connector to handle the routing of database requests based on your Atlas domain.
1. Go to the [Visual editor](https://login.tailscale.com/admin/acls/visual) tab of the admin console.
2. Select **Node attributes**, and then select **Add node attribute**.
3. For **Targets**, select `All users and devices`.
4. (Optional) For **Note**, enter any note you'd like to keep for this node attribute.
5. For **App**, enter `tailscale.com/app-connectors`.
6. For **Capability**, enter the following (replacing `\<hash\>` with your connection string's hash):
```
`{
"connectors": [
"tag:atlas-app-connector"
],
"domains": [
"\*.\<hash\>.mongodb.net"
],
"name": "Atlas"
}
`
```
If you want to specify a specific cluster instead of `\*` for the `domains` entry, use `"\<cluster-name\>.\<hash\>.mongodb.net"`instead of `"\*.\<hash\>.mongodb.net"`.
7. Select **Save node attribute**.
Now that you configured your app connector for Atlas access, start your app connector device.
## [Step 2: Start an app connector for Atlas](#step-2-start-an-app-connector-for-atlas)
Run a device in your tailnet to securely route your user traffic to your MongoDB Atlas database.
The app connector device must be running Linux, already added to your tailnet, have a public IP address, and IP port forwarding enabled, as described in the app connector [Requirements](/docs/features/app-connectors/how-to/setup#requirements).
On your Linux device that you want to use as an app connect, run the following [`tailscale up`](/docs/reference/tailscale-cli/up) command:
```
`tailscale up --advertise-connector --advertise-tags=tag:atlas-app-connector
`
```
The `--advertise-connector` flag enables the device to route traffic for specific domains according to the configuration in the tailnet policy file. The `--advertise-tags` flag tells the Tailscale client to authenticate the device with the `tag:atlas-app-connector` tag.
By default, devices in a tailnet are occasionally required to re-authenticate to keep your network secure. To avoid DNS interruptions if the app connector device needs to re-authenticate, go to the [Machines](https://login.tailscale.com/admin/machines) page of the admin console, select the button next to the app connector device, then select **Disable key expiry**.
Now that your app connector is running and serving as an Atlas app connector, you can allowlist its IP address in Atlas to let your tailnet users access the database.
## [Step 3: Allowlist the app connector in Atlas](#step-3-allowlist-the-app-connector-in-atlas)
Atlas permits client connections only from entries in the [Atlas access list](https://www.mongodb.com/docs/atlas/security/ip-access-list). Update the Atlas access list to use the egress IP addresses from your app connector.
First, get the IP address of your app connector from the Tailscale admin console.
1. Open the [Apps](https://login.tailscale.com/admin/apps) page of the admin console.
2. Select **MongoDB Atlas**.
3. In the **Egress IPs** section, copy the IP address.
You can enter only one IP address at a time into the Atlas access list. If you have more than one **Egress IP** address, you need to individually copy and paste them to the Atlas IP access list.
Next, add the IP address to the Atlas list of allowed IP addresses.
1. In the [Atlas dashboard](https://www.mongodb.com), go to **Project** and make your Atlas project the active project, if it is not already.
2. In the sidebar, under **Security**, select **Network Access**, and then select **IP Access List**.
3. Select **Add IP Address**.
4. For **Access List Entry**, enter the app connector egress IP address that you copied from the Tailscale admin console.
5. (Optional) For **Comment**, enter any comment you'd like to keep for this IP address.
6. (Optional) Set a time limit for the duration of access allowed for this IP address.
7. Select **Confirm**.
If you have more IP addresses in your app connector's **Egress IPs** list, repeat this step to add them to the Atlas access list.
### [Remove unneeded IP addresses from the Atlas access list](#remove-unneeded-ip-addresses-from-the-atlas-access-list)
If your Atlas access list contains IP addresses that are not specific to your app connector, remove them. Otherwise, someone outside of your tailnet could access the database.
1. In the **Network Access** page, for any IP address that your want to delete, select **Delete**.
2. Select **Delete** again to confirm you want to delete it.
For more information about MongoDB Atlas IP access lists, refer to MongoDB's [Configure IP Access List Entries](https://www.mongodb.com/docs/atlas/security/ip-access-list) topic.
Now that you configured your Atlas project to accept requests from only the specified IP address range, you can make a connection from a device in your tailnet.
## [Step 4: Connect to your database](#step-4-connect-to-your-database)
Use the device in your tailnet with `mongosh` installed to connect to your database. Use a device separate from the app connector device.
1. If the device is a Linux device, run the following [`tailscale set`](/docs/reference/tailscale-cli#set) command so the client accepts the routes provided by the app connector:
```
`tailscale set --accept-routes
`
```
Tailscale clients on other operating systems accept the routes by default.
2. Run the following (replace the placeholders with the values for your Atlas database):
```
`mongosh "mongodb+srv://\<cluster-name\>.\<hash\>.mongodb.net/" \\
--apiVersion 1 \\
--username \<database-user-name\>
`
```
If the `mongosh` command succeeds, the `mongosh` prompt opens. To confirm you can connect to your database, run:
```
` show dbs;
`
```
The command should provide a list the databases in your Atlas project, similar to:
```
`myDatabase 72.00 KiB
admin 356.00 KiB
local 997.79 MiB
`
```
When you finish using the `mongosh` prompt, enter `exit` to close the `mongosh` prompt.
Now that you've tested a connection from a separate device, try the same `mongosh` steps but first ensure that the separate device is running in a different LAN. If both the app connector and the separate device are using the same LAN, their IP addresses are in the same IP address that you allowlisted. If the separate device runs on a different local area network, it uses an IP address different than the app connector IP address. If the device is on a different LAN and still successfully connects to your Atlas database, that means you have successfully allowed access from the Atlas side.
Now you're ready to confirm that the connection requires Tailscale.
### [Confirm your connection requires Tailscale](#confirm-your-connection-requires-tailscale)
1. On a device separate from your app connector, and on a different local area network than used by the app connector, disable the Tailscale client. You can disable the Tailscale client through the Tailscale client UI, or through the [`tailscale down`](/docs/reference/tailscale-cli#down) command.
2. Run the following command (replace the placeholders with the values for your Atlas database):
```
`mongosh "mongodb+srv://\<cluster-name\>.\<hash\>.mongodb.net/" \\
--apiVersion 1 \\
--username \<database-user-name\>
`
```
This command should fail to connect to your database, because the device will not be able to use the app connector due to Tailscale not running. If the device is not running Tailscale and it does successfully connect to your database, and you confirmed that the device has a different IP address than the app connector, that means your Atlas allowed IP addresses is too permissive. Check whether there are any IP addresses that should not have access and remove them.
If you can connect to your Atlas database on a device that is not running Tailscale and the device IP address is different from the app connector IP address, check your Atlas and tailnet policy file settings, and correct as needed. Otherwise, your database access is not secure.
After you confirm that the connection required Tailscale, remember to enable Tailscale on the client. You can enable the Tailscale client through the Tailscale client UI, or through the [`tailscale up`](/docs/reference/tailscale-cli/up) command.
## [Conclusion](#conclusion)
In this guide you configured an app connector so that your tailnet clients can access a MongoDB Atlas database and anyone outside of your tailnet cannot access the database. You also ensured that a device needs Tailscale enabled to allow access.
To ensure that your tailnet users have high availability to your database, consider [adding another app connector](#start-app-connector) device so that a single point of app connector failure won't lock out Atlas access. If you add another app connector, remember to [add its egress IP address](#allowlist-app-connector) to the Atlas access list.
For more information about app connectors, refer to [App connectors](/docs/features/app-connectors).
On this page
* [Introduction](#introduction)
* [Prerequisites](#prerequisites)
* [Step 1: Update your tailnet policy file](#step-1-update-your-tailnet-policy-file)
* [Create an Atlas admins group](#create-an-atlas-admins-group)
* [Create a tag for your app connector devices](#create-a-tag-for-your-app-connector-devices)
* [Create an auto approver for your app connector routes](#create-an-auto-approver-for-your-app-connector-routes)
* [Provide MongoDB Atlas access to your tailnet users](#provide-mongodb-atlas-access-to-your-tailnet-users)
* [Set the Atlas domains](#set-the-atlas-domains)
* [Step 2: Start an app connector for Atlas](#step-2-start-an-app-connector-for-atlas)
* [Step 3: Allowlist the app connector in Atlas](#step-3-allowlist-the-app-connector-in-atlas)
* [Remove unneeded IP addresses from the Atlas access list](#remove-unneeded-ip-addresses-from-the-atlas-access-list)
* [Step 4: Connect to your database](#step-4-connect-to-your-database)
* [Confirm your connection requires Tailscale](#confirm-your-connection-requires-tailscale)
* [Conclusion](#conclusion)
Scroll to top