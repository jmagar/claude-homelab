Users | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Admin](/api/reference/java/resources/admin)
[Organization](/api/reference/java/resources/admin/subresources/organization)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Users
##### [List users](/api/reference/java/resources/admin/subresources/organization/subresources/users/methods/list)
UserListPage admin().organization().users().list(UserListParamsparams = UserListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/users
##### [Retrieve user](/api/reference/java/resources/admin/subresources/organization/subresources/users/methods/retrieve)
[OrganizationUser](</api/reference/java/resources/admin#(resource) admin.organization.users > (model) organization_user > (schema)>) admin().organization().users().retrieve(UserRetrieveParamsparams = UserRetrieveParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/users/{user\_id}
##### [Modify user](/api/reference/java/resources/admin/subresources/organization/subresources/users/methods/update)
[OrganizationUser](</api/reference/java/resources/admin#(resource) admin.organization.users > (model) organization_user > (schema)>) admin().organization().users().update(UserUpdateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/users/{user\_id}
##### [Delete user](/api/reference/java/resources/admin/subresources/organization/subresources/users/methods/delete)
[UserDeleteResponse](</api/reference/java/resources/admin#(resource) admin.organization.users > (model) UserDeleteResponse > (schema)>) admin().organization().users().delete(UserDeleteParamsparams = UserDeleteParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
DELETE/organization/users/{user\_id}
##### ModelsExpand Collapse
class OrganizationUser:
Represents an individual `user` within an organization.
String id
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) id>)
long addedAt
The Unix timestamp (in seconds) of when the user was added.
formatunixtime
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) added_at>)
String email
The email address of the user
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) email>)
String name
The name of the user
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) name>)
JsonValue; object\_ "organization.user"constant"organization.user"constant
The object type, which is always `organization.user`
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) object>)
Role role
`owner` or `reader`
One of the following:
OWNER("owner")
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) role > (member) 0>)
READER("reader")
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) role>)
[](<#(resource) admin.organization.users > (model) organization_user > (schema)>)
#### UsersRoles
##### [List user organization role assignments](/api/reference/java/resources/admin/subresources/organization/subresources/users/subresources/roles/methods/list)
RoleListPage admin().organization().users().roles().list(RoleListParamsparams = RoleListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/users/{user\_id}/roles
##### [Assign organization role to user](/api/reference/java/resources/admin/subresources/organization/subresources/users/subresources/roles/methods/create)
[RoleCreateResponse](</api/reference/java/resources/admin#(resource) admin.organization.users.roles > (model) RoleCreateResponse > (schema)>) admin().organization().users().roles().create(RoleCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/users/{user\_id}/roles
##### [Unassign organization role from user](/api/reference/java/resources/admin/subresources/organization/subresources/users/subresources/roles/methods/delete)
[RoleDeleteResponse](</api/reference/java/resources/admin#(resource) admin.organization.users.roles > (model) RoleDeleteResponse > (schema)>) admin().organization().users().roles().delete(RoleDeleteParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
DELETE/organization/users/{user\_id}/roles/{role\_id}