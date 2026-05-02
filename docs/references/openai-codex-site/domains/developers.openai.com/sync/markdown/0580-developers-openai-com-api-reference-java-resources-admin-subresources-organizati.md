Users | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Admin](/api/reference/java/resources/admin)
[Organization](/api/reference/java/resources/admin/subresources/organization)
[Groups](/api/reference/java/resources/admin/subresources/organization/subresources/groups)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Users
##### [List group users](/api/reference/java/resources/admin/subresources/organization/subresources/groups/subresources/users/methods/list)
UserListPage admin().organization().groups().users().list(UserListParamsparams = UserListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/groups/{group\_id}/users
##### [Add group user](/api/reference/java/resources/admin/subresources/organization/subresources/groups/subresources/users/methods/create)
[UserCreateResponse](</api/reference/java/resources/admin#(resource) admin.organization.groups.users > (model) UserCreateResponse > (schema)>) admin().organization().groups().users().create(UserCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/groups/{group\_id}/users
##### [Remove group user](/api/reference/java/resources/admin/subresources/organization/subresources/groups/subresources/users/methods/delete)
[UserDeleteResponse](</api/reference/java/resources/admin#(resource) admin.organization.groups.users > (model) UserDeleteResponse > (schema)>) admin().organization().groups().users().delete(UserDeleteParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
DELETE/organization/groups/{group\_id}/users/{user\_id}