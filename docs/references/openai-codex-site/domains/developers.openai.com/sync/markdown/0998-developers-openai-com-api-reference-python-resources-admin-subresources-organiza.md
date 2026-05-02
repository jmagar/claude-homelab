Users | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Admin](/api/reference/python/resources/admin)
[Organization](/api/reference/python/resources/admin/subresources/organization)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Users
##### [List users](/api/reference/python/resources/admin/subresources/organization/subresources/users/methods/list)
admin.organization.users.list(UserListParams\*\*kwargs) -\> SyncConversationCursorPage[[OrganizationUser](</api/reference/python/resources/admin#(resource) admin.organization.users > (model) organization_user > (schema)>)]
GET/organization/users
##### [Retrieve user](/api/reference/python/resources/admin/subresources/organization/subresources/users/methods/retrieve)
admin.organization.users.retrieve(struser\_id) -\> [OrganizationUser](</api/reference/python/resources/admin#(resource) admin.organization.users > (model) organization_user > (schema)>)
GET/organization/users/{user\_id}
##### [Modify user](/api/reference/python/resources/admin/subresources/organization/subresources/users/methods/update)
admin.organization.users.update(struser\_id, UserUpdateParams\*\*kwargs) -\> [OrganizationUser](</api/reference/python/resources/admin#(resource) admin.organization.users > (model) organization_user > (schema)>)
POST/organization/users/{user\_id}
##### [Delete user](/api/reference/python/resources/admin/subresources/organization/subresources/users/methods/delete)
admin.organization.users.delete(struser\_id) -\> [UserDeleteResponse](</api/reference/python/resources/admin#(resource) admin.organization.users > (model) user_delete_response > (schema)>)
DELETE/organization/users/{user\_id}
##### ModelsExpand Collapse
class OrganizationUser: …
Represents an individual `user` within an organization.
id: str
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) id>)
added\_at: int
The Unix timestamp (in seconds) of when the user was added.
formatunixtime
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) added_at>)
email: str
The email address of the user
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) email>)
name: str
The name of the user
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) name>)
object: Literal["organization.user"]
The object type, which is always `organization.user`
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) object>)
role: Literal["owner", "reader"]
`owner` or `reader`
One of the following:
"owner"
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) role > (member) 0>)
"reader"
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) role>)
[](<#(resource) admin.organization.users > (model) organization_user > (schema)>)
class UserDeleteResponse: …
id: str
[](<#(resource) admin.organization.users > (model) user_delete_response > (schema) > (property) id>)
deleted: bool
[](<#(resource) admin.organization.users > (model) user_delete_response > (schema) > (property) deleted>)
object: Literal["organization.user.deleted"]
[](<#(resource) admin.organization.users > (model) user_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.users > (model) user_delete_response > (schema)>)
#### UsersRoles
##### [List user organization role assignments](/api/reference/python/resources/admin/subresources/organization/subresources/users/subresources/roles/methods/list)
admin.organization.users.roles.list(struser\_id, RoleListParams\*\*kwargs) -\> SyncCursorPage[[RoleListResponse](</api/reference/python/resources/admin#(resource) admin.organization.users.roles > (model) role_list_response > (schema)>)]
GET/organization/users/{user\_id}/roles
##### [Assign organization role to user](/api/reference/python/resources/admin/subresources/organization/subresources/users/subresources/roles/methods/create)
admin.organization.users.roles.create(struser\_id, RoleCreateParams\*\*kwargs) -\> [RoleCreateResponse](</api/reference/python/resources/admin#(resource) admin.organization.users.roles > (model) role_create_response > (schema)>)
POST/organization/users/{user\_id}/roles
##### [Unassign organization role from user](/api/reference/python/resources/admin/subresources/organization/subresources/users/subresources/roles/methods/delete)
admin.organization.users.roles.delete(strrole\_id, RoleDeleteParams\*\*kwargs) -\> [RoleDeleteResponse](</api/reference/python/resources/admin#(resource) admin.organization.users.roles > (model) role_delete_response > (schema)>)
DELETE/organization/users/{user\_id}/roles/{role\_id}
##### ModelsExpand Collapse
class RoleListResponse: …
Detailed information about a role assignment entry returned when listing assignments.
id: str
Identifier for the role.
[](<#(resource) admin.organization.users.roles > (model) role_list_response > (schema) > (property) id>)
created\_at: Optional[int]
When the role was created.
formatunixtime
[](<#(resource) admin.organization.users.roles > (model) role_list_response > (schema) > (property) created_at>)
created\_by: Optional[str]
Identifier of the actor who created the role.
[](<#(resource) admin.organization.users.roles > (model) role_list_response > (schema) > (property) created_by>)
created\_by\_user\_obj: Optional[Dict[str, object]]
User details for the actor that created the role, when available.
[](<#(resource) admin.organization.users.roles > (model) role_list_response > (schema) > (property) created_by_user_obj>)
description: Optional[str]
Description of the role.
[](<#(resource) admin.organization.users.roles > (model) role_list_response > (schema) > (property) description>)
metadata: Optional[Dict[str, object]]
Arbitrary metadata stored on the role.
[](<#(resource) admin.organization.users.roles > (model) role_list_response > (schema) > (property) metadata>)
name: str
Name of the role.
[](<#(resource) admin.organization.users.roles > (model) role_list_response > (schema) > (property) name>)
permissions: List[str]
Permissions associated with the role.
[](<#(resource) admin.organization.users.roles > (model) role_list_response > (schema) > (property) permissions>)
predefined\_role: bool
Whether the role is predefined by OpenAI.
[](<#(resource) admin.organization.users.roles > (model) role_list_response > (schema) > (property) predefined_role>)
resource\_type: str
Resource type the role applies to.
[](<#(resource) admin.organization.users.roles > (model) role_list_response > (schema) > (property) resource_type>)
updated\_at: Optional[int]
When the role was last updated.
formatint64
[](<#(resource) admin.organization.users.roles > (model) role_list_response > (schema) > (property) updated_at>)
[](<#(resource) admin.organization.users.roles > (model) role_list_response > (schema)>)
class RoleCreateResponse: …
Role assignment linking a user to a role.
object: Literal["user.role"]
Always `user.role`.
[](<#(resource) admin.organization.users.roles > (model) role_create_response > (schema) > (property) object>)
role: [Role](</api/reference/python/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>)
Details about a role that can be assigned through the public Roles API.
[](<#(resource) admin.organization.users.roles > (model) role_create_response > (schema) > (property) role>)
user: [OrganizationUser](</api/reference/python/resources/admin#(resource) admin.organization.users > (model) organization_user > (schema)>)
Represents an individual `user` within an organization.
[](<#(resource) admin.organization.users.roles > (model) role_create_response > (schema) > (property) user>)
[](<#(resource) admin.organization.users.roles > (model) role_create_response > (schema)>)
class RoleDeleteResponse: …
Confirmation payload returned after unassigning a role.
deleted: bool
Whether the assignment was removed.
[](<#(resource) admin.organization.users.roles > (model) role_delete_response > (schema) > (property) deleted>)
object: str
Identifier for the deleted assignment, such as `group.role.deleted` or `user.role.deleted`.
[](<#(resource) admin.organization.users.roles > (model) role_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.users.roles > (model) role_delete_response > (schema)>)