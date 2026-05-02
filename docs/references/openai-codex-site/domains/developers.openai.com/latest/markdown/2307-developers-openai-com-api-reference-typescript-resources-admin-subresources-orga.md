Delete user | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Admin](/api/reference/typescript/resources/admin)
[Organization](/api/reference/typescript/resources/admin/subresources/organization)
[Users](/api/reference/typescript/resources/admin/subresources/organization/subresources/users)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete user
client.admin.organization.users.delete(stringuserID, RequestOptionsoptions?): [UserDeleteResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.users > (model) user_delete_response > (schema)>) { id, deleted, object }
DELETE/organization/users/{user\_id}
Deletes a user from the organization.
##### ParametersExpand Collapse
userID: string
[](<#(resource) admin.organization.users > (method) delete > (params) default > (param) user_id > (schema)>)
##### ReturnsExpand Collapse
UserDeleteResponse { id, deleted, object }
id: string
[](<#(resource) admin.organization.users > (model) user_delete_response > (schema) > (property) id>)
deleted: boolean
[](<#(resource) admin.organization.users > (model) user_delete_response > (schema) > (property) deleted>)
object: "organization.user.deleted"
[](<#(resource) admin.organization.users > (model) user_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.users > (model) user_delete_response > (schema)>)
### Delete user
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
const user = await client.admin.organization.users.delete('user\_id');
console.log(user.id);`
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