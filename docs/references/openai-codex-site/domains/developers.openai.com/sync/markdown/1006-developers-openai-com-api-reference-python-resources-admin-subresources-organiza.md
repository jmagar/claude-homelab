Remove group user | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Admin](/api/reference/python/resources/admin)
[Organization](/api/reference/python/resources/admin/subresources/organization)
[Groups](/api/reference/python/resources/admin/subresources/organization/subresources/groups)
[Users](/api/reference/python/resources/admin/subresources/organization/subresources/groups/subresources/users)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Remove group user
admin.organization.groups.users.delete(struser\_id, UserDeleteParams\*\*kwargs) -\> [UserDeleteResponse](</api/reference/python/resources/admin#(resource) admin.organization.groups.users > (model) user_delete_response > (schema)>)
DELETE/organization/groups/{group\_id}/users/{user\_id}
Removes a user from a group.
##### ParametersExpand Collapse
group\_id: str
[](<#(resource) admin.organization.groups.users > (method) delete > (params) default > (param) group_id > (schema)>)
user\_id: str
[](<#(resource) admin.organization.groups.users > (method) delete > (params) default > (param) user_id > (schema)>)
##### ReturnsExpand Collapse
class UserDeleteResponse: …
Confirmation payload returned after removing a user from a group.
deleted: bool
Whether the group membership was removed.
[](<#(resource) admin.organization.groups.users > (model) user_delete_response > (schema) > (property) deleted>)
object: Literal["group.user.deleted"]
Always `group.user.deleted`.
[](<#(resource) admin.organization.groups.users > (model) user_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.groups.users > (model) user_delete_response > (schema)>)
### Remove group user
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
user = client.admin.organization.groups.users.delete(
user\_id="user\_id",
group\_id="group\_id",
)
print(user.deleted)`
```
```
`{
"object": "group.user.deleted",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"object": "group.user.deleted",
"deleted": true
}
`
```