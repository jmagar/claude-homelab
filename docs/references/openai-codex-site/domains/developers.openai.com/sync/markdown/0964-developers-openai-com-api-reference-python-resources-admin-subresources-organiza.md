Create project service account | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Admin](/api/reference/python/resources/admin)
[Organization](/api/reference/python/resources/admin/subresources/organization)
[Projects](/api/reference/python/resources/admin/subresources/organization/subresources/projects)
[Service Accounts](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/service_accounts)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create project service account
admin.organization.projects.service\_accounts.create(strproject\_id, ServiceAccountCreateParams\*\*kwargs) -\> [ServiceAccountCreateResponse](</api/reference/python/resources/admin#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema)>)
POST/organization/projects/{project\_id}/service\_accounts
Creates a new service account in the project. This also returns an unredacted API key for the service account.
##### ParametersExpand Collapse
project\_id: str
[](<#(resource) admin.organization.projects.service_accounts > (method) create > (params) default > (param) project_id > (schema)>)
name: str
The name of the service account being created.
[](<#(resource) admin.organization.projects.service_accounts > (method) create > (params) default > (param) name > (schema)>)
##### ReturnsExpand Collapse
class ServiceAccountCreateResponse: …
id: str
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) id>)
api\_key: APIKey
id: str
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) api_key > (property) id>)
created\_at: int
formatunixtime
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) api_key > (property) created_at>)
name: str
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) api_key > (property) name>)
object: Literal["organization.project.service\_account.api\_key"]
The object type, which is always `organization.project.service\_account.api\_key`
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) api_key > (property) object>)
value: str
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) api_key > (property) value>)
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) api_key>)
created\_at: int
formatunixtime
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) created_at>)
name: str
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) name>)
object: Literal["organization.project.service\_account"]
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) object>)
role: Literal["member"]
Service accounts can only have one role of type `member`
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema)>)
### Create project service account
Python
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
`import os
from openai import OpenAI
client = OpenAI(
admin\_api\_key=os.environ.get("OPENAI\_ADMIN\_KEY"), # This is the default and can be omitted
)
service\_account = client.admin.organization.projects.service\_accounts.create(
project\_id="project\_id",
name="name",
)
print(service\_account.id)`
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