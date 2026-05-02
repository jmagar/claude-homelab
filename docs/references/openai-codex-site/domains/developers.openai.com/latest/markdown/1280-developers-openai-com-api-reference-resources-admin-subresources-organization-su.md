Delete organization role | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Admin](/api/reference/resources/admin)
[Organization](/api/reference/resources/admin/subresources/organization)
[Roles](/api/reference/resources/admin/subresources/organization/subresources/roles)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete organization role
DELETE/organization/roles/{role\_id}
Deletes a custom role from the organization.
##### Path ParametersExpand Collapse
role\_id: string
[](<#(resource) admin.organization.roles > (method) delete > (params) default > (param) role_id > (schema)>)
##### ReturnsExpand Collapse
id: string
Identifier of the deleted role.
[](<#(resource) admin.organization.roles > (model) role_delete_response > (schema) > (property) id>)
deleted: boolean
Whether the role was deleted.
[](<#(resource) admin.organization.roles > (model) role_delete_response > (schema) > (property) deleted>)
object: "role.deleted"
Always `role.deleted`.
[](<#(resource) admin.organization.roles > (model) role_delete_response > (schema) > (property) object>)
### Delete organization role
HTTP
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
`curl -X DELETE https://api.openai.com/v1/organization/roles/role\_01J1F8ROLE01 \\
-H "Authorization: Bearer $OPENAI\_ADMIN\_KEY" \\
-H "Content-Type: application/json"
`
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