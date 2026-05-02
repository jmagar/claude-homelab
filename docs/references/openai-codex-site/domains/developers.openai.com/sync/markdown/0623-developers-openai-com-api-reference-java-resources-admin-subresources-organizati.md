Delete organization role | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Admin](/api/reference/java/resources/admin)
[Organization](/api/reference/java/resources/admin/subresources/organization)
[Roles](/api/reference/java/resources/admin/subresources/organization/subresources/roles)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete organization role
[RoleDeleteResponse](</api/reference/java/resources/admin#(resource) admin.organization.roles > (model) RoleDeleteResponse > (schema)>) admin().organization().roles().delete(RoleDeleteParamsparams = RoleDeleteParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
DELETE/organization/roles/{role\_id}
Deletes a custom role from the organization.
##### ParametersExpand Collapse
RoleDeleteParams params
Optional\<String\> roleId
[](<#(resource) admin.organization.roles > (method) delete > (params) default > (param) role_id > (schema)>)
[](<#(resource) admin.organization.roles > (method) delete > (params) default>)
##### ReturnsExpand Collapse
class RoleDeleteResponse:
Confirmation payload returned after deleting a role.
String id
Identifier of the deleted role.
[](<#(resource) admin.organization.roles > (model) RoleDeleteResponse > (schema) > (property) id>)
boolean deleted
Whether the role was deleted.
[](<#(resource) admin.organization.roles > (model) RoleDeleteResponse > (schema) > (property) deleted>)
JsonValue; object\_ "role.deleted"constant"role.deleted"constant
Always `role.deleted`.
[](<#(resource) admin.organization.roles > (model) RoleDeleteResponse > (schema) > (property) object>)
[](<#(resource) admin.organization.roles > (model) RoleDeleteResponse > (schema)>)
### Delete organization role
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
import com.openai.models.admin.organization.roles.RoleDeleteParams;
import com.openai.models.admin.organization.roles.RoleDeleteResponse;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
RoleDeleteResponse role = client.admin().organization().roles().delete("role\_id");
}
}`
```
```
`{
"object": "role.deleted",
"id": "role\_01J1F8ROLE01",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"object": "role.deleted",
"id": "role\_01J1F8ROLE01",
"deleted": true
}
`
```