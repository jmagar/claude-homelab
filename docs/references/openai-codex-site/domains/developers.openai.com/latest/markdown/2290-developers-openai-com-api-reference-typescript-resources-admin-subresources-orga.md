Projects | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Admin](/api/reference/typescript/resources/admin)
[Organization](/api/reference/typescript/resources/admin/subresources/organization)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Projects
##### [List projects](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/methods/list)
client.admin.organization.projects.list(ProjectListParams { after, include\_archived, limit } query?, RequestOptionsoptions?): ConversationCursorPage\<[Project](</api/reference/typescript/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>) { id, created\_at, name, 3 more } \>
GET/organization/projects
##### [Create project](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/methods/create)
client.admin.organization.projects.create(ProjectCreateParams { name, geography } body, RequestOptionsoptions?): [Project](</api/reference/typescript/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>) { id, created\_at, name, 3 more }
POST/organization/projects
##### [Retrieve project](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/methods/retrieve)
client.admin.organization.projects.retrieve(stringprojectID, RequestOptionsoptions?): [Project](</api/reference/typescript/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>) { id, created\_at, name, 3 more }
GET/organization/projects/{project\_id}
##### [Modify project](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/methods/update)
client.admin.organization.projects.update(stringprojectID, ProjectUpdateParams { name } body, RequestOptionsoptions?): [Project](</api/reference/typescript/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>) { id, created\_at, name, 3 more }
POST/organization/projects/{project\_id}
##### [Archive project](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/methods/archive)
client.admin.organization.projects.archive(stringprojectID, RequestOptionsoptions?): [Project](</api/reference/typescript/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>) { id, created\_at, name, 3 more }
POST/organization/projects/{project\_id}/archive
##### ModelsExpand Collapse
Project { id, created\_at, name, 3 more }
Represents an individual project.
id: string
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) id>)
created\_at: number
The Unix timestamp (in seconds) of when the project was created.
formatunixtime
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) created_at>)
name: string
The name of the project. This appears in reporting.
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) name>)
object: "organization.project"
The object type, which is always `organization.project`
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) object>)
status: "active" | "archived"
`active` or `archived`
One of the following:
"active"
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) status > (member) 0>)
"archived"
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) status > (member) 1>)
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) status>)
archived\_at?: number | null
The Unix timestamp (in seconds) of when the project was archived or `null`.
formatunixtime
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) archived_at>)
[](<#(resource) admin.organization.projects > (model) project > (schema)>)
#### ProjectsUsers
##### [List project users](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/list)
client.admin.organization.projects.users.list(stringprojectID, UserListParams { after, limit } query?, RequestOptionsoptions?): ConversationCursorPage\<[ProjectUser](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>) { id, added\_at, email, 3 more } \>
GET/organization/projects/{project\_id}/users
##### [Create project user](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/create)
client.admin.organization.projects.users.create(stringprojectID, UserCreateParams { role, user\_id } body, RequestOptionsoptions?): [ProjectUser](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>) { id, added\_at, email, 3 more }
POST/organization/projects/{project\_id}/users
##### [Retrieve project user](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/retrieve)
client.admin.organization.projects.users.retrieve(stringuserID, UserRetrieveParams { project\_id } params, RequestOptionsoptions?): [ProjectUser](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>) { id, added\_at, email, 3 more }
GET/organization/projects/{project\_id}/users/{user\_id}
##### [Modify project user](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/update)
client.admin.organization.projects.users.update(stringuserID, UserUpdateParams { project\_id, role } params, RequestOptionsoptions?): [ProjectUser](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>) { id, added\_at, email, 3 more }
POST/organization/projects/{project\_id}/users/{user\_id}
##### [Delete project user](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/delete)
client.admin.organization.projects.users.delete(stringuserID, UserDeleteParams { project\_id } params, RequestOptionsoptions?): [UserDeleteResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.users > (model) user_delete_response > (schema)>) { id, deleted, object }
DELETE/organization/projects/{project\_id}/users/{user\_id}
##### ModelsExpand Collapse
ProjectUser { id, added\_at, email, 3 more }
Represents an individual user in a project.
id: string
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) id>)
added\_at: number
The Unix timestamp (in seconds) of when the project was added.
formatunixtime
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) added_at>)
email: string
The email address of the user
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) email>)
name: string
The name of the user
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) name>)
object: "organization.project.user"
The object type, which is always `organization.project.user`
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) object>)
role: "owner" | "member"
`owner` or `member`
One of the following:
"owner"
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role > (member) 0>)
"member"
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema)>)
UserDeleteResponse { id, deleted, object }
id: string
[](<#(resource) admin.organization.projects.users > (model) user_delete_response > (schema) > (property) id>)
deleted: boolean
[](<#(resource) admin.organization.projects.users > (model) user_delete_response > (schema) > (property) deleted>)
object: "organization.project.user.deleted"
[](<#(resource) admin.organization.projects.users > (model) user_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.users > (model) user_delete_response > (schema)>)
#### ProjectsUsersRoles
##### [List project user role assignments](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/users/subresources/roles/methods/list)
client.admin.organization.projects.users.roles.list(stringuserID, RoleListParams { project\_id, after, limit, order } params, RequestOptionsoptions?): CursorPage\<[RoleListResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema)>) { id, created\_at, created\_by, 8 more } \>
GET/projects/{project\_id}/users/{user\_id}/roles
##### [Assign project role to user](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/users/subresources/roles/methods/create)
client.admin.organization.projects.users.roles.create(stringuserID, RoleCreateParams { project\_id, role\_id } params, RequestOptionsoptions?): [RoleCreateResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema)>) { object, role, user }
POST/projects/{project\_id}/users/{user\_id}/roles
##### [Unassign project role from user](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/users/subresources/roles/methods/delete)
client.admin.organization.projects.users.roles.delete(stringroleID, RoleDeleteParams { project\_id, user\_id } params, RequestOptionsoptions?): [RoleDeleteResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.users.roles > (model) role_delete_response > (schema)>) { deleted, object }
DELETE/projects/{project\_id}/users/{user\_id}/roles/{role\_id}
##### ModelsExpand Collapse
RoleListResponse { id, created\_at, created\_by, 8 more }
Detailed information about a role assignment entry returned when listing assignments.
id: string
Identifier for the role.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) id>)
created\_at: number | null
When the role was created.
formatunixtime
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) created_at>)
created\_by: string | null
Identifier of the actor who created the role.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) created_by>)
created\_by\_user\_obj: Record\<string, unknown\> | null
User details for the actor that created the role, when available.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) created_by_user_obj>)
description: string | null
Description of the role.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) description>)
metadata: Record\<string, unknown\> | null
Arbitrary metadata stored on the role.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) metadata>)
name: string
Name of the role.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) name>)
permissions: Array\<string\>
Permissions associated with the role.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) permissions>)
predefined\_role: boolean
Whether the role is predefined by OpenAI.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) predefined_role>)
resource\_type: string
Resource type the role applies to.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) resource_type>)
updated\_at: number | null
When the role was last updated.
formatint64
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) updated_at>)
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema)>)
RoleCreateResponse { object, role, user }
Role assignment linking a user to a role.
object: "user.role"
Always `user.role`.
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema) > (property) object>)
role: [Role](</api/reference/typescript/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) { id, description, name, 4 more }
Details about a role that can be assigned through the public Roles API.
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema) > (property) role>)
user: [OrganizationUser](</api/reference/typescript/resources/admin#(resource) admin.organization.users > (model) organization_user > (schema)>) { id, added\_at, email, 3 more }
Represents an individual `user` within an organization.
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema) > (property) user>)
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema)>)
RoleDeleteResponse { deleted, object }
Confirmation payload returned after unassigning a role.
deleted: boolean
Whether the assignment was removed.
[](<#(resource) admin.organization.projects.users.roles > (model) role_delete_response > (schema) > (property) deleted>)
object: string
Identifier for the deleted assignment, such as `group.role.deleted` or `user.role.deleted`.
[](<#(resource) admin.organization.projects.users.roles > (model) role_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.users.roles > (model) role_delete_response > (schema)>)
#### ProjectsService Accounts
##### [List project service accounts](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/service_accounts/methods/list)
client.admin.organization.projects.serviceAccounts.list(stringprojectID, ServiceAccountListParams { after, limit } query?, RequestOptionsoptions?): ConversationCursorPage\<[ProjectServiceAccount](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema)>) { id, created\_at, name, 2 more } \>
GET/organization/projects/{project\_id}/service\_accounts
##### [Create project service account](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/service_accounts/methods/create)
client.admin.organization.projects.serviceAccounts.create(stringprojectID, ServiceAccountCreateParams { name } body, RequestOptionsoptions?): [ServiceAccountCreateResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema)>) { id, api\_key, created\_at, 3 more }
POST/organization/projects/{project\_id}/service\_accounts
##### [Retrieve project service account](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/service_accounts/methods/retrieve)
client.admin.organization.projects.serviceAccounts.retrieve(stringserviceAccountID, ServiceAccountRetrieveParams { project\_id } params, RequestOptionsoptions?): [ProjectServiceAccount](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema)>) { id, created\_at, name, 2 more }
GET/organization/projects/{project\_id}/service\_accounts/{service\_account\_id}
##### [Delete project service account](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/service_accounts/methods/delete)
client.admin.organization.projects.serviceAccounts.delete(stringserviceAccountID, ServiceAccountDeleteParams { project\_id } params, RequestOptionsoptions?): [ServiceAccountDeleteResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.service_accounts > (model) service_account_delete_response > (schema)>) { id, deleted, object }
DELETE/organization/projects/{project\_id}/service\_accounts/{service\_account\_id}
##### ModelsExpand Collapse
ProjectServiceAccount { id, created\_at, name, 2 more }
Represents an individual service account in a project.
id: string
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) id>)
created\_at: number
The Unix timestamp (in seconds) of when the service account was created
formatunixtime
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) created_at>)
name: string
The name of the service account
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) name>)
object: "organization.project.service\_account"
The object type, which is always `organization.project.service\_account`
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) object>)
role: "owner" | "member"
`owner` or `member`
One of the following:
"owner"
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role > (member) 0>)
"member"
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema)>)
ServiceAccountCreateResponse { id, api\_key, created\_at, 3 more }
id: string
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) id>)
api\_key: APIKey { id, created\_at, name, 2 more }
id: string
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) api_key > (property) id>)
created\_at: number
formatunixtime
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) api_key > (property) created_at>)
name: string
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) api_key > (property) name>)
object: "organization.project.service\_account.api\_key"
The object type, which is always `organization.project.service\_account.api\_key`
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) api_key > (property) object>)
value: string
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) api_key > (property) value>)
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) api_key>)
created\_at: number
formatunixtime
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) created_at>)
name: string
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) name>)
object: "organization.project.service\_account"
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) object>)
role: "member"
Service accounts can only have one role of type `member`
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema)>)
ServiceAccountDeleteResponse { id, deleted, object }
id: string
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_delete_response > (schema) > (property) id>)
deleted: boolean
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_delete_response > (schema) > (property) deleted>)
object: "organization.project.service\_account.deleted"
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_delete_response > (schema)>)
#### ProjectsAPI Keys
##### [List project API keys](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/api_keys/methods/list)
client.admin.organization.projects.apiKeys.list(stringprojectID, APIKeyListParams { after, limit } query?, RequestOptionsoptions?): ConversationCursorPage\<[ProjectAPIKey](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema)>) { id, created\_at, last\_used\_at, 4 more } \>
GET/organization/projects/{project\_id}/api\_keys
##### [Retrieve project API key](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/api_keys/methods/retrieve)
client.admin.organization.projects.apiKeys.retrieve(stringkeyID, APIKeyRetrieveParams { project\_id } params, RequestOptionsoptions?): [ProjectAPIKey](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema)>) { id, created\_at, last\_used\_at, 4 more }
GET/organization/projects/{project\_id}/api\_keys/{key\_id}
##### [Delete project API key](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/api_keys/methods/delete)
client.admin.organization.projects.apiKeys.delete(stringkeyID, APIKeyDeleteParams { project\_id } params, RequestOptionsoptions?): [APIKeyDeleteResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.api_keys > (model) api_key_delete_response > (schema)>) { id, deleted, object }
DELETE/organization/projects/{project\_id}/api\_keys/{key\_id}
##### ModelsExpand Collapse
ProjectAPIKey { id, created\_at, last\_used\_at, 4 more }
Represents an individual API key in a project.
id: string
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) id>)
created\_at: number
The Unix timestamp (in seconds) of when the API key was created
formatunixtime
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) created_at>)
last\_used\_at: number
The Unix timestamp (in seconds) of when the API key was last used.
formatunixtime
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) last_used_at>)
name: string
The name of the API key
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) name>)
object: "organization.project.api\_key"
The object type, which is always `organization.project.api\_key`
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) object>)
owner: Owner { service\_account, type, user }
service\_account?: [ProjectServiceAccount](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema)>) { id, created\_at, name, 2 more }
Represents an individual service account in a project.
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) service_account>)
type?: "user" | "service\_account"
`user` or `service\_account`
One of the following:
"user"
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) type > (member) 0>)
"service\_account"
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) type > (member) 1>)
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) type>)
user?: [ProjectUser](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>) { id, added\_at, email, 3 more }
Represents an individual user in a project.
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) user>)
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner>)
redacted\_value: string
The redacted value of the API key
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) redacted_value>)
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema)>)
APIKeyDeleteResponse { id, deleted, object }
id: string
[](<#(resource) admin.organization.projects.api_keys > (model) api_key_delete_response > (schema) > (property) id>)
deleted: boolean
[](<#(resource) admin.organization.projects.api_keys > (model) api_key_delete_response > (schema) > (property) deleted>)
object: "organization.project.api\_key.deleted"
[](<#(resource) admin.organization.projects.api_keys > (model) api_key_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.api_keys > (model) api_key_delete_response > (schema)>)
#### ProjectsRate Limits
##### [List project rate limits](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/rate_limits/methods/list_rate_limits)
client.admin.organization.projects.rateLimits.listRateLimits(stringprojectID, RateLimitListRateLimitsParams { after, before, limit } query?, RequestOptionsoptions?): ConversationCursorPage\<[ProjectRateLimit](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema)>) { id, max\_requests\_per\_1\_minute, max\_tokens\_per\_1\_minute, 6 more } \>
GET/organization/projects/{project\_id}/rate\_limits
##### [Modify project rate limit](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/rate_limits/methods/update_rate_limit)
client.admin.organization.projects.rateLimits.updateRateLimit(stringrateLimitID, RateLimitUpdateRateLimitParams { project\_id, batch\_1\_day\_max\_input\_tokens, max\_audio\_megabytes\_per\_1\_minute, 4 more } params, RequestOptionsoptions?): [ProjectRateLimit](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema)>) { id, max\_requests\_per\_1\_minute, max\_tokens\_per\_1\_minute, 6 more }
POST/organization/projects/{project\_id}/rate\_limits/{rate\_limit\_id}
##### ModelsExpand Collapse
ProjectRateLimit { id, max\_requests\_per\_1\_minute, max\_tokens\_per\_1\_minute, 6 more }
Represents a project rate limit config.
id: string
The identifier, which can be referenced in API endpoints.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) id>)
max\_requests\_per\_1\_minute: number
The maximum requests per minute.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_requests_per_1_minute>)
max\_tokens\_per\_1\_minute: number
The maximum tokens per minute.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_tokens_per_1_minute>)
model: string
The model this rate limit applies to.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) model>)
object: "project.rate\_limit"
The object type, which is always `project.rate\_limit`
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) object>)
batch\_1\_day\_max\_input\_tokens?: number
The maximum batch input tokens per day. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) batch_1_day_max_input_tokens>)
max\_audio\_megabytes\_per\_1\_minute?: number
The maximum audio megabytes per minute. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_audio_megabytes_per_1_minute>)
max\_images\_per\_1\_minute?: number
The maximum images per minute. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_images_per_1_minute>)
max\_requests\_per\_1\_day?: number
The maximum requests per day. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_requests_per_1_day>)
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema)>)
#### ProjectsGroups
##### [List project groups](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/groups/methods/list)
client.admin.organization.projects.groups.list(stringprojectID, GroupListParams { after, limit, order } query?, RequestOptionsoptions?): CursorPage\<[ProjectGroup](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.groups > (model) project_group > (schema)>) { created\_at, group\_id, group\_name, 2 more } \>
GET/organization/projects/{project\_id}/groups
##### [Add project group](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/groups/methods/create)
client.admin.organization.projects.groups.create(stringprojectID, GroupCreateParams { group\_id, role } body, RequestOptionsoptions?): [ProjectGroup](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.groups > (model) project_group > (schema)>) { created\_at, group\_id, group\_name, 2 more }
POST/organization/projects/{project\_id}/groups
##### [Remove project group](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/groups/methods/delete)
client.admin.organization.projects.groups.delete(stringgroupID, GroupDeleteParams { project\_id } params, RequestOptionsoptions?): [GroupDeleteResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.groups > (model) group_delete_response > (schema)>) { deleted, object }
DELETE/organization/projects/{project\_id}/groups/{group\_id}
##### ModelsExpand Collapse
ProjectGroup { created\_at, group\_id, group\_name, 2 more }
Details about a group’s membership in a project.
created\_at: number
Unix timestamp (in seconds) when the group was granted project access.
formatunixtime
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) created_at>)
group\_id: string
Identifier of the group that has access to the project.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) group_id>)
group\_name: string
Display name of the group.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) group_name>)
object: "project.group"
Always `project.group`.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) object>)
project\_id: string
Identifier of the project.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) project_id>)
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema)>)
GroupDeleteResponse { deleted, object }
Confirmation payload returned after removing a group from a project.
deleted: boolean
Whether the group membership in the project was removed.
[](<#(resource) admin.organization.projects.groups > (model) group_delete_response > (schema) > (property) deleted>)
object: "project.group.deleted"
Always `project.group.deleted`.
[](<#(resource) admin.organization.projects.groups > (model) group_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.groups > (model) group_delete_response > (schema)>)
#### ProjectsGroupsRoles
##### [List project group role assignments](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/groups/subresources/roles/methods/list)
client.admin.organization.projects.groups.roles.list(stringgroupID, RoleListParams { project\_id, after, limit, order } params, RequestOptionsoptions?): CursorPage\<[RoleListResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema)>) { id, created\_at, created\_by, 8 more } \>
GET/projects/{project\_id}/groups/{group\_id}/roles
##### [Assign project role to group](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/groups/subresources/roles/methods/create)
client.admin.organization.projects.groups.roles.create(stringgroupID, RoleCreateParams { project\_id, role\_id } params, RequestOptionsoptions?): [RoleCreateResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema)>) { group, object, role }
POST/projects/{project\_id}/groups/{group\_id}/roles
##### [Unassign project role from group](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/groups/subresources/roles/methods/delete)
client.admin.organization.projects.groups.roles.delete(stringroleID, RoleDeleteParams { project\_id, group\_id } params, RequestOptionsoptions?): [RoleDeleteResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.groups.roles > (model) role_delete_response > (schema)>) { deleted, object }
DELETE/projects/{project\_id}/groups/{group\_id}/roles/{role\_id}
##### ModelsExpand Collapse
RoleListResponse { id, created\_at, created\_by, 8 more }
Detailed information about a role assignment entry returned when listing assignments.
id: string
Identifier for the role.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) id>)
created\_at: number | null
When the role was created.
formatunixtime
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) created_at>)
created\_by: string | null
Identifier of the actor who created the role.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) created_by>)
created\_by\_user\_obj: Record\<string, unknown\> | null
User details for the actor that created the role, when available.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) created_by_user_obj>)
description: string | null
Description of the role.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) description>)
metadata: Record\<string, unknown\> | null
Arbitrary metadata stored on the role.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) metadata>)
name: string
Name of the role.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) name>)
permissions: Array\<string\>
Permissions associated with the role.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) permissions>)
predefined\_role: boolean
Whether the role is predefined by OpenAI.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) predefined_role>)
resource\_type: string
Resource type the role applies to.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) resource_type>)
updated\_at: number | null
When the role was last updated.
formatint64
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) updated_at>)
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema)>)
RoleCreateResponse { group, object, role }
Role assignment linking a group to a role.
group: Group { id, created\_at, name, 2 more }
Summary information about a group returned in role assignment responses.
id: string
Identifier for the group.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema) > (property) group > (property) id>)
created\_at: number
Unix timestamp (in seconds) when the group was created.
formatunixtime
[](<#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema) > (property) group > (property) created_at>)
name: string
Display name of the group.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema) > (property) group > (property) name>)
object: "group"
Always `group`.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema) > (property) group > (property) object>)
scim\_managed: boolean
Whether the group is managed through SCIM.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema) > (property) group > (property) scim_managed>)
[](<#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema) > (property) group>)
object: "group.role"
Always `group.role`.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema) > (property) object>)
role: [Role](</api/reference/typescript/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) { id, description, name, 4 more }
Details about a role that can be assigned through the public Roles API.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema)>)
RoleDeleteResponse { deleted, object }
Confirmation payload returned after unassigning a role.
deleted: boolean
Whether the assignment was removed.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_delete_response > (schema) > (property) deleted>)
object: string
Identifier for the deleted assignment, such as `group.role.deleted` or `user.role.deleted`.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.groups.roles > (model) role_delete_response > (schema)>)
#### ProjectsRoles
##### [List project roles](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/list)
client.admin.organization.projects.roles.list(stringprojectID, RoleListParams { after, limit, order } query?, RequestOptionsoptions?): CursorPage\<[Role](</api/reference/typescript/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) { id, description, name, 4 more } \>
GET/projects/{project\_id}/roles
##### [Create project role](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/create)
client.admin.organization.projects.roles.create(stringprojectID, RoleCreateParams { permissions, role\_name, description } body, RequestOptionsoptions?): [Role](</api/reference/typescript/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) { id, description, name, 4 more }
POST/projects/{project\_id}/roles
##### [Update project role](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/update)
client.admin.organization.projects.roles.update(stringroleID, RoleUpdateParams { project\_id, description, permissions, role\_name } params, RequestOptionsoptions?): [Role](</api/reference/typescript/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) { id, description, name, 4 more }
POST/projects/{project\_id}/roles/{role\_id}
##### [Delete project role](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/delete)
client.admin.organization.projects.roles.delete(stringroleID, RoleDeleteParams { project\_id } params, RequestOptionsoptions?): [RoleDeleteResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.roles > (model) role_delete_response > (schema)>) { id, deleted, object }
DELETE/projects/{project\_id}/roles/{role\_id}
##### ModelsExpand Collapse
RoleDeleteResponse { id, deleted, object }
Confirmation payload returned after deleting a role.
id: string
Identifier of the deleted role.
[](<#(resource) admin.organization.projects.roles > (model) role_delete_response > (schema) > (property) id>)
deleted: boolean
Whether the role was deleted.
[](<#(resource) admin.organization.projects.roles > (model) role_delete_response > (schema) > (property) deleted>)
object: "role.deleted"
Always `role.deleted`.
[](<#(resource) admin.organization.projects.roles > (model) role_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.roles > (model) role_delete_response > (schema)>)
#### ProjectsCertificates
##### [List project certificates](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/certificates/methods/list)
client.admin.organization.projects.certificates.list(stringprojectID, CertificateListParams { after, limit, order } query?, RequestOptionsoptions?): ConversationCursorPage\<[Certificate](</api/reference/typescript/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>) { id, certificate\_details, created\_at, 3 more } \>
GET/organization/projects/{project\_id}/certificates
##### [Activate certificates for project](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/certificates/methods/activate)
client.admin.organization.projects.certificates.activate(stringprojectID, CertificateActivateParams { certificate\_ids } body, RequestOptionsoptions?): Page\<[Certificate](</api/reference/typescript/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>) { id, certificate\_details, created\_at, 3 more } \>
POST/organization/projects/{project\_id}/certificates/activate
##### [Deactivate certificates for project](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/certificates/methods/deactivate)
client.admin.organization.projects.certificates.deactivate(stringprojectID, CertificateDeactivateParams { certificate\_ids } body, RequestOptionsoptions?): Page\<[Certificate](</api/reference/typescript/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>) { id, certificate\_details, created\_at, 3 more } \>
POST/organization/projects/{project\_id}/certificates/deactivate