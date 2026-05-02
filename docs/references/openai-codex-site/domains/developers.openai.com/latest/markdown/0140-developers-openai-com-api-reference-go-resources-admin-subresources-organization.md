Roles | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Admin](/api/reference/go/resources/admin)
[Organization](/api/reference/go/resources/admin/subresources/organization)
[Groups](/api/reference/go/resources/admin/subresources/organization/subresources/groups)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Roles
##### [List group organization role assignments](/api/reference/go/resources/admin/subresources/organization/subresources/groups/subresources/roles/methods/list)
client.Admin.Organization.Groups.Roles.List(ctx, groupID, query) (\*CursorPage[[AdminOrganizationGroupRoleListResponse](</api/reference/go/resources/admin#(resource) admin.organization.groups.roles > (model) AdminOrganizationGroupRoleListResponse > (schema)>)], error)
GET/organization/groups/{group\_id}/roles
##### [Assign organization role to group](/api/reference/go/resources/admin/subresources/organization/subresources/groups/subresources/roles/methods/create)
client.Admin.Organization.Groups.Roles.New(ctx, groupID, body) (\*[AdminOrganizationGroupRoleNewResponse](</api/reference/go/resources/admin#(resource) admin.organization.groups.roles > (model) AdminOrganizationGroupRoleNewResponse > (schema)>), error)
POST/organization/groups/{group\_id}/roles
##### [Unassign organization role from group](/api/reference/go/resources/admin/subresources/organization/subresources/groups/subresources/roles/methods/delete)
client.Admin.Organization.Groups.Roles.Delete(ctx, groupID, roleID) (\*[AdminOrganizationGroupRoleDeleteResponse](</api/reference/go/resources/admin#(resource) admin.organization.groups.roles > (model) AdminOrganizationGroupRoleDeleteResponse > (schema)>), error)
DELETE/organization/groups/{group\_id}/roles/{role\_id}