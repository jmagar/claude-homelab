Roles | OpenAI API Reference
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
# Roles
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