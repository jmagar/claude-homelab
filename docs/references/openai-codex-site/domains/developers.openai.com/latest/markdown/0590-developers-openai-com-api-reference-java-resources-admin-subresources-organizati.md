Service Accounts | OpenAI API Reference
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
# Service Accounts
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