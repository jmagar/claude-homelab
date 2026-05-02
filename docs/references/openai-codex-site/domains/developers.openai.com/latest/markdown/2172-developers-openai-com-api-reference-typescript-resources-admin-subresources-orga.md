Modify project | OpenAI API Reference
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
# Modify project
client.admin.organization.projects.update(stringprojectID, ProjectUpdateParams { name } body, RequestOptionsoptions?): [Project](</api/reference/typescript/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>) { id, created\_at, name, 3 more }
POST/organization/projects/{project\_id}
Modifies a project in the organization.
##### ParametersExpand Collapse
projectID: string
[](<#(resource) admin.organization.projects > (method) update > (params) default > (param) project_id > (schema)>)
body: ProjectUpdateParams { name }
name: string
The updated name of the project, this name appears in reports.
[](<#(resource) admin.organization.projects > (method) update > (params) default > (param) name>)
[](<#(resource) admin.organization.projects > (method) update > (params) default>)
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
### Modify project
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
const project = await client.admin.organization.projects.update('project\_id', { name: 'name' });
console.log(project.id);`
```
200 example
```
`{
"id": "id",
"created\_at": 0,
"name": "name",
"object": "organization.project",
"status": "active",
"archived\_at": 0
}`
```
##### Returns Examples
200 example
```
`{
"id": "id",
"created\_at": 0,
"name": "name",
"object": "organization.project",
"status": "active",
"archived\_at": 0
}`
```