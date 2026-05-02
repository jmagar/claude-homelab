List users | OpenAI API Reference
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
# List users
UserListPage admin().organization().users().list(UserListParamsparams = UserListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/users
Lists all of the users in the organization.
##### ParametersExpand Collapse
UserListParams params
Optional\<String\> after
A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj\_foo, your subsequent call can include after=obj\_foo in order to fetch the next page of the list.
[](<#(resource) admin.organization.users > (method) list > (params) default > (param) after > (schema)>)
Optional\<List\<String\>\> emails
Filter by the email address of users.
[](<#(resource) admin.organization.users > (method) list > (params) default > (param) emails > (schema)>)
Optional\<Long\> limit
A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
[](<#(resource) admin.organization.users > (method) list > (params) default > (param) limit > (schema)>)
[](<#(resource) admin.organization.users > (method) list > (params) default>)
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
### List users
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
import com.openai.models.admin.organization.users.UserListPage;
import com.openai.models.admin.organization.users.UserListParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
UserListPage page = client.admin().organization().users().list();
}
}`
```
```
`{
"object": "list",
"data": [
{
"object": "organization.user",
"id": "user\_abc",
"name": "First Last",
"email": "user@example.com",
"role": "owner",
"added\_at": 1711471533
}
],
"first\_id": "user-abc",
"last\_id": "user-xyz",
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
"object": "organization.user",
"id": "user\_abc",
"name": "First Last",
"email": "user@example.com",
"role": "owner",
"added\_at": 1711471533
}
],
"first\_id": "user-abc",
"last\_id": "user-xyz",
"has\_more": false
}
`
```