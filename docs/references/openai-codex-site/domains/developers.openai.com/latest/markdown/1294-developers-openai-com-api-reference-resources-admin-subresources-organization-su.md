Roles | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Admin](/api/reference/resources/admin)
[Organization](/api/reference/resources/admin/subresources/organization)
[Projects](/api/reference/resources/admin/subresources/organization/subresources/projects)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Roles
##### [List project roles](/api/reference/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/list)
GET/projects/{project\_id}/roles
##### [Create project role](/api/reference/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/create)
POST/projects/{project\_id}/roles
##### [Update project role](/api/reference/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/update)
POST/projects/{project\_id}/roles/{role\_id}
##### [Delete project role](/api/reference/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/delete)
DELETE/projects/{project\_id}/roles/{role\_id}
##### ModelsExpand Collapse
RoleDeleteResponse object { id, deleted, object }
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