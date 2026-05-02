Modify certificate | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Admin](/api/reference/java/resources/admin)
[Organization](/api/reference/java/resources/admin/subresources/organization)
[Certificates](/api/reference/java/resources/admin/subresources/organization/subresources/certificates)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Modify certificate
[Certificate](</api/reference/java/resources/admin#(resource) admin.organization.certificates > (model) certificate > (schema)>) admin().organization().certificates().update(CertificateUpdateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/certificates/{certificate\_id}
Modify a certificate. Note that only the name can be modified.
##### ParametersExpand Collapse
CertificateUpdateParams params
Optional\<String\> certificateId
[](<#(resource) admin.organization.certificates > (method) update > (params) default > (param) certificate_id > (schema)>)
String name
The updated name for the certificate
[](<#(resource) admin.organization.certificates > (method) update > (params) default > (param) body > (schema) > (property) name>)
[](<#(resource) admin.organization.certificates > (method) update > (params) default>)
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
### Modify certificate
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
import com.openai.models.admin.organization.certificates.Certificate;
import com.openai.models.admin.organization.certificates.CertificateUpdateParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
CertificateUpdateParams params = CertificateUpdateParams.builder()
.certificateId("certificate\_id")
.name("name")
.build();
Certificate certificate = client.admin().organization().certificates().update(params);
}
}`
```
```
`{
"object": "certificate",
"id": "cert\_abc",
"name": "Renamed Certificate",
"created\_at": 1234567,
"certificate\_details": {
"valid\_at": 12345667,
"expires\_at": 12345678
}
}
`
```
##### Returns Examples
```
`{
"object": "certificate",
"id": "cert\_abc",
"name": "Renamed Certificate",
"created\_at": 1234567,
"certificate\_details": {
"valid\_at": 12345667,
"expires\_at": 12345678
}
}
`
```