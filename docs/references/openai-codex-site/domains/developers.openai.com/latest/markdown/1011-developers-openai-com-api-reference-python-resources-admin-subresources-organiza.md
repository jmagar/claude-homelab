Groups | OpenAI API Reference
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
# Groups
##### [List groups](/api/reference/python/resources/admin/subresources/organization/subresources/groups/methods/list)
admin.organization.groups.list(GroupListParams\*\*kwargs) -\> SyncCursorPage[[Group](</api/reference/python/resources/admin#(resource) admin.organization.groups > (model) group > (schema)>)]
GET/organization/groups
##### [Create group](/api/reference/python/resources/admin/subresources/organization/subresources/groups/methods/create)
admin.organization.groups.create(GroupCreateParams\*\*kwargs) -\> [Group](</api/reference/python/resources/admin#(resource) admin.organization.groups > (model) group > (schema)>)
POST/organization/groups
##### [Update group](/api/reference/python/resources/admin/subresources/organization/subresources/groups/methods/update)
admin.organization.groups.update(strgroup\_id, GroupUpdateParams\*\*kwargs) -\> [GroupUpdateResponse](</api/reference/python/resources/admin#(resource) admin.organization.groups > (model) group_update_response > (schema)>)
POST/organization/groups/{group\_id}
##### [Delete group](/api/reference/python/resources/admin/subresources/organization/subresources/groups/methods/delete)
admin.organization.groups.delete(strgroup\_id) -\> [GroupDeleteResponse](</api/reference/python/resources/admin#(resource) admin.organization.groups > (model) group_delete_response > (schema)>)
DELETE/organization/groups/{group\_id}
##### ModelsExpand Collapse
class Group: …
Details about an organization group.
id: str
Identifier for the group.
[](<#(resource) admin.organization.groups > (model) group > (schema) > (property) id>)
created\_at: int
Unix timestamp (in seconds) when the group was created.
formatunixtime
[](<#(resource) admin.organization.groups > (model) group > (schema) > (property) created_at>)
is\_scim\_managed: bool
Whether the group is managed through SCIM and controlled by your identity provider.
[](<#(resource) admin.organization.groups > (model) group > (schema) > (property) is_scim_managed>)
name: str
Display name of the group.
[](<#(resource) admin.organization.groups > (model) group > (schema) > (property) name>)
[](<#(resource) admin.organization.groups > (model) group > (schema)>)
class GroupUpdateResponse: …
Response returned after updating a group.
id: str
Identifier for the group.
[](<#(resource) admin.organization.groups > (model) group_update_response > (schema) > (property) id>)
created\_at: int
Unix timestamp (in seconds) when the group was created.
formatunixtime
[](<#(resource) admin.organization.groups > (model) group_update_response > (schema) > (property) created_at>)
is\_scim\_managed: bool
Whether the group is managed through SCIM and controlled by your identity provider.
[](<#(resource) admin.organization.groups > (model) group_update_response > (schema) > (property) is_scim_managed>)
name: str
Updated display name for the group.
[](<#(resource) admin.organization.groups > (model) group_update_response > (schema) > (property) name>)
[](<#(resource) admin.organization.groups > (model) group_update_response > (schema)>)
class GroupDeleteResponse: …
Confirmation payload returned after deleting a group.
id: str
Identifier of the deleted group.
[](<#(resource) admin.organization.groups > (model) group_delete_response > (schema) > (property) id>)
deleted: bool
Whether the group was deleted.
[](<#(resource) admin.organization.groups > (model) group_delete_response > (schema) > (property) deleted>)
object: Literal["group.deleted"]
Always `group.deleted`.
[](<#(resource) admin.organization.groups > (model) group_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.groups > (model) group_delete_response > (schema)>)
#### GroupsUsers
##### [List group users](/api/reference/python/resources/admin/subresources/organization/subresources/groups/subresources/users/methods/list)
admin.organization.groups.users.list(strgroup\_id, UserListParams\*\*kwargs) -\> SyncCursorPage[[OrganizationUser](</api/reference/python/resources/admin#(resource) admin.organization.users > (model) organization_user > (schema)>)]
GET/organization/groups/{group\_id}/users
##### [Add group user](/api/reference/python/resources/admin/subresources/organization/subresources/groups/subresources/users/methods/create)
admin.organization.groups.users.create(strgroup\_id, UserCreateParams\*\*kwargs) -\> [UserCreateResponse](</api/reference/python/resources/admin#(resource) admin.organization.groups.users > (model) user_create_response > (schema)>)
POST/organization/groups/{group\_id}/users
##### [Remove group user](/api/reference/python/resources/admin/subresources/organization/subresources/groups/subresources/users/methods/delete)
admin.organization.groups.users.delete(struser\_id, UserDeleteParams\*\*kwargs) -\> [UserDeleteResponse](</api/reference/python/resources/admin#(resource) admin.organization.groups.users > (model) user_delete_response > (schema)>)
DELETE/organization/groups/{group\_id}/users/{user\_id}
##### ModelsExpand Collapse
class UserCreateResponse: …
Confirmation payload returned after adding a user to a group.
group\_id: str
Identifier of the group the user was added to.
[](<#(resource) admin.organization.groups.users > (model) user_create_response > (schema) > (property) group_id>)
object: Literal["group.user"]
Always `group.user`.
[](<#(resource) admin.organization.groups.users > (model) user_create_response > (schema) > (property) object>)
user\_id: str
Identifier of the user that was added.
[](<#(resource) admin.organization.groups.users > (model) user_create_response > (schema) > (property) user_id>)
[](<#(resource) admin.organization.groups.users > (model) user_create_response > (schema)>)
class UserDeleteResponse: …
Confirmation payload returned after removing a user from a group.
deleted: bool
Whether the group membership was removed.
[](<#(resource) admin.organization.groups.users > (model) user_delete_response > (schema) > (property) deleted>)
object: Literal["group.user.deleted"]
Always `group.user.deleted`.
[](<#(resource) admin.organization.groups.users > (model) user_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.groups.users > (model) user_delete_response > (schema)>)
#### GroupsRoles
##### [List group organization role assignments](/api/reference/python/resources/admin/subresources/organization/subresources/groups/subresources/roles/methods/list)
admin.organization.groups.roles.list(strgroup\_id, RoleListParams\*\*kwargs) -\> SyncCursorPage[[RoleListResponse](</api/reference/python/resources/admin#(resource) admin.organization.groups.roles > (model) role_list_response > (schema)>)]
GET/organization/groups/{group\_id}/roles
##### [Assign organization role to group](/api/reference/python/resources/admin/subresources/organization/subresources/groups/subresources/roles/methods/create)
admin.organization.groups.roles.create(strgroup\_id, RoleCreateParams\*\*kwargs) -\> [RoleCreateResponse](</api/reference/python/resources/admin#(resource) admin.organization.groups.roles > (model) role_create_response > (schema)>)
POST/organization/groups/{group\_id}/roles
##### [Unassign organization role from group](/api/reference/python/resources/admin/subresources/organization/subresources/groups/subresources/roles/methods/delete)
admin.organization.groups.roles.delete(strrole\_id, RoleDeleteParams\*\*kwargs) -\> [RoleDeleteResponse](</api/reference/python/resources/admin#(resource) admin.organization.groups.roles > (model) role_delete_response > (schema)>)
DELETE/organization/groups/{group\_id}/roles/{role\_id}
##### ModelsExpand Collapse
class RoleListResponse: …
Detailed information about a role assignment entry returned when listing assignments.
id: str
Identifier for the role.
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) id>)
created\_at: Optional[int]
When the role was created.
formatunixtime
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) created_at>)
created\_by: Optional[str]
Identifier of the actor who created the role.
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) created_by>)
created\_by\_user\_obj: Optional[Dict[str, object]]
User details for the actor that created the role, when available.
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) created_by_user_obj>)
description: Optional[str]
Description of the role.
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) description>)
metadata: Optional[Dict[str, object]]
Arbitrary metadata stored on the role.
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) metadata>)
name: str
Name of the role.
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) name>)
permissions: List[str]
Permissions associated with the role.
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) permissions>)
predefined\_role: bool
Whether the role is predefined by OpenAI.
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) predefined_role>)
resource\_type: str
Resource type the role applies to.
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) resource_type>)
updated\_at: Optional[int]
When the role was last updated.
formatint64
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) updated_at>)
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema)>)
class RoleCreateResponse: …
Role assignment linking a group to a role.
group: Group
Summary information about a group returned in role assignment responses.
id: str
Identifier for the group.
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) group > (property) id>)
created\_at: int
Unix timestamp (in seconds) when the group was created.
formatunixtime
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) group > (property) created_at>)
name: str
Display name of the group.
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) group > (property) name>)
object: Literal["group"]
Always `group`.
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) group > (property) object>)
scim\_managed: bool
Whether the group is managed through SCIM.
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) group > (property) scim_managed>)
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) group>)
object: Literal["group.role"]
Always `group.role`.
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) object>)
role: [Role](</api/reference/python/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>)
Details about a role that can be assigned through the public Roles API.
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) role>)
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema)>)
class RoleDeleteResponse: …
Confirmation payload returned after unassigning a role.
deleted: bool
Whether the assignment was removed.
[](<#(resource) admin.organization.groups.roles > (model) role_delete_response > (schema) > (property) deleted>)
object: str
Identifier for the deleted assignment, such as `group.role.deleted` or `user.role.deleted`.
[](<#(resource) admin.organization.groups.roles > (model) role_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.groups.roles > (model) role_delete_response > (schema)>)