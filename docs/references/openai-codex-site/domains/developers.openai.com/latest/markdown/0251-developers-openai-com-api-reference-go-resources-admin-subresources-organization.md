Service Accounts | OpenAI API Reference
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
# Service Accounts
##### [List project service accounts](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/service_accounts/methods/list)
client.Admin.Organization.Projects.ServiceAccounts.List(ctx, projectID, query) (\*ConversationCursorPage[[ProjectServiceAccount](</api/reference/go/resources/admin#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema)>)], error)
GET/organization/projects/{project\_id}/service\_accounts
##### [Create project service account](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/service_accounts/methods/create)
client.Admin.Organization.Projects.ServiceAccounts.New(ctx, projectID, body) (\*[AdminOrganizationProjectServiceAccountNewResponse](</api/reference/go/resources/admin#(resource) admin.organization.projects.service_accounts > (model) AdminOrganizationProjectServiceAccountNewResponse > (schema)>), error)
POST/organization/projects/{project\_id}/service\_accounts
##### [Retrieve project service account](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/service_accounts/methods/retrieve)
client.Admin.Organization.Projects.ServiceAccounts.Get(ctx, projectID, serviceAccountID) (\*[ProjectServiceAccount](</api/reference/go/resources/admin#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema)>), error)
GET/organization/projects/{project\_id}/service\_accounts/{service\_account\_id}
##### [Delete project service account](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/service_accounts/methods/delete)
client.Admin.Organization.Projects.ServiceAccounts.Delete(ctx, projectID, serviceAccountID) (\*[AdminOrganizationProjectServiceAccountDeleteResponse](</api/reference/go/resources/admin#(resource) admin.organization.projects.service_accounts > (model) AdminOrganizationProjectServiceAccountDeleteResponse > (schema)>), error)
DELETE/organization/projects/{project\_id}/service\_accounts/{service\_account\_id}
##### ModelsExpand Collapse
type ProjectServiceAccount struct{…}
Represents an individual service account in a project.
ID string
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) id>)
CreatedAt int64
The Unix timestamp (in seconds) of when the service account was created
formatunixtime
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) created_at>)
Name string
The name of the service account
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) name>)
Object OrganizationProjectServiceAccount
The object type, which is always `organization.project.service\_account`
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) object>)
Role ProjectServiceAccountRole
`owner` or `member`
One of the following:
const ProjectServiceAccountRoleOwner ProjectServiceAccountRole = "owner"
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role > (member) 0>)
const ProjectServiceAccountRoleMember ProjectServiceAccountRole = "member"
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema)>)