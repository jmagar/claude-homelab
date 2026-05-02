Delete project user | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Admin](/api/reference/ruby/resources/admin)
[Organization](/api/reference/ruby/resources/admin/subresources/organization)
[Projects](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects)
[Users](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/users)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete project user
admin.organization.projects.users.delete(user\_id, \*\*kwargs) -\> [UserDeleteResponse](</api/reference/ruby/resources/admin#(resource) admin.organization.projects.users > (model) user_delete_response > (schema)>) { id, deleted, object }
DELETE/organization/projects/{project\_id}/users/{user\_id}
Deletes a user from the project.
Returns confirmation of project user deletion, or an error if the project is
archived (archived projects have no users).
##### ParametersExpand Collapse
project\_id: String
[](<#(resource) admin.organization.projects.users > (method) delete > (params) default > (param) project_id > (schema)>)
user\_id: String
[](<#(resource) admin.organization.projects.users > (method) delete > (params) default > (param) user_id > (schema)>)
##### ReturnsExpand Collapse
class UserDeleteResponse { id, deleted, object }
id: String
[](<#(resource) admin.organization.projects.users > (model) user_delete_response > (schema) > (property) id>)
deleted: bool
[](<#(resource) admin.organization.projects.users > (model) user_delete_response > (schema) > (property) deleted>)
object: :"organization.project.user.deleted"
[](<#(resource) admin.organization.projects.users > (model) user_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.users > (model) user_delete_response > (schema)>)
### Delete project user
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
user = openai.admin.organization.projects.users.delete("user\_id", project\_id: "project\_id")
puts(user)`
```
```
`{
"object": "organization.project.user.deleted",
"id": "user\_abc",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"object": "organization.project.user.deleted",
"id": "user\_abc",
"deleted": true
}
`
```