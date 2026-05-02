Delete project API key | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Admin](/api/reference/typescript/resources/admin)
[Organization](/api/reference/typescript/resources/admin/subresources/organization)
[Projects](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects)
[API Keys](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/api_keys)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete project API key
client.admin.organization.projects.apiKeys.delete(stringkeyID, APIKeyDeleteParams { project\_id } params, RequestOptionsoptions?): [APIKeyDeleteResponse](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.api_keys > (model) api_key_delete_response > (schema)>) { id, deleted, object }
DELETE/organization/projects/{project\_id}/api\_keys/{key\_id}
Deletes an API key from the project.
Returns confirmation of the key deletion, or an error if the key belonged to
a service account.
##### ParametersExpand Collapse
keyID: string
[](<#(resource) admin.organization.projects.api_keys > (method) delete > (params) default > (param) key_id > (schema)>)
params: APIKeyDeleteParams { project\_id }
project\_id: string
The ID of the project.
[](<#(resource) admin.organization.projects.api_keys > (method) delete > (params) default > (param) project_id>)
[](<#(resource) admin.organization.projects.api_keys > (method) delete > (params) default>)
##### ReturnsExpand Collapse
APIKeyDeleteResponse { id, deleted, object }
id: string
[](<#(resource) admin.organization.projects.api_keys > (model) api_key_delete_response > (schema) > (property) id>)
deleted: boolean
[](<#(resource) admin.organization.projects.api_keys > (model) api_key_delete_response > (schema) > (property) deleted>)
object: "organization.project.api\_key.deleted"
[](<#(resource) admin.organization.projects.api_keys > (model) api_key_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.api_keys > (model) api_key_delete_response > (schema)>)
### Delete project API key
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
const apiKey = await client.admin.organization.projects.apiKeys.delete('key\_id', {
project\_id: 'project\_id',
});
console.log(apiKey.id);`
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