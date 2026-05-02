API Keys | OpenAI API Reference
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
# API Keys
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