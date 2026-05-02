Retrieve admin API key | OpenAI API Reference
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
# Retrieve admin API key
client.Admin.Organization.AdminAPIKeys.Get(ctx, keyID) (\*[AdminAPIKey](</api/reference/go/resources/admin#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema)>), error)
GET/organization/admin\_api\_keys/{key\_id}
Retrieve a single organization API key
##### ParametersExpand Collapse
keyID string
The ID of the API key.
[](<#(resource) admin.organization.admin_api_keys > (method) retrieve > (params) default > (param) key_id > (schema)>)
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
### Retrieve admin API key
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
adminAPIKey, err := client.Admin.Organization.AdminAPIKeys.Get(context.TODO(), "key\_id")
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", adminAPIKey.ID)
}
`
```
```
`{
"object": "organization.admin\_api\_key",
"id": "key\_abc",
"name": "Main Admin Key",
"redacted\_value": "sk-admin...xyz",
"created\_at": 1711471533,
"last\_used\_at": 1711471534,
"owner": {
"type": "user",
"object": "organization.user",
"id": "user\_123",
"name": "John Doe",
"created\_at": 1711471533,
"role": "owner"
}
}
`
```
##### Returns Examples
```
`{
"object": "organization.admin\_api\_key",
"id": "key\_abc",
"name": "Main Admin Key",
"redacted\_value": "sk-admin...xyz",
"created\_at": 1711471533,
"last\_used\_at": 1711471534,
"owner": {
"type": "user",
"object": "organization.user",
"id": "user\_123",
"name": "John Doe",
"created\_at": 1711471533,
"role": "owner"
}
}
`
```