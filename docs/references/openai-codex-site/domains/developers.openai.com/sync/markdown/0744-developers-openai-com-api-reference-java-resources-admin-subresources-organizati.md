Modify user | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Admin](/api/reference/java/resources/admin)
[Organization](/api/reference/java/resources/admin/subresources/organization)
[Users](/api/reference/java/resources/admin/subresources/organization/subresources/users)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Modify user
[OrganizationUser](</api/reference/java/resources/admin#(resource) admin.organization.users > (model) organization_user > (schema)>) admin().organization().users().update(UserUpdateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/users/{user\_id}
Modifies a user’s role in the organization.
##### ParametersExpand Collapse
UserUpdateParams params
Optional\<String\> userId
[](<#(resource) admin.organization.users > (method) update > (params) default > (param) user_id > (schema)>)
Role role
`owner` or `reader`
OWNER("owner")
[](<#(resource) admin.organization.users > (method) update > (params) default > (param) body > (schema) > (property) role > (member) 0>)
READER("reader")
[](<#(resource) admin.organization.users > (method) update > (params) default > (param) body > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.users > (method) update > (params) default > (param) body > (schema) > (property) role>)
[](<#(resource) admin.organization.users > (method) update > (params) default>)
##### ReturnsExpand Collapse
class OrganizationUser:
Represents an individual `user` within an organization.
String id
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) id>)
long addedAt
The Unix timestamp (in seconds) of when the user was added.
formatunixtime
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) added_at>)
String email
The email address of the user
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) email>)
String name
The name of the user
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) name>)
JsonValue; object\_ "organization.user"constant"organization.user"constant
The object type, which is always `organization.user`
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) object>)
Role role
`owner` or `reader`
One of the following:
OWNER("owner")
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) role > (member) 0>)
READER("reader")
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) role>)
[](<#(resource) admin.organization.users > (model) organization_user > (schema)>)
### Modify user
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
import com.openai.models.admin.organization.users.OrganizationUser;
import com.openai.models.admin.organization.users.UserUpdateParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
UserUpdateParams params = UserUpdateParams.builder()
.userId("user\_id")
.role(UserUpdateParams.Role.OWNER)
.build();
OrganizationUser organizationUser = client.admin().organization().users().update(params);
}
}`
```
```
`{
"object": "organization.user",
"id": "user\_abc",
"name": "First Last",
"email": "user@example.com",
"role": "owner",
"added\_at": 1711471533
}
`
```
##### Returns Examples
```
`{
"object": "organization.user",
"id": "user\_abc",
"name": "First Last",
"email": "user@example.com",
"role": "owner",
"added\_at": 1711471533
}
`
```