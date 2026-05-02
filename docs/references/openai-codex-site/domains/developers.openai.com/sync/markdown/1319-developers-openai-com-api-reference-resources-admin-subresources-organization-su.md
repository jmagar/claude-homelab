Users | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Admin](/api/reference/resources/admin)
[Organization](/api/reference/resources/admin/subresources/organization)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Users
##### [List users](/api/reference/resources/admin/subresources/organization/subresources/users/methods/list)
GET/organization/users
##### [Retrieve user](/api/reference/resources/admin/subresources/organization/subresources/users/methods/retrieve)
GET/organization/users/{user\_id}
##### [Modify user](/api/reference/resources/admin/subresources/organization/subresources/users/methods/update)
POST/organization/users/{user\_id}
##### [Delete user](/api/reference/resources/admin/subresources/organization/subresources/users/methods/delete)
DELETE/organization/users/{user\_id}
##### ModelsExpand Collapse
OrganizationUser object { id, added\_at, email, 3 more }
Represents an individual `user` within an organization.
id: string
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) id>)
added\_at: number
The Unix timestamp (in seconds) of when the user was added.
formatunixtime
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) added_at>)
email: string
The email address of the user
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) email>)
name: string
The name of the user
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) name>)
object: "organization.user"
The object type, which is always `organization.user`
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) object>)
role: "owner" or "reader"
`owner` or `reader`
One of the following:
"owner"
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) role > (member) 0>)
"reader"
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) role>)
[](<#(resource) admin.organization.users > (model) organization_user > (schema)>)
UserDeleteResponse object { id, deleted, object }
id: string
[](<#(resource) admin.organization.users > (model) user_delete_response > (schema) > (property) id>)
deleted: boolean
[](<#(resource) admin.organization.users > (model) user_delete_response > (schema) > (property) deleted>)
object: "organization.user.deleted"
[](<#(resource) admin.organization.users > (model) user_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.users > (model) user_delete_response > (schema)>)
#### UsersRoles
##### [List user organization role assignments](/api/reference/resources/admin/subresources/organization/subresources/users/subresources/roles/methods/list)
GET/organization/users/{user\_id}/roles
##### [Assign organization role to user](/api/reference/resources/admin/subresources/organization/subresources/users/subresources/roles/methods/create)
POST/organization/users/{user\_id}/roles
##### [Unassign organization role from user](/api/reference/resources/admin/subresources/organization/subresources/users/subresources/roles/methods/delete)
DELETE/organization/users/{user\_id}/roles/{role\_id}
##### ModelsExpand Collapse
RoleListResponse object { id, created\_at, created\_by, 8 more }
Detailed information about a role assignment entry returned when listing assignments.
id: string
Identifier for the role.
[](<#(resource) admin.organization.users.roles > (model) role_list_response > (schema) > (property) id>)
created\_at: number
When the role was created.
formatunixtime
[](<#(resource) admin.organization.users.roles > (model) role_list_response > (schema) > (property) created_at>)
created\_by: string
Identifier of the actor who created the role.
[](<#(resource) admin.organization.users.roles > (model) role_list_response > (schema) > (property) created_by>)
created\_by\_user\_obj: map[unknown]
User details for the actor that created the role, when available.
[](<#(resource) admin.organization.users.roles > (model) role_list_response > (schema) > (property) created_by_user_obj>)
description: string
Description of the role.
[](<#(resource) admin.organization.users.roles > (model) role_list_response > (schema) > (property) description>)
metadata: map[unknown]
Arbitrary metadata stored on the role.
[](<#(resource) admin.organization.users.roles > (model) role_list_response > (schema) > (property) metadata>)
name: string
Name of the role.
[](<#(resource) admin.organization.users.roles > (model) role_list_response > (schema) > (property) name>)
permissions: array of string
Permissions associated with the role.
[](<#(resource) admin.organization.users.roles > (model) role_list_response > (schema) > (property) permissions>)
predefined\_role: boolean
Whether the role is predefined by OpenAI.
[](<#(resource) admin.organization.users.roles > (model) role_list_response > (schema) > (property) predefined_role>)
resource\_type: string
Resource type the role applies to.
[](<#(resource) admin.organization.users.roles > (model) role_list_response > (schema) > (property) resource_type>)
updated\_at: number
When the role was last updated.
formatint64
[](<#(resource) admin.organization.users.roles > (model) role_list_response > (schema) > (property) updated_at>)
[](<#(resource) admin.organization.users.roles > (model) role_list_response > (schema)>)
RoleCreateResponse object { object, role, user }
Role assignment linking a user to a role.
object: "user.role"
Always `user.role`.
[](<#(resource) admin.organization.users.roles > (model) role_create_response > (schema) > (property) object>)
role: [Role](</api/reference/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) { id, description, name, 4 more }
Details about a role that can be assigned through the public Roles API.
[](<#(resource) admin.organization.users.roles > (model) role_create_response > (schema) > (property) role>)
user: [OrganizationUser](</api/reference/resources/admin#(resource) admin.organization.users > (model) organization_user > (schema)>) { id, added\_at, email, 3 more }
Represents an individual `user` within an organization.
[](<#(resource) admin.organization.users.roles > (model) role_create_response > (schema) > (property) user>)
[](<#(resource) admin.organization.users.roles > (model) role_create_response > (schema)>)
RoleDeleteResponse object { deleted, object }
Confirmation payload returned after unassigning a role.
deleted: boolean
Whether the assignment was removed.
[](<#(resource) admin.organization.users.roles > (model) role_delete_response > (schema) > (property) deleted>)
object: string
Identifier for the deleted assignment, such as `group.role.deleted` or `user.role.deleted`.
[](<#(resource) admin.organization.users.roles > (model) role_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.users.roles > (model) role_delete_response > (schema)>)