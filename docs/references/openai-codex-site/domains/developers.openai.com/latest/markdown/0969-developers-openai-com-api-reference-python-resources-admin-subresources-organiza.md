Activate certificates for project | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Admin](/api/reference/python/resources/admin)
[Organization](/api/reference/python/resources/admin/subresources/organization)
[Projects](/api/reference/python/resources/admin/subresources/organization/subresources/projects)
[Certificates](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/certificates)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Activate certificates for project
admin.organization.projects.certificates.activate(strproject\_id, CertificateActivateParams\*\*kwargs) -\> SyncPage[[Certificate](</api/reference/python/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>)]
POST/organization/projects/{project\_id}/certificates/activate
Activate certificates at the project level.
You can atomically and idempotently activate up to 10 certificates at a time.
##### ParametersExpand Collapse
project\_id: str
[](<#(resource) admin.organization.projects.certificates > (method) activate > (params) default > (param) project_id > (schema)>)
certificate\_ids: Sequence[str]
[](<#(resource) admin.organization.projects.certificates > (method) activate > (params) default > (param) certificate_ids > (schema)>)
##### ReturnsExpand Collapse
class Certificate: …
Represents an individual `certificate` uploaded to the organization.
id: str
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) id>)
certificate\_details: CertificateDetails
content: Optional[str]
The content of the certificate in PEM format.
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) certificate_details > (property) content>)
expires\_at: Optional[int]
The Unix timestamp (in seconds) of when the certificate expires.
formatunixtime
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) certificate_details > (property) expires_at>)
valid\_at: Optional[int]
The Unix timestamp (in seconds) of when the certificate becomes valid.
formatunixtime
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) certificate_details > (property) valid_at>)
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) certificate_details>)
created\_at: int
The Unix timestamp (in seconds) of when the certificate was uploaded.
formatunixtime
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) created_at>)
name: str
The name of the certificate.
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) name>)
object: Literal["certificate", "organization.certificate", "organization.project.certificate"]
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
active: Optional[bool]
Whether the certificate is currently active at the specified scope. Not returned when getting details for a specific certificate.
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) active>)
[](<#(resource) admin.organization.certificates > (model) certificate > (schema)>)
### Activate certificates for project
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
page = client.admin.organization.projects.certificates.activate(
project\_id="project\_id",
certificate\_ids=["cert\_abc"],
)
page = page.data[0]
print(page.id)`
```
```
`{
"object": "organization.project.certificate.activation",
"data": [
{
"object": "organization.project.certificate",
"id": "cert\_abc",
"name": "My Example Certificate",
"active": true,
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
"active": true,
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
"object": "organization.project.certificate.activation",
"data": [
{
"object": "organization.project.certificate",
"id": "cert\_abc",
"name": "My Example Certificate",
"active": true,
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
"active": true,
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