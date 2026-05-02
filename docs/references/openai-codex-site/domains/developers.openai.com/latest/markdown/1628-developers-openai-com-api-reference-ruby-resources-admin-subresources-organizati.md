Update group | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Admin](/api/reference/ruby/resources/admin)
[Organization](/api/reference/ruby/resources/admin/subresources/organization)
[Groups](/api/reference/ruby/resources/admin/subresources/organization/subresources/groups)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Update group
admin.organization.groups.update(group\_id, \*\*kwargs) -\> [GroupUpdateResponse](</api/reference/ruby/resources/admin#(resource) admin.organization.groups > (model) group_update_response > (schema)>) { id, created\_at, is\_scim\_managed, name }
POST/organization/groups/{group\_id}
Updates a group’s information.
##### ParametersExpand Collapse
group\_id: String
[](<#(resource) admin.organization.groups > (method) update > (params) default > (param) group_id > (schema)>)
name: String
New display name for the group.
minLength1
maxLength255
[](<#(resource) admin.organization.groups > (method) update > (params) default > (param) name > (schema)>)
##### ReturnsExpand Collapse
class GroupUpdateResponse { id, created\_at, is\_scim\_managed, name }
Response returned after updating a group.
id: String
Identifier for the group.
[](<#(resource) admin.organization.groups > (model) group_update_response > (schema) > (property) id>)
created\_at: Integer
Unix timestamp (in seconds) when the group was created.
formatunixtime
[](<#(resource) admin.organization.groups > (model) group_update_response > (schema) > (property) created_at>)
is\_scim\_managed: bool
Whether the group is managed through SCIM and controlled by your identity provider.
[](<#(resource) admin.organization.groups > (model) group_update_response > (schema) > (property) is_scim_managed>)
name: String
Updated display name for the group.
[](<#(resource) admin.organization.groups > (model) group_update_response > (schema) > (property) name>)
[](<#(resource) admin.organization.groups > (model) group_update_response > (schema)>)
### Update group
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
group = openai.admin.organization.groups.update("group\_id", name: "x")
puts(group)`
```
```
`{
"id": "group\_01J1F8ABCDXYZ",
"name": "Escalations",
"created\_at": 1711471533,
"is\_scim\_managed": false
}
`
```
##### Returns Examples
```
`{
"id": "group\_01J1F8ABCDXYZ",
"name": "Escalations",
"created\_at": 1711471533,
"is\_scim\_managed": false
}
`
```