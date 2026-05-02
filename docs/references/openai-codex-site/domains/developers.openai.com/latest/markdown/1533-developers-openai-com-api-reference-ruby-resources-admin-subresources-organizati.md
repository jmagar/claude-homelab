Delete project service account | OpenAI API Reference
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
# Delete project service account
admin.organization.projects.service\_accounts.delete(service\_account\_id, \*\*kwargs) -\> [ServiceAccountDeleteResponse](</api/reference/ruby/resources/admin#(resource) admin.organization.projects.service_accounts > (model) service_account_delete_response > (schema)>) { id, deleted, object }
DELETE/organization/projects/{project\_id}/service\_accounts/{service\_account\_id}
Deletes a service account from the project.
Returns confirmation of service account deletion, or an error if the project
is archived (archived projects have no service accounts).
##### ParametersExpand Collapse
project\_id: String
[](<#(resource) admin.organization.projects.service_accounts > (method) delete > (params) default > (param) project_id > (schema)>)
service\_account\_id: String
[](<#(resource) admin.organization.projects.service_accounts > (method) delete > (params) default > (param) service_account_id > (schema)>)
##### ReturnsExpand Collapse
class ServiceAccountDeleteResponse { id, deleted, object }
id: String
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_delete_response > (schema) > (property) id>)
deleted: bool
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_delete_response > (schema) > (property) deleted>)
object: :"organization.project.service\_account.deleted"
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_delete_response > (schema)>)
### Delete project service account
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
service\_account = openai.admin.organization.projects.service\_accounts.delete("service\_account\_id", project\_id: "project\_id")
puts(service\_account)`
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