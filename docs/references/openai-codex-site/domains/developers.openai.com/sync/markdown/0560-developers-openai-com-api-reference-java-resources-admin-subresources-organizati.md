Groups | OpenAI API Reference
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
# Groups
##### [List project groups](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/groups/methods/list)
GroupListPage admin().organization().projects().groups().list(GroupListParamsparams = GroupListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/projects/{project\_id}/groups
##### [Add project group](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/groups/methods/create)
[ProjectGroup](</api/reference/java/resources/admin#(resource) admin.organization.projects.groups > (model) project_group > (schema)>) admin().organization().projects().groups().create(GroupCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/projects/{project\_id}/groups
##### [Remove project group](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/groups/methods/delete)
[GroupDeleteResponse](</api/reference/java/resources/admin#(resource) admin.organization.projects.groups > (model) GroupDeleteResponse > (schema)>) admin().organization().projects().groups().delete(GroupDeleteParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
DELETE/organization/projects/{project\_id}/groups/{group\_id}
##### ModelsExpand Collapse
class ProjectGroup:
Details about a group’s membership in a project.
long createdAt
Unix timestamp (in seconds) when the group was granted project access.
formatunixtime
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) created_at>)
String groupId
Identifier of the group that has access to the project.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) group_id>)
String groupName
Display name of the group.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) group_name>)
JsonValue; object\_ "project.group"constant"project.group"constant
Always `project.group`.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) object>)
String projectId
Identifier of the project.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) project_id>)
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema)>)
#### GroupsRoles
##### [List project group role assignments](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/groups/subresources/roles/methods/list)
RoleListPage admin().organization().projects().groups().roles().list(RoleListParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/projects/{project\_id}/groups/{group\_id}/roles
##### [Assign project role to group](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/groups/subresources/roles/methods/create)
[RoleCreateResponse](</api/reference/java/resources/admin#(resource) admin.organization.projects.groups.roles > (model) RoleCreateResponse > (schema)>) admin().organization().projects().groups().roles().create(RoleCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/projects/{project\_id}/groups/{group\_id}/roles
##### [Unassign project role from group](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/groups/subresources/roles/methods/delete)
[RoleDeleteResponse](</api/reference/java/resources/admin#(resource) admin.organization.projects.groups.roles > (model) RoleDeleteResponse > (schema)>) admin().organization().projects().groups().roles().delete(RoleDeleteParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
DELETE/projects/{project\_id}/groups/{group\_id}/roles/{role\_id}