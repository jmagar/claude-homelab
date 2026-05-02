Remove group user | OpenAI API Reference
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
# Remove group user
[UserDeleteResponse](</api/reference/java/resources/admin#(resource) admin.organization.groups.users > (model) UserDeleteResponse > (schema)>) admin().organization().groups().users().delete(UserDeleteParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
DELETE/organization/groups/{group\_id}/users/{user\_id}
Removes a user from a group.
##### ParametersExpand Collapse
UserDeleteParams params
String groupId
[](<#(resource) admin.organization.groups.users > (method) delete > (params) default > (param) group_id > (schema)>)
Optional\<String\> userId
[](<#(resource) admin.organization.groups.users > (method) delete > (params) default > (param) user_id > (schema)>)
[](<#(resource) admin.organization.groups.users > (method) delete > (params) default>)
##### ReturnsExpand Collapse
class UserDeleteResponse:
Confirmation payload returned after removing a user from a group.
boolean deleted
Whether the group membership was removed.
[](<#(resource) admin.organization.groups.users > (model) UserDeleteResponse > (schema) > (property) deleted>)
JsonValue; object\_ "group.user.deleted"constant"group.user.deleted"constant
Always `group.user.deleted`.
[](<#(resource) admin.organization.groups.users > (model) UserDeleteResponse > (schema) > (property) object>)
[](<#(resource) admin.organization.groups.users > (model) UserDeleteResponse > (schema)>)
### Remove group user
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
import com.openai.models.admin.organization.groups.users.UserDeleteParams;
import com.openai.models.admin.organization.groups.users.UserDeleteResponse;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
UserDeleteParams params = UserDeleteParams.builder()
.groupId("group\_id")
.userId("user\_id")
.build();
UserDeleteResponse user = client.admin().organization().groups().users().delete(params);
}
}`
```
```
`{
"object": "group.user.deleted",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"object": "group.user.deleted",
"deleted": true
}
`
```