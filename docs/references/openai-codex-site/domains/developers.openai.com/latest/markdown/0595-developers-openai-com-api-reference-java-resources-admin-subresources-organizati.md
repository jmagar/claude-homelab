Create admin API key | OpenAI API Reference
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
# Create admin API key
[AdminApiKey](</api/reference/java/resources/admin#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema)>) admin().organization().adminApiKeys().create(AdminApiKeyCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/admin\_api\_keys
Create an organization admin API key
##### ParametersExpand Collapse
AdminApiKeyCreateParams params
String name
[](<#(resource) admin.organization.admin_api_keys > (method) create > (params) default > (param) body > (schema) > (property) name>)
[](<#(resource) admin.organization.admin_api_keys > (method) create > (params) default>)
##### ReturnsExpand Collapse
class AdminApiKey:
Represents an individual Admin API key in an org.
String id
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) id>)
long createdAt
The Unix timestamp (in seconds) of when the API key was created
formatunixtime
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) created_at>)
Optional\<Long\> lastUsedAt
The Unix timestamp (in seconds) of when the API key was last used
formatunixtime
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) last_used_at>)
String name
The name of the API key
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) name>)
String object\_
The object type, which is always `organization.admin\_api\_key`
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) object>)
Owner owner
Optional\<String\> id
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) id>)
Optional\<Long\> createdAt
The Unix timestamp (in seconds) of when the user was created
formatunixtime
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) created_at>)
Optional\<String\> name
The name of the user
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) name>)
Optional\<String\> object\_
The object type, which is always organization.user
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) object>)
Optional\<String\> role
Always `owner`
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) role>)
Optional\<String\> type
Always `user`
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) type>)
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner>)
String redactedValue
The redacted value of the API key
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) redacted_value>)
Optional\<String\> value
The value of the API key. Only shown on create.
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) value>)
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema)>)
### Create admin API key
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
import com.openai.models.admin.organization.adminapikeys.AdminApiKey;
import com.openai.models.admin.organization.adminapikeys.AdminApiKeyCreateParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
AdminApiKeyCreateParams params = AdminApiKeyCreateParams.builder()
.name("New Admin Key")
.build();
AdminApiKey adminApiKey = client.admin().organization().adminApiKeys().create(params);
}
}`
```
```
`{
"object": "organization.admin\_api\_key",
"id": "key\_xyz",
"name": "New Admin Key",
"redacted\_value": "sk-admin...xyz",
"created\_at": 1711471533,
"last\_used\_at": 1711471534,
"owner": {
"type": "user",
"object": "organization.user",
"id": "user\_123",
"name": "John Doe",
"created\_at": 1711471533,
"role": "owner"
},
"value": "sk-admin-1234abcd"
}
`
```
##### Returns Examples
```
`{
"object": "organization.admin\_api\_key",
"id": "key\_xyz",
"name": "New Admin Key",
"redacted\_value": "sk-admin...xyz",
"created\_at": 1711471533,
"last\_used\_at": 1711471534,
"owner": {
"type": "user",
"object": "organization.user",
"id": "user\_123",
"name": "John Doe",
"created\_at": 1711471533,
"role": "owner"
},
"value": "sk-admin-1234abcd"
}
`
```