List project service accounts | OpenAI API Reference
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
# List project service accounts
GET/organization/projects/{project\_id}/service\_accounts
Returns a list of service accounts in the project.
##### Path ParametersExpand Collapse
project\_id: string
[](<#(resource) admin.organization.projects.service_accounts > (method) list > (params) default > (param) project_id > (schema)>)
##### Query ParametersExpand Collapse
after: optional string
A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj\_foo, your subsequent call can include after=obj\_foo in order to fetch the next page of the list.
[](<#(resource) admin.organization.projects.service_accounts > (method) list > (params) default > (param) after > (schema)>)
limit: optional number
A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
[](<#(resource) admin.organization.projects.service_accounts > (method) list > (params) default > (param) limit > (schema)>)
##### ReturnsExpand Collapse
data: array of [ProjectServiceAccount](</api/reference/resources/admin#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema)>) { id, created\_at, name, 2 more }
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
[](<#(resource) admin.organization.projects.service_accounts > (method) list > (network schema) > (property) data>)
first\_id: string
[](<#(resource) admin.organization.projects.service_accounts > (method) list > (network schema) > (property) first_id>)
has\_more: boolean
[](<#(resource) admin.organization.projects.service_accounts > (method) list > (network schema) > (property) has_more>)
last\_id: string
[](<#(resource) admin.organization.projects.service_accounts > (method) list > (network schema) > (property) last_id>)
object: "list"
[](<#(resource) admin.organization.projects.service_accounts > (method) list > (network schema) > (property) object>)
### List project service accounts
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
`curl https://api.openai.com/v1/organization/projects/proj\_abc/service\_accounts?after=custom\_id&limit=20 \\
-H "Authorization: Bearer $OPENAI\_ADMIN\_KEY" \\
-H "Content-Type: application/json"
`
```
```
`{
"object": "list",
"data": [
{
"object": "organization.project.service\_account",
"id": "svc\_acct\_abc",
"name": "Service Account",
"role": "owner",
"created\_at": 1711471533
}
],
"first\_id": "svc\_acct\_abc",
"last\_id": "svc\_acct\_xyz",
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
"object": "organization.project.service\_account",
"id": "svc\_acct\_abc",
"name": "Service Account",
"role": "owner",
"created\_at": 1711471533
}
],
"first\_id": "svc\_acct\_abc",
"last\_id": "svc\_acct\_xyz",
"has\_more": false
}
`
```