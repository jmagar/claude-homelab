Roles | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Admin](/api/reference/ruby/resources/admin)
[Organization](/api/reference/ruby/resources/admin/subresources/organization)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Roles
##### [List organization roles](/api/reference/ruby/resources/admin/subresources/organization/subresources/roles/methods/list)
admin.organization.roles.list(\*\*kwargs) -\> CursorPage\<[Role](</api/reference/ruby/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) { id, description, name, 4 more } \>
GET/organization/roles
##### [Create organization role](/api/reference/ruby/resources/admin/subresources/organization/subresources/roles/methods/create)
admin.organization.roles.create(\*\*kwargs) -\> [Role](</api/reference/ruby/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) { id, description, name, 4 more }
POST/organization/roles
##### [Update organization role](/api/reference/ruby/resources/admin/subresources/organization/subresources/roles/methods/update)
admin.organization.roles.update(role\_id, \*\*kwargs) -\> [Role](</api/reference/ruby/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) { id, description, name, 4 more }
POST/organization/roles/{role\_id}
##### [Delete organization role](/api/reference/ruby/resources/admin/subresources/organization/subresources/roles/methods/delete)
admin.organization.roles.delete(role\_id) -\> [RoleDeleteResponse](</api/reference/ruby/resources/admin#(resource) admin.organization.roles > (model) role_delete_response > (schema)>) { id, deleted, object }
DELETE/organization/roles/{role\_id}
##### ModelsExpand Collapse
class Role { id, description, name, 4 more }
Details about a role that can be assigned through the public Roles API.
id: String
Identifier for the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) id>)
description: String
Optional description of the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) description>)
name: String
Unique name for the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) name>)
object: :role
Always `role`.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) object>)
permissions: Array[String]
Permissions granted by the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) permissions>)
predefined\_role: bool
Whether the role is predefined and managed by OpenAI.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) predefined_role>)
resource\_type: String
Resource type the role is bound to (for example `api.organization` or `api.project`).
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) resource_type>)
[](<#(resource) admin.organization.roles > (model) role > (schema)>)
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