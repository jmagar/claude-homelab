Delete certificate | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Admin](/api/reference/ruby/resources/admin)
[Organization](/api/reference/ruby/resources/admin/subresources/organization)
[Certificates](/api/reference/ruby/resources/admin/subresources/organization/subresources/certificates)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete certificate
admin.organization.certificates.delete(certificate\_id) -\> [CertificateDeleteResponse](</api/reference/ruby/resources/admin#(resource) admin.organization.certificates > (model) certificate_delete_response > (schema)>) { id, object }
DELETE/organization/certificates/{certificate\_id}
Delete a certificate from the organization.
The certificate must be inactive for the organization and all projects.
##### ParametersExpand Collapse
certificate\_id: String
[](<#(resource) admin.organization.certificates > (method) delete > (params) default > (param) certificate_id > (schema)>)
##### ReturnsExpand Collapse
class CertificateDeleteResponse { id, object }
id: String
The ID of the certificate that was deleted.
[](<#(resource) admin.organization.certificates > (model) certificate_delete_response > (schema) > (property) id>)
object: :"certificate.deleted"
The object type, must be `certificate.deleted`.
[](<#(resource) admin.organization.certificates > (model) certificate_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.certificates > (model) certificate_delete_response > (schema)>)
### Delete certificate
Ruby
HTTP
HTTP
TypeScript
TypeScript
Python
Python
Java
Java
Go
Go
Ruby
Ruby
Terraform
Terraform
```
`require "openai"
openai = OpenAI::Client.new(admin\_api\_key: "My Admin API Key")
certificate = openai.admin.organization.certificates.delete("certificate\_id")
puts(certificate)`
```
```
`{
"object": "certificate.deleted",
"id": "cert\_abc"
}
`
```
##### Returns Examples
```
`{
"object": "certificate.deleted",
"id": "cert\_abc"
}
`
```