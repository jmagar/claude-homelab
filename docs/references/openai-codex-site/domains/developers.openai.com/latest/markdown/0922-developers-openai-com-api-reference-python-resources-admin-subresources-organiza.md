Unassign project role from group | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Admin](/api/reference/python/resources/admin)
[Organization](/api/reference/python/resources/admin/subresources/organization)
[Projects](/api/reference/python/resources/admin/subresources/organization/subresources/projects)
[Groups](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/groups)
[Roles](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/groups/subresources/roles)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Unassign project role from group
admin.organization.projects.groups.roles.delete(strrole\_id, RoleDeleteParams\*\*kwargs) -\> [RoleDeleteResponse](</api/reference/python/resources/admin#(resource) admin.organization.projects.groups.roles > (model) role_delete_response > (schema)>)
DELETE/projects/{project\_id}/groups/{group\_id}/roles/{role\_id}
Unassigns a project role from a group within a project.
##### ParametersExpand Collapse
project\_id: str
[](<#(resource) admin.organization.projects.groups.roles > (method) delete > (params) default > (param) project_id > (schema)>)
group\_id: str
[](<#(resource) admin.organization.projects.groups.roles > (method) delete > (params) default > (param) group_id > (schema)>)
role\_id: str
[](<#(resource) admin.organization.projects.groups.roles > (method) delete > (params) default > (param) role_id > (schema)>)
##### ReturnsExpand Collapse
class RoleDeleteResponse: …
Confirmation payload returned after unassigning a role.
deleted: bool
Whether the assignment was removed.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_delete_response > (schema) > (property) deleted>)
object: str
Identifier for the deleted assignment, such as `group.role.deleted` or `user.role.deleted`.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.groups.roles > (model) role_delete_response > (schema)>)
### Unassign project role from group
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
role = client.admin.organization.projects.groups.roles.delete(
role\_id="role\_id",
project\_id="project\_id",
group\_id="group\_id",
)
print(role.deleted)`
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