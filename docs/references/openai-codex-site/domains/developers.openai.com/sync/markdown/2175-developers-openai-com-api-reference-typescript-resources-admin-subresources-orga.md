Delete group | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Admin](/api/reference/typescript/resources/admin)
[Organization](/api/reference/typescript/resources/admin/subresources/organization)
[Groups](/api/reference/typescript/resources/admin/subresources/organization/subresources/groups)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete group
client.admin.organization.groups.delete(stringgroupID, RequestOptionsoptions?): [GroupDeleteResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.groups > (model) group_delete_response > (schema)>) { id, deleted, object }
DELETE/organization/groups/{group\_id}
Deletes a group from the organization.
##### ParametersExpand Collapse
groupID: string
[](<#(resource) admin.organization.groups > (method) delete > (params) default > (param) group_id > (schema)>)
##### ReturnsExpand Collapse
GroupDeleteResponse { id, deleted, object }
Confirmation payload returned after deleting a group.
id: string
Identifier of the deleted group.
[](<#(resource) admin.organization.groups > (model) group_delete_response > (schema) > (property) id>)
deleted: boolean
Whether the group was deleted.
[](<#(resource) admin.organization.groups > (model) group_delete_response > (schema) > (property) deleted>)
object: "group.deleted"
Always `group.deleted`.
[](<#(resource) admin.organization.groups > (model) group_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.groups > (model) group_delete_response > (schema)>)
### Delete group
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
const group = await client.admin.organization.groups.delete('group\_id');
console.log(group.id);`
```
```
`{
"object": "group.deleted",
"id": "group\_01J1F8ABCDXYZ",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"object": "group.deleted",
"id": "group\_01J1F8ABCDXYZ",
"deleted": true
}
`
```