Delete organization role | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Admin](/api/reference/ruby/resources/admin)
[Organization](/api/reference/ruby/resources/admin/subresources/organization)
[Roles](/api/reference/ruby/resources/admin/subresources/organization/subresources/roles)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete organization role
admin.organization.roles.delete(role\_id) -\> [RoleDeleteResponse](</api/reference/ruby/resources/admin#(resource) admin.organization.roles > (model) role_delete_response > (schema)>) { id, deleted, object }
DELETE/organization/roles/{role\_id}
Deletes a custom role from the organization.
##### ParametersExpand Collapse
role\_id: String
[](<#(resource) admin.organization.roles > (method) delete > (params) default > (param) role_id > (schema)>)
##### ReturnsExpand Collapse
class RoleDeleteResponse { id, deleted, object }
Confirmation payload returned after deleting a role.
id: String
Identifier of the deleted role.
[](<#(resource) admin.organization.roles > (model) role_delete_response > (schema) > (property) id>)
deleted: bool
Whether the role was deleted.
[](<#(resource) admin.organization.roles > (model) role_delete_response > (schema) > (property) deleted>)
object: :"role.deleted"
Always `role.deleted`.
[](<#(resource) admin.organization.roles > (model) role_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.roles > (model) role_delete_response > (schema)>)
### Delete organization role
Ruby
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
`require "openai"
openai = OpenAI::Client.new(admin\_api\_key: "My Admin API Key")
role = openai.admin.organization.roles.delete("role\_id")
puts(role)`
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