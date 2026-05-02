Projects | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Admin](/api/reference/python/resources/admin)
[Organization](/api/reference/python/resources/admin/subresources/organization)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Projects
##### [List projects](/api/reference/python/resources/admin/subresources/organization/subresources/projects/methods/list)
admin.organization.projects.list(ProjectListParams\*\*kwargs) -\> SyncConversationCursorPage[[Project](</api/reference/python/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>)]
GET/organization/projects
##### [Create project](/api/reference/python/resources/admin/subresources/organization/subresources/projects/methods/create)
admin.organization.projects.create(ProjectCreateParams\*\*kwargs) -\> [Project](</api/reference/python/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>)
POST/organization/projects
##### [Retrieve project](/api/reference/python/resources/admin/subresources/organization/subresources/projects/methods/retrieve)
admin.organization.projects.retrieve(strproject\_id) -\> [Project](</api/reference/python/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>)
GET/organization/projects/{project\_id}
##### [Modify project](/api/reference/python/resources/admin/subresources/organization/subresources/projects/methods/update)
admin.organization.projects.update(strproject\_id, ProjectUpdateParams\*\*kwargs) -\> [Project](</api/reference/python/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>)
POST/organization/projects/{project\_id}
##### [Archive project](/api/reference/python/resources/admin/subresources/organization/subresources/projects/methods/archive)
admin.organization.projects.archive(strproject\_id) -\> [Project](</api/reference/python/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>)
POST/organization/projects/{project\_id}/archive
##### ModelsExpand Collapse
class Project: …
Represents an individual project.
id: str
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) id>)
created\_at: int
The Unix timestamp (in seconds) of when the project was created.
formatunixtime
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) created_at>)
name: str
The name of the project. This appears in reporting.
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) name>)
object: Literal["organization.project"]
The object type, which is always `organization.project`
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) object>)
status: Literal["active", "archived"]
`active` or `archived`
One of the following:
"active"
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) status > (member) 0>)
"archived"
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) status > (member) 1>)
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) status>)
archived\_at: Optional[int]
The Unix timestamp (in seconds) of when the project was archived or `null`.
formatunixtime
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) archived_at>)
[](<#(resource) admin.organization.projects > (model) project > (schema)>)
#### ProjectsUsers
##### [List project users](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/list)
admin.organization.projects.users.list(strproject\_id, UserListParams\*\*kwargs) -\> SyncConversationCursorPage[[ProjectUser](</api/reference/python/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>)]
GET/organization/projects/{project\_id}/users
##### [Create project user](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/create)
admin.organization.projects.users.create(strproject\_id, UserCreateParams\*\*kwargs) -\> [ProjectUser](</api/reference/python/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>)
POST/organization/projects/{project\_id}/users
##### [Retrieve project user](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/retrieve)
admin.organization.projects.users.retrieve(struser\_id, UserRetrieveParams\*\*kwargs) -\> [ProjectUser](</api/reference/python/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>)
GET/organization/projects/{project\_id}/users/{user\_id}
##### [Modify project user](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/update)
admin.organization.projects.users.update(struser\_id, UserUpdateParams\*\*kwargs) -\> [ProjectUser](</api/reference/python/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>)
POST/organization/projects/{project\_id}/users/{user\_id}
##### [Delete project user](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/delete)
admin.organization.projects.users.delete(struser\_id, UserDeleteParams\*\*kwargs) -\> [UserDeleteResponse](</api/reference/python/resources/admin#(resource) admin.organization.projects.users > (model) user_delete_response > (schema)>)
DELETE/organization/projects/{project\_id}/users/{user\_id}
##### ModelsExpand Collapse
class ProjectUser: …
Represents an individual user in a project.
id: str
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) id>)
added\_at: int
The Unix timestamp (in seconds) of when the project was added.
formatunixtime
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) added_at>)
email: str
The email address of the user
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) email>)
name: str
The name of the user
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) name>)
object: Literal["organization.project.user"]
The object type, which is always `organization.project.user`
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) object>)
role: Literal["owner", "member"]
`owner` or `member`
One of the following:
"owner"
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role > (member) 0>)
"member"
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema)>)
class UserDeleteResponse: …
id: str
[](<#(resource) admin.organization.projects.users > (model) user_delete_response > (schema) > (property) id>)
deleted: bool
[](<#(resource) admin.organization.projects.users > (model) user_delete_response > (schema) > (property) deleted>)
object: Literal["organization.project.user.deleted"]
[](<#(resource) admin.organization.projects.users > (model) user_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.users > (model) user_delete_response > (schema)>)
#### ProjectsUsersRoles
##### [List project user role assignments](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/users/subresources/roles/methods/list)
admin.organization.projects.users.roles.list(struser\_id, RoleListParams\*\*kwargs) -\> SyncCursorPage[[RoleListResponse](</api/reference/python/resources/admin#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema)>)]
GET/projects/{project\_id}/users/{user\_id}/roles
##### [Assign project role to user](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/users/subresources/roles/methods/create)
admin.organization.projects.users.roles.create(struser\_id, RoleCreateParams\*\*kwargs) -\> [RoleCreateResponse](</api/reference/python/resources/admin#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema)>)
POST/projects/{project\_id}/users/{user\_id}/roles
##### [Unassign project role from user](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/users/subresources/roles/methods/delete)
admin.organization.projects.users.roles.delete(strrole\_id, RoleDeleteParams\*\*kwargs) -\> [RoleDeleteResponse](</api/reference/python/resources/admin#(resource) admin.organization.projects.users.roles > (model) role_delete_response > (schema)>)
DELETE/projects/{project\_id}/users/{user\_id}/roles/{role\_id}
##### ModelsExpand Collapse
class RoleListResponse: …
Detailed information about a role assignment entry returned when listing assignments.
id: str
Identifier for the role.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) id>)
created\_at: Optional[int]
When the role was created.
formatunixtime
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) created_at>)
created\_by: Optional[str]
Identifier of the actor who created the role.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) created_by>)
created\_by\_user\_obj: Optional[Dict[str, object]]
User details for the actor that created the role, when available.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) created_by_user_obj>)
description: Optional[str]
Description of the role.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) description>)
metadata: Optional[Dict[str, object]]
Arbitrary metadata stored on the role.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) metadata>)
name: str
Name of the role.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) name>)
permissions: List[str]
Permissions associated with the role.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) permissions>)
predefined\_role: bool
Whether the role is predefined by OpenAI.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) predefined_role>)
resource\_type: str
Resource type the role applies to.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) resource_type>)
updated\_at: Optional[int]
When the role was last updated.
formatint64
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) updated_at>)
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema)>)
class RoleCreateResponse: …
Role assignment linking a user to a role.
object: Literal["user.role"]
Always `user.role`.
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema) > (property) object>)
role: [Role](</api/reference/python/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>)
Details about a role that can be assigned through the public Roles API.
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema) > (property) role>)
user: [OrganizationUser](</api/reference/python/resources/admin#(resource) admin.organization.users > (model) organization_user > (schema)>)
Represents an individual `user` within an organization.
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema) > (property) user>)
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema)>)
class RoleDeleteResponse: …
Confirmation payload returned after unassigning a role.
deleted: bool
Whether the assignment was removed.
[](<#(resource) admin.organization.projects.users.roles > (model) role_delete_response > (schema) > (property) deleted>)
object: str
Identifier for the deleted assignment, such as `group.role.deleted` or `user.role.deleted`.
[](<#(resource) admin.organization.projects.users.roles > (model) role_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.users.roles > (model) role_delete_response > (schema)>)
#### ProjectsService Accounts
##### [List project service accounts](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/service_accounts/methods/list)
admin.organization.projects.service\_accounts.list(strproject\_id, ServiceAccountListParams\*\*kwargs) -\> SyncConversationCursorPage[[ProjectServiceAccount](</api/reference/python/resources/admin#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema)>)]
GET/organization/projects/{project\_id}/service\_accounts
##### [Create project service account](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/service_accounts/methods/create)
admin.organization.projects.service\_accounts.create(strproject\_id, ServiceAccountCreateParams\*\*kwargs) -\> [ServiceAccountCreateResponse](</api/reference/python/resources/admin#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema)>)
POST/organization/projects/{project\_id}/service\_accounts
##### [Retrieve project service account](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/service_accounts/methods/retrieve)
admin.organization.projects.service\_accounts.retrieve(strservice\_account\_id, ServiceAccountRetrieveParams\*\*kwargs) -\> [ProjectServiceAccount](</api/reference/python/resources/admin#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema)>)
GET/organization/projects/{project\_id}/service\_accounts/{service\_account\_id}
##### [Delete project service account](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/service_accounts/methods/delete)
admin.organization.projects.service\_accounts.delete(strservice\_account\_id, ServiceAccountDeleteParams\*\*kwargs) -\> [ServiceAccountDeleteResponse](</api/reference/python/resources/admin#(resource) admin.organization.projects.service_accounts > (model) service_account_delete_response > (schema)>)
DELETE/organization/projects/{project\_id}/service\_accounts/{service\_account\_id}
##### ModelsExpand Collapse
class ProjectServiceAccount: …
Represents an individual service account in a project.
id: str
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) id>)
created\_at: int
The Unix timestamp (in seconds) of when the service account was created
formatunixtime
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) created_at>)
name: str
The name of the service account
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) name>)
object: Literal["organization.project.service\_account"]
The object type, which is always `organization.project.service\_account`
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) object>)
role: Literal["owner", "member"]
`owner` or `member`
One of the following:
"owner"
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role > (member) 0>)
"member"
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema)>)
class ServiceAccountCreateResponse: …
id: str
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) id>)
api\_key: APIKey
id: str
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) api_key > (property) id>)
created\_at: int
formatunixtime
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) api_key > (property) created_at>)
name: str
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) api_key > (property) name>)
object: Literal["organization.project.service\_account.api\_key"]
The object type, which is always `organization.project.service\_account.api\_key`
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) api_key > (property) object>)
value: str
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) api_key > (property) value>)
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) api_key>)
created\_at: int
formatunixtime
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) created_at>)
name: str
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) name>)
object: Literal["organization.project.service\_account"]
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) object>)
role: Literal["member"]
Service accounts can only have one role of type `member`
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema)>)
class ServiceAccountDeleteResponse: …
id: str
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_delete_response > (schema) > (property) id>)
deleted: bool
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_delete_response > (schema) > (property) deleted>)
object: Literal["organization.project.service\_account.deleted"]
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_delete_response > (schema)>)
#### ProjectsAPI Keys
##### [List project API keys](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/api_keys/methods/list)
admin.organization.projects.api\_keys.list(strproject\_id, APIKeyListParams\*\*kwargs) -\> SyncConversationCursorPage[[ProjectAPIKey](</api/reference/python/resources/admin#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema)>)]
GET/organization/projects/{project\_id}/api\_keys
##### [Retrieve project API key](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/api_keys/methods/retrieve)
admin.organization.projects.api\_keys.retrieve(strkey\_id, APIKeyRetrieveParams\*\*kwargs) -\> [ProjectAPIKey](</api/reference/python/resources/admin#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema)>)
GET/organization/projects/{project\_id}/api\_keys/{key\_id}
##### [Delete project API key](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/api_keys/methods/delete)
admin.organization.projects.api\_keys.delete(strkey\_id, APIKeyDeleteParams\*\*kwargs) -\> [APIKeyDeleteResponse](</api/reference/python/resources/admin#(resource) admin.organization.projects.api_keys > (model) api_key_delete_response > (schema)>)
DELETE/organization/projects/{project\_id}/api\_keys/{key\_id}
##### ModelsExpand Collapse
class ProjectAPIKey: …
Represents an individual API key in a project.
id: str
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) id>)
created\_at: int
The Unix timestamp (in seconds) of when the API key was created
formatunixtime
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) created_at>)
last\_used\_at: int
The Unix timestamp (in seconds) of when the API key was last used.
formatunixtime
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) last_used_at>)
name: str
The name of the API key
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) name>)
object: Literal["organization.project.api\_key"]
The object type, which is always `organization.project.api\_key`
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) object>)
owner: Owner
service\_account: Optional[ProjectServiceAccount]
Represents an individual service account in a project.
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) service_account>)
type: Optional[Literal["user", "service\_account"]]
`user` or `service\_account`
One of the following:
"user"
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) type > (member) 0>)
"service\_account"
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) type > (member) 1>)
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) type>)
user: Optional[ProjectUser]
Represents an individual user in a project.
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) user>)
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner>)
redacted\_value: str
The redacted value of the API key
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) redacted_value>)
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema)>)
class APIKeyDeleteResponse: …
id: str
[](<#(resource) admin.organization.projects.api_keys > (model) api_key_delete_response > (schema) > (property) id>)
deleted: bool
[](<#(resource) admin.organization.projects.api_keys > (model) api_key_delete_response > (schema) > (property) deleted>)
object: Literal["organization.project.api\_key.deleted"]
[](<#(resource) admin.organization.projects.api_keys > (model) api_key_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.api_keys > (model) api_key_delete_response > (schema)>)
#### ProjectsRate Limits
##### [List project rate limits](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/rate_limits/methods/list_rate_limits)
admin.organization.projects.rate\_limits.list\_rate\_limits(strproject\_id, RateLimitListRateLimitsParams\*\*kwargs) -\> SyncConversationCursorPage[[ProjectRateLimit](</api/reference/python/resources/admin#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema)>)]
GET/organization/projects/{project\_id}/rate\_limits
##### [Modify project rate limit](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/rate_limits/methods/update_rate_limit)
admin.organization.projects.rate\_limits.update\_rate\_limit(strrate\_limit\_id, RateLimitUpdateRateLimitParams\*\*kwargs) -\> [ProjectRateLimit](</api/reference/python/resources/admin#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema)>)
POST/organization/projects/{project\_id}/rate\_limits/{rate\_limit\_id}
##### ModelsExpand Collapse
class ProjectRateLimit: …
Represents a project rate limit config.
id: str
The identifier, which can be referenced in API endpoints.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) id>)
max\_requests\_per\_1\_minute: int
The maximum requests per minute.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_requests_per_1_minute>)
max\_tokens\_per\_1\_minute: int
The maximum tokens per minute.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_tokens_per_1_minute>)
model: str
The model this rate limit applies to.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) model>)
object: Literal["project.rate\_limit"]
The object type, which is always `project.rate\_limit`
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) object>)
batch\_1\_day\_max\_input\_tokens: Optional[int]
The maximum batch input tokens per day. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) batch_1_day_max_input_tokens>)
max\_audio\_megabytes\_per\_1\_minute: Optional[int]
The maximum audio megabytes per minute. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_audio_megabytes_per_1_minute>)
max\_images\_per\_1\_minute: Optional[int]
The maximum images per minute. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_images_per_1_minute>)
max\_requests\_per\_1\_day: Optional[int]
The maximum requests per day. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_requests_per_1_day>)
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema)>)
#### ProjectsGroups
##### [List project groups](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/groups/methods/list)
admin.organization.projects.groups.list(strproject\_id, GroupListParams\*\*kwargs) -\> SyncCursorPage[[ProjectGroup](</api/reference/python/resources/admin#(resource) admin.organization.projects.groups > (model) project_group > (schema)>)]
GET/organization/projects/{project\_id}/groups
##### [Add project group](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/groups/methods/create)
admin.organization.projects.groups.create(strproject\_id, GroupCreateParams\*\*kwargs) -\> [ProjectGroup](</api/reference/python/resources/admin#(resource) admin.organization.projects.groups > (model) project_group > (schema)>)
POST/organization/projects/{project\_id}/groups
##### [Remove project group](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/groups/methods/delete)
admin.organization.projects.groups.delete(strgroup\_id, GroupDeleteParams\*\*kwargs) -\> [GroupDeleteResponse](</api/reference/python/resources/admin#(resource) admin.organization.projects.groups > (model) group_delete_response > (schema)>)
DELETE/organization/projects/{project\_id}/groups/{group\_id}
##### ModelsExpand Collapse
class ProjectGroup: …
Details about a group’s membership in a project.
created\_at: int
Unix timestamp (in seconds) when the group was granted project access.
formatunixtime
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) created_at>)
group\_id: str
Identifier of the group that has access to the project.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) group_id>)
group\_name: str
Display name of the group.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) group_name>)
object: Literal["project.group"]
Always `project.group`.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) object>)
project\_id: str
Identifier of the project.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) project_id>)
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema)>)
class GroupDeleteResponse: …
Confirmation payload returned after removing a group from a project.
deleted: bool
Whether the group membership in the project was removed.
[](<#(resource) admin.organization.projects.groups > (model) group_delete_response > (schema) > (property) deleted>)
object: Literal["project.group.deleted"]
Always `project.group.deleted`.
[](<#(resource) admin.organization.projects.groups > (model) group_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.groups > (model) group_delete_response > (schema)>)
#### ProjectsGroupsRoles
##### [List project group role assignments](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/groups/subresources/roles/methods/list)
admin.organization.projects.groups.roles.list(strgroup\_id, RoleListParams\*\*kwargs) -\> SyncCursorPage[[RoleListResponse](</api/reference/python/resources/admin#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema)>)]
GET/projects/{project\_id}/groups/{group\_id}/roles
##### [Assign project role to group](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/groups/subresources/roles/methods/create)
admin.organization.projects.groups.roles.create(strgroup\_id, RoleCreateParams\*\*kwargs) -\> [RoleCreateResponse](</api/reference/python/resources/admin#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema)>)
POST/projects/{project\_id}/groups/{group\_id}/roles
##### [Unassign project role from group](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/groups/subresources/roles/methods/delete)
admin.organization.projects.groups.roles.delete(strrole\_id, RoleDeleteParams\*\*kwargs) -\> [RoleDeleteResponse](</api/reference/python/resources/admin#(resource) admin.organization.projects.groups.roles > (model) role_delete_response > (schema)>)
DELETE/projects/{project\_id}/groups/{group\_id}/roles/{role\_id}
##### ModelsExpand Collapse
class RoleListResponse: …
Detailed information about a role assignment entry returned when listing assignments.
id: str
Identifier for the role.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) id>)
created\_at: Optional[int]
When the role was created.
formatunixtime
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) created_at>)
created\_by: Optional[str]
Identifier of the actor who created the role.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) created_by>)
created\_by\_user\_obj: Optional[Dict[str, object]]
User details for the actor that created the role, when available.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) created_by_user_obj>)
description: Optional[str]
Description of the role.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) description>)
metadata: Optional[Dict[str, object]]
Arbitrary metadata stored on the role.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) metadata>)
name: str
Name of the role.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) name>)
permissions: List[str]
Permissions associated with the role.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) permissions>)
predefined\_role: bool
Whether the role is predefined by OpenAI.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) predefined_role>)
resource\_type: str
Resource type the role applies to.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) resource_type>)
updated\_at: Optional[int]
When the role was last updated.
formatint64
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) updated_at>)
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema)>)
class RoleCreateResponse: …
Role assignment linking a group to a role.
group: Group
Summary information about a group returned in role assignment responses.
id: str
Identifier for the group.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema) > (property) group > (property) id>)
created\_at: int
Unix timestamp (in seconds) when the group was created.
formatunixtime
[](<#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema) > (property) group > (property) created_at>)
name: str
Display name of the group.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema) > (property) group > (property) name>)
object: Literal["group"]
Always `group`.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema) > (property) group > (property) object>)
scim\_managed: bool
Whether the group is managed through SCIM.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema) > (property) group > (property) scim_managed>)
[](<#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema) > (property) group>)
object: Literal["group.role"]
Always `group.role`.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema) > (property) object>)
role: [Role](</api/reference/python/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>)
Details about a role that can be assigned through the public Roles API.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema)>)
class RoleDeleteResponse: …
Confirmation payload returned after unassigning a role.
deleted: bool
Whether the assignment was removed.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_delete_response > (schema) > (property) deleted>)
object: str
Identifier for the deleted assignment, such as `group.role.deleted` or `user.role.deleted`.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.groups.roles > (model) role_delete_response > (schema)>)
#### ProjectsRoles
##### [List project roles](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/list)
admin.organization.projects.roles.list(strproject\_id, RoleListParams\*\*kwargs) -\> SyncCursorPage[[Role](</api/reference/python/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>)]
GET/projects/{project\_id}/roles
##### [Create project role](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/create)
admin.organization.projects.roles.create(strproject\_id, RoleCreateParams\*\*kwargs) -\> [Role](</api/reference/python/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>)
POST/projects/{project\_id}/roles
##### [Update project role](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/update)
admin.organization.projects.roles.update(strrole\_id, RoleUpdateParams\*\*kwargs) -\> [Role](</api/reference/python/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>)
POST/projects/{project\_id}/roles/{role\_id}
##### [Delete project role](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/delete)
admin.organization.projects.roles.delete(strrole\_id, RoleDeleteParams\*\*kwargs) -\> [RoleDeleteResponse](</api/reference/python/resources/admin#(resource) admin.organization.projects.roles > (model) role_delete_response > (schema)>)
DELETE/projects/{project\_id}/roles/{role\_id}
##### ModelsExpand Collapse
class RoleDeleteResponse: …
Confirmation payload returned after deleting a role.
id: str
Identifier of the deleted role.
[](<#(resource) admin.organization.projects.roles > (model) role_delete_response > (schema) > (property) id>)
deleted: bool
Whether the role was deleted.
[](<#(resource) admin.organization.projects.roles > (model) role_delete_response > (schema) > (property) deleted>)
object: Literal["role.deleted"]
Always `role.deleted`.
[](<#(resource) admin.organization.projects.roles > (model) role_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.roles > (model) role_delete_response > (schema)>)
#### ProjectsCertificates
##### [List project certificates](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/certificates/methods/list)
admin.organization.projects.certificates.list(strproject\_id, CertificateListParams\*\*kwargs) -\> SyncConversationCursorPage[[Certificate](</api/reference/python/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>)]
GET/organization/projects/{project\_id}/certificates
##### [Activate certificates for project](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/certificates/methods/activate)
admin.organization.projects.certificates.activate(strproject\_id, CertificateActivateParams\*\*kwargs) -\> SyncPage[[Certificate](</api/reference/python/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>)]
POST/organization/projects/{project\_id}/certificates/activate
##### [Deactivate certificates for project](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/certificates/methods/deactivate)
admin.organization.projects.certificates.deactivate(strproject\_id, CertificateDeactivateParams\*\*kwargs) -\> SyncPage[[Certificate](</api/reference/python/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>)]
POST/organization/projects/{project\_id}/certificates/deactivate