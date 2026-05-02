Add project group | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Admin](/api/reference/go/resources/admin)
[Organization](/api/reference/go/resources/admin/subresources/organization)
[Projects](/api/reference/go/resources/admin/subresources/organization/subresources/projects)
[Groups](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/groups)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Add project group
client.Admin.Organization.Projects.Groups.New(ctx, projectID, body) (\*[ProjectGroup](</api/reference/go/resources/admin#(resource) admin.organization.projects.groups > (model) project_group > (schema)>), error)
POST/organization/projects/{project\_id}/groups
Grants a group access to a project.
##### ParametersExpand Collapse
projectID string
[](<#(resource) admin.organization.projects.groups > (method) create > (params) default > (param) project_id > (schema)>)
body AdminOrganizationProjectGroupNewParams
GroupID param.Field[string]
Identifier of the group to add to the project.
[](<#(resource) admin.organization.projects.groups > (method) create > (params) default > (param) group_id>)
Role param.Field[string]
Identifier of the project role to grant to the group.
[](<#(resource) admin.organization.projects.groups > (method) create > (params) default > (param) role>)
[](<#(resource) admin.organization.projects.groups > (method) create > (params) default>)
##### ReturnsExpand Collapse
type ProjectGroup struct{…}
Details about a group’s membership in a project.
CreatedAt int64
Unix timestamp (in seconds) when the group was granted project access.
formatunixtime
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) created_at>)
GroupID string
Identifier of the group that has access to the project.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) group_id>)
GroupName string
Display name of the group.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) group_name>)
Object ProjectGroup
Always `project.group`.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) object>)
ProjectID string
Identifier of the project.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) project_id>)
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema)>)
### Add project group
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
projectGroup, err := client.Admin.Organization.Projects.Groups.New(
context.TODO(),
"project\_id",
openai.AdminOrganizationProjectGroupNewParams{
GroupID: "group\_id",
Role: "role",
},
)
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", projectGroup.GroupID)
}
`
```
```
`{
"object": "project.group",
"project\_id": "proj\_abc123",
"group\_id": "group\_01J1F8ABCDXYZ",
"group\_name": "Support Team",
"created\_at": 1711471533
}
`
```
##### Returns Examples
```
`{
"object": "project.group",
"project\_id": "proj\_abc123",
"group\_id": "group\_01J1F8ABCDXYZ",
"group\_name": "Support Team",
"created\_at": 1711471533
}
`
```