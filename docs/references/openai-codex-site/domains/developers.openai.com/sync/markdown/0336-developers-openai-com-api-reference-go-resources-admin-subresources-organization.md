Assign organization role to user | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Admin](/api/reference/go/resources/admin)
[Organization](/api/reference/go/resources/admin/subresources/organization)
[Users](/api/reference/go/resources/admin/subresources/organization/subresources/users)
[Roles](/api/reference/go/resources/admin/subresources/organization/subresources/users/subresources/roles)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Assign organization role to user
client.Admin.Organization.Users.Roles.New(ctx, userID, body) (\*[AdminOrganizationUserRoleNewResponse](</api/reference/go/resources/admin#(resource) admin.organization.users.roles > (model) AdminOrganizationUserRoleNewResponse > (schema)>), error)
POST/organization/users/{user\_id}/roles
Assigns an organization role to a user within the organization.
##### ParametersExpand Collapse
userID string
[](<#(resource) admin.organization.users.roles > (method) create > (params) default > (param) user_id > (schema)>)
body AdminOrganizationUserRoleNewParams
RoleID param.Field[string]
Identifier of the role to assign.
[](<#(resource) admin.organization.users.roles > (method) create > (params) default > (param) role_id>)
[](<#(resource) admin.organization.users.roles > (method) create > (params) default>)
##### ReturnsExpand Collapse
type AdminOrganizationUserRoleNewResponse struct{…}
Role assignment linking a user to a role.
Object UserRole
Always `user.role`.
[](<#(resource) admin.organization.users.roles > (model) AdminOrganizationUserRoleNewResponse > (schema) > (property) object>)
Role [Role](</api/reference/go/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>)
Details about a role that can be assigned through the public Roles API.
ID string
Identifier for the role.
[](<#(resource) admin.organization.users.roles > (model) AdminOrganizationUserRoleNewResponse > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) id>)
Description string
Optional description of the role.
[](<#(resource) admin.organization.users.roles > (model) AdminOrganizationUserRoleNewResponse > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) description>)
Name string
Unique name for the role.
[](<#(resource) admin.organization.users.roles > (model) AdminOrganizationUserRoleNewResponse > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) name>)
Object Role
Always `role`.
[](<#(resource) admin.organization.users.roles > (model) AdminOrganizationUserRoleNewResponse > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) object>)
Permissions []string
Permissions granted by the role.
[](<#(resource) admin.organization.users.roles > (model) AdminOrganizationUserRoleNewResponse > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) permissions>)
PredefinedRole bool
Whether the role is predefined and managed by OpenAI.
[](<#(resource) admin.organization.users.roles > (model) AdminOrganizationUserRoleNewResponse > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) predefined_role>)
ResourceType string
Resource type the role is bound to (for example `api.organization` or `api.project`).
[](<#(resource) admin.organization.users.roles > (model) AdminOrganizationUserRoleNewResponse > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) resource_type>)
[](<#(resource) admin.organization.users.roles > (model) AdminOrganizationUserRoleNewResponse > (schema) > (property) role>)
User [OrganizationUser](</api/reference/go/resources/admin#(resource) admin.organization.users > (model) organization_user > (schema)>)
Represents an individual `user` within an organization.
ID string
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.users.roles > (model) AdminOrganizationUserRoleNewResponse > (schema) > (property) user + (resource) admin.organization.users > (model) organization_user > (schema) > (property) id>)
AddedAt int64
The Unix timestamp (in seconds) of when the user was added.
formatunixtime
[](<#(resource) admin.organization.users.roles > (model) AdminOrganizationUserRoleNewResponse > (schema) > (property) user + (resource) admin.organization.users > (model) organization_user > (schema) > (property) added_at>)
Email string
The email address of the user
[](<#(resource) admin.organization.users.roles > (model) AdminOrganizationUserRoleNewResponse > (schema) > (property) user + (resource) admin.organization.users > (model) organization_user > (schema) > (property) email>)
Name string
The name of the user
[](<#(resource) admin.organization.users.roles > (model) AdminOrganizationUserRoleNewResponse > (schema) > (property) user + (resource) admin.organization.users > (model) organization_user > (schema) > (property) name>)
Object OrganizationUser
The object type, which is always `organization.user`
[](<#(resource) admin.organization.users.roles > (model) AdminOrganizationUserRoleNewResponse > (schema) > (property) user + (resource) admin.organization.users > (model) organization_user > (schema) > (property) object>)
Role OrganizationUserRole
`owner` or `reader`
One of the following:
const OrganizationUserRoleOwner OrganizationUserRole = "owner"
[](<#(resource) admin.organization.users.roles > (model) AdminOrganizationUserRoleNewResponse > (schema) > (property) user + (resource) admin.organization.users > (model) organization_user > (schema) > (property) role > (member) 0>)
const OrganizationUserRoleReader OrganizationUserRole = "reader"
[](<#(resource) admin.organization.users.roles > (model) AdminOrganizationUserRoleNewResponse > (schema) > (property) user + (resource) admin.organization.users > (model) organization_user > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.users.roles > (model) AdminOrganizationUserRoleNewResponse > (schema) > (property) user + (resource) admin.organization.users > (model) organization_user > (schema) > (property) role>)
[](<#(resource) admin.organization.users.roles > (model) AdminOrganizationUserRoleNewResponse > (schema) > (property) user>)
[](<#(resource) admin.organization.users.roles > (model) AdminOrganizationUserRoleNewResponse > (schema)>)
### Assign organization role to user
Go
HTTP
HTTP
TypeScript
TypeScript
Python
Python
Java
Java
Go
Go
Ruby
Ruby
Terraform
Terraform
```
`package main
import (
"context"
"fmt"
"github.com/openai/openai-go"
"github.com/openai/openai-go/option"
)
func main() {
client := openai.NewClient(
option.WithAdminAPIKey("My Admin API Key"),
)
role, err := client.Admin.Organization.Users.Roles.New(
context.TODO(),
"user\_id",
openai.AdminOrganizationUserRoleNewParams{
RoleID: "role\_id",
},
)
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", role.Object)
}
`
```
```
`{
"object": "user.role",
"user": {
"object": "organization.user",
"id": "user\_abc123",
"name": "Ada Lovelace",
"email": "ada@example.com",
"role": "owner",
"added\_at": 1711470000
},
"role": {
"object": "role",
"id": "role\_01J1F8ROLE01",
"name": "API Group Manager",
"description": "Allows managing organization groups",
"permissions": [
"api.groups.read",
"api.groups.write"
],
"resource\_type": "api.organization",
"predefined\_role": false
}
}
`
```
##### Returns Examples
```
`{
"object": "user.role",
"user": {
"object": "organization.user",
"id": "user\_abc123",
"name": "Ada Lovelace",
"email": "ada@example.com",
"role": "owner",
"added\_at": 1711470000
},
"role": {
"object": "role",
"id": "role\_01J1F8ROLE01",
"name": "API Group Manager",
"description": "Allows managing organization groups",
"permissions": [
"api.groups.read",
"api.groups.write"
],
"resource\_type": "api.organization",
"predefined\_role": false
}
}
`
```