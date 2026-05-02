Unassign project role from user | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Admin](/api/reference/python/resources/admin)
[Organization](/api/reference/python/resources/admin/subresources/organization)
[Projects](/api/reference/python/resources/admin/subresources/organization/subresources/projects)
[Users](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/users)
[Roles](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/users/subresources/roles)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Unassign project role from user
admin.organization.projects.users.roles.delete(strrole\_id, RoleDeleteParams\*\*kwargs) -\> [RoleDeleteResponse](</api/reference/python/resources/admin#(resource) admin.organization.projects.users.roles > (model) role_delete_response > (schema)>)
DELETE/projects/{project\_id}/users/{user\_id}/roles/{role\_id}
Unassigns a project role from a user within a project.
##### ParametersExpand Collapse
project\_id: str
[](<#(resource) admin.organization.projects.users.roles > (method) delete > (params) default > (param) project_id > (schema)>)
user\_id: str
[](<#(resource) admin.organization.projects.users.roles > (method) delete > (params) default > (param) user_id > (schema)>)
role\_id: str
[](<#(resource) admin.organization.projects.users.roles > (method) delete > (params) default > (param) role_id > (schema)>)
##### ReturnsExpand Collapse
class RoleDeleteResponse: …
Confirmation payload returned after unassigning a role.
deleted: bool
Whether the assignment was removed.
[](<#(resource) admin.organization.projects.users.roles > (model) role_delete_response > (schema) > (property) deleted>)
object: str
Identifier for the deleted assignment, such as `group.role.deleted` or `user.role.deleted`.
[](<#(resource) admin.organization.projects.users.roles > (model) role_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.users.roles > (model) role_delete_response > (schema)>)
### Unassign project role from user
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
role = client.admin.organization.projects.users.roles.delete(
role\_id="role\_id",
project\_id="project\_id",
user\_id="user\_id",
)
print(role.deleted)`
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