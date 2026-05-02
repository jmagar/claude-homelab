Remove group user | OpenAI API Reference
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
# Remove group user
DELETE/organization/groups/{group\_id}/users/{user\_id}
Removes a user from a group.
##### Path ParametersExpand Collapse
group\_id: string
[](<#(resource) admin.organization.groups.users > (method) delete > (params) default > (param) group_id > (schema)>)
user\_id: string
[](<#(resource) admin.organization.groups.users > (method) delete > (params) default > (param) user_id > (schema)>)
##### ReturnsExpand Collapse
deleted: boolean
Whether the group membership was removed.
[](<#(resource) admin.organization.groups.users > (model) user_delete_response > (schema) > (property) deleted>)
object: "group.user.deleted"
Always `group.user.deleted`.
[](<#(resource) admin.organization.groups.users > (model) user_delete_response > (schema) > (property) object>)
### Remove group user
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
`curl -X DELETE https://api.openai.com/v1/organization/groups/group\_01J1F8ABCDXYZ/users/user\_abc123 \\
-H "Authorization: Bearer $OPENAI\_ADMIN\_KEY" \\
-H "Content-Type: application/json"
`
```
```
`{
"object": "group.user.deleted",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"object": "group.user.deleted",
"deleted": true
}
`
```