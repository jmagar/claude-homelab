Users | OpenAI API Reference
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
# Users
##### [List project users](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/list)
client.Admin.Organization.Projects.Users.List(ctx, projectID, query) (\*ConversationCursorPage[[ProjectUser](</api/reference/go/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>)], error)
GET/organization/projects/{project\_id}/users
##### [Create project user](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/create)
client.Admin.Organization.Projects.Users.New(ctx, projectID, body) (\*[ProjectUser](</api/reference/go/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>), error)
POST/organization/projects/{project\_id}/users
##### [Retrieve project user](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/retrieve)
client.Admin.Organization.Projects.Users.Get(ctx, projectID, userID) (\*[ProjectUser](</api/reference/go/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>), error)
GET/organization/projects/{project\_id}/users/{user\_id}
##### [Modify project user](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/update)
client.Admin.Organization.Projects.Users.Update(ctx, projectID, userID, body) (\*[ProjectUser](</api/reference/go/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>), error)
POST/organization/projects/{project\_id}/users/{user\_id}
##### [Delete project user](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/delete)
client.Admin.Organization.Projects.Users.Delete(ctx, projectID, userID) (\*[AdminOrganizationProjectUserDeleteResponse](</api/reference/go/resources/admin#(resource) admin.organization.projects.users > (model) AdminOrganizationProjectUserDeleteResponse > (schema)>), error)
DELETE/organization/projects/{project\_id}/users/{user\_id}
##### ModelsExpand Collapse
type ProjectUser struct{…}
Represents an individual user in a project.
ID string
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) id>)
AddedAt int64
The Unix timestamp (in seconds) of when the project was added.
formatunixtime
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) added_at>)
Email string
The email address of the user
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) email>)
Name string
The name of the user
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) name>)
Object OrganizationProjectUser
The object type, which is always `organization.project.user`
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) object>)
Role ProjectUserRole
`owner` or `member`
One of the following:
const ProjectUserRoleOwner ProjectUserRole = "owner"
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role > (member) 0>)
const ProjectUserRoleMember ProjectUserRole = "member"
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema)>)
#### UsersRoles
##### [List project user role assignments](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/users/subresources/roles/methods/list)
client.Admin.Organization.Projects.Users.Roles.List(ctx, projectID, userID, query) (\*CursorPage[[AdminOrganizationProjectUserRoleListResponse](</api/reference/go/resources/admin#(resource) admin.organization.projects.users.roles > (model) AdminOrganizationProjectUserRoleListResponse > (schema)>)], error)
GET/projects/{project\_id}/users/{user\_id}/roles
##### [Assign project role to user](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/users/subresources/roles/methods/create)
client.Admin.Organization.Projects.Users.Roles.New(ctx, projectID, userID, body) (\*[AdminOrganizationProjectUserRoleNewResponse](</api/reference/go/resources/admin#(resource) admin.organization.projects.users.roles > (model) AdminOrganizationProjectUserRoleNewResponse > (schema)>), error)
POST/projects/{project\_id}/users/{user\_id}/roles
##### [Unassign project role from user](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/users/subresources/roles/methods/delete)
client.Admin.Organization.Projects.Users.Roles.Delete(ctx, projectID, userID, roleID) (\*[AdminOrganizationProjectUserRoleDeleteResponse](</api/reference/go/resources/admin#(resource) admin.organization.projects.users.roles > (model) AdminOrganizationProjectUserRoleDeleteResponse > (schema)>), error)
DELETE/projects/{project\_id}/users/{user\_id}/roles/{role\_id}