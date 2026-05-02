Deactivate certificates for project | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Admin](/api/reference/ruby/resources/admin)
[Organization](/api/reference/ruby/resources/admin/subresources/organization)
[Projects](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects)
[Certificates](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/certificates)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Deactivate certificates for project
admin.organization.projects.certificates.deactivate(project\_id, \*\*kwargs) -\> Page\<[Certificate](</api/reference/ruby/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>) { id, certificate\_details, created\_at, 3 more } \>
POST/organization/projects/{project\_id}/certificates/deactivate
Deactivate certificates at the project level. You can atomically and
idempotently deactivate up to 10 certificates at a time.
##### ParametersExpand Collapse
project\_id: String
[](<#(resource) admin.organization.projects.certificates > (method) deactivate > (params) default > (param) project_id > (schema)>)
certificate\_ids: Array[String]
[](<#(resource) admin.organization.projects.certificates > (method) deactivate > (params) default > (param) certificate_ids > (schema)>)
##### ReturnsExpand Collapse
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
### Deactivate certificates for project
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
page = openai.admin.organization.projects.certificates.deactivate("project\_id", certificate\_ids: ["cert\_abc"])
puts(page)`
```
```
`{
"object": "organization.project.certificate.deactivation",
"data": [
{
"object": "organization.project.certificate",
"id": "cert\_abc",
"name": "My Example Certificate",
"active": false,
"created\_at": 1234567,
"certificate\_details": {
"valid\_at": 12345667,
"expires\_at": 12345678
}
},
{
"object": "organization.project.certificate",
"id": "cert\_def",
"name": "My Example Certificate 2",
"active": false,
"created\_at": 1234567,
"certificate\_details": {
"valid\_at": 12345667,
"expires\_at": 12345678
}
},
],
}
`
```
##### Returns Examples
```
`{
"object": "organization.project.certificate.deactivation",
"data": [
{
"object": "organization.project.certificate",
"id": "cert\_abc",
"name": "My Example Certificate",
"active": false,
"created\_at": 1234567,
"certificate\_details": {
"valid\_at": 12345667,
"expires\_at": 12345678
}
},
{
"object": "organization.project.certificate",
"id": "cert\_def",
"name": "My Example Certificate 2",
"active": false,
"created\_at": 1234567,
"certificate\_details": {
"valid\_at": 12345667,
"expires\_at": 12345678
}
},
],
}
`
```