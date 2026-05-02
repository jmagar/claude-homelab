Retrieve project service account | OpenAI API Reference
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
# Retrieve project service account
[ProjectServiceAccount](</api/reference/java/resources/admin#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema)>) admin().organization().projects().serviceAccounts().retrieve(ServiceAccountRetrieveParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/projects/{project\_id}/service\_accounts/{service\_account\_id}
Retrieves a service account in the project.
##### ParametersExpand Collapse
ServiceAccountRetrieveParams params
String projectId
[](<#(resource) admin.organization.projects.service_accounts > (method) retrieve > (params) default > (param) project_id > (schema)>)
Optional\<String\> serviceAccountId
[](<#(resource) admin.organization.projects.service_accounts > (method) retrieve > (params) default > (param) service_account_id > (schema)>)
[](<#(resource) admin.organization.projects.service_accounts > (method) retrieve > (params) default>)
##### ReturnsExpand Collapse
class ProjectServiceAccount:
Represents an individual service account in a project.
String id
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) id>)
long createdAt
The Unix timestamp (in seconds) of when the service account was created
formatunixtime
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) created_at>)
String name
The name of the service account
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) name>)
JsonValue; object\_ "organization.project.service\_account"constant"organization.project.service\_account"constant
The object type, which is always `organization.project.service\_account`
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) object>)
Role role
`owner` or `member`
One of the following:
OWNER("owner")
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role > (member) 0>)
MEMBER("member")
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema)>)
### Retrieve project service account
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
import com.openai.models.admin.organization.projects.serviceaccounts.ProjectServiceAccount;
import com.openai.models.admin.organization.projects.serviceaccounts.ServiceAccountRetrieveParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
ServiceAccountRetrieveParams params = ServiceAccountRetrieveParams.builder()
.projectId("project\_id")
.serviceAccountId("service\_account\_id")
.build();
ProjectServiceAccount projectServiceAccount = client.admin().organization().projects().serviceAccounts().retrieve(params);
}
}`
```
```
`{
"object": "organization.project.service\_account",
"id": "svc\_acct\_abc",
"name": "Service Account",
"role": "owner",
"created\_at": 1711471533
}
`
```
##### Returns Examples
```
`{
"object": "organization.project.service\_account",
"id": "svc\_acct\_abc",
"name": "Service Account",
"role": "owner",
"created\_at": 1711471533
}
`
```