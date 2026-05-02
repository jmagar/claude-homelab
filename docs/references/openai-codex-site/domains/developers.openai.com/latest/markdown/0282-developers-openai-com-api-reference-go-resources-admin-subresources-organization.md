Roles | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Admin](/api/reference/go/resources/admin)
[Organization](/api/reference/go/resources/admin/subresources/organization)
[Projects](/api/reference/go/resources/admin/subresources/organization/subresources/projects)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Roles
##### [List project roles](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/list)
client.Admin.Organization.Projects.Roles.List(ctx, projectID, query) (\*CursorPage[[Role](</api/reference/go/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>)], error)
GET/projects/{project\_id}/roles
##### [Create project role](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/create)
client.Admin.Organization.Projects.Roles.New(ctx, projectID, body) (\*[Role](</api/reference/go/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>), error)
POST/projects/{project\_id}/roles
##### [Update project role](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/update)
client.Admin.Organization.Projects.Roles.Update(ctx, projectID, roleID, body) (\*[Role](</api/reference/go/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>), error)
POST/projects/{project\_id}/roles/{role\_id}
##### [Delete project role](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/delete)
client.Admin.Organization.Projects.Roles.Delete(ctx, projectID, roleID) (\*[AdminOrganizationProjectRoleDeleteResponse](</api/reference/go/resources/admin#(resource) admin.organization.projects.roles > (model) AdminOrganizationProjectRoleDeleteResponse > (schema)>), error)
DELETE/projects/{project\_id}/roles/{role\_id}