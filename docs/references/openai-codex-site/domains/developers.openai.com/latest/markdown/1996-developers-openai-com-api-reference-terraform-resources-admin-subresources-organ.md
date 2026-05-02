Roles | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/terraform)
[Admin](/api/reference/terraform/resources/admin)
[Organization](/api/reference/terraform/resources/admin/subresources/organization)
[Users](/api/reference/terraform/resources/admin/subresources/organization/subresources/users)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Roles
#### resource openai\_admin\_organization\_user\_role
##### required Expand Collapse
user\_id: String
[](<#(resource) admin.organization.users.roles > (terraform resource) > (attribute) user_id>)
role\_id: String
Identifier of the role to assign.
[](<#(resource) admin.organization.users.roles > (terraform resource) > (attribute) role_id>)
##### computed Expand Collapse
object: String
Always `user.role`.
[](<#(resource) admin.organization.users.roles > (terraform resource) > (attribute) object>)
role: Attributes
Details about a role that can be assigned through the public Roles API.
id: String
Identifier for the role.
[](<#(resource) admin.organization.users.roles > (terraform resource) > (attribute) role > (attribute) id>)
description: String
Optional description of the role.
[](<#(resource) admin.organization.users.roles > (terraform resource) > (attribute) role > (attribute) description>)
name: String
Unique name for the role.
[](<#(resource) admin.organization.users.roles > (terraform resource) > (attribute) role > (attribute) name>)
object: String
Always `role`.
[](<#(resource) admin.organization.users.roles > (terraform resource) > (attribute) role > (attribute) object>)
permissions: List[String]
Permissions granted by the role.
[](<#(resource) admin.organization.users.roles > (terraform resource) > (attribute) role > (attribute) permissions>)
predefined\_role: Bool
Whether the role is predefined and managed by OpenAI.
[](<#(resource) admin.organization.users.roles > (terraform resource) > (attribute) role > (attribute) predefined_role>)
resource\_type: String
Resource type the role is bound to (for example `api.organization` or `api.project`).
[](<#(resource) admin.organization.users.roles > (terraform resource) > (attribute) role > (attribute) resource_type>)
[](<#(resource) admin.organization.users.roles > (terraform resource) > (attribute) role>)
user: Attributes
Represents an individual `user` within an organization.
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.users.roles > (terraform resource) > (attribute) user > (attribute) id>)
added\_at: Int64
The Unix timestamp (in seconds) of when the user was added.
[](<#(resource) admin.organization.users.roles > (terraform resource) > (attribute) user > (attribute) added_at>)
email: String
The email address of the user
[](<#(resource) admin.organization.users.roles > (terraform resource) > (attribute) user > (attribute) email>)
name: String
The name of the user
[](<#(resource) admin.organization.users.roles > (terraform resource) > (attribute) user > (attribute) name>)
object: String
The object type, which is always `organization.user`
[](<#(resource) admin.organization.users.roles > (terraform resource) > (attribute) user > (attribute) object>)
role: String
`owner` or `reader`
[](<#(resource) admin.organization.users.roles > (terraform resource) > (attribute) user > (attribute) role>)
[](<#(resource) admin.organization.users.roles > (terraform resource) > (attribute) user>)
### openai\_admin\_organization\_user\_role
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
`resource "openai\_admin\_organization\_user\_role" "example\_admin\_organization\_user\_role" {
user\_id = "user\_id"
role\_id = "role\_id"
}
`
```
#### data openai\_admin\_organization\_user\_roles
##### required Expand Collapse
user\_id: String
[](<#(resource) admin.organization.users.roles > (terraform datasource-plural) > (attribute) user_id>)
##### optional Expand Collapse
order?: String
Sort order for the returned organization roles.
[](<#(resource) admin.organization.users.roles > (terraform datasource-plural) > (attribute) order>)
max\_items?: Int64
Max items to fetch, default: 1000
[](<#(resource) admin.organization.users.roles > (terraform datasource-plural) > (attribute) max_items>)
##### computed Expand Collapse
items: List[Attributes]
The items returned by the data source
id: String
Identifier for the role.
[](<#(resource) admin.organization.users.roles > (terraform datasource-plural) > (attribute) items > (attribute) id>)
created\_at: Int64
When the role was created.
[](<#(resource) admin.organization.users.roles > (terraform datasource-plural) > (attribute) items > (attribute) created_at>)
created\_by: String
Identifier of the actor who created the role.
[](<#(resource) admin.organization.users.roles > (terraform datasource-plural) > (attribute) items > (attribute) created_by>)
created\_by\_user\_obj: Map[JSON]
User details for the actor that created the role, when available.
[](<#(resource) admin.organization.users.roles > (terraform datasource-plural) > (attribute) items > (attribute) created_by_user_obj>)
description: String
Description of the role.
[](<#(resource) admin.organization.users.roles > (terraform datasource-plural) > (attribute) items > (attribute) description>)
metadata: Map[JSON]
Arbitrary metadata stored on the role.
[](<#(resource) admin.organization.users.roles > (terraform datasource-plural) > (attribute) items > (attribute) metadata>)
name: String
Name of the role.
[](<#(resource) admin.organization.users.roles > (terraform datasource-plural) > (attribute) items > (attribute) name>)
permissions: List[String]
Permissions associated with the role.
[](<#(resource) admin.organization.users.roles > (terraform datasource-plural) > (attribute) items > (attribute) permissions>)
predefined\_role: Bool
Whether the role is predefined by OpenAI.
[](<#(resource) admin.organization.users.roles > (terraform datasource-plural) > (attribute) items > (attribute) predefined_role>)
resource\_type: String
Resource type the role applies to.
[](<#(resource) admin.organization.users.roles > (terraform datasource-plural) > (attribute) items > (attribute) resource_type>)
updated\_at: Int64
When the role was last updated.
[](<#(resource) admin.organization.users.roles > (terraform datasource-plural) > (attribute) items > (attribute) updated_at>)
[](<#(resource) admin.organization.users.roles > (terraform datasource-plural) > (attribute) items>)
### openai\_admin\_organization\_user\_roles
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
`data "openai\_admin\_organization\_user\_roles" "example\_admin\_organization\_user\_roles" {
user\_id = "user\_id"
order = "asc"
}
`
```