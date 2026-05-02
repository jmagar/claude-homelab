Users | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Admin](/api/reference/ruby/resources/admin)
[Organization](/api/reference/ruby/resources/admin/subresources/organization)
[Groups](/api/reference/ruby/resources/admin/subresources/organization/subresources/groups)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Users
##### [List group users](/api/reference/ruby/resources/admin/subresources/organization/subresources/groups/subresources/users/methods/list)
admin.organization.groups.users.list(group\_id, \*\*kwargs) -\> CursorPage\<[OrganizationUser](</api/reference/ruby/resources/admin#(resource) admin.organization.users > (model) organization_user > (schema)>) { id, added\_at, email, 3 more } \>
GET/organization/groups/{group\_id}/users
##### [Add group user](/api/reference/ruby/resources/admin/subresources/organization/subresources/groups/subresources/users/methods/create)
admin.organization.groups.users.create(group\_id, \*\*kwargs) -\> [UserCreateResponse](</api/reference/ruby/resources/admin#(resource) admin.organization.groups.users > (model) user_create_response > (schema)>) { group\_id, object, user\_id }
POST/organization/groups/{group\_id}/users
##### [Remove group user](/api/reference/ruby/resources/admin/subresources/organization/subresources/groups/subresources/users/methods/delete)
admin.organization.groups.users.delete(user\_id, \*\*kwargs) -\> [UserDeleteResponse](</api/reference/ruby/resources/admin#(resource) admin.organization.groups.users > (model) user_delete_response > (schema)>) { deleted, object }
DELETE/organization/groups/{group\_id}/users/{user\_id}
##### ModelsExpand Collapse
class UserCreateResponse { group\_id, object, user\_id }
Confirmation payload returned after adding a user to a group.
group\_id: String
Identifier of the group the user was added to.
[](<#(resource) admin.organization.groups.users > (model) user_create_response > (schema) > (property) group_id>)
object: :"group.user"
Always `group.user`.
[](<#(resource) admin.organization.groups.users > (model) user_create_response > (schema) > (property) object>)
user\_id: String
Identifier of the user that was added.
[](<#(resource) admin.organization.groups.users > (model) user_create_response > (schema) > (property) user_id>)
[](<#(resource) admin.organization.groups.users > (model) user_create_response > (schema)>)
class UserDeleteResponse { deleted, object }
Confirmation payload returned after removing a user from a group.
deleted: bool
Whether the group membership was removed.
[](<#(resource) admin.organization.groups.users > (model) user_delete_response > (schema) > (property) deleted>)
object: :"group.user.deleted"
Always `group.user.deleted`.
[](<#(resource) admin.organization.groups.users > (model) user_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.groups.users > (model) user_delete_response > (schema)>)