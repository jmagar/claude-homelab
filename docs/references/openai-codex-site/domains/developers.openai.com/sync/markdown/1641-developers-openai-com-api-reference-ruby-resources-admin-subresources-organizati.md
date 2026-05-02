Roles | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Admin](/api/reference/ruby/resources/admin)
[Organization](/api/reference/ruby/resources/admin/subresources/organization)
[Projects](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Roles
##### [List project roles](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/list)
admin.organization.projects.roles.list(project\_id, \*\*kwargs) -\> CursorPage\<[Role](</api/reference/ruby/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) { id, description, name, 4 more } \>
GET/projects/{project\_id}/roles
##### [Create project role](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/create)
admin.organization.projects.roles.create(project\_id, \*\*kwargs) -\> [Role](</api/reference/ruby/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) { id, description, name, 4 more }
POST/projects/{project\_id}/roles
##### [Update project role](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/update)
admin.organization.projects.roles.update(role\_id, \*\*kwargs) -\> [Role](</api/reference/ruby/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) { id, description, name, 4 more }
POST/projects/{project\_id}/roles/{role\_id}
##### [Delete project role](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/delete)
admin.organization.projects.roles.delete(role\_id, \*\*kwargs) -\> [RoleDeleteResponse](</api/reference/ruby/resources/admin#(resource) admin.organization.projects.roles > (model) role_delete_response > (schema)>) { id, deleted, object }
DELETE/projects/{project\_id}/roles/{role\_id}
##### ModelsExpand Collapse
class RoleDeleteResponse { id, deleted, object }
Confirmation payload returned after deleting a role.
id: String
Identifier of the deleted role.
[](<#(resource) admin.organization.projects.roles > (model) role_delete_response > (schema) > (property) id>)
deleted: bool
Whether the role was deleted.
[](<#(resource) admin.organization.projects.roles > (model) role_delete_response > (schema) > (property) deleted>)
object: :"role.deleted"
Always `role.deleted`.
[](<#(resource) admin.organization.projects.roles > (model) role_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.roles > (model) role_delete_response > (schema)>)