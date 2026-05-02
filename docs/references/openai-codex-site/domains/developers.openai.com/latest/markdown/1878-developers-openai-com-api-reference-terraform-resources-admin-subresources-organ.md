Groups | OpenAI API Reference
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
# Groups
#### resource openai\_admin\_organization\_group
##### required Expand Collapse
name: String
Human readable name for the group.
[](<#(resource) admin.organization.groups > (terraform resource) > (attribute) name>)
##### computed Expand Collapse
id: String
Identifier for the group.
[](<#(resource) admin.organization.groups > (terraform resource) > (attribute) id>)
created\_at: Int64
Unix timestamp (in seconds) when the group was created.
[](<#(resource) admin.organization.groups > (terraform resource) > (attribute) created_at>)
is\_scim\_managed: Bool
Whether the group is managed through SCIM and controlled by your identity provider.
[](<#(resource) admin.organization.groups > (terraform resource) > (attribute) is_scim_managed>)
### openai\_admin\_organization\_group
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
`resource "openai\_admin\_organization\_group" "example\_admin\_organization\_group" {
name = "x"
}
`
```
#### data openai\_admin\_organization\_groups
##### optional Expand Collapse
order?: String
Specifies the sort order of the returned groups.
[](<#(resource) admin.organization.groups > (terraform datasource-plural) > (attribute) order>)
max\_items?: Int64
Max items to fetch, default: 1000
[](<#(resource) admin.organization.groups > (terraform datasource-plural) > (attribute) max_items>)
##### computed Expand Collapse
items: List[Attributes]
The items returned by the data source
id: String
Identifier for the group.
[](<#(resource) admin.organization.groups > (terraform datasource-plural) > (attribute) items > (attribute) id>)
created\_at: Int64
Unix timestamp (in seconds) when the group was created.
[](<#(resource) admin.organization.groups > (terraform datasource-plural) > (attribute) items > (attribute) created_at>)
is\_scim\_managed: Bool
Whether the group is managed through SCIM and controlled by your identity provider.
[](<#(resource) admin.organization.groups > (terraform datasource-plural) > (attribute) items > (attribute) is_scim_managed>)
name: String
Display name of the group.
[](<#(resource) admin.organization.groups > (terraform datasource-plural) > (attribute) items > (attribute) name>)
[](<#(resource) admin.organization.groups > (terraform datasource-plural) > (attribute) items>)
### openai\_admin\_organization\_groups
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
`data "openai\_admin\_organization\_groups" "example\_admin\_organization\_groups" {
}
`
```
#### GroupsUsers
#### resource openai\_admin\_organization\_group\_user
##### required Expand Collapse
group\_id: String
[](<#(resource) admin.organization.groups.users > (terraform resource) > (attribute) group_id>)
user\_id: String
Identifier of the user to add to the group.
[](<#(resource) admin.organization.groups.users > (terraform resource) > (attribute) user_id>)
##### computed Expand Collapse
object: String
Always `group.user`.
[](<#(resource) admin.organization.groups.users > (terraform resource) > (attribute) object>)
### openai\_admin\_organization\_group\_user
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
`resource "openai\_admin\_organization\_group\_user" "example\_admin\_organization\_group\_user" {
group\_id = "group\_id"
user\_id = "user\_id"
}
`
```
#### data openai\_admin\_organization\_group\_users
##### required Expand Collapse
group\_id: String
[](<#(resource) admin.organization.groups.users > (terraform datasource-plural) > (attribute) group_id>)
##### optional Expand Collapse
order?: String
Specifies the sort order of users in the list.
[](<#(resource) admin.organization.groups.users > (terraform datasource-plural) > (attribute) order>)
max\_items?: Int64
Max items to fetch, default: 1000
[](<#(resource) admin.organization.groups.users > (terraform datasource-plural) > (attribute) max_items>)
##### computed Expand Collapse
items: List[Attributes]
The items returned by the data source
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.groups.users > (terraform datasource-plural) > (attribute) items > (attribute) id>)
added\_at: Int64
The Unix timestamp (in seconds) of when the user was added.
[](<#(resource) admin.organization.groups.users > (terraform datasource-plural) > (attribute) items > (attribute) added_at>)
email: String
The email address of the user
[](<#(resource) admin.organization.groups.users > (terraform datasource-plural) > (attribute) items > (attribute) email>)
name: String
The name of the user
[](<#(resource) admin.organization.groups.users > (terraform datasource-plural) > (attribute) items > (attribute) name>)
object: String
The object type, which is always `organization.user`
[](<#(resource) admin.organization.groups.users > (terraform datasource-plural) > (attribute) items > (attribute) object>)
role: String
`owner` or `reader`
[](<#(resource) admin.organization.groups.users > (terraform datasource-plural) > (attribute) items > (attribute) role>)
[](<#(resource) admin.organization.groups.users > (terraform datasource-plural) > (attribute) items>)
### openai\_admin\_organization\_group\_users
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
`data "openai\_admin\_organization\_group\_users" "example\_admin\_organization\_group\_users" {
group\_id = "group\_id"
}
`
```
#### GroupsRoles
#### resource openai\_admin\_organization\_group\_role
##### required Expand Collapse
group\_id: String
[](<#(resource) admin.organization.groups.roles > (terraform resource) > (attribute) group_id>)
role\_id: String
Identifier of the role to assign.
[](<#(resource) admin.organization.groups.roles > (terraform resource) > (attribute) role_id>)
##### computed Expand Collapse
object: String
Always `group.role`.
[](<#(resource) admin.organization.groups.roles > (terraform resource) > (attribute) object>)
group: Attributes
Summary information about a group returned in role assignment responses.
id: String
Identifier for the group.
[](<#(resource) admin.organization.groups.roles > (terraform resource) > (attribute) group > (attribute) id>)
created\_at: Int64
Unix timestamp (in seconds) when the group was created.
[](<#(resource) admin.organization.groups.roles > (terraform resource) > (attribute) group > (attribute) created_at>)
name: String
Display name of the group.
[](<#(resource) admin.organization.groups.roles > (terraform resource) > (attribute) group > (attribute) name>)
object: String
Always `group`.
[](<#(resource) admin.organization.groups.roles > (terraform resource) > (attribute) group > (attribute) object>)
scim\_managed: Bool
Whether the group is managed through SCIM.
[](<#(resource) admin.organization.groups.roles > (terraform resource) > (attribute) group > (attribute) scim_managed>)
[](<#(resource) admin.organization.groups.roles > (terraform resource) > (attribute) group>)
role: Attributes
Details about a role that can be assigned through the public Roles API.
id: String
Identifier for the role.
[](<#(resource) admin.organization.groups.roles > (terraform resource) > (attribute) role > (attribute) id>)
description: String
Optional description of the role.
[](<#(resource) admin.organization.groups.roles > (terraform resource) > (attribute) role > (attribute) description>)
name: String
Unique name for the role.
[](<#(resource) admin.organization.groups.roles > (terraform resource) > (attribute) role > (attribute) name>)
object: String
Always `role`.
[](<#(resource) admin.organization.groups.roles > (terraform resource) > (attribute) role > (attribute) object>)
permissions: List[String]
Permissions granted by the role.
[](<#(resource) admin.organization.groups.roles > (terraform resource) > (attribute) role > (attribute) permissions>)
predefined\_role: Bool
Whether the role is predefined and managed by OpenAI.
[](<#(resource) admin.organization.groups.roles > (terraform resource) > (attribute) role > (attribute) predefined_role>)
resource\_type: String
Resource type the role is bound to (for example `api.organization` or `api.project`).
[](<#(resource) admin.organization.groups.roles > (terraform resource) > (attribute) role > (attribute) resource_type>)
[](<#(resource) admin.organization.groups.roles > (terraform resource) > (attribute) role>)
### openai\_admin\_organization\_group\_role
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
`resource "openai\_admin\_organization\_group\_role" "example\_admin\_organization\_group\_role" {
group\_id = "group\_id"
role\_id = "role\_id"
}
`
```
#### data openai\_admin\_organization\_group\_roles
##### required Expand Collapse
group\_id: String
[](<#(resource) admin.organization.groups.roles > (terraform datasource-plural) > (attribute) group_id>)
##### optional Expand Collapse
order?: String
Sort order for the returned organization roles.
[](<#(resource) admin.organization.groups.roles > (terraform datasource-plural) > (attribute) order>)
max\_items?: Int64
Max items to fetch, default: 1000
[](<#(resource) admin.organization.groups.roles > (terraform datasource-plural) > (attribute) max_items>)
##### computed Expand Collapse
items: List[Attributes]
The items returned by the data source
id: String
Identifier for the role.
[](<#(resource) admin.organization.groups.roles > (terraform datasource-plural) > (attribute) items > (attribute) id>)
created\_at: Int64
When the role was created.
[](<#(resource) admin.organization.groups.roles > (terraform datasource-plural) > (attribute) items > (attribute) created_at>)
created\_by: String
Identifier of the actor who created the role.
[](<#(resource) admin.organization.groups.roles > (terraform datasource-plural) > (attribute) items > (attribute) created_by>)
created\_by\_user\_obj: Map[JSON]
User details for the actor that created the role, when available.
[](<#(resource) admin.organization.groups.roles > (terraform datasource-plural) > (attribute) items > (attribute) created_by_user_obj>)
description: String
Description of the role.
[](<#(resource) admin.organization.groups.roles > (terraform datasource-plural) > (attribute) items > (attribute) description>)
metadata: Map[JSON]
Arbitrary metadata stored on the role.
[](<#(resource) admin.organization.groups.roles > (terraform datasource-plural) > (attribute) items > (attribute) metadata>)
name: String
Name of the role.
[](<#(resource) admin.organization.groups.roles > (terraform datasource-plural) > (attribute) items > (attribute) name>)
permissions: List[String]
Permissions associated with the role.
[](<#(resource) admin.organization.groups.roles > (terraform datasource-plural) > (attribute) items > (attribute) permissions>)
predefined\_role: Bool
Whether the role is predefined by OpenAI.
[](<#(resource) admin.organization.groups.roles > (terraform datasource-plural) > (attribute) items > (attribute) predefined_role>)
resource\_type: String
Resource type the role applies to.
[](<#(resource) admin.organization.groups.roles > (terraform datasource-plural) > (attribute) items > (attribute) resource_type>)
updated\_at: Int64
When the role was last updated.
[](<#(resource) admin.organization.groups.roles > (terraform datasource-plural) > (attribute) items > (attribute) updated_at>)
[](<#(resource) admin.organization.groups.roles > (terraform datasource-plural) > (attribute) items>)
### openai\_admin\_organization\_group\_roles
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
`data "openai\_admin\_organization\_group\_roles" "example\_admin\_organization\_group\_roles" {
group\_id = "group\_id"
order = "asc"
}
`
```