Retrieve project API key | OpenAI API Reference
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
# Retrieve project API key
[ProjectApiKey](</api/reference/java/resources/admin#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema)>) admin().organization().projects().apiKeys().retrieve(ApiKeyRetrieveParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/projects/{project\_id}/api\_keys/{key\_id}
Retrieves an API key in the project.
##### ParametersExpand Collapse
ApiKeyRetrieveParams params
String projectId
[](<#(resource) admin.organization.projects.api_keys > (method) retrieve > (params) default > (param) project_id > (schema)>)
Optional\<String\> keyId
[](<#(resource) admin.organization.projects.api_keys > (method) retrieve > (params) default > (param) key_id > (schema)>)
[](<#(resource) admin.organization.projects.api_keys > (method) retrieve > (params) default>)
##### ReturnsExpand Collapse
class ProjectApiKey:
Represents an individual API key in a project.
String id
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) id>)
long createdAt
The Unix timestamp (in seconds) of when the API key was created
formatunixtime
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) created_at>)
long lastUsedAt
The Unix timestamp (in seconds) of when the API key was last used.
formatunixtime
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) last_used_at>)
String name
The name of the API key
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) name>)
JsonValue; object\_ "organization.project.api\_key"constant"organization.project.api\_key"constant
The object type, which is always `organization.project.api\_key`
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) object>)
Owner owner
Optional\<[ProjectServiceAccount](</api/reference/java/resources/admin#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema)>)\> serviceAccount
Represents an individual service account in a project.
String id
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) service_account + (resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) id>)
long createdAt
The Unix timestamp (in seconds) of when the service account was created
formatunixtime
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) service_account + (resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) created_at>)
String name
The name of the service account
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) service_account + (resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) name>)
JsonValue; object\_ "organization.project.service\_account"constant"organization.project.service\_account"constant
The object type, which is always `organization.project.service\_account`
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) service_account + (resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) object>)
Role role
`owner` or `member`
One of the following:
OWNER("owner")
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) service_account + (resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role > (member) 0>)
MEMBER("member")
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) service_account + (resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) service_account + (resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) service_account>)
Optional\<Type\> type
`user` or `service\_account`
One of the following:
USER("user")
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) type > (member) 0>)
SERVICE\_ACCOUNT("service\_account")
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) type > (member) 1>)
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) type>)
Optional\<[ProjectUser](</api/reference/java/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>)\> user
Represents an individual user in a project.
String id
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) user + (resource) admin.organization.projects.users > (model) project_user > (schema) > (property) id>)
long addedAt
The Unix timestamp (in seconds) of when the project was added.
formatunixtime
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) user + (resource) admin.organization.projects.users > (model) project_user > (schema) > (property) added_at>)
String email
The email address of the user
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) user + (resource) admin.organization.projects.users > (model) project_user > (schema) > (property) email>)
String name
The name of the user
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) user + (resource) admin.organization.projects.users > (model) project_user > (schema) > (property) name>)
JsonValue; object\_ "organization.project.user"constant"organization.project.user"constant
The object type, which is always `organization.project.user`
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) user + (resource) admin.organization.projects.users > (model) project_user > (schema) > (property) object>)
Role role
`owner` or `member`
One of the following:
OWNER("owner")
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) user + (resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role > (member) 0>)
MEMBER("member")
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) user + (resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) user + (resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) user>)
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner>)
String redactedValue
The redacted value of the API key
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) redacted_value>)
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema)>)
### Retrieve project API key
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
import com.openai.models.admin.organization.projects.apikeys.ApiKeyRetrieveParams;
import com.openai.models.admin.organization.projects.apikeys.ProjectApiKey;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
ApiKeyRetrieveParams params = ApiKeyRetrieveParams.builder()
.projectId("project\_id")
.keyId("key\_id")
.build();
ProjectApiKey projectApiKey = client.admin().organization().projects().apiKeys().retrieve(params);
}
}`
```
```
`{
"object": "organization.project.api\_key",
"redacted\_value": "sk-abc...def",
"name": "My API Key",
"created\_at": 1711471533,
"last\_used\_at": 1711471534,
"id": "key\_abc",
"owner": {
"type": "user",
"user": {
"object": "organization.project.user",
"id": "user\_abc",
"name": "First Last",
"email": "user@example.com",
"role": "owner",
"added\_at": 1711471533
}
}
}
`
```
##### Returns Examples
```
`{
"object": "organization.project.api\_key",
"redacted\_value": "sk-abc...def",
"name": "My API Key",
"created\_at": 1711471533,
"last\_used\_at": 1711471534,
"id": "key\_abc",
"owner": {
"type": "user",
"user": {
"object": "organization.project.user",
"id": "user\_abc",
"name": "First Last",
"email": "user@example.com",
"role": "owner",
"added\_at": 1711471533
}
}
}
`
```