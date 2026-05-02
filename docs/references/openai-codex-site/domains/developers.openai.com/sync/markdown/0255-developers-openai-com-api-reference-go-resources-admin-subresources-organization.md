Create project | OpenAI API Reference
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
# Create project
client.Admin.Organization.Projects.New(ctx, body) (\*[Project](</api/reference/go/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>), error)
POST/organization/projects
Create a new project in the organization. Projects can be created and archived, but cannot be deleted.
##### ParametersExpand Collapse
body AdminOrganizationProjectNewParams
Name param.Field[string]
The friendly name of the project, this name appears in reports.
[](<#(resource) admin.organization.projects > (method) create > (params) default > (param) name>)
Geography param.Field[[AdminOrganizationProjectNewParamsGeography](</api/reference/go/resources/admin/subresources/organization/subresources/projects/methods/create#(resource) admin.organization.projects > (method) create > (params) default > (param) geography > (schema)>)]Optional
Create the project with the specified data residency region. Your organization must have access to Data residency functionality in order to use. See [data residency controls](https://platform.openai.com/docs/guides/your-data#data-residency-controls) to review the functionality and limitations of setting this field.
const AdminOrganizationProjectNewParamsGeographyUs [AdminOrganizationProjectNewParamsGeography](</api/reference/go/resources/admin/subresources/organization/subresources/projects/methods/create#(resource) admin.organization.projects > (method) create > (params) default > (param) geography > (schema)>) = "US"
[](<#(resource) admin.organization.projects > (method) create > (params) default > (param) geography > (schema) > (member) 0>)
const AdminOrganizationProjectNewParamsGeographyEu [AdminOrganizationProjectNewParamsGeography](</api/reference/go/resources/admin/subresources/organization/subresources/projects/methods/create#(resource) admin.organization.projects > (method) create > (params) default > (param) geography > (schema)>) = "EU"
[](<#(resource) admin.organization.projects > (method) create > (params) default > (param) geography > (schema) > (member) 1>)
const AdminOrganizationProjectNewParamsGeographyJp [AdminOrganizationProjectNewParamsGeography](</api/reference/go/resources/admin/subresources/organization/subresources/projects/methods/create#(resource) admin.organization.projects > (method) create > (params) default > (param) geography > (schema)>) = "JP"
[](<#(resource) admin.organization.projects > (method) create > (params) default > (param) geography > (schema) > (member) 2>)
const AdminOrganizationProjectNewParamsGeographyIn [AdminOrganizationProjectNewParamsGeography](</api/reference/go/resources/admin/subresources/organization/subresources/projects/methods/create#(resource) admin.organization.projects > (method) create > (params) default > (param) geography > (schema)>) = "IN"
[](<#(resource) admin.organization.projects > (method) create > (params) default > (param) geography > (schema) > (member) 3>)
const AdminOrganizationProjectNewParamsGeographyKr [AdminOrganizationProjectNewParamsGeography](</api/reference/go/resources/admin/subresources/organization/subresources/projects/methods/create#(resource) admin.organization.projects > (method) create > (params) default > (param) geography > (schema)>) = "KR"
[](<#(resource) admin.organization.projects > (method) create > (params) default > (param) geography > (schema) > (member) 4>)
const AdminOrganizationProjectNewParamsGeographyCa [AdminOrganizationProjectNewParamsGeography](</api/reference/go/resources/admin/subresources/organization/subresources/projects/methods/create#(resource) admin.organization.projects > (method) create > (params) default > (param) geography > (schema)>) = "CA"
[](<#(resource) admin.organization.projects > (method) create > (params) default > (param) geography > (schema) > (member) 5>)
const AdminOrganizationProjectNewParamsGeographyAu [AdminOrganizationProjectNewParamsGeography](</api/reference/go/resources/admin/subresources/organization/subresources/projects/methods/create#(resource) admin.organization.projects > (method) create > (params) default > (param) geography > (schema)>) = "AU"
[](<#(resource) admin.organization.projects > (method) create > (params) default > (param) geography > (schema) > (member) 6>)
const AdminOrganizationProjectNewParamsGeographySg [AdminOrganizationProjectNewParamsGeography](</api/reference/go/resources/admin/subresources/organization/subresources/projects/methods/create#(resource) admin.organization.projects > (method) create > (params) default > (param) geography > (schema)>) = "SG"
[](<#(resource) admin.organization.projects > (method) create > (params) default > (param) geography > (schema) > (member) 7>)
[](<#(resource) admin.organization.projects > (method) create > (params) default > (param) geography>)
[](<#(resource) admin.organization.projects > (method) create > (params) default>)
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
### Create project
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
project, err := client.Admin.Organization.Projects.New(context.TODO(), openai.AdminOrganizationProjectNewParams{
Name: "name",
})
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", project.ID)
}
`
```
```
`{
"id": "proj\_abc",
"object": "organization.project",
"name": "Project ABC",
"created\_at": 1711471533,
"archived\_at": null,
"status": "active"
}
`
```
##### Returns Examples
```
`{
"id": "proj\_abc",
"object": "organization.project",
"name": "Project ABC",
"created\_at": 1711471533,
"archived\_at": null,
"status": "active"
}
`
```