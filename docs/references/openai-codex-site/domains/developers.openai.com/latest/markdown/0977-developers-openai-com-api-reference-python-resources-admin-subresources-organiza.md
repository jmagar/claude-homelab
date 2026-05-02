List all organization and project API keys. | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Admin](/api/reference/python/resources/admin)
[Organization](/api/reference/python/resources/admin/subresources/organization)
[Admin API Keys](/api/reference/python/resources/admin/subresources/organization/subresources/admin_api_keys)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List all organization and project API keys.
admin.organization.admin\_api\_keys.list(AdminAPIKeyListParams\*\*kwargs) -\> SyncCursorPage[[AdminAPIKey](</api/reference/python/resources/admin#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema)>)]
GET/organization/admin\_api\_keys
List organization API keys
##### ParametersExpand Collapse
after: Optional[str]
Return keys with IDs that come after this ID in the pagination order.
[](<#(resource) admin.organization.admin_api_keys > (method) list > (params) default > (param) after > (schema)>)
limit: Optional[int]
Maximum number of keys to return.
[](<#(resource) admin.organization.admin_api_keys > (method) list > (params) default > (param) limit > (schema)>)
order: Optional[Literal["asc", "desc"]]
Order results by creation time, ascending or descending.
One of the following:
"asc"
[](<#(resource) admin.organization.admin_api_keys > (method) list > (params) default > (param) order > (schema) > (member) 0>)
"desc"
[](<#(resource) admin.organization.admin_api_keys > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) admin.organization.admin_api_keys > (method) list > (params) default > (param) order > (schema)>)
##### ReturnsExpand Collapse
class AdminAPIKey: …
Represents an individual Admin API key in an org.
id: str
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) id>)
created\_at: int
The Unix timestamp (in seconds) of when the API key was created
formatunixtime
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) created_at>)
last\_used\_at: Optional[int]
The Unix timestamp (in seconds) of when the API key was last used
formatunixtime
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) last_used_at>)
name: str
The name of the API key
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) name>)
object: str
The object type, which is always `organization.admin\_api\_key`
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) object>)
owner: Owner
id: Optional[str]
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) id>)
created\_at: Optional[int]
The Unix timestamp (in seconds) of when the user was created
formatunixtime
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) created_at>)
name: Optional[str]
The name of the user
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) name>)
object: Optional[str]
The object type, which is always organization.user
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) object>)
role: Optional[str]
Always `owner`
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) role>)
type: Optional[str]
Always `user`
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) type>)
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner>)
redacted\_value: str
The redacted value of the API key
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) redacted_value>)
value: Optional[str]
The value of the API key. Only shown on create.
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) value>)
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema)>)
### List all organization and project API keys.
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
page = client.admin.organization.admin\_api\_keys.list()
page = page.data[0]
print(page.id)`
```
```
`{
"object": "list",
"data": [
{
"object": "organization.admin\_api\_key",
"id": "key\_abc",
"name": "Main Admin Key",
"redacted\_value": "sk-admin...def",
"created\_at": 1711471533,
"last\_used\_at": 1711471534,
"owner": {
"type": "service\_account",
"object": "organization.service\_account",
"id": "sa\_456",
"name": "My Service Account",
"created\_at": 1711471533,
"role": "member"
}
}
],
"first\_id": "key\_abc",
"last\_id": "key\_abc",
"has\_more": false
}
`
```
##### Returns Examples
```
`{
"object": "list",
"data": [
{
"object": "organization.admin\_api\_key",
"id": "key\_abc",
"name": "Main Admin Key",
"redacted\_value": "sk-admin...def",
"created\_at": 1711471533,
"last\_used\_at": 1711471534,
"owner": {
"type": "service\_account",
"object": "organization.service\_account",
"id": "sa\_456",
"name": "My Service Account",
"created\_at": 1711471533,
"role": "member"
}
}
],
"first\_id": "key\_abc",
"last\_id": "key\_abc",
"has\_more": false
}
`
```