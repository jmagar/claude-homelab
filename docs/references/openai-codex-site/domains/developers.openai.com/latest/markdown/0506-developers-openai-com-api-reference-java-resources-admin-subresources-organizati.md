Remove project group | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Admin](/api/reference/java/resources/admin)
[Organization](/api/reference/java/resources/admin/subresources/organization)
[Projects](/api/reference/java/resources/admin/subresources/organization/subresources/projects)
[Groups](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/groups)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Remove project group
[GroupDeleteResponse](</api/reference/java/resources/admin#(resource) admin.organization.projects.groups > (model) GroupDeleteResponse > (schema)>) admin().organization().projects().groups().delete(GroupDeleteParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
DELETE/organization/projects/{project\_id}/groups/{group\_id}
Revokes a group’s access to a project.
##### ParametersExpand Collapse
GroupDeleteParams params
String projectId
[](<#(resource) admin.organization.projects.groups > (method) delete > (params) default > (param) project_id > (schema)>)
Optional\<String\> groupId
[](<#(resource) admin.organization.projects.groups > (method) delete > (params) default > (param) group_id > (schema)>)
[](<#(resource) admin.organization.projects.groups > (method) delete > (params) default>)
##### ReturnsExpand Collapse
class GroupDeleteResponse:
Confirmation payload returned after removing a group from a project.
boolean deleted
Whether the group membership in the project was removed.
[](<#(resource) admin.organization.projects.groups > (model) GroupDeleteResponse > (schema) > (property) deleted>)
JsonValue; object\_ "project.group.deleted"constant"project.group.deleted"constant
Always `project.group.deleted`.
[](<#(resource) admin.organization.projects.groups > (model) GroupDeleteResponse > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.groups > (model) GroupDeleteResponse > (schema)>)
### Remove project group
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
import com.openai.models.admin.organization.projects.groups.GroupDeleteParams;
import com.openai.models.admin.organization.projects.groups.GroupDeleteResponse;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
GroupDeleteParams params = GroupDeleteParams.builder()
.projectId("project\_id")
.groupId("group\_id")
.build();
GroupDeleteResponse group = client.admin().organization().projects().groups().delete(params);
}
}`
```
```
`{
"object": "project.group.deleted",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"object": "project.group.deleted",
"deleted": true
}
`
```