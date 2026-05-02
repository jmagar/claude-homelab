Delete project API key | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Admin](/api/reference/java/resources/admin)
[Organization](/api/reference/java/resources/admin/subresources/organization)
[Projects](/api/reference/java/resources/admin/subresources/organization/subresources/projects)
[API Keys](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/api_keys)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete project API key
[ApiKeyDeleteResponse](</api/reference/java/resources/admin#(resource) admin.organization.projects.api_keys > (model) ApiKeyDeleteResponse > (schema)>) admin().organization().projects().apiKeys().delete(ApiKeyDeleteParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
DELETE/organization/projects/{project\_id}/api\_keys/{key\_id}
Deletes an API key from the project.
Returns confirmation of the key deletion, or an error if the key belonged to
a service account.
##### ParametersExpand Collapse
ApiKeyDeleteParams params
String projectId
[](<#(resource) admin.organization.projects.api_keys > (method) delete > (params) default > (param) project_id > (schema)>)
Optional\<String\> keyId
[](<#(resource) admin.organization.projects.api_keys > (method) delete > (params) default > (param) key_id > (schema)>)
[](<#(resource) admin.organization.projects.api_keys > (method) delete > (params) default>)
##### ReturnsExpand Collapse
class ApiKeyDeleteResponse:
String id
[](<#(resource) admin.organization.projects.api_keys > (model) ApiKeyDeleteResponse > (schema) > (property) id>)
boolean deleted
[](<#(resource) admin.organization.projects.api_keys > (model) ApiKeyDeleteResponse > (schema) > (property) deleted>)
JsonValue; object\_ "organization.project.api\_key.deleted"constant"organization.project.api\_key.deleted"constant
[](<#(resource) admin.organization.projects.api_keys > (model) ApiKeyDeleteResponse > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.api_keys > (model) ApiKeyDeleteResponse > (schema)>)
### Delete project API key
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
import com.openai.models.admin.organization.projects.apikeys.ApiKeyDeleteParams;
import com.openai.models.admin.organization.projects.apikeys.ApiKeyDeleteResponse;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
ApiKeyDeleteParams params = ApiKeyDeleteParams.builder()
.projectId("project\_id")
.keyId("key\_id")
.build();
ApiKeyDeleteResponse apiKey = client.admin().organization().projects().apiKeys().delete(params);
}
}`
```
```
`{
"object": "organization.project.api\_key.deleted",
"id": "key\_abc",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"object": "organization.project.api\_key.deleted",
"id": "key\_abc",
"deleted": true
}
`
```