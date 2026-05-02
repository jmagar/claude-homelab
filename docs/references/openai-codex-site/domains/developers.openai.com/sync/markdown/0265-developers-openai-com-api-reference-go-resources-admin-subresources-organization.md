Retrieve project service account | OpenAI API Reference
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
# Retrieve project service account
client.Admin.Organization.Projects.ServiceAccounts.Get(ctx, projectID, serviceAccountID) (\*[ProjectServiceAccount](</api/reference/go/resources/admin#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema)>), error)
GET/organization/projects/{project\_id}/service\_accounts/{service\_account\_id}
Retrieves a service account in the project.
##### ParametersExpand Collapse
projectID string
[](<#(resource) admin.organization.projects.service_accounts > (method) retrieve > (params) default > (param) project_id > (schema)>)
serviceAccountID string
[](<#(resource) admin.organization.projects.service_accounts > (method) retrieve > (params) default > (param) service_account_id > (schema)>)
##### ReturnsExpand Collapse
type ProjectServiceAccount struct{…}
Represents an individual service account in a project.
ID string
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) id>)
CreatedAt int64
The Unix timestamp (in seconds) of when the service account was created
formatunixtime
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) created_at>)
Name string
The name of the service account
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) name>)
Object OrganizationProjectServiceAccount
The object type, which is always `organization.project.service\_account`
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) object>)
Role ProjectServiceAccountRole
`owner` or `member`
One of the following:
const ProjectServiceAccountRoleOwner ProjectServiceAccountRole = "owner"
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role > (member) 0>)
const ProjectServiceAccountRoleMember ProjectServiceAccountRole = "member"
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema)>)
### Retrieve project service account
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
projectServiceAccount, err := client.Admin.Organization.Projects.ServiceAccounts.Get(
context.TODO(),
"project\_id",
"service\_account\_id",
)
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", projectServiceAccount.ID)
}
`
```
```
`{
"object": "organization.project.service\_account",
"id": "svc\_acct\_abc",
"name": "Service Account",
"role": "owner",
"created\_at": 1711471533
}
`
```
##### Returns Examples
```
`{
"object": "organization.project.service\_account",
"id": "svc\_acct\_abc",
"name": "Service Account",
"role": "owner",
"created\_at": 1711471533
}
`
```