List project API keys | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Admin](/api/reference/ruby/resources/admin)
[Organization](/api/reference/ruby/resources/admin/subresources/organization)
[Projects](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects)
[API Keys](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/api_keys)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List project API keys
admin.organization.projects.api\_keys.list(project\_id, \*\*kwargs) -\> ConversationCursorPage\<[ProjectAPIKey](</api/reference/ruby/resources/admin#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema)>) { id, created\_at, last\_used\_at, 4 more } \>
GET/organization/projects/{project\_id}/api\_keys
Returns a list of API keys in the project.
##### ParametersExpand Collapse
project\_id: String
[](<#(resource) admin.organization.projects.api_keys > (method) list > (params) default > (param) project_id > (schema)>)
after: String
A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj\_foo, your subsequent call can include after=obj\_foo in order to fetch the next page of the list.
[](<#(resource) admin.organization.projects.api_keys > (method) list > (params) default > (param) after > (schema)>)
limit: Integer
A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
[](<#(resource) admin.organization.projects.api_keys > (method) list > (params) default > (param) limit > (schema)>)
##### ReturnsExpand Collapse
class ProjectAPIKey { id, created\_at, last\_used\_at, 4 more }
Represents an individual API key in a project.
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) id>)
created\_at: Integer
The Unix timestamp (in seconds) of when the API key was created
formatunixtime
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) created_at>)
last\_used\_at: Integer
The Unix timestamp (in seconds) of when the API key was last used.
formatunixtime
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) last_used_at>)
name: String
The name of the API key
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) name>)
object: :"organization.project.api\_key"
The object type, which is always `organization.project.api\_key`
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) object>)
owner: Owner{ service\_account, type, user}
service\_account: [ProjectServiceAccount](</api/reference/ruby/resources/admin#(resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema)>) { id, created\_at, name, 2 more }
Represents an individual service account in a project.
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) service_account + (resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) id>)
created\_at: Integer
The Unix timestamp (in seconds) of when the service account was created
formatunixtime
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) service_account + (resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) created_at>)
name: String
The name of the service account
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) service_account + (resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) name>)
object: :"organization.project.service\_account"
The object type, which is always `organization.project.service\_account`
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) service_account + (resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) object>)
role: :owner | :member
`owner` or `member`
One of the following:
:owner
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) service_account + (resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role > (member) 0>)
:member
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) service_account + (resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) service_account + (resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) service_account>)
type: :user | :service\_account
`user` or `service\_account`
One of the following:
:user
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) type > (member) 0>)
:service\_account
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) type > (member) 1>)
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) type>)
user: [ProjectUser](</api/reference/ruby/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>) { id, added\_at, email, 3 more }
Represents an individual user in a project.
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) user + (resource) admin.organization.projects.users > (model) project_user > (schema) > (property) id>)
added\_at: Integer
The Unix timestamp (in seconds) of when the project was added.
formatunixtime
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) user + (resource) admin.organization.projects.users > (model) project_user > (schema) > (property) added_at>)
email: String
The email address of the user
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) user + (resource) admin.organization.projects.users > (model) project_user > (schema) > (property) email>)
name: String
The name of the user
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) user + (resource) admin.organization.projects.users > (model) project_user > (schema) > (property) name>)
object: :"organization.project.user"
The object type, which is always `organization.project.user`
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) user + (resource) admin.organization.projects.users > (model) project_user > (schema) > (property) object>)
role: :owner | :member
`owner` or `member`
One of the following:
:owner
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) user + (resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role > (member) 0>)
:member
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) user + (resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) user + (resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) user>)
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner>)
redacted\_value: String
The redacted value of the API key
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) redacted_value>)
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema)>)
### List project API keys
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
page = openai.admin.organization.projects.api\_keys.list("project\_id")
puts(page)`
```
```
`{
"object": "list",
"data": [
{
"object": "organization.project.api\_key",
"redacted\_value": "sk-abc...def",
"name": "My API Key",
"created\_at": 1711471533,
"last\_used\_at": 1711471534,
"id": "key\_abc",
"owner": {
"type": "user",
"user": {
"object": "organization.project.user",
"id": "user\_abc",
"name": "First Last",
"email": "user@example.com",
"role": "owner",
"added\_at": 1711471533
}
}
}
],
"first\_id": "key\_abc",
"last\_id": "key\_xyz",
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
"object": "organization.project.api\_key",
"redacted\_value": "sk-abc...def",
"name": "My API Key",
"created\_at": 1711471533,
"last\_used\_at": 1711471534,
"id": "key\_abc",
"owner": {
"type": "user",
"user": {
"object": "organization.project.user",
"id": "user\_abc",
"name": "First Last",
"email": "user@example.com",
"role": "owner",
"added\_at": 1711471533
}
}
}
],
"first\_id": "key\_abc",
"last\_id": "key\_xyz",
"has\_more": false
}
`
```