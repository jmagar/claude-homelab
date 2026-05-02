Modify user | OpenAI API Reference
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
# Modify user
client.Admin.Organization.Users.Update(ctx, userID, body) (\*[OrganizationUser](</api/reference/go/resources/admin#(resource) admin.organization.users > (model) organization_user > (schema)>), error)
POST/organization/users/{user\_id}
Modifies a user’s role in the organization.
##### ParametersExpand Collapse
userID string
[](<#(resource) admin.organization.users > (method) update > (params) default > (param) user_id > (schema)>)
body AdminOrganizationUserUpdateParams
Role param.Field[[AdminOrganizationUserUpdateParamsRole](</api/reference/go/resources/admin/subresources/organization/subresources/users/methods/update#(resource) admin.organization.users > (method) update > (params) default > (param) role > (schema)>)]
`owner` or `reader`
const AdminOrganizationUserUpdateParamsRoleOwner [AdminOrganizationUserUpdateParamsRole](</api/reference/go/resources/admin/subresources/organization/subresources/users/methods/update#(resource) admin.organization.users > (method) update > (params) default > (param) role > (schema)>) = "owner"
[](<#(resource) admin.organization.users > (method) update > (params) default > (param) role > (schema) > (member) 0>)
const AdminOrganizationUserUpdateParamsRoleReader [AdminOrganizationUserUpdateParamsRole](</api/reference/go/resources/admin/subresources/organization/subresources/users/methods/update#(resource) admin.organization.users > (method) update > (params) default > (param) role > (schema)>) = "reader"
[](<#(resource) admin.organization.users > (method) update > (params) default > (param) role > (schema) > (member) 1>)
[](<#(resource) admin.organization.users > (method) update > (params) default > (param) role>)
[](<#(resource) admin.organization.users > (method) update > (params) default>)
##### ReturnsExpand Collapse
type OrganizationUser struct{…}
Represents an individual `user` within an organization.
ID string
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) id>)
AddedAt int64
The Unix timestamp (in seconds) of when the user was added.
formatunixtime
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) added_at>)
Email string
The email address of the user
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) email>)
Name string
The name of the user
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) name>)
Object OrganizationUser
The object type, which is always `organization.user`
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) object>)
Role OrganizationUserRole
`owner` or `reader`
One of the following:
const OrganizationUserRoleOwner OrganizationUserRole = "owner"
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) role > (member) 0>)
const OrganizationUserRoleReader OrganizationUserRole = "reader"
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.users > (model) organization_user > (schema) > (property) role>)
[](<#(resource) admin.organization.users > (model) organization_user > (schema)>)
### Modify user
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
organizationUser, err := client.Admin.Organization.Users.Update(
context.TODO(),
"user\_id",
openai.AdminOrganizationUserUpdateParams{
Role: openai.AdminOrganizationUserUpdateParamsRoleOwner,
},
)
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", organizationUser.ID)
}
`
```
```
`{
"object": "organization.user",
"id": "user\_abc",
"name": "First Last",
"email": "user@example.com",
"role": "owner",
"added\_at": 1711471533
}
`
```
##### Returns Examples
```
`{
"object": "organization.user",
"id": "user\_abc",
"name": "First Last",
"email": "user@example.com",
"role": "owner",
"added\_at": 1711471533
}
`
```