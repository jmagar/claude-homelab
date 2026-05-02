Delete group | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Admin](/api/reference/java/resources/admin)
[Organization](/api/reference/java/resources/admin/subresources/organization)
[Groups](/api/reference/java/resources/admin/subresources/organization/subresources/groups)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete group
[GroupDeleteResponse](</api/reference/java/resources/admin#(resource) admin.organization.groups > (model) GroupDeleteResponse > (schema)>) admin().organization().groups().delete(GroupDeleteParamsparams = GroupDeleteParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
DELETE/organization/groups/{group\_id}
Deletes a group from the organization.
##### ParametersExpand Collapse
GroupDeleteParams params
Optional\<String\> groupId
[](<#(resource) admin.organization.groups > (method) delete > (params) default > (param) group_id > (schema)>)
[](<#(resource) admin.organization.groups > (method) delete > (params) default>)
##### ReturnsExpand Collapse
class GroupDeleteResponse:
Confirmation payload returned after deleting a group.
String id
Identifier of the deleted group.
[](<#(resource) admin.organization.groups > (model) GroupDeleteResponse > (schema) > (property) id>)
boolean deleted
Whether the group was deleted.
[](<#(resource) admin.organization.groups > (model) GroupDeleteResponse > (schema) > (property) deleted>)
JsonValue; object\_ "group.deleted"constant"group.deleted"constant
Always `group.deleted`.
[](<#(resource) admin.organization.groups > (model) GroupDeleteResponse > (schema) > (property) object>)
[](<#(resource) admin.organization.groups > (model) GroupDeleteResponse > (schema)>)
### Delete group
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
import com.openai.models.admin.organization.groups.GroupDeleteParams;
import com.openai.models.admin.organization.groups.GroupDeleteResponse;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
GroupDeleteResponse group = client.admin().organization().groups().delete("group\_id");
}
}`
```
```
`{
"object": "group.deleted",
"id": "group\_01J1F8ABCDXYZ",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"object": "group.deleted",
"id": "group\_01J1F8ABCDXYZ",
"deleted": true
}
`
```