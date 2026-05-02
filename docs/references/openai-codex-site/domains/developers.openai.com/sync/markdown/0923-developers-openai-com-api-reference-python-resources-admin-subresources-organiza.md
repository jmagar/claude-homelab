Delete user | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Admin](/api/reference/python/resources/admin)
[Organization](/api/reference/python/resources/admin/subresources/organization)
[Users](/api/reference/python/resources/admin/subresources/organization/subresources/users)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete user
admin.organization.users.delete(struser\_id) -\> [UserDeleteResponse](</api/reference/python/resources/admin#(resource) admin.organization.users > (model) user_delete_response > (schema)>)
DELETE/organization/users/{user\_id}
Deletes a user from the organization.
##### ParametersExpand Collapse
user\_id: str
[](<#(resource) admin.organization.users > (method) delete > (params) default > (param) user_id > (schema)>)
##### ReturnsExpand Collapse
class UserDeleteResponse: …
id: str
[](<#(resource) admin.organization.users > (model) user_delete_response > (schema) > (property) id>)
deleted: bool
[](<#(resource) admin.organization.users > (model) user_delete_response > (schema) > (property) deleted>)
object: Literal["organization.user.deleted"]
[](<#(resource) admin.organization.users > (model) user_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.users > (model) user_delete_response > (schema)>)
### Delete user
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
user = client.admin.organization.users.delete(
"user\_id",
)
print(user.id)`
```
```
`{
"object": "organization.user.deleted",
"id": "user\_abc",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"object": "organization.user.deleted",
"id": "user\_abc",
"deleted": true
}
`
```