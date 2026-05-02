Retrieve project user | OpenAI API Reference
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
# Retrieve project user
[ProjectUser](</api/reference/java/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>) admin().organization().projects().users().retrieve(UserRetrieveParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/projects/{project\_id}/users/{user\_id}
Retrieves a user in the project.
##### ParametersExpand Collapse
UserRetrieveParams params
String projectId
[](<#(resource) admin.organization.projects.users > (method) retrieve > (params) default > (param) project_id > (schema)>)
Optional\<String\> userId
[](<#(resource) admin.organization.projects.users > (method) retrieve > (params) default > (param) user_id > (schema)>)
[](<#(resource) admin.organization.projects.users > (method) retrieve > (params) default>)
##### ReturnsExpand Collapse
class ProjectUser:
Represents an individual user in a project.
String id
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) id>)
long addedAt
The Unix timestamp (in seconds) of when the project was added.
formatunixtime
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) added_at>)
String email
The email address of the user
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) email>)
String name
The name of the user
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) name>)
JsonValue; object\_ "organization.project.user"constant"organization.project.user"constant
The object type, which is always `organization.project.user`
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) object>)
Role role
`owner` or `member`
One of the following:
OWNER("owner")
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role > (member) 0>)
MEMBER("member")
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema)>)
### Retrieve project user
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
import com.openai.models.admin.organization.projects.users.ProjectUser;
import com.openai.models.admin.organization.projects.users.UserRetrieveParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
UserRetrieveParams params = UserRetrieveParams.builder()
.projectId("project\_id")
.userId("user\_id")
.build();
ProjectUser projectUser = client.admin().organization().projects().users().retrieve(params);
}
}`
```
```
`{
"object": "organization.project.user",
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
"object": "organization.project.user",
"id": "user\_abc",
"name": "First Last",
"email": "user@example.com",
"role": "owner",
"added\_at": 1711471533
}
`
```