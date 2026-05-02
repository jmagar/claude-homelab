Admin API Keys | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Admin](/api/reference/go/resources/admin)
[Organization](/api/reference/go/resources/admin/subresources/organization)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Admin API Keys
##### [List all organization and project API keys.](/api/reference/go/resources/admin/subresources/organization/subresources/admin_api_keys/methods/list)
client.Admin.Organization.AdminAPIKeys.List(ctx, query) (\*CursorPage[[AdminAPIKey](</api/reference/go/resources/admin#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema)>)], error)
GET/organization/admin\_api\_keys
##### [Create admin API key](/api/reference/go/resources/admin/subresources/organization/subresources/admin_api_keys/methods/create)
client.Admin.Organization.AdminAPIKeys.New(ctx, body) (\*[AdminAPIKey](</api/reference/go/resources/admin#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema)>), error)
POST/organization/admin\_api\_keys
##### [Retrieve admin API key](/api/reference/go/resources/admin/subresources/organization/subresources/admin_api_keys/methods/retrieve)
client.Admin.Organization.AdminAPIKeys.Get(ctx, keyID) (\*[AdminAPIKey](</api/reference/go/resources/admin#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema)>), error)
GET/organization/admin\_api\_keys/{key\_id}
##### [Delete admin API key](/api/reference/go/resources/admin/subresources/organization/subresources/admin_api_keys/methods/delete)
client.Admin.Organization.AdminAPIKeys.Delete(ctx, keyID) (\*[AdminOrganizationAdminAPIKeyDeleteResponse](</api/reference/go/resources/admin#(resource) admin.organization.admin_api_keys > (model) AdminOrganizationAdminAPIKeyDeleteResponse > (schema)>), error)
DELETE/organization/admin\_api\_keys/{key\_id}
##### ModelsExpand Collapse
type AdminAPIKey struct{…}
Represents an individual Admin API key in an org.
ID string
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) id>)
CreatedAt int64
The Unix timestamp (in seconds) of when the API key was created
formatunixtime
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) created_at>)
LastUsedAt int64
The Unix timestamp (in seconds) of when the API key was last used
formatunixtime
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) last_used_at>)
Name string
The name of the API key
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) name>)
Object string
The object type, which is always `organization.admin\_api\_key`
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) object>)
Owner AdminAPIKeyOwner
ID stringOptional
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) id>)
CreatedAt int64Optional
The Unix timestamp (in seconds) of when the user was created
formatunixtime
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) created_at>)
Name stringOptional
The name of the user
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) name>)
Object stringOptional
The object type, which is always organization.user
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) object>)
Role stringOptional
Always `owner`
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) role>)
Type stringOptional
Always `user`
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) type>)
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner>)
RedactedValue string
The redacted value of the API key
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) redacted_value>)
Value stringOptional
The value of the API key. Only shown on create.
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) value>)
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema)>)