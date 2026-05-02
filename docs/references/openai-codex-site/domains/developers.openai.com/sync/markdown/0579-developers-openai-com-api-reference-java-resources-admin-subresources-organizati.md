List project rate limits | OpenAI API Reference
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
# List project rate limits
RateLimitListRateLimitsPage admin().organization().projects().rateLimits().listRateLimits(RateLimitListRateLimitsParamsparams = RateLimitListRateLimitsParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/projects/{project\_id}/rate\_limits
Returns the rate limits per model for a project.
##### ParametersExpand Collapse
RateLimitListRateLimitsParams params
Optional\<String\> projectId
[](<#(resource) admin.organization.projects.rate_limits > (method) list_rate_limits > (params) default > (param) project_id > (schema)>)
Optional\<String\> after
A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj\_foo, your subsequent call can include after=obj\_foo in order to fetch the next page of the list.
[](<#(resource) admin.organization.projects.rate_limits > (method) list_rate_limits > (params) default > (param) after > (schema)>)
Optional\<String\> before
A cursor for use in pagination. `before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, beginning with obj\_foo, your subsequent call can include before=obj\_foo in order to fetch the previous page of the list.
[](<#(resource) admin.organization.projects.rate_limits > (method) list_rate_limits > (params) default > (param) before > (schema)>)
Optional\<Long\> limit
A limit on the number of objects to be returned. The default is 100.
[](<#(resource) admin.organization.projects.rate_limits > (method) list_rate_limits > (params) default > (param) limit > (schema)>)
[](<#(resource) admin.organization.projects.rate_limits > (method) list_rate_limits > (params) default>)
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
### List project rate limits
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
import com.openai.models.admin.organization.projects.ratelimits.RateLimitListRateLimitsPage;
import com.openai.models.admin.organization.projects.ratelimits.RateLimitListRateLimitsParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
RateLimitListRateLimitsPage page = client.admin().organization().projects().rateLimits().listRateLimits("project\_id");
}
}`
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