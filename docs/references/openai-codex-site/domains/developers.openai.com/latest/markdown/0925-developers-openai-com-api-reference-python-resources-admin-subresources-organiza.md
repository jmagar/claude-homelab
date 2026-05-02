Delete project user | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Admin](/api/reference/python/resources/admin)
[Organization](/api/reference/python/resources/admin/subresources/organization)
[Projects](/api/reference/python/resources/admin/subresources/organization/subresources/projects)
[Users](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/users)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete project user
admin.organization.projects.users.delete(struser\_id, UserDeleteParams\*\*kwargs) -\> [UserDeleteResponse](</api/reference/python/resources/admin#(resource) admin.organization.projects.users > (model) user_delete_response > (schema)>)
DELETE/organization/projects/{project\_id}/users/{user\_id}
Deletes a user from the project.
Returns confirmation of project user deletion, or an error if the project is
archived (archived projects have no users).
##### ParametersExpand Collapse
project\_id: str
[](<#(resource) admin.organization.projects.users > (method) delete > (params) default > (param) project_id > (schema)>)
user\_id: str
[](<#(resource) admin.organization.projects.users > (method) delete > (params) default > (param) user_id > (schema)>)
##### ReturnsExpand Collapse
class UserDeleteResponse: …
id: str
[](<#(resource) admin.organization.projects.users > (model) user_delete_response > (schema) > (property) id>)
deleted: bool
[](<#(resource) admin.organization.projects.users > (model) user_delete_response > (schema) > (property) deleted>)
object: Literal["organization.project.user.deleted"]
[](<#(resource) admin.organization.projects.users > (model) user_delete_response > (schema) > (property) object>)
[](<#(resource) admin.organization.projects.users > (model) user_delete_response > (schema)>)
### Delete project user
Python
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
`import os
from openai import OpenAI
client = OpenAI(
admin\_api\_key=os.environ.get("OPENAI\_ADMIN\_KEY"), # This is the default and can be omitted
)
user = client.admin.organization.projects.users.delete(
user\_id="user\_id",
project\_id="project\_id",
)
print(user.id)`
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