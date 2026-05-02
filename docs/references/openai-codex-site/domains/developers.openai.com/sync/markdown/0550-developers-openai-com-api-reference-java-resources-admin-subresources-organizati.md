Delete admin API key | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Admin](/api/reference/java/resources/admin)
[Organization](/api/reference/java/resources/admin/subresources/organization)
[Admin API Keys](/api/reference/java/resources/admin/subresources/organization/subresources/admin_api_keys)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete admin API key
[AdminApiKeyDeleteResponse](</api/reference/java/resources/admin#(resource) admin.organization.admin_api_keys > (model) AdminApiKeyDeleteResponse > (schema)>) admin().organization().adminApiKeys().delete(AdminApiKeyDeleteParamsparams = AdminApiKeyDeleteParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
DELETE/organization/admin\_api\_keys/{key\_id}
Delete an organization admin API key
##### ParametersExpand Collapse
AdminApiKeyDeleteParams params
Optional\<String\> keyId
The ID of the API key to be deleted.
[](<#(resource) admin.organization.admin_api_keys > (method) delete > (params) default > (param) key_id > (schema)>)
[](<#(resource) admin.organization.admin_api_keys > (method) delete > (params) default>)
##### ReturnsExpand Collapse
class AdminApiKeyDeleteResponse:
Optional\<String\> id
[](<#(resource) admin.organization.admin_api_keys > (model) AdminApiKeyDeleteResponse > (schema) > (property) id>)
Optional\<Boolean\> deleted
[](<#(resource) admin.organization.admin_api_keys > (model) AdminApiKeyDeleteResponse > (schema) > (property) deleted>)
Optional\<String\> object\_
[](<#(resource) admin.organization.admin_api_keys > (model) AdminApiKeyDeleteResponse > (schema) > (property) object>)
[](<#(resource) admin.organization.admin_api_keys > (model) AdminApiKeyDeleteResponse > (schema)>)
### Delete admin API key
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
import com.openai.models.admin.organization.adminapikeys.AdminApiKeyDeleteParams;
import com.openai.models.admin.organization.adminapikeys.AdminApiKeyDeleteResponse;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
AdminApiKeyDeleteResponse adminApiKey = client.admin().organization().adminApiKeys().delete("key\_id");
}
}`
```
```
`{
"id": "key\_abc",
"object": "organization.admin\_api\_key.deleted",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"id": "key\_abc",
"object": "organization.admin\_api\_key.deleted",
"deleted": true
}
`
```