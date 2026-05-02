Remove project group | OpenAI API Reference
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
# Remove project group
admin.organization.projects.groups.delete(group\_id, \*\*kwargs) -\> [GroupDeleteResponse](</api/reference/ruby/resources/admin#(resource) admin.organization.projects.groups > (model) group_delete_response > (schema)>) { deleted, object }
DELETE/organization/projects/{project\_id}/groups/{group\_id}
Revokes a group’s access to a project.
##### ParametersExpand Collapse
project\_id: String
[](<#(resource) admin.organization.projects.groups > (method) delete > (params) default > (param) project_id > (schema)>)
group\_id: String
[](<#(resource) admin.organization.projects.groups > (method) delete > (params) default > (param) group_id > (schema)>)
##### ReturnsExpand Collapse
class GroupDeleteResponse { deleted, object }
Confirmation payload returned after removing a group from a project.
deleted: bool
Whether the group membership in the project was removed.
[](<#(resource) admin.organization.projects.groups > (model) group_delete_response > (schema) > (property) deleted>)
object: :"project.group.deleted"
Always `project.group.deleted`.
[](<#(resource) admin.organization.projects.groups > (model) group_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.groups > (model) group_delete_response > (schema)>)
### Remove project group
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
group = openai.admin.organization.projects.groups.delete("group\_id", project\_id: "project\_id")
puts(group)`
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