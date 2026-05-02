List all organization and project API keys. | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Admin](/api/reference/typescript/resources/admin)
[Organization](/api/reference/typescript/resources/admin/subresources/organization)
[Admin API Keys](/api/reference/typescript/resources/admin/subresources/organization/subresources/admin_api_keys)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List all organization and project API keys.
client.admin.organization.adminAPIKeys.list(AdminAPIKeyListParams { after, limit, order } query?, RequestOptionsoptions?): CursorPage\<[AdminAPIKey](</api/reference/typescript/resources/admin#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema)>) { id, created\_at, last\_used\_at, 5 more } \>
GET/organization/admin\_api\_keys
List organization API keys
##### ParametersExpand Collapse
query: AdminAPIKeyListParams { after, limit, order }
after?: string | null
Return keys with IDs that come after this ID in the pagination order.
[](<#(resource) admin.organization.admin_api_keys > (method) list > (params) default > (param) after>)
limit?: number
Maximum number of keys to return.
[](<#(resource) admin.organization.admin_api_keys > (method) list > (params) default > (param) limit>)
order?: "asc" | "desc"
Order results by creation time, ascending or descending.
One of the following:
"asc"
[](<#(resource) admin.organization.admin_api_keys > (method) list > (params) default > (param) order > (schema) > (member) 0>)
"desc"
[](<#(resource) admin.organization.admin_api_keys > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) admin.organization.admin_api_keys > (method) list > (params) default > (param) order>)
[](<#(resource) admin.organization.admin_api_keys > (method) list > (params) default>)
##### ReturnsExpand Collapse
AdminAPIKey { id, created\_at, last\_used\_at, 5 more }
Represents an individual Admin API key in an org.
id: string
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) id>)
created\_at: number
The Unix timestamp (in seconds) of when the API key was created
formatunixtime
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) created_at>)
last\_used\_at: number | null
The Unix timestamp (in seconds) of when the API key was last used
formatunixtime
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) last_used_at>)
name: string
The name of the API key
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) name>)
object: string
The object type, which is always `organization.admin\_api\_key`
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) object>)
owner: Owner { id, created\_at, name, 3 more }
id?: string
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) id>)
created\_at?: number
The Unix timestamp (in seconds) of when the user was created
formatunixtime
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) created_at>)
name?: string
The name of the user
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) name>)
object?: string
The object type, which is always organization.user
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) object>)
role?: string
Always `owner`
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) role>)
type?: string
Always `user`
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner > (property) type>)
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) owner>)
redacted\_value: string
The redacted value of the API key
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) redacted_value>)
value?: string
The value of the API key. Only shown on create.
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema) > (property) value>)
[](<#(resource) admin.organization.admin_api_keys > (model) admin_api_key > (schema)>)
### List all organization and project API keys.
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
// Automatically fetches more pages as needed.
for await (const adminAPIKey of client.admin.organization.adminAPIKeys.list()) {
console.log(adminAPIKey.id);
}`
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