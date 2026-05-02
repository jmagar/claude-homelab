Certificates | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Admin](/api/reference/python/resources/admin)
[Organization](/api/reference/python/resources/admin/subresources/organization)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Certificates
##### [List organization certificates](/api/reference/python/resources/admin/subresources/organization/subresources/certificates/methods/list)
admin.organization.certificates.list(CertificateListParams\*\*kwargs) -\> SyncConversationCursorPage[[Certificate](</api/reference/python/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>)]
GET/organization/certificates
##### [Upload certificate](/api/reference/python/resources/admin/subresources/organization/subresources/certificates/methods/create)
admin.organization.certificates.create(CertificateCreateParams\*\*kwargs) -\> [Certificate](</api/reference/python/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>)
POST/organization/certificates
##### [Get certificate](/api/reference/python/resources/admin/subresources/organization/subresources/certificates/methods/retrieve)
admin.organization.certificates.retrieve(strcertificate\_id, CertificateRetrieveParams\*\*kwargs) -\> [Certificate](</api/reference/python/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>)
GET/organization/certificates/{certificate\_id}
##### [Modify certificate](/api/reference/python/resources/admin/subresources/organization/subresources/certificates/methods/update)
admin.organization.certificates.update(strcertificate\_id, CertificateUpdateParams\*\*kwargs) -\> [Certificate](</api/reference/python/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>)
POST/organization/certificates/{certificate\_id}
##### [Delete certificate](/api/reference/python/resources/admin/subresources/organization/subresources/certificates/methods/delete)
admin.organization.certificates.delete(strcertificate\_id) -\> [CertificateDeleteResponse](</api/reference/python/resources/admin#(resource) admin.organization.certificates > (model) certificate_delete_response > (schema)>)
DELETE/organization/certificates/{certificate\_id}
##### [Activate certificates for organization](/api/reference/python/resources/admin/subresources/organization/subresources/certificates/methods/activate)
admin.organization.certificates.activate(CertificateActivateParams\*\*kwargs) -\> SyncPage[[Certificate](</api/reference/python/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>)]
POST/organization/certificates/activate
##### [Deactivate certificates for organization](/api/reference/python/resources/admin/subresources/organization/subresources/certificates/methods/deactivate)
admin.organization.certificates.deactivate(CertificateDeactivateParams\*\*kwargs) -\> SyncPage[[Certificate](</api/reference/python/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>)]
POST/organization/certificates/deactivate
##### ModelsExpand Collapse
class Certificate: …
Represents an individual `certificate` uploaded to the organization.
id: str
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) id>)
certificate\_details: CertificateDetails
content: Optional[str]
The content of the certificate in PEM format.
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) certificate_details > (property) content>)
expires\_at: Optional[int]
The Unix timestamp (in seconds) of when the certificate expires.
formatunixtime
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) certificate_details > (property) expires_at>)
valid\_at: Optional[int]
The Unix timestamp (in seconds) of when the certificate becomes valid.
formatunixtime
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) certificate_details > (property) valid_at>)
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) certificate_details>)
created\_at: int
The Unix timestamp (in seconds) of when the certificate was uploaded.
formatunixtime
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) created_at>)
name: str
The name of the certificate.
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) name>)
object: Literal["certificate", "organization.certificate", "organization.project.certificate"]
The object type.
* If creating, updating, or getting a specific certificate, the object type is `certificate`.
* If listing, activating, or deactivating certificates for the organization, the object type is `organization.certificate`.
* If listing, activating, or deactivating certificates for a project, the object type is `organization.project.certificate`.
One of the following:
"certificate"
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) object > (member) 0>)
"organization.certificate"
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) object > (member) 1>)
"organization.project.certificate"
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) object > (member) 2>)
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) object>)
active: Optional[bool]
Whether the certificate is currently active at the specified scope. Not returned when getting details for a specific certificate.
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) active>)
[](<#(resource) admin.organization.certificates > (model) certificate > (schema)>)
class CertificateDeleteResponse: …
id: str
The ID of the certificate that was deleted.
[](<#(resource) admin.organization.certificates > (model) certificate_delete_response > (schema) > (property) id>)
object: Literal["certificate.deleted"]
The object type, must be `certificate.deleted`.
[](<#(resource) admin.organization.certificates > (model) certificate_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.certificates > (model) certificate_delete_response > (schema)>)