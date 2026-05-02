Roles | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Admin](/api/reference/go/resources/admin)
[Organization](/api/reference/go/resources/admin/subresources/organization)
[Projects](/api/reference/go/resources/admin/subresources/organization/subresources/projects)
[Users](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/users)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Roles
##### [List project user role assignments](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/users/subresources/roles/methods/list)
client.Admin.Organization.Projects.Users.Roles.List(ctx, projectID, userID, query) (\*CursorPage[[AdminOrganizationProjectUserRoleListResponse](</api/reference/go/resources/admin#(resource) admin.organization.projects.users.roles > (model) AdminOrganizationProjectUserRoleListResponse > (schema)>)], error)
GET/projects/{project\_id}/users/{user\_id}/roles
##### [Assign project role to user](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/users/subresources/roles/methods/create)
client.Admin.Organization.Projects.Users.Roles.New(ctx, projectID, userID, body) (\*[AdminOrganizationProjectUserRoleNewResponse](</api/reference/go/resources/admin#(resource) admin.organization.projects.users.roles > (model) AdminOrganizationProjectUserRoleNewResponse > (schema)>), error)
POST/projects/{project\_id}/users/{user\_id}/roles
##### [Unassign project role from user](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/users/subresources/roles/methods/delete)
client.Admin.Organization.Projects.Users.Roles.Delete(ctx, projectID, userID, roleID) (\*[AdminOrganizationProjectUserRoleDeleteResponse](</api/reference/go/resources/admin#(resource) admin.organization.projects.users.roles > (model) AdminOrganizationProjectUserRoleDeleteResponse > (schema)>), error)
DELETE/projects/{project\_id}/users/{user\_id}/roles/{role\_id}