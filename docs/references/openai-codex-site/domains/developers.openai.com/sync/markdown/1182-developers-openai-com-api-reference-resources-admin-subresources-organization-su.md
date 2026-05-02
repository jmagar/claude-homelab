Create project | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Admin](/api/reference/resources/admin)
[Organization](/api/reference/resources/admin/subresources/organization)
[Projects](/api/reference/resources/admin/subresources/organization/subresources/projects)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create project
POST/organization/projects
Create a new project in the organization. Projects can be created and archived, but cannot be deleted.
##### Body ParametersJSONExpand Collapse
name: string
The friendly name of the project, this name appears in reports.
[](<#(resource) admin.organization.projects > (method) create > (params) 0 > (param) name > (schema)>)
geography: optional "US" or "EU" or "JP" or 5 more
Create the project with the specified data residency region. Your organization must have access to Data residency functionality in order to use. See [data residency controls](/docs/guides/your-data#data-residency-controls) to review the functionality and limitations of setting this field.
One of the following:
"US"
[](<#(resource) admin.organization.projects > (method) create > (params) 0 > (param) geography > (schema) > (member) 0>)
"EU"
[](<#(resource) admin.organization.projects > (method) create > (params) 0 > (param) geography > (schema) > (member) 1>)
"JP"
[](<#(resource) admin.organization.projects > (method) create > (params) 0 > (param) geography > (schema) > (member) 2>)
"IN"
[](<#(resource) admin.organization.projects > (method) create > (params) 0 > (param) geography > (schema) > (member) 3>)
"KR"
[](<#(resource) admin.organization.projects > (method) create > (params) 0 > (param) geography > (schema) > (member) 4>)
"CA"
[](<#(resource) admin.organization.projects > (method) create > (params) 0 > (param) geography > (schema) > (member) 5>)
"AU"
[](<#(resource) admin.organization.projects > (method) create > (params) 0 > (param) geography > (schema) > (member) 6>)
"SG"
[](<#(resource) admin.organization.projects > (method) create > (params) 0 > (param) geography > (schema) > (member) 7>)
[](<#(resource) admin.organization.projects > (method) create > (params) 0 > (param) geography > (schema)>)
##### ReturnsExpand Collapse
Project object { id, created\_at, name, 3 more }
Represents an individual project.
id: string
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) id>)
created\_at: number
The Unix timestamp (in seconds) of when the project was created.
formatunixtime
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) created_at>)
name: string
The name of the project. This appears in reporting.
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) name>)
object: "organization.project"
The object type, which is always `organization.project`
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) object>)
status: "active" or "archived"
`active` or `archived`
One of the following:
"active"
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) status > (member) 0>)
"archived"
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) status > (member) 1>)
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) status>)
archived\_at: optional number
The Unix timestamp (in seconds) of when the project was archived or `null`.
formatunixtime
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) archived_at>)
[](<#(resource) admin.organization.projects > (model) project > (schema)>)
### Create project
HTTP
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
`curl -X POST https://api.openai.com/v1/organization/projects \\
-H "Authorization: Bearer $OPENAI\_ADMIN\_KEY" \\
-H "Content-Type: application/json" \\
-d '{
"name": "Project ABC"
}'
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