Delete certificate | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Admin](/api/reference/resources/admin)
[Organization](/api/reference/resources/admin/subresources/organization)
[Certificates](/api/reference/resources/admin/subresources/organization/subresources/certificates)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete certificate
DELETE/organization/certificates/{certificate\_id}
Delete a certificate from the organization.
The certificate must be inactive for the organization and all projects.
##### Path ParametersExpand Collapse
certificate\_id: string
[](<#(resource) admin.organization.certificates > (method) delete > (params) default > (param) certificate_id > (schema)>)
##### ReturnsExpand Collapse
id: string
The ID of the certificate that was deleted.
[](<#(resource) admin.organization.certificates > (model) certificate_delete_response > (schema) > (property) id>)
object: "certificate.deleted"
The object type, must be `certificate.deleted`.
[](<#(resource) admin.organization.certificates > (model) certificate_delete_response > (schema) > (property) object>)
### Delete certificate
HTTP
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
`curl -X DELETE https://api.openai.com/v1/organization/certificates/cert\_abc \\
-H "Authorization: Bearer $OPENAI\_ADMIN\_KEY"
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