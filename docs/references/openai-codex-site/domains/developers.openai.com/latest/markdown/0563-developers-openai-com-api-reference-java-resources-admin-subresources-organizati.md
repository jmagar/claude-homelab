Modify project | OpenAI API Reference
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
# Modify project
[Project](</api/reference/java/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>) admin().organization().projects().update(ProjectUpdateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/projects/{project\_id}
Modifies a project in the organization.
##### ParametersExpand Collapse
ProjectUpdateParams params
Optional\<String\> projectId
[](<#(resource) admin.organization.projects > (method) update > (params) default > (param) project_id > (schema)>)
String name
The updated name of the project, this name appears in reports.
[](<#(resource) admin.organization.projects > (method) update > (params) default > (param) body > (schema) > (property) name>)
[](<#(resource) admin.organization.projects > (method) update > (params) default>)
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
### Modify project
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
import com.openai.models.admin.organization.projects.ProjectUpdateParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
ProjectUpdateParams params = ProjectUpdateParams.builder()
.projectId("project\_id")
.name("name")
.build();
Project project = client.admin().organization().projects().update(params);
}
}`
```
200 example
```
`{
"id": "id",
"created\_at": 0,
"name": "name",
"object": "organization.project",
"status": "active",
"archived\_at": 0
}`
```
##### Returns Examples
200 example
```
`{
"id": "id",
"created\_at": 0,
"name": "name",
"object": "organization.project",
"status": "active",
"archived\_at": 0
}`
```