Modify project rate limit | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Admin](/api/reference/python/resources/admin)
[Organization](/api/reference/python/resources/admin/subresources/organization)
[Projects](/api/reference/python/resources/admin/subresources/organization/subresources/projects)
[Rate Limits](/api/reference/python/resources/admin/subresources/organization/subresources/projects/subresources/rate_limits)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Modify project rate limit
admin.organization.projects.rate\_limits.update\_rate\_limit(strrate\_limit\_id, RateLimitUpdateRateLimitParams\*\*kwargs) -\> [ProjectRateLimit](</api/reference/python/resources/admin#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema)>)
POST/organization/projects/{project\_id}/rate\_limits/{rate\_limit\_id}
Updates a project rate limit.
##### ParametersExpand Collapse
project\_id: str
[](<#(resource) admin.organization.projects.rate_limits > (method) update_rate_limit > (params) default > (param) project_id > (schema)>)
rate\_limit\_id: str
[](<#(resource) admin.organization.projects.rate_limits > (method) update_rate_limit > (params) default > (param) rate_limit_id > (schema)>)
batch\_1\_day\_max\_input\_tokens: Optional[int]
The maximum batch input tokens per day. Only relevant for certain models.
[](<#(resource) admin.organization.projects.rate_limits > (method) update_rate_limit > (params) default > (param) batch_1_day_max_input_tokens > (schema)>)
max\_audio\_megabytes\_per\_1\_minute: Optional[int]
The maximum audio megabytes per minute. Only relevant for certain models.
[](<#(resource) admin.organization.projects.rate_limits > (method) update_rate_limit > (params) default > (param) max_audio_megabytes_per_1_minute > (schema)>)
max\_images\_per\_1\_minute: Optional[int]
The maximum images per minute. Only relevant for certain models.
[](<#(resource) admin.organization.projects.rate_limits > (method) update_rate_limit > (params) default > (param) max_images_per_1_minute > (schema)>)
max\_requests\_per\_1\_day: Optional[int]
The maximum requests per day. Only relevant for certain models.
[](<#(resource) admin.organization.projects.rate_limits > (method) update_rate_limit > (params) default > (param) max_requests_per_1_day > (schema)>)
max\_requests\_per\_1\_minute: Optional[int]
The maximum requests per minute.
[](<#(resource) admin.organization.projects.rate_limits > (method) update_rate_limit > (params) default > (param) max_requests_per_1_minute > (schema)>)
max\_tokens\_per\_1\_minute: Optional[int]
The maximum tokens per minute.
[](<#(resource) admin.organization.projects.rate_limits > (method) update_rate_limit > (params) default > (param) max_tokens_per_1_minute > (schema)>)
##### ReturnsExpand Collapse
class ProjectRateLimit: …
Represents a project rate limit config.
id: str
The identifier, which can be referenced in API endpoints.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) id>)
max\_requests\_per\_1\_minute: int
The maximum requests per minute.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_requests_per_1_minute>)
max\_tokens\_per\_1\_minute: int
The maximum tokens per minute.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_tokens_per_1_minute>)
model: str
The model this rate limit applies to.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) model>)
object: Literal["project.rate\_limit"]
The object type, which is always `project.rate\_limit`
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) object>)
batch\_1\_day\_max\_input\_tokens: Optional[int]
The maximum batch input tokens per day. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) batch_1_day_max_input_tokens>)
max\_audio\_megabytes\_per\_1\_minute: Optional[int]
The maximum audio megabytes per minute. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_audio_megabytes_per_1_minute>)
max\_images\_per\_1\_minute: Optional[int]
The maximum images per minute. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_images_per_1_minute>)
max\_requests\_per\_1\_day: Optional[int]
The maximum requests per day. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_requests_per_1_day>)
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema)>)
### Modify project rate limit
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
project\_rate\_limit = client.admin.organization.projects.rate\_limits.update\_rate\_limit(
rate\_limit\_id="rate\_limit\_id",
project\_id="project\_id",
)
print(project\_rate\_limit.id)`
```
```
`{
"object": "project.rate\_limit",
"id": "rl-ada",
"model": "ada",
"max\_requests\_per\_1\_minute": 600,
"max\_tokens\_per\_1\_minute": 150000,
"max\_images\_per\_1\_minute": 10
}
`
```
##### Returns Examples
```
`{
"object": "project.rate\_limit",
"id": "rl-ada",
"model": "ada",
"max\_requests\_per\_1\_minute": 600,
"max\_tokens\_per\_1\_minute": 150000,
"max\_images\_per\_1\_minute": 10
}
`
```