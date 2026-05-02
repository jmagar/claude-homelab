Remove group user | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Admin](/api/reference/ruby/resources/admin)
[Organization](/api/reference/ruby/resources/admin/subresources/organization)
[Groups](/api/reference/ruby/resources/admin/subresources/organization/subresources/groups)
[Users](/api/reference/ruby/resources/admin/subresources/organization/subresources/groups/subresources/users)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Remove group user
admin.organization.groups.users.delete(user\_id, \*\*kwargs) -\> [UserDeleteResponse](</api/reference/ruby/resources/admin#(resource) admin.organization.groups.users > (model) user_delete_response > (schema)>) { deleted, object }
DELETE/organization/groups/{group\_id}/users/{user\_id}
Removes a user from a group.
##### ParametersExpand Collapse
group\_id: String
[](<#(resource) admin.organization.groups.users > (method) delete > (params) default > (param) group_id > (schema)>)
user\_id: String
[](<#(resource) admin.organization.groups.users > (method) delete > (params) default > (param) user_id > (schema)>)
##### ReturnsExpand Collapse
class UserDeleteResponse { deleted, object }
Confirmation payload returned after removing a user from a group.
deleted: bool
Whether the group membership was removed.
[](<#(resource) admin.organization.groups.users > (model) user_delete_response > (schema) > (property) deleted>)
object: :"group.user.deleted"
Always `group.user.deleted`.
[](<#(resource) admin.organization.groups.users > (model) user_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.groups.users > (model) user_delete_response > (schema)>)
### Remove group user
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
user = openai.admin.organization.groups.users.delete("user\_id", group\_id: "group\_id")
puts(user)`
```
```
`{
"object": "group.user.deleted",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"object": "group.user.deleted",
"deleted": true
}
`
```