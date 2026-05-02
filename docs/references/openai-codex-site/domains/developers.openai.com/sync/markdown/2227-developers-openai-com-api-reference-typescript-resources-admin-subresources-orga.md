Add group user | OpenAI API Reference
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
# Add group user
client.admin.organization.groups.users.create(stringgroupID, UserCreateParams { user\_id } body, RequestOptionsoptions?): [UserCreateResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.groups.users > (model) user_create_response > (schema)>) { group\_id, object, user\_id }
POST/organization/groups/{group\_id}/users
Adds a user to a group.
##### ParametersExpand Collapse
groupID: string
[](<#(resource) admin.organization.groups.users > (method) create > (params) default > (param) group_id > (schema)>)
body: UserCreateParams { user\_id }
user\_id: string
Identifier of the user to add to the group.
[](<#(resource) admin.organization.groups.users > (method) create > (params) default > (param) user_id>)
[](<#(resource) admin.organization.groups.users > (method) create > (params) default>)
##### ReturnsExpand Collapse
UserCreateResponse { group\_id, object, user\_id }
Confirmation payload returned after adding a user to a group.
group\_id: string
Identifier of the group the user was added to.
[](<#(resource) admin.organization.groups.users > (model) user_create_response > (schema) > (property) group_id>)
object: "group.user"
Always `group.user`.
[](<#(resource) admin.organization.groups.users > (model) user_create_response > (schema) > (property) object>)
user\_id: string
Identifier of the user that was added.
[](<#(resource) admin.organization.groups.users > (model) user_create_response > (schema) > (property) user_id>)
[](<#(resource) admin.organization.groups.users > (model) user_create_response > (schema)>)
### Add group user
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
const user = await client.admin.organization.groups.users.create('group\_id', {
user\_id: 'user\_id',
});
console.log(user.group\_id);`
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