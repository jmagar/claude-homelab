API Keys | OpenAI API Reference
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
# API Keys
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