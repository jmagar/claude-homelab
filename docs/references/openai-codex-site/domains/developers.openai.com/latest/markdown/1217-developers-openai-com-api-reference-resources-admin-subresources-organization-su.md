Get certificate | OpenAI API Reference
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
# Get certificate
GET/organization/certificates/{certificate\_id}
Get a certificate that has been uploaded to the organization.
You can get a certificate regardless of whether it is active or not.
##### Path ParametersExpand Collapse
certificate\_id: string
[](<#(resource) admin.organization.certificates > (method) retrieve > (params) default > (param) certificate_id > (schema)>)
##### Query ParametersExpand Collapse
include: optional array of "content"
A list of additional fields to include in the response. Currently the only supported value is `content` to fetch the PEM content of the certificate.
[](<#(resource) admin.organization.certificates > (method) retrieve > (params) default > (param) include > (schema)>)
##### ReturnsExpand Collapse
Certificate object { id, certificate\_details, created\_at, 3 more }
Represents an individual `certificate` uploaded to the organization.
id: string
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) id>)
certificate\_details: object { content, expires\_at, valid\_at }
content: optional string
The content of the certificate in PEM format.
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) certificate_details > (property) content>)
expires\_at: optional number
The Unix timestamp (in seconds) of when the certificate expires.
formatunixtime
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) certificate_details > (property) expires_at>)
valid\_at: optional number
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
object: "certificate" or "organization.certificate" or "organization.project.certificate"
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
active: optional boolean
Whether the certificate is currently active at the specified scope. Not returned when getting details for a specific certificate.
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) active>)
[](<#(resource) admin.organization.certificates > (model) certificate > (schema)>)
### Get certificate
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
`curl "https://api.openai.com/v1/organization/certificates/cert\_abc?include[]=content" \\
-H "Authorization: Bearer $OPENAI\_ADMIN\_KEY"
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