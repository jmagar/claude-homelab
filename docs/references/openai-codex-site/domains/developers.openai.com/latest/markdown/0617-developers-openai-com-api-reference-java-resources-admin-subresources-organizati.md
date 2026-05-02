Roles | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Admin](/api/reference/java/resources/admin)
[Organization](/api/reference/java/resources/admin/subresources/organization)
[Projects](/api/reference/java/resources/admin/subresources/organization/subresources/projects)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Roles
##### [List project roles](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/list)
RoleListPage admin().organization().projects().roles().list(RoleListParamsparams = RoleListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/projects/{project\_id}/roles
##### [Create project role](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/create)
[Role](</api/reference/java/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) admin().organization().projects().roles().create(RoleCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/projects/{project\_id}/roles
##### [Update project role](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/update)
[Role](</api/reference/java/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) admin().organization().projects().roles().update(RoleUpdateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/projects/{project\_id}/roles/{role\_id}
##### [Delete project role](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/delete)
[RoleDeleteResponse](</api/reference/java/resources/admin#(resource) admin.organization.projects.roles > (model) RoleDeleteResponse > (schema)>) admin().organization().projects().roles().delete(RoleDeleteParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
DELETE/projects/{project\_id}/roles/{role\_id}