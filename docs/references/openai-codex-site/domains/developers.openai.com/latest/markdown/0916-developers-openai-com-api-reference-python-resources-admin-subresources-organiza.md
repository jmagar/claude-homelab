Archive project | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Admin](/api/reference/python/resources/admin)
[Organization](/api/reference/python/resources/admin/subresources/organization)
[Projects](/api/reference/python/resources/admin/subresources/organization/subresources/projects)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Archive project
admin.organization.projects.archive(strproject\_id) -\> [Project](</api/reference/python/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>)
POST/organization/projects/{project\_id}/archive
Archives a project in the organization. Archived projects cannot be used or updated.
##### ParametersExpand Collapse
project\_id: str
[](<#(resource) admin.organization.projects > (method) archive > (params) default > (param) project_id > (schema)>)
##### ReturnsExpand Collapse
class Project: …
Represents an individual project.
id: str
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) id>)
created\_at: int
The Unix timestamp (in seconds) of when the project was created.
formatunixtime
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) created_at>)
name: str
The name of the project. This appears in reporting.
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) name>)
object: Literal["organization.project"]
The object type, which is always `organization.project`
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) object>)
status: Literal["active", "archived"]
`active` or `archived`
One of the following:
"active"
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) status > (member) 0>)
"archived"
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) status > (member) 1>)
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) status>)
archived\_at: Optional[int]
The Unix timestamp (in seconds) of when the project was archived or `null`.
formatunixtime
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) archived_at>)
[](<#(resource) admin.organization.projects > (model) project > (schema)>)
### Archive project
Python
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
`import os
from openai import OpenAI
client = OpenAI(
admin\_api\_key=os.environ.get("OPENAI\_ADMIN\_KEY"), # This is the default and can be omitted
)
project = client.admin.organization.projects.archive(
"project\_id",
)
print(project.id)`
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