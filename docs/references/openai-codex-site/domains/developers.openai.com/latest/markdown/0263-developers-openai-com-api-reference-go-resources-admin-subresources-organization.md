Delete project API key | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Admin](/api/reference/go/resources/admin)
[Organization](/api/reference/go/resources/admin/subresources/organization)
[Projects](/api/reference/go/resources/admin/subresources/organization/subresources/projects)
[API Keys](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/api_keys)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete project API key
client.Admin.Organization.Projects.APIKeys.Delete(ctx, projectID, keyID) (\*[AdminOrganizationProjectAPIKeyDeleteResponse](</api/reference/go/resources/admin#(resource) admin.organization.projects.api_keys > (model) AdminOrganizationProjectAPIKeyDeleteResponse > (schema)>), error)
DELETE/organization/projects/{project\_id}/api\_keys/{key\_id}
Deletes an API key from the project.
Returns confirmation of the key deletion, or an error if the key belonged to
a service account.
##### ParametersExpand Collapse
projectID string
[](<#(resource) admin.organization.projects.api_keys > (method) delete > (params) default > (param) project_id > (schema)>)
keyID string
[](<#(resource) admin.organization.projects.api_keys > (method) delete > (params) default > (param) key_id > (schema)>)
##### ReturnsExpand Collapse
type AdminOrganizationProjectAPIKeyDeleteResponse struct{…}
ID string
[](<#(resource) admin.organization.projects.api_keys > (model) AdminOrganizationProjectAPIKeyDeleteResponse > (schema) > (property) id>)
Deleted bool
[](<#(resource) admin.organization.projects.api_keys > (model) AdminOrganizationProjectAPIKeyDeleteResponse > (schema) > (property) deleted>)
Object OrganizationProjectAPIKeyDeleted
[](<#(resource) admin.organization.projects.api_keys > (model) AdminOrganizationProjectAPIKeyDeleteResponse > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.api_keys > (model) AdminOrganizationProjectAPIKeyDeleteResponse > (schema)>)
### Delete project API key
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
apiKey, err := client.Admin.Organization.Projects.APIKeys.Delete(
context.TODO(),
"project\_id",
"key\_id",
)
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", apiKey.ID)
}
`
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