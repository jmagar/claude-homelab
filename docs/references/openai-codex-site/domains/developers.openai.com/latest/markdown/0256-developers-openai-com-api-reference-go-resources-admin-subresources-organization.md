Update organization role | OpenAI API Reference
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
# Update organization role
client.Admin.Organization.Roles.Update(ctx, roleID, body) (\*[Role](</api/reference/go/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>), error)
POST/organization/roles/{role\_id}
Updates an existing organization role.
##### ParametersExpand Collapse
roleID string
[](<#(resource) admin.organization.roles > (method) update > (params) default > (param) role_id > (schema)>)
body AdminOrganizationRoleUpdateParams
Description param.Field[string]Optional
New description for the role.
[](<#(resource) admin.organization.roles > (method) update > (params) default > (param) description>)
Permissions param.Field[[]string]Optional
Updated set of permissions for the role.
[](<#(resource) admin.organization.roles > (method) update > (params) default > (param) permissions>)
RoleName param.Field[string]Optional
New name for the role.
[](<#(resource) admin.organization.roles > (method) update > (params) default > (param) role_name>)
[](<#(resource) admin.organization.roles > (method) update > (params) default>)
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
### Update organization role
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
role, err := client.Admin.Organization.Roles.Update(
context.TODO(),
"role\_id",
openai.AdminOrganizationRoleUpdateParams{
},
)
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", role.ID)
}
`
```
```
`{
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
`
```
##### Returns Examples
```
`{
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
`
```