Delete project API key | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Admin](/api/reference/python/resources/admin)
[Organization](/api/reference/python/resources/admin/subresources/organization)
[Projects](/api/reference/python/resources/admin/subresources/organization/subresources/projects)
[API Keys](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/api_keys)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete project API key
admin.organization.projects.api\_keys.delete(strkey\_id, APIKeyDeleteParams\*\*kwargs) -\> [APIKeyDeleteResponse](</api/reference/python/resources/admin#(resource) admin.organization.projects.api_keys > (model) api_key_delete_response > (schema)>)
DELETE/organization/projects/{project\_id}/api\_keys/{key\_id}
Deletes an API key from the project.
Returns confirmation of the key deletion, or an error if the key belonged to
a service account.
##### ParametersExpand Collapse
project\_id: str
[](<#(resource) admin.organization.projects.api_keys > (method) delete > (params) default > (param) project_id > (schema)>)
key\_id: str
[](<#(resource) admin.organization.projects.api_keys > (method) delete > (params) default > (param) key_id > (schema)>)
##### ReturnsExpand Collapse
class APIKeyDeleteResponse: …
id: str
[](<#(resource) admin.organization.projects.api_keys > (model) api_key_delete_response > (schema) > (property) id>)
deleted: bool
[](<#(resource) admin.organization.projects.api_keys > (model) api_key_delete_response > (schema) > (property) deleted>)
object: Literal["organization.project.api\_key.deleted"]
[](<#(resource) admin.organization.projects.api_keys > (model) api_key_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.api_keys > (model) api_key_delete_response > (schema)>)
### Delete project API key
Python
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
`import os
from openai import OpenAI
client = OpenAI(
admin\_api\_key=os.environ.get("OPENAI\_ADMIN\_KEY"), # This is the default and can be omitted
)
api\_key = client.admin.organization.projects.api\_keys.delete(
key\_id="key\_id",
project\_id="project\_id",
)
print(api\_key.id)`
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