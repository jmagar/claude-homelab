Create group | OpenAI API Reference
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
# Create group
[Group](</api/reference/java/resources/admin#(resource) admin.organization.groups > (model) group > (schema)>) admin().organization().groups().create(GroupCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/groups
Creates a new group in the organization.
##### ParametersExpand Collapse
GroupCreateParams params
String name
Human readable name for the group.
minLength1
maxLength255
[](<#(resource) admin.organization.groups > (method) create > (params) default > (param) body > (schema) > (property) name>)
[](<#(resource) admin.organization.groups > (method) create > (params) default>)
##### ReturnsExpand Collapse
class Group:
Details about an organization group.
String id
Identifier for the group.
[](<#(resource) admin.organization.groups > (model) group > (schema) > (property) id>)
long createdAt
Unix timestamp (in seconds) when the group was created.
formatunixtime
[](<#(resource) admin.organization.groups > (model) group > (schema) > (property) created_at>)
boolean isScimManaged
Whether the group is managed through SCIM and controlled by your identity provider.
[](<#(resource) admin.organization.groups > (model) group > (schema) > (property) is_scim_managed>)
String name
Display name of the group.
[](<#(resource) admin.organization.groups > (model) group > (schema) > (property) name>)
[](<#(resource) admin.organization.groups > (model) group > (schema)>)
### Create group
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
import com.openai.models.admin.organization.groups.Group;
import com.openai.models.admin.organization.groups.GroupCreateParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
GroupCreateParams params = GroupCreateParams.builder()
.name("x")
.build();
Group group = client.admin().organization().groups().create(params);
}
}`
```
```
`{
"object": "group",
"id": "group\_01J1F8ABCDXYZ",
"name": "Support Team",
"created\_at": 1711471533,
"is\_scim\_managed": false
}
`
```
##### Returns Examples
```
`{
"object": "group",
"id": "group\_01J1F8ABCDXYZ",
"name": "Support Team",
"created\_at": 1711471533,
"is\_scim\_managed": false
}
`
```