List organization roles | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Admin](/api/reference/go/resources/admin)
[Organization](/api/reference/go/resources/admin/subresources/organization)
[Roles](/api/reference/go/resources/admin/subresources/organization/subresources/roles)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List organization roles
client.Admin.Organization.Roles.List(ctx, query) (\*CursorPage[[Role](</api/reference/go/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>)], error)
GET/organization/roles
Lists the roles configured for the organization.
##### ParametersExpand Collapse
query AdminOrganizationRoleListParams
After param.Field[string]Optional
Cursor for pagination. Provide the value from the previous response’s `next` field to continue listing roles.
[](<#(resource) admin.organization.roles > (method) list > (params) default > (param) after>)
Limit param.Field[int64]Optional
A limit on the number of roles to return. Defaults to 1000.
minimum0
maximum1000
[](<#(resource) admin.organization.roles > (method) list > (params) default > (param) limit>)
Order param.Field[[AdminOrganizationRoleListParamsOrder](</api/reference/go/resources/admin/subresources/organization/subresources/roles/methods/list#(resource) admin.organization.roles > (method) list > (params) default > (param) order > (schema)>)]Optional
Sort order for the returned roles.
const AdminOrganizationRoleListParamsOrderAsc [AdminOrganizationRoleListParamsOrder](</api/reference/go/resources/admin/subresources/organization/subresources/roles/methods/list#(resource) admin.organization.roles > (method) list > (params) default > (param) order > (schema)>) = "asc"
[](<#(resource) admin.organization.roles > (method) list > (params) default > (param) order > (schema) > (member) 0>)
const AdminOrganizationRoleListParamsOrderDesc [AdminOrganizationRoleListParamsOrder](</api/reference/go/resources/admin/subresources/organization/subresources/roles/methods/list#(resource) admin.organization.roles > (method) list > (params) default > (param) order > (schema)>) = "desc"
[](<#(resource) admin.organization.roles > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) admin.organization.roles > (method) list > (params) default > (param) order>)
[](<#(resource) admin.organization.roles > (method) list > (params) default>)
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
### List organization roles
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
page, err := client.Admin.Organization.Roles.List(context.TODO(), openai.AdminOrganizationRoleListParams{
})
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
],
"has\_more": false,
"next": null
}
`
```