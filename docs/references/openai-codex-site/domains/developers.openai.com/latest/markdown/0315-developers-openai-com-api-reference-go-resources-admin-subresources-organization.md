Delete organization role | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Admin](/api/reference/go/resources/admin)
[Organization](/api/reference/go/resources/admin/subresources/organization)
[Roles](/api/reference/go/resources/admin/subresources/organization/subresources/roles)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete organization role
client.Admin.Organization.Roles.Delete(ctx, roleID) (\*[AdminOrganizationRoleDeleteResponse](</api/reference/go/resources/admin#(resource) admin.organization.roles > (model) AdminOrganizationRoleDeleteResponse > (schema)>), error)
DELETE/organization/roles/{role\_id}
Deletes a custom role from the organization.
##### ParametersExpand Collapse
roleID string
[](<#(resource) admin.organization.roles > (method) delete > (params) default > (param) role_id > (schema)>)
##### ReturnsExpand Collapse
type AdminOrganizationRoleDeleteResponse struct{…}
Confirmation payload returned after deleting a role.
ID string
Identifier of the deleted role.
[](<#(resource) admin.organization.roles > (model) AdminOrganizationRoleDeleteResponse > (schema) > (property) id>)
Deleted bool
Whether the role was deleted.
[](<#(resource) admin.organization.roles > (model) AdminOrganizationRoleDeleteResponse > (schema) > (property) deleted>)
Object RoleDeleted
Always `role.deleted`.
[](<#(resource) admin.organization.roles > (model) AdminOrganizationRoleDeleteResponse > (schema) > (property) object>)
[](<#(resource) admin.organization.roles > (model) AdminOrganizationRoleDeleteResponse > (schema)>)
### Delete organization role
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
role, err := client.Admin.Organization.Roles.Delete(context.TODO(), "role\_id")
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", role.ID)
}
`
```
```
`{
"object": "role.deleted",
"id": "role\_01J1F8ROLE01",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"object": "role.deleted",
"id": "role\_01J1F8ROLE01",
"deleted": true
}
`
```