Delete admin API key | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Admin](/api/reference/resources/admin)
[Organization](/api/reference/resources/admin/subresources/organization)
[Admin API Keys](/api/reference/resources/admin/subresources/organization/subresources/admin_api_keys)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete admin API key
DELETE/organization/admin\_api\_keys/{key\_id}
Delete an organization admin API key
##### Path ParametersExpand Collapse
key\_id: string
The ID of the API key to be deleted.
[](<#(resource) admin.organization.admin_api_keys > (method) delete > (params) default > (param) key_id > (schema)>)
##### ReturnsExpand Collapse
id: optional string
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key_delete_response > (schema) > (property) id>)
deleted: optional boolean
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key_delete_response > (schema) > (property) deleted>)
object: optional string
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key_delete_response > (schema) > (property) object>)
### Delete admin API key
HTTP
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
`curl -X DELETE https://api.openai.com/v1/organization/admin\_api\_keys/key\_abc \\
-H "Authorization: Bearer $OPENAI\_ADMIN\_KEY" \\
-H "Content-Type: application/json"
`
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