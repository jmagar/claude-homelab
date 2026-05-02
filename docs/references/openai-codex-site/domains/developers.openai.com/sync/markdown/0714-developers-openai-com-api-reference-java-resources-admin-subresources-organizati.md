Roles | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Admin](/api/reference/java/resources/admin)
[Organization](/api/reference/java/resources/admin/subresources/organization)
[Users](/api/reference/java/resources/admin/subresources/organization/subresources/users)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Roles
##### [List user organization role assignments](/api/reference/java/resources/admin/subresources/organization/subresources/users/subresources/roles/methods/list)
RoleListPage admin().organization().users().roles().list(RoleListParamsparams = RoleListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/users/{user\_id}/roles
##### [Assign organization role to user](/api/reference/java/resources/admin/subresources/organization/subresources/users/subresources/roles/methods/create)
[RoleCreateResponse](</api/reference/java/resources/admin#(resource) admin.organization.users.roles > (model) RoleCreateResponse > (schema)>) admin().organization().users().roles().create(RoleCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/users/{user\_id}/roles
##### [Unassign organization role from user](/api/reference/java/resources/admin/subresources/organization/subresources/users/subresources/roles/methods/delete)
[RoleDeleteResponse](</api/reference/java/resources/admin#(resource) admin.organization.users.roles > (model) RoleDeleteResponse > (schema)>) admin().organization().users().roles().delete(RoleDeleteParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
DELETE/organization/users/{user\_id}/roles/{role\_id}