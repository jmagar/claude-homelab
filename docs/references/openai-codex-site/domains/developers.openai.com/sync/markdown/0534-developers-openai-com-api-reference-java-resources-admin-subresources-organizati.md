List group users | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Admin](/api/reference/java/resources/admin)
[Organization](/api/reference/java/resources/admin/subresources/organization)
[Groups](/api/reference/java/resources/admin/subresources/organization/subresources/groups)
[Users](/api/reference/java/resources/admin/subresources/organization/subresources/groups/subresources/users)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List group users
UserListPage admin().organization().groups().users().list(UserListParamsparams = UserListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/groups/{group\_id}/users
Lists the users assigned to a group.
##### ParametersExpand Collapse
UserListParams params
Optional\<String\> groupId
[](<#(resource) admin.organization.groups.users > (method) list > (params) default > (param) group_id > (schema)>)
Optional\<String\> after
A cursor for use in pagination. Provide the ID of the last user from the previous list response to retrieve the next page.
[](<#(resource) admin.organization.groups.users > (method) list > (params) default > (param) after > (schema)>)
Optional\<Long\> limit
A limit on the number of users to be returned. Limit can range between 0 and 1000, and the default is 100.
minimum0
maximum1000
[](<#(resource) admin.organization.groups.users > (method) list > (params) default > (param) limit > (schema)>)
Optional\<[Order](</api/reference/java/resources/admin/subresources/organization/subresources/groups/subresources/users/methods/list#(resource) admin.organization.groups.users > (method) list > (params) default > (param) order > (schema)>)\> order
Specifies the sort order of users in the list.
ASC("asc")
[](<#(resource) admin.organization.groups.users > (method) list > (params) default > (param) order > (schema) > (member) 0>)
DESC("desc")
[](<#(resource) admin.organization.groups.users > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) admin.organization.groups.users > (method) list > (params) default > (param) order > (schema)>)
[](<#(resource) admin.organization.groups.users > (method) list > (params) default>)
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
### List group users
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
import com.openai.models.admin.organization.groups.users.UserListPage;
import com.openai.models.admin.organization.groups.users.UserListParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
UserListPage page = client.admin().organization().groups().users().list("group\_id");
}
}`
```
```
`{
"object": "list",
"data": [
{
"object": "organization.user",
"id": "user\_abc123",
"name": "Ada Lovelace",
"email": "ada@example.com",
"role": "owner",
"added\_at": 1711471533
}
],
"has\_more": false,
"next": null
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
"id": "user\_abc123",
"name": "Ada Lovelace",
"email": "ada@example.com",
"role": "owner",
"added\_at": 1711471533
}
],
"has\_more": false,
"next": null
}
`
```