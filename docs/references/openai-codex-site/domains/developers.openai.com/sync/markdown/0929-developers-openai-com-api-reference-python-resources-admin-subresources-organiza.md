List group users | OpenAI API Reference
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
# List group users
admin.organization.groups.users.list(strgroup\_id, UserListParams\*\*kwargs) -\> SyncCursorPage[[OrganizationUser](</api/reference/python/resources/admin#(resource) admin.organization.users > (model) organization_user > (schema)>)]
GET/organization/groups/{group\_id}/users
Lists the users assigned to a group.
##### ParametersExpand Collapse
group\_id: str
[](<#(resource) admin.organization.groups.users > (method) list > (params) default > (param) group_id > (schema)>)
after: Optional[str]
A cursor for use in pagination. Provide the ID of the last user from the previous list response to retrieve the next page.
[](<#(resource) admin.organization.groups.users > (method) list > (params) default > (param) after > (schema)>)
limit: Optional[int]
A limit on the number of users to be returned. Limit can range between 0 and 1000, and the default is 100.
minimum0
maximum1000
[](<#(resource) admin.organization.groups.users > (method) list > (params) default > (param) limit > (schema)>)
order: Optional[Literal["asc", "desc"]]
Specifies the sort order of users in the list.
One of the following:
"asc"
[](<#(resource) admin.organization.groups.users > (method) list > (params) default > (param) order > (schema) > (member) 0>)
"desc"
[](<#(resource) admin.organization.groups.users > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) admin.organization.groups.users > (method) list > (params) default > (param) order > (schema)>)
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
### List group users
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
page = client.admin.organization.groups.users.list(
group\_id="group\_id",
)
page = page.data[0]
print(page.id)`
```
```
`{
"object": "list",
"data": [
{
"object": "organization.user",
"id": "user\_abc123",
"name": "Ada Lovelace",
"email": "ada@example.com",
"role": "owner",
"added\_at": 1711471533
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
"object": "organization.user",
"id": "user\_abc123",
"name": "Ada Lovelace",
"email": "ada@example.com",
"role": "owner",
"added\_at": 1711471533
}
],
"has\_more": false,
"next": null
}
`
```