API Keys | OpenAI API Reference
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
# API Keys
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