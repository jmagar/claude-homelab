Retrieve project service account | OpenAI API Reference
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
# Retrieve project service account
admin.organization.projects.service\_accounts.retrieve(strservice\_account\_id, ServiceAccountRetrieveParams\*\*kwargs) -\> [ProjectServiceAccount](</api/reference/python/resources/admin#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema)>)
GET/organization/projects/{project\_id}/service\_accounts/{service\_account\_id}
Retrieves a service account in the project.
##### ParametersExpand Collapse
project\_id: str
[](<#(resource) admin.organization.projects.service_accounts > (method) retrieve > (params) default > (param) project_id > (schema)>)
service\_account\_id: str
[](<#(resource) admin.organization.projects.service_accounts > (method) retrieve > (params) default > (param) service_account_id > (schema)>)
##### ReturnsExpand Collapse
class ProjectServiceAccount: …
Represents an individual service account in a project.
id: str
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) id>)
created\_at: int
The Unix timestamp (in seconds) of when the service account was created
formatunixtime
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) created_at>)
name: str
The name of the service account
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) name>)
object: Literal["organization.project.service\_account"]
The object type, which is always `organization.project.service\_account`
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) object>)
role: Literal["owner", "member"]
`owner` or `member`
One of the following:
"owner"
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role > (member) 0>)
"member"
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema)>)
### Retrieve project service account
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
project\_service\_account = client.admin.organization.projects.service\_accounts.retrieve(
service\_account\_id="service\_account\_id",
project\_id="project\_id",
)
print(project\_service\_account.id)`
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