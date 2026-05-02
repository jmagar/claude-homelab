Groups | OpenAI API Reference
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
# Groups
##### [List project groups](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/groups/methods/list)
admin.organization.projects.groups.list(project\_id, \*\*kwargs) -\> CursorPage\<[ProjectGroup](</api/reference/ruby/resources/admin#(resource) admin.organization.projects.groups > (model) project_group > (schema)>) { created\_at, group\_id, group\_name, 2 more } \>
GET/organization/projects/{project\_id}/groups
##### [Add project group](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/groups/methods/create)
admin.organization.projects.groups.create(project\_id, \*\*kwargs) -\> [ProjectGroup](</api/reference/ruby/resources/admin#(resource) admin.organization.projects.groups > (model) project_group > (schema)>) { created\_at, group\_id, group\_name, 2 more }
POST/organization/projects/{project\_id}/groups
##### [Remove project group](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/groups/methods/delete)
admin.organization.projects.groups.delete(group\_id, \*\*kwargs) -\> [GroupDeleteResponse](</api/reference/ruby/resources/admin#(resource) admin.organization.projects.groups > (model) group_delete_response > (schema)>) { deleted, object }
DELETE/organization/projects/{project\_id}/groups/{group\_id}
##### ModelsExpand Collapse
class ProjectGroup { created\_at, group\_id, group\_name, 2 more }
Details about a group’s membership in a project.
created\_at: Integer
Unix timestamp (in seconds) when the group was granted project access.
formatunixtime
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) created_at>)
group\_id: String
Identifier of the group that has access to the project.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) group_id>)
group\_name: String
Display name of the group.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) group_name>)
object: :"project.group"
Always `project.group`.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) object>)
project\_id: String
Identifier of the project.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) project_id>)
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema)>)
class GroupDeleteResponse { deleted, object }
Confirmation payload returned after removing a group from a project.
deleted: bool
Whether the group membership in the project was removed.
[](<#(resource) admin.organization.projects.groups > (model) group_delete_response > (schema) > (property) deleted>)
object: :"project.group.deleted"
Always `project.group.deleted`.
[](<#(resource) admin.organization.projects.groups > (model) group_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.groups > (model) group_delete_response > (schema)>)
#### GroupsRoles
##### [List project group role assignments](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/groups/subresources/roles/methods/list)
admin.organization.projects.groups.roles.list(group\_id, \*\*kwargs) -\> CursorPage\<[RoleListResponse](</api/reference/ruby/resources/admin#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema)>) { id, created\_at, created\_by, 8 more } \>
GET/projects/{project\_id}/groups/{group\_id}/roles
##### [Assign project role to group](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/groups/subresources/roles/methods/create)
admin.organization.projects.groups.roles.create(group\_id, \*\*kwargs) -\> [RoleCreateResponse](</api/reference/ruby/resources/admin#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema)>) { group, object, role }
POST/projects/{project\_id}/groups/{group\_id}/roles
##### [Unassign project role from group](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/groups/subresources/roles/methods/delete)
admin.organization.projects.groups.roles.delete(role\_id, \*\*kwargs) -\> [RoleDeleteResponse](</api/reference/ruby/resources/admin#(resource) admin.organization.projects.groups.roles > (model) role_delete_response > (schema)>) { deleted, object }
DELETE/projects/{project\_id}/groups/{group\_id}/roles/{role\_id}
##### ModelsExpand Collapse
class RoleListResponse { id, created\_at, created\_by, 8 more }
Detailed information about a role assignment entry returned when listing assignments.
id: String
Identifier for the role.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) id>)
created\_at: Integer
When the role was created.
formatunixtime
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) created_at>)
created\_by: String
Identifier of the actor who created the role.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) created_by>)
created\_by\_user\_obj: Hash[Symbol, untyped]
User details for the actor that created the role, when available.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) created_by_user_obj>)
description: String
Description of the role.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) description>)
metadata: Hash[Symbol, untyped]
Arbitrary metadata stored on the role.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) metadata>)
name: String
Name of the role.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) name>)
permissions: Array[String]
Permissions associated with the role.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) permissions>)
predefined\_role: bool
Whether the role is predefined by OpenAI.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) predefined_role>)
resource\_type: String
Resource type the role applies to.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) resource_type>)
updated\_at: Integer
When the role was last updated.
formatint64
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) updated_at>)
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema)>)
class RoleCreateResponse { group, object, role }
Role assignment linking a group to a role.
group: Group{ id, created\_at, name, 2 more}
Summary information about a group returned in role assignment responses.
id: String
Identifier for the group.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema) > (property) group > (property) id>)
created\_at: Integer
Unix timestamp (in seconds) when the group was created.
formatunixtime
[](<#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema) > (property) group > (property) created_at>)
name: String
Display name of the group.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema) > (property) group > (property) name>)
object: :group
Always `group`.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema) > (property) group > (property) object>)
scim\_managed: bool
Whether the group is managed through SCIM.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema) > (property) group > (property) scim_managed>)
[](<#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema) > (property) group>)
object: :"group.role"
Always `group.role`.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema) > (property) object>)
role: [Role](</api/reference/ruby/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) { id, description, name, 4 more }
Details about a role that can be assigned through the public Roles API.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema)>)
class RoleDeleteResponse { deleted, object }
Confirmation payload returned after unassigning a role.
deleted: bool
Whether the assignment was removed.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_delete_response > (schema) > (property) deleted>)
object: String
Identifier for the deleted assignment, such as `group.role.deleted` or `user.role.deleted`.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.groups.roles > (model) role_delete_response > (schema)>)