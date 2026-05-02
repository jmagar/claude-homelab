Add project group | OpenAI API Reference
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
# Add project group
POST/organization/projects/{project\_id}/groups
Grants a group access to a project.
##### Path ParametersExpand Collapse
project\_id: string
[](<#(resource) admin.organization.projects.groups > (method) create > (params) default > (param) project_id > (schema)>)
##### Body ParametersJSONExpand Collapse
group\_id: string
Identifier of the group to add to the project.
[](<#(resource) admin.organization.projects.groups > (method) create > (params) 0 > (param) group_id > (schema)>)
role: string
Identifier of the project role to grant to the group.
[](<#(resource) admin.organization.projects.groups > (method) create > (params) 0 > (param) role > (schema)>)
##### ReturnsExpand Collapse
ProjectGroup object { created\_at, group\_id, group\_name, 2 more }
Details about a group’s membership in a project.
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
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema)>)
### Add project group
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
`curl -X POST https://api.openai.com/v1/organization/projects/proj\_abc123/groups \\
-H "Authorization: Bearer $OPENAI\_ADMIN\_KEY" \\
-H "Content-Type: application/json" \\
-d '{
"group\_id": "group\_01J1F8ABCDXYZ",
"role": "role\_01J1F8PROJ"
}'
`
```
```
`{
"object": "project.group",
"project\_id": "proj\_abc123",
"group\_id": "group\_01J1F8ABCDXYZ",
"group\_name": "Support Team",
"created\_at": 1711471533
}
`
```
##### Returns Examples
```
`{
"object": "project.group",
"project\_id": "proj\_abc123",
"group\_id": "group\_01J1F8ABCDXYZ",
"group\_name": "Support Team",
"created\_at": 1711471533
}
`
```