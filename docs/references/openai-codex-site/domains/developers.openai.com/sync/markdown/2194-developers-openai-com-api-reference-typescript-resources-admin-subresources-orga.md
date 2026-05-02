Certificates | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Admin](/api/reference/typescript/resources/admin)
[Organization](/api/reference/typescript/resources/admin/subresources/organization)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Certificates
##### [List organization certificates](/api/reference/typescript/resources/admin/subresources/organization/subresources/certificates/methods/list)
client.admin.organization.certificates.list(CertificateListParams { after, limit, order } query?, RequestOptionsoptions?): ConversationCursorPage\<[Certificate](</api/reference/typescript/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>) { id, certificate\_details, created\_at, 3 more } \>
GET/organization/certificates
##### [Upload certificate](/api/reference/typescript/resources/admin/subresources/organization/subresources/certificates/methods/create)
client.admin.organization.certificates.create(CertificateCreateParams { content, name } body, RequestOptionsoptions?): [Certificate](</api/reference/typescript/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>) { id, certificate\_details, created\_at, 3 more }
POST/organization/certificates
##### [Get certificate](/api/reference/typescript/resources/admin/subresources/organization/subresources/certificates/methods/retrieve)
client.admin.organization.certificates.retrieve(stringcertificateID, CertificateRetrieveParams { include } query?, RequestOptionsoptions?): [Certificate](</api/reference/typescript/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>) { id, certificate\_details, created\_at, 3 more }
GET/organization/certificates/{certificate\_id}
##### [Modify certificate](/api/reference/typescript/resources/admin/subresources/organization/subresources/certificates/methods/update)
client.admin.organization.certificates.update(stringcertificateID, CertificateUpdateParams { name } body, RequestOptionsoptions?): [Certificate](</api/reference/typescript/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>) { id, certificate\_details, created\_at, 3 more }
POST/organization/certificates/{certificate\_id}
##### [Delete certificate](/api/reference/typescript/resources/admin/subresources/organization/subresources/certificates/methods/delete)
client.admin.organization.certificates.delete(stringcertificateID, RequestOptionsoptions?): [CertificateDeleteResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.certificates > (model) certificate_delete_response > (schema)>) { id, object }
DELETE/organization/certificates/{certificate\_id}
##### [Activate certificates for organization](/api/reference/typescript/resources/admin/subresources/organization/subresources/certificates/methods/activate)
client.admin.organization.certificates.activate(CertificateActivateParams { certificate\_ids } body, RequestOptionsoptions?): Page\<[Certificate](</api/reference/typescript/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>) { id, certificate\_details, created\_at, 3 more } \>
POST/organization/certificates/activate
##### [Deactivate certificates for organization](/api/reference/typescript/resources/admin/subresources/organization/subresources/certificates/methods/deactivate)
client.admin.organization.certificates.deactivate(CertificateDeactivateParams { certificate\_ids } body, RequestOptionsoptions?): Page\<[Certificate](</api/reference/typescript/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>) { id, certificate\_details, created\_at, 3 more } \>
POST/organization/certificates/deactivate
##### ModelsExpand Collapse
Certificate { id, certificate\_details, created\_at, 3 more }
Represents an individual `certificate` uploaded to the organization.
id: string
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) id>)
certificate\_details: CertificateDetails { content, expires\_at, valid\_at }
content?: string
The content of the certificate in PEM format.
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) certificate_details > (property) content>)
expires\_at?: number
The Unix timestamp (in seconds) of when the certificate expires.
formatunixtime
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) certificate_details > (property) expires_at>)
valid\_at?: number
The Unix timestamp (in seconds) of when the certificate becomes valid.
formatunixtime
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) certificate_details > (property) valid_at>)
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) certificate_details>)
created\_at: number
The Unix timestamp (in seconds) of when the certificate was uploaded.
formatunixtime
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) created_at>)
name: string
The name of the certificate.
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) name>)
object: "certificate" | "organization.certificate" | "organization.project.certificate"
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
active?: boolean
Whether the certificate is currently active at the specified scope. Not returned when getting details for a specific certificate.
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) active>)
[](<#(resource) admin.organization.certificates > (model) certificate > (schema)>)
CertificateDeleteResponse { id, object }
id: string
The ID of the certificate that was deleted.
[](<#(resource) admin.organization.certificates > (model) certificate_delete_response > (schema) > (property) id>)
object: "certificate.deleted"
The object type, must be `certificate.deleted`.
[](<#(resource) admin.organization.certificates > (model) certificate_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.certificates > (model) certificate_delete_response > (schema)>)