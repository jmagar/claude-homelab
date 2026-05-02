Create project role | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Admin](/api/reference/resources/admin)
[Organization](/api/reference/resources/admin/subresources/organization)
[Projects](/api/reference/resources/admin/subresources/organization/subresources/projects)
[Roles](/api/reference/resources/admin/subresources/organization/subresources/projects/subresources/roles)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create project role
POST/projects/{project\_id}/roles
Creates a custom role for a project.
##### Path ParametersExpand Collapse
project\_id: string
[](<#(resource) admin.organization.projects.roles > (method) create > (params) default > (param) project_id > (schema)>)
##### Body ParametersJSONExpand Collapse
permissions: array of string
Permissions to grant to the role.
[](<#(resource) admin.organization.projects.roles > (method) create > (params) 0 > (param) permissions > (schema)>)
role\_name: string
Unique name for the role.
[](<#(resource) admin.organization.projects.roles > (method) create > (params) 0 > (param) role_name > (schema)>)
description: optional string
Optional description of the role.
[](<#(resource) admin.organization.projects.roles > (method) create > (params) 0 > (param) description > (schema)>)
##### ReturnsExpand Collapse
Role object { id, description, name, 4 more }
Details about a role that can be assigned through the public Roles API.
id: string
Identifier for the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) id>)
description: string
Optional description of the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) description>)
name: string
Unique name for the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) name>)
object: "role"
Always `role`.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) object>)
permissions: array of string
Permissions granted by the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) permissions>)
predefined\_role: boolean
Whether the role is predefined and managed by OpenAI.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) predefined_role>)
resource\_type: string
Resource type the role is bound to (for example `api.organization` or `api.project`).
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) resource_type>)
[](<#(resource) admin.organization.roles > (model) role > (schema)>)
### Create project role
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
`curl -X POST https://api.openai.com/v1/projects/proj\_abc123/roles \\
-H "Authorization: Bearer $OPENAI\_ADMIN\_KEY" \\
-H "Content-Type: application/json" \\
-d '{
"role\_name": "API Project Key Manager",
"permissions": [
"api.organization.projects.api\_keys.read",
"api.organization.projects.api\_keys.write"
],
"description": "Allows managing API keys for the project"
}'
`
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