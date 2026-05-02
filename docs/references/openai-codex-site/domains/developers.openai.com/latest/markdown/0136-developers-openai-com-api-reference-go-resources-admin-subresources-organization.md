Add group user | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Admin](/api/reference/go/resources/admin)
[Organization](/api/reference/go/resources/admin/subresources/organization)
[Groups](/api/reference/go/resources/admin/subresources/organization/subresources/groups)
[Users](/api/reference/go/resources/admin/subresources/organization/subresources/groups/subresources/users)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Add group user
client.Admin.Organization.Groups.Users.New(ctx, groupID, body) (\*[AdminOrganizationGroupUserNewResponse](</api/reference/go/resources/admin#(resource) admin.organization.groups.users > (model) AdminOrganizationGroupUserNewResponse > (schema)>), error)
POST/organization/groups/{group\_id}/users
Adds a user to a group.
##### ParametersExpand Collapse
groupID string
[](<#(resource) admin.organization.groups.users > (method) create > (params) default > (param) group_id > (schema)>)
body AdminOrganizationGroupUserNewParams
UserID param.Field[string]
Identifier of the user to add to the group.
[](<#(resource) admin.organization.groups.users > (method) create > (params) default > (param) user_id>)
[](<#(resource) admin.organization.groups.users > (method) create > (params) default>)
##### ReturnsExpand Collapse
type AdminOrganizationGroupUserNewResponse struct{…}
Confirmation payload returned after adding a user to a group.
GroupID string
Identifier of the group the user was added to.
[](<#(resource) admin.organization.groups.users > (model) AdminOrganizationGroupUserNewResponse > (schema) > (property) group_id>)
Object GroupUser
Always `group.user`.
[](<#(resource) admin.organization.groups.users > (model) AdminOrganizationGroupUserNewResponse > (schema) > (property) object>)
UserID string
Identifier of the user that was added.
[](<#(resource) admin.organization.groups.users > (model) AdminOrganizationGroupUserNewResponse > (schema) > (property) user_id>)
[](<#(resource) admin.organization.groups.users > (model) AdminOrganizationGroupUserNewResponse > (schema)>)
### Add group user
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
user, err := client.Admin.Organization.Groups.Users.New(
context.TODO(),
"group\_id",
openai.AdminOrganizationGroupUserNewParams{
UserID: "user\_id",
},
)
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", user.GroupID)
}
`
```
```
`{
"object": "group.user",
"user\_id": "user\_abc123",
"group\_id": "group\_01J1F8ABCDXYZ"
}
`
```
##### Returns Examples
```
`{
"object": "group.user",
"user\_id": "user\_abc123",
"group\_id": "group\_01J1F8ABCDXYZ"
}
`
```