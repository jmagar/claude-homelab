List project roles | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Admin](/api/reference/go/resources/admin)
[Organization](/api/reference/go/resources/admin/subresources/organization)
[Projects](/api/reference/go/resources/admin/subresources/organization/subresources/projects)
[Roles](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/roles)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List project roles
client.Admin.Organization.Projects.Roles.List(ctx, projectID, query) (\*CursorPage[[Role](</api/reference/go/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>)], error)
GET/projects/{project\_id}/roles
Lists the roles configured for a project.
##### ParametersExpand Collapse
projectID string
[](<#(resource) admin.organization.projects.roles > (method) list > (params) default > (param) project_id > (schema)>)
query AdminOrganizationProjectRoleListParams
After param.Field[string]Optional
Cursor for pagination. Provide the value from the previous response’s `next` field to continue listing roles.
[](<#(resource) admin.organization.projects.roles > (method) list > (params) default > (param) after>)
Limit param.Field[int64]Optional
A limit on the number of roles to return. Defaults to 1000.
minimum0
maximum1000
[](<#(resource) admin.organization.projects.roles > (method) list > (params) default > (param) limit>)
Order param.Field[[AdminOrganizationProjectRoleListParamsOrder](</api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/list#(resource) admin.organization.projects.roles > (method) list > (params) default > (param) order > (schema)>)]Optional
Sort order for the returned roles.
const AdminOrganizationProjectRoleListParamsOrderAsc [AdminOrganizationProjectRoleListParamsOrder](</api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/list#(resource) admin.organization.projects.roles > (method) list > (params) default > (param) order > (schema)>) = "asc"
[](<#(resource) admin.organization.projects.roles > (method) list > (params) default > (param) order > (schema) > (member) 0>)
const AdminOrganizationProjectRoleListParamsOrderDesc [AdminOrganizationProjectRoleListParamsOrder](</api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/list#(resource) admin.organization.projects.roles > (method) list > (params) default > (param) order > (schema)>) = "desc"
[](<#(resource) admin.organization.projects.roles > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) admin.organization.projects.roles > (method) list > (params) default > (param) order>)
[](<#(resource) admin.organization.projects.roles > (method) list > (params) default>)
##### ReturnsExpand Collapse
type Role struct{…}
Details about a role that can be assigned through the public Roles API.
ID string
Identifier for the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) id>)
Description string
Optional description of the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) description>)
Name string
Unique name for the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) name>)
Object Role
Always `role`.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) object>)
Permissions []string
Permissions granted by the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) permissions>)
PredefinedRole bool
Whether the role is predefined and managed by OpenAI.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) predefined_role>)
ResourceType string
Resource type the role is bound to (for example `api.organization` or `api.project`).
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) resource_type>)
[](<#(resource) admin.organization.roles > (model) role > (schema)>)
### List project roles
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
page, err := client.Admin.Organization.Projects.Roles.List(
context.TODO(),
"project\_id",
openai.AdminOrganizationProjectRoleListParams{
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
"object": "role",
"id": "role\_01J1F8PROJ",
"name": "API Project Key Manager",
"description": "Allows managing API keys for the project",
"permissions": [
"api.organization.projects.api\_keys.read",
"api.organization.projects.api\_keys.write"
],
"resource\_type": "api.project",
"predefined\_role": false
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
"object": "role",
"id": "role\_01J1F8PROJ",
"name": "API Project Key Manager",
"description": "Allows managing API keys for the project",
"permissions": [
"api.organization.projects.api\_keys.read",
"api.organization.projects.api\_keys.write"
],
"resource\_type": "api.project",
"predefined\_role": false
}
],
"has\_more": false,
"next": null
}
`
```