Unassign project role from user | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Admin](/api/reference/typescript/resources/admin)
[Organization](/api/reference/typescript/resources/admin/subresources/organization)
[Projects](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects)
[Users](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/users)
[Roles](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/users/subresources/roles)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Unassign project role from user
client.admin.organization.projects.users.roles.delete(stringroleID, RoleDeleteParams { project\_id, user\_id } params, RequestOptionsoptions?): [RoleDeleteResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.users.roles > (model) role_delete_response > (schema)>) { deleted, object }
DELETE/projects/{project\_id}/users/{user\_id}/roles/{role\_id}
Unassigns a project role from a user within a project.
##### ParametersExpand Collapse
roleID: string
[](<#(resource) admin.organization.projects.users.roles > (method) delete > (params) default > (param) role_id > (schema)>)
params: RoleDeleteParams { project\_id, user\_id }
project\_id: string
The ID of the project to modify.
[](<#(resource) admin.organization.projects.users.roles > (method) delete > (params) default > (param) project_id>)
user\_id: string
The ID of the user whose project role assignment should be removed.
[](<#(resource) admin.organization.projects.users.roles > (method) delete > (params) default > (param) user_id>)
[](<#(resource) admin.organization.projects.users.roles > (method) delete > (params) default>)
##### ReturnsExpand Collapse
RoleDeleteResponse { deleted, object }
Confirmation payload returned after unassigning a role.
deleted: boolean
Whether the assignment was removed.
[](<#(resource) admin.organization.projects.users.roles > (model) role_delete_response > (schema) > (property) deleted>)
object: string
Identifier for the deleted assignment, such as `group.role.deleted` or `user.role.deleted`.
[](<#(resource) admin.organization.projects.users.roles > (model) role_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.users.roles > (model) role_delete_response > (schema)>)
### Unassign project role from user
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
const role = await client.admin.organization.projects.users.roles.delete('role\_id', {
project\_id: 'project\_id',
user\_id: 'user\_id',
});
console.log(role.deleted);`
```
```
`{
"object": "user.role.deleted",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"object": "user.role.deleted",
"deleted": true
}
`
```