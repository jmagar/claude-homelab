Activate certificates for project | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Admin](/api/reference/java/resources/admin)
[Organization](/api/reference/java/resources/admin/subresources/organization)
[Projects](/api/reference/java/resources/admin/subresources/organization/subresources/projects)
[Certificates](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/certificates)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Activate certificates for project
CertificateActivatePage admin().organization().projects().certificates().activate(CertificateActivateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/projects/{project\_id}/certificates/activate
Activate certificates at the project level.
You can atomically and idempotently activate up to 10 certificates at a time.
##### ParametersExpand Collapse
CertificateActivateParams params
Optional\<String\> projectId
[](<#(resource) admin.organization.projects.certificates > (method) activate > (params) default > (param) project_id > (schema)>)
List\<String\> certificateIds
[](<#(resource) admin.organization.projects.certificates > (method) activate > (params) default > (param) body > (schema) > (property) certificate_ids>)
[](<#(resource) admin.organization.projects.certificates > (method) activate > (params) default>)
##### ReturnsExpand Collapse
class Certificate:
Represents an individual `certificate` uploaded to the organization.
String id
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) id>)
CertificateDetails certificateDetails
Optional\<String\> content
The content of the certificate in PEM format.
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) certificate_details > (property) content>)
Optional\<Long\> expiresAt
The Unix timestamp (in seconds) of when the certificate expires.
formatunixtime
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) certificate_details > (property) expires_at>)
Optional\<Long\> validAt
The Unix timestamp (in seconds) of when the certificate becomes valid.
formatunixtime
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) certificate_details > (property) valid_at>)
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) certificate_details>)
long createdAt
The Unix timestamp (in seconds) of when the certificate was uploaded.
formatunixtime
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) created_at>)
String name
The name of the certificate.
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) name>)
Object object\_
The object type.
* If creating, updating, or getting a specific certificate, the object type is `certificate`.
* If listing, activating, or deactivating certificates for the organization, the object type is `organization.certificate`.
* If listing, activating, or deactivating certificates for a project, the object type is `organization.project.certificate`.
One of the following:
CERTIFICATE("certificate")
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) object > (member) 0>)
ORGANIZATION\_CERTIFICATE("organization.certificate")
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) object > (member) 1>)
ORGANIZATION\_PROJECT\_CERTIFICATE("organization.project.certificate")
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) object > (member) 2>)
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) object>)
Optional\<Boolean\> active
Whether the certificate is currently active at the specified scope. Not returned when getting details for a specific certificate.
[](<#(resource) admin.organization.certificates > (model) certificate > (schema) > (property) active>)
[](<#(resource) admin.organization.certificates > (model) certificate > (schema)>)
### Activate certificates for project
Java
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
`package com.openai.example;
import com.openai.client.OpenAIClient;
import com.openai.client.okhttp.OpenAIOkHttpClient;
import com.openai.models.admin.organization.projects.certificates.CertificateActivatePage;
import com.openai.models.admin.organization.projects.certificates.CertificateActivateParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
CertificateActivateParams params = CertificateActivateParams.builder()
.projectId("project\_id")
.addCertificateId("cert\_abc")
.build();
CertificateActivatePage page = client.admin().organization().projects().certificates().activate(params);
}
}`
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