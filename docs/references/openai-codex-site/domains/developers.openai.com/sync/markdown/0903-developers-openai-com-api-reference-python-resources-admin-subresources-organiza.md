Retrieve project user | OpenAI API Reference
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
# Retrieve project user
admin.organization.projects.users.retrieve(struser\_id, UserRetrieveParams\*\*kwargs) -\> [ProjectUser](</api/reference/python/resources/admin#(resource) admin.organization.projects.users > (model) project_user > (schema)>)
GET/organization/projects/{project\_id}/users/{user\_id}
Retrieves a user in the project.
##### ParametersExpand Collapse
project\_id: str
[](<#(resource) admin.organization.projects.users > (method) retrieve > (params) default > (param) project_id > (schema)>)
user\_id: str
[](<#(resource) admin.organization.projects.users > (method) retrieve > (params) default > (param) user_id > (schema)>)
##### ReturnsExpand Collapse
class ProjectUser: …
Represents an individual user in a project.
id: str
The identifier, which can be referenced in API endpoints
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) id>)
added\_at: int
The Unix timestamp (in seconds) of when the project was added.
formatunixtime
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) added_at>)
email: str
The email address of the user
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) email>)
name: str
The name of the user
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) name>)
object: Literal["organization.project.user"]
The object type, which is always `organization.project.user`
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) object>)
role: Literal["owner", "member"]
`owner` or `member`
One of the following:
"owner"
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role > (member) 0>)
"member"
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role > (member) 1>)
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema) > (property) role>)
[](<#(resource) admin.organization.projects.users > (model) project_user > (schema)>)
### Retrieve project user
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
project\_user = client.admin.organization.projects.users.retrieve(
user\_id="user\_id",
project\_id="project\_id",
)
print(project\_user.id)`
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