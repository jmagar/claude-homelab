Projects | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/terraform)
[Admin](/api/reference/terraform/resources/admin)
[Organization](/api/reference/terraform/resources/admin/subresources/organization)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Projects
#### resource openai\_admin\_organization\_project
##### required Expand Collapse
name: String
The friendly name of the project, this name appears in reports.
[](<#(resource) admin.organization.projects > (terraform resource) > (attribute) name>)
##### optional Expand Collapse
geography?: String
Create the project with the specified data residency region. Your organization must have access to Data residency functionality in order to use. See [data residency controls](https://platform.openai.com/docs/guides/your-data#data-residency-controls) to review the functionality and limitations of setting this field.
[](<#(resource) admin.organization.projects > (terraform resource) > (attribute) geography>)
##### computed Expand Collapse
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects > (terraform resource) > (attribute) id>)
archived\_at: Int64
The Unix timestamp (in seconds) of when the project was archived or `null`.
[](<#(resource) admin.organization.projects > (terraform resource) > (attribute) archived_at>)
created\_at: Int64
The Unix timestamp (in seconds) of when the project was created.
[](<#(resource) admin.organization.projects > (terraform resource) > (attribute) created_at>)
object: String
The object type, which is always `organization.project`
[](<#(resource) admin.organization.projects > (terraform resource) > (attribute) object>)
status: String
`active` or `archived`
[](<#(resource) admin.organization.projects > (terraform resource) > (attribute) status>)
### openai\_admin\_organization\_project
Terraform
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
`resource "openai\_admin\_organization\_project" "example\_admin\_organization\_project" {
name = "name"
geography = "US"
}
`
```
#### data openai\_admin\_organization\_project
##### optional Expand Collapse
project\_id?: String
[](<#(resource) admin.organization.projects > (terraform datasource-single) > (attribute) project_id>)
find\_one\_by?: Attributes
include\_archived?: Bool
If `true` returns all projects including those that have been `archived`. Archived projects are not included by default.
[](<#(resource) admin.organization.projects > (terraform datasource-single) > (attribute) find_one_by > (attribute) include_archived>)
[](<#(resource) admin.organization.projects > (terraform datasource-single) > (attribute) find_one_by>)
##### computed Expand Collapse
id: String
[](<#(resource) admin.organization.projects > (terraform datasource-single) > (attribute) id>)
archived\_at: Int64
The Unix timestamp (in seconds) of when the project was archived or `null`.
[](<#(resource) admin.organization.projects > (terraform datasource-single) > (attribute) archived_at>)
created\_at: Int64
The Unix timestamp (in seconds) of when the project was created.
[](<#(resource) admin.organization.projects > (terraform datasource-single) > (attribute) created_at>)
name: String
The name of the project. This appears in reporting.
[](<#(resource) admin.organization.projects > (terraform datasource-single) > (attribute) name>)
object: String
The object type, which is always `organization.project`
[](<#(resource) admin.organization.projects > (terraform datasource-single) > (attribute) object>)
status: String
`active` or `archived`
[](<#(resource) admin.organization.projects > (terraform datasource-single) > (attribute) status>)
### openai\_admin\_organization\_project
Terraform
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
`data "openai\_admin\_organization\_project" "example\_admin\_organization\_project" {
project\_id = "project\_id"
}
`
```
#### data openai\_admin\_organization\_projects
##### optional Expand Collapse
include\_archived?: Bool
If `true` returns all projects including those that have been `archived`. Archived projects are not included by default.
[](<#(resource) admin.organization.projects > (terraform datasource-plural) > (attribute) include_archived>)
max\_items?: Int64
Max items to fetch, default: 1000
[](<#(resource) admin.organization.projects > (terraform datasource-plural) > (attribute) max_items>)
##### computed Expand Collapse
items: List[Attributes]
The items returned by the data source
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects > (terraform datasource-plural) > (attribute) items > (attribute) id>)
created\_at: Int64
The Unix timestamp (in seconds) of when the project was created.
[](<#(resource) admin.organization.projects > (terraform datasource-plural) > (attribute) items > (attribute) created_at>)
name: String
The name of the project. This appears in reporting.
[](<#(resource) admin.organization.projects > (terraform datasource-plural) > (attribute) items > (attribute) name>)
object: String
The object type, which is always `organization.project`
[](<#(resource) admin.organization.projects > (terraform datasource-plural) > (attribute) items > (attribute) object>)
status: String
`active` or `archived`
[](<#(resource) admin.organization.projects > (terraform datasource-plural) > (attribute) items > (attribute) status>)
archived\_at: Int64
The Unix timestamp (in seconds) of when the project was archived or `null`.
[](<#(resource) admin.organization.projects > (terraform datasource-plural) > (attribute) items > (attribute) archived_at>)
[](<#(resource) admin.organization.projects > (terraform datasource-plural) > (attribute) items>)
### openai\_admin\_organization\_projects
Terraform
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
`data "openai\_admin\_organization\_projects" "example\_admin\_organization\_projects" {
}
`
```
#### ProjectsUsers
#### resource openai\_admin\_organization\_project\_user
##### required Expand Collapse
project\_id: String
[](<#(resource) admin.organization.projects.users > (terraform resource) > (attribute) project_id>)
user\_id: String
The ID of the user.
[](<#(resource) admin.organization.projects.users > (terraform resource) > (attribute) user_id>)
role: String
`owner` or `member`
[](<#(resource) admin.organization.projects.users > (terraform resource) > (attribute) role>)
##### computed Expand Collapse
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.users > (terraform resource) > (attribute) id>)
added\_at: Int64
The Unix timestamp (in seconds) of when the project was added.
[](<#(resource) admin.organization.projects.users > (terraform resource) > (attribute) added_at>)
email: String
The email address of the user
[](<#(resource) admin.organization.projects.users > (terraform resource) > (attribute) email>)
name: String
The name of the user
[](<#(resource) admin.organization.projects.users > (terraform resource) > (attribute) name>)
object: String
The object type, which is always `organization.project.user`
[](<#(resource) admin.organization.projects.users > (terraform resource) > (attribute) object>)
### openai\_admin\_organization\_project\_user
Terraform
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
`resource "openai\_admin\_organization\_project\_user" "example\_admin\_organization\_project\_user" {
project\_id = "project\_id"
role = "owner"
user\_id = "user\_id"
}
`
```
#### data openai\_admin\_organization\_project\_user
##### required Expand Collapse
user\_id: String
[](<#(resource) admin.organization.projects.users > (terraform datasource-single) > (attribute) user_id>)
project\_id: String
[](<#(resource) admin.organization.projects.users > (terraform datasource-single) > (attribute) project_id>)
##### computed Expand Collapse
id: String
[](<#(resource) admin.organization.projects.users > (terraform datasource-single) > (attribute) id>)
added\_at: Int64
The Unix timestamp (in seconds) of when the project was added.
[](<#(resource) admin.organization.projects.users > (terraform datasource-single) > (attribute) added_at>)
email: String
The email address of the user
[](<#(resource) admin.organization.projects.users > (terraform datasource-single) > (attribute) email>)
name: String
The name of the user
[](<#(resource) admin.organization.projects.users > (terraform datasource-single) > (attribute) name>)
object: String
The object type, which is always `organization.project.user`
[](<#(resource) admin.organization.projects.users > (terraform datasource-single) > (attribute) object>)
role: String
`owner` or `member`
[](<#(resource) admin.organization.projects.users > (terraform datasource-single) > (attribute) role>)
### openai\_admin\_organization\_project\_user
Terraform
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
`data "openai\_admin\_organization\_project\_user" "example\_admin\_organization\_project\_user" {
project\_id = "project\_id"
user\_id = "user\_id"
}
`
```
#### data openai\_admin\_organization\_project\_users
##### required Expand Collapse
project\_id: String
[](<#(resource) admin.organization.projects.users > (terraform datasource-plural) > (attribute) project_id>)
##### optional Expand Collapse
max\_items?: Int64
Max items to fetch, default: 1000
[](<#(resource) admin.organization.projects.users > (terraform datasource-plural) > (attribute) max_items>)
##### computed Expand Collapse
items: List[Attributes]
The items returned by the data source
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.users > (terraform datasource-plural) > (attribute) items > (attribute) id>)
added\_at: Int64
The Unix timestamp (in seconds) of when the project was added.
[](<#(resource) admin.organization.projects.users > (terraform datasource-plural) > (attribute) items > (attribute) added_at>)
email: String
The email address of the user
[](<#(resource) admin.organization.projects.users > (terraform datasource-plural) > (attribute) items > (attribute) email>)
name: String
The name of the user
[](<#(resource) admin.organization.projects.users > (terraform datasource-plural) > (attribute) items > (attribute) name>)
object: String
The object type, which is always `organization.project.user`
[](<#(resource) admin.organization.projects.users > (terraform datasource-plural) > (attribute) items > (attribute) object>)
role: String
`owner` or `member`
[](<#(resource) admin.organization.projects.users > (terraform datasource-plural) > (attribute) items > (attribute) role>)
[](<#(resource) admin.organization.projects.users > (terraform datasource-plural) > (attribute) items>)
### openai\_admin\_organization\_project\_users
Terraform
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
`data "openai\_admin\_organization\_project\_users" "example\_admin\_organization\_project\_users" {
project\_id = "project\_id"
}
`
```
#### ProjectsUsersRoles
#### resource openai\_admin\_organization\_project\_user\_role
##### required Expand Collapse
project\_id: String
[](<#(resource) admin.organization.projects.users.roles > (terraform resource) > (attribute) project_id>)
user\_id: String
[](<#(resource) admin.organization.projects.users.roles > (terraform resource) > (attribute) user_id>)
role\_id: String
Identifier of the role to assign.
[](<#(resource) admin.organization.projects.users.roles > (terraform resource) > (attribute) role_id>)
##### computed Expand Collapse
object: String
Always `user.role`.
[](<#(resource) admin.organization.projects.users.roles > (terraform resource) > (attribute) object>)
role: Attributes
Details about a role that can be assigned through the public Roles API.
id: String
Identifier for the role.
[](<#(resource) admin.organization.projects.users.roles > (terraform resource) > (attribute) role > (attribute) id>)
description: String
Optional description of the role.
[](<#(resource) admin.organization.projects.users.roles > (terraform resource) > (attribute) role > (attribute) description>)
name: String
Unique name for the role.
[](<#(resource) admin.organization.projects.users.roles > (terraform resource) > (attribute) role > (attribute) name>)
object: String
Always `role`.
[](<#(resource) admin.organization.projects.users.roles > (terraform resource) > (attribute) role > (attribute) object>)
permissions: List[String]
Permissions granted by the role.
[](<#(resource) admin.organization.projects.users.roles > (terraform resource) > (attribute) role > (attribute) permissions>)
predefined\_role: Bool
Whether the role is predefined and managed by OpenAI.
[](<#(resource) admin.organization.projects.users.roles > (terraform resource) > (attribute) role > (attribute) predefined_role>)
resource\_type: String
Resource type the role is bound to (for example `api.organization` or `api.project`).
[](<#(resource) admin.organization.projects.users.roles > (terraform resource) > (attribute) role > (attribute) resource_type>)
[](<#(resource) admin.organization.projects.users.roles > (terraform resource) > (attribute) role>)
user: Attributes
Represents an individual `user` within an organization.
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.users.roles > (terraform resource) > (attribute) user > (attribute) id>)
added\_at: Int64
The Unix timestamp (in seconds) of when the user was added.
[](<#(resource) admin.organization.projects.users.roles > (terraform resource) > (attribute) user > (attribute) added_at>)
email: String
The email address of the user
[](<#(resource) admin.organization.projects.users.roles > (terraform resource) > (attribute) user > (attribute) email>)
name: String
The name of the user
[](<#(resource) admin.organization.projects.users.roles > (terraform resource) > (attribute) user > (attribute) name>)
object: String
The object type, which is always `organization.user`
[](<#(resource) admin.organization.projects.users.roles > (terraform resource) > (attribute) user > (attribute) object>)
role: String
`owner` or `reader`
[](<#(resource) admin.organization.projects.users.roles > (terraform resource) > (attribute) user > (attribute) role>)
[](<#(resource) admin.organization.projects.users.roles > (terraform resource) > (attribute) user>)
### openai\_admin\_organization\_project\_user\_role
Terraform
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
`resource "openai\_admin\_organization\_project\_user\_role" "example\_admin\_organization\_project\_user\_role" {
project\_id = "project\_id"
user\_id = "user\_id"
role\_id = "role\_id"
}
`
```
#### data openai\_admin\_organization\_project\_user\_roles
##### required Expand Collapse
project\_id: String
[](<#(resource) admin.organization.projects.users.roles > (terraform datasource-plural) > (attribute) project_id>)
user\_id: String
[](<#(resource) admin.organization.projects.users.roles > (terraform datasource-plural) > (attribute) user_id>)
##### optional Expand Collapse
order?: String
Sort order for the returned project roles.
[](<#(resource) admin.organization.projects.users.roles > (terraform datasource-plural) > (attribute) order>)
max\_items?: Int64
Max items to fetch, default: 1000
[](<#(resource) admin.organization.projects.users.roles > (terraform datasource-plural) > (attribute) max_items>)
##### computed Expand Collapse
items: List[Attributes]
The items returned by the data source
id: String
Identifier for the role.
[](<#(resource) admin.organization.projects.users.roles > (terraform datasource-plural) > (attribute) items > (attribute) id>)
created\_at: Int64
When the role was created.
[](<#(resource) admin.organization.projects.users.roles > (terraform datasource-plural) > (attribute) items > (attribute) created_at>)
created\_by: String
Identifier of the actor who created the role.
[](<#(resource) admin.organization.projects.users.roles > (terraform datasource-plural) > (attribute) items > (attribute) created_by>)
created\_by\_user\_obj: Map[JSON]
User details for the actor that created the role, when available.
[](<#(resource) admin.organization.projects.users.roles > (terraform datasource-plural) > (attribute) items > (attribute) created_by_user_obj>)
description: String
Description of the role.
[](<#(resource) admin.organization.projects.users.roles > (terraform datasource-plural) > (attribute) items > (attribute) description>)
metadata: Map[JSON]
Arbitrary metadata stored on the role.
[](<#(resource) admin.organization.projects.users.roles > (terraform datasource-plural) > (attribute) items > (attribute) metadata>)
name: String
Name of the role.
[](<#(resource) admin.organization.projects.users.roles > (terraform datasource-plural) > (attribute) items > (attribute) name>)
permissions: List[String]
Permissions associated with the role.
[](<#(resource) admin.organization.projects.users.roles > (terraform datasource-plural) > (attribute) items > (attribute) permissions>)
predefined\_role: Bool
Whether the role is predefined by OpenAI.
[](<#(resource) admin.organization.projects.users.roles > (terraform datasource-plural) > (attribute) items > (attribute) predefined_role>)
resource\_type: String
Resource type the role applies to.
[](<#(resource) admin.organization.projects.users.roles > (terraform datasource-plural) > (attribute) items > (attribute) resource_type>)
updated\_at: Int64
When the role was last updated.
[](<#(resource) admin.organization.projects.users.roles > (terraform datasource-plural) > (attribute) items > (attribute) updated_at>)
[](<#(resource) admin.organization.projects.users.roles > (terraform datasource-plural) > (attribute) items>)
### openai\_admin\_organization\_project\_user\_roles
Terraform
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
`data "openai\_admin\_organization\_project\_user\_roles" "example\_admin\_organization\_project\_user\_roles" {
project\_id = "project\_id"
user\_id = "user\_id"
order = "asc"
}
`
```
#### ProjectsService Accounts
#### resource openai\_admin\_organization\_project\_service\_account
##### required Expand Collapse
project\_id: String
[](<#(resource) admin.organization.projects.service_accounts > (terraform resource) > (attribute) project_id>)
name: String
The name of the service account being created.
[](<#(resource) admin.organization.projects.service_accounts > (terraform resource) > (attribute) name>)
##### computed Expand Collapse
id: String
[](<#(resource) admin.organization.projects.service_accounts > (terraform resource) > (attribute) id>)
created\_at: Int64
The Unix timestamp (in seconds) of when the service account was created
[](<#(resource) admin.organization.projects.service_accounts > (terraform resource) > (attribute) created_at>)
object: String
The object type, which is always `organization.project.service\_account`
[](<#(resource) admin.organization.projects.service_accounts > (terraform resource) > (attribute) object>)
role: String
`owner` or `member`
[](<#(resource) admin.organization.projects.service_accounts > (terraform resource) > (attribute) role>)
api\_key: Attributes
id: String
[](<#(resource) admin.organization.projects.service_accounts > (terraform resource) > (attribute) api_key > (attribute) id>)
created\_at: Int64
[](<#(resource) admin.organization.projects.service_accounts > (terraform resource) > (attribute) api_key > (attribute) created_at>)
name: String
[](<#(resource) admin.organization.projects.service_accounts > (terraform resource) > (attribute) api_key > (attribute) name>)
object: String
The object type, which is always `organization.project.service\_account.api\_key`
[](<#(resource) admin.organization.projects.service_accounts > (terraform resource) > (attribute) api_key > (attribute) object>)
value: String
[](<#(resource) admin.organization.projects.service_accounts > (terraform resource) > (attribute) api_key > (attribute) value>)
[](<#(resource) admin.organization.projects.service_accounts > (terraform resource) > (attribute) api_key>)
### openai\_admin\_organization\_project\_service\_account
Terraform
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
`resource "openai\_admin\_organization\_project\_service\_account" "example\_admin\_organization\_project\_service\_account" {
project\_id = "project\_id"
name = "name"
}
`
```
#### data openai\_admin\_organization\_project\_service\_account
##### required Expand Collapse
service\_account\_id: String
[](<#(resource) admin.organization.projects.service_accounts > (terraform datasource-single) > (attribute) service_account_id>)
project\_id: String
[](<#(resource) admin.organization.projects.service_accounts > (terraform datasource-single) > (attribute) project_id>)
##### computed Expand Collapse
id: String
[](<#(resource) admin.organization.projects.service_accounts > (terraform datasource-single) > (attribute) id>)
created\_at: Int64
The Unix timestamp (in seconds) of when the service account was created
[](<#(resource) admin.organization.projects.service_accounts > (terraform datasource-single) > (attribute) created_at>)
name: String
The name of the service account
[](<#(resource) admin.organization.projects.service_accounts > (terraform datasource-single) > (attribute) name>)
object: String
The object type, which is always `organization.project.service\_account`
[](<#(resource) admin.organization.projects.service_accounts > (terraform datasource-single) > (attribute) object>)
role: String
`owner` or `member`
[](<#(resource) admin.organization.projects.service_accounts > (terraform datasource-single) > (attribute) role>)
### openai\_admin\_organization\_project\_service\_account
Terraform
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
`data "openai\_admin\_organization\_project\_service\_account" "example\_admin\_organization\_project\_service\_account" {
project\_id = "project\_id"
service\_account\_id = "service\_account\_id"
}
`
```
#### data openai\_admin\_organization\_project\_service\_accounts
##### required Expand Collapse
project\_id: String
[](<#(resource) admin.organization.projects.service_accounts > (terraform datasource-plural) > (attribute) project_id>)
##### optional Expand Collapse
max\_items?: Int64
Max items to fetch, default: 1000
[](<#(resource) admin.organization.projects.service_accounts > (terraform datasource-plural) > (attribute) max_items>)
##### computed Expand Collapse
items: List[Attributes]
The items returned by the data source
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.service_accounts > (terraform datasource-plural) > (attribute) items > (attribute) id>)
created\_at: Int64
The Unix timestamp (in seconds) of when the service account was created
[](<#(resource) admin.organization.projects.service_accounts > (terraform datasource-plural) > (attribute) items > (attribute) created_at>)
name: String
The name of the service account
[](<#(resource) admin.organization.projects.service_accounts > (terraform datasource-plural) > (attribute) items > (attribute) name>)
object: String
The object type, which is always `organization.project.service\_account`
[](<#(resource) admin.organization.projects.service_accounts > (terraform datasource-plural) > (attribute) items > (attribute) object>)
role: String
`owner` or `member`
[](<#(resource) admin.organization.projects.service_accounts > (terraform datasource-plural) > (attribute) items > (attribute) role>)
[](<#(resource) admin.organization.projects.service_accounts > (terraform datasource-plural) > (attribute) items>)
### openai\_admin\_organization\_project\_service\_accounts
Terraform
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
`data "openai\_admin\_organization\_project\_service\_accounts" "example\_admin\_organization\_project\_service\_accounts" {
project\_id = "project\_id"
}
`
```
#### ProjectsAPI Keys
#### data openai\_admin\_organization\_project\_api\_key
##### required Expand Collapse
key\_id: String
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-single) > (attribute) key_id>)
project\_id: String
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-single) > (attribute) project_id>)
##### computed Expand Collapse
created\_at: Int64
The Unix timestamp (in seconds) of when the API key was created
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-single) > (attribute) created_at>)
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-single) > (attribute) id>)
last\_used\_at: Int64
The Unix timestamp (in seconds) of when the API key was last used.
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-single) > (attribute) last_used_at>)
name: String
The name of the API key
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-single) > (attribute) name>)
object: String
The object type, which is always `organization.project.api\_key`
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-single) > (attribute) object>)
redacted\_value: String
The redacted value of the API key
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-single) > (attribute) redacted_value>)
owner: Attributes
service\_account: Attributes
Represents an individual service account in a project.
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-single) > (attribute) owner > (attribute) service_account > (attribute) id>)
created\_at: Int64
The Unix timestamp (in seconds) of when the service account was created
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-single) > (attribute) owner > (attribute) service_account > (attribute) created_at>)
name: String
The name of the service account
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-single) > (attribute) owner > (attribute) service_account > (attribute) name>)
object: String
The object type, which is always `organization.project.service\_account`
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-single) > (attribute) owner > (attribute) service_account > (attribute) object>)
role: String
`owner` or `member`
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-single) > (attribute) owner > (attribute) service_account > (attribute) role>)
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-single) > (attribute) owner > (attribute) service_account>)
type: String
`user` or `service\_account`
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-single) > (attribute) owner > (attribute) type>)
user: Attributes
Represents an individual user in a project.
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-single) > (attribute) owner > (attribute) user > (attribute) id>)
added\_at: Int64
The Unix timestamp (in seconds) of when the project was added.
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-single) > (attribute) owner > (attribute) user > (attribute) added_at>)
email: String
The email address of the user
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-single) > (attribute) owner > (attribute) user > (attribute) email>)
name: String
The name of the user
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-single) > (attribute) owner > (attribute) user > (attribute) name>)
object: String
The object type, which is always `organization.project.user`
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-single) > (attribute) owner > (attribute) user > (attribute) object>)
role: String
`owner` or `member`
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-single) > (attribute) owner > (attribute) user > (attribute) role>)
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-single) > (attribute) owner > (attribute) user>)
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-single) > (attribute) owner>)
### openai\_admin\_organization\_project\_api\_key
Terraform
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
`data "openai\_admin\_organization\_project\_api\_key" "example\_admin\_organization\_project\_api\_key" {
project\_id = "project\_id"
key\_id = "key\_id"
}
`
```
#### data openai\_admin\_organization\_project\_api\_keys
##### required Expand Collapse
project\_id: String
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-plural) > (attribute) project_id>)
##### optional Expand Collapse
max\_items?: Int64
Max items to fetch, default: 1000
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-plural) > (attribute) max_items>)
##### computed Expand Collapse
items: List[Attributes]
The items returned by the data source
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-plural) > (attribute) items > (attribute) id>)
created\_at: Int64
The Unix timestamp (in seconds) of when the API key was created
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-plural) > (attribute) items > (attribute) created_at>)
last\_used\_at: Int64
The Unix timestamp (in seconds) of when the API key was last used.
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-plural) > (attribute) items > (attribute) last_used_at>)
name: String
The name of the API key
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-plural) > (attribute) items > (attribute) name>)
object: String
The object type, which is always `organization.project.api\_key`
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-plural) > (attribute) items > (attribute) object>)
owner: Attributes
service\_account: Attributes
Represents an individual service account in a project.
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-plural) > (attribute) items > (attribute) owner > (attribute) service_account > (attribute) id>)
created\_at: Int64
The Unix timestamp (in seconds) of when the service account was created
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-plural) > (attribute) items > (attribute) owner > (attribute) service_account > (attribute) created_at>)
name: String
The name of the service account
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-plural) > (attribute) items > (attribute) owner > (attribute) service_account > (attribute) name>)
object: String
The object type, which is always `organization.project.service\_account`
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-plural) > (attribute) items > (attribute) owner > (attribute) service_account > (attribute) object>)
role: String
`owner` or `member`
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-plural) > (attribute) items > (attribute) owner > (attribute) service_account > (attribute) role>)
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-plural) > (attribute) items > (attribute) owner > (attribute) service_account>)
type: String
`user` or `service\_account`
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-plural) > (attribute) items > (attribute) owner > (attribute) type>)
user: Attributes
Represents an individual user in a project.
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-plural) > (attribute) items > (attribute) owner > (attribute) user > (attribute) id>)
added\_at: Int64
The Unix timestamp (in seconds) of when the project was added.
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-plural) > (attribute) items > (attribute) owner > (attribute) user > (attribute) added_at>)
email: String
The email address of the user
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-plural) > (attribute) items > (attribute) owner > (attribute) user > (attribute) email>)
name: String
The name of the user
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-plural) > (attribute) items > (attribute) owner > (attribute) user > (attribute) name>)
object: String
The object type, which is always `organization.project.user`
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-plural) > (attribute) items > (attribute) owner > (attribute) user > (attribute) object>)
role: String
`owner` or `member`
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-plural) > (attribute) items > (attribute) owner > (attribute) user > (attribute) role>)
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-plural) > (attribute) items > (attribute) owner > (attribute) user>)
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-plural) > (attribute) items > (attribute) owner>)
redacted\_value: String
The redacted value of the API key
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-plural) > (attribute) items > (attribute) redacted_value>)
[](<#(resource) admin.organization.projects.api_keys > (terraform datasource-plural) > (attribute) items>)
### openai\_admin\_organization\_project\_api\_keys
Terraform
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
`data "openai\_admin\_organization\_project\_api\_keys" "example\_admin\_organization\_project\_api\_keys" {
project\_id = "project\_id"
}
`
```
#### ProjectsGroups
#### resource openai\_admin\_organization\_project\_group
##### required Expand Collapse
project\_id: String
[](<#(resource) admin.organization.projects.groups > (terraform resource) > (attribute) project_id>)
group\_id: String
Identifier of the group to add to the project.
[](<#(resource) admin.organization.projects.groups > (terraform resource) > (attribute) group_id>)
role: String
Identifier of the project role to grant to the group.
[](<#(resource) admin.organization.projects.groups > (terraform resource) > (attribute) role>)
##### computed Expand Collapse
created\_at: Int64
Unix timestamp (in seconds) when the group was granted project access.
[](<#(resource) admin.organization.projects.groups > (terraform resource) > (attribute) created_at>)
group\_name: String
Display name of the group.
[](<#(resource) admin.organization.projects.groups > (terraform resource) > (attribute) group_name>)
object: String
Always `project.group`.
[](<#(resource) admin.organization.projects.groups > (terraform resource) > (attribute) object>)
### openai\_admin\_organization\_project\_group
Terraform
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
`resource "openai\_admin\_organization\_project\_group" "example\_admin\_organization\_project\_group" {
project\_id = "project\_id"
group\_id = "group\_id"
role = "role"
}
`
```
#### data openai\_admin\_organization\_project\_groups
##### required Expand Collapse
project\_id: String
[](<#(resource) admin.organization.projects.groups > (terraform datasource-plural) > (attribute) project_id>)
##### optional Expand Collapse
order?: String
Sort order for the returned groups.
[](<#(resource) admin.organization.projects.groups > (terraform datasource-plural) > (attribute) order>)
max\_items?: Int64
Max items to fetch, default: 1000
[](<#(resource) admin.organization.projects.groups > (terraform datasource-plural) > (attribute) max_items>)
##### computed Expand Collapse
items: List[Attributes]
The items returned by the data source
created\_at: Int64
Unix timestamp (in seconds) when the group was granted project access.
[](<#(resource) admin.organization.projects.groups > (terraform datasource-plural) > (attribute) items > (attribute) created_at>)
group\_id: String
Identifier of the group that has access to the project.
[](<#(resource) admin.organization.projects.groups > (terraform datasource-plural) > (attribute) items > (attribute) group_id>)
group\_name: String
Display name of the group.
[](<#(resource) admin.organization.projects.groups > (terraform datasource-plural) > (attribute) items > (attribute) group_name>)
object: String
Always `project.group`.
[](<#(resource) admin.organization.projects.groups > (terraform datasource-plural) > (attribute) items > (attribute) object>)
project\_id: String
Identifier of the project.
[](<#(resource) admin.organization.projects.groups > (terraform datasource-plural) > (attribute) items > (attribute) project_id>)
[](<#(resource) admin.organization.projects.groups > (terraform datasource-plural) > (attribute) items>)
### openai\_admin\_organization\_project\_groups
Terraform
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
`data "openai\_admin\_organization\_project\_groups" "example\_admin\_organization\_project\_groups" {
project\_id = "project\_id"
}
`
```
#### ProjectsGroupsRoles
#### resource openai\_admin\_organization\_project\_group\_role
##### required Expand Collapse
group\_id: String
[](<#(resource) admin.organization.projects.groups.roles > (terraform resource) > (attribute) group_id>)
project\_id: String
[](<#(resource) admin.organization.projects.groups.roles > (terraform resource) > (attribute) project_id>)
role\_id: String
Identifier of the role to assign.
[](<#(resource) admin.organization.projects.groups.roles > (terraform resource) > (attribute) role_id>)
##### computed Expand Collapse
object: String
Always `group.role`.
[](<#(resource) admin.organization.projects.groups.roles > (terraform resource) > (attribute) object>)
group: Attributes
Summary information about a group returned in role assignment responses.
id: String
Identifier for the group.
[](<#(resource) admin.organization.projects.groups.roles > (terraform resource) > (attribute) group > (attribute) id>)
created\_at: Int64
Unix timestamp (in seconds) when the group was created.
[](<#(resource) admin.organization.projects.groups.roles > (terraform resource) > (attribute) group > (attribute) created_at>)
name: String
Display name of the group.
[](<#(resource) admin.organization.projects.groups.roles > (terraform resource) > (attribute) group > (attribute) name>)
object: String
Always `group`.
[](<#(resource) admin.organization.projects.groups.roles > (terraform resource) > (attribute) group > (attribute) object>)
scim\_managed: Bool
Whether the group is managed through SCIM.
[](<#(resource) admin.organization.projects.groups.roles > (terraform resource) > (attribute) group > (attribute) scim_managed>)
[](<#(resource) admin.organization.projects.groups.roles > (terraform resource) > (attribute) group>)
role: Attributes
Details about a role that can be assigned through the public Roles API.
id: String
Identifier for the role.
[](<#(resource) admin.organization.projects.groups.roles > (terraform resource) > (attribute) role > (attribute) id>)
description: String
Optional description of the role.
[](<#(resource) admin.organization.projects.groups.roles > (terraform resource) > (attribute) role > (attribute) description>)
name: String
Unique name for the role.
[](<#(resource) admin.organization.projects.groups.roles > (terraform resource) > (attribute) role > (attribute) name>)
object: String
Always `role`.
[](<#(resource) admin.organization.projects.groups.roles > (terraform resource) > (attribute) role > (attribute) object>)
permissions: List[String]
Permissions granted by the role.
[](<#(resource) admin.organization.projects.groups.roles > (terraform resource) > (attribute) role > (attribute) permissions>)
predefined\_role: Bool
Whether the role is predefined and managed by OpenAI.
[](<#(resource) admin.organization.projects.groups.roles > (terraform resource) > (attribute) role > (attribute) predefined_role>)
resource\_type: String
Resource type the role is bound to (for example `api.organization` or `api.project`).
[](<#(resource) admin.organization.projects.groups.roles > (terraform resource) > (attribute) role > (attribute) resource_type>)
[](<#(resource) admin.organization.projects.groups.roles > (terraform resource) > (attribute) role>)
### openai\_admin\_organization\_project\_group\_role
Terraform
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
`resource "openai\_admin\_organization\_project\_group\_role" "example\_admin\_organization\_project\_group\_role" {
project\_id = "project\_id"
group\_id = "group\_id"
role\_id = "role\_id"
}
`
```
#### data openai\_admin\_organization\_project\_group\_roles
##### required Expand Collapse
group\_id: String
[](<#(resource) admin.organization.projects.groups.roles > (terraform datasource-plural) > (attribute) group_id>)
project\_id: String
[](<#(resource) admin.organization.projects.groups.roles > (terraform datasource-plural) > (attribute) project_id>)
##### optional Expand Collapse
order?: String
Sort order for the returned project roles.
[](<#(resource) admin.organization.projects.groups.roles > (terraform datasource-plural) > (attribute) order>)
max\_items?: Int64
Max items to fetch, default: 1000
[](<#(resource) admin.organization.projects.groups.roles > (terraform datasource-plural) > (attribute) max_items>)
##### computed Expand Collapse
items: List[Attributes]
The items returned by the data source
id: String
Identifier for the role.
[](<#(resource) admin.organization.projects.groups.roles > (terraform datasource-plural) > (attribute) items > (attribute) id>)
created\_at: Int64
When the role was created.
[](<#(resource) admin.organization.projects.groups.roles > (terraform datasource-plural) > (attribute) items > (attribute) created_at>)
created\_by: String
Identifier of the actor who created the role.
[](<#(resource) admin.organization.projects.groups.roles > (terraform datasource-plural) > (attribute) items > (attribute) created_by>)
created\_by\_user\_obj: Map[JSON]
User details for the actor that created the role, when available.
[](<#(resource) admin.organization.projects.groups.roles > (terraform datasource-plural) > (attribute) items > (attribute) created_by_user_obj>)
description: String
Description of the role.
[](<#(resource) admin.organization.projects.groups.roles > (terraform datasource-plural) > (attribute) items > (attribute) description>)
metadata: Map[JSON]
Arbitrary metadata stored on the role.
[](<#(resource) admin.organization.projects.groups.roles > (terraform datasource-plural) > (attribute) items > (attribute) metadata>)
name: String
Name of the role.
[](<#(resource) admin.organization.projects.groups.roles > (terraform datasource-plural) > (attribute) items > (attribute) name>)
permissions: List[String]
Permissions associated with the role.
[](<#(resource) admin.organization.projects.groups.roles > (terraform datasource-plural) > (attribute) items > (attribute) permissions>)
predefined\_role: Bool
Whether the role is predefined by OpenAI.
[](<#(resource) admin.organization.projects.groups.roles > (terraform datasource-plural) > (attribute) items > (attribute) predefined_role>)
resource\_type: String
Resource type the role applies to.
[](<#(resource) admin.organization.projects.groups.roles > (terraform datasource-plural) > (attribute) items > (attribute) resource_type>)
updated\_at: Int64
When the role was last updated.
[](<#(resource) admin.organization.projects.groups.roles > (terraform datasource-plural) > (attribute) items > (attribute) updated_at>)
[](<#(resource) admin.organization.projects.groups.roles > (terraform datasource-plural) > (attribute) items>)
### openai\_admin\_organization\_project\_group\_roles
Terraform
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
`data "openai\_admin\_organization\_project\_group\_roles" "example\_admin\_organization\_project\_group\_roles" {
project\_id = "project\_id"
group\_id = "group\_id"
order = "asc"
}
`
```
#### ProjectsRoles
#### resource openai\_admin\_organization\_project\_role
##### required Expand Collapse
project\_id: String
[](<#(resource) admin.organization.projects.roles > (terraform resource) > (attribute) project_id>)
role\_name: String
Unique name for the role.
[](<#(resource) admin.organization.projects.roles > (terraform resource) > (attribute) role_name>)
permissions: List[String]
Permissions to grant to the role.
[](<#(resource) admin.organization.projects.roles > (terraform resource) > (attribute) permissions>)
##### optional Expand Collapse
description?: String
Optional description of the role.
[](<#(resource) admin.organization.projects.roles > (terraform resource) > (attribute) description>)
##### computed Expand Collapse
id: String
Identifier for the role.
[](<#(resource) admin.organization.projects.roles > (terraform resource) > (attribute) id>)
name: String
Unique name for the role.
[](<#(resource) admin.organization.projects.roles > (terraform resource) > (attribute) name>)
object: String
Always `role`.
[](<#(resource) admin.organization.projects.roles > (terraform resource) > (attribute) object>)
predefined\_role: Bool
Whether the role is predefined and managed by OpenAI.
[](<#(resource) admin.organization.projects.roles > (terraform resource) > (attribute) predefined_role>)
resource\_type: String
Resource type the role is bound to (for example `api.organization` or `api.project`).
[](<#(resource) admin.organization.projects.roles > (terraform resource) > (attribute) resource_type>)
### openai\_admin\_organization\_project\_role
Terraform
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
`resource "openai\_admin\_organization\_project\_role" "example\_admin\_organization\_project\_role" {
project\_id = "project\_id"
permissions = ["string"]
role\_name = "role\_name"
description = "description"
}
`
```
#### data openai\_admin\_organization\_project\_roles
##### required Expand Collapse
project\_id: String
[](<#(resource) admin.organization.projects.roles > (terraform datasource-plural) > (attribute) project_id>)
##### optional Expand Collapse
order?: String
Sort order for the returned roles.
[](<#(resource) admin.organization.projects.roles > (terraform datasource-plural) > (attribute) order>)
max\_items?: Int64
Max items to fetch, default: 1000
[](<#(resource) admin.organization.projects.roles > (terraform datasource-plural) > (attribute) max_items>)
##### computed Expand Collapse
items: List[Attributes]
The items returned by the data source
id: String
Identifier for the role.
[](<#(resource) admin.organization.projects.roles > (terraform datasource-plural) > (attribute) items > (attribute) id>)
description: String
Optional description of the role.
[](<#(resource) admin.organization.projects.roles > (terraform datasource-plural) > (attribute) items > (attribute) description>)
name: String
Unique name for the role.
[](<#(resource) admin.organization.projects.roles > (terraform datasource-plural) > (attribute) items > (attribute) name>)
object: String
Always `role`.
[](<#(resource) admin.organization.projects.roles > (terraform datasource-plural) > (attribute) items > (attribute) object>)
permissions: List[String]
Permissions granted by the role.
[](<#(resource) admin.organization.projects.roles > (terraform datasource-plural) > (attribute) items > (attribute) permissions>)
predefined\_role: Bool
Whether the role is predefined and managed by OpenAI.
[](<#(resource) admin.organization.projects.roles > (terraform datasource-plural) > (attribute) items > (attribute) predefined_role>)
resource\_type: String
Resource type the role is bound to (for example `api.organization` or `api.project`).
[](<#(resource) admin.organization.projects.roles > (terraform datasource-plural) > (attribute) items > (attribute) resource_type>)
[](<#(resource) admin.organization.projects.roles > (terraform datasource-plural) > (attribute) items>)
### openai\_admin\_organization\_project\_roles
Terraform
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
`data "openai\_admin\_organization\_project\_roles" "example\_admin\_organization\_project\_roles" {
project\_id = "project\_id"
}
`
```
#### ProjectsCertificates
#### data openai\_admin\_organization\_project\_certificates
##### required Expand Collapse
project\_id: String
[](<#(resource) admin.organization.projects.certificates > (terraform datasource-plural) > (attribute) project_id>)
##### optional Expand Collapse
order?: String
Sort order by the `created\_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.
[](<#(resource) admin.organization.projects.certificates > (terraform datasource-plural) > (attribute) order>)
max\_items?: Int64
Max items to fetch, default: 1000
[](<#(resource) admin.organization.projects.certificates > (terraform datasource-plural) > (attribute) max_items>)
##### computed Expand Collapse
items: List[Attributes]
The items returned by the data source
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.certificates > (terraform datasource-plural) > (attribute) items > (attribute) id>)
certificate\_details: Attributes
content: String
The content of the certificate in PEM format.
[](<#(resource) admin.organization.projects.certificates > (terraform datasource-plural) > (attribute) items > (attribute) certificate_details > (attribute) content>)
expires\_at: Int64
The Unix timestamp (in seconds) of when the certificate expires.
[](<#(resource) admin.organization.projects.certificates > (terraform datasource-plural) > (attribute) items > (attribute) certificate_details > (attribute) expires_at>)
valid\_at: Int64
The Unix timestamp (in seconds) of when the certificate becomes valid.
[](<#(resource) admin.organization.projects.certificates > (terraform datasource-plural) > (attribute) items > (attribute) certificate_details > (attribute) valid_at>)
[](<#(resource) admin.organization.projects.certificates > (terraform datasource-plural) > (attribute) items > (attribute) certificate_details>)
created\_at: Int64
The Unix timestamp (in seconds) of when the certificate was uploaded.
[](<#(resource) admin.organization.projects.certificates > (terraform datasource-plural) > (attribute) items > (attribute) created_at>)
name: String
The name of the certificate.
[](<#(resource) admin.organization.projects.certificates > (terraform datasource-plural) > (attribute) items > (attribute) name>)
object: String
The object type.
* If creating, updating, or getting a specific certificate, the object type is `certificate`.
* If listing, activating, or deactivating certificates for the organization, the object type is `organization.certificate`.
* If listing, activating, or deactivating certificates for a project, the object type is `organization.project.certificate`.
[](<#(resource) admin.organization.projects.certificates > (terraform datasource-plural) > (attribute) items > (attribute) object>)
active: Bool
Whether the certificate is currently active at the specified scope. Not returned when getting details for a specific certificate.
[](<#(resource) admin.organization.projects.certificates > (terraform datasource-plural) > (attribute) items > (attribute) active>)
[](<#(resource) admin.organization.projects.certificates > (terraform datasource-plural) > (attribute) items>)
### openai\_admin\_organization\_project\_certificates
Terraform
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
`data "openai\_admin\_organization\_project\_certificates" "example\_admin\_organization\_project\_certificates" {
project\_id = "project\_id"
}
`
```