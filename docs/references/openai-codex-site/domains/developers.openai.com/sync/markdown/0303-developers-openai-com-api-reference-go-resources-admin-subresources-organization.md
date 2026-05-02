List users | OpenAI API Reference
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
# List users
client.Admin.Organization.Users.List(ctx, query) (\*ConversationCursorPage[[OrganizationUser](</api/reference/go/resources/admin#(resource) admin.organization.users > (model) organization_user > (schema)>)], error)
GET/organization/users
Lists all of the users in the organization.
##### ParametersExpand Collapse
query AdminOrganizationUserListParams
After param.Field[string]Optional
A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj\_foo, your subsequent call can include after=obj\_foo in order to fetch the next page of the list.
[](<#(resource) admin.organization.users > (method) list > (params) default > (param) after>)
Emails param.Field[[]string]Optional
Filter by the email address of users.
[](<#(resource) admin.organization.users > (method) list > (params) default > (param) emails>)
Limit param.Field[int64]Optional
A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
[](<#(resource) admin.organization.users > (method) list > (params) default > (param) limit>)
[](<#(resource) admin.organization.users > (method) list > (params) default>)
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
### List users
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
page, err := client.Admin.Organization.Users.List(context.TODO(), openai.AdminOrganizationUserListParams{
})
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", page)
}
`
```
```
`{
"object": "list",
"data": [
{
"object": "organization.user",
"id": "user\_abc",
"name": "First Last",
"email": "user@example.com",
"role": "owner",
"added\_at": 1711471533
}
],
"first\_id": "user-abc",
"last\_id": "user-xyz",
"has\_more": false
}
`
```
##### Returns Examples
```
`{
"object": "list",
"data": [
{
"object": "organization.user",
"id": "user\_abc",
"name": "First Last",
"email": "user@example.com",
"role": "owner",
"added\_at": 1711471533
}
],
"first\_id": "user-abc",
"last\_id": "user-xyz",
"has\_more": false
}
`
```