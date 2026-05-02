List project rate limits | OpenAI API Reference
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
# List project rate limits
admin.organization.projects.rate\_limits.list\_rate\_limits(strproject\_id, RateLimitListRateLimitsParams\*\*kwargs) -\> SyncConversationCursorPage[[ProjectRateLimit](</api/reference/python/resources/admin#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema)>)]
GET/organization/projects/{project\_id}/rate\_limits
Returns the rate limits per model for a project.
##### ParametersExpand Collapse
project\_id: str
[](<#(resource) admin.organization.projects.rate_limits > (method) list_rate_limits > (params) default > (param) project_id > (schema)>)
after: Optional[str]
A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj\_foo, your subsequent call can include after=obj\_foo in order to fetch the next page of the list.
[](<#(resource) admin.organization.projects.rate_limits > (method) list_rate_limits > (params) default > (param) after > (schema)>)
before: Optional[str]
A cursor for use in pagination. `before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, beginning with obj\_foo, your subsequent call can include before=obj\_foo in order to fetch the previous page of the list.
[](<#(resource) admin.organization.projects.rate_limits > (method) list_rate_limits > (params) default > (param) before > (schema)>)
limit: Optional[int]
A limit on the number of objects to be returned. The default is 100.
[](<#(resource) admin.organization.projects.rate_limits > (method) list_rate_limits > (params) default > (param) limit > (schema)>)
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
### List project rate limits
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
page = client.admin.organization.projects.rate\_limits.list\_rate\_limits(
project\_id="project\_id",
)
page = page.data[0]
print(page.id)`
```
```
`{
"object": "list",
"data": [
{
"object": "project.rate\_limit",
"id": "rl-ada",
"model": "ada",
"max\_requests\_per\_1\_minute": 600,
"max\_tokens\_per\_1\_minute": 150000,
"max\_images\_per\_1\_minute": 10
}
],
"first\_id": "rl-ada",
"last\_id": "rl-ada",
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
"object": "project.rate\_limit",
"id": "rl-ada",
"model": "ada",
"max\_requests\_per\_1\_minute": 600,
"max\_tokens\_per\_1\_minute": 150000,
"max\_images\_per\_1\_minute": 10
}
],
"first\_id": "rl-ada",
"last\_id": "rl-ada",
"has\_more": false
}
`
```