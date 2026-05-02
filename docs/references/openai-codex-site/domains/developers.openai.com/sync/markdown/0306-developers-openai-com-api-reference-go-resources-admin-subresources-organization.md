Roles | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Admin](/api/reference/go/resources/admin)
[Organization](/api/reference/go/resources/admin/subresources/organization)
[Projects](/api/reference/go/resources/admin/subresources/organization/subresources/projects)
[Groups](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/groups)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Roles
##### [List project group role assignments](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/groups/subresources/roles/methods/list)
client.Admin.Organization.Projects.Groups.Roles.List(ctx, projectID, groupID, query) (\*CursorPage[[AdminOrganizationProjectGroupRoleListResponse](</api/reference/go/resources/admin#(resource) admin.organization.projects.groups.roles > (model) AdminOrganizationProjectGroupRoleListResponse > (schema)>)], error)
GET/projects/{project\_id}/groups/{group\_id}/roles
##### [Assign project role to group](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/groups/subresources/roles/methods/create)
client.Admin.Organization.Projects.Groups.Roles.New(ctx, projectID, groupID, body) (\*[AdminOrganizationProjectGroupRoleNewResponse](</api/reference/go/resources/admin#(resource) admin.organization.projects.groups.roles > (model) AdminOrganizationProjectGroupRoleNewResponse > (schema)>), error)
POST/projects/{project\_id}/groups/{group\_id}/roles
##### [Unassign project role from group](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/groups/subresources/roles/methods/delete)
client.Admin.Organization.Projects.Groups.Roles.Delete(ctx, projectID, groupID, roleID) (\*[AdminOrganizationProjectGroupRoleDeleteResponse](</api/reference/go/resources/admin#(resource) admin.organization.projects.groups.roles > (model) AdminOrganizationProjectGroupRoleDeleteResponse > (schema)>), error)
DELETE/projects/{project\_id}/groups/{group\_id}/roles/{role\_id}