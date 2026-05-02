Delete project role | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Admin](/api/reference/java/resources/admin)
[Organization](/api/reference/java/resources/admin/subresources/organization)
[Projects](/api/reference/java/resources/admin/subresources/organization/subresources/projects)
[Roles](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/roles)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete project role
[RoleDeleteResponse](</api/reference/java/resources/admin#(resource) admin.organization.projects.roles > (model) RoleDeleteResponse > (schema)>) admin().organization().projects().roles().delete(RoleDeleteParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
DELETE/projects/{project\_id}/roles/{role\_id}
Deletes a custom role from a project.
##### ParametersExpand Collapse
RoleDeleteParams params
String projectId
[](<#(resource) admin.organization.projects.roles > (method) delete > (params) default > (param) project_id > (schema)>)
Optional\<String\> roleId
[](<#(resource) admin.organization.projects.roles > (method) delete > (params) default > (param) role_id > (schema)>)
[](<#(resource) admin.organization.projects.roles > (method) delete > (params) default>)
##### ReturnsExpand Collapse
class RoleDeleteResponse:
Confirmation payload returned after deleting a role.
String id
Identifier of the deleted role.
[](<#(resource) admin.organization.projects.roles > (model) RoleDeleteResponse > (schema) > (property) id>)
boolean deleted
Whether the role was deleted.
[](<#(resource) admin.organization.projects.roles > (model) RoleDeleteResponse > (schema) > (property) deleted>)
JsonValue; object\_ "role.deleted"constant"role.deleted"constant
Always `role.deleted`.
[](<#(resource) admin.organization.projects.roles > (model) RoleDeleteResponse > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.roles > (model) RoleDeleteResponse > (schema)>)
### Delete project role
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
import com.openai.models.admin.organization.projects.roles.RoleDeleteParams;
import com.openai.models.admin.organization.projects.roles.RoleDeleteResponse;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
RoleDeleteParams params = RoleDeleteParams.builder()
.projectId("project\_id")
.roleId("role\_id")
.build();
RoleDeleteResponse role = client.admin().organization().projects().roles().delete(params);
}
}`
```
```
`{
"object": "role.deleted",
"id": "role\_01J1F8PROJ",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"object": "role.deleted",
"id": "role\_01J1F8PROJ",
"deleted": true
}
`
```