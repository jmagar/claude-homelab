API Keys | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Admin](/api/reference/go/resources/admin)
[Organization](/api/reference/go/resources/admin/subresources/organization)
[Projects](/api/reference/go/resources/admin/subresources/organization/subresources/projects)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# API Keys
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