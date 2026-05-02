Assign project role to group | OpenAI API Reference
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
# Assign project role to group
[RoleCreateResponse](</api/reference/java/resources/admin#(resource) admin.organization.projects.groups.roles > (model) RoleCreateResponse > (schema)>) admin().organization().projects().groups().roles().create(RoleCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/projects/{project\_id}/groups/{group\_id}/roles
Assigns a project role to a group within a project.
##### ParametersExpand Collapse
RoleCreateParams params
String projectId
[](<#(resource) admin.organization.projects.groups.roles > (method) create > (params) default > (param) project_id > (schema)>)
Optional\<String\> groupId
[](<#(resource) admin.organization.projects.groups.roles > (method) create > (params) default > (param) group_id > (schema)>)
String roleId
Identifier of the role to assign.
[](<#(resource) admin.organization.projects.groups.roles > (method) create > (params) default > (param) body > (schema) > (property) role_id>)
[](<#(resource) admin.organization.projects.groups.roles > (method) create > (params) default>)
##### ReturnsExpand Collapse
class RoleCreateResponse:
Role assignment linking a group to a role.
Group group
Summary information about a group returned in role assignment responses.
String id
Identifier for the group.
[](<#(resource) admin.organization.projects.groups.roles > (model) RoleCreateResponse > (schema) > (property) group > (property) id>)
long createdAt
Unix timestamp (in seconds) when the group was created.
formatunixtime
[](<#(resource) admin.organization.projects.groups.roles > (model) RoleCreateResponse > (schema) > (property) group > (property) created_at>)
String name
Display name of the group.
[](<#(resource) admin.organization.projects.groups.roles > (model) RoleCreateResponse > (schema) > (property) group > (property) name>)
JsonValue; object\_ "group"constant"group"constant
Always `group`.
[](<#(resource) admin.organization.projects.groups.roles > (model) RoleCreateResponse > (schema) > (property) group > (property) object>)
boolean scimManaged
Whether the group is managed through SCIM.
[](<#(resource) admin.organization.projects.groups.roles > (model) RoleCreateResponse > (schema) > (property) group > (property) scim_managed>)
[](<#(resource) admin.organization.projects.groups.roles > (model) RoleCreateResponse > (schema) > (property) group>)
JsonValue; object\_ "group.role"constant"group.role"constant
Always `group.role`.
[](<#(resource) admin.organization.projects.groups.roles > (model) RoleCreateResponse > (schema) > (property) object>)
[Role](</api/reference/java/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) role
Details about a role that can be assigned through the public Roles API.
String id
Identifier for the role.
[](<#(resource) admin.organization.projects.groups.roles > (model) RoleCreateResponse > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) id>)
Optional\<String\> description
Optional description of the role.
[](<#(resource) admin.organization.projects.groups.roles > (model) RoleCreateResponse > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) description>)
String name
Unique name for the role.
[](<#(resource) admin.organization.projects.groups.roles > (model) RoleCreateResponse > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) name>)
JsonValue; object\_ "role"constant"role"constant
Always `role`.
[](<#(resource) admin.organization.projects.groups.roles > (model) RoleCreateResponse > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) object>)
List\<String\> permissions
Permissions granted by the role.
[](<#(resource) admin.organization.projects.groups.roles > (model) RoleCreateResponse > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) permissions>)
boolean predefinedRole
Whether the role is predefined and managed by OpenAI.
[](<#(resource) admin.organization.projects.groups.roles > (model) RoleCreateResponse > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) predefined_role>)
String resourceType
Resource type the role is bound to (for example `api.organization` or `api.project`).
[](<#(resource) admin.organization.projects.groups.roles > (model) RoleCreateResponse > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) resource_type>)
[](<#(resource) admin.organization.projects.groups.roles > (model) RoleCreateResponse > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.groups.roles > (model) RoleCreateResponse > (schema)>)
### Assign project role to group
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
import com.openai.models.admin.organization.projects.groups.roles.RoleCreateParams;
import com.openai.models.admin.organization.projects.groups.roles.RoleCreateResponse;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
RoleCreateParams params = RoleCreateParams.builder()
.projectId("project\_id")
.groupId("group\_id")
.roleId("role\_id")
.build();
RoleCreateResponse role = client.admin().organization().projects().groups().roles().create(params);
}
}`
```
```
`{
"object": "group.role",
"group": {
"object": "group",
"id": "group\_01J1F8ABCDXYZ",
"name": "Support Team",
"created\_at": 1711471533,
"scim\_managed": false
},
"role": {
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
}
`
```
##### Returns Examples
```
`{
"object": "group.role",
"group": {
"object": "group",
"id": "group\_01J1F8ABCDXYZ",
"name": "Support Team",
"created\_at": 1711471533,
"scim\_managed": false
},
"role": {
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
}
`
```