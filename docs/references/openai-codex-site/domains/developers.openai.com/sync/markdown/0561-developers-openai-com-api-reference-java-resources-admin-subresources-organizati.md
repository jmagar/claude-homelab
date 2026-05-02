Create invite | OpenAI API Reference
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
# Create invite
[Invite](</api/reference/java/resources/admin#(resource) admin.organization.invites > (model) invite > (schema)>) admin().organization().invites().create(InviteCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/invites
Create an invite for a user to the organization. The invite must be accepted by the user before they have access to the organization.
##### ParametersExpand Collapse
InviteCreateParams params
String email
Send an email to this address
[](<#(resource) admin.organization.invites > (method) create > (params) default > (param) body > (schema) > (property) email>)
Role role
`owner` or `reader`
READER("reader")
[](<#(resource) admin.organization.invites > (method) create > (params) default > (param) body > (schema) > (property) role > (member) 0>)
OWNER("owner")
[](<#(resource) admin.organization.invites > (method) create > (params) default > (param) body > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.invites > (method) create > (params) default > (param) body > (schema) > (property) role>)
Optional\<List\<Project\>\> projects
An array of projects to which membership is granted at the same time the org invite is accepted. If omitted, the user will be invited to the default project for compatibility with legacy behavior.
String id
Project’s public ID
[](<#(resource) admin.organization.invites > (method) create > (params) default > (param) body > (schema) > (property) projects > (items) > (property) id>)
Role role
Project membership role
One of the following:
MEMBER("member")
[](<#(resource) admin.organization.invites > (method) create > (params) default > (param) body > (schema) > (property) projects > (items) > (property) role > (member) 0>)
OWNER("owner")
[](<#(resource) admin.organization.invites > (method) create > (params) default > (param) body > (schema) > (property) projects > (items) > (property) role > (member) 1>)
[](<#(resource) admin.organization.invites > (method) create > (params) default > (param) body > (schema) > (property) projects > (items) > (property) role>)
[](<#(resource) admin.organization.invites > (method) create > (params) default > (param) body > (schema) > (property) projects>)
[](<#(resource) admin.organization.invites > (method) create > (params) default>)
##### ReturnsExpand Collapse
class Invite:
Represents an individual `invite` to the organization.
String id
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) id>)
String email
The email address of the individual to whom the invite was sent
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) email>)
long expiresAt
The Unix timestamp (in seconds) of when the invite expires.
formatunixtime
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) expires_at>)
long invitedAt
The Unix timestamp (in seconds) of when the invite was sent.
formatunixtime
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) invited_at>)
JsonValue; object\_ "organization.invite"constant"organization.invite"constant
The object type, which is always `organization.invite`
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) object>)
Role role
`owner` or `reader`
One of the following:
OWNER("owner")
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) role > (member) 0>)
READER("reader")
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) role>)
Status status
`accepted`,`expired`, or `pending`
One of the following:
ACCEPTED("accepted")
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) status > (member) 0>)
EXPIRED("expired")
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) status > (member) 1>)
PENDING("pending")
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) status > (member) 2>)
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) status>)
Optional\<Long\> acceptedAt
The Unix timestamp (in seconds) of when the invite was accepted.
formatunixtime
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) accepted_at>)
Optional\<List\<Project\>\> projects
The projects that were granted membership upon acceptance of the invite.
Optional\<String\> id
Project’s public ID
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) projects > (items) > (property) id>)
Optional\<Role\> role
Project membership role
One of the following:
MEMBER("member")
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) projects > (items) > (property) role > (member) 0>)
OWNER("owner")
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) projects > (items) > (property) role > (member) 1>)
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) projects > (items) > (property) role>)
[](<#(resource) admin.organization.invites > (model) invite > (schema) > (property) projects>)
[](<#(resource) admin.organization.invites > (model) invite > (schema)>)
### Create invite
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
import com.openai.models.admin.organization.invites.Invite;
import com.openai.models.admin.organization.invites.InviteCreateParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
InviteCreateParams params = InviteCreateParams.builder()
.email("email")
.role(InviteCreateParams.Role.READER)
.build();
Invite invite = client.admin().organization().invites().create(params);
}
}`
```
```
`{
"object": "organization.invite",
"id": "invite-def",
"email": "anotheruser@example.com",
"role": "reader",
"status": "pending",
"invited\_at": 1711471533,
"expires\_at": 1711471533,
"accepted\_at": null,
"projects": [
{
"id": "project-xyz",
"role": "member"
},
{
"id": "project-abc",
"role": "owner"
}
]
}
`
```
##### Returns Examples
```
`{
"object": "organization.invite",
"id": "invite-def",
"email": "anotheruser@example.com",
"role": "reader",
"status": "pending",
"invited\_at": 1711471533,
"expires\_at": 1711471533,
"accepted\_at": null,
"projects": [
{
"id": "project-xyz",
"role": "member"
},
{
"id": "project-abc",
"role": "owner"
}
]
}
`
```