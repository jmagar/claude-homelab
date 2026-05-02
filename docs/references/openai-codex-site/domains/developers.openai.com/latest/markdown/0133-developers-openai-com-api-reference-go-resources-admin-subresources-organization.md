Delete invite | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Admin](/api/reference/go/resources/admin)
[Organization](/api/reference/go/resources/admin/subresources/organization)
[Invites](/api/reference/go/resources/admin/subresources/organization/subresources/invites)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete invite
client.Admin.Organization.Invites.Delete(ctx, inviteID) (\*[AdminOrganizationInviteDeleteResponse](</api/reference/go/resources/admin#(resource) admin.organization.invites > (model) AdminOrganizationInviteDeleteResponse > (schema)>), error)
DELETE/organization/invites/{invite\_id}
Delete an invite. If the invite has already been accepted, it cannot be deleted.
##### ParametersExpand Collapse
inviteID string
[](<#(resource) admin.organization.invites > (method) delete > (params) default > (param) invite_id > (schema)>)
##### ReturnsExpand Collapse
type AdminOrganizationInviteDeleteResponse struct{…}
ID string
[](<#(resource) admin.organization.invites > (model) AdminOrganizationInviteDeleteResponse > (schema) > (property) id>)
Deleted bool
[](<#(resource) admin.organization.invites > (model) AdminOrganizationInviteDeleteResponse > (schema) > (property) deleted>)
Object OrganizationInviteDeleted
The object type, which is always `organization.invite.deleted`
[](<#(resource) admin.organization.invites > (model) AdminOrganizationInviteDeleteResponse > (schema) > (property) object>)
[](<#(resource) admin.organization.invites > (model) AdminOrganizationInviteDeleteResponse > (schema)>)
### Delete invite
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
invite, err := client.Admin.Organization.Invites.Delete(context.TODO(), "invite\_id")
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", invite.ID)
}
`
```
```
`{
"object": "organization.invite.deleted",
"id": "invite-abc",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"object": "organization.invite.deleted",
"id": "invite-abc",
"deleted": true
}
`
```