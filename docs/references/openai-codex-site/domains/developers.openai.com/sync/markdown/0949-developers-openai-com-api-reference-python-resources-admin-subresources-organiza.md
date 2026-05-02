Assign project role to user | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Admin](/api/reference/python/resources/admin)
[Organization](/api/reference/python/resources/admin/subresources/organization)
[Projects](/api/reference/python/resources/admin/subresources/organization/subresources/projects)
[Users](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/users)
[Roles](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/users/subresources/roles)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Assign project role to user
admin.organization.projects.users.roles.create(struser\_id, RoleCreateParams\*\*kwargs) -\> [RoleCreateResponse](</api/reference/python/resources/admin#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema)>)
POST/projects/{project\_id}/users/{user\_id}/roles
Assigns a project role to a user within a project.
##### ParametersExpand Collapse
project\_id: str
[](<#(resource) admin.organization.projects.users.roles > (method) create > (params) default > (param) project_id > (schema)>)
user\_id: str
[](<#(resource) admin.organization.projects.users.roles > (method) create > (params) default > (param) user_id > (schema)>)
role\_id: str
Identifier of the role to assign.
[](<#(resource) admin.organization.projects.users.roles > (method) create > (params) default > (param) role_id > (schema)>)
##### ReturnsExpand Collapse
class RoleCreateResponse: …
Role assignment linking a user to a role.
object: Literal["user.role"]
Always `user.role`.
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema) > (property) object>)
role: [Role](</api/reference/python/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>)
Details about a role that can be assigned through the public Roles API.
id: str
Identifier for the role.
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) id>)
description: Optional[str]
Optional description of the role.
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) description>)
name: str
Unique name for the role.
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) name>)
object: Literal["role"]
Always `role`.
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) object>)
permissions: List[str]
Permissions granted by the role.
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) permissions>)
predefined\_role: bool
Whether the role is predefined and managed by OpenAI.
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) predefined_role>)
resource\_type: str
Resource type the role is bound to (for example `api.organization` or `api.project`).
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) resource_type>)
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema) > (property) role>)
user: [OrganizationUser](</api/reference/python/resources/admin#(resource) admin.organization.users > (model) organization_user > (schema)>)
Represents an individual `user` within an organization.
id: str
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema) > (property) user + (resource) admin.organization.users > (model) organization_user > (schema) > (property) id>)
added\_at: int
The Unix timestamp (in seconds) of when the user was added.
formatunixtime
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema) > (property) user + (resource) admin.organization.users > (model) organization_user > (schema) > (property) added_at>)
email: str
The email address of the user
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema) > (property) user + (resource) admin.organization.users > (model) organization_user > (schema) > (property) email>)
name: str
The name of the user
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema) > (property) user + (resource) admin.organization.users > (model) organization_user > (schema) > (property) name>)
object: Literal["organization.user"]
The object type, which is always `organization.user`
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema) > (property) user + (resource) admin.organization.users > (model) organization_user > (schema) > (property) object>)
role: Literal["owner", "reader"]
`owner` or `reader`
One of the following:
"owner"
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema) > (property) user + (resource) admin.organization.users > (model) organization_user > (schema) > (property) role > (member) 0>)
"reader"
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema) > (property) user + (resource) admin.organization.users > (model) organization_user > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema) > (property) user + (resource) admin.organization.users > (model) organization_user > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema) > (property) user>)
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema)>)
### Assign project role to user
Python
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
`import os
from openai import OpenAI
client = OpenAI(
admin\_api\_key=os.environ.get("OPENAI\_ADMIN\_KEY"), # This is the default and can be omitted
)
role = client.admin.organization.projects.users.roles.create(
user\_id="user\_id",
project\_id="project\_id",
role\_id="role\_id",
)
print(role.object)`
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