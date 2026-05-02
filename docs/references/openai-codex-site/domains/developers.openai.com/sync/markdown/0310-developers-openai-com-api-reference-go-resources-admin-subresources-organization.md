Delete project service account | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Admin](/api/reference/go/resources/admin)
[Organization](/api/reference/go/resources/admin/subresources/organization)
[Projects](/api/reference/go/resources/admin/subresources/organization/subresources/projects)
[Service Accounts](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/service_accounts)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete project service account
client.Admin.Organization.Projects.ServiceAccounts.Delete(ctx, projectID, serviceAccountID) (\*[AdminOrganizationProjectServiceAccountDeleteResponse](</api/reference/go/resources/admin#(resource) admin.organization.projects.service_accounts > (model) AdminOrganizationProjectServiceAccountDeleteResponse > (schema)>), error)
DELETE/organization/projects/{project\_id}/service\_accounts/{service\_account\_id}
Deletes a service account from the project.
Returns confirmation of service account deletion, or an error if the project
is archived (archived projects have no service accounts).
##### ParametersExpand Collapse
projectID string
[](<#(resource) admin.organization.projects.service_accounts > (method) delete > (params) default > (param) project_id > (schema)>)
serviceAccountID string
[](<#(resource) admin.organization.projects.service_accounts > (method) delete > (params) default > (param) service_account_id > (schema)>)
##### ReturnsExpand Collapse
type AdminOrganizationProjectServiceAccountDeleteResponse struct{…}
ID string
[](<#(resource) admin.organization.projects.service_accounts > (model) AdminOrganizationProjectServiceAccountDeleteResponse > (schema) > (property) id>)
Deleted bool
[](<#(resource) admin.organization.projects.service_accounts > (model) AdminOrganizationProjectServiceAccountDeleteResponse > (schema) > (property) deleted>)
Object OrganizationProjectServiceAccountDeleted
[](<#(resource) admin.organization.projects.service_accounts > (model) AdminOrganizationProjectServiceAccountDeleteResponse > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.service_accounts > (model) AdminOrganizationProjectServiceAccountDeleteResponse > (schema)>)
### Delete project service account
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
serviceAccount, err := client.Admin.Organization.Projects.ServiceAccounts.Delete(
context.TODO(),
"project\_id",
"service\_account\_id",
)
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", serviceAccount.ID)
}
`
```
```
`{
"object": "organization.project.service\_account.deleted",
"id": "svc\_acct\_abc",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"object": "organization.project.service\_account.deleted",
"id": "svc\_acct\_abc",
"deleted": true
}
`
```