Update group | OpenAI API Reference
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
# Update group
client.Admin.Organization.Groups.Update(ctx, groupID, body) (\*[AdminOrganizationGroupUpdateResponse](</api/reference/go/resources/admin#(resource) admin.organization.groups > (model) AdminOrganizationGroupUpdateResponse > (schema)>), error)
POST/organization/groups/{group\_id}
Updates a group’s information.
##### ParametersExpand Collapse
groupID string
[](<#(resource) admin.organization.groups > (method) update > (params) default > (param) group_id > (schema)>)
body AdminOrganizationGroupUpdateParams
Name param.Field[string]
New display name for the group.
minLength1
maxLength255
[](<#(resource) admin.organization.groups > (method) update > (params) default > (param) name>)
[](<#(resource) admin.organization.groups > (method) update > (params) default>)
##### ReturnsExpand Collapse
type AdminOrganizationGroupUpdateResponse struct{…}
Response returned after updating a group.
ID string
Identifier for the group.
[](<#(resource) admin.organization.groups > (model) AdminOrganizationGroupUpdateResponse > (schema) > (property) id>)
CreatedAt int64
Unix timestamp (in seconds) when the group was created.
formatunixtime
[](<#(resource) admin.organization.groups > (model) AdminOrganizationGroupUpdateResponse > (schema) > (property) created_at>)
IsScimManaged bool
Whether the group is managed through SCIM and controlled by your identity provider.
[](<#(resource) admin.organization.groups > (model) AdminOrganizationGroupUpdateResponse > (schema) > (property) is_scim_managed>)
Name string
Updated display name for the group.
[](<#(resource) admin.organization.groups > (model) AdminOrganizationGroupUpdateResponse > (schema) > (property) name>)
[](<#(resource) admin.organization.groups > (model) AdminOrganizationGroupUpdateResponse > (schema)>)
### Update group
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
group, err := client.Admin.Organization.Groups.Update(
context.TODO(),
"group\_id",
openai.AdminOrganizationGroupUpdateParams{
Name: "x",
},
)
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", group.ID)
}
`
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