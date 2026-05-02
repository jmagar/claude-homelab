Assign project role to user | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Admin](/api/reference/resources/admin)
[Organization](/api/reference/resources/admin/subresources/organization)
[Projects](/api/reference/resources/admin/subresources/organization/subresources/projects)
[Users](/api/reference/resources/admin/subresources/organization/subresources/projects/subresources/users)
[Roles](/api/reference/resources/admin/subresources/organization/subresources/projects/subresources/users/subresources/roles)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Assign project role to user
POST/projects/{project\_id}/users/{user\_id}/roles
Assigns a project role to a user within a project.
##### Path ParametersExpand Collapse
project\_id: string
[](<#(resource) admin.organization.projects.users.roles > (method) create > (params) default > (param) project_id > (schema)>)
user\_id: string
[](<#(resource) admin.organization.projects.users.roles > (method) create > (params) default > (param) user_id > (schema)>)
##### Body ParametersJSONExpand Collapse
role\_id: string
Identifier of the role to assign.
[](<#(resource) admin.organization.projects.users.roles > (method) create > (params) 0 > (param) role_id > (schema)>)
##### ReturnsExpand Collapse
object: "user.role"
Always `user.role`.
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema) > (property) object>)
role: [Role](</api/reference/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) { id, description, name, 4 more }
Details about a role that can be assigned through the public Roles API.
id: string
Identifier for the role.
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) id>)
description: string
Optional description of the role.
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) description>)
name: string
Unique name for the role.
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) name>)
object: "role"
Always `role`.
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) object>)
permissions: array of string
Permissions granted by the role.
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) permissions>)
predefined\_role: boolean
Whether the role is predefined and managed by OpenAI.
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) predefined_role>)
resource\_type: string
Resource type the role is bound to (for example `api.organization` or `api.project`).
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) resource_type>)
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema) > (property) role>)
user: [OrganizationUser](</api/reference/resources/admin#(resource) admin.organization.users > (model) organization_user > (schema)>) { id, added\_at, email, 3 more }
Represents an individual `user` within an organization.
id: string
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema) > (property) user + (resource) admin.organization.users > (model) organization_user > (schema) > (property) id>)
added\_at: number
The Unix timestamp (in seconds) of when the user was added.
formatunixtime
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema) > (property) user + (resource) admin.organization.users > (model) organization_user > (schema) > (property) added_at>)
email: string
The email address of the user
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema) > (property) user + (resource) admin.organization.users > (model) organization_user > (schema) > (property) email>)
name: string
The name of the user
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema) > (property) user + (resource) admin.organization.users > (model) organization_user > (schema) > (property) name>)
object: "organization.user"
The object type, which is always `organization.user`
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema) > (property) user + (resource) admin.organization.users > (model) organization_user > (schema) > (property) object>)
role: "owner" or "reader"
`owner` or `reader`
One of the following:
"owner"
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema) > (property) user + (resource) admin.organization.users > (model) organization_user > (schema) > (property) role > (member) 0>)
"reader"
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema) > (property) user + (resource) admin.organization.users > (model) organization_user > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema) > (property) user + (resource) admin.organization.users > (model) organization_user > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema) > (property) user>)
### Assign project role to user
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
`curl -X POST https://api.openai.com/v1/projects/proj\_abc123/users/user\_abc123/roles \\
-H "Authorization: Bearer $OPENAI\_ADMIN\_KEY" \\
-H "Content-Type: application/json" \\
-d '{
"role\_id": "role\_01J1F8PROJ"
}'
`
```
```
`{
"object": "user.role",
"user": {
"object": "organization.user",
"id": "user\_abc123",
"name": "Ada Lovelace",
"email": "ada@example.com",
"role": "owner",
"added\_at": 1711470000
},
"role": {
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
}
`
```
##### Returns Examples
```
`{
"object": "user.role",
"user": {
"object": "organization.user",
"id": "user\_abc123",
"name": "Ada Lovelace",
"email": "ada@example.com",
"role": "owner",
"added\_at": 1711470000
},
"role": {
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
}
`
```