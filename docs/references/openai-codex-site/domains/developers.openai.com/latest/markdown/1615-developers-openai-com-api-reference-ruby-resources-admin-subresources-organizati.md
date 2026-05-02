Delete admin API key | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Admin](/api/reference/ruby/resources/admin)
[Organization](/api/reference/ruby/resources/admin/subresources/organization)
[Admin API Keys](/api/reference/ruby/resources/admin/subresources/organization/subresources/admin_api_keys)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete admin API key
admin.organization.admin\_api\_keys.delete(key\_id) -\> [AdminAPIKeyDeleteResponse](</api/reference/ruby/resources/admin#(resource) admin.organization.admin_api_keys > (model) admin_api_key_delete_response > (schema)>) { id, deleted, object }
DELETE/organization/admin\_api\_keys/{key\_id}
Delete an organization admin API key
##### ParametersExpand Collapse
key\_id: String
The ID of the API key to be deleted.
[](<#(resource) admin.organization.admin_api_keys > (method) delete > (params) default > (param) key_id > (schema)>)
##### ReturnsExpand Collapse
class AdminAPIKeyDeleteResponse { id, deleted, object }
id: String
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key_delete_response > (schema) > (property) id>)
deleted: bool
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key_delete_response > (schema) > (property) deleted>)
object: String
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key_delete_response > (schema)>)
### Delete admin API key
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
admin\_api\_key = openai.admin.organization.admin\_api\_keys.delete("key\_id")
puts(admin\_api\_key)`
```
```
`{
"id": "key\_abc",
"object": "organization.admin\_api\_key.deleted",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"id": "key\_abc",
"object": "organization.admin\_api\_key.deleted",
"deleted": true
}
`
```