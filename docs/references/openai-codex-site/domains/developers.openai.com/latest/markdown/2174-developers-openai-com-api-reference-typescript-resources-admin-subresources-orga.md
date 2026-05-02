Remove group user | OpenAI API Reference
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
# Remove group user
client.admin.organization.groups.users.delete(stringuserID, UserDeleteParams { group\_id } params, RequestOptionsoptions?): [UserDeleteResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.groups.users > (model) user_delete_response > (schema)>) { deleted, object }
DELETE/organization/groups/{group\_id}/users/{user\_id}
Removes a user from a group.
##### ParametersExpand Collapse
userID: string
[](<#(resource) admin.organization.groups.users > (method) delete > (params) default > (param) user_id > (schema)>)
params: UserDeleteParams { group\_id }
group\_id: string
The ID of the group to update.
[](<#(resource) admin.organization.groups.users > (method) delete > (params) default > (param) group_id>)
[](<#(resource) admin.organization.groups.users > (method) delete > (params) default>)
##### ReturnsExpand Collapse
UserDeleteResponse { deleted, object }
Confirmation payload returned after removing a user from a group.
deleted: boolean
Whether the group membership was removed.
[](<#(resource) admin.organization.groups.users > (model) user_delete_response > (schema) > (property) deleted>)
object: "group.user.deleted"
Always `group.user.deleted`.
[](<#(resource) admin.organization.groups.users > (model) user_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.groups.users > (model) user_delete_response > (schema)>)
### Remove group user
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
const user = await client.admin.organization.groups.users.delete('user\_id', {
group\_id: 'group\_id',
});
console.log(user.deleted);`
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