Delete project service account | OpenAI API Reference
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
# Delete project service account
admin.organization.projects.service\_accounts.delete(strservice\_account\_id, ServiceAccountDeleteParams\*\*kwargs) -\> [ServiceAccountDeleteResponse](</api/reference/python/resources/admin#(resource) admin.organization.projects.service_accounts > (model) service_account_delete_response > (schema)>)
DELETE/organization/projects/{project\_id}/service\_accounts/{service\_account\_id}
Deletes a service account from the project.
Returns confirmation of service account deletion, or an error if the project
is archived (archived projects have no service accounts).
##### ParametersExpand Collapse
project\_id: str
[](<#(resource) admin.organization.projects.service_accounts > (method) delete > (params) default > (param) project_id > (schema)>)
service\_account\_id: str
[](<#(resource) admin.organization.projects.service_accounts > (method) delete > (params) default > (param) service_account_id > (schema)>)
##### ReturnsExpand Collapse
class ServiceAccountDeleteResponse: …
id: str
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_delete_response > (schema) > (property) id>)
deleted: bool
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_delete_response > (schema) > (property) deleted>)
object: Literal["organization.project.service\_account.deleted"]
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_delete_response > (schema)>)
### Delete project service account
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
service\_account = client.admin.organization.projects.service\_accounts.delete(
service\_account\_id="service\_account\_id",
project\_id="project\_id",
)
print(service\_account.id)`
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