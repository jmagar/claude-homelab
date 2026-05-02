Users | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Admin](/api/reference/go/resources/admin)
[Organization](/api/reference/go/resources/admin/subresources/organization)
[Groups](/api/reference/go/resources/admin/subresources/organization/subresources/groups)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Users
##### [List group users](/api/reference/go/resources/admin/subresources/organization/subresources/groups/subresources/users/methods/list)
client.Admin.Organization.Groups.Users.List(ctx, groupID, query) (\*CursorPage[[OrganizationUser](</api/reference/go/resources/admin#(resource) admin.organization.users > (model) organization_user > (schema)>)], error)
GET/organization/groups/{group\_id}/users
##### [Add group user](/api/reference/go/resources/admin/subresources/organization/subresources/groups/subresources/users/methods/create)
client.Admin.Organization.Groups.Users.New(ctx, groupID, body) (\*[AdminOrganizationGroupUserNewResponse](</api/reference/go/resources/admin#(resource) admin.organization.groups.users > (model) AdminOrganizationGroupUserNewResponse > (schema)>), error)
POST/organization/groups/{group\_id}/users
##### [Remove group user](/api/reference/go/resources/admin/subresources/organization/subresources/groups/subresources/users/methods/delete)
client.Admin.Organization.Groups.Users.Delete(ctx, groupID, userID) (\*[AdminOrganizationGroupUserDeleteResponse](</api/reference/go/resources/admin#(resource) admin.organization.groups.users > (model) AdminOrganizationGroupUserDeleteResponse > (schema)>), error)
DELETE/organization/groups/{group\_id}/users/{user\_id}