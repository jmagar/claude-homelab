Certificates | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Admin](/api/reference/java/resources/admin)
[Organization](/api/reference/java/resources/admin/subresources/organization)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Certificates
##### [List organization certificates](/api/reference/java/resources/admin/subresources/organization/subresources/certificates/methods/list)
CertificateListPage admin().organization().certificates().list(CertificateListParamsparams = CertificateListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/certificates
##### [Upload certificate](/api/reference/java/resources/admin/subresources/organization/subresources/certificates/methods/create)
[Certificate](</api/reference/java/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>) admin().organization().certificates().create(CertificateCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/certificates
##### [Get certificate](/api/reference/java/resources/admin/subresources/organization/subresources/certificates/methods/retrieve)
[Certificate](</api/reference/java/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>) admin().organization().certificates().retrieve(CertificateRetrieveParamsparams = CertificateRetrieveParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/certificates/{certificate\_id}
##### [Modify certificate](/api/reference/java/resources/admin/subresources/organization/subresources/certificates/methods/update)
[Certificate](</api/reference/java/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>) admin().organization().certificates().update(CertificateUpdateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/certificates/{certificate\_id}
##### [Delete certificate](/api/reference/java/resources/admin/subresources/organization/subresources/certificates/methods/delete)
[CertificateDeleteResponse](</api/reference/java/resources/admin#(resource) admin.organization.certificates > (model) CertificateDeleteResponse > (schema)>) admin().organization().certificates().delete(CertificateDeleteParamsparams = CertificateDeleteParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
DELETE/organization/certificates/{certificate\_id}
##### [Activate certificates for organization](/api/reference/java/resources/admin/subresources/organization/subresources/certificates/methods/activate)
CertificateActivatePage admin().organization().certificates().activate(CertificateActivateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/certificates/activate
##### [Deactivate certificates for organization](/api/reference/java/resources/admin/subresources/organization/subresources/certificates/methods/deactivate)
CertificateDeactivatePage admin().organization().certificates().deactivate(CertificateDeactivateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/certificates/deactivate
##### ModelsExpand Collapse
class Certificate:
Represents an individual `certificate` uploaded to the organization.
String id
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) id>)
CertificateDetails certificateDetails
Optional\<String\> content
The content of the certificate in PEM format.
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) certificate_details > (property) content>)
Optional\<Long\> expiresAt
The Unix timestamp (in seconds) of when the certificate expires.
formatunixtime
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) certificate_details > (property) expires_at>)
Optional\<Long\> validAt
The Unix timestamp (in seconds) of when the certificate becomes valid.
formatunixtime
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) certificate_details > (property) valid_at>)
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) certificate_details>)
long createdAt
The Unix timestamp (in seconds) of when the certificate was uploaded.
formatunixtime
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) created_at>)
String name
The name of the certificate.
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) name>)
Object object\_
The object type.
* If creating, updating, or getting a specific certificate, the object type is `certificate`.
* If listing, activating, or deactivating certificates for the organization, the object type is `organization.certificate`.
* If listing, activating, or deactivating certificates for a project, the object type is `organization.project.certificate`.
One of the following:
CERTIFICATE("certificate")
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) object > (member) 0>)
ORGANIZATION\_CERTIFICATE("organization.certificate")
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) object > (member) 1>)
ORGANIZATION\_PROJECT\_CERTIFICATE("organization.project.certificate")
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) object > (member) 2>)
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) object>)
Optional\<Boolean\> active
Whether the certificate is currently active at the specified scope. Not returned when getting details for a specific certificate.
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) active>)
[](<#(resource) admin.organization.certificates > (model) certificate > (schema)>)