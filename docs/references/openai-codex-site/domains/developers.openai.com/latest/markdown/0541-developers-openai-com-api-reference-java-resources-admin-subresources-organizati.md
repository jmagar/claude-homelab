Update group | OpenAI API Reference
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
# Update group
[GroupUpdateResponse](</api/reference/java/resources/admin#(resource) admin.organization.groups > (model) GroupUpdateResponse > (schema)>) admin().organization().groups().update(GroupUpdateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/groups/{group\_id}
Updates a group’s information.
##### ParametersExpand Collapse
GroupUpdateParams params
Optional\<String\> groupId
[](<#(resource) admin.organization.groups > (method) update > (params) default > (param) group_id > (schema)>)
String name
New display name for the group.
minLength1
maxLength255
[](<#(resource) admin.organization.groups > (method) update > (params) default > (param) body > (schema) > (property) name>)
[](<#(resource) admin.organization.groups > (method) update > (params) default>)
##### ReturnsExpand Collapse
class GroupUpdateResponse:
Response returned after updating a group.
String id
Identifier for the group.
[](<#(resource) admin.organization.groups > (model) GroupUpdateResponse > (schema) > (property) id>)
long createdAt
Unix timestamp (in seconds) when the group was created.
formatunixtime
[](<#(resource) admin.organization.groups > (model) GroupUpdateResponse > (schema) > (property) created_at>)
boolean isScimManaged
Whether the group is managed through SCIM and controlled by your identity provider.
[](<#(resource) admin.organization.groups > (model) GroupUpdateResponse > (schema) > (property) is_scim_managed>)
String name
Updated display name for the group.
[](<#(resource) admin.organization.groups > (model) GroupUpdateResponse > (schema) > (property) name>)
[](<#(resource) admin.organization.groups > (model) GroupUpdateResponse > (schema)>)
### Update group
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
import com.openai.models.admin.organization.groups.GroupUpdateParams;
import com.openai.models.admin.organization.groups.GroupUpdateResponse;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
GroupUpdateParams params = GroupUpdateParams.builder()
.groupId("group\_id")
.name("x")
.build();
GroupUpdateResponse group = client.admin().organization().groups().update(params);
}
}`
```
```
`{
"id": "group\_01J1F8ABCDXYZ",
"name": "Escalations",
"created\_at": 1711471533,
"is\_scim\_managed": false
}
`
```
##### Returns Examples
```
`{
"id": "group\_01J1F8ABCDXYZ",
"name": "Escalations",
"created\_at": 1711471533,
"is\_scim\_managed": false
}
`
```