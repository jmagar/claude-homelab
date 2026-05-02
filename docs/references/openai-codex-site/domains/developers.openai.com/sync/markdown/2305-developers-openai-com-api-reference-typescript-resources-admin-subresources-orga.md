Delete project user | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Admin](/api/reference/typescript/resources/admin)
[Organization](/api/reference/typescript/resources/admin/subresources/organization)
[Projects](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects)
[Users](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/users)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete project user
client.admin.organization.projects.users.delete(stringuserID, UserDeleteParams { project\_id } params, RequestOptionsoptions?): [UserDeleteResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.users > (model) user_delete_response > (schema)>) { id, deleted, object }
DELETE/organization/projects/{project\_id}/users/{user\_id}
Deletes a user from the project.
Returns confirmation of project user deletion, or an error if the project is
archived (archived projects have no users).
##### ParametersExpand Collapse
userID: string
[](<#(resource) admin.organization.projects.users > (method) delete > (params) default > (param) user_id > (schema)>)
params: UserDeleteParams { project\_id }
project\_id: string
The ID of the project.
[](<#(resource) admin.organization.projects.users > (method) delete > (params) default > (param) project_id>)
[](<#(resource) admin.organization.projects.users > (method) delete > (params) default>)
##### ReturnsExpand Collapse
UserDeleteResponse { id, deleted, object }
id: string
[](<#(resource) admin.organization.projects.users > (model) user_delete_response > (schema) > (property) id>)
deleted: boolean
[](<#(resource) admin.organization.projects.users > (model) user_delete_response > (schema) > (property) deleted>)
object: "organization.project.user.deleted"
[](<#(resource) admin.organization.projects.users > (model) user_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.users > (model) user_delete_response > (schema)>)
### Delete project user
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
const user = await client.admin.organization.projects.users.delete('user\_id', {
project\_id: 'project\_id',
});
console.log(user.id);`
```
```
`{
"object": "organization.project.user.deleted",
"id": "user\_abc",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"object": "organization.project.user.deleted",
"id": "user\_abc",
"deleted": true
}
`
```