Create project service account | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Admin](/api/reference/java/resources/admin)
[Organization](/api/reference/java/resources/admin/subresources/organization)
[Projects](/api/reference/java/resources/admin/subresources/organization/subresources/projects)
[Service Accounts](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/service_accounts)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create project service account
[ServiceAccountCreateResponse](</api/reference/java/resources/admin#(resource) admin.organization.projects.service_accounts > (model) ServiceAccountCreateResponse > (schema)>) admin().organization().projects().serviceAccounts().create(ServiceAccountCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/projects/{project\_id}/service\_accounts
Creates a new service account in the project. This also returns an unredacted API key for the service account.
##### ParametersExpand Collapse
ServiceAccountCreateParams params
Optional\<String\> projectId
[](<#(resource) admin.organization.projects.service_accounts > (method) create > (params) default > (param) project_id > (schema)>)
String name
The name of the service account being created.
[](<#(resource) admin.organization.projects.service_accounts > (method) create > (params) default > (param) body > (schema) > (property) name>)
[](<#(resource) admin.organization.projects.service_accounts > (method) create > (params) default>)
##### ReturnsExpand Collapse
class ServiceAccountCreateResponse:
String id
[](<#(resource) admin.organization.projects.service_accounts > (model) ServiceAccountCreateResponse > (schema) > (property) id>)
ApiKey apiKey
String id
[](<#(resource) admin.organization.projects.service_accounts > (model) ServiceAccountCreateResponse > (schema) > (property) api_key > (property) id>)
long createdAt
formatunixtime
[](<#(resource) admin.organization.projects.service_accounts > (model) ServiceAccountCreateResponse > (schema) > (property) api_key > (property) created_at>)
String name
[](<#(resource) admin.organization.projects.service_accounts > (model) ServiceAccountCreateResponse > (schema) > (property) api_key > (property) name>)
JsonValue; object\_ "organization.project.service\_account.api\_key"constant"organization.project.service\_account.api\_key"constant
The object type, which is always `organization.project.service\_account.api\_key`
[](<#(resource) admin.organization.projects.service_accounts > (model) ServiceAccountCreateResponse > (schema) > (property) api_key > (property) object>)
String value
[](<#(resource) admin.organization.projects.service_accounts > (model) ServiceAccountCreateResponse > (schema) > (property) api_key > (property) value>)
[](<#(resource) admin.organization.projects.service_accounts > (model) ServiceAccountCreateResponse > (schema) > (property) api_key>)
long createdAt
formatunixtime
[](<#(resource) admin.organization.projects.service_accounts > (model) ServiceAccountCreateResponse > (schema) > (property) created_at>)
String name
[](<#(resource) admin.organization.projects.service_accounts > (model) ServiceAccountCreateResponse > (schema) > (property) name>)
JsonValue; object\_ "organization.project.service\_account"constant"organization.project.service\_account"constant
[](<#(resource) admin.organization.projects.service_accounts > (model) ServiceAccountCreateResponse > (schema) > (property) object>)
JsonValue; role "member"constant"member"constant
Service accounts can only have one role of type `member`
[](<#(resource) admin.organization.projects.service_accounts > (model) ServiceAccountCreateResponse > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.service_accounts > (model) ServiceAccountCreateResponse > (schema)>)
### Create project service account
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
import com.openai.models.admin.organization.projects.serviceaccounts.ServiceAccountCreateParams;
import com.openai.models.admin.organization.projects.serviceaccounts.ServiceAccountCreateResponse;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
ServiceAccountCreateParams params = ServiceAccountCreateParams.builder()
.projectId("project\_id")
.name("name")
.build();
ServiceAccountCreateResponse serviceAccount = client.admin().organization().projects().serviceAccounts().create(params);
}
}`
```
```
`{
"object": "organization.project.service\_account",
"id": "svc\_acct\_abc",
"name": "Production App",
"role": "member",
"created\_at": 1711471533,
"api\_key": {
"object": "organization.project.service\_account.api\_key",
"value": "sk-abcdefghijklmnop123",
"name": "Secret Key",
"created\_at": 1711471533,
"id": "key\_abc"
}
}
`
```
##### Returns Examples
```
`{
"object": "organization.project.service\_account",
"id": "svc\_acct\_abc",
"name": "Production App",
"role": "member",
"created\_at": 1711471533,
"api\_key": {
"object": "organization.project.service\_account.api\_key",
"value": "sk-abcdefghijklmnop123",
"name": "Secret Key",
"created\_at": 1711471533,
"id": "key\_abc"
}
}
`
```