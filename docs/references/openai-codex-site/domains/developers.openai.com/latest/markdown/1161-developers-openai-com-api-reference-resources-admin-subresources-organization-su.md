Delete project API key | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Admin](/api/reference/resources/admin)
[Organization](/api/reference/resources/admin/subresources/organization)
[Projects](/api/reference/resources/admin/subresources/organization/subresources/projects)
[API Keys](/api/reference/resources/admin/subresources/organization/subresources/projects/subresources/api_keys)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete project API key
DELETE/organization/projects/{project\_id}/api\_keys/{key\_id}
Deletes an API key from the project.
Returns confirmation of the key deletion, or an error if the key belonged to
a service account.
##### Path ParametersExpand Collapse
project\_id: string
[](<#(resource) admin.organization.projects.api_keys > (method) delete > (params) default > (param) project_id > (schema)>)
key\_id: string
[](<#(resource) admin.organization.projects.api_keys > (method) delete > (params) default > (param) key_id > (schema)>)
##### ReturnsExpand Collapse
id: string
[](<#(resource) admin.organization.projects.api_keys > (model) api_key_delete_response > (schema) > (property) id>)
deleted: boolean
[](<#(resource) admin.organization.projects.api_keys > (model) api_key_delete_response > (schema) > (property) deleted>)
object: "organization.project.api\_key.deleted"
[](<#(resource) admin.organization.projects.api_keys > (model) api_key_delete_response > (schema) > (property) object>)
### Delete project API key
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
`curl -X DELETE https://api.openai.com/v1/organization/projects/proj\_abc/api\_keys/key\_abc \\
-H "Authorization: Bearer $OPENAI\_ADMIN\_KEY" \\
-H "Content-Type: application/json"
`
```
```
`{
"object": "organization.project.api\_key.deleted",
"id": "key\_abc",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"object": "organization.project.api\_key.deleted",
"id": "key\_abc",
"deleted": true
}
`
```