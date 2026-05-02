Roles | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Admin](/api/reference/typescript/resources/admin)
[Organization](/api/reference/typescript/resources/admin/subresources/organization)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Roles
##### [List organization roles](/api/reference/typescript/resources/admin/subresources/organization/subresources/roles/methods/list)
client.admin.organization.roles.list(RoleListParams { after, limit, order } query?, RequestOptionsoptions?): CursorPage\<[Role](</api/reference/typescript/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) { id, description, name, 4 more } \>
GET/organization/roles
##### [Create organization role](/api/reference/typescript/resources/admin/subresources/organization/subresources/roles/methods/create)
client.admin.organization.roles.create(RoleCreateParams { permissions, role\_name, description } body, RequestOptionsoptions?): [Role](</api/reference/typescript/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) { id, description, name, 4 more }
POST/organization/roles
##### [Update organization role](/api/reference/typescript/resources/admin/subresources/organization/subresources/roles/methods/update)
client.admin.organization.roles.update(stringroleID, RoleUpdateParams { description, permissions, role\_name } body, RequestOptionsoptions?): [Role](</api/reference/typescript/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) { id, description, name, 4 more }
POST/organization/roles/{role\_id}
##### [Delete organization role](/api/reference/typescript/resources/admin/subresources/organization/subresources/roles/methods/delete)
client.admin.organization.roles.delete(stringroleID, RequestOptionsoptions?): [RoleDeleteResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.roles > (model) role_delete_response > (schema)>) { id, deleted, object }
DELETE/organization/roles/{role\_id}
##### ModelsExpand Collapse
Role { id, description, name, 4 more }
Details about a role that can be assigned through the public Roles API.
id: string
Identifier for the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) id>)
description: string | null
Optional description of the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) description>)
name: string
Unique name for the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) name>)
object: "role"
Always `role`.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) object>)
permissions: Array\<string\>
Permissions granted by the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) permissions>)
predefined\_role: boolean
Whether the role is predefined and managed by OpenAI.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) predefined_role>)
resource\_type: string
Resource type the role is bound to (for example `api.organization` or `api.project`).
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) resource_type>)
[](<#(resource) admin.organization.roles > (model) role > (schema)>)
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