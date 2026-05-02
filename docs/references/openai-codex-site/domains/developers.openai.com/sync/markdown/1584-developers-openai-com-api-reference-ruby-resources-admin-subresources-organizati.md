Delete project API key | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Admin](/api/reference/ruby/resources/admin)
[Organization](/api/reference/ruby/resources/admin/subresources/organization)
[Projects](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects)
[API Keys](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/api_keys)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete project API key
admin.organization.projects.api\_keys.delete(key\_id, \*\*kwargs) -\> [APIKeyDeleteResponse](</api/reference/ruby/resources/admin#(resource) admin.organization.projects.api_keys > (model) api_key_delete_response > (schema)>) { id, deleted, object }
DELETE/organization/projects/{project\_id}/api\_keys/{key\_id}
Deletes an API key from the project.
Returns confirmation of the key deletion, or an error if the key belonged to
a service account.
##### ParametersExpand Collapse
project\_id: String
[](<#(resource) admin.organization.projects.api_keys > (method) delete > (params) default > (param) project_id > (schema)>)
key\_id: String
[](<#(resource) admin.organization.projects.api_keys > (method) delete > (params) default > (param) key_id > (schema)>)
##### ReturnsExpand Collapse
class APIKeyDeleteResponse { id, deleted, object }
id: String
[](<#(resource) admin.organization.projects.api_keys > (model) api_key_delete_response > (schema) > (property) id>)
deleted: bool
[](<#(resource) admin.organization.projects.api_keys > (model) api_key_delete_response > (schema) > (property) deleted>)
object: :"organization.project.api\_key.deleted"
[](<#(resource) admin.organization.projects.api_keys > (model) api_key_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.api_keys > (model) api_key_delete_response > (schema)>)
### Delete project API key
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
api\_key = openai.admin.organization.projects.api\_keys.delete("key\_id", project\_id: "project\_id")
puts(api\_key)`
```
```
`{
"object": "organization.project.api\_key.deleted",
"id": "key\_abc",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"object": "organization.project.api\_key.deleted",
"id": "key\_abc",
"deleted": true
}
`
```