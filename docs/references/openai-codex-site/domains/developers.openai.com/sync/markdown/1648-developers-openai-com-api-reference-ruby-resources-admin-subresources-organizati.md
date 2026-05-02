Users | OpenAI API Reference
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
# Users
##### [List project users](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/list)
admin.organization.projects.users.list(project\_id, \*\*kwargs) -\> ConversationCursorPage\<[ProjectUser](</api/reference/ruby/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>) { id, added\_at, email, 3 more } \>
GET/organization/projects/{project\_id}/users
##### [Create project user](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/create)
admin.organization.projects.users.create(project\_id, \*\*kwargs) -\> [ProjectUser](</api/reference/ruby/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>) { id, added\_at, email, 3 more }
POST/organization/projects/{project\_id}/users
##### [Retrieve project user](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/retrieve)
admin.organization.projects.users.retrieve(user\_id, \*\*kwargs) -\> [ProjectUser](</api/reference/ruby/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>) { id, added\_at, email, 3 more }
GET/organization/projects/{project\_id}/users/{user\_id}
##### [Modify project user](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/update)
admin.organization.projects.users.update(user\_id, \*\*kwargs) -\> [ProjectUser](</api/reference/ruby/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>) { id, added\_at, email, 3 more }
POST/organization/projects/{project\_id}/users/{user\_id}
##### [Delete project user](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/delete)
admin.organization.projects.users.delete(user\_id, \*\*kwargs) -\> [UserDeleteResponse](</api/reference/ruby/resources/admin#(resource) admin.organization.projects.users > (model) user_delete_response > (schema)>) { id, deleted, object }
DELETE/organization/projects/{project\_id}/users/{user\_id}
##### ModelsExpand Collapse
class ProjectUser { id, added\_at, email, 3 more }
Represents an individual user in a project.
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) id>)
added\_at: Integer
The Unix timestamp (in seconds) of when the project was added.
formatunixtime
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) added_at>)
email: String
The email address of the user
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) email>)
name: String
The name of the user
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) name>)
object: :"organization.project.user"
The object type, which is always `organization.project.user`
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) object>)
role: :owner | :member
`owner` or `member`
One of the following:
:owner
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role > (member) 0>)
:member
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema)>)
class UserDeleteResponse { id, deleted, object }
id: String
[](<#(resource) admin.organization.projects.users > (model) user_delete_response > (schema) > (property) id>)
deleted: bool
[](<#(resource) admin.organization.projects.users > (model) user_delete_response > (schema) > (property) deleted>)
object: :"organization.project.user.deleted"
[](<#(resource) admin.organization.projects.users > (model) user_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.users > (model) user_delete_response > (schema)>)
#### UsersRoles
##### [List project user role assignments](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/users/subresources/roles/methods/list)
admin.organization.projects.users.roles.list(user\_id, \*\*kwargs) -\> CursorPage\<[RoleListResponse](</api/reference/ruby/resources/admin#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema)>) { id, created\_at, created\_by, 8 more } \>
GET/projects/{project\_id}/users/{user\_id}/roles
##### [Assign project role to user](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/users/subresources/roles/methods/create)
admin.organization.projects.users.roles.create(user\_id, \*\*kwargs) -\> [RoleCreateResponse](</api/reference/ruby/resources/admin#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema)>) { object, role, user }
POST/projects/{project\_id}/users/{user\_id}/roles
##### [Unassign project role from user](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/users/subresources/roles/methods/delete)
admin.organization.projects.users.roles.delete(role\_id, \*\*kwargs) -\> [RoleDeleteResponse](</api/reference/ruby/resources/admin#(resource) admin.organization.projects.users.roles > (model) role_delete_response > (schema)>) { deleted, object }
DELETE/projects/{project\_id}/users/{user\_id}/roles/{role\_id}
##### ModelsExpand Collapse
class RoleListResponse { id, created\_at, created\_by, 8 more }
Detailed information about a role assignment entry returned when listing assignments.
id: String
Identifier for the role.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) id>)
created\_at: Integer
When the role was created.
formatunixtime
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) created_at>)
created\_by: String
Identifier of the actor who created the role.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) created_by>)
created\_by\_user\_obj: Hash[Symbol, untyped]
User details for the actor that created the role, when available.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) created_by_user_obj>)
description: String
Description of the role.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) description>)
metadata: Hash[Symbol, untyped]
Arbitrary metadata stored on the role.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) metadata>)
name: String
Name of the role.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) name>)
permissions: Array[String]
Permissions associated with the role.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) permissions>)
predefined\_role: bool
Whether the role is predefined by OpenAI.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) predefined_role>)
resource\_type: String
Resource type the role applies to.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) resource_type>)
updated\_at: Integer
When the role was last updated.
formatint64
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) updated_at>)
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema)>)
class RoleCreateResponse { object, role, user }
Role assignment linking a user to a role.
object: :"user.role"
Always `user.role`.
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema) > (property) object>)
role: [Role](</api/reference/ruby/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) { id, description, name, 4 more }
Details about a role that can be assigned through the public Roles API.
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema) > (property) role>)
user: [OrganizationUser](</api/reference/ruby/resources/admin#(resource) admin.organization.users > (model) organization_user > (schema)>) { id, added\_at, email, 3 more }
Represents an individual `user` within an organization.
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema) > (property) user>)
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema)>)
class RoleDeleteResponse { deleted, object }
Confirmation payload returned after unassigning a role.
deleted: bool
Whether the assignment was removed.
[](<#(resource) admin.organization.projects.users.roles > (model) role_delete_response > (schema) > (property) deleted>)
object: String
Identifier for the deleted assignment, such as `group.role.deleted` or `user.role.deleted`.
[](<#(resource) admin.organization.projects.users.roles > (model) role_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.users.roles > (model) role_delete_response > (schema)>)