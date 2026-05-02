Retrieve project user | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Admin](/api/reference/typescript/resources/admin)
[Organization](/api/reference/typescript/resources/admin/subresources/organization)
[Projects](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects)
[Users](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/users)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Retrieve project user
client.admin.organization.projects.users.retrieve(stringuserID, UserRetrieveParams { project\_id } params, RequestOptionsoptions?): [ProjectUser](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>) { id, added\_at, email, 3 more }
GET/organization/projects/{project\_id}/users/{user\_id}
Retrieves a user in the project.
##### ParametersExpand Collapse
userID: string
[](<#(resource) admin.organization.projects.users > (method) retrieve > (params) default > (param) user_id > (schema)>)
params: UserRetrieveParams { project\_id }
project\_id: string
The ID of the project.
[](<#(resource) admin.organization.projects.users > (method) retrieve > (params) default > (param) project_id>)
[](<#(resource) admin.organization.projects.users > (method) retrieve > (params) default>)
##### ReturnsExpand Collapse
ProjectUser { id, added\_at, email, 3 more }
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
role: "owner" | "member"
`owner` or `member`
One of the following:
"owner"
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role > (member) 0>)
"member"
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema)>)
### Retrieve project user
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
const projectUser = await client.admin.organization.projects.users.retrieve('user\_id', {
project\_id: 'project\_id',
});
console.log(projectUser.id);`
```
```
`{
"object": "organization.project.user",
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
"object": "organization.project.user",
"id": "user\_abc",
"name": "First Last",
"email": "user@example.com",
"role": "owner",
"added\_at": 1711471533
}
`
```