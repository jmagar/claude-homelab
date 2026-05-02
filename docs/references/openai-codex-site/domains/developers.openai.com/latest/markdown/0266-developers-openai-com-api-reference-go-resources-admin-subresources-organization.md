List projects | OpenAI API Reference
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
# List projects
client.Admin.Organization.Projects.List(ctx, query) (\*ConversationCursorPage[[Project](</api/reference/go/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>)], error)
GET/organization/projects
Returns a list of projects.
##### ParametersExpand Collapse
query AdminOrganizationProjectListParams
After param.Field[string]Optional
A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj\_foo, your subsequent call can include after=obj\_foo in order to fetch the next page of the list.
[](<#(resource) admin.organization.projects > (method) list > (params) default > (param) after>)
IncludeArchived param.Field[bool]Optional
If `true` returns all projects including those that have been `archived`. Archived projects are not included by default.
[](<#(resource) admin.organization.projects > (method) list > (params) default > (param) include_archived>)
Limit param.Field[int64]Optional
A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
[](<#(resource) admin.organization.projects > (method) list > (params) default > (param) limit>)
[](<#(resource) admin.organization.projects > (method) list > (params) default>)
##### ReturnsExpand Collapse
type Project struct{…}
Represents an individual project.
ID string
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) id>)
CreatedAt int64
The Unix timestamp (in seconds) of when the project was created.
formatunixtime
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) created_at>)
Name string
The name of the project. This appears in reporting.
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) name>)
Object OrganizationProject
The object type, which is always `organization.project`
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) object>)
Status ProjectStatus
`active` or `archived`
One of the following:
const ProjectStatusActive ProjectStatus = "active"
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) status > (member) 0>)
const ProjectStatusArchived ProjectStatus = "archived"
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) status > (member) 1>)
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) status>)
ArchivedAt int64Optional
The Unix timestamp (in seconds) of when the project was archived or `null`.
formatunixtime
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) archived_at>)
[](<#(resource) admin.organization.projects > (model) project > (schema)>)
### List projects
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
page, err := client.Admin.Organization.Projects.List(context.TODO(), openai.AdminOrganizationProjectListParams{
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
"id": "proj\_abc",
"object": "organization.project",
"name": "Project example",
"created\_at": 1711471533,
"archived\_at": null,
"status": "active"
}
],
"first\_id": "proj-abc",
"last\_id": "proj-xyz",
"has\_more": false
}
`
```
##### Returns Examples
```
`{
"object": "list",
"data": [
{
"id": "proj\_abc",
"object": "organization.project",
"name": "Project example",
"created\_at": 1711471533,
"archived\_at": null,
"status": "active"
}
],
"first\_id": "proj-abc",
"last\_id": "proj-xyz",
"has\_more": false
}
`
```