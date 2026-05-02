Roles | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Admin](/api/reference/java/resources/admin)
[Organization](/api/reference/java/resources/admin/subresources/organization)
[Projects](/api/reference/java/resources/admin/subresources/organization/subresources/projects)
[Users](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/users)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Roles
##### [List project user role assignments](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/users/subresources/roles/methods/list)
RoleListPage admin().organization().projects().users().roles().list(RoleListParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/projects/{project\_id}/users/{user\_id}/roles
##### [Assign project role to user](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/users/subresources/roles/methods/create)
[RoleCreateResponse](</api/reference/java/resources/admin#(resource) admin.organization.projects.users.roles > (model) RoleCreateResponse > (schema)>) admin().organization().projects().users().roles().create(RoleCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/projects/{project\_id}/users/{user\_id}/roles
##### [Unassign project role from user](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/users/subresources/roles/methods/delete)
[RoleDeleteResponse](</api/reference/java/resources/admin#(resource) admin.organization.projects.users.roles > (model) RoleDeleteResponse > (schema)>) admin().organization().projects().users().roles().delete(RoleDeleteParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
DELETE/projects/{project\_id}/users/{user\_id}/roles/{role\_id}