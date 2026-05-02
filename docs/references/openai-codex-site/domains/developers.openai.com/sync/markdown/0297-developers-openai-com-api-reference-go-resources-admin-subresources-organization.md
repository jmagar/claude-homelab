List project rate limits | OpenAI API Reference
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
# List project rate limits
client.Admin.Organization.Projects.RateLimits.ListRateLimits(ctx, projectID, query) (\*ConversationCursorPage[[ProjectRateLimit](</api/reference/go/resources/admin#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema)>)], error)
GET/organization/projects/{project\_id}/rate\_limits
Returns the rate limits per model for a project.
##### ParametersExpand Collapse
projectID string
[](<#(resource) admin.organization.projects.rate_limits > (method) list_rate_limits > (params) default > (param) project_id > (schema)>)
query AdminOrganizationProjectRateLimitListRateLimitsParams
After param.Field[string]Optional
A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj\_foo, your subsequent call can include after=obj\_foo in order to fetch the next page of the list.
[](<#(resource) admin.organization.projects.rate_limits > (method) list_rate_limits > (params) default > (param) after>)
Before param.Field[string]Optional
A cursor for use in pagination. `before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, beginning with obj\_foo, your subsequent call can include before=obj\_foo in order to fetch the previous page of the list.
[](<#(resource) admin.organization.projects.rate_limits > (method) list_rate_limits > (params) default > (param) before>)
Limit param.Field[int64]Optional
A limit on the number of objects to be returned. The default is 100.
[](<#(resource) admin.organization.projects.rate_limits > (method) list_rate_limits > (params) default > (param) limit>)
[](<#(resource) admin.organization.projects.rate_limits > (method) list_rate_limits > (params) default>)
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
### List project rate limits
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
page, err := client.Admin.Organization.Projects.RateLimits.ListRateLimits(
context.TODO(),
"project\_id",
openai.AdminOrganizationProjectRateLimitListRateLimitsParams{
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