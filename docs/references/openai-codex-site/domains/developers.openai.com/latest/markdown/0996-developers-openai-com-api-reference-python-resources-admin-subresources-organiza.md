Assign organization role to group | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Admin](/api/reference/python/resources/admin)
[Organization](/api/reference/python/resources/admin/subresources/organization)
[Groups](/api/reference/python/resources/admin/subresources/organization/subresources/groups)
[Roles](/api/reference/python/resources/admin/subresources/organization/subresources/groups/subresources/roles)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Assign organization role to group
admin.organization.groups.roles.create(strgroup\_id, RoleCreateParams\*\*kwargs) -\> [RoleCreateResponse](</api/reference/python/resources/admin#(resource) admin.organization.groups.roles > (model) role_create_response > (schema)>)
POST/organization/groups/{group\_id}/roles
Assigns an organization role to a group within the organization.
##### ParametersExpand Collapse
group\_id: str
[](<#(resource) admin.organization.groups.roles > (method) create > (params) default > (param) group_id > (schema)>)
role\_id: str
Identifier of the role to assign.
[](<#(resource) admin.organization.groups.roles > (method) create > (params) default > (param) role_id > (schema)>)
##### ReturnsExpand Collapse
class RoleCreateResponse: …
Role assignment linking a group to a role.
group: Group
Summary information about a group returned in role assignment responses.
id: str
Identifier for the group.
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) group > (property) id>)
created\_at: int
Unix timestamp (in seconds) when the group was created.
formatunixtime
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) group > (property) created_at>)
name: str
Display name of the group.
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) group > (property) name>)
object: Literal["group"]
Always `group`.
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) group > (property) object>)
scim\_managed: bool
Whether the group is managed through SCIM.
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) group > (property) scim_managed>)
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) group>)
object: Literal["group.role"]
Always `group.role`.
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) object>)
role: [Role](</api/reference/python/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>)
Details about a role that can be assigned through the public Roles API.
id: str
Identifier for the role.
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) id>)
description: Optional[str]
Optional description of the role.
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) description>)
name: str
Unique name for the role.
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) name>)
object: Literal["role"]
Always `role`.
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) object>)
permissions: List[str]
Permissions granted by the role.
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) permissions>)
predefined\_role: bool
Whether the role is predefined and managed by OpenAI.
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) predefined_role>)
resource\_type: str
Resource type the role is bound to (for example `api.organization` or `api.project`).
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) resource_type>)
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) role>)
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema)>)
### Assign organization role to group
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
role = client.admin.organization.groups.roles.create(
group\_id="group\_id",
role\_id="role\_id",
)
print(role.group)`
```
```
`{
"object": "group.role",
"group": {
"object": "group",
"id": "group\_01J1F8ABCDXYZ",
"name": "Support Team",
"created\_at": 1711471533,
"scim\_managed": false
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
"object": "group.role",
"group": {
"object": "group",
"id": "group\_01J1F8ABCDXYZ",
"name": "Support Team",
"created\_at": 1711471533,
"scim\_managed": false
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