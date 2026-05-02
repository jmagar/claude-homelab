Delete certificate | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Admin](/api/reference/typescript/resources/admin)
[Organization](/api/reference/typescript/resources/admin/subresources/organization)
[Certificates](/api/reference/typescript/resources/admin/subresources/organization/subresources/certificates)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete certificate
client.admin.organization.certificates.delete(stringcertificateID, RequestOptionsoptions?): [CertificateDeleteResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.certificates > (model) certificate_delete_response > (schema)>) { id, object }
DELETE/organization/certificates/{certificate\_id}
Delete a certificate from the organization.
The certificate must be inactive for the organization and all projects.
##### ParametersExpand Collapse
certificateID: string
[](<#(resource) admin.organization.certificates > (method) delete > (params) default > (param) certificate_id > (schema)>)
##### ReturnsExpand Collapse
CertificateDeleteResponse { id, object }
id: string
The ID of the certificate that was deleted.
[](<#(resource) admin.organization.certificates > (model) certificate_delete_response > (schema) > (property) id>)
object: "certificate.deleted"
The object type, must be `certificate.deleted`.
[](<#(resource) admin.organization.certificates > (model) certificate_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.certificates > (model) certificate_delete_response > (schema)>)
### Delete certificate
TypeScript
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
`import OpenAI from 'openai';
const client = new OpenAI({
adminAPIKey: process.env['OPENAI\_ADMIN\_KEY'], // This is the default and can be omitted
});
const certificate = await client.admin.organization.certificates.delete('certificate\_id');
console.log(certificate.id);`
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