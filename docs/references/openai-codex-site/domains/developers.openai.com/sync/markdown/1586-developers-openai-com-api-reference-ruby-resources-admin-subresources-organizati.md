Create organization role | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Admin](/api/reference/ruby/resources/admin)
[Organization](/api/reference/ruby/resources/admin/subresources/organization)
[Roles](/api/reference/ruby/resources/admin/subresources/organization/subresources/roles)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create organization role
admin.organization.roles.create(\*\*kwargs) -\> [Role](</api/reference/ruby/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) { id, description, name, 4 more }
POST/organization/roles
Creates a custom role for the organization.
##### ParametersExpand Collapse
permissions: Array[String]
Permissions to grant to the role.
[](<#(resource) admin.organization.roles > (method) create > (params) default > (param) permissions > (schema)>)
role\_name: String
Unique name for the role.
[](<#(resource) admin.organization.roles > (method) create > (params) default > (param) role_name > (schema)>)
description: String
Optional description of the role.
[](<#(resource) admin.organization.roles > (method) create > (params) default > (param) description > (schema)>)
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
### Create organization role
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
role = openai.admin.organization.roles.create(permissions: ["string"], role\_name: "role\_name")
puts(role)`
```
```
`{
"object": "role",
"id": "role\_01J1F8ROLE01",
"name": "API Group Manager",
"description": "Allows managing organization groups",
"permissions": [
"api.groups.read",
"api.groups.write"
],
"resource\_type": "api.organization",
"predefined\_role": false
}
`
```
##### Returns Examples
```
`{
"object": "role",
"id": "role\_01J1F8ROLE01",
"name": "API Group Manager",
"description": "Allows managing organization groups",
"permissions": [
"api.groups.read",
"api.groups.write"
],
"resource\_type": "api.organization",
"predefined\_role": false
}
`
```