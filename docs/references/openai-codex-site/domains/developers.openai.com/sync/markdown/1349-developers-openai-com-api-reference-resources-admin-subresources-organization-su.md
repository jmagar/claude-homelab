Modify user | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Admin](/api/reference/resources/admin)
[Organization](/api/reference/resources/admin/subresources/organization)
[Users](/api/reference/resources/admin/subresources/organization/subresources/users)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Modify user
POST/organization/users/{user\_id}
Modifies a user’s role in the organization.
##### Path ParametersExpand Collapse
user\_id: string
[](<#(resource) admin.organization.users > (method) update > (params) default > (param) user_id > (schema)>)
##### Body ParametersJSONExpand Collapse
role: "owner" or "reader"
`owner` or `reader`
One of the following:
"owner"
[](<#(resource) admin.organization.users > (method) update > (params) 0 > (param) role > (schema) > (member) 0>)
"reader"
[](<#(resource) admin.organization.users > (method) update > (params) 0 > (param) role > (schema) > (member) 1>)
[](<#(resource) admin.organization.users > (method) update > (params) 0 > (param) role > (schema)>)
##### ReturnsExpand Collapse
OrganizationUser object { id, added\_at, email, 3 more }
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
role: "owner" or "reader"
`owner` or `reader`
One of the following:
"owner"
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) role > (member) 0>)
"reader"
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) role>)
[](<#(resource) admin.organization.users > (model) organization_user > (schema)>)
### Modify user
HTTP
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
`curl -X POST https://api.openai.com/v1/organization/users/user\_abc \\
-H "Authorization: Bearer $OPENAI\_ADMIN\_KEY" \\
-H "Content-Type: application/json" \\
-d '{
"role": "owner"
}'
`
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