Create project service account | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Admin](/api/reference/ruby/resources/admin)
[Organization](/api/reference/ruby/resources/admin/subresources/organization)
[Projects](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects)
[Service Accounts](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/service_accounts)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create project service account
admin.organization.projects.service\_accounts.create(project\_id, \*\*kwargs) -\> [ServiceAccountCreateResponse](</api/reference/ruby/resources/admin#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema)>) { id, api\_key, created\_at, 3 more }
POST/organization/projects/{project\_id}/service\_accounts
Creates a new service account in the project. This also returns an unredacted API key for the service account.
##### ParametersExpand Collapse
project\_id: String
[](<#(resource) admin.organization.projects.service_accounts > (method) create > (params) default > (param) project_id > (schema)>)
name: String
The name of the service account being created.
[](<#(resource) admin.organization.projects.service_accounts > (method) create > (params) default > (param) name > (schema)>)
##### ReturnsExpand Collapse
class ServiceAccountCreateResponse { id, api\_key, created\_at, 3 more }
id: String
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) id>)
api\_key: APIKey{ id, created\_at, name, 2 more}
id: String
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) api_key > (property) id>)
created\_at: Integer
formatunixtime
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) api_key > (property) created_at>)
name: String
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) api_key > (property) name>)
object: :"organization.project.service\_account.api\_key"
The object type, which is always `organization.project.service\_account.api\_key`
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) api_key > (property) object>)
value: String
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) api_key > (property) value>)
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) api_key>)
created\_at: Integer
formatunixtime
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) created_at>)
name: String
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) name>)
object: :"organization.project.service\_account"
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) object>)
role: :member
Service accounts can only have one role of type `member`
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema)>)
### Create project service account
Ruby
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
`require "openai"
openai = OpenAI::Client.new(admin\_api\_key: "My Admin API Key")
service\_account = openai.admin.organization.projects.service\_accounts.create("project\_id", name: "name")
puts(service\_account)`
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