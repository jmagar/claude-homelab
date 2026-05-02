Roles | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Admin](/api/reference/go/resources/admin)
[Organization](/api/reference/go/resources/admin/subresources/organization)
[Users](/api/reference/go/resources/admin/subresources/organization/subresources/users)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Roles
##### [List user organization role assignments](/api/reference/go/resources/admin/subresources/organization/subresources/users/subresources/roles/methods/list)
client.Admin.Organization.Users.Roles.List(ctx, userID, query) (\*CursorPage[[AdminOrganizationUserRoleListResponse](</api/reference/go/resources/admin#(resource) admin.organization.users.roles > (model) AdminOrganizationUserRoleListResponse > (schema)>)], error)
GET/organization/users/{user\_id}/roles
##### [Assign organization role to user](/api/reference/go/resources/admin/subresources/organization/subresources/users/subresources/roles/methods/create)
client.Admin.Organization.Users.Roles.New(ctx, userID, body) (\*[AdminOrganizationUserRoleNewResponse](</api/reference/go/resources/admin#(resource) admin.organization.users.roles > (model) AdminOrganizationUserRoleNewResponse > (schema)>), error)
POST/organization/users/{user\_id}/roles
##### [Unassign organization role from user](/api/reference/go/resources/admin/subresources/organization/subresources/users/subresources/roles/methods/delete)
client.Admin.Organization.Users.Roles.Delete(ctx, userID, roleID) (\*[AdminOrganizationUserRoleDeleteResponse](</api/reference/go/resources/admin#(resource) admin.organization.users.roles > (model) AdminOrganizationUserRoleDeleteResponse > (schema)>), error)
DELETE/organization/users/{user\_id}/roles/{role\_id}