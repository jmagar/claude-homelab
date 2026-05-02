Modify project rate limit | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Admin](/api/reference/go/resources/admin)
[Organization](/api/reference/go/resources/admin/subresources/organization)
[Projects](/api/reference/go/resources/admin/subresources/organization/subresources/projects)
[Rate Limits](/api/reference/go/resources/admin/subresources/organization/subresources/projects/subresources/rate_limits)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Modify project rate limit
client.Admin.Organization.Projects.RateLimits.UpdateRateLimit(ctx, projectID, rateLimitID, body) (\*[ProjectRateLimit](</api/reference/go/resources/admin#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema)>), error)
POST/organization/projects/{project\_id}/rate\_limits/{rate\_limit\_id}
Updates a project rate limit.
##### ParametersExpand Collapse
projectID string
[](<#(resource) admin.organization.projects.rate_limits > (method) update_rate_limit > (params) default > (param) project_id > (schema)>)
rateLimitID string
[](<#(resource) admin.organization.projects.rate_limits > (method) update_rate_limit > (params) default > (param) rate_limit_id > (schema)>)
body AdminOrganizationProjectRateLimitUpdateRateLimitParams
Batch1DayMaxInputTokens param.Field[int64]Optional
The maximum batch input tokens per day. Only relevant for certain models.
[](<#(resource) admin.organization.projects.rate_limits > (method) update_rate_limit > (params) default > (param) batch_1_day_max_input_tokens>)
MaxAudioMegabytesPer1Minute param.Field[int64]Optional
The maximum audio megabytes per minute. Only relevant for certain models.
[](<#(resource) admin.organization.projects.rate_limits > (method) update_rate_limit > (params) default > (param) max_audio_megabytes_per_1_minute>)
MaxImagesPer1Minute param.Field[int64]Optional
The maximum images per minute. Only relevant for certain models.
[](<#(resource) admin.organization.projects.rate_limits > (method) update_rate_limit > (params) default > (param) max_images_per_1_minute>)
MaxRequestsPer1Day param.Field[int64]Optional
The maximum requests per day. Only relevant for certain models.
[](<#(resource) admin.organization.projects.rate_limits > (method) update_rate_limit > (params) default > (param) max_requests_per_1_day>)
MaxRequestsPer1Minute param.Field[int64]Optional
The maximum requests per minute.
[](<#(resource) admin.organization.projects.rate_limits > (method) update_rate_limit > (params) default > (param) max_requests_per_1_minute>)
MaxTokensPer1Minute param.Field[int64]Optional
The maximum tokens per minute.
[](<#(resource) admin.organization.projects.rate_limits > (method) update_rate_limit > (params) default > (param) max_tokens_per_1_minute>)
[](<#(resource) admin.organization.projects.rate_limits > (method) update_rate_limit > (params) default>)
##### ReturnsExpand Collapse
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
### Modify project rate limit
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
projectRateLimit, err := client.Admin.Organization.Projects.RateLimits.UpdateRateLimit(
context.TODO(),
"project\_id",
"rate\_limit\_id",
openai.AdminOrganizationProjectRateLimitUpdateRateLimitParams{
},
)
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", projectRateLimit.ID)
}
`
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