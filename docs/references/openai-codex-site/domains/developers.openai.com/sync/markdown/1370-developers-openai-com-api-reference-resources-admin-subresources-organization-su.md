Unassign project role from group | OpenAI API Reference
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
# Unassign project role from group
DELETE/projects/{project\_id}/groups/{group\_id}/roles/{role\_id}
Unassigns a project role from a group within a project.
##### Path ParametersExpand Collapse
project\_id: string
[](<#(resource) admin.organization.projects.groups.roles > (method) delete > (params) default > (param) project_id > (schema)>)
group\_id: string
[](<#(resource) admin.organization.projects.groups.roles > (method) delete > (params) default > (param) group_id > (schema)>)
role\_id: string
[](<#(resource) admin.organization.projects.groups.roles > (method) delete > (params) default > (param) role_id > (schema)>)
##### ReturnsExpand Collapse
deleted: boolean
Whether the assignment was removed.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_delete_response > (schema) > (property) deleted>)
object: string
Identifier for the deleted assignment, such as `group.role.deleted` or `user.role.deleted`.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_delete_response > (schema) > (property) object>)
### Unassign project role from group
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
`curl -X DELETE https://api.openai.com/v1/projects/proj\_abc123/groups/group\_01J1F8ABCDXYZ/roles/role\_01J1F8PROJ \\
-H "Authorization: Bearer $OPENAI\_ADMIN\_KEY" \\
-H "Content-Type: application/json"
`
```
```
`{
"object": "group.role.deleted",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"object": "group.role.deleted",
"deleted": true
}
`
```