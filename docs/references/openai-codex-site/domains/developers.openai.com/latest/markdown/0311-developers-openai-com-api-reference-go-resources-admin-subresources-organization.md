Projects | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Admin](/api/reference/go/resources/admin)
[Organization](/api/reference/go/resources/admin/subresources/organization)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Projects
##### [List projects](/api/reference/go/resources/admin/subresources/organization/subresources/projects/methods/list)
client.Admin.Organization.Projects.List(ctx, query) (\*ConversationCursorPage[[Project](</api/reference/go/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>)], error)
GET/organization/projects
##### [Create project](/api/reference/go/resources/admin/subresources/organization/subresources/projects/methods/create)
client.Admin.Organization.Projects.New(ctx, body) (\*[Project](</api/reference/go/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>), error)
POST/organization/projects
##### [Retrieve project](/api/reference/go/resources/admin/subresources/organization/subresources/projects/methods/retrieve)
client.Admin.Organization.Projects.Get(ctx, projectID) (\*[Project](</api/reference/go/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>), error)
GET/organization/projects/{project\_id}
##### [Modify project](/api/reference/go/resources/admin/subresources/organization/subresources/projects/methods/update)
client.Admin.Organization.Projects.Update(ctx, projectID, body) (\*[Project](</api/reference/go/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>), error)
POST/organization/projects/{project\_id}
##### [Archive project](/api/reference/go/resources/admin/subresources/organization/subresources/projects/methods/archive)
client.Admin.Organization.Projects.Archive(ctx, projectID) (\*[Project](</api/reference/go/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>), error)
POST/organization/projects/{project\_id}/archive
##### ModelsExpand Collapse
type Project struct{…}
Represents an individual project.
ID string
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) id>)
CreatedAt int64
The Unix timestamp (in seconds) of when the project was created.
formatunixtime
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) created_at>)
Name string
The name of the project. This appears in reporting.
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) name>)
Object OrganizationProject
The object type, which is always `organization.project`
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) object>)
Status ProjectStatus
`active` or `archived`
One of the following:
const ProjectStatusActive ProjectStatus = "active"
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) status > (member) 0>)
const ProjectStatusArchived ProjectStatus = "archived"
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) status > (member) 1>)
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) status>)
ArchivedAt int64Optional
The Unix timestamp (in seconds) of when the project was archived or `null`.
formatunixtime
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) archived_at>)
[](<#(resource) admin.organization.projects > (model) project > (schema)>)
#### ProjectsUsers
##### [List project users](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/list)
client.Admin.Organization.Projects.Users.List(ctx, projectID, query) (\*ConversationCursorPage[[ProjectUser](</api/reference/go/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>)], error)
GET/organization/projects/{project\_id}/users
##### [Create project user](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/create)
client.Admin.Organization.Projects.Users.New(ctx, projectID, body) (\*[ProjectUser](</api/reference/go/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>), error)
POST/organization/projects/{project\_id}/users
##### [Retrieve project user](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/retrieve)
client.Admin.Organization.Projects.Users.Get(ctx, projectID, userID) (\*[ProjectUser](</api/reference/go/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>), error)
GET/organization/projects/{project\_id}/users/{user\_id}
##### [Modify project user](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/update)
client.Admin.Organization.Projects.Users.Update(ctx, projectID, userID, body) (\*[ProjectUser](</api/reference/go/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>), error)
POST/organization/projects/{project\_id}/users/{user\_id}
##### [Delete project user](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/delete)
client.Admin.Organization.Projects.Users.Delete(ctx, projectID, userID) (\*[AdminOrganizationProjectUserDeleteResponse](</api/reference/go/resources/admin#(resource) admin.organization.projects.users > (model) AdminOrganizationProjectUserDeleteResponse > (schema)>), error)
DELETE/organization/projects/{project\_id}/users/{user\_id}
##### ModelsExpand Collapse
type ProjectUser struct{…}
Represents an individual user in a project.
ID string
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) id>)
AddedAt int64
The Unix timestamp (in seconds) of when the project was added.
formatunixtime
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) added_at>)
Email string
The email address of the user
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) email>)
Name string
The name of the user
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) name>)
Object OrganizationProjectUser
The object type, which is always `organization.project.user`
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) object>)
Role ProjectUserRole
`owner` or `member`
One of the following:
const ProjectUserRoleOwner ProjectUserRole = "owner"
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role > (member) 0>)
const ProjectUserRoleMember ProjectUserRole = "member"
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema)>)
#### ProjectsUsersRoles
##### [List project user role assignments](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/users/subresources/roles/methods/list)
client.Admin.Organization.Projects.Users.Roles.List(ctx, projectID, userID, query) (\*CursorPage[[AdminOrganizationProjectUserRoleListResponse](</api/reference/go/resources/admin#(resource) admin.organization.projects.users.roles > (model) AdminOrganizationProjectUserRoleListResponse > (schema)>)], error)
GET/projects/{project\_id}/users/{user\_id}/roles
##### [Assign project role to user](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/users/subresources/roles/methods/create)
client.Admin.Organization.Projects.Users.Roles.New(ctx, projectID, userID, body) (\*[AdminOrganizationProjectUserRoleNewResponse](</api/reference/go/resources/admin#(resource) admin.organization.projects.users.roles > (model) AdminOrganizationProjectUserRoleNewResponse > (schema)>), error)
POST/projects/{project\_id}/users/{user\_id}/roles
##### [Unassign project role from user](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/users/subresources/roles/methods/delete)
client.Admin.Organization.Projects.Users.Roles.Delete(ctx, projectID, userID, roleID) (\*[AdminOrganizationProjectUserRoleDeleteResponse](</api/reference/go/resources/admin#(resource) admin.organization.projects.users.roles > (model) AdminOrganizationProjectUserRoleDeleteResponse > (schema)>), error)
DELETE/projects/{project\_id}/users/{user\_id}/roles/{role\_id}
#### ProjectsService Accounts
##### [List project service accounts](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/service_accounts/methods/list)
client.Admin.Organization.Projects.ServiceAccounts.List(ctx, projectID, query) (\*ConversationCursorPage[[ProjectServiceAccount](</api/reference/go/resources/admin#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema)>)], error)
GET/organization/projects/{project\_id}/service\_accounts
##### [Create project service account](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/service_accounts/methods/create)
client.Admin.Organization.Projects.ServiceAccounts.New(ctx, projectID, body) (\*[AdminOrganizationProjectServiceAccountNewResponse](</api/reference/go/resources/admin#(resource) admin.organization.projects.service_accounts > (model) AdminOrganizationProjectServiceAccountNewResponse > (schema)>), error)
POST/organization/projects/{project\_id}/service\_accounts
##### [Retrieve project service account](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/service_accounts/methods/retrieve)
client.Admin.Organization.Projects.ServiceAccounts.Get(ctx, projectID, serviceAccountID) (\*[ProjectServiceAccount](</api/reference/go/resources/admin#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema)>), error)
GET/organization/projects/{project\_id}/service\_accounts/{service\_account\_id}
##### [Delete project service account](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/service_accounts/methods/delete)
client.Admin.Organization.Projects.ServiceAccounts.Delete(ctx, projectID, serviceAccountID) (\*[AdminOrganizationProjectServiceAccountDeleteResponse](</api/reference/go/resources/admin#(resource) admin.organization.projects.service_accounts > (model) AdminOrganizationProjectServiceAccountDeleteResponse > (schema)>), error)
DELETE/organization/projects/{project\_id}/service\_accounts/{service\_account\_id}
##### ModelsExpand Collapse
type ProjectServiceAccount struct{…}
Represents an individual service account in a project.
ID string
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) id>)
CreatedAt int64
The Unix timestamp (in seconds) of when the service account was created
formatunixtime
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) created_at>)
Name string
The name of the service account
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) name>)
Object OrganizationProjectServiceAccount
The object type, which is always `organization.project.service\_account`
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) object>)
Role ProjectServiceAccountRole
`owner` or `member`
One of the following:
const ProjectServiceAccountRoleOwner ProjectServiceAccountRole = "owner"
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role > (member) 0>)
const ProjectServiceAccountRoleMember ProjectServiceAccountRole = "member"
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema)>)
#### ProjectsAPI Keys
##### [List project API keys](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/api_keys/methods/list)
client.Admin.Organization.Projects.APIKeys.List(ctx, projectID, query) (\*ConversationCursorPage[[ProjectAPIKey](</api/reference/go/resources/admin#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema)>)], error)
GET/organization/projects/{project\_id}/api\_keys
##### [Retrieve project API key](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/api_keys/methods/retrieve)
client.Admin.Organization.Projects.APIKeys.Get(ctx, projectID, keyID) (\*[ProjectAPIKey](</api/reference/go/resources/admin#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema)>), error)
GET/organization/projects/{project\_id}/api\_keys/{key\_id}
##### [Delete project API key](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/api_keys/methods/delete)
client.Admin.Organization.Projects.APIKeys.Delete(ctx, projectID, keyID) (\*[AdminOrganizationProjectAPIKeyDeleteResponse](</api/reference/go/resources/admin#(resource) admin.organization.projects.api_keys > (model) AdminOrganizationProjectAPIKeyDeleteResponse > (schema)>), error)
DELETE/organization/projects/{project\_id}/api\_keys/{key\_id}
##### ModelsExpand Collapse
type ProjectAPIKey struct{…}
Represents an individual API key in a project.
ID string
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) id>)
CreatedAt int64
The Unix timestamp (in seconds) of when the API key was created
formatunixtime
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) created_at>)
LastUsedAt int64
The Unix timestamp (in seconds) of when the API key was last used.
formatunixtime
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) last_used_at>)
Name string
The name of the API key
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) name>)
Object OrganizationProjectAPIKey
The object type, which is always `organization.project.api\_key`
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) object>)
Owner ProjectAPIKeyOwner
ServiceAccount [ProjectServiceAccount](</api/reference/go/resources/admin#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema)>)Optional
Represents an individual service account in a project.
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) service_account>)
Type stringOptional
`user` or `service\_account`
One of the following:
const ProjectAPIKeyOwnerTypeUser ProjectAPIKeyOwnerType = "user"
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) type > (member) 0>)
const ProjectAPIKeyOwnerTypeServiceAccount ProjectAPIKeyOwnerType = "service\_account"
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) type > (member) 1>)
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) type>)
User [ProjectUser](</api/reference/go/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>)Optional
Represents an individual user in a project.
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) user>)
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner>)
RedactedValue string
The redacted value of the API key
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) redacted_value>)
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema)>)
#### ProjectsRate Limits
##### [List project rate limits](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/rate_limits/methods/list_rate_limits)
client.Admin.Organization.Projects.RateLimits.ListRateLimits(ctx, projectID, query) (\*ConversationCursorPage[[ProjectRateLimit](</api/reference/go/resources/admin#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema)>)], error)
GET/organization/projects/{project\_id}/rate\_limits
##### [Modify project rate limit](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/rate_limits/methods/update_rate_limit)
client.Admin.Organization.Projects.RateLimits.UpdateRateLimit(ctx, projectID, rateLimitID, body) (\*[ProjectRateLimit](</api/reference/go/resources/admin#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema)>), error)
POST/organization/projects/{project\_id}/rate\_limits/{rate\_limit\_id}
##### ModelsExpand Collapse
type ProjectRateLimit struct{…}
Represents a project rate limit config.
ID string
The identifier, which can be referenced in API endpoints.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) id>)
MaxRequestsPer1Minute int64
The maximum requests per minute.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_requests_per_1_minute>)
MaxTokensPer1Minute int64
The maximum tokens per minute.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_tokens_per_1_minute>)
Model string
The model this rate limit applies to.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) model>)
Object ProjectRateLimit
The object type, which is always `project.rate\_limit`
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) object>)
Batch1DayMaxInputTokens int64Optional
The maximum batch input tokens per day. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) batch_1_day_max_input_tokens>)
MaxAudioMegabytesPer1Minute int64Optional
The maximum audio megabytes per minute. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_audio_megabytes_per_1_minute>)
MaxImagesPer1Minute int64Optional
The maximum images per minute. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_images_per_1_minute>)
MaxRequestsPer1Day int64Optional
The maximum requests per day. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_requests_per_1_day>)
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema)>)
#### ProjectsGroups
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
#### ProjectsGroupsRoles
##### [List project group role assignments](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/groups/subresources/roles/methods/list)
client.Admin.Organization.Projects.Groups.Roles.List(ctx, projectID, groupID, query) (\*CursorPage[[AdminOrganizationProjectGroupRoleListResponse](</api/reference/go/resources/admin#(resource) admin.organization.projects.groups.roles > (model) AdminOrganizationProjectGroupRoleListResponse > (schema)>)], error)
GET/projects/{project\_id}/groups/{group\_id}/roles
##### [Assign project role to group](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/groups/subresources/roles/methods/create)
client.Admin.Organization.Projects.Groups.Roles.New(ctx, projectID, groupID, body) (\*[AdminOrganizationProjectGroupRoleNewResponse](</api/reference/go/resources/admin#(resource) admin.organization.projects.groups.roles > (model) AdminOrganizationProjectGroupRoleNewResponse > (schema)>), error)
POST/projects/{project\_id}/groups/{group\_id}/roles
##### [Unassign project role from group](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/groups/subresources/roles/methods/delete)
client.Admin.Organization.Projects.Groups.Roles.Delete(ctx, projectID, groupID, roleID) (\*[AdminOrganizationProjectGroupRoleDeleteResponse](</api/reference/go/resources/admin#(resource) admin.organization.projects.groups.roles > (model) AdminOrganizationProjectGroupRoleDeleteResponse > (schema)>), error)
DELETE/projects/{project\_id}/groups/{group\_id}/roles/{role\_id}
#### ProjectsRoles
##### [List project roles](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/list)
client.Admin.Organization.Projects.Roles.List(ctx, projectID, query) (\*CursorPage[[Role](</api/reference/go/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>)], error)
GET/projects/{project\_id}/roles
##### [Create project role](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/create)
client.Admin.Organization.Projects.Roles.New(ctx, projectID, body) (\*[Role](</api/reference/go/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>), error)
POST/projects/{project\_id}/roles
##### [Update project role](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/update)
client.Admin.Organization.Projects.Roles.Update(ctx, projectID, roleID, body) (\*[Role](</api/reference/go/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>), error)
POST/projects/{project\_id}/roles/{role\_id}
##### [Delete project role](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/delete)
client.Admin.Organization.Projects.Roles.Delete(ctx, projectID, roleID) (\*[AdminOrganizationProjectRoleDeleteResponse](</api/reference/go/resources/admin#(resource) admin.organization.projects.roles > (model) AdminOrganizationProjectRoleDeleteResponse > (schema)>), error)
DELETE/projects/{project\_id}/roles/{role\_id}
#### ProjectsCertificates
##### [List project certificates](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/certificates/methods/list)
client.Admin.Organization.Projects.Certificates.List(ctx, projectID, query) (\*ConversationCursorPage[[Certificate](</api/reference/go/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>)], error)
GET/organization/projects/{project\_id}/certificates
##### [Activate certificates for project](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/certificates/methods/activate)
client.Admin.Organization.Projects.Certificates.Activate(ctx, projectID, body) (\*Page[[Certificate](</api/reference/go/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>)], error)
POST/organization/projects/{project\_id}/certificates/activate
##### [Deactivate certificates for project](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/certificates/methods/deactivate)
client.Admin.Organization.Projects.Certificates.Deactivate(ctx, projectID, body) (\*Page[[Certificate](</api/reference/go/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>)], error)
POST/organization/projects/{project\_id}/certificates/deactivate