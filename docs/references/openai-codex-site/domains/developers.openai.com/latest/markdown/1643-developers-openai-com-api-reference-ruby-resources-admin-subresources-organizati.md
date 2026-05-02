Modify project rate limit | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Admin](/api/reference/ruby/resources/admin)
[Organization](/api/reference/ruby/resources/admin/subresources/organization)
[Projects](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects)
[Rate Limits](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/rate_limits)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Modify project rate limit
admin.organization.projects.rate\_limits.update\_rate\_limit(rate\_limit\_id, \*\*kwargs) -\> [ProjectRateLimit](</api/reference/ruby/resources/admin#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema)>) { id, max\_requests\_per\_1\_minute, max\_tokens\_per\_1\_minute, 6 more }
POST/organization/projects/{project\_id}/rate\_limits/{rate\_limit\_id}
Updates a project rate limit.
##### ParametersExpand Collapse
project\_id: String
[](<#(resource) admin.organization.projects.rate_limits > (method) update_rate_limit > (params) default > (param) project_id > (schema)>)
rate\_limit\_id: String
[](<#(resource) admin.organization.projects.rate_limits > (method) update_rate_limit > (params) default > (param) rate_limit_id > (schema)>)
batch\_1\_day\_max\_input\_tokens: Integer
The maximum batch input tokens per day. Only relevant for certain models.
[](<#(resource) admin.organization.projects.rate_limits > (method) update_rate_limit > (params) default > (param) batch_1_day_max_input_tokens > (schema)>)
max\_audio\_megabytes\_per\_1\_minute: Integer
The maximum audio megabytes per minute. Only relevant for certain models.
[](<#(resource) admin.organization.projects.rate_limits > (method) update_rate_limit > (params) default > (param) max_audio_megabytes_per_1_minute > (schema)>)
max\_images\_per\_1\_minute: Integer
The maximum images per minute. Only relevant for certain models.
[](<#(resource) admin.organization.projects.rate_limits > (method) update_rate_limit > (params) default > (param) max_images_per_1_minute > (schema)>)
max\_requests\_per\_1\_day: Integer
The maximum requests per day. Only relevant for certain models.
[](<#(resource) admin.organization.projects.rate_limits > (method) update_rate_limit > (params) default > (param) max_requests_per_1_day > (schema)>)
max\_requests\_per\_1\_minute: Integer
The maximum requests per minute.
[](<#(resource) admin.organization.projects.rate_limits > (method) update_rate_limit > (params) default > (param) max_requests_per_1_minute > (schema)>)
max\_tokens\_per\_1\_minute: Integer
The maximum tokens per minute.
[](<#(resource) admin.organization.projects.rate_limits > (method) update_rate_limit > (params) default > (param) max_tokens_per_1_minute > (schema)>)
##### ReturnsExpand Collapse
class ProjectRateLimit { id, max\_requests\_per\_1\_minute, max\_tokens\_per\_1\_minute, 6 more }
Represents a project rate limit config.
id: String
The identifier, which can be referenced in API endpoints.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) id>)
max\_requests\_per\_1\_minute: Integer
The maximum requests per minute.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_requests_per_1_minute>)
max\_tokens\_per\_1\_minute: Integer
The maximum tokens per minute.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_tokens_per_1_minute>)
model: String
The model this rate limit applies to.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) model>)
object: :"project.rate\_limit"
The object type, which is always `project.rate\_limit`
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) object>)
batch\_1\_day\_max\_input\_tokens: Integer
The maximum batch input tokens per day. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) batch_1_day_max_input_tokens>)
max\_audio\_megabytes\_per\_1\_minute: Integer
The maximum audio megabytes per minute. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_audio_megabytes_per_1_minute>)
max\_images\_per\_1\_minute: Integer
The maximum images per minute. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_images_per_1_minute>)
max\_requests\_per\_1\_day: Integer
The maximum requests per day. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_requests_per_1_day>)
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema)>)
### Modify project rate limit
Ruby
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
`require "openai"
openai = OpenAI::Client.new(admin\_api\_key: "My Admin API Key")
project\_rate\_limit = openai.admin.organization.projects.rate\_limits.update\_rate\_limit(
"rate\_limit\_id",
project\_id: "project\_id"
)
puts(project\_rate\_limit)`
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