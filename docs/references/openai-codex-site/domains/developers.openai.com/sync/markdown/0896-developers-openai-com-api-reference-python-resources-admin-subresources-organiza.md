Update group | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Admin](/api/reference/python/resources/admin)
[Organization](/api/reference/python/resources/admin/subresources/organization)
[Groups](/api/reference/python/resources/admin/subresources/organization/subresources/groups)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Update group
admin.organization.groups.update(strgroup\_id, GroupUpdateParams\*\*kwargs) -\> [GroupUpdateResponse](</api/reference/python/resources/admin#(resource) admin.organization.groups > (model) group_update_response > (schema)>)
POST/organization/groups/{group\_id}
Updates a group’s information.
##### ParametersExpand Collapse
group\_id: str
[](<#(resource) admin.organization.groups > (method) update > (params) default > (param) group_id > (schema)>)
name: str
New display name for the group.
minLength1
maxLength255
[](<#(resource) admin.organization.groups > (method) update > (params) default > (param) name > (schema)>)
##### ReturnsExpand Collapse
class GroupUpdateResponse: …
Response returned after updating a group.
id: str
Identifier for the group.
[](<#(resource) admin.organization.groups > (model) group_update_response > (schema) > (property) id>)
created\_at: int
Unix timestamp (in seconds) when the group was created.
formatunixtime
[](<#(resource) admin.organization.groups > (model) group_update_response > (schema) > (property) created_at>)
is\_scim\_managed: bool
Whether the group is managed through SCIM and controlled by your identity provider.
[](<#(resource) admin.organization.groups > (model) group_update_response > (schema) > (property) is_scim_managed>)
name: str
Updated display name for the group.
[](<#(resource) admin.organization.groups > (model) group_update_response > (schema) > (property) name>)
[](<#(resource) admin.organization.groups > (model) group_update_response > (schema)>)
### Update group
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
group = client.admin.organization.groups.update(
group\_id="group\_id",
name="x",
)
print(group.id)`
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