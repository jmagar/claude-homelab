Unassign project role from group | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Admin](/api/reference/java/resources/admin)
[Organization](/api/reference/java/resources/admin/subresources/organization)
[Projects](/api/reference/java/resources/admin/subresources/organization/subresources/projects)
[Groups](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/groups)
[Roles](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/groups/subresources/roles)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Unassign project role from group
[RoleDeleteResponse](</api/reference/java/resources/admin#(resource) admin.organization.projects.groups.roles > (model) RoleDeleteResponse > (schema)>) admin().organization().projects().groups().roles().delete(RoleDeleteParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
DELETE/projects/{project\_id}/groups/{group\_id}/roles/{role\_id}
Unassigns a project role from a group within a project.
##### ParametersExpand Collapse
RoleDeleteParams params
String projectId
[](<#(resource) admin.organization.projects.groups.roles > (method) delete > (params) default > (param) project_id > (schema)>)
String groupId
[](<#(resource) admin.organization.projects.groups.roles > (method) delete > (params) default > (param) group_id > (schema)>)
Optional\<String\> roleId
[](<#(resource) admin.organization.projects.groups.roles > (method) delete > (params) default > (param) role_id > (schema)>)
[](<#(resource) admin.organization.projects.groups.roles > (method) delete > (params) default>)
##### ReturnsExpand Collapse
class RoleDeleteResponse:
Confirmation payload returned after unassigning a role.
boolean deleted
Whether the assignment was removed.
[](<#(resource) admin.organization.projects.groups.roles > (model) RoleDeleteResponse > (schema) > (property) deleted>)
String object\_
Identifier for the deleted assignment, such as `group.role.deleted` or `user.role.deleted`.
[](<#(resource) admin.organization.projects.groups.roles > (model) RoleDeleteResponse > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.groups.roles > (model) RoleDeleteResponse > (schema)>)
### Unassign project role from group
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
import com.openai.models.admin.organization.projects.groups.roles.RoleDeleteParams;
import com.openai.models.admin.organization.projects.groups.roles.RoleDeleteResponse;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
RoleDeleteParams params = RoleDeleteParams.builder()
.projectId("project\_id")
.groupId("group\_id")
.roleId("role\_id")
.build();
RoleDeleteResponse role = client.admin().organization().projects().groups().roles().delete(params);
}
}`
```
```
`{
"object": "group.role.deleted",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"object": "group.role.deleted",
"deleted": true
}
`
```