Unassign organization role from user | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Admin](/api/reference/go/resources/admin)
[Organization](/api/reference/go/resources/admin/subresources/organization)
[Users](/api/reference/go/resources/admin/subresources/organization/subresources/users)
[Roles](/api/reference/go/resources/admin/subresources/organization/subresources/users/subresources/roles)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Unassign organization role from user
client.Admin.Organization.Users.Roles.Delete(ctx, userID, roleID) (\*[AdminOrganizationUserRoleDeleteResponse](</api/reference/go/resources/admin#(resource) admin.organization.users.roles > (model) AdminOrganizationUserRoleDeleteResponse > (schema)>), error)
DELETE/organization/users/{user\_id}/roles/{role\_id}
Unassigns an organization role from a user within the organization.
##### ParametersExpand Collapse
userID string
[](<#(resource) admin.organization.users.roles > (method) delete > (params) default > (param) user_id > (schema)>)
roleID string
[](<#(resource) admin.organization.users.roles > (method) delete > (params) default > (param) role_id > (schema)>)
##### ReturnsExpand Collapse
type AdminOrganizationUserRoleDeleteResponse struct{…}
Confirmation payload returned after unassigning a role.
Deleted bool
Whether the assignment was removed.
[](<#(resource) admin.organization.users.roles > (model) AdminOrganizationUserRoleDeleteResponse > (schema) > (property) deleted>)
Object string
Identifier for the deleted assignment, such as `group.role.deleted` or `user.role.deleted`.
[](<#(resource) admin.organization.users.roles > (model) AdminOrganizationUserRoleDeleteResponse > (schema) > (property) object>)
[](<#(resource) admin.organization.users.roles > (model) AdminOrganizationUserRoleDeleteResponse > (schema)>)
### Unassign organization role from user
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
role, err := client.Admin.Organization.Users.Roles.Delete(
context.TODO(),
"user\_id",
"role\_id",
)
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", role.Deleted)
}
`
```
```
`{
"object": "user.role.deleted",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"object": "user.role.deleted",
"deleted": true
}
`
```