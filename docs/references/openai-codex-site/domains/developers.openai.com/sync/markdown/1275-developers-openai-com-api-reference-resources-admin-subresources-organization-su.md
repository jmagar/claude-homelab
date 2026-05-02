Unassign project role from user | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Admin](/api/reference/resources/admin)
[Organization](/api/reference/resources/admin/subresources/organization)
[Projects](/api/reference/resources/admin/subresources/organization/subresources/projects)
[Users](/api/reference/resources/admin/subresources/organization/subresources/projects/subresources/users)
[Roles](/api/reference/resources/admin/subresources/organization/subresources/projects/subresources/users/subresources/roles)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Unassign project role from user
DELETE/projects/{project\_id}/users/{user\_id}/roles/{role\_id}
Unassigns a project role from a user within a project.
##### Path ParametersExpand Collapse
project\_id: string
[](<#(resource) admin.organization.projects.users.roles > (method) delete > (params) default > (param) project_id > (schema)>)
user\_id: string
[](<#(resource) admin.organization.projects.users.roles > (method) delete > (params) default > (param) user_id > (schema)>)
role\_id: string
[](<#(resource) admin.organization.projects.users.roles > (method) delete > (params) default > (param) role_id > (schema)>)
##### ReturnsExpand Collapse
deleted: boolean
Whether the assignment was removed.
[](<#(resource) admin.organization.projects.users.roles > (model) role_delete_response > (schema) > (property) deleted>)
object: string
Identifier for the deleted assignment, such as `group.role.deleted` or `user.role.deleted`.
[](<#(resource) admin.organization.projects.users.roles > (model) role_delete_response > (schema) > (property) object>)
### Unassign project role from user
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
`curl -X DELETE https://api.openai.com/v1/projects/proj\_abc123/users/user\_abc123/roles/role\_01J1F8PROJ \\
-H "Authorization: Bearer $OPENAI\_ADMIN\_KEY" \\
-H "Content-Type: application/json"
`
```
```
`{
"object": "user.role.deleted",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"object": "user.role.deleted",
"deleted": true
}
`
```