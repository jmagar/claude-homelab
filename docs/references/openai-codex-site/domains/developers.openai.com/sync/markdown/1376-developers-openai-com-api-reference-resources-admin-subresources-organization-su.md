Delete project user | OpenAI API Reference
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
# Delete project user
DELETE/organization/projects/{project\_id}/users/{user\_id}
Deletes a user from the project.
Returns confirmation of project user deletion, or an error if the project is
archived (archived projects have no users).
##### Path ParametersExpand Collapse
project\_id: string
[](<#(resource) admin.organization.projects.users > (method) delete > (params) default > (param) project_id > (schema)>)
user\_id: string
[](<#(resource) admin.organization.projects.users > (method) delete > (params) default > (param) user_id > (schema)>)
##### ReturnsExpand Collapse
id: string
[](<#(resource) admin.organization.projects.users > (model) user_delete_response > (schema) > (property) id>)
deleted: boolean
[](<#(resource) admin.organization.projects.users > (model) user_delete_response > (schema) > (property) deleted>)
object: "organization.project.user.deleted"
[](<#(resource) admin.organization.projects.users > (model) user_delete_response > (schema) > (property) object>)
### Delete project user
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
`curl -X DELETE https://api.openai.com/v1/organization/projects/proj\_abc/users/user\_abc \\
-H "Authorization: Bearer $OPENAI\_ADMIN\_KEY" \\
-H "Content-Type: application/json"
`
```
```
`{
"object": "organization.project.user.deleted",
"id": "user\_abc",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"object": "organization.project.user.deleted",
"id": "user\_abc",
"deleted": true
}
`
```