Create project role | OpenAI API Reference
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
# Create project role
[Role](</api/reference/java/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) admin().organization().projects().roles().create(RoleCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/projects/{project\_id}/roles
Creates a custom role for a project.
##### ParametersExpand Collapse
RoleCreateParams params
Optional\<String\> projectId
[](<#(resource) admin.organization.projects.roles > (method) create > (params) default > (param) project_id > (schema)>)
List\<String\> permissions
Permissions to grant to the role.
[](<#(resource) admin.organization.projects.roles > (method) create > (params) default > (param) body > (schema) > (property) permissions>)
String roleName
Unique name for the role.
[](<#(resource) admin.organization.projects.roles > (method) create > (params) default > (param) body > (schema) > (property) role_name>)
Optional\<String\> description
Optional description of the role.
[](<#(resource) admin.organization.projects.roles > (method) create > (params) default > (param) body > (schema) > (property) description>)
[](<#(resource) admin.organization.projects.roles > (method) create > (params) default>)
##### ReturnsExpand Collapse
class Role:
Details about a role that can be assigned through the public Roles API.
String id
Identifier for the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) id>)
Optional\<String\> description
Optional description of the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) description>)
String name
Unique name for the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) name>)
JsonValue; object\_ "role"constant"role"constant
Always `role`.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) object>)
List\<String\> permissions
Permissions granted by the role.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) permissions>)
boolean predefinedRole
Whether the role is predefined and managed by OpenAI.
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) predefined_role>)
String resourceType
Resource type the role is bound to (for example `api.organization` or `api.project`).
[](<#(resource) admin.organization.roles > (model) role > (schema) > (property) resource_type>)
[](<#(resource) admin.organization.roles > (model) role > (schema)>)
### Create project role
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
import com.openai.models.admin.organization.projects.roles.RoleCreateParams;
import com.openai.models.admin.organization.roles.Role;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
RoleCreateParams params = RoleCreateParams.builder()
.projectId("project\_id")
.addPermission("string")
.roleName("role\_name")
.build();
Role role = client.admin().organization().projects().roles().create(params);
}
}`
```
```
`{
"object": "role",
"id": "role\_01J1F8PROJ",
"name": "API Project Key Manager",
"description": "Allows managing API keys for the project",
"permissions": [
"api.organization.projects.api\_keys.read",
"api.organization.projects.api\_keys.write"
],
"resource\_type": "api.project",
"predefined\_role": false
}
`
```
##### Returns Examples
```
`{
"object": "role",
"id": "role\_01J1F8PROJ",
"name": "API Project Key Manager",
"description": "Allows managing API keys for the project",
"permissions": [
"api.organization.projects.api\_keys.read",
"api.organization.projects.api\_keys.write"
],
"resource\_type": "api.project",
"predefined\_role": false
}
`
```