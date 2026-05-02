Modify project rate limit | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Admin](/api/reference/java/resources/admin)
[Organization](/api/reference/java/resources/admin/subresources/organization)
[Projects](/api/reference/java/resources/admin/subresources/organization/subresources/projects)
[Rate Limits](/api/reference/java/resources/admin/subresources/organization/subresources/projects/subresources/rate_limits)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Modify project rate limit
[ProjectRateLimit](</api/reference/java/resources/admin#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema)>) admin().organization().projects().rateLimits().updateRateLimit(RateLimitUpdateRateLimitParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/organization/projects/{project\_id}/rate\_limits/{rate\_limit\_id}
Updates a project rate limit.
##### ParametersExpand Collapse
RateLimitUpdateRateLimitParams params
String projectId
[](<#(resource) admin.organization.projects.rate_limits > (method) update_rate_limit > (params) default > (param) project_id > (schema)>)
Optional\<String\> rateLimitId
[](<#(resource) admin.organization.projects.rate_limits > (method) update_rate_limit > (params) default > (param) rate_limit_id > (schema)>)
Optional\<Long\> batch1DayMaxInputTokens
The maximum batch input tokens per day. Only relevant for certain models.
[](<#(resource) admin.organization.projects.rate_limits > (method) update_rate_limit > (params) default > (param) body > (schema) > (property) batch_1_day_max_input_tokens>)
Optional\<Long\> maxAudioMegabytesPer1Minute
The maximum audio megabytes per minute. Only relevant for certain models.
[](<#(resource) admin.organization.projects.rate_limits > (method) update_rate_limit > (params) default > (param) body > (schema) > (property) max_audio_megabytes_per_1_minute>)
Optional\<Long\> maxImagesPer1Minute
The maximum images per minute. Only relevant for certain models.
[](<#(resource) admin.organization.projects.rate_limits > (method) update_rate_limit > (params) default > (param) body > (schema) > (property) max_images_per_1_minute>)
Optional\<Long\> maxRequestsPer1Day
The maximum requests per day. Only relevant for certain models.
[](<#(resource) admin.organization.projects.rate_limits > (method) update_rate_limit > (params) default > (param) body > (schema) > (property) max_requests_per_1_day>)
Optional\<Long\> maxRequestsPer1Minute
The maximum requests per minute.
[](<#(resource) admin.organization.projects.rate_limits > (method) update_rate_limit > (params) default > (param) body > (schema) > (property) max_requests_per_1_minute>)
Optional\<Long\> maxTokensPer1Minute
The maximum tokens per minute.
[](<#(resource) admin.organization.projects.rate_limits > (method) update_rate_limit > (params) default > (param) body > (schema) > (property) max_tokens_per_1_minute>)
[](<#(resource) admin.organization.projects.rate_limits > (method) update_rate_limit > (params) default>)
##### ReturnsExpand Collapse
class ProjectRateLimit:
Represents a project rate limit config.
String id
The identifier, which can be referenced in API endpoints.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) id>)
long maxRequestsPer1Minute
The maximum requests per minute.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_requests_per_1_minute>)
long maxTokensPer1Minute
The maximum tokens per minute.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_tokens_per_1_minute>)
String model
The model this rate limit applies to.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) model>)
JsonValue; object\_ "project.rate\_limit"constant"project.rate\_limit"constant
The object type, which is always `project.rate\_limit`
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) object>)
Optional\<Long\> batch1DayMaxInputTokens
The maximum batch input tokens per day. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) batch_1_day_max_input_tokens>)
Optional\<Long\> maxAudioMegabytesPer1Minute
The maximum audio megabytes per minute. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_audio_megabytes_per_1_minute>)
Optional\<Long\> maxImagesPer1Minute
The maximum images per minute. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_images_per_1_minute>)
Optional\<Long\> maxRequestsPer1Day
The maximum requests per day. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_requests_per_1_day>)
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema)>)
### Modify project rate limit
Java
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
`package com.openai.example;
import com.openai.client.OpenAIClient;
import com.openai.client.okhttp.OpenAIOkHttpClient;
import com.openai.models.admin.organization.projects.ratelimits.ProjectRateLimit;
import com.openai.models.admin.organization.projects.ratelimits.RateLimitUpdateRateLimitParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
RateLimitUpdateRateLimitParams params = RateLimitUpdateRateLimitParams.builder()
.projectId("project\_id")
.rateLimitId("rate\_limit\_id")
.build();
ProjectRateLimit projectRateLimit = client.admin().organization().projects().rateLimits().updateRateLimit(params);
}
}`
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