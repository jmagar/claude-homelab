List project group role assignments | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Admin](/api/reference/resources/admin)
[Organization](/api/reference/resources/admin/subresources/organization)
[Projects](/api/reference/resources/admin/subresources/organization/subresources/projects)
[Groups](/api/reference/resources/admin/subresources/organization/subresources/projects/subresources/groups)
[Roles](/api/reference/resources/admin/subresources/organization/subresources/projects/subresources/groups/subresources/roles)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List project group role assignments
GET/projects/{project\_id}/groups/{group\_id}/roles
Lists the project roles assigned to a group within a project.
##### Path ParametersExpand Collapse
project\_id: string
[](<#(resource) admin.organization.projects.groups.roles > (method) list > (params) default > (param) project_id > (schema)>)
group\_id: string
[](<#(resource) admin.organization.projects.groups.roles > (method) list > (params) default > (param) group_id > (schema)>)
##### Query ParametersExpand Collapse
after: optional string
Cursor for pagination. Provide the value from the previous response’s `next` field to continue listing project roles.
[](<#(resource) admin.organization.projects.groups.roles > (method) list > (params) default > (param) after > (schema)>)
limit: optional number
A limit on the number of project role assignments to return.
minimum0
maximum1000
[](<#(resource) admin.organization.projects.groups.roles > (method) list > (params) default > (param) limit > (schema)>)
order: optional "asc" or "desc"
Sort order for the returned project roles.
One of the following:
"asc"
[](<#(resource) admin.organization.projects.groups.roles > (method) list > (params) default > (param) order > (schema) > (member) 0>)
"desc"
[](<#(resource) admin.organization.projects.groups.roles > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) admin.organization.projects.groups.roles > (method) list > (params) default > (param) order > (schema)>)
##### ReturnsExpand Collapse
data: array of object { id, created\_at, created\_by, 8 more }
Role assignments returned in the current page.
id: string
Identifier for the role.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) id>)
created\_at: number
When the role was created.
formatunixtime
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) created_at>)
created\_by: string
Identifier of the actor who created the role.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) created_by>)
created\_by\_user\_obj: map[unknown]
User details for the actor that created the role, when available.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) created_by_user_obj>)
description: string
Description of the role.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) description>)
metadata: map[unknown]
Arbitrary metadata stored on the role.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) metadata>)
name: string
Name of the role.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) name>)
permissions: array of string
Permissions associated with the role.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) permissions>)
predefined\_role: boolean
Whether the role is predefined by OpenAI.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) predefined_role>)
resource\_type: string
Resource type the role applies to.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) resource_type>)
updated\_at: number
When the role was last updated.
formatint64
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) updated_at>)
[](<#(resource) admin.organization.projects.groups.roles > (method) list > (network schema) > (property) data>)
has\_more: boolean
Whether additional assignments are available when paginating.
[](<#(resource) admin.organization.projects.groups.roles > (method) list > (network schema) > (property) has_more>)
next: string
Cursor to fetch the next page of results, or `null` when there are no more assignments.
[](<#(resource) admin.organization.projects.groups.roles > (method) list > (network schema) > (property) next>)
object: "list"
Always `list`.
[](<#(resource) admin.organization.projects.groups.roles > (method) list > (network schema) > (property) object>)
### List project group role assignments
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
`curl https://api.openai.com/v1/projects/proj\_abc123/groups/group\_01J1F8ABCDXYZ/roles \\
-H "Authorization: Bearer $OPENAI\_ADMIN\_KEY" \\
-H "Content-Type: application/json"
`
```
```
`{
"object": "list",
"data": [
{
"id": "role\_01J1F8PROJ",
"name": "API Project Key Manager",
"permissions": [
"api.organization.projects.api\_keys.read",
"api.organization.projects.api\_keys.write"
],
"resource\_type": "api.project",
"predefined\_role": false,
"description": "Allows managing API keys for the project",
"created\_at": 1711471533,
"updated\_at": 1711472599,
"created\_by": "user\_abc123",
"created\_by\_user\_obj": {
"id": "user\_abc123",
"name": "Ada Lovelace",
"email": "ada@example.com"
},
"metadata": {}
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
"id": "role\_01J1F8PROJ",
"name": "API Project Key Manager",
"permissions": [
"api.organization.projects.api\_keys.read",
"api.organization.projects.api\_keys.write"
],
"resource\_type": "api.project",
"predefined\_role": false,
"description": "Allows managing API keys for the project",
"created\_at": 1711471533,
"updated\_at": 1711472599,
"created\_by": "user\_abc123",
"created\_by\_user\_obj": {
"id": "user\_abc123",
"name": "Ada Lovelace",
"email": "ada@example.com"
},
"metadata": {}
}
],
"has\_more": false,
"next": null
}
`
```