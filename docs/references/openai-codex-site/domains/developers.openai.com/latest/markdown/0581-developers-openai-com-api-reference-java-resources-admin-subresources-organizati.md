Assign organization role to group | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Admin](/api/reference/java/resources/admin)
[Organization](/api/reference/java/resources/admin/subresources/organization)
[Groups](/api/reference/java/resources/admin/subresources/organization/subresources/groups)
[Roles](/api/reference/java/resources/admin/subresources/organization/subresources/groups/subresources/roles)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Assign organization role to group
[RoleCreateResponse](</api/reference/java/resources/admin#(resource) admin.organization.groups.roles > (model) RoleCreateResponse > (schema)>) admin().organization().groups().roles().create(RoleCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/groups/{group\_id}/roles
Assigns an organization role to a group within the organization.
##### ParametersExpand Collapse
RoleCreateParams params
Optional\<String\> groupId
[](<#(resource) admin.organization.groups.roles > (method) create > (params) default > (param) group_id > (schema)>)
String roleId
Identifier of the role to assign.
[](<#(resource) admin.organization.groups.roles > (method) create > (params) default > (param) body > (schema) > (property) role_id>)
[](<#(resource) admin.organization.groups.roles > (method) create > (params) default>)
##### ReturnsExpand Collapse
class RoleCreateResponse:
Role assignment linking a group to a role.
Group group
Summary information about a group returned in role assignment responses.
String id
Identifier for the group.
[](<#(resource) admin.organization.groups.roles > (model) RoleCreateResponse > (schema) > (property) group > (property) id>)
long createdAt
Unix timestamp (in seconds) when the group was created.
formatunixtime
[](<#(resource) admin.organization.groups.roles > (model) RoleCreateResponse > (schema) > (property) group > (property) created_at>)
String name
Display name of the group.
[](<#(resource) admin.organization.groups.roles > (model) RoleCreateResponse > (schema) > (property) group > (property) name>)
JsonValue; object\_ "group"constant"group"constant
Always `group`.
[](<#(resource) admin.organization.groups.roles > (model) RoleCreateResponse > (schema) > (property) group > (property) object>)
boolean scimManaged
Whether the group is managed through SCIM.
[](<#(resource) admin.organization.groups.roles > (model) RoleCreateResponse > (schema) > (property) group > (property) scim_managed>)
[](<#(resource) admin.organization.groups.roles > (model) RoleCreateResponse > (schema) > (property) group>)
JsonValue; object\_ "group.role"constant"group.role"constant
Always `group.role`.
[](<#(resource) admin.organization.groups.roles > (model) RoleCreateResponse > (schema) > (property) object>)
[Role](</api/reference/java/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) role
Details about a role that can be assigned through the public Roles API.
String id
Identifier for the role.
[](<#(resource) admin.organization.groups.roles > (model) RoleCreateResponse > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) id>)
Optional\<String\> description
Optional description of the role.
[](<#(resource) admin.organization.groups.roles > (model) RoleCreateResponse > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) description>)
String name
Unique name for the role.
[](<#(resource) admin.organization.groups.roles > (model) RoleCreateResponse > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) name>)
JsonValue; object\_ "role"constant"role"constant
Always `role`.
[](<#(resource) admin.organization.groups.roles > (model) RoleCreateResponse > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) object>)
List\<String\> permissions
Permissions granted by the role.
[](<#(resource) admin.organization.groups.roles > (model) RoleCreateResponse > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) permissions>)
boolean predefinedRole
Whether the role is predefined and managed by OpenAI.
[](<#(resource) admin.organization.groups.roles > (model) RoleCreateResponse > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) predefined_role>)
String resourceType
Resource type the role is bound to (for example `api.organization` or `api.project`).
[](<#(resource) admin.organization.groups.roles > (model) RoleCreateResponse > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) resource_type>)
[](<#(resource) admin.organization.groups.roles > (model) RoleCreateResponse > (schema) > (property) role>)
[](<#(resource) admin.organization.groups.roles > (model) RoleCreateResponse > (schema)>)
### Assign organization role to group
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
import com.openai.models.admin.organization.groups.roles.RoleCreateParams;
import com.openai.models.admin.organization.groups.roles.RoleCreateResponse;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
RoleCreateParams params = RoleCreateParams.builder()
.groupId("group\_id")
.roleId("role\_id")
.build();
RoleCreateResponse role = client.admin().organization().groups().roles().create(params);
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
"id": "role\_01J1F8ROLE01",
"name": "API Group Manager",
"description": "Allows managing organization groups",
"permissions": [
"api.groups.read",
"api.groups.write"
],
"resource\_type": "api.organization",
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
"id": "role\_01J1F8ROLE01",
"name": "API Group Manager",
"description": "Allows managing organization groups",
"permissions": [
"api.groups.read",
"api.groups.write"
],
"resource\_type": "api.organization",
"predefined\_role": false
}
}
`
```