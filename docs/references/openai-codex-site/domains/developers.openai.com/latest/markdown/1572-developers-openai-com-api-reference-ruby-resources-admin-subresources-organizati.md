Update project role | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Admin](/api/reference/ruby/resources/admin)
[Organization](/api/reference/ruby/resources/admin/subresources/organization)
[Projects](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects)
[Roles](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/roles)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Update project role
admin.organization.projects.roles.update(role\_id, \*\*kwargs) -\> [Role](</api/reference/ruby/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) { id, description, name, 4 more }
POST/projects/{project\_id}/roles/{role\_id}
Updates an existing project role.
##### ParametersExpand Collapse
project\_id: String
[](<#(resource) admin.organization.projects.roles > (method) update > (params) default > (param) project_id > (schema)>)
role\_id: String
[](<#(resource) admin.organization.projects.roles > (method) update > (params) default > (param) role_id > (schema)>)
description: String
New description for the role.
[](<#(resource) admin.organization.projects.roles > (method) update > (params) default > (param) description > (schema)>)
permissions: Array[String]
Updated set of permissions for the role.
[](<#(resource) admin.organization.projects.roles > (method) update > (params) default > (param) permissions > (schema)>)
role\_name: String
New name for the role.
[](<#(resource) admin.organization.projects.roles > (method) update > (params) default > (param) role_name > (schema)>)
##### ReturnsExpand Collapse
class Role { id, description, name, 4 more }
Details about a role that can be assigned through the public Roles API.
id: String
Identifier for the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) id>)
description: String
Optional description of the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) description>)
name: String
Unique name for the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) name>)
object: :role
Always `role`.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) object>)
permissions: Array[String]
Permissions granted by the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) permissions>)
predefined\_role: bool
Whether the role is predefined and managed by OpenAI.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) predefined_role>)
resource\_type: String
Resource type the role is bound to (for example `api.organization` or `api.project`).
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) resource_type>)
[](<#(resource) admin.organization.roles > (model) role > (schema)>)
### Update project role
Ruby
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
`require "openai"
openai = OpenAI::Client.new(admin\_api\_key: "My Admin API Key")
role = openai.admin.organization.projects.roles.update("role\_id", project\_id: "project\_id")
puts(role)`
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