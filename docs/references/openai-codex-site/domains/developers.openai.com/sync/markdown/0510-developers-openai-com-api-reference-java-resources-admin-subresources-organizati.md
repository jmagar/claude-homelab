List project groups | OpenAI API Reference
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
# List project groups
GroupListPage admin().organization().projects().groups().list(GroupListParamsparams = GroupListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/projects/{project\_id}/groups
Lists the groups that have access to a project.
##### ParametersExpand Collapse
GroupListParams params
Optional\<String\> projectId
[](<#(resource) admin.organization.projects.groups > (method) list > (params) default > (param) project_id > (schema)>)
Optional\<String\> after
Cursor for pagination. Provide the ID of the last group from the previous response to fetch the next page.
[](<#(resource) admin.organization.projects.groups > (method) list > (params) default > (param) after > (schema)>)
Optional\<Long\> limit
A limit on the number of project groups to return. Defaults to 20.
minimum0
maximum100
[](<#(resource) admin.organization.projects.groups > (method) list > (params) default > (param) limit > (schema)>)
Optional\<[Order](</api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/groups/methods/list#(resource) admin.organization.projects.groups > (method) list > (params) default > (param) order > (schema)>)\> order
Sort order for the returned groups.
ASC("asc")
[](<#(resource) admin.organization.projects.groups > (method) list > (params) default > (param) order > (schema) > (member) 0>)
DESC("desc")
[](<#(resource) admin.organization.projects.groups > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) admin.organization.projects.groups > (method) list > (params) default > (param) order > (schema)>)
[](<#(resource) admin.organization.projects.groups > (method) list > (params) default>)
##### ReturnsExpand Collapse
class ProjectGroup:
Details about a group’s membership in a project.
long createdAt
Unix timestamp (in seconds) when the group was granted project access.
formatunixtime
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) created_at>)
String groupId
Identifier of the group that has access to the project.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) group_id>)
String groupName
Display name of the group.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) group_name>)
JsonValue; object\_ "project.group"constant"project.group"constant
Always `project.group`.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) object>)
String projectId
Identifier of the project.
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema) > (property) project_id>)
[](<#(resource) admin.organization.projects.groups > (model) project_group > (schema)>)
### List project groups
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
import com.openai.models.admin.organization.projects.groups.GroupListPage;
import com.openai.models.admin.organization.projects.groups.GroupListParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
GroupListPage page = client.admin().organization().projects().groups().list("project\_id");
}
}`
```
```
`{
"object": "list",
"data": [
{
"object": "project.group",
"project\_id": "proj\_abc123",
"group\_id": "group\_01J1F8ABCDXYZ",
"group\_name": "Support Team",
"created\_at": 1711471533
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
"object": "project.group",
"project\_id": "proj\_abc123",
"group\_id": "group\_01J1F8ABCDXYZ",
"group\_name": "Support Team",
"created\_at": 1711471533
}
],
"has\_more": false,
"next": null
}
`
```