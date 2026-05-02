Roles | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Admin](/api/reference/java/resources/admin)
[Organization](/api/reference/java/resources/admin/subresources/organization)
[Projects](/api/reference/java/resources/admin/subresources/organization/subresources/projects)
[Groups](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/groups)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Roles
##### [List project group role assignments](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/groups/subresources/roles/methods/list)
RoleListPage admin().organization().projects().groups().roles().list(RoleListParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/projects/{project\_id}/groups/{group\_id}/roles
##### [Assign project role to group](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/groups/subresources/roles/methods/create)
[RoleCreateResponse](</api/reference/java/resources/admin#(resource) admin.organization.projects.groups.roles > (model) RoleCreateResponse > (schema)>) admin().organization().projects().groups().roles().create(RoleCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/projects/{project\_id}/groups/{group\_id}/roles
##### [Unassign project role from group](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/groups/subresources/roles/methods/delete)
[RoleDeleteResponse](</api/reference/java/resources/admin#(resource) admin.organization.projects.groups.roles > (model) RoleDeleteResponse > (schema)>) admin().organization().projects().groups().roles().delete(RoleDeleteParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
DELETE/projects/{project\_id}/groups/{group\_id}/roles/{role\_id}