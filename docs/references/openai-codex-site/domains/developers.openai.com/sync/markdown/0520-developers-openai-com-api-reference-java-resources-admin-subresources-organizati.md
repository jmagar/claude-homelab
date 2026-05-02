Create project | OpenAI API Reference
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
# Create project
[Project](</api/reference/java/resources/admin#(resource) admin.organization.projects > (model) project > (schema)>) admin().organization().projects().create(ProjectCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/projects
Create a new project in the organization. Projects can be created and archived, but cannot be deleted.
##### ParametersExpand Collapse
ProjectCreateParams params
String name
The friendly name of the project, this name appears in reports.
[](<#(resource) admin.organization.projects > (method) create > (params) default > (param) body > (schema) > (property) name>)
Optional\<Geography\> geography
Create the project with the specified data residency region. Your organization must have access to Data residency functionality in order to use. See [data residency controls](https://platform.openai.com/docs/guides/your-data#data-residency-controls) to review the functionality and limitations of setting this field.
US("US")
[](<#(resource) admin.organization.projects > (method) create > (params) default > (param) body > (schema) > (property) geography > (member) 0>)
EU("EU")
[](<#(resource) admin.organization.projects > (method) create > (params) default > (param) body > (schema) > (property) geography > (member) 1>)
JP("JP")
[](<#(resource) admin.organization.projects > (method) create > (params) default > (param) body > (schema) > (property) geography > (member) 2>)
IN("IN")
[](<#(resource) admin.organization.projects > (method) create > (params) default > (param) body > (schema) > (property) geography > (member) 3>)
KR("KR")
[](<#(resource) admin.organization.projects > (method) create > (params) default > (param) body > (schema) > (property) geography > (member) 4>)
CA("CA")
[](<#(resource) admin.organization.projects > (method) create > (params) default > (param) body > (schema) > (property) geography > (member) 5>)
AU("AU")
[](<#(resource) admin.organization.projects > (method) create > (params) default > (param) body > (schema) > (property) geography > (member) 6>)
SG("SG")
[](<#(resource) admin.organization.projects > (method) create > (params) default > (param) body > (schema) > (property) geography > (member) 7>)
[](<#(resource) admin.organization.projects > (method) create > (params) default > (param) body > (schema) > (property) geography>)
[](<#(resource) admin.organization.projects > (method) create > (params) default>)
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
### Create project
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
import com.openai.models.admin.organization.projects.ProjectCreateParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
ProjectCreateParams params = ProjectCreateParams.builder()
.name("name")
.build();
Project project = client.admin().organization().projects().create(params);
}
}`
```
```
`{
"id": "proj\_abc",
"object": "organization.project",
"name": "Project ABC",
"created\_at": 1711471533,
"archived\_at": null,
"status": "active"
}
`
```
##### Returns Examples
```
`{
"id": "proj\_abc",
"object": "organization.project",
"name": "Project ABC",
"created\_at": 1711471533,
"archived\_at": null,
"status": "active"
}
`
```