Add group user | OpenAI API Reference
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
# Add group user
admin.organization.groups.users.create(strgroup\_id, UserCreateParams\*\*kwargs) -\> [UserCreateResponse](</api/reference/python/resources/admin#(resource) admin.organization.groups.users > (model) user_create_response > (schema)>)
POST/organization/groups/{group\_id}/users
Adds a user to a group.
##### ParametersExpand Collapse
group\_id: str
[](<#(resource) admin.organization.groups.users > (method) create > (params) default > (param) group_id > (schema)>)
user\_id: str
Identifier of the user to add to the group.
[](<#(resource) admin.organization.groups.users > (method) create > (params) default > (param) user_id > (schema)>)
##### ReturnsExpand Collapse
class UserCreateResponse: …
Confirmation payload returned after adding a user to a group.
group\_id: str
Identifier of the group the user was added to.
[](<#(resource) admin.organization.groups.users > (model) user_create_response > (schema) > (property) group_id>)
object: Literal["group.user"]
Always `group.user`.
[](<#(resource) admin.organization.groups.users > (model) user_create_response > (schema) > (property) object>)
user\_id: str
Identifier of the user that was added.
[](<#(resource) admin.organization.groups.users > (model) user_create_response > (schema) > (property) user_id>)
[](<#(resource) admin.organization.groups.users > (model) user_create_response > (schema)>)
### Add group user
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
user = client.admin.organization.groups.users.create(
group\_id="group\_id",
user\_id="user\_id",
)
print(user.group\_id)`
```
```
`{
"object": "group.user",
"user\_id": "user\_abc123",
"group\_id": "group\_01J1F8ABCDXYZ"
}
`
```
##### Returns Examples
```
`{
"object": "group.user",
"user\_id": "user\_abc123",
"group\_id": "group\_01J1F8ABCDXYZ"
}
`
```