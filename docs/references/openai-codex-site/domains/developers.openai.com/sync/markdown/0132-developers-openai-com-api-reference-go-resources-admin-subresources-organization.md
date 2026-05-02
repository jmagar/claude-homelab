List group organization role assignments | OpenAI API Reference
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
# List group organization role assignments
client.Admin.Organization.Groups.Roles.List(ctx, groupID, query) (\*CursorPage[[AdminOrganizationGroupRoleListResponse](</api/reference/go/resources/admin#(resource) admin.organization.groups.roles > (model) AdminOrganizationGroupRoleListResponse > (schema)>)], error)
GET/organization/groups/{group\_id}/roles
Lists the organization roles assigned to a group within the organization.
##### ParametersExpand Collapse
groupID string
[](<#(resource) admin.organization.groups.roles > (method) list > (params) default > (param) group_id > (schema)>)
query AdminOrganizationGroupRoleListParams
After param.Field[string]Optional
Cursor for pagination. Provide the value from the previous response’s `next` field to continue listing organization roles.
[](<#(resource) admin.organization.groups.roles > (method) list > (params) default > (param) after>)
Limit param.Field[int64]Optional
A limit on the number of organization role assignments to return.
minimum0
maximum1000
[](<#(resource) admin.organization.groups.roles > (method) list > (params) default > (param) limit>)
Order param.Field[[AdminOrganizationGroupRoleListParamsOrder](</api/reference/go/resources/admin/subresources/organization/subresources/groups/subresources/roles/methods/list#(resource) admin.organization.groups.roles > (method) list > (params) default > (param) order > (schema)>)]Optional
Sort order for the returned organization roles.
const AdminOrganizationGroupRoleListParamsOrderAsc [AdminOrganizationGroupRoleListParamsOrder](</api/reference/go/resources/admin/subresources/organization/subresources/groups/subresources/roles/methods/list#(resource) admin.organization.groups.roles > (method) list > (params) default > (param) order > (schema)>) = "asc"
[](<#(resource) admin.organization.groups.roles > (method) list > (params) default > (param) order > (schema) > (member) 0>)
const AdminOrganizationGroupRoleListParamsOrderDesc [AdminOrganizationGroupRoleListParamsOrder](</api/reference/go/resources/admin/subresources/organization/subresources/groups/subresources/roles/methods/list#(resource) admin.organization.groups.roles > (method) list > (params) default > (param) order > (schema)>) = "desc"
[](<#(resource) admin.organization.groups.roles > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) admin.organization.groups.roles > (method) list > (params) default > (param) order>)
[](<#(resource) admin.organization.groups.roles > (method) list > (params) default>)
##### ReturnsExpand Collapse
type AdminOrganizationGroupRoleListResponse struct{…}
Detailed information about a role assignment entry returned when listing assignments.
ID string
Identifier for the role.
[](<#(resource) admin.organization.groups.roles > (model) AdminOrganizationGroupRoleListResponse > (schema) > (property) id>)
CreatedAt int64
When the role was created.
formatunixtime
[](<#(resource) admin.organization.groups.roles > (model) AdminOrganizationGroupRoleListResponse > (schema) > (property) created_at>)
CreatedBy string
Identifier of the actor who created the role.
[](<#(resource) admin.organization.groups.roles > (model) AdminOrganizationGroupRoleListResponse > (schema) > (property) created_by>)
CreatedByUserObj map[string, any]
User details for the actor that created the role, when available.
[](<#(resource) admin.organization.groups.roles > (model) AdminOrganizationGroupRoleListResponse > (schema) > (property) created_by_user_obj>)
Description string
Description of the role.
[](<#(resource) admin.organization.groups.roles > (model) AdminOrganizationGroupRoleListResponse > (schema) > (property) description>)
Metadata map[string, any]
Arbitrary metadata stored on the role.
[](<#(resource) admin.organization.groups.roles > (model) AdminOrganizationGroupRoleListResponse > (schema) > (property) metadata>)
Name string
Name of the role.
[](<#(resource) admin.organization.groups.roles > (model) AdminOrganizationGroupRoleListResponse > (schema) > (property) name>)
Permissions []string
Permissions associated with the role.
[](<#(resource) admin.organization.groups.roles > (model) AdminOrganizationGroupRoleListResponse > (schema) > (property) permissions>)
PredefinedRole bool
Whether the role is predefined by OpenAI.
[](<#(resource) admin.organization.groups.roles > (model) AdminOrganizationGroupRoleListResponse > (schema) > (property) predefined_role>)
ResourceType string
Resource type the role applies to.
[](<#(resource) admin.organization.groups.roles > (model) AdminOrganizationGroupRoleListResponse > (schema) > (property) resource_type>)
UpdatedAt int64
When the role was last updated.
formatint64
[](<#(resource) admin.organization.groups.roles > (model) AdminOrganizationGroupRoleListResponse > (schema) > (property) updated_at>)
[](<#(resource) admin.organization.groups.roles > (model) AdminOrganizationGroupRoleListResponse > (schema)>)
### List group organization role assignments
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
page, err := client.Admin.Organization.Groups.Roles.List(
context.TODO(),
"group\_id",
openai.AdminOrganizationGroupRoleListParams{
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
"id": "role\_01J1F8ROLE01",
"name": "API Group Manager",
"permissions": [
"api.groups.read",
"api.groups.write"
],
"resource\_type": "api.organization",
"predefined\_role": false,
"description": "Allows managing organization groups",
"created\_at": 1711471533,
"updated\_at": 1711472599,
"created\_by": "user\_abc123",
"created\_by\_user\_obj": {
"id": "user\_abc123",
"name": "Ada Lovelace",
"email": "ada@example.com"
},
"metadata": {}
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
"id": "role\_01J1F8ROLE01",
"name": "API Group Manager",
"permissions": [
"api.groups.read",
"api.groups.write"
],
"resource\_type": "api.organization",
"predefined\_role": false,
"description": "Allows managing organization groups",
"created\_at": 1711471533,
"updated\_at": 1711472599,
"created\_by": "user\_abc123",
"created\_by\_user\_obj": {
"id": "user\_abc123",
"name": "Ada Lovelace",
"email": "ada@example.com"
},
"metadata": {}
}
],
"has\_more": false,
"next": null
}
`
```