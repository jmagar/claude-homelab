Unassign project role from group | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Admin](/api/reference/typescript/resources/admin)
[Organization](/api/reference/typescript/resources/admin/subresources/organization)
[Projects](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects)
[Groups](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/groups)
[Roles](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/groups/subresources/roles)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Unassign project role from group
client.admin.organization.projects.groups.roles.delete(stringroleID, RoleDeleteParams { project\_id, group\_id } params, RequestOptionsoptions?): [RoleDeleteResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.groups.roles > (model) role_delete_response > (schema)>) { deleted, object }
DELETE/projects/{project\_id}/groups/{group\_id}/roles/{role\_id}
Unassigns a project role from a group within a project.
##### ParametersExpand Collapse
roleID: string
[](<#(resource) admin.organization.projects.groups.roles > (method) delete > (params) default > (param) role_id > (schema)>)
params: RoleDeleteParams { project\_id, group\_id }
project\_id: string
The ID of the project to modify.
[](<#(resource) admin.organization.projects.groups.roles > (method) delete > (params) default > (param) project_id>)
group\_id: string
The ID of the group whose project role assignment should be removed.
[](<#(resource) admin.organization.projects.groups.roles > (method) delete > (params) default > (param) group_id>)
[](<#(resource) admin.organization.projects.groups.roles > (method) delete > (params) default>)
##### ReturnsExpand Collapse
RoleDeleteResponse { deleted, object }
Confirmation payload returned after unassigning a role.
deleted: boolean
Whether the assignment was removed.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_delete_response > (schema) > (property) deleted>)
object: string
Identifier for the deleted assignment, such as `group.role.deleted` or `user.role.deleted`.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.groups.roles > (model) role_delete_response > (schema)>)
### Unassign project role from group
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
const role = await client.admin.organization.projects.groups.roles.delete('role\_id', {
project\_id: 'project\_id',
group\_id: 'group\_id',
});
console.log(role.deleted);`
```
```
`{
"object": "group.role.deleted",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"object": "group.role.deleted",
"deleted": true
}
`
```