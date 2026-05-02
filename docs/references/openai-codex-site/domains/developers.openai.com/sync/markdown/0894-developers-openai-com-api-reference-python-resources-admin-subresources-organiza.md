Delete organization role | OpenAI API Reference
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
# Delete organization role
admin.organization.roles.delete(strrole\_id) -\> [RoleDeleteResponse](</api/reference/python/resources/admin#(resource) admin.organization.roles > (model) role_delete_response > (schema)>)
DELETE/organization/roles/{role\_id}
Deletes a custom role from the organization.
##### ParametersExpand Collapse
role\_id: str
[](<#(resource) admin.organization.roles > (method) delete > (params) default > (param) role_id > (schema)>)
##### ReturnsExpand Collapse
class RoleDeleteResponse: …
Confirmation payload returned after deleting a role.
id: str
Identifier of the deleted role.
[](<#(resource) admin.organization.roles > (model) role_delete_response > (schema) > (property) id>)
deleted: bool
Whether the role was deleted.
[](<#(resource) admin.organization.roles > (model) role_delete_response > (schema) > (property) deleted>)
object: Literal["role.deleted"]
Always `role.deleted`.
[](<#(resource) admin.organization.roles > (model) role_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.roles > (model) role_delete_response > (schema)>)
### Delete organization role
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
role = client.admin.organization.roles.delete(
"role\_id",
)
print(role.id)`
```
```
`{
"object": "role.deleted",
"id": "role\_01J1F8ROLE01",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"object": "role.deleted",
"id": "role\_01J1F8ROLE01",
"deleted": true
}
`
```