Admin API Keys | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Admin](/api/reference/typescript/resources/admin)
[Organization](/api/reference/typescript/resources/admin/subresources/organization)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Admin API Keys
##### [List all organization and project API keys.](/api/reference/typescript/resources/admin/subresources/organization/subresources/admin_api_keys/methods/list)
client.admin.organization.adminAPIKeys.list(AdminAPIKeyListParams { after, limit, order } query?, RequestOptionsoptions?): CursorPage\<[AdminAPIKey](</api/reference/typescript/resources/admin#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema)>) { id, created\_at, last\_used\_at, 5 more } \>
GET/organization/admin\_api\_keys
##### [Create admin API key](/api/reference/typescript/resources/admin/subresources/organization/subresources/admin_api_keys/methods/create)
client.admin.organization.adminAPIKeys.create(AdminAPIKeyCreateParams { name } body, RequestOptionsoptions?): [AdminAPIKey](</api/reference/typescript/resources/admin#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema)>) { id, created\_at, last\_used\_at, 5 more }
POST/organization/admin\_api\_keys
##### [Retrieve admin API key](/api/reference/typescript/resources/admin/subresources/organization/subresources/admin_api_keys/methods/retrieve)
client.admin.organization.adminAPIKeys.retrieve(stringkeyID, RequestOptionsoptions?): [AdminAPIKey](</api/reference/typescript/resources/admin#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema)>) { id, created\_at, last\_used\_at, 5 more }
GET/organization/admin\_api\_keys/{key\_id}
##### [Delete admin API key](/api/reference/typescript/resources/admin/subresources/organization/subresources/admin_api_keys/methods/delete)
client.admin.organization.adminAPIKeys.delete(stringkeyID, RequestOptionsoptions?): [AdminAPIKeyDeleteResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.admin_api_keys > (model) admin_api_key_delete_response > (schema)>) { id, deleted, object }
DELETE/organization/admin\_api\_keys/{key\_id}
##### ModelsExpand Collapse
AdminAPIKey { id, created\_at, last\_used\_at, 5 more }
Represents an individual Admin API key in an org.
id: string
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) id>)
created\_at: number
The Unix timestamp (in seconds) of when the API key was created
formatunixtime
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) created_at>)
last\_used\_at: number | null
The Unix timestamp (in seconds) of when the API key was last used
formatunixtime
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) last_used_at>)
name: string
The name of the API key
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) name>)
object: string
The object type, which is always `organization.admin\_api\_key`
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) object>)
owner: Owner { id, created\_at, name, 3 more }
id?: string
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) id>)
created\_at?: number
The Unix timestamp (in seconds) of when the user was created
formatunixtime
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) created_at>)
name?: string
The name of the user
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) name>)
object?: string
The object type, which is always organization.user
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) object>)
role?: string
Always `owner`
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) role>)
type?: string
Always `user`
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) type>)
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner>)
redacted\_value: string
The redacted value of the API key
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) redacted_value>)
value?: string
The value of the API key. Only shown on create.
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) value>)
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema)>)
AdminAPIKeyDeleteResponse { id, deleted, object }
id?: string
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key_delete_response > (schema) > (property) id>)
deleted?: boolean
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key_delete_response > (schema) > (property) deleted>)
object?: string
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key_delete_response > (schema)>)