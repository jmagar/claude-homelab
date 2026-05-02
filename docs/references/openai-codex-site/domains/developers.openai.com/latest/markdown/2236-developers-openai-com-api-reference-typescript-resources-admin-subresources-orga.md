Roles | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Admin](/api/reference/typescript/resources/admin)
[Organization](/api/reference/typescript/resources/admin/subresources/organization)
[Projects](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Roles
##### [List project roles](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/list)
client.admin.organization.projects.roles.list(stringprojectID, RoleListParams { after, limit, order } query?, RequestOptionsoptions?): CursorPage\<[Role](</api/reference/typescript/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) { id, description, name, 4 more } \>
GET/projects/{project\_id}/roles
##### [Create project role](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/create)
client.admin.organization.projects.roles.create(stringprojectID, RoleCreateParams { permissions, role\_name, description } body, RequestOptionsoptions?): [Role](</api/reference/typescript/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) { id, description, name, 4 more }
POST/projects/{project\_id}/roles
##### [Update project role](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/update)
client.admin.organization.projects.roles.update(stringroleID, RoleUpdateParams { project\_id, description, permissions, role\_name } params, RequestOptionsoptions?): [Role](</api/reference/typescript/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) { id, description, name, 4 more }
POST/projects/{project\_id}/roles/{role\_id}
##### [Delete project role](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/delete)
client.admin.organization.projects.roles.delete(stringroleID, RoleDeleteParams { project\_id } params, RequestOptionsoptions?): [RoleDeleteResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.roles > (model) role_delete_response > (schema)>) { id, deleted, object }
DELETE/projects/{project\_id}/roles/{role\_id}
##### ModelsExpand Collapse
RoleDeleteResponse { id, deleted, object }
Confirmation payload returned after deleting a role.
id: string
Identifier of the deleted role.
[](<#(resource) admin.organization.projects.roles > (model) role_delete_response > (schema) > (property) id>)
deleted: boolean
Whether the role was deleted.
[](<#(resource) admin.organization.projects.roles > (model) role_delete_response > (schema) > (property) deleted>)
object: "role.deleted"
Always `role.deleted`.
[](<#(resource) admin.organization.projects.roles > (model) role_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.roles > (model) role_delete_response > (schema)>)