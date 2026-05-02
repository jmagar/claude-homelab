List project groups | OpenAI API Reference
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
# List project groups
admin.organization.projects.groups.list(project\_id, \*\*kwargs) -\> CursorPage\<[ProjectGroup](</api/reference/ruby/resources/admin#(resource) admin.organization.projects.groups > (model) project_group > (schema)>) { created\_at, group\_id, group\_name, 2 more } \>
GET/organization/projects/{project\_id}/groups
Lists the groups that have access to a project.
##### ParametersExpand Collapse
project\_id: String
[](<#(resource) admin.organization.projects.groups > (method) list > (params) default > (param) project_id > (schema)>)
after: String
Cursor for pagination. Provide the ID of the last group from the previous response to fetch the next page.
[](<#(resource) admin.organization.projects.groups > (method) list > (params) default > (param) after > (schema)>)
limit: Integer
A limit on the number of project groups to return. Defaults to 20.
minimum0
maximum100
[](<#(resource) admin.organization.projects.groups > (method) list > (params) default > (param) limit > (schema)>)
order: :asc | :desc
Sort order for the returned groups.
One of the following:
:asc
[](<#(resource) admin.organization.projects.groups > (method) list > (params) default > (param) order > (schema) > (member) 0>)
:desc
[](<#(resource) admin.organization.projects.groups > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) admin.organization.projects.groups > (method) list > (params) default > (param) order > (schema)>)
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
### List project groups
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
page = openai.admin.organization.projects.groups.list("project\_id")
puts(page)`
```
```
`{
"object": "list",
"data": [
{
"object": "project.group",
"project\_id": "proj\_abc123",
"group\_id": "group\_01J1F8ABCDXYZ",
"group\_name": "Support Team",
"created\_at": 1711471533
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
"object": "project.group",
"project\_id": "proj\_abc123",
"group\_id": "group\_01J1F8ABCDXYZ",
"group\_name": "Support Team",
"created\_at": 1711471533
}
],
"has\_more": false,
"next": null
}
`
```