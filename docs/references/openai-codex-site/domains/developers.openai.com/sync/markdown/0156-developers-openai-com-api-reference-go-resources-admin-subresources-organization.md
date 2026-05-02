Get certificate | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Admin](/api/reference/go/resources/admin)
[Organization](/api/reference/go/resources/admin/subresources/organization)
[Certificates](/api/reference/go/resources/admin/subresources/organization/subresources/certificates)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Get certificate
client.Admin.Organization.Certificates.Get(ctx, certificateID, query) (\*[Certificate](</api/reference/go/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>), error)
GET/organization/certificates/{certificate\_id}
Get a certificate that has been uploaded to the organization.
You can get a certificate regardless of whether it is active or not.
##### ParametersExpand Collapse
certificateID string
[](<#(resource) admin.organization.certificates > (method) retrieve > (params) default > (param) certificate_id > (schema)>)
query AdminOrganizationCertificateGetParams
Include param.Field[[]string]Optional
A list of additional fields to include in the response. Currently the only supported value is `content` to fetch the PEM content of the certificate.
const AdminOrganizationCertificateGetParamsIncludeContent AdminOrganizationCertificateGetParamsInclude = "content"
[](<#(resource) admin.organization.certificates > (method) retrieve > (params) default > (param) include > (schema) > (items) > (member) 0>)
[](<#(resource) admin.organization.certificates > (method) retrieve > (params) default > (param) include>)
[](<#(resource) admin.organization.certificates > (method) retrieve > (params) default>)
##### ReturnsExpand Collapse
type Certificate struct{…}
Represents an individual `certificate` uploaded to the organization.
ID string
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) id>)
CertificateDetails CertificateCertificateDetails
Content stringOptional
The content of the certificate in PEM format.
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) certificate_details > (property) content>)
ExpiresAt int64Optional
The Unix timestamp (in seconds) of when the certificate expires.
formatunixtime
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) certificate_details > (property) expires_at>)
ValidAt int64Optional
The Unix timestamp (in seconds) of when the certificate becomes valid.
formatunixtime
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) certificate_details > (property) valid_at>)
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) certificate_details>)
CreatedAt int64
The Unix timestamp (in seconds) of when the certificate was uploaded.
formatunixtime
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) created_at>)
Name string
The name of the certificate.
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) name>)
Object CertificateObject
The object type.
* If creating, updating, or getting a specific certificate, the object type is `certificate`.
* If listing, activating, or deactivating certificates for the organization, the object type is `organization.certificate`.
* If listing, activating, or deactivating certificates for a project, the object type is `organization.project.certificate`.
One of the following:
const CertificateObjectCertificate CertificateObject = "certificate"
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) object > (member) 0>)
const CertificateObjectOrganizationCertificate CertificateObject = "organization.certificate"
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) object > (member) 1>)
const CertificateObjectOrganizationProjectCertificate CertificateObject = "organization.project.certificate"
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) object > (member) 2>)
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) object>)
Active boolOptional
Whether the certificate is currently active at the specified scope. Not returned when getting details for a specific certificate.
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) active>)
[](<#(resource) admin.organization.certificates > (model) certificate > (schema)>)
### Get certificate
Go
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
`package main
import (
"context"
"fmt"
"github.com/openai/openai-go"
"github.com/openai/openai-go/option"
)
func main() {
client := openai.NewClient(
option.WithAdminAPIKey("My Admin API Key"),
)
certificate, err := client.Admin.Organization.Certificates.Get(
context.TODO(),
"certificate\_id",
openai.AdminOrganizationCertificateGetParams{
},
)
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", certificate.ID)
}
`
```
```
`{
"object": "certificate",
"id": "cert\_abc",
"name": "My Example Certificate",
"created\_at": 1234567,
"certificate\_details": {
"valid\_at": 1234567,
"expires\_at": 12345678,
"content": "-----BEGIN CERTIFICATE-----MIIDeT...-----END CERTIFICATE-----"
}
}
`
```
##### Returns Examples
```
`{
"object": "certificate",
"id": "cert\_abc",
"name": "My Example Certificate",
"created\_at": 1234567,
"certificate\_details": {
"valid\_at": 1234567,
"expires\_at": 12345678,
"content": "-----BEGIN CERTIFICATE-----MIIDeT...-----END CERTIFICATE-----"
}
}
`
```