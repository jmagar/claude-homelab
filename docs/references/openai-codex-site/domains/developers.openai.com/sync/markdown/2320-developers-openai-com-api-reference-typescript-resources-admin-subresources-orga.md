Delete organization role | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Admin](/api/reference/typescript/resources/admin)
[Organization](/api/reference/typescript/resources/admin/subresources/organization)
[Roles](/api/reference/typescript/resources/admin/subresources/organization/subresources/roles)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete organization role
client.admin.organization.roles.delete(stringroleID, RequestOptionsoptions?): [RoleDeleteResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.roles > (model) role_delete_response > (schema)>) { id, deleted, object }
DELETE/organization/roles/{role\_id}
Deletes a custom role from the organization.
##### ParametersExpand Collapse
roleID: string
[](<#(resource) admin.organization.roles > (method) delete > (params) default > (param) role_id > (schema)>)
##### ReturnsExpand Collapse
RoleDeleteResponse { id, deleted, object }
Confirmation payload returned after deleting a role.
id: string
Identifier of the deleted role.
[](<#(resource) admin.organization.roles > (model) role_delete_response > (schema) > (property) id>)
deleted: boolean
Whether the role was deleted.
[](<#(resource) admin.organization.roles > (model) role_delete_response > (schema) > (property) deleted>)
object: "role.deleted"
Always `role.deleted`.
[](<#(resource) admin.organization.roles > (model) role_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.roles > (model) role_delete_response > (schema)>)
### Delete organization role
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
const role = await client.admin.organization.roles.delete('role\_id');
console.log(role.id);`
```
```
`{
"object": "role.deleted",
"id": "role\_01J1F8ROLE01",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"object": "role.deleted",
"id": "role\_01J1F8ROLE01",
"deleted": true
}
`
```