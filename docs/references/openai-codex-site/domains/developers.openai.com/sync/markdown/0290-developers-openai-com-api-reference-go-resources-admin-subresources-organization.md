Delete project role | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Admin](/api/reference/go/resources/admin)
[Organization](/api/reference/go/resources/admin/subresources/organization)
[Projects](/api/reference/go/resources/admin/subresources/organization/subresources/projects)
[Roles](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/roles)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete project role
client.Admin.Organization.Projects.Roles.Delete(ctx, projectID, roleID) (\*[AdminOrganizationProjectRoleDeleteResponse](</api/reference/go/resources/admin#(resource) admin.organization.projects.roles > (model) AdminOrganizationProjectRoleDeleteResponse > (schema)>), error)
DELETE/projects/{project\_id}/roles/{role\_id}
Deletes a custom role from a project.
##### ParametersExpand Collapse
projectID string
[](<#(resource) admin.organization.projects.roles > (method) delete > (params) default > (param) project_id > (schema)>)
roleID string
[](<#(resource) admin.organization.projects.roles > (method) delete > (params) default > (param) role_id > (schema)>)
##### ReturnsExpand Collapse
type AdminOrganizationProjectRoleDeleteResponse struct{…}
Confirmation payload returned after deleting a role.
ID string
Identifier of the deleted role.
[](<#(resource) admin.organization.projects.roles > (model) AdminOrganizationProjectRoleDeleteResponse > (schema) > (property) id>)
Deleted bool
Whether the role was deleted.
[](<#(resource) admin.organization.projects.roles > (model) AdminOrganizationProjectRoleDeleteResponse > (schema) > (property) deleted>)
Object RoleDeleted
Always `role.deleted`.
[](<#(resource) admin.organization.projects.roles > (model) AdminOrganizationProjectRoleDeleteResponse > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.roles > (model) AdminOrganizationProjectRoleDeleteResponse > (schema)>)
### Delete project role
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
role, err := client.Admin.Organization.Projects.Roles.Delete(
context.TODO(),
"project\_id",
"role\_id",
)
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
"id": "role\_01J1F8PROJ",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"object": "role.deleted",
"id": "role\_01J1F8PROJ",
"deleted": true
}
`
```