Certificates | OpenAI API Reference
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
# Certificates
##### [List project certificates](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/certificates/methods/list)
CertificateListPage admin().organization().projects().certificates().list(CertificateListParamsparams = CertificateListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/projects/{project\_id}/certificates
##### [Activate certificates for project](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/certificates/methods/activate)
CertificateActivatePage admin().organization().projects().certificates().activate(CertificateActivateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/projects/{project\_id}/certificates/activate
##### [Deactivate certificates for project](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/certificates/methods/deactivate)
CertificateDeactivatePage admin().organization().projects().certificates().deactivate(CertificateDeactivateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/projects/{project\_id}/certificates/deactivate