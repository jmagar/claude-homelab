Delete project user | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Admin](/api/reference/java/resources/admin)
[Organization](/api/reference/java/resources/admin/subresources/organization)
[Projects](/api/reference/java/resources/admin/subresources/organization/subresources/projects)
[Users](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/users)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete project user
[UserDeleteResponse](</api/reference/java/resources/admin#(resource) admin.organization.projects.users > (model) UserDeleteResponse > (schema)>) admin().organization().projects().users().delete(UserDeleteParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
DELETE/organization/projects/{project\_id}/users/{user\_id}
Deletes a user from the project.
Returns confirmation of project user deletion, or an error if the project is
archived (archived projects have no users).
##### ParametersExpand Collapse
UserDeleteParams params
String projectId
[](<#(resource) admin.organization.projects.users > (method) delete > (params) default > (param) project_id > (schema)>)
Optional\<String\> userId
[](<#(resource) admin.organization.projects.users > (method) delete > (params) default > (param) user_id > (schema)>)
[](<#(resource) admin.organization.projects.users > (method) delete > (params) default>)
##### ReturnsExpand Collapse
class UserDeleteResponse:
String id
[](<#(resource) admin.organization.projects.users > (model) UserDeleteResponse > (schema) > (property) id>)
boolean deleted
[](<#(resource) admin.organization.projects.users > (model) UserDeleteResponse > (schema) > (property) deleted>)
JsonValue; object\_ "organization.project.user.deleted"constant"organization.project.user.deleted"constant
[](<#(resource) admin.organization.projects.users > (model) UserDeleteResponse > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.users > (model) UserDeleteResponse > (schema)>)
### Delete project user
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
import com.openai.models.admin.organization.projects.users.UserDeleteParams;
import com.openai.models.admin.organization.projects.users.UserDeleteResponse;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
UserDeleteParams params = UserDeleteParams.builder()
.projectId("project\_id")
.userId("user\_id")
.build();
UserDeleteResponse user = client.admin().organization().projects().users().delete(params);
}
}`
```
```
`{
"object": "organization.project.user.deleted",
"id": "user\_abc",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"object": "organization.project.user.deleted",
"id": "user\_abc",
"deleted": true
}
`
```