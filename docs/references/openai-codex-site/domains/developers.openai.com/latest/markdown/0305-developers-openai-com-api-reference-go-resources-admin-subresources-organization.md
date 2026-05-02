Modify project user | OpenAI API Reference
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
# Modify project user
client.Admin.Organization.Projects.Users.Update(ctx, projectID, userID, body) (\*[ProjectUser](</api/reference/go/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>), error)
POST/organization/projects/{project\_id}/users/{user\_id}
Modifies a user’s role in the project.
##### ParametersExpand Collapse
projectID string
[](<#(resource) admin.organization.projects.users > (method) update > (params) default > (param) project_id > (schema)>)
userID string
[](<#(resource) admin.organization.projects.users > (method) update > (params) default > (param) user_id > (schema)>)
body AdminOrganizationProjectUserUpdateParams
Role param.Field[[AdminOrganizationProjectUserUpdateParamsRole](</api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/update#(resource) admin.organization.projects.users > (method) update > (params) default > (param) role > (schema)>)]
`owner` or `member`
const AdminOrganizationProjectUserUpdateParamsRoleOwner [AdminOrganizationProjectUserUpdateParamsRole](</api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/update#(resource) admin.organization.projects.users > (method) update > (params) default > (param) role > (schema)>) = "owner"
[](<#(resource) admin.organization.projects.users > (method) update > (params) default > (param) role > (schema) > (member) 0>)
const AdminOrganizationProjectUserUpdateParamsRoleMember [AdminOrganizationProjectUserUpdateParamsRole](</api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/users/methods/update#(resource) admin.organization.projects.users > (method) update > (params) default > (param) role > (schema)>) = "member"
[](<#(resource) admin.organization.projects.users > (method) update > (params) default > (param) role > (schema) > (member) 1>)
[](<#(resource) admin.organization.projects.users > (method) update > (params) default > (param) role>)
[](<#(resource) admin.organization.projects.users > (method) update > (params) default>)
##### ReturnsExpand Collapse
type ProjectUser struct{…}
Represents an individual user in a project.
ID string
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) id>)
AddedAt int64
The Unix timestamp (in seconds) of when the project was added.
formatunixtime
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) added_at>)
Email string
The email address of the user
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) email>)
Name string
The name of the user
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) name>)
Object OrganizationProjectUser
The object type, which is always `organization.project.user`
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) object>)
Role ProjectUserRole
`owner` or `member`
One of the following:
const ProjectUserRoleOwner ProjectUserRole = "owner"
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role > (member) 0>)
const ProjectUserRoleMember ProjectUserRole = "member"
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema)>)
### Modify project user
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
projectUser, err := client.Admin.Organization.Projects.Users.Update(
context.TODO(),
"project\_id",
"user\_id",
openai.AdminOrganizationProjectUserUpdateParams{
Role: openai.AdminOrganizationProjectUserUpdateParamsRoleOwner,
},
)
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", projectUser.ID)
}
`
```
```
`{
"object": "organization.project.user",
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
"object": "organization.project.user",
"id": "user\_abc",
"name": "First Last",
"email": "user@example.com",
"role": "owner",
"added\_at": 1711471533
}
`
```