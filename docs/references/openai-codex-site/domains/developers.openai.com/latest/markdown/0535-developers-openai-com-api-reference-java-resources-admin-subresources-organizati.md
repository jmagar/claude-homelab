List all organization and project API keys. | OpenAI API Reference
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
# List all organization and project API keys.
AdminApiKeyListPage admin().organization().adminApiKeys().list(AdminApiKeyListParamsparams = AdminApiKeyListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/admin\_api\_keys
List organization API keys
##### ParametersExpand Collapse
AdminApiKeyListParams params
Optional\<String\> after
Return keys with IDs that come after this ID in the pagination order.
[](<#(resource) admin.organization.admin_api_keys > (method) list > (params) default > (param) after > (schema)>)
Optional\<Long\> limit
Maximum number of keys to return.
[](<#(resource) admin.organization.admin_api_keys > (method) list > (params) default > (param) limit > (schema)>)
Optional\<[Order](</api/reference/java/resources/admin/subresources/organization/subresources/admin_api_keys/methods/list#(resource) admin.organization.admin_api_keys > (method) list > (params) default > (param) order > (schema)>)\> order
Order results by creation time, ascending or descending.
ASC("asc")
[](<#(resource) admin.organization.admin_api_keys > (method) list > (params) default > (param) order > (schema) > (member) 0>)
DESC("desc")
[](<#(resource) admin.organization.admin_api_keys > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) admin.organization.admin_api_keys > (method) list > (params) default > (param) order > (schema)>)
[](<#(resource) admin.organization.admin_api_keys > (method) list > (params) default>)
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
### List all organization and project API keys.
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
import com.openai.models.admin.organization.adminapikeys.AdminApiKeyListPage;
import com.openai.models.admin.organization.adminapikeys.AdminApiKeyListParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
AdminApiKeyListPage page = client.admin().organization().adminApiKeys().list();
}
}`
```
```
`{
"object": "list",
"data": [
{
"object": "organization.admin\_api\_key",
"id": "key\_abc",
"name": "Main Admin Key",
"redacted\_value": "sk-admin...def",
"created\_at": 1711471533,
"last\_used\_at": 1711471534,
"owner": {
"type": "service\_account",
"object": "organization.service\_account",
"id": "sa\_456",
"name": "My Service Account",
"created\_at": 1711471533,
"role": "member"
}
}
],
"first\_id": "key\_abc",
"last\_id": "key\_abc",
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
"object": "organization.admin\_api\_key",
"id": "key\_abc",
"name": "Main Admin Key",
"redacted\_value": "sk-admin...def",
"created\_at": 1711471533,
"last\_used\_at": 1711471534,
"owner": {
"type": "service\_account",
"object": "organization.service\_account",
"id": "sa\_456",
"name": "My Service Account",
"created\_at": 1711471533,
"role": "member"
}
}
],
"first\_id": "key\_abc",
"last\_id": "key\_abc",
"has\_more": false
}
`
```