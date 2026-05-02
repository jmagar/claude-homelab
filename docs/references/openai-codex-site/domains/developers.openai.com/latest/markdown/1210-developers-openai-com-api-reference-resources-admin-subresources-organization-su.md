List group users | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Admin](/api/reference/resources/admin)
[Organization](/api/reference/resources/admin/subresources/organization)
[Groups](/api/reference/resources/admin/subresources/organization/subresources/groups)
[Users](/api/reference/resources/admin/subresources/organization/subresources/groups/subresources/users)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List group users
GET/organization/groups/{group\_id}/users
Lists the users assigned to a group.
##### Path ParametersExpand Collapse
group\_id: string
[](<#(resource) admin.organization.groups.users > (method) list > (params) default > (param) group_id > (schema)>)
##### Query ParametersExpand Collapse
after: optional string
A cursor for use in pagination. Provide the ID of the last user from the previous list response to retrieve the next page.
[](<#(resource) admin.organization.groups.users > (method) list > (params) default > (param) after > (schema)>)
limit: optional number
A limit on the number of users to be returned. Limit can range between 0 and 1000, and the default is 100.
minimum0
maximum1000
[](<#(resource) admin.organization.groups.users > (method) list > (params) default > (param) limit > (schema)>)
order: optional "asc" or "desc"
Specifies the sort order of users in the list.
One of the following:
"asc"
[](<#(resource) admin.organization.groups.users > (method) list > (params) default > (param) order > (schema) > (member) 0>)
"desc"
[](<#(resource) admin.organization.groups.users > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) admin.organization.groups.users > (method) list > (params) default > (param) order > (schema)>)
##### ReturnsExpand Collapse
data: array of [OrganizationUser](</api/reference/resources/admin#(resource) admin.organization.users > (model) organization_user > (schema)>) { id, added\_at, email, 3 more }
Users in the current page.
id: string
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) id>)
added\_at: number
The Unix timestamp (in seconds) of when the user was added.
formatunixtime
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) added_at>)
email: string
The email address of the user
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) email>)
name: string
The name of the user
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) name>)
object: "organization.user"
The object type, which is always `organization.user`
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) object>)
role: "owner" or "reader"
`owner` or `reader`
One of the following:
"owner"
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) role > (member) 0>)
"reader"
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) role>)
[](<#(resource) admin.organization.groups.users > (method) list > (network schema) > (property) data>)
has\_more: boolean
Whether more users are available when paginating.
[](<#(resource) admin.organization.groups.users > (method) list > (network schema) > (property) has_more>)
next: string
Cursor to fetch the next page of results, or `null` when no further users are available.
[](<#(resource) admin.organization.groups.users > (method) list > (network schema) > (property) next>)
object: "list"
Always `list`.
[](<#(resource) admin.organization.groups.users > (method) list > (network schema) > (property) object>)
### List group users
HTTP
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
`curl https://api.openai.com/v1/organization/groups/group\_01J1F8ABCDXYZ/users?limit=20 \\
-H "Authorization: Bearer $OPENAI\_ADMIN\_KEY" \\
-H "Content-Type: application/json"
`
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