Retrieve project API key | OpenAI API Reference
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
# Retrieve project API key
admin.organization.projects.api\_keys.retrieve(strkey\_id, APIKeyRetrieveParams\*\*kwargs) -\> [ProjectAPIKey](</api/reference/python/resources/admin#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema)>)
GET/organization/projects/{project\_id}/api\_keys/{key\_id}
Retrieves an API key in the project.
##### ParametersExpand Collapse
project\_id: str
[](<#(resource) admin.organization.projects.api_keys > (method) retrieve > (params) default > (param) project_id > (schema)>)
key\_id: str
[](<#(resource) admin.organization.projects.api_keys > (method) retrieve > (params) default > (param) key_id > (schema)>)
##### ReturnsExpand Collapse
class ProjectAPIKey: …
Represents an individual API key in a project.
id: str
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) id>)
created\_at: int
The Unix timestamp (in seconds) of when the API key was created
formatunixtime
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) created_at>)
last\_used\_at: int
The Unix timestamp (in seconds) of when the API key was last used.
formatunixtime
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) last_used_at>)
name: str
The name of the API key
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) name>)
object: Literal["organization.project.api\_key"]
The object type, which is always `organization.project.api\_key`
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) object>)
owner: Owner
service\_account: Optional[ProjectServiceAccount]
Represents an individual service account in a project.
id: str
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) service_account + (resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) id>)
created\_at: int
The Unix timestamp (in seconds) of when the service account was created
formatunixtime
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) service_account + (resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) created_at>)
name: str
The name of the service account
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) service_account + (resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) name>)
object: Literal["organization.project.service\_account"]
The object type, which is always `organization.project.service\_account`
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) service_account + (resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) object>)
role: Literal["owner", "member"]
`owner` or `member`
One of the following:
"owner"
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) service_account + (resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role > (member) 0>)
"member"
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) service_account + (resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) service_account + (resource) admin.organization.projects.service_accounts > (model) project_service_account > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) service_account>)
type: Optional[Literal["user", "service\_account"]]
`user` or `service\_account`
One of the following:
"user"
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) type > (member) 0>)
"service\_account"
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) type > (member) 1>)
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) type>)
user: Optional[ProjectUser]
Represents an individual user in a project.
id: str
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) user + (resource) admin.organization.projects.users > (model) project_user > (schema) > (property) id>)
added\_at: int
The Unix timestamp (in seconds) of when the project was added.
formatunixtime
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) user + (resource) admin.organization.projects.users > (model) project_user > (schema) > (property) added_at>)
email: str
The email address of the user
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) user + (resource) admin.organization.projects.users > (model) project_user > (schema) > (property) email>)
name: str
The name of the user
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) user + (resource) admin.organization.projects.users > (model) project_user > (schema) > (property) name>)
object: Literal["organization.project.user"]
The object type, which is always `organization.project.user`
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) user + (resource) admin.organization.projects.users > (model) project_user > (schema) > (property) object>)
role: Literal["owner", "member"]
`owner` or `member`
One of the following:
"owner"
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) user + (resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role > (member) 0>)
"member"
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) user + (resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) user + (resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner > (property) user>)
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) owner>)
redacted\_value: str
The redacted value of the API key
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema) > (property) redacted_value>)
[](<#(resource) admin.organization.projects.api_keys > (model) project_api_key > (schema)>)
### Retrieve project API key
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
project\_api\_key = client.admin.organization.projects.api\_keys.retrieve(
key\_id="key\_id",
project\_id="project\_id",
)
print(project\_api\_key.id)`
```
```
`{
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
`
```
##### Returns Examples
```
`{
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
`
```