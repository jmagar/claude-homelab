Delete group | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Admin](/api/reference/ruby/resources/admin)
[Organization](/api/reference/ruby/resources/admin/subresources/organization)
[Groups](/api/reference/ruby/resources/admin/subresources/organization/subresources/groups)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete group
admin.organization.groups.delete(group\_id) -\> [GroupDeleteResponse](</api/reference/ruby/resources/admin#(resource) admin.organization.groups > (model) group_delete_response > (schema)>) { id, deleted, object }
DELETE/organization/groups/{group\_id}
Deletes a group from the organization.
##### ParametersExpand Collapse
group\_id: String
[](<#(resource) admin.organization.groups > (method) delete > (params) default > (param) group_id > (schema)>)
##### ReturnsExpand Collapse
class GroupDeleteResponse { id, deleted, object }
Confirmation payload returned after deleting a group.
id: String
Identifier of the deleted group.
[](<#(resource) admin.organization.groups > (model) group_delete_response > (schema) > (property) id>)
deleted: bool
Whether the group was deleted.
[](<#(resource) admin.organization.groups > (model) group_delete_response > (schema) > (property) deleted>)
object: :"group.deleted"
Always `group.deleted`.
[](<#(resource) admin.organization.groups > (model) group_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.groups > (model) group_delete_response > (schema)>)
### Delete group
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
group = openai.admin.organization.groups.delete("group\_id")
puts(group)`
```
```
`{
"object": "group.deleted",
"id": "group\_01J1F8ABCDXYZ",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"object": "group.deleted",
"id": "group\_01J1F8ABCDXYZ",
"deleted": true
}
`
```