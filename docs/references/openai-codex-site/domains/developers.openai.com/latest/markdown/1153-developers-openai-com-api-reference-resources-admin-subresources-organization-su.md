List project groups | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Admin](/api/reference/resources/admin)
[Organization](/api/reference/resources/admin/subresources/organization)
[Projects](/api/reference/resources/admin/subresources/organization/subresources/projects)
[Groups](/api/reference/resources/admin/subresources/organization/subresources/projects/subresources/groups)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List project groups
GET/organization/projects/{project\_id}/groups
Lists the groups that have access to a project.
##### Path ParametersExpand Collapse
project\_id: string
[](<#(resource) admin.organization.projects.groups > (method) list > (params) default > (param) project_id > (schema)>)
##### Query ParametersExpand Collapse
after: optional string
Cursor for pagination. Provide the ID of the last group from the previous response to fetch the next page.
[](<#(resource) admin.organization.projects.groups > (method) list > (params) default > (param) after > (schema)>)
limit: optional number
A limit on the number of project groups to return. Defaults to 20.
minimum0
maximum100
[](<#(resource) admin.organization.projects.groups > (method) list > (params) default > (param) limit > (schema)>)
order: optional "asc" or "desc"
Sort order for the returned groups.
One of the following:
"asc"
[](<#(resource) admin.organization.projects.groups > (method) list > (params) default > (param) order > (schema) > (member) 0>)
"desc"
[](<#(resource) admin.organization.projects.groups > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) admin.organization.projects.groups > (method) list > (params) default > (param) order > (schema)>)
##### ReturnsExpand Collapse
data: array of [ProjectGroup](</api/reference/resources/admin#(resource) admin.organization.projects.groups > (model) project_group > (schema)>) { created\_at, group\_id, group\_name, 2 more }
Project group memberships returned in the current page.
created\_at: number
Unix timestamp (in seconds) when the group was granted project access.
formatunixtime
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) created_at>)
group\_id: string
Identifier of the group that has access to the project.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) group_id>)
group\_name: string
Display name of the group.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) group_name>)
object: "project.group"
Always `project.group`.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) object>)
project\_id: string
Identifier of the project.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) project_id>)
[](<#(resource) admin.organization.projects.groups > (method) list > (network schema) > (property) data>)
has\_more: boolean
Whether additional project group memberships are available.
[](<#(resource) admin.organization.projects.groups > (method) list > (network schema) > (property) has_more>)
next: string
Cursor to fetch the next page of results, or `null` when there are no more results.
[](<#(resource) admin.organization.projects.groups > (method) list > (network schema) > (property) next>)
object: "list"
Always `list`.
[](<#(resource) admin.organization.projects.groups > (method) list > (network schema) > (property) object>)
### List project groups
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
`curl https://api.openai.com/v1/organization/projects/proj\_abc123/groups?limit=20 \\
-H "Authorization: Bearer $OPENAI\_ADMIN\_KEY" \\
-H "Content-Type: application/json"
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