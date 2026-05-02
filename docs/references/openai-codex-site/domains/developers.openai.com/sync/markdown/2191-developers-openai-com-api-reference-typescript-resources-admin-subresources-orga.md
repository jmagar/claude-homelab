Create project | OpenAI API Reference
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
# Create project
client.admin.organization.projects.create(ProjectCreateParams { name, geography } body, RequestOptionsoptions?): [Project](</api/reference/typescript/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>) { id, created\_at, name, 3 more }
POST/organization/projects
Create a new project in the organization. Projects can be created and archived, but cannot be deleted.
##### ParametersExpand Collapse
body: ProjectCreateParams { name, geography }
name: string
The friendly name of the project, this name appears in reports.
[](<#(resource) admin.organization.projects > (method) create > (params) default > (param) name>)
geography?: "US" | "EU" | "JP" | 5 more
Create the project with the specified data residency region. Your organization must have access to Data residency functionality in order to use. See [data residency controls](https://platform.openai.com/docs/guides/your-data#data-residency-controls) to review the functionality and limitations of setting this field.
One of the following:
"US"
[](<#(resource) admin.organization.projects > (method) create > (params) default > (param) geography > (schema) > (member) 0>)
"EU"
[](<#(resource) admin.organization.projects > (method) create > (params) default > (param) geography > (schema) > (member) 1>)
"JP"
[](<#(resource) admin.organization.projects > (method) create > (params) default > (param) geography > (schema) > (member) 2>)
"IN"
[](<#(resource) admin.organization.projects > (method) create > (params) default > (param) geography > (schema) > (member) 3>)
"KR"
[](<#(resource) admin.organization.projects > (method) create > (params) default > (param) geography > (schema) > (member) 4>)
"CA"
[](<#(resource) admin.organization.projects > (method) create > (params) default > (param) geography > (schema) > (member) 5>)
"AU"
[](<#(resource) admin.organization.projects > (method) create > (params) default > (param) geography > (schema) > (member) 6>)
"SG"
[](<#(resource) admin.organization.projects > (method) create > (params) default > (param) geography > (schema) > (member) 7>)
[](<#(resource) admin.organization.projects > (method) create > (params) default > (param) geography>)
[](<#(resource) admin.organization.projects > (method) create > (params) default>)
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
### Create project
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
const project = await client.admin.organization.projects.create({ name: 'name' });
console.log(project.id);`
```
```
`{
"id": "proj\_abc",
"object": "organization.project",
"name": "Project ABC",
"created\_at": 1711471533,
"archived\_at": null,
"status": "active"
}
`
```
##### Returns Examples
```
`{
"id": "proj\_abc",
"object": "organization.project",
"name": "Project ABC",
"created\_at": 1711471533,
"archived\_at": null,
"status": "active"
}
`
```