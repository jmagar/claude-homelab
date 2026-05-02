List groups | OpenAI API Reference
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
# List groups
GroupListPage admin().organization().groups().list(GroupListParamsparams = GroupListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/groups
Lists all groups in the organization.
##### ParametersExpand Collapse
GroupListParams params
Optional\<String\> after
A cursor for use in pagination. `after` is a group ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with group\_abc, your subsequent call can include `after=group\_abc` in order to fetch the next page of the list.
[](<#(resource) admin.organization.groups > (method) list > (params) default > (param) after > (schema)>)
Optional\<Long\> limit
A limit on the number of groups to be returned. Limit can range between 0 and 1000, and the default is 100.
minimum0
maximum1000
[](<#(resource) admin.organization.groups > (method) list > (params) default > (param) limit > (schema)>)
Optional\<[Order](</api/reference/java/resources/admin/subresources/organization/subresources/groups/methods/list#(resource) admin.organization.groups > (method) list > (params) default > (param) order > (schema)>)\> order
Specifies the sort order of the returned groups.
ASC("asc")
[](<#(resource) admin.organization.groups > (method) list > (params) default > (param) order > (schema) > (member) 0>)
DESC("desc")
[](<#(resource) admin.organization.groups > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) admin.organization.groups > (method) list > (params) default > (param) order > (schema)>)
[](<#(resource) admin.organization.groups > (method) list > (params) default>)
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
### List groups
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
import com.openai.models.admin.organization.groups.GroupListPage;
import com.openai.models.admin.organization.groups.GroupListParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
GroupListPage page = client.admin().organization().groups().list();
}
}`
```
```
`{
"object": "list",
"data": [
{
"object": "group",
"id": "group\_01J1F8ABCDXYZ",
"name": "Support Team",
"created\_at": 1711471533,
"is\_scim\_managed": false
}
],
"has\_more": false,
"next": null
}
`
```
##### Returns Examples
```
`{
"object": "list",
"data": [
{
"object": "group",
"id": "group\_01J1F8ABCDXYZ",
"name": "Support Team",
"created\_at": 1711471533,
"is\_scim\_managed": false
}
],
"has\_more": false,
"next": null
}
`
```