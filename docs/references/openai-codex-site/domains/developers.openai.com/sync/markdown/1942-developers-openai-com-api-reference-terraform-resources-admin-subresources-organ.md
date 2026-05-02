Invites | OpenAI API Reference
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
# Invites
#### resource openai\_admin\_organization\_invite
##### required Expand Collapse
email: String
Send an email to this address
[](<#(resource) admin.organization.invites > (terraform resource) > (attribute) email>)
role: String
`owner` or `reader`
[](<#(resource) admin.organization.invites > (terraform resource) > (attribute) role>)
##### optional Expand Collapse
projects?: List[Attributes]
An array of projects to which membership is granted at the same time the org invite is accepted. If omitted, the user will be invited to the default project for compatibility with legacy behavior.
id: String
Project’s public ID
[](<#(resource) admin.organization.invites > (terraform resource) > (attribute) projects > (attribute) id>)
role: String
Project membership role
[](<#(resource) admin.organization.invites > (terraform resource) > (attribute) projects > (attribute) role>)
[](<#(resource) admin.organization.invites > (terraform resource) > (attribute) projects>)
##### computed Expand Collapse
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.invites > (terraform resource) > (attribute) id>)
accepted\_at: Int64
The Unix timestamp (in seconds) of when the invite was accepted.
[](<#(resource) admin.organization.invites > (terraform resource) > (attribute) accepted_at>)
expires\_at: Int64
The Unix timestamp (in seconds) of when the invite expires.
[](<#(resource) admin.organization.invites > (terraform resource) > (attribute) expires_at>)
invited\_at: Int64
The Unix timestamp (in seconds) of when the invite was sent.
[](<#(resource) admin.organization.invites > (terraform resource) > (attribute) invited_at>)
object: String
The object type, which is always `organization.invite`
[](<#(resource) admin.organization.invites > (terraform resource) > (attribute) object>)
status: String
`accepted`,`expired`, or `pending`
[](<#(resource) admin.organization.invites > (terraform resource) > (attribute) status>)
### openai\_admin\_organization\_invite
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
`resource "openai\_admin\_organization\_invite" "example\_admin\_organization\_invite" {
email = "email"
role = "reader"
projects = [{
id = "id"
role = "member"
}]
}
`
```
#### data openai\_admin\_organization\_invite
##### required Expand Collapse
invite\_id: String
[](<#(resource) admin.organization.invites > (terraform datasource-single) > (attribute) invite_id>)
##### computed Expand Collapse
id: String
[](<#(resource) admin.organization.invites > (terraform datasource-single) > (attribute) id>)
accepted\_at: Int64
The Unix timestamp (in seconds) of when the invite was accepted.
[](<#(resource) admin.organization.invites > (terraform datasource-single) > (attribute) accepted_at>)
email: String
The email address of the individual to whom the invite was sent
[](<#(resource) admin.organization.invites > (terraform datasource-single) > (attribute) email>)
expires\_at: Int64
The Unix timestamp (in seconds) of when the invite expires.
[](<#(resource) admin.organization.invites > (terraform datasource-single) > (attribute) expires_at>)
invited\_at: Int64
The Unix timestamp (in seconds) of when the invite was sent.
[](<#(resource) admin.organization.invites > (terraform datasource-single) > (attribute) invited_at>)
object: String
The object type, which is always `organization.invite`
[](<#(resource) admin.organization.invites > (terraform datasource-single) > (attribute) object>)
role: String
`owner` or `reader`
[](<#(resource) admin.organization.invites > (terraform datasource-single) > (attribute) role>)
status: String
`accepted`,`expired`, or `pending`
[](<#(resource) admin.organization.invites > (terraform datasource-single) > (attribute) status>)
projects: List[Attributes]
The projects that were granted membership upon acceptance of the invite.
id: String
Project’s public ID
[](<#(resource) admin.organization.invites > (terraform datasource-single) > (attribute) projects > (attribute) id>)
role: String
Project membership role
[](<#(resource) admin.organization.invites > (terraform datasource-single) > (attribute) projects > (attribute) role>)
[](<#(resource) admin.organization.invites > (terraform datasource-single) > (attribute) projects>)
### openai\_admin\_organization\_invite
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
`data "openai\_admin\_organization\_invite" "example\_admin\_organization\_invite" {
invite\_id = "invite\_id"
}
`
```
#### data openai\_admin\_organization\_invites
##### optional Expand Collapse
max\_items?: Int64
Max items to fetch, default: 1000
[](<#(resource) admin.organization.invites > (terraform datasource-plural) > (attribute) max_items>)
##### computed Expand Collapse
items: List[Attributes]
The items returned by the data source
id: String
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.invites > (terraform datasource-plural) > (attribute) items > (attribute) id>)
email: String
The email address of the individual to whom the invite was sent
[](<#(resource) admin.organization.invites > (terraform datasource-plural) > (attribute) items > (attribute) email>)
expires\_at: Int64
The Unix timestamp (in seconds) of when the invite expires.
[](<#(resource) admin.organization.invites > (terraform datasource-plural) > (attribute) items > (attribute) expires_at>)
invited\_at: Int64
The Unix timestamp (in seconds) of when the invite was sent.
[](<#(resource) admin.organization.invites > (terraform datasource-plural) > (attribute) items > (attribute) invited_at>)
object: String
The object type, which is always `organization.invite`
[](<#(resource) admin.organization.invites > (terraform datasource-plural) > (attribute) items > (attribute) object>)
role: String
`owner` or `reader`
[](<#(resource) admin.organization.invites > (terraform datasource-plural) > (attribute) items > (attribute) role>)
status: String
`accepted`,`expired`, or `pending`
[](<#(resource) admin.organization.invites > (terraform datasource-plural) > (attribute) items > (attribute) status>)
accepted\_at: Int64
The Unix timestamp (in seconds) of when the invite was accepted.
[](<#(resource) admin.organization.invites > (terraform datasource-plural) > (attribute) items > (attribute) accepted_at>)
projects: List[Attributes]
The projects that were granted membership upon acceptance of the invite.
id: String
Project’s public ID
[](<#(resource) admin.organization.invites > (terraform datasource-plural) > (attribute) items > (attribute) projects > (attribute) id>)
role: String
Project membership role
[](<#(resource) admin.organization.invites > (terraform datasource-plural) > (attribute) items > (attribute) projects > (attribute) role>)
[](<#(resource) admin.organization.invites > (terraform datasource-plural) > (attribute) items > (attribute) projects>)
[](<#(resource) admin.organization.invites > (terraform datasource-plural) > (attribute) items>)
### openai\_admin\_organization\_invites
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
`data "openai\_admin\_organization\_invites" "example\_admin\_organization\_invites" {
}
`
```