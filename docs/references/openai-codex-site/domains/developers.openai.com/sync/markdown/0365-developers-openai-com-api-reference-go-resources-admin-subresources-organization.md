List project API keys | OpenAI API Reference
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
# List project API keys
client.Admin.Organization.Projects.APIKeys.List(ctx, projectID, query) (\*ConversationCursorPage[[ProjectAPIKey](</api/reference/go/resources/admin#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema)>)], error)
GET/organization/projects/{project\_id}/api\_keys
Returns a list of API keys in the project.
##### ParametersExpand Collapse
projectID string
[](<#(resource) admin.organization.projects.api_keys > (method) list > (params) default > (param) project_id > (schema)>)
query AdminOrganizationProjectAPIKeyListParams
After param.Field[string]Optional
A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj\_foo, your subsequent call can include after=obj\_foo in order to fetch the next page of the list.
[](<#(resource) admin.organization.projects.api_keys > (method) list > (params) default > (param) after>)
Limit param.Field[int64]Optional
A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
[](<#(resource) admin.organization.projects.api_keys > (method) list > (params) default > (param) limit>)
[](<#(resource) admin.organization.projects.api_keys > (method) list > (params) default>)
##### ReturnsExpand Collapse
type ProjectAPIKey struct{…}
Represents an individual API key in a project.
ID string
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) id>)
CreatedAt int64
The Unix timestamp (in seconds) of when the API key was created
formatunixtime
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) created_at>)
LastUsedAt int64
The Unix timestamp (in seconds) of when the API key was last used.
formatunixtime
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) last_used_at>)
Name string
The name of the API key
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) name>)
Object OrganizationProjectAPIKey
The object type, which is always `organization.project.api\_key`
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) object>)
Owner ProjectAPIKeyOwner
ServiceAccount [ProjectServiceAccount](</api/reference/go/resources/admin#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema)>)Optional
Represents an individual service account in a project.
ID string
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) service_account + (resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) id>)
CreatedAt int64
The Unix timestamp (in seconds) of when the service account was created
formatunixtime
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) service_account + (resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) created_at>)
Name string
The name of the service account
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) service_account + (resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) name>)
Object OrganizationProjectServiceAccount
The object type, which is always `organization.project.service\_account`
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) service_account + (resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) object>)
Role ProjectServiceAccountRole
`owner` or `member`
One of the following:
const ProjectServiceAccountRoleOwner ProjectServiceAccountRole = "owner"
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) service_account + (resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role > (member) 0>)
const ProjectServiceAccountRoleMember ProjectServiceAccountRole = "member"
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) service_account + (resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) service_account + (resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) service_account>)
Type stringOptional
`user` or `service\_account`
One of the following:
const ProjectAPIKeyOwnerTypeUser ProjectAPIKeyOwnerType = "user"
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) type > (member) 0>)
const ProjectAPIKeyOwnerTypeServiceAccount ProjectAPIKeyOwnerType = "service\_account"
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) type > (member) 1>)
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) type>)
User [ProjectUser](</api/reference/go/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>)Optional
Represents an individual user in a project.
ID string
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) user + (resource) admin.organization.projects.users > (model) project_user > (schema) > (property) id>)
AddedAt int64
The Unix timestamp (in seconds) of when the project was added.
formatunixtime
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) user + (resource) admin.organization.projects.users > (model) project_user > (schema) > (property) added_at>)
Email string
The email address of the user
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) user + (resource) admin.organization.projects.users > (model) project_user > (schema) > (property) email>)
Name string
The name of the user
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) user + (resource) admin.organization.projects.users > (model) project_user > (schema) > (property) name>)
Object OrganizationProjectUser
The object type, which is always `organization.project.user`
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) user + (resource) admin.organization.projects.users > (model) project_user > (schema) > (property) object>)
Role ProjectUserRole
`owner` or `member`
One of the following:
const ProjectUserRoleOwner ProjectUserRole = "owner"
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) user + (resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role > (member) 0>)
const ProjectUserRoleMember ProjectUserRole = "member"
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) user + (resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) user + (resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) user>)
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner>)
RedactedValue string
The redacted value of the API key
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) redacted_value>)
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema)>)
### List project API keys
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
page, err := client.Admin.Organization.Projects.APIKeys.List(
context.TODO(),
"project\_id",
openai.AdminOrganizationProjectAPIKeyListParams{
},
)
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
"object": "organization.project.api\_key",
"redacted\_value": "sk-abc...def",
"name": "My API Key",
"created\_at": 1711471533,
"last\_used\_at": 1711471534,
"id": "key\_abc",
"owner": {
"type": "user",
"user": {
"object": "organization.project.user",
"id": "user\_abc",
"name": "First Last",
"email": "user@example.com",
"role": "owner",
"added\_at": 1711471533
}
}
}
],
"first\_id": "key\_abc",
"last\_id": "key\_xyz",
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
"object": "organization.project.api\_key",
"redacted\_value": "sk-abc...def",
"name": "My API Key",
"created\_at": 1711471533,
"last\_used\_at": 1711471534,
"id": "key\_abc",
"owner": {
"type": "user",
"user": {
"object": "organization.project.user",
"id": "user\_abc",
"name": "First Last",
"email": "user@example.com",
"role": "owner",
"added\_at": 1711471533
}
}
}
],
"first\_id": "key\_abc",
"last\_id": "key\_xyz",
"has\_more": false
}
`
```