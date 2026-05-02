Add group user | OpenAI API Reference
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
# Add group user
admin.organization.groups.users.create(group\_id, \*\*kwargs) -\> [UserCreateResponse](</api/reference/ruby/resources/admin#(resource) admin.organization.groups.users > (model) user_create_response > (schema)>) { group\_id, object, user\_id }
POST/organization/groups/{group\_id}/users
Adds a user to a group.
##### ParametersExpand Collapse
group\_id: String
[](<#(resource) admin.organization.groups.users > (method) create > (params) default > (param) group_id > (schema)>)
user\_id: String
Identifier of the user to add to the group.
[](<#(resource) admin.organization.groups.users > (method) create > (params) default > (param) user_id > (schema)>)
##### ReturnsExpand Collapse
class UserCreateResponse { group\_id, object, user\_id }
Confirmation payload returned after adding a user to a group.
group\_id: String
Identifier of the group the user was added to.
[](<#(resource) admin.organization.groups.users > (model) user_create_response > (schema) > (property) group_id>)
object: :"group.user"
Always `group.user`.
[](<#(resource) admin.organization.groups.users > (model) user_create_response > (schema) > (property) object>)
user\_id: String
Identifier of the user that was added.
[](<#(resource) admin.organization.groups.users > (model) user_create_response > (schema) > (property) user_id>)
[](<#(resource) admin.organization.groups.users > (model) user_create_response > (schema)>)
### Add group user
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
user = openai.admin.organization.groups.users.create("group\_id", user\_id: "user\_id")
puts(user)`
```
```
`{
"object": "group.user",
"user\_id": "user\_abc123",
"group\_id": "group\_01J1F8ABCDXYZ"
}
`
```
##### Returns Examples
```
`{
"object": "group.user",
"user\_id": "user\_abc123",
"group\_id": "group\_01J1F8ABCDXYZ"
}
`
```