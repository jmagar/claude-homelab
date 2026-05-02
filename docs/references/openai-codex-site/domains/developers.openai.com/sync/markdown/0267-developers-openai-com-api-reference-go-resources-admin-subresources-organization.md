Rate Limits | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Admin](/api/reference/go/resources/admin)
[Organization](/api/reference/go/resources/admin/subresources/organization)
[Projects](/api/reference/go/resources/admin/subresources/organization/subresources/projects)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Rate Limits
##### [List project rate limits](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/rate_limits/methods/list_rate_limits)
client.Admin.Organization.Projects.RateLimits.ListRateLimits(ctx, projectID, query) (\*ConversationCursorPage[[ProjectRateLimit](</api/reference/go/resources/admin#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema)>)], error)
GET/organization/projects/{project\_id}/rate\_limits
##### [Modify project rate limit](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/rate_limits/methods/update_rate_limit)
client.Admin.Organization.Projects.RateLimits.UpdateRateLimit(ctx, projectID, rateLimitID, body) (\*[ProjectRateLimit](</api/reference/go/resources/admin#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema)>), error)
POST/organization/projects/{project\_id}/rate\_limits/{rate\_limit\_id}
##### ModelsExpand Collapse
type ProjectRateLimit struct{…}
Represents a project rate limit config.
ID string
The identifier, which can be referenced in API endpoints.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) id>)
MaxRequestsPer1Minute int64
The maximum requests per minute.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_requests_per_1_minute>)
MaxTokensPer1Minute int64
The maximum tokens per minute.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_tokens_per_1_minute>)
Model string
The model this rate limit applies to.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) model>)
Object ProjectRateLimit
The object type, which is always `project.rate\_limit`
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) object>)
Batch1DayMaxInputTokens int64Optional
The maximum batch input tokens per day. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) batch_1_day_max_input_tokens>)
MaxAudioMegabytesPer1Minute int64Optional
The maximum audio megabytes per minute. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_audio_megabytes_per_1_minute>)
MaxImagesPer1Minute int64Optional
The maximum images per minute. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_images_per_1_minute>)
MaxRequestsPer1Day int64Optional
The maximum requests per day. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_requests_per_1_day>)
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema)>)