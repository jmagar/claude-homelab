Modify project | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Admin](/api/reference/ruby/resources/admin)
[Organization](/api/reference/ruby/resources/admin/subresources/organization)
[Projects](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Modify project
admin.organization.projects.update(project\_id, \*\*kwargs) -\> [Project](</api/reference/ruby/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>) { id, created\_at, name, 3 more }
POST/organization/projects/{project\_id}
Modifies a project in the organization.
##### ParametersExpand Collapse
project\_id: String
[](<#(resource) admin.organization.projects > (method) update > (params) default > (param) project_id > (schema)>)
name: String
The updated name of the project, this name appears in reports.
[](<#(resource) admin.organization.projects > (method) update > (params) default > (param) name > (schema)>)
##### ReturnsExpand Collapse
class Project { id, created\_at, name, 3 more }
Represents an individual project.
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) id>)
created\_at: Integer
The Unix timestamp (in seconds) of when the project was created.
formatunixtime
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) created_at>)
name: String
The name of the project. This appears in reporting.
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) name>)
object: :"organization.project"
The object type, which is always `organization.project`
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) object>)
status: :active | :archived
`active` or `archived`
One of the following:
:active
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) status > (member) 0>)
:archived
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) status > (member) 1>)
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) status>)
archived\_at: Integer
The Unix timestamp (in seconds) of when the project was archived or `null`.
formatunixtime
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) archived_at>)
[](<#(resource) admin.organization.projects > (model) project > (schema)>)
### Modify project
Ruby
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
`require "openai"
openai = OpenAI::Client.new(admin\_api\_key: "My Admin API Key")
project = openai.admin.organization.projects.update("project\_id", name: "name")
puts(project)`
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