Delete certificate | OpenAI API Reference
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
# Delete certificate
[CertificateDeleteResponse](</api/reference/java/resources/admin#(resource) admin.organization.certificates > (model) CertificateDeleteResponse > (schema)>) admin().organization().certificates().delete(CertificateDeleteParamsparams = CertificateDeleteParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
DELETE/organization/certificates/{certificate\_id}
Delete a certificate from the organization.
The certificate must be inactive for the organization and all projects.
##### ParametersExpand Collapse
CertificateDeleteParams params
Optional\<String\> certificateId
[](<#(resource) admin.organization.certificates > (method) delete > (params) default > (param) certificate_id > (schema)>)
[](<#(resource) admin.organization.certificates > (method) delete > (params) default>)
##### ReturnsExpand Collapse
class CertificateDeleteResponse:
String id
The ID of the certificate that was deleted.
[](<#(resource) admin.organization.certificates > (model) CertificateDeleteResponse > (schema) > (property) id>)
JsonValue; object\_ "certificate.deleted"constant"certificate.deleted"constant
The object type, must be `certificate.deleted`.
[](<#(resource) admin.organization.certificates > (model) CertificateDeleteResponse > (schema) > (property) object>)
[](<#(resource) admin.organization.certificates > (model) CertificateDeleteResponse > (schema)>)
### Delete certificate
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
import com.openai.models.admin.organization.certificates.CertificateDeleteParams;
import com.openai.models.admin.organization.certificates.CertificateDeleteResponse;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
CertificateDeleteResponse certificate = client.admin().organization().certificates().delete("certificate\_id");
}
}`
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