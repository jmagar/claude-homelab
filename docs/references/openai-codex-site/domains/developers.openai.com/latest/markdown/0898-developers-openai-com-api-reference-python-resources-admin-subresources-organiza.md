Remove project group | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Admin](/api/reference/python/resources/admin)
[Organization](/api/reference/python/resources/admin/subresources/organization)
[Projects](/api/reference/python/resources/admin/subresources/organization/subresources/projects)
[Groups](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/groups)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Remove project group
admin.organization.projects.groups.delete(strgroup\_id, GroupDeleteParams\*\*kwargs) -\> [GroupDeleteResponse](</api/reference/python/resources/admin#(resource) admin.organization.projects.groups > (model) group_delete_response > (schema)>)
DELETE/organization/projects/{project\_id}/groups/{group\_id}
Revokes a group’s access to a project.
##### ParametersExpand Collapse
project\_id: str
[](<#(resource) admin.organization.projects.groups > (method) delete > (params) default > (param) project_id > (schema)>)
group\_id: str
[](<#(resource) admin.organization.projects.groups > (method) delete > (params) default > (param) group_id > (schema)>)
##### ReturnsExpand Collapse
class GroupDeleteResponse: …
Confirmation payload returned after removing a group from a project.
deleted: bool
Whether the group membership in the project was removed.
[](<#(resource) admin.organization.projects.groups > (model) group_delete_response > (schema) > (property) deleted>)
object: Literal["project.group.deleted"]
Always `project.group.deleted`.
[](<#(resource) admin.organization.projects.groups > (model) group_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.groups > (model) group_delete_response > (schema)>)
### Remove project group
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
group = client.admin.organization.projects.groups.delete(
group\_id="group\_id",
project\_id="project\_id",
)
print(group.deleted)`
```
```
`{
"object": "project.group.deleted",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"object": "project.group.deleted",
"deleted": true
}
`
```