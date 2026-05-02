List projects | OpenAI API Reference
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
# List projects
ProjectListPage admin().organization().projects().list(ProjectListParamsparams = ProjectListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/projects
Returns a list of projects.
##### ParametersExpand Collapse
ProjectListParams params
Optional\<String\> after
A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj\_foo, your subsequent call can include after=obj\_foo in order to fetch the next page of the list.
[](<#(resource) admin.organization.projects > (method) list > (params) default > (param) after > (schema)>)
Optional\<Boolean\> includeArchived
If `true` returns all projects including those that have been `archived`. Archived projects are not included by default.
[](<#(resource) admin.organization.projects > (method) list > (params) default > (param) include_archived > (schema)>)
Optional\<Long\> limit
A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
[](<#(resource) admin.organization.projects > (method) list > (params) default > (param) limit > (schema)>)
[](<#(resource) admin.organization.projects > (method) list > (params) default>)
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
### List projects
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
import com.openai.models.admin.organization.projects.ProjectListPage;
import com.openai.models.admin.organization.projects.ProjectListParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
ProjectListPage page = client.admin().organization().projects().list();
}
}`
```
```
`{
"object": "list",
"data": [
{
"id": "proj\_abc",
"object": "organization.project",
"name": "Project example",
"created\_at": 1711471533,
"archived\_at": null,
"status": "active"
}
],
"first\_id": "proj-abc",
"last\_id": "proj-xyz",
"has\_more": false
}
`
```
##### Returns Examples
```
`{
"object": "list",
"data": [
{
"id": "proj\_abc",
"object": "organization.project",
"name": "Project example",
"created\_at": 1711471533,
"archived\_at": null,
"status": "active"
}
],
"first\_id": "proj-abc",
"last\_id": "proj-xyz",
"has\_more": false
}
`
```