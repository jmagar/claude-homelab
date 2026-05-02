List groups | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Admin](/api/reference/resources/admin)
[Organization](/api/reference/resources/admin/subresources/organization)
[Groups](/api/reference/resources/admin/subresources/organization/subresources/groups)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List groups
GET/organization/groups
Lists all groups in the organization.
##### Query ParametersExpand Collapse
after: optional string
A cursor for use in pagination. `after` is a group ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with group\_abc, your subsequent call can include `after=group\_abc` in order to fetch the next page of the list.
[](<#(resource) admin.organization.groups > (method) list > (params) default > (param) after > (schema)>)
limit: optional number
A limit on the number of groups to be returned. Limit can range between 0 and 1000, and the default is 100.
minimum0
maximum1000
[](<#(resource) admin.organization.groups > (method) list > (params) default > (param) limit > (schema)>)
order: optional "asc" or "desc"
Specifies the sort order of the returned groups.
One of the following:
"asc"
[](<#(resource) admin.organization.groups > (method) list > (params) default > (param) order > (schema) > (member) 0>)
"desc"
[](<#(resource) admin.organization.groups > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) admin.organization.groups > (method) list > (params) default > (param) order > (schema)>)
##### ReturnsExpand Collapse
data: array of [Group](</api/reference/resources/admin#(resource) admin.organization.groups > (model) group > (schema)>) { id, created\_at, is\_scim\_managed, name }
Groups returned in the current page.
id: string
Identifier for the group.
[](<#(resource) admin.organization.groups > (model) group > (schema) > (property) id>)
created\_at: number
Unix timestamp (in seconds) when the group was created.
formatunixtime
[](<#(resource) admin.organization.groups > (model) group > (schema) > (property) created_at>)
is\_scim\_managed: boolean
Whether the group is managed through SCIM and controlled by your identity provider.
[](<#(resource) admin.organization.groups > (model) group > (schema) > (property) is_scim_managed>)
name: string
Display name of the group.
[](<#(resource) admin.organization.groups > (model) group > (schema) > (property) name>)
[](<#(resource) admin.organization.groups > (method) list > (network schema) > (property) data>)
has\_more: boolean
Whether additional groups are available when paginating.
[](<#(resource) admin.organization.groups > (method) list > (network schema) > (property) has_more>)
next: string
Cursor to fetch the next page of results, or `null` if there are no more results.
[](<#(resource) admin.organization.groups > (method) list > (network schema) > (property) next>)
object: "list"
Always `list`.
[](<#(resource) admin.organization.groups > (method) list > (network schema) > (property) object>)
### List groups
HTTP
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
`curl https://api.openai.com/v1/organization/groups?limit=20&order=asc \\
-H "Authorization: Bearer $OPENAI\_ADMIN\_KEY" \\
-H "Content-Type: application/json"
`
```
```
`{
"object": "list",
"data": [
{
"object": "group",
"id": "group\_01J1F8ABCDXYZ",
"name": "Support Team",
"created\_at": 1711471533,
"is\_scim\_managed": false
}
],
"has\_more": false,
"next": null
}
`
```
##### Returns Examples
```
`{
"object": "list",
"data": [
{
"object": "group",
"id": "group\_01J1F8ABCDXYZ",
"name": "Support Team",
"created\_at": 1711471533,
"is\_scim\_managed": false
}
],
"has\_more": false,
"next": null
}
`
```