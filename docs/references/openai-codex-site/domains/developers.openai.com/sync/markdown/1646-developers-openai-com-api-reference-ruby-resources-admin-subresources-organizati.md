Rate Limits | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Admin](/api/reference/ruby/resources/admin)
[Organization](/api/reference/ruby/resources/admin/subresources/organization)
[Projects](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Rate Limits
##### [List project rate limits](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/rate_limits/methods/list_rate_limits)
admin.organization.projects.rate\_limits.list\_rate\_limits(project\_id, \*\*kwargs) -\> ConversationCursorPage\<[ProjectRateLimit](</api/reference/ruby/resources/admin#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema)>) { id, max\_requests\_per\_1\_minute, max\_tokens\_per\_1\_minute, 6 more } \>
GET/organization/projects/{project\_id}/rate\_limits
##### [Modify project rate limit](/api/reference/ruby/resources/admin/subresources/organization/subresources/projects/subresources/rate_limits/methods/update_rate_limit)
admin.organization.projects.rate\_limits.update\_rate\_limit(rate\_limit\_id, \*\*kwargs) -\> [ProjectRateLimit](</api/reference/ruby/resources/admin#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema)>) { id, max\_requests\_per\_1\_minute, max\_tokens\_per\_1\_minute, 6 more }
POST/organization/projects/{project\_id}/rate\_limits/{rate\_limit\_id}
##### ModelsExpand Collapse
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