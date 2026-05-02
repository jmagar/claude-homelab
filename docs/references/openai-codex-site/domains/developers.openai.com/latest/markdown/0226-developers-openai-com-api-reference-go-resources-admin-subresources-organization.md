Assign organization role to group | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Admin](/api/reference/go/resources/admin)
[Organization](/api/reference/go/resources/admin/subresources/organization)
[Groups](/api/reference/go/resources/admin/subresources/organization/subresources/groups)
[Roles](/api/reference/go/resources/admin/subresources/organization/subresources/groups/subresources/roles)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Assign organization role to group
client.Admin.Organization.Groups.Roles.New(ctx, groupID, body) (\*[AdminOrganizationGroupRoleNewResponse](</api/reference/go/resources/admin#(resource) admin.organization.groups.roles > (model) AdminOrganizationGroupRoleNewResponse > (schema)>), error)
POST/organization/groups/{group\_id}/roles
Assigns an organization role to a group within the organization.
##### ParametersExpand Collapse
groupID string
[](<#(resource) admin.organization.groups.roles > (method) create > (params) default > (param) group_id > (schema)>)
body AdminOrganizationGroupRoleNewParams
RoleID param.Field[string]
Identifier of the role to assign.
[](<#(resource) admin.organization.groups.roles > (method) create > (params) default > (param) role_id>)
[](<#(resource) admin.organization.groups.roles > (method) create > (params) default>)
##### ReturnsExpand Collapse
type AdminOrganizationGroupRoleNewResponse struct{…}
Role assignment linking a group to a role.
Group AdminOrganizationGroupRoleNewResponseGroup
Summary information about a group returned in role assignment responses.
ID string
Identifier for the group.
[](<#(resource) admin.organization.groups.roles > (model) AdminOrganizationGroupRoleNewResponse > (schema) > (property) group > (property) id>)
CreatedAt int64
Unix timestamp (in seconds) when the group was created.
formatunixtime
[](<#(resource) admin.organization.groups.roles > (model) AdminOrganizationGroupRoleNewResponse > (schema) > (property) group > (property) created_at>)
Name string
Display name of the group.
[](<#(resource) admin.organization.groups.roles > (model) AdminOrganizationGroupRoleNewResponse > (schema) > (property) group > (property) name>)
Object Group
Always `group`.
[](<#(resource) admin.organization.groups.roles > (model) AdminOrganizationGroupRoleNewResponse > (schema) > (property) group > (property) object>)
ScimManaged bool
Whether the group is managed through SCIM.
[](<#(resource) admin.organization.groups.roles > (model) AdminOrganizationGroupRoleNewResponse > (schema) > (property) group > (property) scim_managed>)
[](<#(resource) admin.organization.groups.roles > (model) AdminOrganizationGroupRoleNewResponse > (schema) > (property) group>)
Object GroupRole
Always `group.role`.
[](<#(resource) admin.organization.groups.roles > (model) AdminOrganizationGroupRoleNewResponse > (schema) > (property) object>)
Role [Role](</api/reference/go/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>)
Details about a role that can be assigned through the public Roles API.
ID string
Identifier for the role.
[](<#(resource) admin.organization.groups.roles > (model) AdminOrganizationGroupRoleNewResponse > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) id>)
Description string
Optional description of the role.
[](<#(resource) admin.organization.groups.roles > (model) AdminOrganizationGroupRoleNewResponse > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) description>)
Name string
Unique name for the role.
[](<#(resource) admin.organization.groups.roles > (model) AdminOrganizationGroupRoleNewResponse > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) name>)
Object Role
Always `role`.
[](<#(resource) admin.organization.groups.roles > (model) AdminOrganizationGroupRoleNewResponse > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) object>)
Permissions []string
Permissions granted by the role.
[](<#(resource) admin.organization.groups.roles > (model) AdminOrganizationGroupRoleNewResponse > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) permissions>)
PredefinedRole bool
Whether the role is predefined and managed by OpenAI.
[](<#(resource) admin.organization.groups.roles > (model) AdminOrganizationGroupRoleNewResponse > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) predefined_role>)
ResourceType string
Resource type the role is bound to (for example `api.organization` or `api.project`).
[](<#(resource) admin.organization.groups.roles > (model) AdminOrganizationGroupRoleNewResponse > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) resource_type>)
[](<#(resource) admin.organization.groups.roles > (model) AdminOrganizationGroupRoleNewResponse > (schema) > (property) role>)
[](<#(resource) admin.organization.groups.roles > (model) AdminOrganizationGroupRoleNewResponse > (schema)>)
### Assign organization role to group
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
role, err := client.Admin.Organization.Groups.Roles.New(
context.TODO(),
"group\_id",
openai.AdminOrganizationGroupRoleNewParams{
RoleID: "role\_id",
},
)
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", role.Group)
}
`
```
```
`{
"object": "group.role",
"group": {
"object": "group",
"id": "group\_01J1F8ABCDXYZ",
"name": "Support Team",
"created\_at": 1711471533,
"scim\_managed": false
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
"object": "group.role",
"group": {
"object": "group",
"id": "group\_01J1F8ABCDXYZ",
"name": "Support Team",
"created\_at": 1711471533,
"scim\_managed": false
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