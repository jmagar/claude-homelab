Retrieve project service account | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Admin](/api/reference/typescript/resources/admin)
[Organization](/api/reference/typescript/resources/admin/subresources/organization)
[Projects](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects)
[Service Accounts](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/service_accounts)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Retrieve project service account
client.admin.organization.projects.serviceAccounts.retrieve(stringserviceAccountID, ServiceAccountRetrieveParams { project\_id } params, RequestOptionsoptions?): [ProjectServiceAccount](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema)>) { id, created\_at, name, 2 more }
GET/organization/projects/{project\_id}/service\_accounts/{service\_account\_id}
Retrieves a service account in the project.
##### ParametersExpand Collapse
serviceAccountID: string
[](<#(resource) admin.organization.projects.service_accounts > (method) retrieve > (params) default > (param) service_account_id > (schema)>)
params: ServiceAccountRetrieveParams { project\_id }
project\_id: string
The ID of the project.
[](<#(resource) admin.organization.projects.service_accounts > (method) retrieve > (params) default > (param) project_id>)
[](<#(resource) admin.organization.projects.service_accounts > (method) retrieve > (params) default>)
##### ReturnsExpand Collapse
ProjectServiceAccount { id, created\_at, name, 2 more }
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
role: "owner" | "member"
`owner` or `member`
One of the following:
"owner"
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role > (member) 0>)
"member"
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema)>)
### Retrieve project service account
TypeScript
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
`import OpenAI from 'openai';
const client = new OpenAI({
adminAPIKey: process.env['OPENAI\_ADMIN\_KEY'], // This is the default and can be omitted
});
const projectServiceAccount = await client.admin.organization.projects.serviceAccounts.retrieve(
'service\_account\_id',
{ project\_id: 'project\_id' },
);
console.log(projectServiceAccount.id);`
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