Create project service account | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Admin](/api/reference/resources/admin)
[Organization](/api/reference/resources/admin/subresources/organization)
[Projects](/api/reference/resources/admin/subresources/organization/subresources/projects)
[Service Accounts](/api/reference/resources/admin/subresources/organization/subresources/projects/subresources/service_accounts)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create project service account
POST/organization/projects/{project\_id}/service\_accounts
Creates a new service account in the project. This also returns an unredacted API key for the service account.
##### Path ParametersExpand Collapse
project\_id: string
[](<#(resource) admin.organization.projects.service_accounts > (method) create > (params) default > (param) project_id > (schema)>)
##### Body ParametersJSONExpand Collapse
name: string
The name of the service account being created.
[](<#(resource) admin.organization.projects.service_accounts > (method) create > (params) 0 > (param) name > (schema)>)
##### ReturnsExpand Collapse
id: string
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) id>)
api\_key: object { id, created\_at, name, 2 more }
id: string
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) api_key > (property) id>)
created\_at: number
formatunixtime
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) api_key > (property) created_at>)
name: string
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) api_key > (property) name>)
object: "organization.project.service\_account.api\_key"
The object type, which is always `organization.project.service\_account.api\_key`
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) api_key > (property) object>)
value: string
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) api_key > (property) value>)
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) api_key>)
created\_at: number
formatunixtime
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) created_at>)
name: string
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) name>)
object: "organization.project.service\_account"
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) object>)
role: "member"
Service accounts can only have one role of type `member`
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) role>)
### Create project service account
HTTP
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
`curl -X POST https://api.openai.com/v1/organization/projects/proj\_abc/service\_accounts \\
-H "Authorization: Bearer $OPENAI\_ADMIN\_KEY" \\
-H "Content-Type: application/json" \\
-d '{
"name": "Production App"
}'
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