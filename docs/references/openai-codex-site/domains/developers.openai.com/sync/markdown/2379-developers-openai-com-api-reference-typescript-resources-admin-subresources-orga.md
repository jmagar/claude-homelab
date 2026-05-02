Assign organization role to user | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Admin](/api/reference/typescript/resources/admin)
[Organization](/api/reference/typescript/resources/admin/subresources/organization)
[Users](/api/reference/typescript/resources/admin/subresources/organization/subresources/users)
[Roles](/api/reference/typescript/resources/admin/subresources/organization/subresources/users/subresources/roles)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Assign organization role to user
client.admin.organization.users.roles.create(stringuserID, RoleCreateParams { role\_id } body, RequestOptionsoptions?): [RoleCreateResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.users.roles > (model) role_create_response > (schema)>) { object, role, user }
POST/organization/users/{user\_id}/roles
Assigns an organization role to a user within the organization.
##### ParametersExpand Collapse
userID: string
[](<#(resource) admin.organization.users.roles > (method) create > (params) default > (param) user_id > (schema)>)
body: RoleCreateParams { role\_id }
role\_id: string
Identifier of the role to assign.
[](<#(resource) admin.organization.users.roles > (method) create > (params) default > (param) role_id>)
[](<#(resource) admin.organization.users.roles > (method) create > (params) default>)
##### ReturnsExpand Collapse
RoleCreateResponse { object, role, user }
Role assignment linking a user to a role.
object: "user.role"
Always `user.role`.
[](<#(resource) admin.organization.users.roles > (model) role_create_response > (schema) > (property) object>)
role: [Role](</api/reference/typescript/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) { id, description, name, 4 more }
Details about a role that can be assigned through the public Roles API.
id: string
Identifier for the role.
[](<#(resource) admin.organization.users.roles > (model) role_create_response > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) id>)
description: string | null
Optional description of the role.
[](<#(resource) admin.organization.users.roles > (model) role_create_response > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) description>)
name: string
Unique name for the role.
[](<#(resource) admin.organization.users.roles > (model) role_create_response > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) name>)
object: "role"
Always `role`.
[](<#(resource) admin.organization.users.roles > (model) role_create_response > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) object>)
permissions: Array\<string\>
Permissions granted by the role.
[](<#(resource) admin.organization.users.roles > (model) role_create_response > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) permissions>)
predefined\_role: boolean
Whether the role is predefined and managed by OpenAI.
[](<#(resource) admin.organization.users.roles > (model) role_create_response > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) predefined_role>)
resource\_type: string
Resource type the role is bound to (for example `api.organization` or `api.project`).
[](<#(resource) admin.organization.users.roles > (model) role_create_response > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) resource_type>)
[](<#(resource) admin.organization.users.roles > (model) role_create_response > (schema) > (property) role>)
user: [OrganizationUser](</api/reference/typescript/resources/admin#(resource) admin.organization.users > (model) organization_user > (schema)>) { id, added\_at, email, 3 more }
Represents an individual `user` within an organization.
id: string
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.users.roles > (model) role_create_response > (schema) > (property) user + (resource) admin.organization.users > (model) organization_user > (schema) > (property) id>)
added\_at: number
The Unix timestamp (in seconds) of when the user was added.
formatunixtime
[](<#(resource) admin.organization.users.roles > (model) role_create_response > (schema) > (property) user + (resource) admin.organization.users > (model) organization_user > (schema) > (property) added_at>)
email: string
The email address of the user
[](<#(resource) admin.organization.users.roles > (model) role_create_response > (schema) > (property) user + (resource) admin.organization.users > (model) organization_user > (schema) > (property) email>)
name: string
The name of the user
[](<#(resource) admin.organization.users.roles > (model) role_create_response > (schema) > (property) user + (resource) admin.organization.users > (model) organization_user > (schema) > (property) name>)
object: "organization.user"
The object type, which is always `organization.user`
[](<#(resource) admin.organization.users.roles > (model) role_create_response > (schema) > (property) user + (resource) admin.organization.users > (model) organization_user > (schema) > (property) object>)
role: "owner" | "reader"
`owner` or `reader`
One of the following:
"owner"
[](<#(resource) admin.organization.users.roles > (model) role_create_response > (schema) > (property) user + (resource) admin.organization.users > (model) organization_user > (schema) > (property) role > (member) 0>)
"reader"
[](<#(resource) admin.organization.users.roles > (model) role_create_response > (schema) > (property) user + (resource) admin.organization.users > (model) organization_user > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.users.roles > (model) role_create_response > (schema) > (property) user + (resource) admin.organization.users > (model) organization_user > (schema) > (property) role>)
[](<#(resource) admin.organization.users.roles > (model) role_create_response > (schema) > (property) user>)
[](<#(resource) admin.organization.users.roles > (model) role_create_response > (schema)>)
### Assign organization role to user
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
const role = await client.admin.organization.users.roles.create('user\_id', { role\_id: 'role\_id' });
console.log(role.object);`
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
}
`
```