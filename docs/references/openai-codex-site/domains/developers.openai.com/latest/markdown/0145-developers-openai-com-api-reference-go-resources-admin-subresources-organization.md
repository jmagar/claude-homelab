Delete certificate | OpenAI API Reference
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
# Delete certificate
client.Admin.Organization.Certificates.Delete(ctx, certificateID) (\*[AdminOrganizationCertificateDeleteResponse](</api/reference/go/resources/admin#(resource) admin.organization.certificates > (model) AdminOrganizationCertificateDeleteResponse > (schema)>), error)
DELETE/organization/certificates/{certificate\_id}
Delete a certificate from the organization.
The certificate must be inactive for the organization and all projects.
##### ParametersExpand Collapse
certificateID string
[](<#(resource) admin.organization.certificates > (method) delete > (params) default > (param) certificate_id > (schema)>)
##### ReturnsExpand Collapse
type AdminOrganizationCertificateDeleteResponse struct{…}
ID string
The ID of the certificate that was deleted.
[](<#(resource) admin.organization.certificates > (model) AdminOrganizationCertificateDeleteResponse > (schema) > (property) id>)
Object CertificateDeleted
The object type, must be `certificate.deleted`.
[](<#(resource) admin.organization.certificates > (model) AdminOrganizationCertificateDeleteResponse > (schema) > (property) object>)
[](<#(resource) admin.organization.certificates > (model) AdminOrganizationCertificateDeleteResponse > (schema)>)
### Delete certificate
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
certificate, err := client.Admin.Organization.Certificates.Delete(context.TODO(), "certificate\_id")
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", certificate.ID)
}
`
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