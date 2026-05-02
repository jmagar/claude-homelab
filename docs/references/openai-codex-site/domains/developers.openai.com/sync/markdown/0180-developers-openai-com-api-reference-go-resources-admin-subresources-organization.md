List all organization and project API keys. | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Admin](/api/reference/go/resources/admin)
[Organization](/api/reference/go/resources/admin/subresources/organization)
[Admin API Keys](/api/reference/go/resources/admin/subresources/organization/subresources/admin_api_keys)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List all organization and project API keys.
client.Admin.Organization.AdminAPIKeys.List(ctx, query) (\*CursorPage[[AdminAPIKey](</api/reference/go/resources/admin#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema)>)], error)
GET/organization/admin\_api\_keys
List organization API keys
##### ParametersExpand Collapse
query AdminOrganizationAdminAPIKeyListParams
After param.Field[string]Optional
Return keys with IDs that come after this ID in the pagination order.
[](<#(resource) admin.organization.admin_api_keys > (method) list > (params) default > (param) after>)
Limit param.Field[int64]Optional
Maximum number of keys to return.
[](<#(resource) admin.organization.admin_api_keys > (method) list > (params) default > (param) limit>)
Order param.Field[[AdminOrganizationAdminAPIKeyListParamsOrder](</api/reference/go/resources/admin/subresources/organization/subresources/admin_api_keys/methods/list#(resource) admin.organization.admin_api_keys > (method) list > (params) default > (param) order > (schema)>)]Optional
Order results by creation time, ascending or descending.
const AdminOrganizationAdminAPIKeyListParamsOrderAsc [AdminOrganizationAdminAPIKeyListParamsOrder](</api/reference/go/resources/admin/subresources/organization/subresources/admin_api_keys/methods/list#(resource) admin.organization.admin_api_keys > (method) list > (params) default > (param) order > (schema)>) = "asc"
[](<#(resource) admin.organization.admin_api_keys > (method) list > (params) default > (param) order > (schema) > (member) 0>)
const AdminOrganizationAdminAPIKeyListParamsOrderDesc [AdminOrganizationAdminAPIKeyListParamsOrder](</api/reference/go/resources/admin/subresources/organization/subresources/admin_api_keys/methods/list#(resource) admin.organization.admin_api_keys > (method) list > (params) default > (param) order > (schema)>) = "desc"
[](<#(resource) admin.organization.admin_api_keys > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) admin.organization.admin_api_keys > (method) list > (params) default > (param) order>)
[](<#(resource) admin.organization.admin_api_keys > (method) list > (params) default>)
##### ReturnsExpand Collapse
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
### List all organization and project API keys.
Go
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
`package main
import (
"context"
"fmt"
"github.com/openai/openai-go"
"github.com/openai/openai-go/option"
)
func main() {
client := openai.NewClient(
option.WithAdminAPIKey("My Admin API Key"),
)
page, err := client.Admin.Organization.AdminAPIKeys.List(context.TODO(), openai.AdminOrganizationAdminAPIKeyListParams{
})
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", page)
}
`
```
```
`{
"object": "list",
"data": [
{
"object": "organization.admin\_api\_key",
"id": "key\_abc",
"name": "Main Admin Key",
"redacted\_value": "sk-admin...def",
"created\_at": 1711471533,
"last\_used\_at": 1711471534,
"owner": {
"type": "service\_account",
"object": "organization.service\_account",
"id": "sa\_456",
"name": "My Service Account",
"created\_at": 1711471533,
"role": "member"
}
}
],
"first\_id": "key\_abc",
"last\_id": "key\_abc",
"has\_more": false
}
`
```
##### Returns Examples
```
`{
"object": "list",
"data": [
{
"object": "organization.admin\_api\_key",
"id": "key\_abc",
"name": "Main Admin Key",
"redacted\_value": "sk-admin...def",
"created\_at": 1711471533,
"last\_used\_at": 1711471534,
"owner": {
"type": "service\_account",
"object": "organization.service\_account",
"id": "sa\_456",
"name": "My Service Account",
"created\_at": 1711471533,
"role": "member"
}
}
],
"first\_id": "key\_abc",
"last\_id": "key\_abc",
"has\_more": false
}
`
```