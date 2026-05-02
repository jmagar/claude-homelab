Add group user | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Admin](/api/reference/resources/admin)
[Organization](/api/reference/resources/admin/subresources/organization)
[Groups](/api/reference/resources/admin/subresources/organization/subresources/groups)
[Users](/api/reference/resources/admin/subresources/organization/subresources/groups/subresources/users)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Add group user
POST/organization/groups/{group\_id}/users
Adds a user to a group.
##### Path ParametersExpand Collapse
group\_id: string
[](<#(resource) admin.organization.groups.users > (method) create > (params) default > (param) group_id > (schema)>)
##### Body ParametersJSONExpand Collapse
user\_id: string
Identifier of the user to add to the group.
[](<#(resource) admin.organization.groups.users > (method) create > (params) 0 > (param) user_id > (schema)>)
##### ReturnsExpand Collapse
group\_id: string
Identifier of the group the user was added to.
[](<#(resource) admin.organization.groups.users > (model) user_create_response > (schema) > (property) group_id>)
object: "group.user"
Always `group.user`.
[](<#(resource) admin.organization.groups.users > (model) user_create_response > (schema) > (property) object>)
user\_id: string
Identifier of the user that was added.
[](<#(resource) admin.organization.groups.users > (model) user_create_response > (schema) > (property) user_id>)
### Add group user
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
`curl -X POST https://api.openai.com/v1/organization/groups/group\_01J1F8ABCDXYZ/users \\
-H "Authorization: Bearer $OPENAI\_ADMIN\_KEY" \\
-H "Content-Type: application/json" \\
-d '{
"user\_id": "user\_abc123"
}'
`
```
```
`{
"object": "group.user",
"user\_id": "user\_abc123",
"group\_id": "group\_01J1F8ABCDXYZ"
}
`
```
##### Returns Examples
```
`{
"object": "group.user",
"user\_id": "user\_abc123",
"group\_id": "group\_01J1F8ABCDXYZ"
}
`
```