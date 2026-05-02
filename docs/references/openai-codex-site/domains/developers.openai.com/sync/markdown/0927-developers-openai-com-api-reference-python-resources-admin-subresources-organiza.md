List projects | OpenAI API Reference
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
# List projects
admin.organization.projects.list(ProjectListParams\*\*kwargs) -\> SyncConversationCursorPage[[Project](</api/reference/python/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>)]
GET/organization/projects
Returns a list of projects.
##### ParametersExpand Collapse
after: Optional[str]
A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj\_foo, your subsequent call can include after=obj\_foo in order to fetch the next page of the list.
[](<#(resource) admin.organization.projects > (method) list > (params) default > (param) after > (schema)>)
include\_archived: Optional[[bool](</api/reference/python/resources/admin/subresources/organization/subresources/projects/methods/list#(resource) admin.organization.projects > (method) list > (params) default > (param) include_archived > (schema)>)]
If `true` returns all projects including those that have been `archived`. Archived projects are not included by default.
[](<#(resource) admin.organization.projects > (method) list > (params) default > (param) include_archived > (schema)>)
limit: Optional[int]
A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
[](<#(resource) admin.organization.projects > (method) list > (params) default > (param) limit > (schema)>)
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
### List projects
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
page = client.admin.organization.projects.list()
page = page.data[0]
print(page.id)`
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