Assign project role to group | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Admin](/api/reference/go/resources/admin)
[Organization](/api/reference/go/resources/admin/subresources/organization)
[Projects](/api/reference/go/resources/admin/subresources/organization/subresources/projects)
[Groups](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/groups)
[Roles](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/groups/subresources/roles)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Assign project role to group
client.Admin.Organization.Projects.Groups.Roles.New(ctx, projectID, groupID, body) (\*[AdminOrganizationProjectGroupRoleNewResponse](</api/reference/go/resources/admin#(resource) admin.organization.projects.groups.roles > (model) AdminOrganizationProjectGroupRoleNewResponse > (schema)>), error)
POST/projects/{project\_id}/groups/{group\_id}/roles
Assigns a project role to a group within a project.
##### ParametersExpand Collapse
projectID string
[](<#(resource) admin.organization.projects.groups.roles > (method) create > (params) default > (param) project_id > (schema)>)
groupID string
[](<#(resource) admin.organization.projects.groups.roles > (method) create > (params) default > (param) group_id > (schema)>)
body AdminOrganizationProjectGroupRoleNewParams
RoleID param.Field[string]
Identifier of the role to assign.
[](<#(resource) admin.organization.projects.groups.roles > (method) create > (params) default > (param) role_id>)
[](<#(resource) admin.organization.projects.groups.roles > (method) create > (params) default>)
##### ReturnsExpand Collapse
type AdminOrganizationProjectGroupRoleNewResponse struct{…}
Role assignment linking a group to a role.
Group AdminOrganizationProjectGroupRoleNewResponseGroup
Summary information about a group returned in role assignment responses.
ID string
Identifier for the group.
[](<#(resource) admin.organization.projects.groups.roles > (model) AdminOrganizationProjectGroupRoleNewResponse > (schema) > (property) group > (property) id>)
CreatedAt int64
Unix timestamp (in seconds) when the group was created.
formatunixtime
[](<#(resource) admin.organization.projects.groups.roles > (model) AdminOrganizationProjectGroupRoleNewResponse > (schema) > (property) group > (property) created_at>)
Name string
Display name of the group.
[](<#(resource) admin.organization.projects.groups.roles > (model) AdminOrganizationProjectGroupRoleNewResponse > (schema) > (property) group > (property) name>)
Object Group
Always `group`.
[](<#(resource) admin.organization.projects.groups.roles > (model) AdminOrganizationProjectGroupRoleNewResponse > (schema) > (property) group > (property) object>)
ScimManaged bool
Whether the group is managed through SCIM.
[](<#(resource) admin.organization.projects.groups.roles > (model) AdminOrganizationProjectGroupRoleNewResponse > (schema) > (property) group > (property) scim_managed>)
[](<#(resource) admin.organization.projects.groups.roles > (model) AdminOrganizationProjectGroupRoleNewResponse > (schema) > (property) group>)
Object GroupRole
Always `group.role`.
[](<#(resource) admin.organization.projects.groups.roles > (model) AdminOrganizationProjectGroupRoleNewResponse > (schema) > (property) object>)
Role [Role](</api/reference/go/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>)
Details about a role that can be assigned through the public Roles API.
ID string
Identifier for the role.
[](<#(resource) admin.organization.projects.groups.roles > (model) AdminOrganizationProjectGroupRoleNewResponse > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) id>)
Description string
Optional description of the role.
[](<#(resource) admin.organization.projects.groups.roles > (model) AdminOrganizationProjectGroupRoleNewResponse > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) description>)
Name string
Unique name for the role.
[](<#(resource) admin.organization.projects.groups.roles > (model) AdminOrganizationProjectGroupRoleNewResponse > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) name>)
Object Role
Always `role`.
[](<#(resource) admin.organization.projects.groups.roles > (model) AdminOrganizationProjectGroupRoleNewResponse > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) object>)
Permissions []string
Permissions granted by the role.
[](<#(resource) admin.organization.projects.groups.roles > (model) AdminOrganizationProjectGroupRoleNewResponse > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) permissions>)
PredefinedRole bool
Whether the role is predefined and managed by OpenAI.
[](<#(resource) admin.organization.projects.groups.roles > (model) AdminOrganizationProjectGroupRoleNewResponse > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) predefined_role>)
ResourceType string
Resource type the role is bound to (for example `api.organization` or `api.project`).
[](<#(resource) admin.organization.projects.groups.roles > (model) AdminOrganizationProjectGroupRoleNewResponse > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) resource_type>)
[](<#(resource) admin.organization.projects.groups.roles > (model) AdminOrganizationProjectGroupRoleNewResponse > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.groups.roles > (model) AdminOrganizationProjectGroupRoleNewResponse > (schema)>)
### Assign project role to group
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
role, err := client.Admin.Organization.Projects.Groups.Roles.New(
context.TODO(),
"project\_id",
"group\_id",
openai.AdminOrganizationProjectGroupRoleNewParams{
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
}
`
```