Add group user | OpenAI API Reference
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
# Add group user
[UserCreateResponse](</api/reference/java/resources/admin#(resource) admin.organization.groups.users > (model) UserCreateResponse > (schema)>) admin().organization().groups().users().create(UserCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/groups/{group\_id}/users
Adds a user to a group.
##### ParametersExpand Collapse
UserCreateParams params
Optional\<String\> groupId
[](<#(resource) admin.organization.groups.users > (method) create > (params) default > (param) group_id > (schema)>)
String userId
Identifier of the user to add to the group.
[](<#(resource) admin.organization.groups.users > (method) create > (params) default > (param) body > (schema) > (property) user_id>)
[](<#(resource) admin.organization.groups.users > (method) create > (params) default>)
##### ReturnsExpand Collapse
class UserCreateResponse:
Confirmation payload returned after adding a user to a group.
String groupId
Identifier of the group the user was added to.
[](<#(resource) admin.organization.groups.users > (model) UserCreateResponse > (schema) > (property) group_id>)
JsonValue; object\_ "group.user"constant"group.user"constant
Always `group.user`.
[](<#(resource) admin.organization.groups.users > (model) UserCreateResponse > (schema) > (property) object>)
String userId
Identifier of the user that was added.
[](<#(resource) admin.organization.groups.users > (model) UserCreateResponse > (schema) > (property) user_id>)
[](<#(resource) admin.organization.groups.users > (model) UserCreateResponse > (schema)>)
### Add group user
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
import com.openai.models.admin.organization.groups.users.UserCreateParams;
import com.openai.models.admin.organization.groups.users.UserCreateResponse;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
UserCreateParams params = UserCreateParams.builder()
.groupId("group\_id")
.userId("user\_id")
.build();
UserCreateResponse user = client.admin().organization().groups().users().create(params);
}
}`
```
```
`{
"object": "group.user",
"user\_id": "user\_abc123",
"group\_id": "group\_01J1F8ABCDXYZ"
}
`
```
##### Returns Examples
```
`{
"object": "group.user",
"user\_id": "user\_abc123",
"group\_id": "group\_01J1F8ABCDXYZ"
}
`
```