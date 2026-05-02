Service Accounts | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Admin](/api/reference/python/resources/admin)
[Organization](/api/reference/python/resources/admin/subresources/organization)
[Projects](/api/reference/python/resources/admin/subresources/organization/subresources/projects)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Service Accounts
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