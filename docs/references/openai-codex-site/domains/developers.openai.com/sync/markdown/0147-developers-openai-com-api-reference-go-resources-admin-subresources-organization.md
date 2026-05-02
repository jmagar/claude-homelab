Delete group | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Admin](/api/reference/go/resources/admin)
[Organization](/api/reference/go/resources/admin/subresources/organization)
[Groups](/api/reference/go/resources/admin/subresources/organization/subresources/groups)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete group
client.Admin.Organization.Groups.Delete(ctx, groupID) (\*[AdminOrganizationGroupDeleteResponse](</api/reference/go/resources/admin#(resource) admin.organization.groups > (model) AdminOrganizationGroupDeleteResponse > (schema)>), error)
DELETE/organization/groups/{group\_id}
Deletes a group from the organization.
##### ParametersExpand Collapse
groupID string
[](<#(resource) admin.organization.groups > (method) delete > (params) default > (param) group_id > (schema)>)
##### ReturnsExpand Collapse
type AdminOrganizationGroupDeleteResponse struct{…}
Confirmation payload returned after deleting a group.
ID string
Identifier of the deleted group.
[](<#(resource) admin.organization.groups > (model) AdminOrganizationGroupDeleteResponse > (schema) > (property) id>)
Deleted bool
Whether the group was deleted.
[](<#(resource) admin.organization.groups > (model) AdminOrganizationGroupDeleteResponse > (schema) > (property) deleted>)
Object GroupDeleted
Always `group.deleted`.
[](<#(resource) admin.organization.groups > (model) AdminOrganizationGroupDeleteResponse > (schema) > (property) object>)
[](<#(resource) admin.organization.groups > (model) AdminOrganizationGroupDeleteResponse > (schema)>)
### Delete group
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
group, err := client.Admin.Organization.Groups.Delete(context.TODO(), "group\_id")
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", group.ID)
}
`
```
```
`{
"object": "group.deleted",
"id": "group\_01J1F8ABCDXYZ",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"object": "group.deleted",
"id": "group\_01J1F8ABCDXYZ",
"deleted": true
}
`
```