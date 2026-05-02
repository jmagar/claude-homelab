Certificates | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Admin](/api/reference/ruby/resources/admin)
[Organization](/api/reference/ruby/resources/admin/subresources/organization)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Certificates
##### [List organization certificates](/api/reference/ruby/resources/admin/subresources/organization/subresources/certificates/methods/list)
admin.organization.certificates.list(\*\*kwargs) -\> ConversationCursorPage\<[Certificate](</api/reference/ruby/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>) { id, certificate\_details, created\_at, 3 more } \>
GET/organization/certificates
##### [Upload certificate](/api/reference/ruby/resources/admin/subresources/organization/subresources/certificates/methods/create)
admin.organization.certificates.create(\*\*kwargs) -\> [Certificate](</api/reference/ruby/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>) { id, certificate\_details, created\_at, 3 more }
POST/organization/certificates
##### [Get certificate](/api/reference/ruby/resources/admin/subresources/organization/subresources/certificates/methods/retrieve)
admin.organization.certificates.retrieve(certificate\_id, \*\*kwargs) -\> [Certificate](</api/reference/ruby/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>) { id, certificate\_details, created\_at, 3 more }
GET/organization/certificates/{certificate\_id}
##### [Modify certificate](/api/reference/ruby/resources/admin/subresources/organization/subresources/certificates/methods/update)
admin.organization.certificates.update(certificate\_id, \*\*kwargs) -\> [Certificate](</api/reference/ruby/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>) { id, certificate\_details, created\_at, 3 more }
POST/organization/certificates/{certificate\_id}
##### [Delete certificate](/api/reference/ruby/resources/admin/subresources/organization/subresources/certificates/methods/delete)
admin.organization.certificates.delete(certificate\_id) -\> [CertificateDeleteResponse](</api/reference/ruby/resources/admin#(resource) admin.organization.certificates > (model) certificate_delete_response > (schema)>) { id, object }
DELETE/organization/certificates/{certificate\_id}
##### [Activate certificates for organization](/api/reference/ruby/resources/admin/subresources/organization/subresources/certificates/methods/activate)
admin.organization.certificates.activate(\*\*kwargs) -\> Page\<[Certificate](</api/reference/ruby/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>) { id, certificate\_details, created\_at, 3 more } \>
POST/organization/certificates/activate
##### [Deactivate certificates for organization](/api/reference/ruby/resources/admin/subresources/organization/subresources/certificates/methods/deactivate)
admin.organization.certificates.deactivate(\*\*kwargs) -\> Page\<[Certificate](</api/reference/ruby/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>) { id, certificate\_details, created\_at, 3 more } \>
POST/organization/certificates/deactivate
##### ModelsExpand Collapse
class Certificate { id, certificate\_details, created\_at, 3 more }
Represents an individual `certificate` uploaded to the organization.
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) id>)
certificate\_details: CertificateDetails{ content, expires\_at, valid\_at}
content: String
The content of the certificate in PEM format.
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) certificate_details > (property) content>)
expires\_at: Integer
The Unix timestamp (in seconds) of when the certificate expires.
formatunixtime
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) certificate_details > (property) expires_at>)
valid\_at: Integer
The Unix timestamp (in seconds) of when the certificate becomes valid.
formatunixtime
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) certificate_details > (property) valid_at>)
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) certificate_details>)
created\_at: Integer
The Unix timestamp (in seconds) of when the certificate was uploaded.
formatunixtime
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) created_at>)
name: String
The name of the certificate.
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) name>)
object: :certificate | :"organization.certificate" | :"organization.project.certificate"
The object type.
* If creating, updating, or getting a specific certificate, the object type is `certificate`.
* If listing, activating, or deactivating certificates for the organization, the object type is `organization.certificate`.
* If listing, activating, or deactivating certificates for a project, the object type is `organization.project.certificate`.
One of the following:
:certificate
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) object > (member) 0>)
:"organization.certificate"
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) object > (member) 1>)
:"organization.project.certificate"
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) object > (member) 2>)
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) object>)
active: bool
Whether the certificate is currently active at the specified scope. Not returned when getting details for a specific certificate.
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) active>)
[](<#(resource) admin.organization.certificates > (model) certificate > (schema)>)
class CertificateDeleteResponse { id, object }
id: String
The ID of the certificate that was deleted.
[](<#(resource) admin.organization.certificates > (model) certificate_delete_response > (schema) > (property) id>)
object: :"certificate.deleted"
The object type, must be `certificate.deleted`.
[](<#(resource) admin.organization.certificates > (model) certificate_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.certificates > (model) certificate_delete_response > (schema)>)