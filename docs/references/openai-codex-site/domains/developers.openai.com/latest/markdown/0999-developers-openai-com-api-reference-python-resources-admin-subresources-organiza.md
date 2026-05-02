Roles | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Admin](/api/reference/python/resources/admin)
[Organization](/api/reference/python/resources/admin/subresources/organization)
[Projects](/api/reference/python/resources/admin/subresources/organization/subresources/projects)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Roles
##### [List project roles](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/list)
admin.organization.projects.roles.list(strproject\_id, RoleListParams\*\*kwargs) -\> SyncCursorPage[[Role](</api/reference/python/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>)]
GET/projects/{project\_id}/roles
##### [Create project role](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/create)
admin.organization.projects.roles.create(strproject\_id, RoleCreateParams\*\*kwargs) -\> [Role](</api/reference/python/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>)
POST/projects/{project\_id}/roles
##### [Update project role](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/update)
admin.organization.projects.roles.update(strrole\_id, RoleUpdateParams\*\*kwargs) -\> [Role](</api/reference/python/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>)
POST/projects/{project\_id}/roles/{role\_id}
##### [Delete project role](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/delete)
admin.organization.projects.roles.delete(strrole\_id, RoleDeleteParams\*\*kwargs) -\> [RoleDeleteResponse](</api/reference/python/resources/admin#(resource) admin.organization.projects.roles > (model) role_delete_response > (schema)>)
DELETE/projects/{project\_id}/roles/{role\_id}
##### ModelsExpand Collapse
class RoleDeleteResponse: …
Confirmation payload returned after deleting a role.
id: str
Identifier of the deleted role.
[](<#(resource) admin.organization.projects.roles > (model) role_delete_response > (schema) > (property) id>)
deleted: bool
Whether the role was deleted.
[](<#(resource) admin.organization.projects.roles > (model) role_delete_response > (schema) > (property) deleted>)
object: Literal["role.deleted"]
Always `role.deleted`.
[](<#(resource) admin.organization.projects.roles > (model) role_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.roles > (model) role_delete_response > (schema)>)