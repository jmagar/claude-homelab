List users | OpenAI API Reference
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
# List users
admin.organization.users.list(UserListParams\*\*kwargs) -\> SyncConversationCursorPage[[OrganizationUser](</api/reference/python/resources/admin#(resource) admin.organization.users > (model) organization_user > (schema)>)]
GET/organization/users
Lists all of the users in the organization.
##### ParametersExpand Collapse
after: Optional[str]
A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj\_foo, your subsequent call can include after=obj\_foo in order to fetch the next page of the list.
[](<#(resource) admin.organization.users > (method) list > (params) default > (param) after > (schema)>)
emails: Optional[Sequence[str]]
Filter by the email address of users.
[](<#(resource) admin.organization.users > (method) list > (params) default > (param) emails > (schema)>)
limit: Optional[int]
A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
[](<#(resource) admin.organization.users > (method) list > (params) default > (param) limit > (schema)>)
##### ReturnsExpand Collapse
class OrganizationUser: …
Represents an individual `user` within an organization.
id: str
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) id>)
added\_at: int
The Unix timestamp (in seconds) of when the user was added.
formatunixtime
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) added_at>)
email: str
The email address of the user
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) email>)
name: str
The name of the user
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) name>)
object: Literal["organization.user"]
The object type, which is always `organization.user`
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) object>)
role: Literal["owner", "reader"]
`owner` or `reader`
One of the following:
"owner"
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) role > (member) 0>)
"reader"
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) role>)
[](<#(resource) admin.organization.users > (model) organization_user > (schema)>)
### List users
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
page = client.admin.organization.users.list()
page = page.data[0]
print(page.id)`
```
```
`{
"object": "list",
"data": [
{
"object": "organization.user",
"id": "user\_abc",
"name": "First Last",
"email": "user@example.com",
"role": "owner",
"added\_at": 1711471533
}
],
"first\_id": "user-abc",
"last\_id": "user-xyz",
"has\_more": false
}
`
```
##### Returns Examples
```
`{
"object": "list",
"data": [
{
"object": "organization.user",
"id": "user\_abc",
"name": "First Last",
"email": "user@example.com",
"role": "owner",
"added\_at": 1711471533
}
],
"first\_id": "user-abc",
"last\_id": "user-xyz",
"has\_more": false
}
`
```