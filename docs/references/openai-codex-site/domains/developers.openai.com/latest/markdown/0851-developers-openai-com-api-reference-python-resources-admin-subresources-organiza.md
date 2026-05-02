Admin API Keys | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Admin](/api/reference/python/resources/admin)
[Organization](/api/reference/python/resources/admin/subresources/organization)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Admin API Keys
##### [List all organization and project API keys.](/api/reference/python/resources/admin/subresources/organization/subresources/admin_api_keys/methods/list)
admin.organization.admin\_api\_keys.list(AdminAPIKeyListParams\*\*kwargs) -\> SyncCursorPage[[AdminAPIKey](</api/reference/python/resources/admin#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema)>)]
GET/organization/admin\_api\_keys
##### [Create admin API key](/api/reference/python/resources/admin/subresources/organization/subresources/admin_api_keys/methods/create)
admin.organization.admin\_api\_keys.create(AdminAPIKeyCreateParams\*\*kwargs) -\> [AdminAPIKey](</api/reference/python/resources/admin#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema)>)
POST/organization/admin\_api\_keys
##### [Retrieve admin API key](/api/reference/python/resources/admin/subresources/organization/subresources/admin_api_keys/methods/retrieve)
admin.organization.admin\_api\_keys.retrieve(strkey\_id) -\> [AdminAPIKey](</api/reference/python/resources/admin#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema)>)
GET/organization/admin\_api\_keys/{key\_id}
##### [Delete admin API key](/api/reference/python/resources/admin/subresources/organization/subresources/admin_api_keys/methods/delete)
admin.organization.admin\_api\_keys.delete(strkey\_id) -\> [AdminAPIKeyDeleteResponse](</api/reference/python/resources/admin#(resource) admin.organization.admin_api_keys > (model) admin_api_key_delete_response > (schema)>)
DELETE/organization/admin\_api\_keys/{key\_id}
##### ModelsExpand Collapse
class AdminAPIKey: …
Represents an individual Admin API key in an org.
id: str
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) id>)
created\_at: int
The Unix timestamp (in seconds) of when the API key was created
formatunixtime
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) created_at>)
last\_used\_at: Optional[int]
The Unix timestamp (in seconds) of when the API key was last used
formatunixtime
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) last_used_at>)
name: str
The name of the API key
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) name>)
object: str
The object type, which is always `organization.admin\_api\_key`
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) object>)
owner: Owner
id: Optional[str]
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) id>)
created\_at: Optional[int]
The Unix timestamp (in seconds) of when the user was created
formatunixtime
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) created_at>)
name: Optional[str]
The name of the user
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) name>)
object: Optional[str]
The object type, which is always organization.user
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) object>)
role: Optional[str]
Always `owner`
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) role>)
type: Optional[str]
Always `user`
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) type>)
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner>)
redacted\_value: str
The redacted value of the API key
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) redacted_value>)
value: Optional[str]
The value of the API key. Only shown on create.
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) value>)
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema)>)
class AdminAPIKeyDeleteResponse: …
id: Optional[str]
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key_delete_response > (schema) > (property) id>)
deleted: Optional[bool]
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key_delete_response > (schema) > (property) deleted>)
object: Optional[str]
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key_delete_response > (schema)>)