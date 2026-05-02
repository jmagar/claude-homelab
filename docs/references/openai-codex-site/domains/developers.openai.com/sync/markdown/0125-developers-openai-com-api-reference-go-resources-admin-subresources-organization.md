Delete admin API key | OpenAI API Reference
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
# Delete admin API key
client.Admin.Organization.AdminAPIKeys.Delete(ctx, keyID) (\*[AdminOrganizationAdminAPIKeyDeleteResponse](</api/reference/go/resources/admin#(resource) admin.organization.admin_api_keys > (model) AdminOrganizationAdminAPIKeyDeleteResponse > (schema)>), error)
DELETE/organization/admin\_api\_keys/{key\_id}
Delete an organization admin API key
##### ParametersExpand Collapse
keyID string
The ID of the API key to be deleted.
[](<#(resource) admin.organization.admin_api_keys > (method) delete > (params) default > (param) key_id > (schema)>)
##### ReturnsExpand Collapse
type AdminOrganizationAdminAPIKeyDeleteResponse struct{…}
ID stringOptional
[](<#(resource) admin.organization.admin_api_keys > (model) AdminOrganizationAdminAPIKeyDeleteResponse > (schema) > (property) id>)
Deleted boolOptional
[](<#(resource) admin.organization.admin_api_keys > (model) AdminOrganizationAdminAPIKeyDeleteResponse > (schema) > (property) deleted>)
Object stringOptional
[](<#(resource) admin.organization.admin_api_keys > (model) AdminOrganizationAdminAPIKeyDeleteResponse > (schema) > (property) object>)
[](<#(resource) admin.organization.admin_api_keys > (model) AdminOrganizationAdminAPIKeyDeleteResponse > (schema)>)
### Delete admin API key
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
adminAPIKey, err := client.Admin.Organization.AdminAPIKeys.Delete(context.TODO(), "key\_id")
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", adminAPIKey.ID)
}
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