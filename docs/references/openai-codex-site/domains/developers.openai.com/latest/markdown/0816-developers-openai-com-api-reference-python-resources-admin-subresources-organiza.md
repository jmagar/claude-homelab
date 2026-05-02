Delete admin API key | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Admin](/api/reference/python/resources/admin)
[Organization](/api/reference/python/resources/admin/subresources/organization)
[Admin API Keys](/api/reference/python/resources/admin/subresources/organization/subresources/admin_api_keys)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete admin API key
admin.organization.admin\_api\_keys.delete(strkey\_id) -\> [AdminAPIKeyDeleteResponse](</api/reference/python/resources/admin#(resource) admin.organization.admin_api_keys > (model) admin_api_key_delete_response > (schema)>)
DELETE/organization/admin\_api\_keys/{key\_id}
Delete an organization admin API key
##### ParametersExpand Collapse
key\_id: str
The ID of the API key to be deleted.
[](<#(resource) admin.organization.admin_api_keys > (method) delete > (params) default > (param) key_id > (schema)>)
##### ReturnsExpand Collapse
class AdminAPIKeyDeleteResponse: …
id: Optional[str]
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key_delete_response > (schema) > (property) id>)
deleted: Optional[bool]
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key_delete_response > (schema) > (property) deleted>)
object: Optional[str]
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key_delete_response > (schema)>)
### Delete admin API key
Python
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
`import os
from openai import OpenAI
client = OpenAI(
admin\_api\_key=os.environ.get("OPENAI\_ADMIN\_KEY"), # This is the default and can be omitted
)
admin\_api\_key = client.admin.organization.admin\_api\_keys.delete(
"key\_id",
)
print(admin\_api\_key.id)`
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