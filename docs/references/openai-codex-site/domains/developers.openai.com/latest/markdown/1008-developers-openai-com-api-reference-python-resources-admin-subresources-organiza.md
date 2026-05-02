Users | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Admin](/api/reference/python/resources/admin)
[Organization](/api/reference/python/resources/admin/subresources/organization)
[Groups](/api/reference/python/resources/admin/subresources/organization/subresources/groups)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Users
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