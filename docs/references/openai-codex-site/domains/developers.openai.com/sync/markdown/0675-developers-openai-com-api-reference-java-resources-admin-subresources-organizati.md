Unassign organization role from user | OpenAI API Reference
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
# Unassign organization role from user
[RoleDeleteResponse](</api/reference/java/resources/admin#(resource) admin.organization.users.roles > (model) RoleDeleteResponse > (schema)>) admin().organization().users().roles().delete(RoleDeleteParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
DELETE/organization/users/{user\_id}/roles/{role\_id}
Unassigns an organization role from a user within the organization.
##### ParametersExpand Collapse
RoleDeleteParams params
String userId
[](<#(resource) admin.organization.users.roles > (method) delete > (params) default > (param) user_id > (schema)>)
Optional\<String\> roleId
[](<#(resource) admin.organization.users.roles > (method) delete > (params) default > (param) role_id > (schema)>)
[](<#(resource) admin.organization.users.roles > (method) delete > (params) default>)
##### ReturnsExpand Collapse
class RoleDeleteResponse:
Confirmation payload returned after unassigning a role.
boolean deleted
Whether the assignment was removed.
[](<#(resource) admin.organization.users.roles > (model) RoleDeleteResponse > (schema) > (property) deleted>)
String object\_
Identifier for the deleted assignment, such as `group.role.deleted` or `user.role.deleted`.
[](<#(resource) admin.organization.users.roles > (model) RoleDeleteResponse > (schema) > (property) object>)
[](<#(resource) admin.organization.users.roles > (model) RoleDeleteResponse > (schema)>)
### Unassign organization role from user
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
import com.openai.models.admin.organization.users.roles.RoleDeleteParams;
import com.openai.models.admin.organization.users.roles.RoleDeleteResponse;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
RoleDeleteParams params = RoleDeleteParams.builder()
.userId("user\_id")
.roleId("role\_id")
.build();
RoleDeleteResponse role = client.admin().organization().users().roles().delete(params);
}
}`
```
```
`{
"object": "user.role.deleted",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"object": "user.role.deleted",
"deleted": true
}
`
```