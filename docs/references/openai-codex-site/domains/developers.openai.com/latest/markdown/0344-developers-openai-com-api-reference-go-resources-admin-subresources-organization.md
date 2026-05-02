Groups | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Admin](/api/reference/go/resources/admin)
[Organization](/api/reference/go/resources/admin/subresources/organization)
[Projects](/api/reference/go/resources/admin/subresources/organization/subresources/projects)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Groups
##### [List project groups](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/groups/methods/list)
client.Admin.Organization.Projects.Groups.List(ctx, projectID, query) (\*CursorPage[[ProjectGroup](</api/reference/go/resources/admin#(resource) admin.organization.projects.groups > (model) project_group > (schema)>)], error)
GET/organization/projects/{project\_id}/groups
##### [Add project group](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/groups/methods/create)
client.Admin.Organization.Projects.Groups.New(ctx, projectID, body) (\*[ProjectGroup](</api/reference/go/resources/admin#(resource) admin.organization.projects.groups > (model) project_group > (schema)>), error)
POST/organization/projects/{project\_id}/groups
##### [Remove project group](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/groups/methods/delete)
client.Admin.Organization.Projects.Groups.Delete(ctx, projectID, groupID) (\*[AdminOrganizationProjectGroupDeleteResponse](</api/reference/go/resources/admin#(resource) admin.organization.projects.groups > (model) AdminOrganizationProjectGroupDeleteResponse > (schema)>), error)
DELETE/organization/projects/{project\_id}/groups/{group\_id}
##### ModelsExpand Collapse
type ProjectGroup struct{…}
Details about a group’s membership in a project.
CreatedAt int64
Unix timestamp (in seconds) when the group was granted project access.
formatunixtime
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) created_at>)
GroupID string
Identifier of the group that has access to the project.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) group_id>)
GroupName string
Display name of the group.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) group_name>)
Object ProjectGroup
Always `project.group`.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) object>)
ProjectID string
Identifier of the project.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) project_id>)
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema)>)
#### GroupsRoles
##### [List project group role assignments](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/groups/subresources/roles/methods/list)
client.Admin.Organization.Projects.Groups.Roles.List(ctx, projectID, groupID, query) (\*CursorPage[[AdminOrganizationProjectGroupRoleListResponse](</api/reference/go/resources/admin#(resource) admin.organization.projects.groups.roles > (model) AdminOrganizationProjectGroupRoleListResponse > (schema)>)], error)
GET/projects/{project\_id}/groups/{group\_id}/roles
##### [Assign project role to group](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/groups/subresources/roles/methods/create)
client.Admin.Organization.Projects.Groups.Roles.New(ctx, projectID, groupID, body) (\*[AdminOrganizationProjectGroupRoleNewResponse](</api/reference/go/resources/admin#(resource) admin.organization.projects.groups.roles > (model) AdminOrganizationProjectGroupRoleNewResponse > (schema)>), error)
POST/projects/{project\_id}/groups/{group\_id}/roles
##### [Unassign project role from group](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/groups/subresources/roles/methods/delete)
client.Admin.Organization.Projects.Groups.Roles.Delete(ctx, projectID, groupID, roleID) (\*[AdminOrganizationProjectGroupRoleDeleteResponse](</api/reference/go/resources/admin#(resource) admin.organization.projects.groups.roles > (model) AdminOrganizationProjectGroupRoleDeleteResponse > (schema)>), error)
DELETE/projects/{project\_id}/groups/{group\_id}/roles/{role\_id}