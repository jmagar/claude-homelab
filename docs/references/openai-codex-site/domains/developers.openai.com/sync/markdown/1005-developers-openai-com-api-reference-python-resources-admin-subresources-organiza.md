Certificates | OpenAI API Reference
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
# Certificates
##### [List project certificates](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/certificates/methods/list)
admin.organization.projects.certificates.list(strproject\_id, CertificateListParams\*\*kwargs) -\> SyncConversationCursorPage[[Certificate](</api/reference/python/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>)]
GET/organization/projects/{project\_id}/certificates
##### [Activate certificates for project](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/certificates/methods/activate)
admin.organization.projects.certificates.activate(strproject\_id, CertificateActivateParams\*\*kwargs) -\> SyncPage[[Certificate](</api/reference/python/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>)]
POST/organization/projects/{project\_id}/certificates/activate
##### [Deactivate certificates for project](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/certificates/methods/deactivate)
admin.organization.projects.certificates.deactivate(strproject\_id, CertificateDeactivateParams\*\*kwargs) -\> SyncPage[[Certificate](</api/reference/python/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>)]
POST/organization/projects/{project\_id}/certificates/deactivate