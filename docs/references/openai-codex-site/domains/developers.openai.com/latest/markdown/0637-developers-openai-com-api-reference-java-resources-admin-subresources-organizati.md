Assign organization role to user | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Admin](/api/reference/java/resources/admin)
[Organization](/api/reference/java/resources/admin/subresources/organization)
[Users](/api/reference/java/resources/admin/subresources/organization/subresources/users)
[Roles](/api/reference/java/resources/admin/subresources/organization/subresources/users/subresources/roles)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Assign organization role to user
[RoleCreateResponse](</api/reference/java/resources/admin#(resource) admin.organization.users.roles > (model) RoleCreateResponse > (schema)>) admin().organization().users().roles().create(RoleCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/users/{user\_id}/roles
Assigns an organization role to a user within the organization.
##### ParametersExpand Collapse
RoleCreateParams params
Optional\<String\> userId
[](<#(resource) admin.organization.users.roles > (method) create > (params) default > (param) user_id > (schema)>)
String roleId
Identifier of the role to assign.
[](<#(resource) admin.organization.users.roles > (method) create > (params) default > (param) body > (schema) > (property) role_id>)
[](<#(resource) admin.organization.users.roles > (method) create > (params) default>)
##### ReturnsExpand Collapse
class RoleCreateResponse:
Role assignment linking a user to a role.
JsonValue; object\_ "user.role"constant"user.role"constant
Always `user.role`.
[](<#(resource) admin.organization.users.roles > (model) RoleCreateResponse > (schema) > (property) object>)
[Role](</api/reference/java/resources/admin#(resource) admin.organization.roles > (model) role > (schema)>) role
Details about a role that can be assigned through the public Roles API.
String id
Identifier for the role.
[](<#(resource) admin.organization.users.roles > (model) RoleCreateResponse > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) id>)
Optional\<String\> description
Optional description of the role.
[](<#(resource) admin.organization.users.roles > (model) RoleCreateResponse > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) description>)
String name
Unique name for the role.
[](<#(resource) admin.organization.users.roles > (model) RoleCreateResponse > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) name>)
JsonValue; object\_ "role"constant"role"constant
Always `role`.
[](<#(resource) admin.organization.users.roles > (model) RoleCreateResponse > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) object>)
List\<String\> permissions
Permissions granted by the role.
[](<#(resource) admin.organization.users.roles > (model) RoleCreateResponse > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) permissions>)
boolean predefinedRole
Whether the role is predefined and managed by OpenAI.
[](<#(resource) admin.organization.users.roles > (model) RoleCreateResponse > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) predefined_role>)
String resourceType
Resource type the role is bound to (for example `api.organization` or `api.project`).
[](<#(resource) admin.organization.users.roles > (model) RoleCreateResponse > (schema) > (property) role + (resource) admin.organization.roles > (model) role > (schema) > (property) resource_type>)
[](<#(resource) admin.organization.users.roles > (model) RoleCreateResponse > (schema) > (property) role>)
[OrganizationUser](</api/reference/java/resources/admin#(resource) admin.organization.users > (model) organization_user > (schema)>) user
Represents an individual `user` within an organization.
String id
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.users.roles > (model) RoleCreateResponse > (schema) > (property) user + (resource) admin.organization.users > (model) organization_user > (schema) > (property) id>)
long addedAt
The Unix timestamp (in seconds) of when the user was added.
formatunixtime
[](<#(resource) admin.organization.users.roles > (model) RoleCreateResponse > (schema) > (property) user + (resource) admin.organization.users > (model) organization_user > (schema) > (property) added_at>)
String email
The email address of the user
[](<#(resource) admin.organization.users.roles > (model) RoleCreateResponse > (schema) > (property) user + (resource) admin.organization.users > (model) organization_user > (schema) > (property) email>)
String name
The name of the user
[](<#(resource) admin.organization.users.roles > (model) RoleCreateResponse > (schema) > (property) user + (resource) admin.organization.users > (model) organization_user > (schema) > (property) name>)
JsonValue; object\_ "organization.user"constant"organization.user"constant
The object type, which is always `organization.user`
[](<#(resource) admin.organization.users.roles > (model) RoleCreateResponse > (schema) > (property) user + (resource) admin.organization.users > (model) organization_user > (schema) > (property) object>)
Role role
`owner` or `reader`
One of the following:
OWNER("owner")
[](<#(resource) admin.organization.users.roles > (model) RoleCreateResponse > (schema) > (property) user + (resource) admin.organization.users > (model) organization_user > (schema) > (property) role > (member) 0>)
READER("reader")
[](<#(resource) admin.organization.users.roles > (model) RoleCreateResponse > (schema) > (property) user + (resource) admin.organization.users > (model) organization_user > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.users.roles > (model) RoleCreateResponse > (schema) > (property) user + (resource) admin.organization.users > (model) organization_user > (schema) > (property) role>)
[](<#(resource) admin.organization.users.roles > (model) RoleCreateResponse > (schema) > (property) user>)
[](<#(resource) admin.organization.users.roles > (model) RoleCreateResponse > (schema)>)
### Assign organization role to user
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
import com.openai.models.admin.organization.users.roles.RoleCreateParams;
import com.openai.models.admin.organization.users.roles.RoleCreateResponse;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
RoleCreateParams params = RoleCreateParams.builder()
.userId("user\_id")
.roleId("role\_id")
.build();
RoleCreateResponse role = client.admin().organization().users().roles().create(params);
}
}`
```
```
`{
"object": "user.role",
"user": {
"object": "organization.user",
"id": "user\_abc123",
"name": "Ada Lovelace",
"email": "ada@example.com",
"role": "owner",
"added\_at": 1711470000
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
"object": "user.role",
"user": {
"object": "organization.user",
"id": "user\_abc123",
"name": "Ada Lovelace",
"email": "ada@example.com",
"role": "owner",
"added\_at": 1711470000
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