Delete certificate | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Admin](/api/reference/python/resources/admin)
[Organization](/api/reference/python/resources/admin/subresources/organization)
[Certificates](/api/reference/python/resources/admin/subresources/organization/subresources/certificates)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete certificate
admin.organization.certificates.delete(strcertificate\_id) -\> [CertificateDeleteResponse](</api/reference/python/resources/admin#(resource) admin.organization.certificates > (model) certificate_delete_response > (schema)>)
DELETE/organization/certificates/{certificate\_id}
Delete a certificate from the organization.
The certificate must be inactive for the organization and all projects.
##### ParametersExpand Collapse
certificate\_id: str
[](<#(resource) admin.organization.certificates > (method) delete > (params) default > (param) certificate_id > (schema)>)
##### ReturnsExpand Collapse
class CertificateDeleteResponse: …
id: str
The ID of the certificate that was deleted.
[](<#(resource) admin.organization.certificates > (model) certificate_delete_response > (schema) > (property) id>)
object: Literal["certificate.deleted"]
The object type, must be `certificate.deleted`.
[](<#(resource) admin.organization.certificates > (model) certificate_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.certificates > (model) certificate_delete_response > (schema)>)
### Delete certificate
Python
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
`import os
from openai import OpenAI
client = OpenAI(
admin\_api\_key=os.environ.get("OPENAI\_ADMIN\_KEY"), # This is the default and can be omitted
)
certificate = client.admin.organization.certificates.delete(
"certificate\_id",
)
print(certificate.id)`
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