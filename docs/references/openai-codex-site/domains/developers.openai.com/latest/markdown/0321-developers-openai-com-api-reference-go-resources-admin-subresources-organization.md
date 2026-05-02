Create project service account | OpenAI API Reference
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
# Create project service account
client.Admin.Organization.Projects.ServiceAccounts.New(ctx, projectID, body) (\*[AdminOrganizationProjectServiceAccountNewResponse](</api/reference/go/resources/admin#(resource) admin.organization.projects.service_accounts > (model) AdminOrganizationProjectServiceAccountNewResponse > (schema)>), error)
POST/organization/projects/{project\_id}/service\_accounts
Creates a new service account in the project. This also returns an unredacted API key for the service account.
##### ParametersExpand Collapse
projectID string
[](<#(resource) admin.organization.projects.service_accounts > (method) create > (params) default > (param) project_id > (schema)>)
body AdminOrganizationProjectServiceAccountNewParams
Name param.Field[string]
The name of the service account being created.
[](<#(resource) admin.organization.projects.service_accounts > (method) create > (params) default > (param) name>)
[](<#(resource) admin.organization.projects.service_accounts > (method) create > (params) default>)
##### ReturnsExpand Collapse
type AdminOrganizationProjectServiceAccountNewResponse struct{…}
ID string
[](<#(resource) admin.organization.projects.service_accounts > (model) AdminOrganizationProjectServiceAccountNewResponse > (schema) > (property) id>)
APIKey AdminOrganizationProjectServiceAccountNewResponseAPIKey
ID string
[](<#(resource) admin.organization.projects.service_accounts > (model) AdminOrganizationProjectServiceAccountNewResponse > (schema) > (property) api_key > (property) id>)
CreatedAt int64
formatunixtime
[](<#(resource) admin.organization.projects.service_accounts > (model) AdminOrganizationProjectServiceAccountNewResponse > (schema) > (property) api_key > (property) created_at>)
Name string
[](<#(resource) admin.organization.projects.service_accounts > (model) AdminOrganizationProjectServiceAccountNewResponse > (schema) > (property) api_key > (property) name>)
Object OrganizationProjectServiceAccountAPIKey
The object type, which is always `organization.project.service\_account.api\_key`
[](<#(resource) admin.organization.projects.service_accounts > (model) AdminOrganizationProjectServiceAccountNewResponse > (schema) > (property) api_key > (property) object>)
Value string
[](<#(resource) admin.organization.projects.service_accounts > (model) AdminOrganizationProjectServiceAccountNewResponse > (schema) > (property) api_key > (property) value>)
[](<#(resource) admin.organization.projects.service_accounts > (model) AdminOrganizationProjectServiceAccountNewResponse > (schema) > (property) api_key>)
CreatedAt int64
formatunixtime
[](<#(resource) admin.organization.projects.service_accounts > (model) AdminOrganizationProjectServiceAccountNewResponse > (schema) > (property) created_at>)
Name string
[](<#(resource) admin.organization.projects.service_accounts > (model) AdminOrganizationProjectServiceAccountNewResponse > (schema) > (property) name>)
Object OrganizationProjectServiceAccount
[](<#(resource) admin.organization.projects.service_accounts > (model) AdminOrganizationProjectServiceAccountNewResponse > (schema) > (property) object>)
Role Member
Service accounts can only have one role of type `member`
[](<#(resource) admin.organization.projects.service_accounts > (model) AdminOrganizationProjectServiceAccountNewResponse > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.service_accounts > (model) AdminOrganizationProjectServiceAccountNewResponse > (schema)>)
### Create project service account
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
serviceAccount, err := client.Admin.Organization.Projects.ServiceAccounts.New(
context.TODO(),
"project\_id",
openai.AdminOrganizationProjectServiceAccountNewParams{
Name: "name",
},
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
"object": "organization.project.service\_account",
"id": "svc\_acct\_abc",
"name": "Production App",
"role": "member",
"created\_at": 1711471533,
"api\_key": {
"object": "organization.project.service\_account.api\_key",
"value": "sk-abcdefghijklmnop123",
"name": "Secret Key",
"created\_at": 1711471533,
"id": "key\_abc"
}
}
`
```
##### Returns Examples
```
`{
"object": "organization.project.service\_account",
"id": "svc\_acct\_abc",
"name": "Production App",
"role": "member",
"created\_at": 1711471533,
"api\_key": {
"object": "organization.project.service\_account.api\_key",
"value": "sk-abcdefghijklmnop123",
"name": "Secret Key",
"created\_at": 1711471533,
"id": "key\_abc"
}
}
`
```