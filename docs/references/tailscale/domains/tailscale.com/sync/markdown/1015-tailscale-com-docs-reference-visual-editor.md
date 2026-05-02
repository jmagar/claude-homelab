Visual policy editor reference · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Visual policy editor reference
Last validated: Dec 2, 2025
The [Tailscale visual policy editor](/docs/features/visual-editor) gives you an interactive graphical interface for managing access control policies in a Tailscale network (known as a tailnet). This reference documents all interface elements, forms, controls, and their associated help information to help you effectively use the visual editor. For a comprehensive understanding of the underlying policy syntax, refer to [Tailscale's policy syntax documentation](/docs/reference/syntax/policy-file).
Refer to the [targets documentation](/docs/reference/targets-and-selectors) for detailed information about available targets for sources, destinations, and other fields.
## [General access rules](#general-access-rules)
General access rules control network-level and application-level access between devices in your tailnet using [grants syntax](/docs/features/access-control/grants). These rules determine which sources can connect to which destinations on specified ports and protocols. The visual editor translates these rules into the underlying grant structure in your tailnet policy file.
The visual editor uses grants syntax on the backend. This means that if you create an access control policy using the ACL syntax in the JSON editor, it automatically converts to grants syntax when you edit the policy using the visual editor. Grants syntax supports all the same capabilities as ACL syntax with additional features like [route filtering](/docs/features/access-control/grants/grants-via) and [app capabilities](/docs/features/access-control/grants/grants-app-capabilities). Refer to [grants versus ACLs](/docs/reference/grants-vs-acls) for more information.
Each general access rule uses grants syntax, which consists of three main components: sources, destinations, and network restrictions. Grants also support additional components like the `via` field and app capabilities for more advanced access control scenarios. For a complete overview of grants syntax, refer to the [grants syntax reference](/docs/reference/syntax/grants).
The rules table displays all configured access rules with their sources, destinations, and network restrictions. The menu for each rule lets you edit and delete operations. For examples of common access patterns, refer to the [grant examples](/docs/reference/examples/grants).
### [Add a general access rule](#add-a-general-access-rule)
To add a general access rule using the [visual editor](/docs/features/visual-editor):
1. Go to the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console.
2. Select **Add rule** from the **General access rules** tab.
3. Configure the basic fields:
1. **Source**: Define who can connect. Select users, groups, devices, or tags that start connections.
2. **Destination**: Define what the source can connect to. Select the devices, services, or resources that receive connections.
3. **Port and protocol**: Choose specific ports and protocols or select **All ports and protocols**.
4. (Optional) Use the **Note** field to document your rationale for the rule.
5. (Optional) Expand **Advanced options** to configure additional settings:
1. **Device posture**: Specify device posture rules that must be true to let these connections through.
2. **Via**: Specify exit nodes, subnet routers, or app connectors that should route the source to the destination.
3. **App capabilities**: Define permissions that applications can act on when accessed over the tailnet.
4. Review the JSON preview panel to understand the underlying grant syntax.
5. Select **Save grant** to apply the rule.
### [Edit a general access rule](#edit-a-general-access-rule)
To edit a general access rule using the [visual editor](/docs/features/visual-editor):
1. Go to the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console.
2. Select the menu of the rule to edit, then select **Edit**.
3. Update the rule fields and settings.
4. Select **Save grant** to apply the updated rule.
### [Delete a general access rule](#delete-a-general-access-rule)
To delete a general access rule using the [visual editor](/docs/features/visual-editor):
1. Go to the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console.
2. Select the menu of the rule to edit.
3. Select **Delete**.
There is no confirmation required, but you have a brief moment to undo the deletion.
## [Tailscale SSH](#tailscale-ssh)
[Tailscale SSH rules](/docs/features/tailscale-ssh) control SSH access to devices in your tailnet. These rules work alongside general access rules to provide secure SSH connectivity without managing SSH keys. The SSH implementation leverages your existing identity provider for authentication, eliminating the traditional complexity of SSH key distribution and rotation.
SSH rules extend basic network access with SSH-specific controls that enhance security and ease of management. Understanding these components helps you create SSH policies that balance security with usability.
The **Source** field identifies who can start SSH connections. These typically include users or groups from your identity provider. The **Destination** field specifies which devices accept SSH connections, often identified by tags like `tag:server` or `tag:bastion`.
Destination [users](/docs/reference/syntax/policy-file#users) define which user accounts are accessible on the destination. You might specify `autogroup:nonroot` to prevent root access or use email-based matching to map identity provider users to local accounts. **Check mode** determines whether to require periodic re-authentication, adding an extra security layer for sensitive connections.
### [Add an SSH rule](#add-an-ssh-rule)
To add a Tailscale SSH rule using the [visual editor](/docs/features/visual-editor):
1. Go to the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console.
2. Select **Add rule** from the **Tailscale SSH** tab.
3. Configure the SSH connection:
1. **Source**: Select users or groups who can start SSH connections.
2. **Destination**: Choose destination devices or tags.
3. **As destination user**: Specify usernames on the host. Options include `autogroup:nonroot`, `root`, or matching local users with email.
4. **Check mode**: Enable to require authentication checks before letting connections through. Recommended for user-initiated SSH connections.
5. **Check period**: When check mode is enabled, specify the duration (for example, `12h`).
6. (Optional) Use the **Note** field to document the purpose of the SSH rule.
7. (Optional) Configure advanced options if needed:
1. **Recorder**: Specify the recorder node tag to receive SSH session recordings. Leave empty to disable recordings.
2. **Enforce recorder**: Require session recording for connections.
3. **Device posture**: Apply device requirements for SSH access.
4. Review the JSON preview and select **Save SSH rule**.
#### [Check mode best practices](#check-mode-best-practices)
Enable **Check mode** for rules that let humans start SSH connections. This adds an authentication layer that verifies user identity before granting access. The **Check period** determines how long connections remain authorized before requiring re-authentication. Setting appropriate **Check period** values balances security with user convenience.
For automated processes or service accounts, you might disable **Check mode** to prevent interruptions. However, these connections should have tightly scoped permissions and use [tag-based identities](/docs/features/tags) rather than personal credentials.
### [Edit an SSH rule](#edit-an-ssh-rule)
To edit a Tailscale SSH rule using the [visual editor](/docs/features/visual-editor):
1. Go to the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console.
2. Select the **Tailscale SSH** tab.
3. Select the menu of the SSH rule to edit, then select **Edit**.
4. Update the rule fields.
5. (Optional) Expand **Advanced options** to update **Recorder**, **Enforce recorder**, or **Device posture** settings.
6. Select **Save SSH rule** to apply the updated rule.
### [Delete an SSH rule](#delete-an-ssh-rule)
To delete a Tailscale SSH rule using the [visual editor](/docs/features/visual-editor):
1. Go to the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console.
2. Select the **Tailscale SSH** tab.
3. Select the menu of the SSH rule to delete.
4. Select **Delete**.
## [Groups](#groups)
[Groups](/docs/reference/targets-and-selectors) organize users for simplified access control management. The **Groups** tab contains sections for user-defined groups, synced groups from identity providers, and built-in autogroups. Groups reduce policy complexity by letting you manage collections of users rather than individuals, making your policies more maintainable as your organization grows. For detailed information about group types and usage, refer to the [targets documentation](/docs/reference/targets-and-selectors).
### [User-defined groups](#user-defined-groups)
Create and manage [custom user groups](/docs/reference/targets-and-selectors) to use in access control policies. Groups improve policy management by letting you reference collections of users rather than individuals. This abstraction makes policies more readable and reduces the maintenance burden when team membership changes.
Changes to group membership immediately affect all policies referencing that group.
### [Add a user-defined group](#add-a-user-defined-group)
To add a user-defined group using the [visual editor](/docs/features/visual-editor):
1. Go to the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console.
2. Select **Create group** from the **Groups** tab.
3. Configure the group settings:
1. **Group name**: Enter a descriptive name (such as "dev" or "design").
2. **Members**: Search and select users by name or email address.
3. (Optional) Use the **Note** field to document the group's purpose.
4. View the members table to confirm selections.
5. Select **Save group** to create the group.
### [Edit a user-defined group](#edit-a-user-defined-group)
To edit a user-defined group using the [visual editor](/docs/features/visual-editor):
1. Go to the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console.
2. Select the **Groups** tab.
3. In the **User-defined groups** section, select the menu of the group to edit, then select **Edit**.
4. Update the group name, members, or note.
5. Select **Save group** to apply the updated group configuration.
### [Delete a user-defined group](#delete-a-user-defined-group)
To delete a user-defined group using the [visual editor](/docs/features/visual-editor):
1. Go to the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console.
2. Select the **Groups** tab.
3. In the **User-defined** groups section, select the menu of the group to delete.
4. Select **Delete**.
### [Synced groups](#synced-groups)
[Synced groups](/docs/reference/syntax/policy-file#synced-groups) automatically populate from your identity provider through SCIM integration. These groups are read-only in the visual editor. Membership changes must occur in your identity provider and syncs to Tailscale automatically. This integration ensures that your tailnet access control aligns with your organization's identity management processes. You can configure synced groups with your identity provider, including [Google SSO integration](/docs/integrations/google-sync).
The synchronization typically occurs within minutes of changes in your identity provider. You can reference synced groups in policies using the `group:` prefix followed by the group name from your identity provider.
### [Autogroups](#autogroups)
Tailscale offers built-in, dynamically generated groups called [autogroups](/docs/reference/targets-and-selectors#autogroups). These groups automatically include users with specific roles or properties. Autogroups remove the need to manually maintain groups for role-based access control.
## [Tags](#tags)
[Tags](/docs/features/tags) organize non-user devices like servers into functional groups for use in access control policies. Tags let you group devices by function, environment, or any other logical categorization. Unlike user-based groups, tags apply to devices and persist across authentication sessions.
The tags table displays all defined tags with their owners. You can use the search field above the table to filter the results by tag name or owner.
By default [Owners, Admins, and Network admins](/docs/reference/user-roles) are tag owners for all tags.properties.
### [Add a tag](#add-a-tag)
To add a tag using the [visual editor](/docs/features/visual-editor):
1. Go to the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console.
2. Select **Create tag** from the **Tags** tab.
3. Configure the tag settings:
1. **Tag name**: Enter a name without the "tag:" prefix (for example, "prod", "server").
2. **Tag owner**: Select users or groups who can apply this tag (if none specified, implicitly owned by owners, admins, and network admins).
3. (Optional) Use the **Note** field to document the tag's purpose.
4. Select **Save tag** to create the tag.
### [Edit a tag](#edit-a-tag)
To edit a tag using the [visual editor](/docs/features/visual-editor):
1. Go to the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console.
2. Select the **Tags** tab.
3. Select the menu of the tag to edit, then select **Edit**.
4. Update the tag settings.
5. Select **Save tag** to apply the updated tag configuration.
### [Delete a tag](#delete-a-tag)
To delete a tag using the [visual editor](/docs/features/visual-editor):
1. Go to the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console.
2. Select the **Tags** tab.
3. Select the menu of the tag to delete.
4. Select **Delete**.
Deleting a tag removes it from all devices, potentially affecting access control rules that reference it.
## [IP sets](#ip-sets)
[IP sets](/docs/features/tailnet-policy-file/ip-sets) are collections of IP addresses, hosts, and subnets to use in access control policies. They improve policy management by letting you reference groups of network addresses with a single identifier. IP sets support composition, letting you build complex network definitions from simpler components.
IP sets support composition through **Add** and **Remove** operations. Start with broad inclusions using **Add**, then refine the set using **Remove** to exclude specific ranges. This approach lets you create flexible network segmentation without duplicating IP definitions.
For example, you might add `10.0.0.0/8` to include your entire private network, then remove `10.0.1.0/24` to exclude a specific subnet. This composition model helps maintain complex policies as your infrastructure evolves.
### [Add an IP set](#add-an-ip-set)
To add an IP set using the [visual editor](/docs/features/visual-editor):
1. Go to the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console.
2. Select **Create IP set** from the **IP sets** tab.
3. Configure the IP set:
4. **Name**: Enter a descriptive name for the IP set.
5. (Optional) Use the **Note** field to document the set's purpose.
6. (Optional) Configure targets in the **TARGETS** section:
1. Select **Add** or **Remove** from the dropdown list.
2. Enter CIDRs, IP addresses, hosts, or other IP sets.
3. Select **X** to remove target rows.
4. Select the plus icon to add more rows.
5. Select **Save IP set** to create the IP set.
### [Edit an IP set](#edit-an-ip-set)
To edit an IP set using the [visual editor](/docs/features/visual-editor):
1. Go to the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console.
2. Select the **IP sets** tab.
3. Select the menu of the IP set to edit, then select **Edit**.
4. Update the IP set configuration.
5. Select **Save IP set** to apply the updated IP set configuration.
### [Delete an IP set](#delete-an-ip-set)
To delete an IP set using the [visual editor](/docs/features/visual-editor):
1. Go to the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console.
2. Select the **IP sets** tab.
3. Select the menu of the IP set to delete.
4. Select **Delete**.
## [Hosts](#hosts)
[Hosts](/docs/reference/syntax/policy-file#hosts) create friendly names for IP addresses and CIDR ranges. This improves policy readability by replacing numeric addresses with meaningful identifiers. Instead of remembering that `192.168.1.100` is your database server, you can reference it as `database-primary` throughout your policies.
You can use host definitions in access rules, IP sets, and other policy components that accept IP addresses. The hosts table displays all defined hosts with their associated IP addresses for quick reference. Host names make your policies self-documenting and reduce errors from mistyped IP addresses.
### [Add a host](#add-a-host)
To add a host using the [visual editor](/docs/features/visual-editor):
1. Go to the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console.
2. Select **Create host** from the **Hosts** tab.
3. Configure the host settings:
1. **Host name**: Enter a descriptive name for the host.
2. **IP address**: Enter an IP address or CIDR range.
3. (Optional) Use the **Note** field to document the host's purpose.
4. Select **Save host** to create the host entry.
### [Edit a host](#edit-a-host)
To edit a host using the [visual editor](/docs/features/visual-editor):
1. Go to the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console.
2. Select the **Hosts** tab.
3. Select the menu of the host to edit, then select **Edit**.
4. Update the host name, IP address, or note.
5. Select **Save host** to apply the updated host configuration.
### [Delete a host](#delete-a-host)
To delete a host using the [visual editor](/docs/features/visual-editor):
1. Go to the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console.
2. Select the **Hosts** tab.
3. Select the menu of the host to delete.
4. Select **Delete**.
## [Node attributes](#node-attributes)
[Node attributes](/docs/reference/syntax/policy-file#nodeattrs) are device attributes and settings that you can use do things like control feature availability and device behavior across your tailnet. For example, you can use an attribute to enable [Tailscale Funnel](/docs/features/tailscale-funnel) or configure specialized behaviors without modifying individual device configurations.
Node attributes commonly enable features that extend device capabilities. Understanding these common patterns helps you implement similar configurations for your specific needs.
The `funnel` attribute lets devices use [Tailscale Funnel](/docs/features/tailscale-funnel) for public access. The `mullvad` attribute grants access to [Mullvad exit nodes](/docs/features/exit-nodes/mullvad-exit-nodes) for enhanced privacy. The `drive:share` and `drive:access` attributes enable [Taildrive](/docs/features/taildrive) file sharing capabilities. The `disable-ipv4` attribute disables IPv4 addressing for IPv6-only deployments.
Each attribute applies immediately to matching devices without requiring device reconfiguration or restart.
### [Add a node attribute](#add-a-node-attribute)
To add a node attribute using the [visual editor](/docs/features/visual-editor):
1. Go to the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console.
2. Select **Add node attribute** from the **Node attributes** tab.
3. Configure the basic settings:
* **Targets**: Select devices, tags, users, or groups.
* (Optional) Use the **Note** field to document the attribute's purpose.
* **Attributes**: Select attributes to apply (for example, "funnel").
* (Optional) **IP Pools**: Enter CIDRs if the attribute requires IP assignments.
* (Optional) Configure application capabilities:
1. **App**: Enter the domain identifier.
2. **Capability**: Enter capability configuration in JSON format.
3. Select **Add additional capability** for multiple capabilities per app.
4. Select **Add another app** for multiple applications.
5. Review the JSON preview panel.
6. Select **Save node attribute** to apply the configuration.
### [Edit a node attribute](#edit-a-node-attribute)
To edit a node attribute using the [visual editor](/docs/features/visual-editor):
1. Go to the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console.
2. Select the **Node attributes** tab.
3. Select the menu of the node attribute to edit, then select **Edit**.
4. Update the targets, attributes, IP pools, or app capabilities.
5. Select **Save node attribute** to apply the updated configuration.
### [Delete a node attribute](#delete-a-node-attribute)
To delete a node attribute using the [visual editor](/docs/features/visual-editor):
1. Go to the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console.
2. Select the **Node attributes** tab.
3. Select the menu of the node attribute to delete.
4. Select **Delete**.
## [Device posture](#device-posture)
[Device posture](/docs/features/device-posture) rules define the requirements a device must meet for access control policies to prevent non-compliant devices from accessing sensitive resources. Posture rules can check for conditions like OS version, disk encryption status, and the presence of specific security software. You can create custom posture checks to enforce your organization's security policies.
Posture checks run continuously, revoking access if devices fall out of compliance.
You can reference posture rules in the `srcPosture` field of access rules to enforce device compliance. Devices must meet all specified posture requirements to establish connections. Update posture definitions as security requirements evolve.
Posture enforcement happens at connection time and periodically during active connections. If a device falls out of compliance, existing connections end and new connections fail until the device meets requirements again.
### [Add a posture rule](#add-a-posture-rule)
To add a device posture rule using the [visual editor](/docs/features/visual-editor):
1. Go to the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console.
2. Select **Add device posture** from the **Device posture** tab.
3. Configure the posture rule:
4. **Name**: Enter a name for the device posture rule.
5. (Optional) Use the **Note** field to document the requirements.
6. Configure posture assertions:
1. Select **Posture assertion** to expand options.
2. Choose from **HOST INFO** attributes (`node:os`, `node:osVersion`, `node:tsAutoUpdate`, `node:tsReleaseTrack`, `node:tsStateEncrypted`, `node:tsVersion`).
3. Configure comparison operators and values.
4. Select **Save device posture** to create the rule.
For integration with enterprise device management systems, refer to the documentation for [Intune](/docs/integrations/mdm/intune), [Jamf Pro](/docs/integrations/jamf-pro), [Iru](/docs/integrations/iru) (formerly Kandji), [1Password XAM (Kolide)](/docs/integrations/kolide), and [SentinelOne](/docs/integrations/sentinelone).
### [Edit a device posture rule](#edit-a-device-posture-rule)
To edit a device posture rule using the [visual editor](/docs/features/visual-editor):
1. Go to the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console.
2. Select the **Device posture** tab.
3. Select the menu of the device posture rule to edit, then select **Edit**.
4. Update the name, posture assertions, or note.
5. Select **Save device posture** to apply the updated rule.
### [Delete device posture rules](#delete-device-posture-rules)
To delete a device posture rule using the [visual editor](/docs/features/visual-editor):
1. Go to the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console.
2. Select the **Device posture** tab.
3. Select the menu of the device posture rule to delete.
4. Select **Delete**.
## [Auto approvers](#auto-approvers)
[Auto approvers](/docs/reference/syntax/policy-file#autoapprovers) are policies that let you automatically approve specific operations, such as advertising subnet routes or exit nodes, without manual intervention.
### [Routes](#routes)
Automatically approve [subnet route](/docs/features/subnet-routers) advertisements from users, groups, and tags. This removes manual approval for subnet routers. Route auto approval lets you scale without administrative bottlenecks.
### [Add a route auto approver](#add-a-route-auto-approver)
To add a route auto approver using the [visual editor](/docs/features/visual-editor):
1. Go to the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console.
2. Select **Add route** from the **Routes** section of the **Auto approvers** tab.
3. Configure the auto approver:
1. **Route**: Enter the route to auto approve (for example, `192.0.2.0/24`).
2. **Route is auto approved for**: Select users, groups, or tags.
3. (Optional) Use the **Note** field to document the approval rationale.
4. Select **Save route auto approver** to create the rule.
### [Edit a route auto approver](#edit-a-route-auto-approver)
To edit a subnet route auto approver using the [visual editor](/docs/features/visual-editor):
1. Go to the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console.
2. Select the **Auto approvers** tab.
3. In the **Routes** section, select the menu of the subnet route approval to edit, then select **Edit**.
4. Update the route fields.
5. Select **Save route auto approver** to apply the updated configuration.
### [Delete a route auto approver](#delete-a-route-auto-approver)
To delete a subnet route auto approver using the [visual editor](/docs/features/visual-editor):
1. Go to the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console.
2. Select the **Auto approvers** tab.
3. In the **Routes** section, select the menu of the subnet route approval to delete.
4. Select **Delete**.
### [Exit nodes](#exit-nodes)
Automatically approve users, groups, and tags as [exit nodes](/docs/features/exit-nodes). This lets designated devices route internet traffic without manual approval. Exit node auto approval supports use cases like regional exit nodes or dedicated privacy infrastructure.
### [Add an exit node auto approver](#add-an-exit-node-auto-approver)
To add an exit node auto approver using the [visual editor](/docs/features/visual-editor):
1. Go to the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console.
2. Select **Add exit node** from the **Exit nodes** section of the **Auto approvers** tab.
3. Configure the auto approver by selecting users, groups, or tags to be automatically approved as exit nodes.
4. Select **Save exit node** to create the auto approval rule.
### [Edit an exit node auto approver](#edit-an-exit-node-auto-approver)
To edit an exit node auto approver using the [visual editor](/docs/features/visual-editor):
1. Go to the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console.
2. Select the **Auto approvers** tab.
3. In the **Exit nodes** section, select the menu of the exit node to edit, then select **Edit**.
4. Update the users, groups, or tags that are automatically approved as exit nodes.
5. Select **Save exit node** to apply the updated configuration.
### [Delete an exit node auto approver](#delete-an-exit-node-auto-approver)
To delete an exit node auto approver using the [visual editor](/docs/features/visual-editor):
1. Go to the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console.
2. Select the **Auto approvers** tab.
3. In the **Exit nodes** section, select the menu of the exit node to delete.
4. Select **Delete**.
## [Tests](#tests)
For an overview of tests and how they work in the visual policy editor, refer to the [tests section](/docs/features/visual-editor#tests) in the visual policy editor documentation. This reference documents the UI controls and procedures for managing tests.
The **Tests** tab contains sections for general access tests and SSH-specific tests. Tests act as regression protection, ensuring that policy modifications don't accidentally break existing access patterns.
### [General tests](#general-tests)
Create validation tests that access control changes must pass before saving. These tests ensure policy modifications don't accidentally revoke important permissions or expose critical systems. Well-designed tests catch configuration errors before they affect production access.
### [Add a general test](#add-a-general-test)
To add a general test using the [visual editor](/docs/features/visual-editor):
1. Go to the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console.
2. Select **Add test** in the **General tests** section.
3. Configure test parameters:
* **Source**: Specify the test source identity.
* **Source device posture attributes**: Add device conditions if posture rules apply.
* **Accept**: List destinations that should be accessible.
* **Deny**: List destinations that should be blocked.
* **Protocol**: Select the protocol to test.
* (Optional) Use the **Note** field to document the test's purpose.
* Review the JSON preview and select **Save test**.
### [Edit a general test](#edit-a-general-test)
To edit a general test using the [visual editor](/docs/features/visual-editor):
1. Go to the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console.
2. Select the **Tests** tab.
3. In the **General tests** section, select the menu of the test to edit, then select **Edit**.
4. Update the test parameters.
5. Select **Save test** to apply the updated test.
### [Delete a general test](#delete-a-general-test)
To delete a general test using the [visual editor](/docs/features/visual-editor):
1. Go to the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console.
2. Select the **Tests** tab.
3. In the **General tests** section, select the menu of the test.
4. Select **Delete**.
### [SSH tests](#ssh-tests)
[SSH tests](/docs/reference/syntax/policy-file#sshtests) let you write validation tests that Tailscale SSH policy changes must pass before you can save them. These tests verify SSH access rules work as intended. SSH tests validate both access permissions and authentication requirements. Tests run automatically when you save policy changes. Failed tests prevent the policy from saving and display error messages indicating which assertions failed.
#### [Add a SSH test](#add-a-ssh-test)
To add an SSH test using the [visual editor](/docs/features/visual-editor):
1. Go to the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console.
2. Select **Add SSH test** from the **SSH tests** section of the **Tests** tab.
3. Configure the SSH test parameters:
1. **Source**: Specify the SSH connection source.
2. **Destination**: Define the SSH target.
3. **Accept**: Select users that should be allowed (options: autogroup:nonroot, root, Match local user with email).
4. **Check**: Select users requiring check mode.
5. **Deny**: Select users that should be denied.
6. (Optional) Use the **Note** field to document the test scenario.
7. Select **Save SSH test** to create the test.
### [Edit a SSH test](#edit-a-ssh-test)
To edit an SSH test using the [visual editor](/docs/features/visual-editor):
1. Go to the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console.
2. Select the **Tests** tab.
3. In the **SSH tests** section, select the menu of the test to edit, then select **Edit**.
4. Update the test parameters (Source, Destination, Accept, Check, Deny, and Note fields).
5. Select **Save SSH test** to apply the updated test.
### [Delete a SSH test](#delete-a-ssh-test)
To delete an SSH test using the [visual editor](/docs/features/visual-editor):
1. Go to the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console.
2. Select the **Tests** tab.
3. In the **SSH tests** section, select the menu of the test to delete.
4. Select **Delete**.
On this page
* [General access rules](#general-access-rules)
* [Add a general access rule](#add-a-general-access-rule)
* [Edit a general access rule](#edit-a-general-access-rule)
* [Delete a general access rule](#delete-a-general-access-rule)
* [Tailscale SSH](#tailscale-ssh)
* [Add an SSH rule](#add-an-ssh-rule)
* [Check mode best practices](#check-mode-best-practices)
* [Edit an SSH rule](#edit-an-ssh-rule)
* [Delete an SSH rule](#delete-an-ssh-rule)
* [Groups](#groups)
* [User-defined groups](#user-defined-groups)
* [Add a user-defined group](#add-a-user-defined-group)
* [Edit a user-defined group](#edit-a-user-defined-group)
* [Delete a user-defined group](#delete-a-user-defined-group)
* [Synced groups](#synced-groups)
* [Autogroups](#autogroups)
* [Tags](#tags)
* [Add a tag](#add-a-tag)
* [Edit a tag](#edit-a-tag)
* [Delete a tag](#delete-a-tag)
* [IP sets](#ip-sets)
* [Add an IP set](#add-an-ip-set)
* [Edit an IP set](#edit-an-ip-set)
* [Delete an IP set](#delete-an-ip-set)
* [Hosts](#hosts)
* [Add a host](#add-a-host)
* [Edit a host](#edit-a-host)
* [Delete a host](#delete-a-host)
* [Node attributes](#node-attributes)
* [Add a node attribute](#add-a-node-attribute)
* [Edit a node attribute](#edit-a-node-attribute)
* [Delete a node attribute](#delete-a-node-attribute)
* [Device posture](#device-posture)
* [Add a posture rule](#add-a-posture-rule)
* [Edit a device posture rule](#edit-a-device-posture-rule)
* [Delete device posture rules](#delete-device-posture-rules)
* [Auto approvers](#auto-approvers)
* [Routes](#routes)
* [Add a route auto approver](#add-a-route-auto-approver)
* [Edit a route auto approver](#edit-a-route-auto-approver)
* [Delete a route auto approver](#delete-a-route-auto-approver)
* [Exit nodes](#exit-nodes)
* [Add an exit node auto approver](#add-an-exit-node-auto-approver)
* [Edit an exit node auto approver](#edit-an-exit-node-auto-approver)
* [Delete an exit node auto approver](#delete-an-exit-node-auto-approver)
* [Tests](#tests)
* [General tests](#general-tests)
* [Add a general test](#add-a-general-test)
* [Edit a general test](#edit-a-general-test)
* [Delete a general test](#delete-a-general-test)
* [SSH tests](#ssh-tests)
* [Add a SSH test](#add-a-ssh-test)
* [Edit a SSH test](#edit-a-ssh-test)
* [Delete a SSH test](#delete-a-ssh-test)
Scroll to top