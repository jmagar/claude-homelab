Add project group | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Admin](/api/reference/ruby/resources/admin)
[Organization](/api/reference/ruby/resources/admin/subresources/organization)
[Projects](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects)
[Groups](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/groups)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Add project group
admin.organization.projects.groups.create(project\_id, \*\*kwargs) -\> [ProjectGroup](</api/reference/ruby/resources/admin#(resource) admin.organization.projects.groups > (model) project_group > (schema)>) { created\_at, group\_id, group\_name, 2 more }
POST/organization/projects/{project\_id}/groups
Grants a group access to a project.
##### ParametersExpand Collapse
project\_id: String
[](<#(resource) admin.organization.projects.groups > (method) create > (params) default > (param) project_id > (schema)>)
group\_id: String
Identifier of the group to add to the project.
[](<#(resource) admin.organization.projects.groups > (method) create > (params) default > (param) group_id > (schema)>)
role: String
Identifier of the project role to grant to the group.
[](<#(resource) admin.organization.projects.groups > (method) create > (params) default > (param) role > (schema)>)
##### ReturnsExpand Collapse
class ProjectGroup { created\_at, group\_id, group\_name, 2 more }
Details about a group’s membership in a project.
created\_at: Integer
Unix timestamp (in seconds) when the group was granted project access.
formatunixtime
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) created_at>)
group\_id: String
Identifier of the group that has access to the project.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) group_id>)
group\_name: String
Display name of the group.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) group_name>)
object: :"project.group"
Always `project.group`.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) object>)
project\_id: String
Identifier of the project.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) project_id>)
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema)>)
### Add project group
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
project\_group = openai.admin.organization.projects.groups.create("project\_id", group\_id: "group\_id", role: "role")
puts(project\_group)`
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