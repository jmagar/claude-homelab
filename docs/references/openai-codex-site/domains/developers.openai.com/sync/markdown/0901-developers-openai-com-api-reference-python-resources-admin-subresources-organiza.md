Update organization role | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Admin](/api/reference/python/resources/admin)
[Organization](/api/reference/python/resources/admin/subresources/organization)
[Roles](/api/reference/python/resources/admin/subresources/organization/subresources/roles)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Update organization role
admin.organization.roles.update(strrole\_id, RoleUpdateParams\*\*kwargs) -\> [Role](</api/reference/python/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>)
POST/organization/roles/{role\_id}
Updates an existing organization role.
##### ParametersExpand Collapse
role\_id: str
[](<#(resource) admin.organization.roles > (method) update > (params) default > (param) role_id > (schema)>)
description: Optional[str]
New description for the role.
[](<#(resource) admin.organization.roles > (method) update > (params) default > (param) description > (schema)>)
permissions: Optional[Sequence[str]]
Updated set of permissions for the role.
[](<#(resource) admin.organization.roles > (method) update > (params) default > (param) permissions > (schema)>)
role\_name: Optional[str]
New name for the role.
[](<#(resource) admin.organization.roles > (method) update > (params) default > (param) role_name > (schema)>)
##### ReturnsExpand Collapse
class Role: …
Details about a role that can be assigned through the public Roles API.
id: str
Identifier for the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) id>)
description: Optional[str]
Optional description of the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) description>)
name: str
Unique name for the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) name>)
object: Literal["role"]
Always `role`.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) object>)
permissions: List[str]
Permissions granted by the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) permissions>)
predefined\_role: bool
Whether the role is predefined and managed by OpenAI.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) predefined_role>)
resource\_type: str
Resource type the role is bound to (for example `api.organization` or `api.project`).
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) resource_type>)
[](<#(resource) admin.organization.roles > (model) role > (schema)>)
### Update organization role
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
role = client.admin.organization.roles.update(
role\_id="role\_id",
)
print(role.id)`
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