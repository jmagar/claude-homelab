List project service accounts | OpenAI API Reference
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
# List project service accounts
client.admin.organization.projects.serviceAccounts.list(stringprojectID, ServiceAccountListParams { after, limit } query?, RequestOptionsoptions?): ConversationCursorPage\<[ProjectServiceAccount](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema)>) { id, created\_at, name, 2 more } \>
GET/organization/projects/{project\_id}/service\_accounts
Returns a list of service accounts in the project.
##### ParametersExpand Collapse
projectID: string
[](<#(resource) admin.organization.projects.service_accounts > (method) list > (params) default > (param) project_id > (schema)>)
query: ServiceAccountListParams { after, limit }
after?: string
A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj\_foo, your subsequent call can include after=obj\_foo in order to fetch the next page of the list.
[](<#(resource) admin.organization.projects.service_accounts > (method) list > (params) default > (param) after>)
limit?: number
A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
[](<#(resource) admin.organization.projects.service_accounts > (method) list > (params) default > (param) limit>)
[](<#(resource) admin.organization.projects.service_accounts > (method) list > (params) default>)
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
### List project service accounts
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
// Automatically fetches more pages as needed.
for await (const projectServiceAccount of client.admin.organization.projects.serviceAccounts.list(
'project\_id',
)) {
console.log(projectServiceAccount.id);
}`
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