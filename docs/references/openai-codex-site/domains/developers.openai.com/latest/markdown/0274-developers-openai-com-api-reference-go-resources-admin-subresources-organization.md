List project user role assignments | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Admin](/api/reference/go/resources/admin)
[Organization](/api/reference/go/resources/admin/subresources/organization)
[Projects](/api/reference/go/resources/admin/subresources/organization/subresources/projects)
[Users](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/users)
[Roles](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/users/subresources/roles)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List project user role assignments
client.Admin.Organization.Projects.Users.Roles.List(ctx, projectID, userID, query) (\*CursorPage[[AdminOrganizationProjectUserRoleListResponse](</api/reference/go/resources/admin#(resource) admin.organization.projects.users.roles > (model) AdminOrganizationProjectUserRoleListResponse > (schema)>)], error)
GET/projects/{project\_id}/users/{user\_id}/roles
Lists the project roles assigned to a user within a project.
##### ParametersExpand Collapse
projectID string
[](<#(resource) admin.organization.projects.users.roles > (method) list > (params) default > (param) project_id > (schema)>)
userID string
[](<#(resource) admin.organization.projects.users.roles > (method) list > (params) default > (param) user_id > (schema)>)
query AdminOrganizationProjectUserRoleListParams
After param.Field[string]Optional
Cursor for pagination. Provide the value from the previous response’s `next` field to continue listing project roles.
[](<#(resource) admin.organization.projects.users.roles > (method) list > (params) default > (param) after>)
Limit param.Field[int64]Optional
A limit on the number of project role assignments to return.
minimum0
maximum1000
[](<#(resource) admin.organization.projects.users.roles > (method) list > (params) default > (param) limit>)
Order param.Field[[AdminOrganizationProjectUserRoleListParamsOrder](</api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/users/subresources/roles/methods/list#(resource) admin.organization.projects.users.roles > (method) list > (params) default > (param) order > (schema)>)]Optional
Sort order for the returned project roles.
const AdminOrganizationProjectUserRoleListParamsOrderAsc [AdminOrganizationProjectUserRoleListParamsOrder](</api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/users/subresources/roles/methods/list#(resource) admin.organization.projects.users.roles > (method) list > (params) default > (param) order > (schema)>) = "asc"
[](<#(resource) admin.organization.projects.users.roles > (method) list > (params) default > (param) order > (schema) > (member) 0>)
const AdminOrganizationProjectUserRoleListParamsOrderDesc [AdminOrganizationProjectUserRoleListParamsOrder](</api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/users/subresources/roles/methods/list#(resource) admin.organization.projects.users.roles > (method) list > (params) default > (param) order > (schema)>) = "desc"
[](<#(resource) admin.organization.projects.users.roles > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) admin.organization.projects.users.roles > (method) list > (params) default > (param) order>)
[](<#(resource) admin.organization.projects.users.roles > (method) list > (params) default>)
##### ReturnsExpand Collapse
type AdminOrganizationProjectUserRoleListResponse struct{…}
Detailed information about a role assignment entry returned when listing assignments.
ID string
Identifier for the role.
[](<#(resource) admin.organization.projects.users.roles > (model) AdminOrganizationProjectUserRoleListResponse > (schema) > (property) id>)
CreatedAt int64
When the role was created.
formatunixtime
[](<#(resource) admin.organization.projects.users.roles > (model) AdminOrganizationProjectUserRoleListResponse > (schema) > (property) created_at>)
CreatedBy string
Identifier of the actor who created the role.
[](<#(resource) admin.organization.projects.users.roles > (model) AdminOrganizationProjectUserRoleListResponse > (schema) > (property) created_by>)
CreatedByUserObj map[string, any]
User details for the actor that created the role, when available.
[](<#(resource) admin.organization.projects.users.roles > (model) AdminOrganizationProjectUserRoleListResponse > (schema) > (property) created_by_user_obj>)
Description string
Description of the role.
[](<#(resource) admin.organization.projects.users.roles > (model) AdminOrganizationProjectUserRoleListResponse > (schema) > (property) description>)
Metadata map[string, any]
Arbitrary metadata stored on the role.
[](<#(resource) admin.organization.projects.users.roles > (model) AdminOrganizationProjectUserRoleListResponse > (schema) > (property) metadata>)
Name string
Name of the role.
[](<#(resource) admin.organization.projects.users.roles > (model) AdminOrganizationProjectUserRoleListResponse > (schema) > (property) name>)
Permissions []string
Permissions associated with the role.
[](<#(resource) admin.organization.projects.users.roles > (model) AdminOrganizationProjectUserRoleListResponse > (schema) > (property) permissions>)
PredefinedRole bool
Whether the role is predefined by OpenAI.
[](<#(resource) admin.organization.projects.users.roles > (model) AdminOrganizationProjectUserRoleListResponse > (schema) > (property) predefined_role>)
ResourceType string
Resource type the role applies to.
[](<#(resource) admin.organization.projects.users.roles > (model) AdminOrganizationProjectUserRoleListResponse > (schema) > (property) resource_type>)
UpdatedAt int64
When the role was last updated.
formatint64
[](<#(resource) admin.organization.projects.users.roles > (model) AdminOrganizationProjectUserRoleListResponse > (schema) > (property) updated_at>)
[](<#(resource) admin.organization.projects.users.roles > (model) AdminOrganizationProjectUserRoleListResponse > (schema)>)
### List project user role assignments
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
page, err := client.Admin.Organization.Projects.Users.Roles.List(
context.TODO(),
"project\_id",
"user\_id",
openai.AdminOrganizationProjectUserRoleListParams{
},
)
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", page)
}
`
```
```
`{
"object": "list",
"data": [
{
"id": "role\_01J1F8PROJ",
"name": "API Project Key Manager",
"permissions": [
"api.organization.projects.api\_keys.read",
"api.organization.projects.api\_keys.write"
],
"resource\_type": "api.project",
"predefined\_role": false,
"description": "Allows managing API keys for the project",
"created\_at": 1711471533,
"updated\_at": 1711472599,
"created\_by": "user\_abc123",
"created\_by\_user\_obj": {
"id": "user\_abc123",
"name": "Ada Lovelace",
"email": "ada@example.com"
},
"metadata": {}
}
],
"has\_more": false,
"next": null
}
`
```
##### Returns Examples
```
`{
"object": "list",
"data": [
{
"id": "role\_01J1F8PROJ",
"name": "API Project Key Manager",
"permissions": [
"api.organization.projects.api\_keys.read",
"api.organization.projects.api\_keys.write"
],
"resource\_type": "api.project",
"predefined\_role": false,
"description": "Allows managing API keys for the project",
"created\_at": 1711471533,
"updated\_at": 1711472599,
"created\_by": "user\_abc123",
"created\_by\_user\_obj": {
"id": "user\_abc123",
"name": "Ada Lovelace",
"email": "ada@example.com"
},
"metadata": {}
}
],
"has\_more": false,
"next": null
}
`
```