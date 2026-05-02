List groups | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Admin](/api/reference/go/resources/admin)
[Organization](/api/reference/go/resources/admin/subresources/organization)
[Groups](/api/reference/go/resources/admin/subresources/organization/subresources/groups)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List groups
client.Admin.Organization.Groups.List(ctx, query) (\*CursorPage[[Group](</api/reference/go/resources/admin#(resource) admin.organization.groups > (model) group > (schema)>)], error)
GET/organization/groups
Lists all groups in the organization.
##### ParametersExpand Collapse
query AdminOrganizationGroupListParams
After param.Field[string]Optional
A cursor for use in pagination. `after` is a group ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with group\_abc, your subsequent call can include `after=group\_abc` in order to fetch the next page of the list.
[](<#(resource) admin.organization.groups > (method) list > (params) default > (param) after>)
Limit param.Field[int64]Optional
A limit on the number of groups to be returned. Limit can range between 0 and 1000, and the default is 100.
minimum0
maximum1000
[](<#(resource) admin.organization.groups > (method) list > (params) default > (param) limit>)
Order param.Field[[AdminOrganizationGroupListParamsOrder](</api/reference/go/resources/admin/subresources/organization/subresources/groups/methods/list#(resource) admin.organization.groups > (method) list > (params) default > (param) order > (schema)>)]Optional
Specifies the sort order of the returned groups.
const AdminOrganizationGroupListParamsOrderAsc [AdminOrganizationGroupListParamsOrder](</api/reference/go/resources/admin/subresources/organization/subresources/groups/methods/list#(resource) admin.organization.groups > (method) list > (params) default > (param) order > (schema)>) = "asc"
[](<#(resource) admin.organization.groups > (method) list > (params) default > (param) order > (schema) > (member) 0>)
const AdminOrganizationGroupListParamsOrderDesc [AdminOrganizationGroupListParamsOrder](</api/reference/go/resources/admin/subresources/organization/subresources/groups/methods/list#(resource) admin.organization.groups > (method) list > (params) default > (param) order > (schema)>) = "desc"
[](<#(resource) admin.organization.groups > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) admin.organization.groups > (method) list > (params) default > (param) order>)
[](<#(resource) admin.organization.groups > (method) list > (params) default>)
##### ReturnsExpand Collapse
type Group struct{…}
Details about an organization group.
ID string
Identifier for the group.
[](<#(resource) admin.organization.groups > (model) group > (schema) > (property) id>)
CreatedAt int64
Unix timestamp (in seconds) when the group was created.
formatunixtime
[](<#(resource) admin.organization.groups > (model) group > (schema) > (property) created_at>)
IsScimManaged bool
Whether the group is managed through SCIM and controlled by your identity provider.
[](<#(resource) admin.organization.groups > (model) group > (schema) > (property) is_scim_managed>)
Name string
Display name of the group.
[](<#(resource) admin.organization.groups > (model) group > (schema) > (property) name>)
[](<#(resource) admin.organization.groups > (model) group > (schema)>)
### List groups
Go
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
`package main
import (
"context"
"fmt"
"github.com/openai/openai-go"
"github.com/openai/openai-go/option"
)
func main() {
client := openai.NewClient(
option.WithAdminAPIKey("My Admin API Key"),
)
page, err := client.Admin.Organization.Groups.List(context.TODO(), openai.AdminOrganizationGroupListParams{
})
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", page)
}
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