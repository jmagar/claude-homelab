Modify project | OpenAI API Reference
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
# Modify project
client.Admin.Organization.Projects.Update(ctx, projectID, body) (\*[Project](</api/reference/go/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>), error)
POST/organization/projects/{project\_id}
Modifies a project in the organization.
##### ParametersExpand Collapse
projectID string
[](<#(resource) admin.organization.projects > (method) update > (params) default > (param) project_id > (schema)>)
body AdminOrganizationProjectUpdateParams
Name param.Field[string]
The updated name of the project, this name appears in reports.
[](<#(resource) admin.organization.projects > (method) update > (params) default > (param) name>)
[](<#(resource) admin.organization.projects > (method) update > (params) default>)
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
### Modify project
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
project, err := client.Admin.Organization.Projects.Update(
context.TODO(),
"project\_id",
openai.AdminOrganizationProjectUpdateParams{
Name: "name",
},
)
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", project.ID)
}
`
```
200 example
```
`{
"id": "id",
"created\_at": 0,
"name": "name",
"object": "organization.project",
"status": "active",
"archived\_at": 0
}`
```
##### Returns Examples
200 example
```
`{
"id": "id",
"created\_at": 0,
"name": "name",
"object": "organization.project",
"status": "active",
"archived\_at": 0
}`
```