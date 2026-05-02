Modify project rate limit | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Admin](/api/reference/typescript/resources/admin)
[Organization](/api/reference/typescript/resources/admin/subresources/organization)
[Projects](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects)
[Rate Limits](/api/reference/typescript/resources/admin/subresources/organization/subresources/projects/subresources/rate_limits)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Modify project rate limit
client.admin.organization.projects.rateLimits.updateRateLimit(stringrateLimitID, RateLimitUpdateRateLimitParams { project\_id, batch\_1\_day\_max\_input\_tokens, max\_audio\_megabytes\_per\_1\_minute, 4 more } params, RequestOptionsoptions?): [ProjectRateLimit](</api/reference/typescript/resources/admin#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema)>) { id, max\_requests\_per\_1\_minute, max\_tokens\_per\_1\_minute, 6 more }
POST/organization/projects/{project\_id}/rate\_limits/{rate\_limit\_id}
Updates a project rate limit.
##### ParametersExpand Collapse
rateLimitID: string
[](<#(resource) admin.organization.projects.rate_limits > (method) update_rate_limit > (params) default > (param) rate_limit_id > (schema)>)
params: RateLimitUpdateRateLimitParams { project\_id, batch\_1\_day\_max\_input\_tokens, max\_audio\_megabytes\_per\_1\_minute, 4 more }
project\_id: string
Path param: The ID of the project.
[](<#(resource) admin.organization.projects.rate_limits > (method) update_rate_limit > (params) default > (param) project_id>)
batch\_1\_day\_max\_input\_tokens?: number
Body param: The maximum batch input tokens per day. Only relevant for certain models.
[](<#(resource) admin.organization.projects.rate_limits > (method) update_rate_limit > (params) default > (param) batch_1_day_max_input_tokens>)
max\_audio\_megabytes\_per\_1\_minute?: number
Body param: The maximum audio megabytes per minute. Only relevant for certain models.
[](<#(resource) admin.organization.projects.rate_limits > (method) update_rate_limit > (params) default > (param) max_audio_megabytes_per_1_minute>)
max\_images\_per\_1\_minute?: number
Body param: The maximum images per minute. Only relevant for certain models.
[](<#(resource) admin.organization.projects.rate_limits > (method) update_rate_limit > (params) default > (param) max_images_per_1_minute>)
max\_requests\_per\_1\_day?: number
Body param: The maximum requests per day. Only relevant for certain models.
[](<#(resource) admin.organization.projects.rate_limits > (method) update_rate_limit > (params) default > (param) max_requests_per_1_day>)
max\_requests\_per\_1\_minute?: number
Body param: The maximum requests per minute.
[](<#(resource) admin.organization.projects.rate_limits > (method) update_rate_limit > (params) default > (param) max_requests_per_1_minute>)
max\_tokens\_per\_1\_minute?: number
Body param: The maximum tokens per minute.
[](<#(resource) admin.organization.projects.rate_limits > (method) update_rate_limit > (params) default > (param) max_tokens_per_1_minute>)
[](<#(resource) admin.organization.projects.rate_limits > (method) update_rate_limit > (params) default>)
##### ReturnsExpand Collapse
ProjectRateLimit { id, max\_requests\_per\_1\_minute, max\_tokens\_per\_1\_minute, 6 more }
Represents a project rate limit config.
id: string
The identifier, which can be referenced in API endpoints.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) id>)
max\_requests\_per\_1\_minute: number
The maximum requests per minute.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_requests_per_1_minute>)
max\_tokens\_per\_1\_minute: number
The maximum tokens per minute.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_tokens_per_1_minute>)
model: string
The model this rate limit applies to.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) model>)
object: "project.rate\_limit"
The object type, which is always `project.rate\_limit`
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) object>)
batch\_1\_day\_max\_input\_tokens?: number
The maximum batch input tokens per day. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) batch_1_day_max_input_tokens>)
max\_audio\_megabytes\_per\_1\_minute?: number
The maximum audio megabytes per minute. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_audio_megabytes_per_1_minute>)
max\_images\_per\_1\_minute?: number
The maximum images per minute. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_images_per_1_minute>)
max\_requests\_per\_1\_day?: number
The maximum requests per day. Only present for relevant models.
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema) > (property) max_requests_per_1_day>)
[](<#(resource) admin.organization.projects.rate_limits > (model) project_rate_limit > (schema)>)
### Modify project rate limit
TypeScript
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
`import OpenAI from 'openai';
const client = new OpenAI({
adminAPIKey: process.env['OPENAI\_ADMIN\_KEY'], // This is the default and can be omitted
});
const projectRateLimit = await client.admin.organization.projects.rateLimits.updateRateLimit(
'rate\_limit\_id',
{ project\_id: 'project\_id' },
);
console.log(projectRateLimit.id);`
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