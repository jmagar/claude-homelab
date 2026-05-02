Create project user | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Admin](/api/reference/resources/admin)
[Organization](/api/reference/resources/admin/subresources/organization)
[Projects](/api/reference/resources/admin/subresources/organization/subresources/projects)
[Users](/api/reference/resources/admin/subresources/organization/subresources/projects/subresources/users)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create project user
POST/organization/projects/{project\_id}/users
Adds a user to the project. Users must already be members of the organization to be added to a project.
##### Path ParametersExpand Collapse
project\_id: string
[](<#(resource) admin.organization.projects.users > (method) create > (params) default > (param) project_id > (schema)>)
##### Body ParametersJSONExpand Collapse
role: "owner" or "member"
`owner` or `member`
One of the following:
"owner"
[](<#(resource) admin.organization.projects.users > (method) create > (params) 0 > (param) role > (schema) > (member) 0>)
"member"
[](<#(resource) admin.organization.projects.users > (method) create > (params) 0 > (param) role > (schema) > (member) 1>)
[](<#(resource) admin.organization.projects.users > (method) create > (params) 0 > (param) role > (schema)>)
user\_id: string
The ID of the user.
[](<#(resource) admin.organization.projects.users > (method) create > (params) 0 > (param) user_id > (schema)>)
##### ReturnsExpand Collapse
ProjectUser object { id, added\_at, email, 3 more }
Represents an individual user in a project.
id: string
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) id>)
added\_at: number
The Unix timestamp (in seconds) of when the project was added.
formatunixtime
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) added_at>)
email: string
The email address of the user
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) email>)
name: string
The name of the user
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) name>)
object: "organization.project.user"
The object type, which is always `organization.project.user`
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) object>)
role: "owner" or "member"
`owner` or `member`
One of the following:
"owner"
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role > (member) 0>)
"member"
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema)>)
### Create project user
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
`curl -X POST https://api.openai.com/v1/organization/projects/proj\_abc/users \\
-H "Authorization: Bearer $OPENAI\_ADMIN\_KEY" \\
-H "Content-Type: application/json" \\
-d '{
"user\_id": "user\_abc",
"role": "member"
}'
`
```
```
`{
"object": "organization.project.user",
"id": "user\_abc",
"email": "user@example.com",
"role": "owner",
"added\_at": 1711471533
}
`
```
##### Returns Examples
```
`{
"object": "organization.project.user",
"id": "user\_abc",
"email": "user@example.com",
"role": "owner",
"added\_at": 1711471533
}
`
```