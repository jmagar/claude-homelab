Modify user | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Admin](/api/reference/typescript/resources/admin)
[Organization](/api/reference/typescript/resources/admin/subresources/organization)
[Users](/api/reference/typescript/resources/admin/subresources/organization/subresources/users)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Modify user
client.admin.organization.users.update(stringuserID, UserUpdateParams { role } body, RequestOptionsoptions?): [OrganizationUser](</api/reference/typescript/resources/admin#(resource) admin.organization.users > (model) organization_user > (schema)>) { id, added\_at, email, 3 more }
POST/organization/users/{user\_id}
Modifies a user’s role in the organization.
##### ParametersExpand Collapse
userID: string
[](<#(resource) admin.organization.users > (method) update > (params) default > (param) user_id > (schema)>)
body: UserUpdateParams { role }
role: "owner" | "reader"
`owner` or `reader`
One of the following:
"owner"
[](<#(resource) admin.organization.users > (method) update > (params) default > (param) role > (schema) > (member) 0>)
"reader"
[](<#(resource) admin.organization.users > (method) update > (params) default > (param) role > (schema) > (member) 1>)
[](<#(resource) admin.organization.users > (method) update > (params) default > (param) role>)
[](<#(resource) admin.organization.users > (method) update > (params) default>)
##### ReturnsExpand Collapse
OrganizationUser { id, added\_at, email, 3 more }
Represents an individual `user` within an organization.
id: string
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) id>)
added\_at: number
The Unix timestamp (in seconds) of when the user was added.
formatunixtime
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) added_at>)
email: string
The email address of the user
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) email>)
name: string
The name of the user
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) name>)
object: "organization.user"
The object type, which is always `organization.user`
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) object>)
role: "owner" | "reader"
`owner` or `reader`
One of the following:
"owner"
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) role > (member) 0>)
"reader"
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) role>)
[](<#(resource) admin.organization.users > (model) organization_user > (schema)>)
### Modify user
TypeScript
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
`import OpenAI from 'openai';
const client = new OpenAI({
adminAPIKey: process.env['OPENAI\_ADMIN\_KEY'], // This is the default and can be omitted
});
const organizationUser = await client.admin.organization.users.update('user\_id', { role: 'owner' });
console.log(organizationUser.id);`
```
```
`{
"object": "organization.user",
"id": "user\_abc",
"name": "First Last",
"email": "user@example.com",
"role": "owner",
"added\_at": 1711471533
}
`
```
##### Returns Examples
```
`{
"object": "organization.user",
"id": "user\_abc",
"name": "First Last",
"email": "user@example.com",
"role": "owner",
"added\_at": 1711471533
}
`
```