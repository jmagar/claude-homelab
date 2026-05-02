Groups | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Admin](/api/reference/go/resources/admin)
[Organization](/api/reference/go/resources/admin/subresources/organization)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Groups
##### [List groups](/api/reference/go/resources/admin/subresources/organization/subresources/groups/methods/list)
client.Admin.Organization.Groups.List(ctx, query) (\*CursorPage[[Group](</api/reference/go/resources/admin#(resource) admin.organization.groups > (model) group > (schema)>)], error)
GET/organization/groups
##### [Create group](/api/reference/go/resources/admin/subresources/organization/subresources/groups/methods/create)
client.Admin.Organization.Groups.New(ctx, body) (\*[Group](</api/reference/go/resources/admin#(resource) admin.organization.groups > (model) group > (schema)>), error)
POST/organization/groups
##### [Update group](/api/reference/go/resources/admin/subresources/organization/subresources/groups/methods/update)
client.Admin.Organization.Groups.Update(ctx, groupID, body) (\*[AdminOrganizationGroupUpdateResponse](</api/reference/go/resources/admin#(resource) admin.organization.groups > (model) AdminOrganizationGroupUpdateResponse > (schema)>), error)
POST/organization/groups/{group\_id}
##### [Delete group](/api/reference/go/resources/admin/subresources/organization/subresources/groups/methods/delete)
client.Admin.Organization.Groups.Delete(ctx, groupID) (\*[AdminOrganizationGroupDeleteResponse](</api/reference/go/resources/admin#(resource) admin.organization.groups > (model) AdminOrganizationGroupDeleteResponse > (schema)>), error)
DELETE/organization/groups/{group\_id}
##### ModelsExpand Collapse
type Group struct{…}
Details about an organization group.
ID string
Identifier for the group.
[](<#(resource) admin.organization.groups > (model) group > (schema) > (property) id>)
CreatedAt int64
Unix timestamp (in seconds) when the group was created.
formatunixtime
[](<#(resource) admin.organization.groups > (model) group > (schema) > (property) created_at>)
IsScimManaged bool
Whether the group is managed through SCIM and controlled by your identity provider.
[](<#(resource) admin.organization.groups > (model) group > (schema) > (property) is_scim_managed>)
Name string
Display name of the group.
[](<#(resource) admin.organization.groups > (model) group > (schema) > (property) name>)
[](<#(resource) admin.organization.groups > (model) group > (schema)>)
#### GroupsUsers
##### [List group users](/api/reference/go/resources/admin/subresources/organization/subresources/groups/subresources/users/methods/list)
client.Admin.Organization.Groups.Users.List(ctx, groupID, query) (\*CursorPage[[OrganizationUser](</api/reference/go/resources/admin#(resource) admin.organization.users > (model) organization_user > (schema)>)], error)
GET/organization/groups/{group\_id}/users
##### [Add group user](/api/reference/go/resources/admin/subresources/organization/subresources/groups/subresources/users/methods/create)
client.Admin.Organization.Groups.Users.New(ctx, groupID, body) (\*[AdminOrganizationGroupUserNewResponse](</api/reference/go/resources/admin#(resource) admin.organization.groups.users > (model) AdminOrganizationGroupUserNewResponse > (schema)>), error)
POST/organization/groups/{group\_id}/users
##### [Remove group user](/api/reference/go/resources/admin/subresources/organization/subresources/groups/subresources/users/methods/delete)
client.Admin.Organization.Groups.Users.Delete(ctx, groupID, userID) (\*[AdminOrganizationGroupUserDeleteResponse](</api/reference/go/resources/admin#(resource) admin.organization.groups.users > (model) AdminOrganizationGroupUserDeleteResponse > (schema)>), error)
DELETE/organization/groups/{group\_id}/users/{user\_id}
#### GroupsRoles
##### [List group organization role assignments](/api/reference/go/resources/admin/subresources/organization/subresources/groups/subresources/roles/methods/list)
client.Admin.Organization.Groups.Roles.List(ctx, groupID, query) (\*CursorPage[[AdminOrganizationGroupRoleListResponse](</api/reference/go/resources/admin#(resource) admin.organization.groups.roles > (model) AdminOrganizationGroupRoleListResponse > (schema)>)], error)
GET/organization/groups/{group\_id}/roles
##### [Assign organization role to group](/api/reference/go/resources/admin/subresources/organization/subresources/groups/subresources/roles/methods/create)
client.Admin.Organization.Groups.Roles.New(ctx, groupID, body) (\*[AdminOrganizationGroupRoleNewResponse](</api/reference/go/resources/admin#(resource) admin.organization.groups.roles > (model) AdminOrganizationGroupRoleNewResponse > (schema)>), error)
POST/organization/groups/{group\_id}/roles
##### [Unassign organization role from group](/api/reference/go/resources/admin/subresources/organization/subresources/groups/subresources/roles/methods/delete)
client.Admin.Organization.Groups.Roles.Delete(ctx, groupID, roleID) (\*[AdminOrganizationGroupRoleDeleteResponse](</api/reference/go/resources/admin#(resource) admin.organization.groups.roles > (model) AdminOrganizationGroupRoleDeleteResponse > (schema)>), error)
DELETE/organization/groups/{group\_id}/roles/{role\_id}