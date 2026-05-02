Users | OpenAI API Reference
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
# Users
##### [List users](/api/reference/go/resources/admin/subresources/organization/subresources/users/methods/list)
client.Admin.Organization.Users.List(ctx, query) (\*ConversationCursorPage[[OrganizationUser](</api/reference/go/resources/admin#(resource) admin.organization.users > (model) organization_user > (schema)>)], error)
GET/organization/users
##### [Retrieve user](/api/reference/go/resources/admin/subresources/organization/subresources/users/methods/retrieve)
client.Admin.Organization.Users.Get(ctx, userID) (\*[OrganizationUser](</api/reference/go/resources/admin#(resource) admin.organization.users > (model) organization_user > (schema)>), error)
GET/organization/users/{user\_id}
##### [Modify user](/api/reference/go/resources/admin/subresources/organization/subresources/users/methods/update)
client.Admin.Organization.Users.Update(ctx, userID, body) (\*[OrganizationUser](</api/reference/go/resources/admin#(resource) admin.organization.users > (model) organization_user > (schema)>), error)
POST/organization/users/{user\_id}
##### [Delete user](/api/reference/go/resources/admin/subresources/organization/subresources/users/methods/delete)
client.Admin.Organization.Users.Delete(ctx, userID) (\*[AdminOrganizationUserDeleteResponse](</api/reference/go/resources/admin#(resource) admin.organization.users > (model) AdminOrganizationUserDeleteResponse > (schema)>), error)
DELETE/organization/users/{user\_id}
##### ModelsExpand Collapse
type OrganizationUser struct{…}
Represents an individual `user` within an organization.
ID string
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) id>)
AddedAt int64
The Unix timestamp (in seconds) of when the user was added.
formatunixtime
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) added_at>)
Email string
The email address of the user
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) email>)
Name string
The name of the user
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) name>)
Object OrganizationUser
The object type, which is always `organization.user`
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) object>)
Role OrganizationUserRole
`owner` or `reader`
One of the following:
const OrganizationUserRoleOwner OrganizationUserRole = "owner"
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) role > (member) 0>)
const OrganizationUserRoleReader OrganizationUserRole = "reader"
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) role>)
[](<#(resource) admin.organization.users > (model) organization_user > (schema)>)
#### UsersRoles
##### [List user organization role assignments](/api/reference/go/resources/admin/subresources/organization/subresources/users/subresources/roles/methods/list)
client.Admin.Organization.Users.Roles.List(ctx, userID, query) (\*CursorPage[[AdminOrganizationUserRoleListResponse](</api/reference/go/resources/admin#(resource) admin.organization.users.roles > (model) AdminOrganizationUserRoleListResponse > (schema)>)], error)
GET/organization/users/{user\_id}/roles
##### [Assign organization role to user](/api/reference/go/resources/admin/subresources/organization/subresources/users/subresources/roles/methods/create)
client.Admin.Organization.Users.Roles.New(ctx, userID, body) (\*[AdminOrganizationUserRoleNewResponse](</api/reference/go/resources/admin#(resource) admin.organization.users.roles > (model) AdminOrganizationUserRoleNewResponse > (schema)>), error)
POST/organization/users/{user\_id}/roles
##### [Unassign organization role from user](/api/reference/go/resources/admin/subresources/organization/subresources/users/subresources/roles/methods/delete)
client.Admin.Organization.Users.Roles.Delete(ctx, userID, roleID) (\*[AdminOrganizationUserRoleDeleteResponse](</api/reference/go/resources/admin#(resource) admin.organization.users.roles > (model) AdminOrganizationUserRoleDeleteResponse > (schema)>), error)
DELETE/organization/users/{user\_id}/roles/{role\_id}