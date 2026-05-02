Archive project | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Admin](/api/reference/java/resources/admin)
[Organization](/api/reference/java/resources/admin/subresources/organization)
[Projects](/api/reference/java/resources/admin/subresources/organization/subresources/projects)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Archive project
[Project](</api/reference/java/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>) admin().organization().projects().archive(ProjectArchiveParamsparams = ProjectArchiveParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/projects/{project\_id}/archive
Archives a project in the organization. Archived projects cannot be used or updated.
##### ParametersExpand Collapse
ProjectArchiveParams params
Optional\<String\> projectId
[](<#(resource) admin.organization.projects > (method) archive > (params) default > (param) project_id > (schema)>)
[](<#(resource) admin.organization.projects > (method) archive > (params) default>)
##### ReturnsExpand Collapse
class Project:
Represents an individual project.
String id
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) id>)
long createdAt
The Unix timestamp (in seconds) of when the project was created.
formatunixtime
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) created_at>)
String name
The name of the project. This appears in reporting.
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) name>)
JsonValue; object\_ "organization.project"constant"organization.project"constant
The object type, which is always `organization.project`
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) object>)
Status status
`active` or `archived`
One of the following:
ACTIVE("active")
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) status > (member) 0>)
ARCHIVED("archived")
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) status > (member) 1>)
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) status>)
Optional\<Long\> archivedAt
The Unix timestamp (in seconds) of when the project was archived or `null`.
formatunixtime
[](<#(resource) admin.organization.projects > (model) project > (schema) > (property) archived_at>)
[](<#(resource) admin.organization.projects > (model) project > (schema)>)
### Archive project
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
import com.openai.models.admin.organization.projects.Project;
import com.openai.models.admin.organization.projects.ProjectArchiveParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
Project project = client.admin().organization().projects().archive("project\_id");
}
}`
```
```
`{
"id": "proj\_abc",
"object": "organization.project",
"name": "Project DEF",
"created\_at": 1711471533,
"archived\_at": 1711471533,
"status": "archived"
}
`
```
##### Returns Examples
```
`{
"id": "proj\_abc",
"object": "organization.project",
"name": "Project DEF",
"created\_at": 1711471533,
"archived\_at": 1711471533,
"status": "archived"
}
`
```