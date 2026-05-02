Delete invite | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Admin](/api/reference/java/resources/admin)
[Organization](/api/reference/java/resources/admin/subresources/organization)
[Invites](/api/reference/java/resources/admin/subresources/organization/subresources/invites)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete invite
[InviteDeleteResponse](</api/reference/java/resources/admin#(resource) admin.organization.invites > (model) InviteDeleteResponse > (schema)>) admin().organization().invites().delete(InviteDeleteParamsparams = InviteDeleteParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
DELETE/organization/invites/{invite\_id}
Delete an invite. If the invite has already been accepted, it cannot be deleted.
##### ParametersExpand Collapse
InviteDeleteParams params
Optional\<String\> inviteId
[](<#(resource) admin.organization.invites > (method) delete > (params) default > (param) invite_id > (schema)>)
[](<#(resource) admin.organization.invites > (method) delete > (params) default>)
##### ReturnsExpand Collapse
class InviteDeleteResponse:
String id
[](<#(resource) admin.organization.invites > (model) InviteDeleteResponse > (schema) > (property) id>)
boolean deleted
[](<#(resource) admin.organization.invites > (model) InviteDeleteResponse > (schema) > (property) deleted>)
JsonValue; object\_ "organization.invite.deleted"constant"organization.invite.deleted"constant
The object type, which is always `organization.invite.deleted`
[](<#(resource) admin.organization.invites > (model) InviteDeleteResponse > (schema) > (property) object>)
[](<#(resource) admin.organization.invites > (model) InviteDeleteResponse > (schema)>)
### Delete invite
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
import com.openai.models.admin.organization.invites.InviteDeleteParams;
import com.openai.models.admin.organization.invites.InviteDeleteResponse;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
InviteDeleteResponse invite = client.admin().organization().invites().delete("invite\_id");
}
}`
```
```
`{
"object": "organization.invite.deleted",
"id": "invite-abc",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"object": "organization.invite.deleted",
"id": "invite-abc",
"deleted": true
}
`
```