Unassign project role from user | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Admin](/api/reference/ruby/resources/admin)
[Organization](/api/reference/ruby/resources/admin/subresources/organization)
[Projects](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects)
[Users](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/users)
[Roles](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/users/subresources/roles)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Unassign project role from user
admin.organization.projects.users.roles.delete(role\_id, \*\*kwargs) -\> [RoleDeleteResponse](</api/reference/ruby/resources/admin#(resource) admin.organization.projects.users.roles > (model) role_delete_response > (schema)>) { deleted, object }
DELETE/projects/{project\_id}/users/{user\_id}/roles/{role\_id}
Unassigns a project role from a user within a project.
##### ParametersExpand Collapse
project\_id: String
[](<#(resource) admin.organization.projects.users.roles > (method) delete > (params) default > (param) project_id > (schema)>)
user\_id: String
[](<#(resource) admin.organization.projects.users.roles > (method) delete > (params) default > (param) user_id > (schema)>)
role\_id: String
[](<#(resource) admin.organization.projects.users.roles > (method) delete > (params) default > (param) role_id > (schema)>)
##### ReturnsExpand Collapse
class RoleDeleteResponse { deleted, object }
Confirmation payload returned after unassigning a role.
deleted: bool
Whether the assignment was removed.
[](<#(resource) admin.organization.projects.users.roles > (model) role_delete_response > (schema) > (property) deleted>)
object: String
Identifier for the deleted assignment, such as `group.role.deleted` or `user.role.deleted`.
[](<#(resource) admin.organization.projects.users.roles > (model) role_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.users.roles > (model) role_delete_response > (schema)>)
### Unassign project role from user
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
role = openai.admin.organization.projects.users.roles.delete(
"role\_id",
project\_id: "project\_id",
user\_id: "user\_id"
)
puts(role)`
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