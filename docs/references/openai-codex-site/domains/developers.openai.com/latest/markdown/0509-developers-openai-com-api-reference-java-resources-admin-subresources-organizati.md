List project service accounts | OpenAI API Reference
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
# List project service accounts
ServiceAccountListPage admin().organization().projects().serviceAccounts().list(ServiceAccountListParamsparams = ServiceAccountListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/projects/{project\_id}/service\_accounts
Returns a list of service accounts in the project.
##### ParametersExpand Collapse
ServiceAccountListParams params
Optional\<String\> projectId
[](<#(resource) admin.organization.projects.service_accounts > (method) list > (params) default > (param) project_id > (schema)>)
Optional\<String\> after
A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj\_foo, your subsequent call can include after=obj\_foo in order to fetch the next page of the list.
[](<#(resource) admin.organization.projects.service_accounts > (method) list > (params) default > (param) after > (schema)>)
Optional\<Long\> limit
A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
[](<#(resource) admin.organization.projects.service_accounts > (method) list > (params) default > (param) limit > (schema)>)
[](<#(resource) admin.organization.projects.service_accounts > (method) list > (params) default>)
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
### List project service accounts
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
import com.openai.models.admin.organization.projects.serviceaccounts.ServiceAccountListPage;
import com.openai.models.admin.organization.projects.serviceaccounts.ServiceAccountListParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
ServiceAccountListPage page = client.admin().organization().projects().serviceAccounts().list("project\_id");
}
}`
```
```
`{
"object": "list",
"data": [
{
"object": "organization.project.service\_account",
"id": "svc\_acct\_abc",
"name": "Service Account",
"role": "owner",
"created\_at": 1711471533
}
],
"first\_id": "svc\_acct\_abc",
"last\_id": "svc\_acct\_xyz",
"has\_more": false
}
`
```
##### Returns Examples
```
`{
"object": "list",
"data": [
{
"object": "organization.project.service\_account",
"id": "svc\_acct\_abc",
"name": "Service Account",
"role": "owner",
"created\_at": 1711471533
}
],
"first\_id": "svc\_acct\_abc",
"last\_id": "svc\_acct\_xyz",
"has\_more": false
}
`
```