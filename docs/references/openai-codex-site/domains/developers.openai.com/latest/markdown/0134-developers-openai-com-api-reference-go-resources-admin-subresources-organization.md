Remove group user | OpenAI API Reference
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
# Remove group user
client.Admin.Organization.Groups.Users.Delete(ctx, groupID, userID) (\*[AdminOrganizationGroupUserDeleteResponse](</api/reference/go/resources/admin#(resource) admin.organization.groups.users > (model) AdminOrganizationGroupUserDeleteResponse > (schema)>), error)
DELETE/organization/groups/{group\_id}/users/{user\_id}
Removes a user from a group.
##### ParametersExpand Collapse
groupID string
[](<#(resource) admin.organization.groups.users > (method) delete > (params) default > (param) group_id > (schema)>)
userID string
[](<#(resource) admin.organization.groups.users > (method) delete > (params) default > (param) user_id > (schema)>)
##### ReturnsExpand Collapse
type AdminOrganizationGroupUserDeleteResponse struct{…}
Confirmation payload returned after removing a user from a group.
Deleted bool
Whether the group membership was removed.
[](<#(resource) admin.organization.groups.users > (model) AdminOrganizationGroupUserDeleteResponse > (schema) > (property) deleted>)
Object GroupUserDeleted
Always `group.user.deleted`.
[](<#(resource) admin.organization.groups.users > (model) AdminOrganizationGroupUserDeleteResponse > (schema) > (property) object>)
[](<#(resource) admin.organization.groups.users > (model) AdminOrganizationGroupUserDeleteResponse > (schema)>)
### Remove group user
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
user, err := client.Admin.Organization.Groups.Users.Delete(
context.TODO(),
"group\_id",
"user\_id",
)
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", user.Deleted)
}
`
```
```
`{
"object": "group.user.deleted",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"object": "group.user.deleted",
"deleted": true
}
`
```