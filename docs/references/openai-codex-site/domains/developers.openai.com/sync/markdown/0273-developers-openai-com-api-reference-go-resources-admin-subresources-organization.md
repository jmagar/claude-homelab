List project groups | OpenAI API Reference
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
# List project groups
client.Admin.Organization.Projects.Groups.List(ctx, projectID, query) (\*CursorPage[[ProjectGroup](</api/reference/go/resources/admin#(resource) admin.organization.projects.groups > (model) project_group > (schema)>)], error)
GET/organization/projects/{project\_id}/groups
Lists the groups that have access to a project.
##### ParametersExpand Collapse
projectID string
[](<#(resource) admin.organization.projects.groups > (method) list > (params) default > (param) project_id > (schema)>)
query AdminOrganizationProjectGroupListParams
After param.Field[string]Optional
Cursor for pagination. Provide the ID of the last group from the previous response to fetch the next page.
[](<#(resource) admin.organization.projects.groups > (method) list > (params) default > (param) after>)
Limit param.Field[int64]Optional
A limit on the number of project groups to return. Defaults to 20.
minimum0
maximum100
[](<#(resource) admin.organization.projects.groups > (method) list > (params) default > (param) limit>)
Order param.Field[[AdminOrganizationProjectGroupListParamsOrder](</api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/groups/methods/list#(resource) admin.organization.projects.groups > (method) list > (params) default > (param) order > (schema)>)]Optional
Sort order for the returned groups.
const AdminOrganizationProjectGroupListParamsOrderAsc [AdminOrganizationProjectGroupListParamsOrder](</api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/groups/methods/list#(resource) admin.organization.projects.groups > (method) list > (params) default > (param) order > (schema)>) = "asc"
[](<#(resource) admin.organization.projects.groups > (method) list > (params) default > (param) order > (schema) > (member) 0>)
const AdminOrganizationProjectGroupListParamsOrderDesc [AdminOrganizationProjectGroupListParamsOrder](</api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/groups/methods/list#(resource) admin.organization.projects.groups > (method) list > (params) default > (param) order > (schema)>) = "desc"
[](<#(resource) admin.organization.projects.groups > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) admin.organization.projects.groups > (method) list > (params) default > (param) order>)
[](<#(resource) admin.organization.projects.groups > (method) list > (params) default>)
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
### List project groups
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
page, err := client.Admin.Organization.Projects.Groups.List(
context.TODO(),
"project\_id",
openai.AdminOrganizationProjectGroupListParams{
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
"object": "project.group",
"project\_id": "proj\_abc123",
"group\_id": "group\_01J1F8ABCDXYZ",
"group\_name": "Support Team",
"created\_at": 1711471533
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
"object": "project.group",
"project\_id": "proj\_abc123",
"group\_id": "group\_01J1F8ABCDXYZ",
"group\_name": "Support Team",
"created\_at": 1711471533
}
],
"has\_more": false,
"next": null
}
`
```