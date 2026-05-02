Delete project service account | OpenAI API Reference
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
# Delete project service account
DELETE/organization/projects/{project\_id}/service\_accounts/{service\_account\_id}
Deletes a service account from the project.
Returns confirmation of service account deletion, or an error if the project
is archived (archived projects have no service accounts).
##### Path ParametersExpand Collapse
project\_id: string
[](<#(resource) admin.organization.projects.service_accounts > (method) delete > (params) default > (param) project_id > (schema)>)
service\_account\_id: string
[](<#(resource) admin.organization.projects.service_accounts > (method) delete > (params) default > (param) service_account_id > (schema)>)
##### ReturnsExpand Collapse
id: string
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_delete_response > (schema) > (property) id>)
deleted: boolean
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_delete_response > (schema) > (property) deleted>)
object: "organization.project.service\_account.deleted"
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_delete_response > (schema) > (property) object>)
### Delete project service account
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
`curl -X DELETE https://api.openai.com/v1/organization/projects/proj\_abc/service\_accounts/svc\_acct\_abc \\
-H "Authorization: Bearer $OPENAI\_ADMIN\_KEY" \\
-H "Content-Type: application/json"
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