Projects | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Admin](/api/reference/ruby/resources/admin)
[Organization](/api/reference/ruby/resources/admin/subresources/organization)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Projects
##### [List projects](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/methods/list)
admin.organization.projects.list(\*\*kwargs) -\> ConversationCursorPage\<[Project](</api/reference/ruby/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>) { id, created\_at, name, 3 more } \>
GET/organization/projects
##### [Create project](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/methods/create)
admin.organization.projects.create(\*\*kwargs) -\> [Project](</api/reference/ruby/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>) { id, created\_at, name, 3 more }
POST/organization/projects
##### [Retrieve project](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/methods/retrieve)
admin.organization.projects.retrieve(project\_id) -\> [Project](</api/reference/ruby/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>) { id, created\_at, name, 3 more }
GET/organization/projects/{project\_id}
##### [Modify project](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/methods/update)
admin.organization.projects.update(project\_id, \*\*kwargs) -\> [Project](</api/reference/ruby/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>) { id, created\_at, name, 3 more }
POST/organization/projects/{project\_id}
##### [Archive project](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/methods/archive)
admin.organization.projects.archive(project\_id) -\> [Project](</api/reference/ruby/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>) { id, created\_at, name, 3 more }
POST/organization/projects/{project\_id}/archive
##### ModelsExpand Collapse
class Project { id, created\_at, name, 3 more }
Represents an individual project.
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) id>)
created\_at: Integer
The Unix timestamp (in seconds) of when the project was created.
formatunixtime
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) created_at>)
name: String
The name of the project. This appears in reporting.
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) name>)
object: :"organization.project"
The object type, which is always `organization.project`
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) object>)
status: :active | :archived
`active` or `archived`
One of the following:
:active
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) status > (member) 0>)
:archived
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) status > (member) 1>)
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) status>)
archived\_at: Integer
The Unix timestamp (in seconds) of when the project was archived or `null`.
formatunixtime
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) archived_at>)
[](<#(resource) admin.organization.projects > (model) project > (schema)>)
#### ProjectsUsers
##### [List project users](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/list)
admin.organization.projects.users.list(project\_id, \*\*kwargs) -\> ConversationCursorPage\<[ProjectUser](</api/reference/ruby/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>) { id, added\_at, email, 3 more } \>
GET/organization/projects/{project\_id}/users
##### [Create project user](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/create)
admin.organization.projects.users.create(project\_id, \*\*kwargs) -\> [ProjectUser](</api/reference/ruby/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>) { id, added\_at, email, 3 more }
POST/organization/projects/{project\_id}/users
##### [Retrieve project user](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/retrieve)
admin.organization.projects.users.retrieve(user\_id, \*\*kwargs) -\> [ProjectUser](</api/reference/ruby/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>) { id, added\_at, email, 3 more }
GET/organization/projects/{project\_id}/users/{user\_id}
##### [Modify project user](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/update)
admin.organization.projects.users.update(user\_id, \*\*kwargs) -\> [ProjectUser](</api/reference/ruby/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>) { id, added\_at, email, 3 more }
POST/organization/projects/{project\_id}/users/{user\_id}
##### [Delete project user](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/delete)
admin.organization.projects.users.delete(user\_id, \*\*kwargs) -\> [UserDeleteResponse](</api/reference/ruby/resources/admin#(resource) admin.organization.projects.users > (model) user_delete_response > (schema)>) { id, deleted, object }
DELETE/organization/projects/{project\_id}/users/{user\_id}
##### ModelsExpand Collapse
class ProjectUser { id, added\_at, email, 3 more }
Represents an individual user in a project.
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) id>)
added\_at: Integer
The Unix timestamp (in seconds) of when the project was added.
formatunixtime
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) added_at>)
email: String
The email address of the user
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) email>)
name: String
The name of the user
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) name>)
object: :"organization.project.user"
The object type, which is always `organization.project.user`
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) object>)
role: :owner | :member
`owner` or `member`
One of the following:
:owner
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role > (member) 0>)
:member
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema)>)
class UserDeleteResponse { id, deleted, object }
id: String
[](<#(resource) admin.organization.projects.users > (model) user_delete_response > (schema) > (property) id>)
deleted: bool
[](<#(resource) admin.organization.projects.users > (model) user_delete_response > (schema) > (property) deleted>)
object: :"organization.project.user.deleted"
[](<#(resource) admin.organization.projects.users > (model) user_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.users > (model) user_delete_response > (schema)>)
#### ProjectsUsersRoles
##### [List project user role assignments](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/users/subresources/roles/methods/list)
admin.organization.projects.users.roles.list(user\_id, \*\*kwargs) -\> CursorPage\<[RoleListResponse](</api/reference/ruby/resources/admin#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema)>) { id, created\_at, created\_by, 8 more } \>
GET/projects/{project\_id}/users/{user\_id}/roles
##### [Assign project role to user](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/users/subresources/roles/methods/create)
admin.organization.projects.users.roles.create(user\_id, \*\*kwargs) -\> [RoleCreateResponse](</api/reference/ruby/resources/admin#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema)>) { object, role, user }
POST/projects/{project\_id}/users/{user\_id}/roles
##### [Unassign project role from user](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/users/subresources/roles/methods/delete)
admin.organization.projects.users.roles.delete(role\_id, \*\*kwargs) -\> [RoleDeleteResponse](</api/reference/ruby/resources/admin#(resource) admin.organization.projects.users.roles > (model) role_delete_response > (schema)>) { deleted, object }
DELETE/projects/{project\_id}/users/{user\_id}/roles/{role\_id}
##### ModelsExpand Collapse
class RoleListResponse { id, created\_at, created\_by, 8 more }
Detailed information about a role assignment entry returned when listing assignments.
id: String
Identifier for the role.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) id>)
created\_at: Integer
When the role was created.
formatunixtime
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) created_at>)
created\_by: String
Identifier of the actor who created the role.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) created_by>)
created\_by\_user\_obj: Hash[Symbol, untyped]
User details for the actor that created the role, when available.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) created_by_user_obj>)
description: String
Description of the role.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) description>)
metadata: Hash[Symbol, untyped]
Arbitrary metadata stored on the role.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) metadata>)
name: String
Name of the role.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) name>)
permissions: Array[String]
Permissions associated with the role.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) permissions>)
predefined\_role: bool
Whether the role is predefined by OpenAI.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) predefined_role>)
resource\_type: String
Resource type the role applies to.
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) resource_type>)
updated\_at: Integer
When the role was last updated.
formatint64
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema) > (property) updated_at>)
[](<#(resource) admin.organization.projects.users.roles > (model) role_list_response > (schema)>)
class RoleCreateResponse { object, role, user }
Role assignment linking a user to a role.
object: :"user.role"
Always `user.role`.
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema) > (property) object>)
role: [Role](</api/reference/ruby/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) { id, description, name, 4 more }
Details about a role that can be assigned through the public Roles API.
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema) > (property) role>)
user: [OrganizationUser](</api/reference/ruby/resources/admin#(resource) admin.organization.users > (model) organization_user > (schema)>) { id, added\_at, email, 3 more }
Represents an individual `user` within an organization.
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema) > (property) user>)
[](<#(resource) admin.organization.projects.users.roles > (model) role_create_response > (schema)>)
class RoleDeleteResponse { deleted, object }
Confirmation payload returned after unassigning a role.
deleted: bool
Whether the assignment was removed.
[](<#(resource) admin.organization.projects.users.roles > (model) role_delete_response > (schema) > (property) deleted>)
object: String
Identifier for the deleted assignment, such as `group.role.deleted` or `user.role.deleted`.
[](<#(resource) admin.organization.projects.users.roles > (model) role_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.users.roles > (model) role_delete_response > (schema)>)
#### ProjectsService Accounts
##### [List project service accounts](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/service_accounts/methods/list)
admin.organization.projects.service\_accounts.list(project\_id, \*\*kwargs) -\> ConversationCursorPage\<[ProjectServiceAccount](</api/reference/ruby/resources/admin#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema)>) { id, created\_at, name, 2 more } \>
GET/organization/projects/{project\_id}/service\_accounts
##### [Create project service account](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/service_accounts/methods/create)
admin.organization.projects.service\_accounts.create(project\_id, \*\*kwargs) -\> [ServiceAccountCreateResponse](</api/reference/ruby/resources/admin#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema)>) { id, api\_key, created\_at, 3 more }
POST/organization/projects/{project\_id}/service\_accounts
##### [Retrieve project service account](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/service_accounts/methods/retrieve)
admin.organization.projects.service\_accounts.retrieve(service\_account\_id, \*\*kwargs) -\> [ProjectServiceAccount](</api/reference/ruby/resources/admin#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema)>) { id, created\_at, name, 2 more }
GET/organization/projects/{project\_id}/service\_accounts/{service\_account\_id}
##### [Delete project service account](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/service_accounts/methods/delete)
admin.organization.projects.service\_accounts.delete(service\_account\_id, \*\*kwargs) -\> [ServiceAccountDeleteResponse](</api/reference/ruby/resources/admin#(resource) admin.organization.projects.service_accounts > (model) service_account_delete_response > (schema)>) { id, deleted, object }
DELETE/organization/projects/{project\_id}/service\_accounts/{service\_account\_id}
##### ModelsExpand Collapse
class ProjectServiceAccount { id, created\_at, name, 2 more }
Represents an individual service account in a project.
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) id>)
created\_at: Integer
The Unix timestamp (in seconds) of when the service account was created
formatunixtime
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) created_at>)
name: String
The name of the service account
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) name>)
object: :"organization.project.service\_account"
The object type, which is always `organization.project.service\_account`
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) object>)
role: :owner | :member
`owner` or `member`
One of the following:
:owner
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role > (member) 0>)
:member
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema)>)
class ServiceAccountCreateResponse { id, api\_key, created\_at, 3 more }
id: String
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) id>)
api\_key: APIKey{ id, created\_at, name, 2 more}
id: String
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) api_key > (property) id>)
created\_at: Integer
formatunixtime
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) api_key > (property) created_at>)
name: String
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) api_key > (property) name>)
object: :"organization.project.service\_account.api\_key"
The object type, which is always `organization.project.service\_account.api\_key`
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) api_key > (property) object>)
value: String
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) api_key > (property) value>)
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) api_key>)
created\_at: Integer
formatunixtime
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) created_at>)
name: String
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) name>)
object: :"organization.project.service\_account"
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) object>)
role: :member
Service accounts can only have one role of type `member`
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_create_response > (schema)>)
class ServiceAccountDeleteResponse { id, deleted, object }
id: String
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_delete_response > (schema) > (property) id>)
deleted: bool
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_delete_response > (schema) > (property) deleted>)
object: :"organization.project.service\_account.deleted"
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.service_accounts > (model) service_account_delete_response > (schema)>)
#### ProjectsAPI Keys
##### [List project API keys](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/api_keys/methods/list)
admin.organization.projects.api\_keys.list(project\_id, \*\*kwargs) -\> ConversationCursorPage\<[ProjectAPIKey](</api/reference/ruby/resources/admin#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema)>) { id, created\_at, last\_used\_at, 4 more } \>
GET/organization/projects/{project\_id}/api\_keys
##### [Retrieve project API key](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/api_keys/methods/retrieve)
admin.organization.projects.api\_keys.retrieve(key\_id, \*\*kwargs) -\> [ProjectAPIKey](</api/reference/ruby/resources/admin#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema)>) { id, created\_at, last\_used\_at, 4 more }
GET/organization/projects/{project\_id}/api\_keys/{key\_id}
##### [Delete project API key](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/api_keys/methods/delete)
admin.organization.projects.api\_keys.delete(key\_id, \*\*kwargs) -\> [APIKeyDeleteResponse](</api/reference/ruby/resources/admin#(resource) admin.organization.projects.api_keys > (model) api_key_delete_response > (schema)>) { id, deleted, object }
DELETE/organization/projects/{project\_id}/api\_keys/{key\_id}
##### ModelsExpand Collapse
class ProjectAPIKey { id, created\_at, last\_used\_at, 4 more }
Represents an individual API key in a project.
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) id>)
created\_at: Integer
The Unix timestamp (in seconds) of when the API key was created
formatunixtime
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) created_at>)
last\_used\_at: Integer
The Unix timestamp (in seconds) of when the API key was last used.
formatunixtime
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) last_used_at>)
name: String
The name of the API key
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) name>)
object: :"organization.project.api\_key"
The object type, which is always `organization.project.api\_key`
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) object>)
owner: Owner{ service\_account, type, user}
service\_account: [ProjectServiceAccount](</api/reference/ruby/resources/admin#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema)>) { id, created\_at, name, 2 more }
Represents an individual service account in a project.
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) service_account>)
type: :user | :service\_account
`user` or `service\_account`
One of the following:
:user
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) type > (member) 0>)
:service\_account
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) type > (member) 1>)
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) type>)
user: [ProjectUser](</api/reference/ruby/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>) { id, added\_at, email, 3 more }
Represents an individual user in a project.
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) user>)
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner>)
redacted\_value: String
The redacted value of the API key
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) redacted_value>)
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema)>)
class APIKeyDeleteResponse { id, deleted, object }
id: String
[](<#(resource) admin.organization.projects.api_keys > (model) api_key_delete_response > (schema) > (property) id>)
deleted: bool
[](<#(resource) admin.organization.projects.api_keys > (model) api_key_delete_response > (schema) > (property) deleted>)
object: :"organization.project.api\_key.deleted"
[](<#(resource) admin.organization.projects.api_keys > (model) api_key_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.api_keys > (model) api_key_delete_response > (schema)>)
#### ProjectsRate Limits
##### [List project rate limits](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/rate_limits/methods/list_rate_limits)
admin.organization.projects.rate\_limits.list\_rate\_limits(project\_id, \*\*kwargs) -\> ConversationCursorPage\<[ProjectRateLimit](</api/reference/ruby/resources/admin#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema)>) { id, max\_requests\_per\_1\_minute, max\_tokens\_per\_1\_minute, 6 more } \>
GET/organization/projects/{project\_id}/rate\_limits
##### [Modify project rate limit](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/rate_limits/methods/update_rate_limit)
admin.organization.projects.rate\_limits.update\_rate\_limit(rate\_limit\_id, \*\*kwargs) -\> [ProjectRateLimit](</api/reference/ruby/resources/admin#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema)>) { id, max\_requests\_per\_1\_minute, max\_tokens\_per\_1\_minute, 6 more }
POST/organization/projects/{project\_id}/rate\_limits/{rate\_limit\_id}
##### ModelsExpand Collapse
class ProjectRateLimit { id, max\_requests\_per\_1\_minute, max\_tokens\_per\_1\_minute, 6 more }
Represents a project rate limit config.
id: String
The identifier, which can be referenced in API endpoints.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) id>)
max\_requests\_per\_1\_minute: Integer
The maximum requests per minute.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_requests_per_1_minute>)
max\_tokens\_per\_1\_minute: Integer
The maximum tokens per minute.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_tokens_per_1_minute>)
model: String
The model this rate limit applies to.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) model>)
object: :"project.rate\_limit"
The object type, which is always `project.rate\_limit`
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) object>)
batch\_1\_day\_max\_input\_tokens: Integer
The maximum batch input tokens per day. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) batch_1_day_max_input_tokens>)
max\_audio\_megabytes\_per\_1\_minute: Integer
The maximum audio megabytes per minute. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_audio_megabytes_per_1_minute>)
max\_images\_per\_1\_minute: Integer
The maximum images per minute. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_images_per_1_minute>)
max\_requests\_per\_1\_day: Integer
The maximum requests per day. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_requests_per_1_day>)
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema)>)
#### ProjectsGroups
##### [List project groups](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/groups/methods/list)
admin.organization.projects.groups.list(project\_id, \*\*kwargs) -\> CursorPage\<[ProjectGroup](</api/reference/ruby/resources/admin#(resource) admin.organization.projects.groups > (model) project_group > (schema)>) { created\_at, group\_id, group\_name, 2 more } \>
GET/organization/projects/{project\_id}/groups
##### [Add project group](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/groups/methods/create)
admin.organization.projects.groups.create(project\_id, \*\*kwargs) -\> [ProjectGroup](</api/reference/ruby/resources/admin#(resource) admin.organization.projects.groups > (model) project_group > (schema)>) { created\_at, group\_id, group\_name, 2 more }
POST/organization/projects/{project\_id}/groups
##### [Remove project group](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/groups/methods/delete)
admin.organization.projects.groups.delete(group\_id, \*\*kwargs) -\> [GroupDeleteResponse](</api/reference/ruby/resources/admin#(resource) admin.organization.projects.groups > (model) group_delete_response > (schema)>) { deleted, object }
DELETE/organization/projects/{project\_id}/groups/{group\_id}
##### ModelsExpand Collapse
class ProjectGroup { created\_at, group\_id, group\_name, 2 more }
Details about a group’s membership in a project.
created\_at: Integer
Unix timestamp (in seconds) when the group was granted project access.
formatunixtime
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) created_at>)
group\_id: String
Identifier of the group that has access to the project.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) group_id>)
group\_name: String
Display name of the group.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) group_name>)
object: :"project.group"
Always `project.group`.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) object>)
project\_id: String
Identifier of the project.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) project_id>)
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema)>)
class GroupDeleteResponse { deleted, object }
Confirmation payload returned after removing a group from a project.
deleted: bool
Whether the group membership in the project was removed.
[](<#(resource) admin.organization.projects.groups > (model) group_delete_response > (schema) > (property) deleted>)
object: :"project.group.deleted"
Always `project.group.deleted`.
[](<#(resource) admin.organization.projects.groups > (model) group_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.groups > (model) group_delete_response > (schema)>)
#### ProjectsGroupsRoles
##### [List project group role assignments](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/groups/subresources/roles/methods/list)
admin.organization.projects.groups.roles.list(group\_id, \*\*kwargs) -\> CursorPage\<[RoleListResponse](</api/reference/ruby/resources/admin#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema)>) { id, created\_at, created\_by, 8 more } \>
GET/projects/{project\_id}/groups/{group\_id}/roles
##### [Assign project role to group](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/groups/subresources/roles/methods/create)
admin.organization.projects.groups.roles.create(group\_id, \*\*kwargs) -\> [RoleCreateResponse](</api/reference/ruby/resources/admin#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema)>) { group, object, role }
POST/projects/{project\_id}/groups/{group\_id}/roles
##### [Unassign project role from group](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/groups/subresources/roles/methods/delete)
admin.organization.projects.groups.roles.delete(role\_id, \*\*kwargs) -\> [RoleDeleteResponse](</api/reference/ruby/resources/admin#(resource) admin.organization.projects.groups.roles > (model) role_delete_response > (schema)>) { deleted, object }
DELETE/projects/{project\_id}/groups/{group\_id}/roles/{role\_id}
##### ModelsExpand Collapse
class RoleListResponse { id, created\_at, created\_by, 8 more }
Detailed information about a role assignment entry returned when listing assignments.
id: String
Identifier for the role.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) id>)
created\_at: Integer
When the role was created.
formatunixtime
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) created_at>)
created\_by: String
Identifier of the actor who created the role.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) created_by>)
created\_by\_user\_obj: Hash[Symbol, untyped]
User details for the actor that created the role, when available.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) created_by_user_obj>)
description: String
Description of the role.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) description>)
metadata: Hash[Symbol, untyped]
Arbitrary metadata stored on the role.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) metadata>)
name: String
Name of the role.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) name>)
permissions: Array[String]
Permissions associated with the role.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) permissions>)
predefined\_role: bool
Whether the role is predefined by OpenAI.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) predefined_role>)
resource\_type: String
Resource type the role applies to.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) resource_type>)
updated\_at: Integer
When the role was last updated.
formatint64
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema) > (property) updated_at>)
[](<#(resource) admin.organization.projects.groups.roles > (model) role_list_response > (schema)>)
class RoleCreateResponse { group, object, role }
Role assignment linking a group to a role.
group: Group{ id, created\_at, name, 2 more}
Summary information about a group returned in role assignment responses.
id: String
Identifier for the group.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema) > (property) group > (property) id>)
created\_at: Integer
Unix timestamp (in seconds) when the group was created.
formatunixtime
[](<#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema) > (property) group > (property) created_at>)
name: String
Display name of the group.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema) > (property) group > (property) name>)
object: :group
Always `group`.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema) > (property) group > (property) object>)
scim\_managed: bool
Whether the group is managed through SCIM.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema) > (property) group > (property) scim_managed>)
[](<#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema) > (property) group>)
object: :"group.role"
Always `group.role`.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema) > (property) object>)
role: [Role](</api/reference/ruby/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) { id, description, name, 4 more }
Details about a role that can be assigned through the public Roles API.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.groups.roles > (model) role_create_response > (schema)>)
class RoleDeleteResponse { deleted, object }
Confirmation payload returned after unassigning a role.
deleted: bool
Whether the assignment was removed.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_delete_response > (schema) > (property) deleted>)
object: String
Identifier for the deleted assignment, such as `group.role.deleted` or `user.role.deleted`.
[](<#(resource) admin.organization.projects.groups.roles > (model) role_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.groups.roles > (model) role_delete_response > (schema)>)
#### ProjectsRoles
##### [List project roles](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/list)
admin.organization.projects.roles.list(project\_id, \*\*kwargs) -\> CursorPage\<[Role](</api/reference/ruby/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) { id, description, name, 4 more } \>
GET/projects/{project\_id}/roles
##### [Create project role](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/create)
admin.organization.projects.roles.create(project\_id, \*\*kwargs) -\> [Role](</api/reference/ruby/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) { id, description, name, 4 more }
POST/projects/{project\_id}/roles
##### [Update project role](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/update)
admin.organization.projects.roles.update(role\_id, \*\*kwargs) -\> [Role](</api/reference/ruby/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) { id, description, name, 4 more }
POST/projects/{project\_id}/roles/{role\_id}
##### [Delete project role](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/roles/methods/delete)
admin.organization.projects.roles.delete(role\_id, \*\*kwargs) -\> [RoleDeleteResponse](</api/reference/ruby/resources/admin#(resource) admin.organization.projects.roles > (model) role_delete_response > (schema)>) { id, deleted, object }
DELETE/projects/{project\_id}/roles/{role\_id}
##### ModelsExpand Collapse
class RoleDeleteResponse { id, deleted, object }
Confirmation payload returned after deleting a role.
id: String
Identifier of the deleted role.
[](<#(resource) admin.organization.projects.roles > (model) role_delete_response > (schema) > (property) id>)
deleted: bool
Whether the role was deleted.
[](<#(resource) admin.organization.projects.roles > (model) role_delete_response > (schema) > (property) deleted>)
object: :"role.deleted"
Always `role.deleted`.
[](<#(resource) admin.organization.projects.roles > (model) role_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.roles > (model) role_delete_response > (schema)>)
#### ProjectsCertificates
##### [List project certificates](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/certificates/methods/list)
admin.organization.projects.certificates.list(project\_id, \*\*kwargs) -\> ConversationCursorPage\<[Certificate](</api/reference/ruby/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>) { id, certificate\_details, created\_at, 3 more } \>
GET/organization/projects/{project\_id}/certificates
##### [Activate certificates for project](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/certificates/methods/activate)
admin.organization.projects.certificates.activate(project\_id, \*\*kwargs) -\> Page\<[Certificate](</api/reference/ruby/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>) { id, certificate\_details, created\_at, 3 more } \>
POST/organization/projects/{project\_id}/certificates/activate
##### [Deactivate certificates for project](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/certificates/methods/deactivate)
admin.organization.projects.certificates.deactivate(project\_id, \*\*kwargs) -\> Page\<[Certificate](</api/reference/ruby/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>) { id, certificate\_details, created\_at, 3 more } \>
POST/organization/projects/{project\_id}/certificates/deactivate