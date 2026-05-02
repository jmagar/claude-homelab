Retrieve project service account | OpenAI API Reference
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
# Retrieve project service account
GET/organization/projects/{project\_id}/service\_accounts/{service\_account\_id}
Retrieves a service account in the project.
##### Path ParametersExpand Collapse
project\_id: string
[](<#(resource) admin.organization.projects.service_accounts > (method) retrieve > (params) default > (param) project_id > (schema)>)
service\_account\_id: string
[](<#(resource) admin.organization.projects.service_accounts > (method) retrieve > (params) default > (param) service_account_id > (schema)>)
##### ReturnsExpand Collapse
ProjectServiceAccount object { id, created\_at, name, 2 more }
Represents an individual service account in a project.
id: string
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) id>)
created\_at: number
The Unix timestamp (in seconds) of when the service account was created
formatunixtime
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) created_at>)
name: string
The name of the service account
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) name>)
object: "organization.project.service\_account"
The object type, which is always `organization.project.service\_account`
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) object>)
role: "owner" or "member"
`owner` or `member`
One of the following:
"owner"
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role > (member) 0>)
"member"
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema)>)
### Retrieve project service account
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
`curl https://api.openai.com/v1/organization/projects/proj\_abc/service\_accounts/svc\_acct\_abc \\
-H "Authorization: Bearer $OPENAI\_ADMIN\_KEY" \\
-H "Content-Type: application/json"
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