Delete user | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Admin](/api/reference/ruby/resources/admin)
[Organization](/api/reference/ruby/resources/admin/subresources/organization)
[Users](/api/reference/ruby/resources/admin/subresources/organization/subresources/users)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete user
admin.organization.users.delete(user\_id) -\> [UserDeleteResponse](</api/reference/ruby/resources/admin#(resource) admin.organization.users > (model) user_delete_response > (schema)>) { id, deleted, object }
DELETE/organization/users/{user\_id}
Deletes a user from the organization.
##### ParametersExpand Collapse
user\_id: String
[](<#(resource) admin.organization.users > (method) delete > (params) default > (param) user_id > (schema)>)
##### ReturnsExpand Collapse
class UserDeleteResponse { id, deleted, object }
id: String
[](<#(resource) admin.organization.users > (model) user_delete_response > (schema) > (property) id>)
deleted: bool
[](<#(resource) admin.organization.users > (model) user_delete_response > (schema) > (property) deleted>)
object: :"organization.user.deleted"
[](<#(resource) admin.organization.users > (model) user_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.users > (model) user_delete_response > (schema)>)
### Delete user
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
user = openai.admin.organization.users.delete("user\_id")
puts(user)`
```
```
`{
"object": "organization.user.deleted",
"id": "user\_abc",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"object": "organization.user.deleted",
"id": "user\_abc",
"deleted": true
}
`
```