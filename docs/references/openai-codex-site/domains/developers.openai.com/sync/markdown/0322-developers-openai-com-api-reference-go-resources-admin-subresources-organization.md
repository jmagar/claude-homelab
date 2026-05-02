Remove project group | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Admin](/api/reference/go/resources/admin)
[Organization](/api/reference/go/resources/admin/subresources/organization)
[Projects](/api/reference/go/resources/admin/subresources/organization/subresources/projects)
[Groups](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/groups)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Remove project group
client.Admin.Organization.Projects.Groups.Delete(ctx, projectID, groupID) (\*[AdminOrganizationProjectGroupDeleteResponse](</api/reference/go/resources/admin#(resource) admin.organization.projects.groups > (model) AdminOrganizationProjectGroupDeleteResponse > (schema)>), error)
DELETE/organization/projects/{project\_id}/groups/{group\_id}
Revokes a group’s access to a project.
##### ParametersExpand Collapse
projectID string
[](<#(resource) admin.organization.projects.groups > (method) delete > (params) default > (param) project_id > (schema)>)
groupID string
[](<#(resource) admin.organization.projects.groups > (method) delete > (params) default > (param) group_id > (schema)>)
##### ReturnsExpand Collapse
type AdminOrganizationProjectGroupDeleteResponse struct{…}
Confirmation payload returned after removing a group from a project.
Deleted bool
Whether the group membership in the project was removed.
[](<#(resource) admin.organization.projects.groups > (model) AdminOrganizationProjectGroupDeleteResponse > (schema) > (property) deleted>)
Object ProjectGroupDeleted
Always `project.group.deleted`.
[](<#(resource) admin.organization.projects.groups > (model) AdminOrganizationProjectGroupDeleteResponse > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.groups > (model) AdminOrganizationProjectGroupDeleteResponse > (schema)>)
### Remove project group
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
group, err := client.Admin.Organization.Projects.Groups.Delete(
context.TODO(),
"project\_id",
"group\_id",
)
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", group.Deleted)
}
`
```
```
`{
"object": "project.group.deleted",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"object": "project.group.deleted",
"deleted": true
}
`
```