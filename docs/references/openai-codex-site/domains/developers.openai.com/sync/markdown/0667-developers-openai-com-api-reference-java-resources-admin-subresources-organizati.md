Delete user | OpenAI API Reference
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
# Delete user
[UserDeleteResponse](</api/reference/java/resources/admin#(resource) admin.organization.users > (model) UserDeleteResponse > (schema)>) admin().organization().users().delete(UserDeleteParamsparams = UserDeleteParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
DELETE/organization/users/{user\_id}
Deletes a user from the organization.
##### ParametersExpand Collapse
UserDeleteParams params
Optional\<String\> userId
[](<#(resource) admin.organization.users > (method) delete > (params) default > (param) user_id > (schema)>)
[](<#(resource) admin.organization.users > (method) delete > (params) default>)
##### ReturnsExpand Collapse
class UserDeleteResponse:
String id
[](<#(resource) admin.organization.users > (model) UserDeleteResponse > (schema) > (property) id>)
boolean deleted
[](<#(resource) admin.organization.users > (model) UserDeleteResponse > (schema) > (property) deleted>)
JsonValue; object\_ "organization.user.deleted"constant"organization.user.deleted"constant
[](<#(resource) admin.organization.users > (model) UserDeleteResponse > (schema) > (property) object>)
[](<#(resource) admin.organization.users > (model) UserDeleteResponse > (schema)>)
### Delete user
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
import com.openai.models.admin.organization.users.UserDeleteParams;
import com.openai.models.admin.organization.users.UserDeleteResponse;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
UserDeleteResponse user = client.admin().organization().users().delete("user\_id");
}
}`
```
```
`{
"object": "organization.user.deleted",
"id": "user\_abc",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"object": "organization.user.deleted",
"id": "user\_abc",
"deleted": true
}
`
```