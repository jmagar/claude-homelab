Unassign project role from group | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Admin](/api/reference/go/resources/admin)
[Organization](/api/reference/go/resources/admin/subresources/organization)
[Projects](/api/reference/go/resources/admin/subresources/organization/subresources/projects)
[Groups](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/groups)
[Roles](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/groups/subresources/roles)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Unassign project role from group
client.Admin.Organization.Projects.Groups.Roles.Delete(ctx, projectID, groupID, roleID) (\*[AdminOrganizationProjectGroupRoleDeleteResponse](</api/reference/go/resources/admin#(resource) admin.organization.projects.groups.roles > (model) AdminOrganizationProjectGroupRoleDeleteResponse > (schema)>), error)
DELETE/projects/{project\_id}/groups/{group\_id}/roles/{role\_id}
Unassigns a project role from a group within a project.
##### ParametersExpand Collapse
projectID string
[](<#(resource) admin.organization.projects.groups.roles > (method) delete > (params) default > (param) project_id > (schema)>)
groupID string
[](<#(resource) admin.organization.projects.groups.roles > (method) delete > (params) default > (param) group_id > (schema)>)
roleID string
[](<#(resource) admin.organization.projects.groups.roles > (method) delete > (params) default > (param) role_id > (schema)>)
##### ReturnsExpand Collapse
type AdminOrganizationProjectGroupRoleDeleteResponse struct{…}
Confirmation payload returned after unassigning a role.
Deleted bool
Whether the assignment was removed.
[](<#(resource) admin.organization.projects.groups.roles > (model) AdminOrganizationProjectGroupRoleDeleteResponse > (schema) > (property) deleted>)
Object string
Identifier for the deleted assignment, such as `group.role.deleted` or `user.role.deleted`.
[](<#(resource) admin.organization.projects.groups.roles > (model) AdminOrganizationProjectGroupRoleDeleteResponse > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.groups.roles > (model) AdminOrganizationProjectGroupRoleDeleteResponse > (schema)>)
### Unassign project role from group
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
role, err := client.Admin.Organization.Projects.Groups.Roles.Delete(
context.TODO(),
"project\_id",
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