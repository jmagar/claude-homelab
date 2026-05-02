Users | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Admin](/api/reference/typescript/resources/admin)
[Organization](/api/reference/typescript/resources/admin/subresources/organization)
[Groups](/api/reference/typescript/resources/admin/subresources/organization/subresources/groups)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Users
##### [List group users](/api/reference/typescript/resources/admin/subresources/organization/subresources/groups/subresources/users/methods/list)
client.admin.organization.groups.users.list(stringgroupID, UserListParams { after, limit, order } query?, RequestOptionsoptions?): CursorPage\<[OrganizationUser](</api/reference/typescript/resources/admin#(resource) admin.organization.users > (model) organization_user > (schema)>) { id, added\_at, email, 3 more } \>
GET/organization/groups/{group\_id}/users
##### [Add group user](/api/reference/typescript/resources/admin/subresources/organization/subresources/groups/subresources/users/methods/create)
client.admin.organization.groups.users.create(stringgroupID, UserCreateParams { user\_id } body, RequestOptionsoptions?): [UserCreateResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.groups.users > (model) user_create_response > (schema)>) { group\_id, object, user\_id }
POST/organization/groups/{group\_id}/users
##### [Remove group user](/api/reference/typescript/resources/admin/subresources/organization/subresources/groups/subresources/users/methods/delete)
client.admin.organization.groups.users.delete(stringuserID, UserDeleteParams { group\_id } params, RequestOptionsoptions?): [UserDeleteResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.groups.users > (model) user_delete_response > (schema)>) { deleted, object }
DELETE/organization/groups/{group\_id}/users/{user\_id}
##### ModelsExpand Collapse
UserCreateResponse { group\_id, object, user\_id }
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
UserDeleteResponse { deleted, object }
Confirmation payload returned after removing a user from a group.
deleted: boolean
Whether the group membership was removed.
[](<#(resource) admin.organization.groups.users > (model) user_delete_response > (schema) > (property) deleted>)
object: "group.user.deleted"
Always `group.user.deleted`.
[](<#(resource) admin.organization.groups.users > (model) user_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.groups.users > (model) user_delete_response > (schema)>)