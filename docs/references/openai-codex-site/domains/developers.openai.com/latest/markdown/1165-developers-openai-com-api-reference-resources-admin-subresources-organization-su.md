Groups | OpenAI API Reference
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
# Groups
##### [List groups](/api/reference/resources/admin/subresources/organization/subresources/groups/methods/list)
GET/organization/groups
##### [Create group](/api/reference/resources/admin/subresources/organization/subresources/groups/methods/create)
POST/organization/groups
##### [Update group](/api/reference/resources/admin/subresources/organization/subresources/groups/methods/update)
POST/organization/groups/{group\_id}
##### [Delete group](/api/reference/resources/admin/subresources/organization/subresources/groups/methods/delete)
DELETE/organization/groups/{group\_id}
##### ModelsExpand Collapse
Group object { id, created\_at, is\_scim\_managed, name }
Details about an organization group.
id: string
Identifier for the group.
[](<#(resource) admin.organization.groups > (model) group > (schema) > (property) id>)
created\_at: number
Unix timestamp (in seconds) when the group was created.
formatunixtime
[](<#(resource) admin.organization.groups > (model) group > (schema) > (property) created_at>)
is\_scim\_managed: boolean
Whether the group is managed through SCIM and controlled by your identity provider.
[](<#(resource) admin.organization.groups > (model) group > (schema) > (property) is_scim_managed>)
name: string
Display name of the group.
[](<#(resource) admin.organization.groups > (model) group > (schema) > (property) name>)
[](<#(resource) admin.organization.groups > (model) group > (schema)>)
GroupUpdateResponse object { id, created\_at, is\_scim\_managed, name }
Response returned after updating a group.
id: string
Identifier for the group.
[](<#(resource) admin.organization.groups > (model) group_update_response > (schema) > (property) id>)
created\_at: number
Unix timestamp (in seconds) when the group was created.
formatunixtime
[](<#(resource) admin.organization.groups > (model) group_update_response > (schema) > (property) created_at>)
is\_scim\_managed: boolean
Whether the group is managed through SCIM and controlled by your identity provider.
[](<#(resource) admin.organization.groups > (model) group_update_response > (schema) > (property) is_scim_managed>)
name: string
Updated display name for the group.
[](<#(resource) admin.organization.groups > (model) group_update_response > (schema) > (property) name>)
[](<#(resource) admin.organization.groups > (model) group_update_response > (schema)>)
GroupDeleteResponse object { id, deleted, object }
Confirmation payload returned after deleting a group.
id: string
Identifier of the deleted group.
[](<#(resource) admin.organization.groups > (model) group_delete_response > (schema) > (property) id>)
deleted: boolean
Whether the group was deleted.
[](<#(resource) admin.organization.groups > (model) group_delete_response > (schema) > (property) deleted>)
object: "group.deleted"
Always `group.deleted`.
[](<#(resource) admin.organization.groups > (model) group_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.groups > (model) group_delete_response > (schema)>)
#### GroupsUsers
##### [List group users](/api/reference/resources/admin/subresources/organization/subresources/groups/subresources/users/methods/list)
GET/organization/groups/{group\_id}/users
##### [Add group user](/api/reference/resources/admin/subresources/organization/subresources/groups/subresources/users/methods/create)
POST/organization/groups/{group\_id}/users
##### [Remove group user](/api/reference/resources/admin/subresources/organization/subresources/groups/subresources/users/methods/delete)
DELETE/organization/groups/{group\_id}/users/{user\_id}
##### ModelsExpand Collapse
UserCreateResponse object { group\_id, object, user\_id }
Confirmation payload returned after adding a user to a group.
group\_id: string
Identifier of the group the user was added to.
[](<#(resource) admin.organization.groups.users > (model) user_create_response > (schema) > (property) group_id>)
object: "group.user"
Always `group.user`.
[](<#(resource) admin.organization.groups.users > (model) user_create_response > (schema) > (property) object>)
user\_id: string
Identifier of the user that was added.
[](<#(resource) admin.organization.groups.users > (model) user_create_response > (schema) > (property) user_id>)
[](<#(resource) admin.organization.groups.users > (model) user_create_response > (schema)>)
UserDeleteResponse object { deleted, object }
Confirmation payload returned after removing a user from a group.
deleted: boolean
Whether the group membership was removed.
[](<#(resource) admin.organization.groups.users > (model) user_delete_response > (schema) > (property) deleted>)
object: "group.user.deleted"
Always `group.user.deleted`.
[](<#(resource) admin.organization.groups.users > (model) user_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.groups.users > (model) user_delete_response > (schema)>)
#### GroupsRoles
##### [List group organization role assignments](/api/reference/resources/admin/subresources/organization/subresources/groups/subresources/roles/methods/list)
GET/organization/groups/{group\_id}/roles
##### [Assign organization role to group](/api/reference/resources/admin/subresources/organization/subresources/groups/subresources/roles/methods/create)
POST/organization/groups/{group\_id}/roles
##### [Unassign organization role from group](/api/reference/resources/admin/subresources/organization/subresources/groups/subresources/roles/methods/delete)
DELETE/organization/groups/{group\_id}/roles/{role\_id}
##### ModelsExpand Collapse
RoleListResponse object { id, created\_at, created\_by, 8 more }
Detailed information about a role assignment entry returned when listing assignments.
id: string
Identifier for the role.
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) id>)
created\_at: number
When the role was created.
formatunixtime
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) created_at>)
created\_by: string
Identifier of the actor who created the role.
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) created_by>)
created\_by\_user\_obj: map[unknown]
User details for the actor that created the role, when available.
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) created_by_user_obj>)
description: string
Description of the role.
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) description>)
metadata: map[unknown]
Arbitrary metadata stored on the role.
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) metadata>)
name: string
Name of the role.
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) name>)
permissions: array of string
Permissions associated with the role.
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) permissions>)
predefined\_role: boolean
Whether the role is predefined by OpenAI.
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) predefined_role>)
resource\_type: string
Resource type the role applies to.
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) resource_type>)
updated\_at: number
When the role was last updated.
formatint64
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema) > (property) updated_at>)
[](<#(resource) admin.organization.groups.roles > (model) role_list_response > (schema)>)
RoleCreateResponse object { group, object, role }
Role assignment linking a group to a role.
group: object { id, created\_at, name, 2 more }
Summary information about a group returned in role assignment responses.
id: string
Identifier for the group.
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) group > (property) id>)
created\_at: number
Unix timestamp (in seconds) when the group was created.
formatunixtime
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) group > (property) created_at>)
name: string
Display name of the group.
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) group > (property) name>)
object: "group"
Always `group`.
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) group > (property) object>)
scim\_managed: boolean
Whether the group is managed through SCIM.
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) group > (property) scim_managed>)
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) group>)
object: "group.role"
Always `group.role`.
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) object>)
role: [Role](</api/reference/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) { id, description, name, 4 more }
Details about a role that can be assigned through the public Roles API.
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema) > (property) role>)
[](<#(resource) admin.organization.groups.roles > (model) role_create_response > (schema)>)
RoleDeleteResponse object { deleted, object }
Confirmation payload returned after unassigning a role.
deleted: boolean
Whether the assignment was removed.
[](<#(resource) admin.organization.groups.roles > (model) role_delete_response > (schema) > (property) deleted>)
object: string
Identifier for the deleted assignment, such as `group.role.deleted` or `user.role.deleted`.
[](<#(resource) admin.organization.groups.roles > (model) role_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.groups.roles > (model) role_delete_response > (schema)>)