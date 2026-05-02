Users | OpenAI API Reference
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
# Users
##### [List project users](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/list)
UserListPage admin().organization().projects().users().list(UserListParamsparams = UserListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/projects/{project\_id}/users
##### [Create project user](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/create)
[ProjectUser](</api/reference/java/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>) admin().organization().projects().users().create(UserCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/projects/{project\_id}/users
##### [Retrieve project user](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/retrieve)
[ProjectUser](</api/reference/java/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>) admin().organization().projects().users().retrieve(UserRetrieveParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/projects/{project\_id}/users/{user\_id}
##### [Modify project user](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/update)
[ProjectUser](</api/reference/java/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>) admin().organization().projects().users().update(UserUpdateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/projects/{project\_id}/users/{user\_id}
##### [Delete project user](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/delete)
[UserDeleteResponse](</api/reference/java/resources/admin#(resource) admin.organization.projects.users > (model) UserDeleteResponse > (schema)>) admin().organization().projects().users().delete(UserDeleteParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
DELETE/organization/projects/{project\_id}/users/{user\_id}
##### ModelsExpand Collapse
class ProjectUser:
Represents an individual user in a project.
String id
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) id>)
long addedAt
The Unix timestamp (in seconds) of when the project was added.
formatunixtime
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) added_at>)
String email
The email address of the user
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) email>)
String name
The name of the user
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) name>)
JsonValue; object\_ "organization.project.user"constant"organization.project.user"constant
The object type, which is always `organization.project.user`
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) object>)
Role role
`owner` or `member`
One of the following:
OWNER("owner")
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role > (member) 0>)
MEMBER("member")
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema)>)
#### UsersRoles
##### [List project user role assignments](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/users/subresources/roles/methods/list)
RoleListPage admin().organization().projects().users().roles().list(RoleListParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/projects/{project\_id}/users/{user\_id}/roles
##### [Assign project role to user](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/users/subresources/roles/methods/create)
[RoleCreateResponse](</api/reference/java/resources/admin#(resource) admin.organization.projects.users.roles > (model) RoleCreateResponse > (schema)>) admin().organization().projects().users().roles().create(RoleCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/projects/{project\_id}/users/{user\_id}/roles
##### [Unassign project role from user](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/users/subresources/roles/methods/delete)
[RoleDeleteResponse](</api/reference/java/resources/admin#(resource) admin.organization.projects.users.roles > (model) RoleDeleteResponse > (schema)>) admin().organization().projects().users().roles().delete(RoleDeleteParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
DELETE/projects/{project\_id}/users/{user\_id}/roles/{role\_id}