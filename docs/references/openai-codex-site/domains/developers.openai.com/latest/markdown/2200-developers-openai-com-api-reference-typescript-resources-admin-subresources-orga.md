Update project role | OpenAI API Reference
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
# Update project role
client.admin.organization.projects.roles.update(stringroleID, RoleUpdateParams { project\_id, description, permissions, role\_name } params, RequestOptionsoptions?): [Role](</api/reference/typescript/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) { id, description, name, 4 more }
POST/projects/{project\_id}/roles/{role\_id}
Updates an existing project role.
##### ParametersExpand Collapse
roleID: string
[](<#(resource) admin.organization.projects.roles > (method) update > (params) default > (param) role_id > (schema)>)
params: RoleUpdateParams { project\_id, description, permissions, role\_name }
project\_id: string
Path param: The ID of the project to update.
[](<#(resource) admin.organization.projects.roles > (method) update > (params) default > (param) project_id>)
description?: string | null
Body param: New description for the role.
[](<#(resource) admin.organization.projects.roles > (method) update > (params) default > (param) description>)
permissions?: Array\<string\> | null
Body param: Updated set of permissions for the role.
[](<#(resource) admin.organization.projects.roles > (method) update > (params) default > (param) permissions>)
role\_name?: string | null
Body param: New name for the role.
[](<#(resource) admin.organization.projects.roles > (method) update > (params) default > (param) role_name>)
[](<#(resource) admin.organization.projects.roles > (method) update > (params) default>)
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
### Update project role
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
const role = await client.admin.organization.projects.roles.update('role\_id', {
project\_id: 'project\_id',
});
console.log(role.id);`
```
```
`{
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
`
```
##### Returns Examples
```
`{
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
`
```