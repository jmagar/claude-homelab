List organization roles | OpenAI API Reference
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
# List organization roles
admin.organization.roles.list(RoleListParams\*\*kwargs) -\> SyncCursorPage[[Role](</api/reference/python/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>)]
GET/organization/roles
Lists the roles configured for the organization.
##### ParametersExpand Collapse
after: Optional[str]
Cursor for pagination. Provide the value from the previous response’s `next` field to continue listing roles.
[](<#(resource) admin.organization.roles > (method) list > (params) default > (param) after > (schema)>)
limit: Optional[int]
A limit on the number of roles to return. Defaults to 1000.
minimum0
maximum1000
[](<#(resource) admin.organization.roles > (method) list > (params) default > (param) limit > (schema)>)
order: Optional[Literal["asc", "desc"]]
Sort order for the returned roles.
One of the following:
"asc"
[](<#(resource) admin.organization.roles > (method) list > (params) default > (param) order > (schema) > (member) 0>)
"desc"
[](<#(resource) admin.organization.roles > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) admin.organization.roles > (method) list > (params) default > (param) order > (schema)>)
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
### List organization roles
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
page = client.admin.organization.roles.list()
page = page.data[0]
print(page.id)`
```
```
`{
"object": "list",
"data": [
{
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
],
"has\_more": false,
"next": null
}
`
```