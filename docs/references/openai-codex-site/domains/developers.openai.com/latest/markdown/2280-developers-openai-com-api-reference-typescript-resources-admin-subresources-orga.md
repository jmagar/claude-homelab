Service Accounts | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Admin](/api/reference/typescript/resources/admin)
[Organization](/api/reference/typescript/resources/admin/subresources/organization)
[Projects](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Service Accounts
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