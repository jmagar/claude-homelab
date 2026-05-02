Delete group | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Admin](/api/reference/python/resources/admin)
[Organization](/api/reference/python/resources/admin/subresources/organization)
[Groups](/api/reference/python/resources/admin/subresources/organization/subresources/groups)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete group
admin.organization.groups.delete(strgroup\_id) -\> [GroupDeleteResponse](</api/reference/python/resources/admin#(resource) admin.organization.groups > (model) group_delete_response > (schema)>)
DELETE/organization/groups/{group\_id}
Deletes a group from the organization.
##### ParametersExpand Collapse
group\_id: str
[](<#(resource) admin.organization.groups > (method) delete > (params) default > (param) group_id > (schema)>)
##### ReturnsExpand Collapse
class GroupDeleteResponse: …
Confirmation payload returned after deleting a group.
id: str
Identifier of the deleted group.
[](<#(resource) admin.organization.groups > (model) group_delete_response > (schema) > (property) id>)
deleted: bool
Whether the group was deleted.
[](<#(resource) admin.organization.groups > (model) group_delete_response > (schema) > (property) deleted>)
object: Literal["group.deleted"]
Always `group.deleted`.
[](<#(resource) admin.organization.groups > (model) group_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.groups > (model) group_delete_response > (schema)>)
### Delete group
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
group = client.admin.organization.groups.delete(
"group\_id",
)
print(group.id)`
```
```
`{
"object": "group.deleted",
"id": "group\_01J1F8ABCDXYZ",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"object": "group.deleted",
"id": "group\_01J1F8ABCDXYZ",
"deleted": true
}
`
```