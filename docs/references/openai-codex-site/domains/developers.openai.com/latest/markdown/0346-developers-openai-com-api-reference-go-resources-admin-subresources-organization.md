Delete project user | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Admin](/api/reference/go/resources/admin)
[Organization](/api/reference/go/resources/admin/subresources/organization)
[Projects](/api/reference/go/resources/admin/subresources/organization/subresources/projects)
[Users](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/users)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete project user
client.Admin.Organization.Projects.Users.Delete(ctx, projectID, userID) (\*[AdminOrganizationProjectUserDeleteResponse](</api/reference/go/resources/admin#(resource) admin.organization.projects.users > (model) AdminOrganizationProjectUserDeleteResponse > (schema)>), error)
DELETE/organization/projects/{project\_id}/users/{user\_id}
Deletes a user from the project.
Returns confirmation of project user deletion, or an error if the project is
archived (archived projects have no users).
##### ParametersExpand Collapse
projectID string
[](<#(resource) admin.organization.projects.users > (method) delete > (params) default > (param) project_id > (schema)>)
userID string
[](<#(resource) admin.organization.projects.users > (method) delete > (params) default > (param) user_id > (schema)>)
##### ReturnsExpand Collapse
type AdminOrganizationProjectUserDeleteResponse struct{…}
ID string
[](<#(resource) admin.organization.projects.users > (model) AdminOrganizationProjectUserDeleteResponse > (schema) > (property) id>)
Deleted bool
[](<#(resource) admin.organization.projects.users > (model) AdminOrganizationProjectUserDeleteResponse > (schema) > (property) deleted>)
Object OrganizationProjectUserDeleted
[](<#(resource) admin.organization.projects.users > (model) AdminOrganizationProjectUserDeleteResponse > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.users > (model) AdminOrganizationProjectUserDeleteResponse > (schema)>)
### Delete project user
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
user, err := client.Admin.Organization.Projects.Users.Delete(
context.TODO(),
"project\_id",
"user\_id",
)
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", user.ID)
}
`
```
```
`{
"object": "organization.project.user.deleted",
"id": "user\_abc",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"object": "organization.project.user.deleted",
"id": "user\_abc",
"deleted": true
}
`
```