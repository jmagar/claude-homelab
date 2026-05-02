Roles | OpenAI API Reference
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
# Roles
##### [List group organization role assignments](/api/reference/java/resources/admin/subresources/organization/subresources/groups/subresources/roles/methods/list)
RoleListPage admin().organization().groups().roles().list(RoleListParamsparams = RoleListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/groups/{group\_id}/roles
##### [Assign organization role to group](/api/reference/java/resources/admin/subresources/organization/subresources/groups/subresources/roles/methods/create)
[RoleCreateResponse](</api/reference/java/resources/admin#(resource) admin.organization.groups.roles > (model) RoleCreateResponse > (schema)>) admin().organization().groups().roles().create(RoleCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/groups/{group\_id}/roles
##### [Unassign organization role from group](/api/reference/java/resources/admin/subresources/organization/subresources/groups/subresources/roles/methods/delete)
[RoleDeleteResponse](</api/reference/java/resources/admin#(resource) admin.organization.groups.roles > (model) RoleDeleteResponse > (schema)>) admin().organization().groups().roles().delete(RoleDeleteParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
DELETE/organization/groups/{group\_id}/roles/{role\_id}