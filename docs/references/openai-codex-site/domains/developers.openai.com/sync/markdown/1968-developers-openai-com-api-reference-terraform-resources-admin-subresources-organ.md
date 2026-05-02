Users | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/terraform)
[Admin](/api/reference/terraform/resources/admin)
[Organization](/api/reference/terraform/resources/admin/subresources/organization)
[Projects](/api/reference/terraform/resources/admin/subresources/organization/subresources/projects)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Users
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
#### UsersRoles
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