Delete project service account | OpenAI API Reference
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
# Delete project service account
[ServiceAccountDeleteResponse](</api/reference/java/resources/admin#(resource) admin.organization.projects.service_accounts > (model) ServiceAccountDeleteResponse > (schema)>) admin().organization().projects().serviceAccounts().delete(ServiceAccountDeleteParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
DELETE/organization/projects/{project\_id}/service\_accounts/{service\_account\_id}
Deletes a service account from the project.
Returns confirmation of service account deletion, or an error if the project
is archived (archived projects have no service accounts).
##### ParametersExpand Collapse
ServiceAccountDeleteParams params
String projectId
[](<#(resource) admin.organization.projects.service_accounts > (method) delete > (params) default > (param) project_id > (schema)>)
Optional\<String\> serviceAccountId
[](<#(resource) admin.organization.projects.service_accounts > (method) delete > (params) default > (param) service_account_id > (schema)>)
[](<#(resource) admin.organization.projects.service_accounts > (method) delete > (params) default>)
##### ReturnsExpand Collapse
class ServiceAccountDeleteResponse:
String id
[](<#(resource) admin.organization.projects.service_accounts > (model) ServiceAccountDeleteResponse > (schema) > (property) id>)
boolean deleted
[](<#(resource) admin.organization.projects.service_accounts > (model) ServiceAccountDeleteResponse > (schema) > (property) deleted>)
JsonValue; object\_ "organization.project.service\_account.deleted"constant"organization.project.service\_account.deleted"constant
[](<#(resource) admin.organization.projects.service_accounts > (model) ServiceAccountDeleteResponse > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.service_accounts > (model) ServiceAccountDeleteResponse > (schema)>)
### Delete project service account
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
import com.openai.models.admin.organization.projects.serviceaccounts.ServiceAccountDeleteParams;
import com.openai.models.admin.organization.projects.serviceaccounts.ServiceAccountDeleteResponse;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
ServiceAccountDeleteParams params = ServiceAccountDeleteParams.builder()
.projectId("project\_id")
.serviceAccountId("service\_account\_id")
.build();
ServiceAccountDeleteResponse serviceAccount = client.admin().organization().projects().serviceAccounts().delete(params);
}
}`
```
```
`{
"object": "organization.project.service\_account.deleted",
"id": "svc\_acct\_abc",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"object": "organization.project.service\_account.deleted",
"id": "svc\_acct\_abc",
"deleted": true
}
`
```