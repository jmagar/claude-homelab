Create group | OpenAI API Reference
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
# Create group
client.Admin.Organization.Groups.New(ctx, body) (\*[Group](</api/reference/go/resources/admin#(resource) admin.organization.groups > (model) group > (schema)>), error)
POST/organization/groups
Creates a new group in the organization.
##### ParametersExpand Collapse
body AdminOrganizationGroupNewParams
Name param.Field[string]
Human readable name for the group.
minLength1
maxLength255
[](<#(resource) admin.organization.groups > (method) create > (params) default > (param) name>)
[](<#(resource) admin.organization.groups > (method) create > (params) default>)
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
### Create group
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
group, err := client.Admin.Organization.Groups.New(context.TODO(), openai.AdminOrganizationGroupNewParams{
Name: "x",
})
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", group.ID)
}
`
```
```
`{
"object": "group",
"id": "group\_01J1F8ABCDXYZ",
"name": "Support Team",
"created\_at": 1711471533,
"is\_scim\_managed": false
}
`
```
##### Returns Examples
```
`{
"object": "group",
"id": "group\_01J1F8ABCDXYZ",
"name": "Support Team",
"created\_at": 1711471533,
"is\_scim\_managed": false
}
`
```