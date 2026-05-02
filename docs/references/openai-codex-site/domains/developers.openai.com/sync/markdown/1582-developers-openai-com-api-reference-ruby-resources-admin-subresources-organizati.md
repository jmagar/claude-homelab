List all organization and project API keys. | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Admin](/api/reference/ruby/resources/admin)
[Organization](/api/reference/ruby/resources/admin/subresources/organization)
[Admin API Keys](/api/reference/ruby/resources/admin/subresources/organization/subresources/admin_api_keys)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List all organization and project API keys.
admin.organization.admin\_api\_keys.list(\*\*kwargs) -\> CursorPage\<[AdminAPIKey](</api/reference/ruby/resources/admin#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema)>) { id, created\_at, last\_used\_at, 5 more } \>
GET/organization/admin\_api\_keys
List organization API keys
##### ParametersExpand Collapse
after: String
Return keys with IDs that come after this ID in the pagination order.
[](<#(resource) admin.organization.admin_api_keys > (method) list > (params) default > (param) after > (schema)>)
limit: Integer
Maximum number of keys to return.
[](<#(resource) admin.organization.admin_api_keys > (method) list > (params) default > (param) limit > (schema)>)
order: :asc | :desc
Order results by creation time, ascending or descending.
One of the following:
:asc
[](<#(resource) admin.organization.admin_api_keys > (method) list > (params) default > (param) order > (schema) > (member) 0>)
:desc
[](<#(resource) admin.organization.admin_api_keys > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) admin.organization.admin_api_keys > (method) list > (params) default > (param) order > (schema)>)
##### ReturnsExpand Collapse
class AdminAPIKey { id, created\_at, last\_used\_at, 5 more }
Represents an individual Admin API key in an org.
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) id>)
created\_at: Integer
The Unix timestamp (in seconds) of when the API key was created
formatunixtime
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) created_at>)
last\_used\_at: Integer
The Unix timestamp (in seconds) of when the API key was last used
formatunixtime
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) last_used_at>)
name: String
The name of the API key
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) name>)
object: String
The object type, which is always `organization.admin\_api\_key`
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) object>)
owner: Owner{ id, created\_at, name, 3 more}
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) id>)
created\_at: Integer
The Unix timestamp (in seconds) of when the user was created
formatunixtime
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) created_at>)
name: String
The name of the user
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) name>)
object: String
The object type, which is always organization.user
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) object>)
role: String
Always `owner`
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) role>)
type: String
Always `user`
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) type>)
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner>)
redacted\_value: String
The redacted value of the API key
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) redacted_value>)
value: String
The value of the API key. Only shown on create.
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) value>)
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema)>)
### List all organization and project API keys.
Ruby
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
`require "openai"
openai = OpenAI::Client.new(admin\_api\_key: "My Admin API Key")
page = openai.admin.organization.admin\_api\_keys.list
puts(page)`
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