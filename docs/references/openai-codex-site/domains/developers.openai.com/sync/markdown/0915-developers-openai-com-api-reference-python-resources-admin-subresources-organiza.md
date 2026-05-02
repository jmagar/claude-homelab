Add project group | OpenAI API Reference
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
# Add project group
admin.organization.projects.groups.create(strproject\_id, GroupCreateParams\*\*kwargs) -\> [ProjectGroup](</api/reference/python/resources/admin#(resource) admin.organization.projects.groups > (model) project_group > (schema)>)
POST/organization/projects/{project\_id}/groups
Grants a group access to a project.
##### ParametersExpand Collapse
project\_id: str
[](<#(resource) admin.organization.projects.groups > (method) create > (params) default > (param) project_id > (schema)>)
group\_id: str
Identifier of the group to add to the project.
[](<#(resource) admin.organization.projects.groups > (method) create > (params) default > (param) group_id > (schema)>)
role: str
Identifier of the project role to grant to the group.
[](<#(resource) admin.organization.projects.groups > (method) create > (params) default > (param) role > (schema)>)
##### ReturnsExpand Collapse
class ProjectGroup: …
Details about a group’s membership in a project.
created\_at: int
Unix timestamp (in seconds) when the group was granted project access.
formatunixtime
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) created_at>)
group\_id: str
Identifier of the group that has access to the project.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) group_id>)
group\_name: str
Display name of the group.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) group_name>)
object: Literal["project.group"]
Always `project.group`.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) object>)
project\_id: str
Identifier of the project.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) project_id>)
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema)>)
### Add project group
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
project\_group = client.admin.organization.projects.groups.create(
project\_id="project\_id",
group\_id="group\_id",
role="role",
)
print(project\_group.group\_id)`
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