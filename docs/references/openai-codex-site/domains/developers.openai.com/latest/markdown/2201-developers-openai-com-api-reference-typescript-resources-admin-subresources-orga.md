List project roles | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Admin](/api/reference/typescript/resources/admin)
[Organization](/api/reference/typescript/resources/admin/subresources/organization)
[Projects](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects)
[Roles](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/roles)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List project roles
client.admin.organization.projects.roles.list(stringprojectID, RoleListParams { after, limit, order } query?, RequestOptionsoptions?): CursorPage\<[Role](</api/reference/typescript/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) { id, description, name, 4 more } \>
GET/projects/{project\_id}/roles
Lists the roles configured for a project.
##### ParametersExpand Collapse
projectID: string
[](<#(resource) admin.organization.projects.roles > (method) list > (params) default > (param) project_id > (schema)>)
query: RoleListParams { after, limit, order }
after?: string
Cursor for pagination. Provide the value from the previous response’s `next` field to continue listing roles.
[](<#(resource) admin.organization.projects.roles > (method) list > (params) default > (param) after>)
limit?: number
A limit on the number of roles to return. Defaults to 1000.
minimum0
maximum1000
[](<#(resource) admin.organization.projects.roles > (method) list > (params) default > (param) limit>)
order?: "asc" | "desc"
Sort order for the returned roles.
One of the following:
"asc"
[](<#(resource) admin.organization.projects.roles > (method) list > (params) default > (param) order > (schema) > (member) 0>)
"desc"
[](<#(resource) admin.organization.projects.roles > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) admin.organization.projects.roles > (method) list > (params) default > (param) order>)
[](<#(resource) admin.organization.projects.roles > (method) list > (params) default>)
##### ReturnsExpand Collapse
Role { id, description, name, 4 more }
Details about a role that can be assigned through the public Roles API.
id: string
Identifier for the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) id>)
description: string | null
Optional description of the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) description>)
name: string
Unique name for the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) name>)
object: "role"
Always `role`.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) object>)
permissions: Array\<string\>
Permissions granted by the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) permissions>)
predefined\_role: boolean
Whether the role is predefined and managed by OpenAI.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) predefined_role>)
resource\_type: string
Resource type the role is bound to (for example `api.organization` or `api.project`).
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) resource_type>)
[](<#(resource) admin.organization.roles > (model) role > (schema)>)
### List project roles
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
for await (const role of client.admin.organization.projects.roles.list('project\_id')) {
console.log(role.id);
}`
```
```
`{
"object": "list",
"data": [
{
"object": "role",
"id": "role\_01J1F8PROJ",
"name": "API Project Key Manager",
"description": "Allows managing API keys for the project",
"permissions": [
"api.organization.projects.api\_keys.read",
"api.organization.projects.api\_keys.write"
],
"resource\_type": "api.project",
"predefined\_role": false
}
],
"has\_more": false,
"next": null
}
`
```
##### Returns Examples
```
`{
"object": "list",
"data": [
{
"object": "role",
"id": "role\_01J1F8PROJ",
"name": "API Project Key Manager",
"description": "Allows managing API keys for the project",
"permissions": [
"api.organization.projects.api\_keys.read",
"api.organization.projects.api\_keys.write"
],
"resource\_type": "api.project",
"predefined\_role": false
}
],
"has\_more": false,
"next": null
}
`
```