List projects | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Admin](/api/reference/typescript/resources/admin)
[Organization](/api/reference/typescript/resources/admin/subresources/organization)
[Projects](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List projects
client.admin.organization.projects.list(ProjectListParams { after, include\_archived, limit } query?, RequestOptionsoptions?): ConversationCursorPage\<[Project](</api/reference/typescript/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>) { id, created\_at, name, 3 more } \>
GET/organization/projects
Returns a list of projects.
##### ParametersExpand Collapse
query: ProjectListParams { after, include\_archived, limit }
after?: string
A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj\_foo, your subsequent call can include after=obj\_foo in order to fetch the next page of the list.
[](<#(resource) admin.organization.projects > (method) list > (params) default > (param) after>)
include\_archived?: boolean
If `true` returns all projects including those that have been `archived`. Archived projects are not included by default.
[](<#(resource) admin.organization.projects > (method) list > (params) default > (param) include_archived>)
limit?: number
A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
[](<#(resource) admin.organization.projects > (method) list > (params) default > (param) limit>)
[](<#(resource) admin.organization.projects > (method) list > (params) default>)
##### ReturnsExpand Collapse
Project { id, created\_at, name, 3 more }
Represents an individual project.
id: string
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) id>)
created\_at: number
The Unix timestamp (in seconds) of when the project was created.
formatunixtime
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) created_at>)
name: string
The name of the project. This appears in reporting.
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) name>)
object: "organization.project"
The object type, which is always `organization.project`
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) object>)
status: "active" | "archived"
`active` or `archived`
One of the following:
"active"
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) status > (member) 0>)
"archived"
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) status > (member) 1>)
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) status>)
archived\_at?: number | null
The Unix timestamp (in seconds) of when the project was archived or `null`.
formatunixtime
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) archived_at>)
[](<#(resource) admin.organization.projects > (model) project > (schema)>)
### List projects
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
for await (const project of client.admin.organization.projects.list()) {
console.log(project.id);
}`
```
```
`{
"object": "list",
"data": [
{
"id": "proj\_abc",
"object": "organization.project",
"name": "Project example",
"created\_at": 1711471533,
"archived\_at": null,
"status": "active"
}
],
"first\_id": "proj-abc",
"last\_id": "proj-xyz",
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
"id": "proj\_abc",
"object": "organization.project",
"name": "Project example",
"created\_at": 1711471533,
"archived\_at": null,
"status": "active"
}
],
"first\_id": "proj-abc",
"last\_id": "proj-xyz",
"has\_more": false
}
`
```