Archive project | OpenAI API Reference
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
# Archive project
admin.organization.projects.archive(project\_id) -\> [Project](</api/reference/ruby/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>) { id, created\_at, name, 3 more }
POST/organization/projects/{project\_id}/archive
Archives a project in the organization. Archived projects cannot be used or updated.
##### ParametersExpand Collapse
project\_id: String
[](<#(resource) admin.organization.projects > (method) archive > (params) default > (param) project_id > (schema)>)
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
### Archive project
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
project = openai.admin.organization.projects.archive("project\_id")
puts(project)`
```
```
`{
"id": "proj\_abc",
"object": "organization.project",
"name": "Project DEF",
"created\_at": 1711471533,
"archived\_at": 1711471533,
"status": "archived"
}
`
```
##### Returns Examples
```
`{
"id": "proj\_abc",
"object": "organization.project",
"name": "Project DEF",
"created\_at": 1711471533,
"archived\_at": 1711471533,
"status": "archived"
}
`
```