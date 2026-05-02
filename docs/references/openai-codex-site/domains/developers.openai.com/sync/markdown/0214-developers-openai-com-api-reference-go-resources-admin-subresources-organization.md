List group users | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Admin](/api/reference/go/resources/admin)
[Organization](/api/reference/go/resources/admin/subresources/organization)
[Groups](/api/reference/go/resources/admin/subresources/organization/subresources/groups)
[Users](/api/reference/go/resources/admin/subresources/organization/subresources/groups/subresources/users)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List group users
client.Admin.Organization.Groups.Users.List(ctx, groupID, query) (\*CursorPage[[OrganizationUser](</api/reference/go/resources/admin#(resource) admin.organization.users > (model) organization_user > (schema)>)], error)
GET/organization/groups/{group\_id}/users
Lists the users assigned to a group.
##### ParametersExpand Collapse
groupID string
[](<#(resource) admin.organization.groups.users > (method) list > (params) default > (param) group_id > (schema)>)
query AdminOrganizationGroupUserListParams
After param.Field[string]Optional
A cursor for use in pagination. Provide the ID of the last user from the previous list response to retrieve the next page.
[](<#(resource) admin.organization.groups.users > (method) list > (params) default > (param) after>)
Limit param.Field[int64]Optional
A limit on the number of users to be returned. Limit can range between 0 and 1000, and the default is 100.
minimum0
maximum1000
[](<#(resource) admin.organization.groups.users > (method) list > (params) default > (param) limit>)
Order param.Field[[AdminOrganizationGroupUserListParamsOrder](</api/reference/go/resources/admin/subresources/organization/subresources/groups/subresources/users/methods/list#(resource) admin.organization.groups.users > (method) list > (params) default > (param) order > (schema)>)]Optional
Specifies the sort order of users in the list.
const AdminOrganizationGroupUserListParamsOrderAsc [AdminOrganizationGroupUserListParamsOrder](</api/reference/go/resources/admin/subresources/organization/subresources/groups/subresources/users/methods/list#(resource) admin.organization.groups.users > (method) list > (params) default > (param) order > (schema)>) = "asc"
[](<#(resource) admin.organization.groups.users > (method) list > (params) default > (param) order > (schema) > (member) 0>)
const AdminOrganizationGroupUserListParamsOrderDesc [AdminOrganizationGroupUserListParamsOrder](</api/reference/go/resources/admin/subresources/organization/subresources/groups/subresources/users/methods/list#(resource) admin.organization.groups.users > (method) list > (params) default > (param) order > (schema)>) = "desc"
[](<#(resource) admin.organization.groups.users > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) admin.organization.groups.users > (method) list > (params) default > (param) order>)
[](<#(resource) admin.organization.groups.users > (method) list > (params) default>)
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
### List group users
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
page, err := client.Admin.Organization.Groups.Users.List(
context.TODO(),
"group\_id",
openai.AdminOrganizationGroupUserListParams{
},
)
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
"id": "user\_abc123",
"name": "Ada Lovelace",
"email": "ada@example.com",
"role": "owner",
"added\_at": 1711471533
}
],
"has\_more": false,
"next": null
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
"id": "user\_abc123",
"name": "Ada Lovelace",
"email": "ada@example.com",
"role": "owner",
"added\_at": 1711471533
}
],
"has\_more": false,
"next": null
}
`
```