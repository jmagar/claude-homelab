Certificates | OpenAI API Reference
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
# Certificates
##### [List project certificates](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/certificates/methods/list)
client.admin.organization.projects.certificates.list(stringprojectID, CertificateListParams { after, limit, order } query?, RequestOptionsoptions?): ConversationCursorPage\<[Certificate](</api/reference/typescript/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>) { id, certificate\_details, created\_at, 3 more } \>
GET/organization/projects/{project\_id}/certificates
##### [Activate certificates for project](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/certificates/methods/activate)
client.admin.organization.projects.certificates.activate(stringprojectID, CertificateActivateParams { certificate\_ids } body, RequestOptionsoptions?): Page\<[Certificate](</api/reference/typescript/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>) { id, certificate\_details, created\_at, 3 more } \>
POST/organization/projects/{project\_id}/certificates/activate
##### [Deactivate certificates for project](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/certificates/methods/deactivate)
client.admin.organization.projects.certificates.deactivate(stringprojectID, CertificateDeactivateParams { certificate\_ids } body, RequestOptionsoptions?): Page\<[Certificate](</api/reference/typescript/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>) { id, certificate\_details, created\_at, 3 more } \>
POST/organization/projects/{project\_id}/certificates/deactivate