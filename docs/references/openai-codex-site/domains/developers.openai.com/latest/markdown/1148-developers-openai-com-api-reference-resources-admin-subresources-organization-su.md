List projects | OpenAI API Reference
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
# List projects
GET/organization/projects
Returns a list of projects.
##### Query ParametersExpand Collapse
after: optional string
A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj\_foo, your subsequent call can include after=obj\_foo in order to fetch the next page of the list.
[](<#(resource) admin.organization.projects > (method) list > (params) default > (param) after > (schema)>)
include\_archived: optional boolean
If `true` returns all projects including those that have been `archived`. Archived projects are not included by default.
[](<#(resource) admin.organization.projects > (method) list > (params) default > (param) include_archived > (schema)>)
limit: optional number
A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
[](<#(resource) admin.organization.projects > (method) list > (params) default > (param) limit > (schema)>)
##### ReturnsExpand Collapse
data: array of [Project](</api/reference/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>) { id, created\_at, name, 3 more }
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
[](<#(resource) admin.organization.projects > (method) list > (network schema) > (property) data>)
first\_id: string
[](<#(resource) admin.organization.projects > (method) list > (network schema) > (property) first_id>)
has\_more: boolean
[](<#(resource) admin.organization.projects > (method) list > (network schema) > (property) has_more>)
last\_id: string
[](<#(resource) admin.organization.projects > (method) list > (network schema) > (property) last_id>)
object: "list"
[](<#(resource) admin.organization.projects > (method) list > (network schema) > (property) object>)
### List projects
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
`curl https://api.openai.com/v1/organization/projects?after=proj\_abc&limit=20&include\_archived=false \\
-H "Authorization: Bearer $OPENAI\_ADMIN\_KEY" \\
-H "Content-Type: application/json"
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