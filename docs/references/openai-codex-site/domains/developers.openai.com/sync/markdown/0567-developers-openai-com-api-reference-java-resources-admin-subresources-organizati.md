Projects | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Admin](/api/reference/java/resources/admin)
[Organization](/api/reference/java/resources/admin/subresources/organization)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Projects
##### [List projects](/api/reference/java/resources/admin/subresources/organization/subresources/projects/methods/list)
ProjectListPage admin().organization().projects().list(ProjectListParamsparams = ProjectListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/projects
##### [Create project](/api/reference/java/resources/admin/subresources/organization/subresources/projects/methods/create)
[Project](</api/reference/java/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>) admin().organization().projects().create(ProjectCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/projects
##### [Retrieve project](/api/reference/java/resources/admin/subresources/organization/subresources/projects/methods/retrieve)
[Project](</api/reference/java/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>) admin().organization().projects().retrieve(ProjectRetrieveParamsparams = ProjectRetrieveParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/projects/{project\_id}
##### [Modify project](/api/reference/java/resources/admin/subresources/organization/subresources/projects/methods/update)
[Project](</api/reference/java/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>) admin().organization().projects().update(ProjectUpdateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/projects/{project\_id}
##### [Archive project](/api/reference/java/resources/admin/subresources/organization/subresources/projects/methods/archive)
[Project](</api/reference/java/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>) admin().organization().projects().archive(ProjectArchiveParamsparams = ProjectArchiveParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/projects/{project\_id}/archive
##### ModelsExpand Collapse
class Project:
Represents an individual project.
String id
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) id>)
long createdAt
The Unix timestamp (in seconds) of when the project was created.
formatunixtime
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) created_at>)
String name
The name of the project. This appears in reporting.
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) name>)
JsonValue; object\_ "organization.project"constant"organization.project"constant
The object type, which is always `organization.project`
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) object>)
Status status
`active` or `archived`
One of the following:
ACTIVE("active")
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) status > (member) 0>)
ARCHIVED("archived")
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) status > (member) 1>)
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) status>)
Optional\<Long\> archivedAt
The Unix timestamp (in seconds) of when the project was archived or `null`.
formatunixtime
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) archived_at>)
[](<#(resource) admin.organization.projects > (model) project > (schema)>)
#### ProjectsUsers
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
#### ProjectsUsersRoles
##### [List project user role assignments](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/users/subresources/roles/methods/list)
RoleListPage admin().organization().projects().users().roles().list(RoleListParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/projects/{project\_id}/users/{user\_id}/roles
##### [Assign project role to user](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/users/subresources/roles/methods/create)
[RoleCreateResponse](</api/reference/java/resources/admin#(resource) admin.organization.projects.users.roles > (model) RoleCreateResponse > (schema)>) admin().organization().projects().users().roles().create(RoleCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/projects/{project\_id}/users/{user\_id}/roles
##### [Unassign project role from user](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/users/subresources/roles/methods/delete)
[RoleDeleteResponse](</api/reference/java/resources/admin#(resource) admin.organization.projects.users.roles > (model) RoleDeleteResponse > (schema)>) admin().organization().projects().users().roles().delete(RoleDeleteParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
DELETE/projects/{project\_id}/users/{user\_id}/roles/{role\_id}
#### ProjectsService Accounts
##### [List project service accounts](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/service_accounts/methods/list)
ServiceAccountListPage admin().organization().projects().serviceAccounts().list(ServiceAccountListParamsparams = ServiceAccountListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/projects/{project\_id}/service\_accounts
##### [Create project service account](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/service_accounts/methods/create)
[ServiceAccountCreateResponse](</api/reference/java/resources/admin#(resource) admin.organization.projects.service_accounts > (model) ServiceAccountCreateResponse > (schema)>) admin().organization().projects().serviceAccounts().create(ServiceAccountCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/projects/{project\_id}/service\_accounts
##### [Retrieve project service account](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/service_accounts/methods/retrieve)
[ProjectServiceAccount](</api/reference/java/resources/admin#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema)>) admin().organization().projects().serviceAccounts().retrieve(ServiceAccountRetrieveParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/projects/{project\_id}/service\_accounts/{service\_account\_id}
##### [Delete project service account](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/service_accounts/methods/delete)
[ServiceAccountDeleteResponse](</api/reference/java/resources/admin#(resource) admin.organization.projects.service_accounts > (model) ServiceAccountDeleteResponse > (schema)>) admin().organization().projects().serviceAccounts().delete(ServiceAccountDeleteParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
DELETE/organization/projects/{project\_id}/service\_accounts/{service\_account\_id}
##### ModelsExpand Collapse
class ProjectServiceAccount:
Represents an individual service account in a project.
String id
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) id>)
long createdAt
The Unix timestamp (in seconds) of when the service account was created
formatunixtime
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) created_at>)
String name
The name of the service account
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) name>)
JsonValue; object\_ "organization.project.service\_account"constant"organization.project.service\_account"constant
The object type, which is always `organization.project.service\_account`
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) object>)
Role role
`owner` or `member`
One of the following:
OWNER("owner")
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role > (member) 0>)
MEMBER("member")
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema)>)
#### ProjectsAPI Keys
##### [List project API keys](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/api_keys/methods/list)
ApiKeyListPage admin().organization().projects().apiKeys().list(ApiKeyListParamsparams = ApiKeyListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/projects/{project\_id}/api\_keys
##### [Retrieve project API key](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/api_keys/methods/retrieve)
[ProjectApiKey](</api/reference/java/resources/admin#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema)>) admin().organization().projects().apiKeys().retrieve(ApiKeyRetrieveParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/projects/{project\_id}/api\_keys/{key\_id}
##### [Delete project API key](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/api_keys/methods/delete)
[ApiKeyDeleteResponse](</api/reference/java/resources/admin#(resource) admin.organization.projects.api_keys > (model) ApiKeyDeleteResponse > (schema)>) admin().organization().projects().apiKeys().delete(ApiKeyDeleteParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
DELETE/organization/projects/{project\_id}/api\_keys/{key\_id}
##### ModelsExpand Collapse
class ProjectApiKey:
Represents an individual API key in a project.
String id
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) id>)
long createdAt
The Unix timestamp (in seconds) of when the API key was created
formatunixtime
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) created_at>)
long lastUsedAt
The Unix timestamp (in seconds) of when the API key was last used.
formatunixtime
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) last_used_at>)
String name
The name of the API key
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) name>)
JsonValue; object\_ "organization.project.api\_key"constant"organization.project.api\_key"constant
The object type, which is always `organization.project.api\_key`
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) object>)
Owner owner
Optional\<[ProjectServiceAccount](</api/reference/java/resources/admin#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema)>)\> serviceAccount
Represents an individual service account in a project.
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) service_account>)
Optional\<Type\> type
`user` or `service\_account`
One of the following:
USER("user")
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) type > (member) 0>)
SERVICE\_ACCOUNT("service\_account")
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) type > (member) 1>)
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) type>)
Optional\<[ProjectUser](</api/reference/java/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>)\> user
Represents an individual user in a project.
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) user>)
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner>)
String redactedValue
The redacted value of the API key
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) redacted_value>)
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema)>)
#### ProjectsRate Limits
##### [List project rate limits](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/rate_limits/methods/list_rate_limits)
RateLimitListRateLimitsPage admin().organization().projects().rateLimits().listRateLimits(RateLimitListRateLimitsParamsparams = RateLimitListRateLimitsParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/projects/{project\_id}/rate\_limits
##### [Modify project rate limit](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/rate_limits/methods/update_rate_limit)
[ProjectRateLimit](</api/reference/java/resources/admin#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema)>) admin().organization().projects().rateLimits().updateRateLimit(RateLimitUpdateRateLimitParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/projects/{project\_id}/rate\_limits/{rate\_limit\_id}
##### ModelsExpand Collapse
class ProjectRateLimit:
Represents a project rate limit config.
String id
The identifier, which can be referenced in API endpoints.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) id>)
long maxRequestsPer1Minute
The maximum requests per minute.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_requests_per_1_minute>)
long maxTokensPer1Minute
The maximum tokens per minute.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_tokens_per_1_minute>)
String model
The model this rate limit applies to.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) model>)
JsonValue; object\_ "project.rate\_limit"constant"project.rate\_limit"constant
The object type, which is always `project.rate\_limit`
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) object>)
Optional\<Long\> batch1DayMaxInputTokens
The maximum batch input tokens per day. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) batch_1_day_max_input_tokens>)
Optional\<Long\> maxAudioMegabytesPer1Minute
The maximum audio megabytes per minute. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_audio_megabytes_per_1_minute>)
Optional\<Long\> maxImagesPer1Minute
The maximum images per minute. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_images_per_1_minute>)
Optional\<Long\> maxRequestsPer1Day
The maximum requests per day. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_requests_per_1_day>)
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema)>)
#### ProjectsGroups
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
#### ProjectsGroupsRoles
##### [List project group role assignments](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/groups/subresources/roles/methods/list)
RoleListPage admin().organization().projects().groups().roles().list(RoleListParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/projects/{project\_id}/groups/{group\_id}/roles
##### [Assign project role to group](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/groups/subresources/roles/methods/create)
[RoleCreateResponse](</api/reference/java/resources/admin#(resource) admin.organization.projects.groups.roles > (model) RoleCreateResponse > (schema)>) admin().organization().projects().groups().roles().create(RoleCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/projects/{project\_id}/groups/{group\_id}/roles
##### [Unassign project role from group](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/groups/subresources/roles/methods/delete)
[RoleDeleteResponse](</api/reference/java/resources/admin#(resource) admin.organization.projects.groups.roles > (model) RoleDeleteResponse > (schema)>) admin().organization().projects().groups().roles().delete(RoleDeleteParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
DELETE/projects/{project\_id}/groups/{group\_id}/roles/{role\_id}
#### ProjectsRoles
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
#### ProjectsCertificates
##### [List project certificates](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/certificates/methods/list)
CertificateListPage admin().organization().projects().certificates().list(CertificateListParamsparams = CertificateListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/projects/{project\_id}/certificates
##### [Activate certificates for project](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/certificates/methods/activate)
CertificateActivatePage admin().organization().projects().certificates().activate(CertificateActivateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/projects/{project\_id}/certificates/activate
##### [Deactivate certificates for project](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/certificates/methods/deactivate)
CertificateDeactivatePage admin().organization().projects().certificates().deactivate(CertificateDeactivateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/projects/{project\_id}/certificates/deactivate