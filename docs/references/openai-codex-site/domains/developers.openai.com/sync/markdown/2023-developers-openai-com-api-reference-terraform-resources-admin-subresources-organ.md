Roles | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/terraform)
[Admin](/api/reference/terraform/resources/admin)
[Organization](/api/reference/terraform/resources/admin/subresources/organization)
[Projects](/api/reference/terraform/resources/admin/subresources/organization/subresources/projects)
[Groups](/api/reference/terraform/resources/admin/subresources/organization/subresources/projects/subresources/groups)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Roles
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