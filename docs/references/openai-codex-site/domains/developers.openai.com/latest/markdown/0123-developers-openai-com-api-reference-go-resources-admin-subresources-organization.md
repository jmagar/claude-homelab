Unassign organization role from group | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Admin](/api/reference/go/resources/admin)
[Organization](/api/reference/go/resources/admin/subresources/organization)
[Groups](/api/reference/go/resources/admin/subresources/organization/subresources/groups)
[Roles](/api/reference/go/resources/admin/subresources/organization/subresources/groups/subresources/roles)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Unassign organization role from group
client.Admin.Organization.Groups.Roles.Delete(ctx, groupID, roleID) (\*[AdminOrganizationGroupRoleDeleteResponse](</api/reference/go/resources/admin#(resource) admin.organization.groups.roles > (model) AdminOrganizationGroupRoleDeleteResponse > (schema)>), error)
DELETE/organization/groups/{group\_id}/roles/{role\_id}
Unassigns an organization role from a group within the organization.
##### ParametersExpand Collapse
groupID string
[](<#(resource) admin.organization.groups.roles > (method) delete > (params) default > (param) group_id > (schema)>)
roleID string
[](<#(resource) admin.organization.groups.roles > (method) delete > (params) default > (param) role_id > (schema)>)
##### ReturnsExpand Collapse
type AdminOrganizationGroupRoleDeleteResponse struct{…}
Confirmation payload returned after unassigning a role.
Deleted bool
Whether the assignment was removed.
[](<#(resource) admin.organization.groups.roles > (model) AdminOrganizationGroupRoleDeleteResponse > (schema) > (property) deleted>)
Object string
Identifier for the deleted assignment, such as `group.role.deleted` or `user.role.deleted`.
[](<#(resource) admin.organization.groups.roles > (model) AdminOrganizationGroupRoleDeleteResponse > (schema) > (property) object>)
[](<#(resource) admin.organization.groups.roles > (model) AdminOrganizationGroupRoleDeleteResponse > (schema)>)
### Unassign organization role from group
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
role, err := client.Admin.Organization.Groups.Roles.Delete(
context.TODO(),
"group\_id",
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
"object": "group.role.deleted",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"object": "group.role.deleted",
"deleted": true
}
`
```