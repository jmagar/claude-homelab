List group users | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Admin](/api/reference/typescript/resources/admin)
[Organization](/api/reference/typescript/resources/admin/subresources/organization)
[Groups](/api/reference/typescript/resources/admin/subresources/organization/subresources/groups)
[Users](/api/reference/typescript/resources/admin/subresources/organization/subresources/groups/subresources/users)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List group users
client.admin.organization.groups.users.list(stringgroupID, UserListParams { after, limit, order } query?, RequestOptionsoptions?): CursorPage\<[OrganizationUser](</api/reference/typescript/resources/admin#(resource) admin.organization.users > (model) organization_user > (schema)>) { id, added\_at, email, 3 more } \>
GET/organization/groups/{group\_id}/users
Lists the users assigned to a group.
##### ParametersExpand Collapse
groupID: string
[](<#(resource) admin.organization.groups.users > (method) list > (params) default > (param) group_id > (schema)>)
query: UserListParams { after, limit, order }
after?: string
A cursor for use in pagination. Provide the ID of the last user from the previous list response to retrieve the next page.
[](<#(resource) admin.organization.groups.users > (method) list > (params) default > (param) after>)
limit?: number
A limit on the number of users to be returned. Limit can range between 0 and 1000, and the default is 100.
minimum0
maximum1000
[](<#(resource) admin.organization.groups.users > (method) list > (params) default > (param) limit>)
order?: "asc" | "desc"
Specifies the sort order of users in the list.
One of the following:
"asc"
[](<#(resource) admin.organization.groups.users > (method) list > (params) default > (param) order > (schema) > (member) 0>)
"desc"
[](<#(resource) admin.organization.groups.users > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) admin.organization.groups.users > (method) list > (params) default > (param) order>)
[](<#(resource) admin.organization.groups.users > (method) list > (params) default>)
##### ReturnsExpand Collapse
OrganizationUser { id, added\_at, email, 3 more }
Represents an individual `user` within an organization.
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
role: "owner" | "reader"
`owner` or `reader`
One of the following:
"owner"
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) role > (member) 0>)
"reader"
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) role>)
[](<#(resource) admin.organization.users > (model) organization_user > (schema)>)
### List group users
TypeScript
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
`import OpenAI from 'openai';
const client = new OpenAI({
adminAPIKey: process.env['OPENAI\_ADMIN\_KEY'], // This is the default and can be omitted
});
// Automatically fetches more pages as needed.
for await (const organizationUser of client.admin.organization.groups.users.list('group\_id')) {
console.log(organizationUser.id);
}`
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