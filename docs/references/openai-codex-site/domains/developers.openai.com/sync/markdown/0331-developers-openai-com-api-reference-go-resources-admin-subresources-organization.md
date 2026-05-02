Delete user | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Admin](/api/reference/go/resources/admin)
[Organization](/api/reference/go/resources/admin/subresources/organization)
[Users](/api/reference/go/resources/admin/subresources/organization/subresources/users)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete user
client.Admin.Organization.Users.Delete(ctx, userID) (\*[AdminOrganizationUserDeleteResponse](</api/reference/go/resources/admin#(resource) admin.organization.users > (model) AdminOrganizationUserDeleteResponse > (schema)>), error)
DELETE/organization/users/{user\_id}
Deletes a user from the organization.
##### ParametersExpand Collapse
userID string
[](<#(resource) admin.organization.users > (method) delete > (params) default > (param) user_id > (schema)>)
##### ReturnsExpand Collapse
type AdminOrganizationUserDeleteResponse struct{…}
ID string
[](<#(resource) admin.organization.users > (model) AdminOrganizationUserDeleteResponse > (schema) > (property) id>)
Deleted bool
[](<#(resource) admin.organization.users > (model) AdminOrganizationUserDeleteResponse > (schema) > (property) deleted>)
Object OrganizationUserDeleted
[](<#(resource) admin.organization.users > (model) AdminOrganizationUserDeleteResponse > (schema) > (property) object>)
[](<#(resource) admin.organization.users > (model) AdminOrganizationUserDeleteResponse > (schema)>)
### Delete user
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
user, err := client.Admin.Organization.Users.Delete(context.TODO(), "user\_id")
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", user.ID)
}
`
```
```
`{
"object": "organization.user.deleted",
"id": "user\_abc",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"object": "organization.user.deleted",
"id": "user\_abc",
"deleted": true
}
`
```