Update project role | OpenAI API Reference
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
# Update project role
[Role](</api/reference/java/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) admin().organization().projects().roles().update(RoleUpdateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/projects/{project\_id}/roles/{role\_id}
Updates an existing project role.
##### ParametersExpand Collapse
RoleUpdateParams params
String projectId
[](<#(resource) admin.organization.projects.roles > (method) update > (params) default > (param) project_id > (schema)>)
Optional\<String\> roleId
[](<#(resource) admin.organization.projects.roles > (method) update > (params) default > (param) role_id > (schema)>)
Optional\<String\> description
New description for the role.
[](<#(resource) admin.organization.projects.roles > (method) update > (params) default > (param) body > (schema) > (property) description>)
Optional\<List\<String\>\> permissions
Updated set of permissions for the role.
[](<#(resource) admin.organization.projects.roles > (method) update > (params) default > (param) body > (schema) > (property) permissions>)
Optional\<String\> roleName
New name for the role.
[](<#(resource) admin.organization.projects.roles > (method) update > (params) default > (param) body > (schema) > (property) role_name>)
[](<#(resource) admin.organization.projects.roles > (method) update > (params) default>)
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
### Update project role
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
import com.openai.models.admin.organization.projects.roles.RoleUpdateParams;
import com.openai.models.admin.organization.roles.Role;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
RoleUpdateParams params = RoleUpdateParams.builder()
.projectId("project\_id")
.roleId("role\_id")
.build();
Role role = client.admin().organization().projects().roles().update(params);
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