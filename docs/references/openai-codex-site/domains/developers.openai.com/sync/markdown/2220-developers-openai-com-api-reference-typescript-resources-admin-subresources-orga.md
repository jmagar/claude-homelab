Remove project group | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Admin](/api/reference/typescript/resources/admin)
[Organization](/api/reference/typescript/resources/admin/subresources/organization)
[Projects](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects)
[Groups](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/groups)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Remove project group
client.admin.organization.projects.groups.delete(stringgroupID, GroupDeleteParams { project\_id } params, RequestOptionsoptions?): [GroupDeleteResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.groups > (model) group_delete_response > (schema)>) { deleted, object }
DELETE/organization/projects/{project\_id}/groups/{group\_id}
Revokes a group’s access to a project.
##### ParametersExpand Collapse
groupID: string
[](<#(resource) admin.organization.projects.groups > (method) delete > (params) default > (param) group_id > (schema)>)
params: GroupDeleteParams { project\_id }
project\_id: string
The ID of the project to update.
[](<#(resource) admin.organization.projects.groups > (method) delete > (params) default > (param) project_id>)
[](<#(resource) admin.organization.projects.groups > (method) delete > (params) default>)
##### ReturnsExpand Collapse
GroupDeleteResponse { deleted, object }
Confirmation payload returned after removing a group from a project.
deleted: boolean
Whether the group membership in the project was removed.
[](<#(resource) admin.organization.projects.groups > (model) group_delete_response > (schema) > (property) deleted>)
object: "project.group.deleted"
Always `project.group.deleted`.
[](<#(resource) admin.organization.projects.groups > (model) group_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.groups > (model) group_delete_response > (schema)>)
### Remove project group
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
const group = await client.admin.organization.projects.groups.delete('group\_id', {
project\_id: 'project\_id',
});
console.log(group.deleted);`
```
```
`{
"object": "project.group.deleted",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"object": "project.group.deleted",
"deleted": true
}
`
```