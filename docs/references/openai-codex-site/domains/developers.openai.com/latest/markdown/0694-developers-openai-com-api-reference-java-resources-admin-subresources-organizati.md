Costs | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Admin](/api/reference/java/resources/admin)
[Organization](/api/reference/java/resources/admin/subresources/organization)
[Usage](/api/reference/java/resources/admin/subresources/organization/subresources/usage)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Costs
[UsageCostsResponse](</api/reference/java/resources/admin#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema)>) admin().organization().usage().costs(UsageCostsParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/organization/costs
Get costs details for the organization.
##### ParametersExpand Collapse
UsageCostsParams params
long startTime
Start time (Unix seconds) of the query time range, inclusive.
[](<#(resource) admin.organization.usage > (method) costs > (params) default > (param) start_time > (schema)>)
Optional\<List\<String\>\> apiKeyIds
Return only costs for these API keys.
[](<#(resource) admin.organization.usage > (method) costs > (params) default > (param) api_key_ids > (schema)>)
Optional\<[BucketWidth](</api/reference/java/resources/admin/subresources/organization/subresources/usage/methods/costs#(resource) admin.organization.usage > (method) costs > (params) default > (param) bucket_width > (schema)>)\> bucketWidth
Width of each time bucket in response. Currently only `1d` is supported, default to `1d`.
\_1D("1d")
[](<#(resource) admin.organization.usage > (method) costs > (params) default > (param) bucket_width > (schema) > (member) 0>)
[](<#(resource) admin.organization.usage > (method) costs > (params) default > (param) bucket_width > (schema)>)
Optional\<Long\> endTime
End time (Unix seconds) of the query time range, exclusive.
[](<#(resource) admin.organization.usage > (method) costs > (params) default > (param) end_time > (schema)>)
Optional\<List\<GroupBy\>\> groupBy
Group the costs by the specified fields. Support fields include `project\_id`, `line\_item`, `api\_key\_id` and any combination of them.
PROJECT\_ID("project\_id")
[](<#(resource) admin.organization.usage > (method) costs > (params) default > (param) group_by > (schema) > (items) > (member) 0>)
LINE\_ITEM("line\_item")
[](<#(resource) admin.organization.usage > (method) costs > (params) default > (param) group_by > (schema) > (items) > (member) 1>)
API\_KEY\_ID("api\_key\_id")
[](<#(resource) admin.organization.usage > (method) costs > (params) default > (param) group_by > (schema) > (items) > (member) 2>)
[](<#(resource) admin.organization.usage > (method) costs > (params) default > (param) group_by > (schema)>)
Optional\<Long\> limit
A limit on the number of buckets to be returned. Limit can range between 1 and 180, and the default is 7.
[](<#(resource) admin.organization.usage > (method) costs > (params) default > (param) limit > (schema)>)
Optional\<String\> page
A cursor for use in pagination. Corresponding to the `next\_page` field from the previous response.
[](<#(resource) admin.organization.usage > (method) costs > (params) default > (param) page > (schema)>)
Optional\<List\<String\>\> projectIds
Return only costs for these projects.
[](<#(resource) admin.organization.usage > (method) costs > (params) default > (param) project_ids > (schema)>)
[](<#(resource) admin.organization.usage > (method) costs > (params) default>)
##### ReturnsExpand Collapse
class UsageCostsResponse:
List\<Data\> data
long endTime
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) end_time>)
JsonValue; object\_ "bucket"constant"bucket"constant
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) object>)
List\<Result\> result
One of the following:
class OrganizationUsageCompletionsResult:
The aggregated completions usage details of the specific time bucket.
long inputTokens
The aggregated number of text input tokens used, including cached tokens. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_tokens>)
long numModelRequests
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) num_model_requests>)
JsonValue; object\_ "organization.usage.completions.result"constant"organization.usage.completions.result"constant
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) object>)
long outputTokens
The aggregated number of text output tokens used. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_tokens>)
Optional\<String\> apiKeyId
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) api_key_id>)
Optional\<Boolean\> batch
When `group\_by=batch`, this field tells whether the grouped usage result is batch or not.
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) batch>)
Optional\<Long\> inputAudioTokens
The aggregated number of audio input tokens used, including cached tokens.
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_audio_tokens>)
Optional\<Long\> inputCachedTokens
The aggregated number of text input tokens that has been cached from previous requests. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_cached_tokens>)
Optional\<String\> model
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) model>)
Optional\<Long\> outputAudioTokens
The aggregated number of audio output tokens used.
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_audio_tokens>)
Optional\<String\> projectId
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) project_id>)
Optional\<String\> serviceTier
When `group\_by=service\_tier`, this field provides the service tier of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) service_tier>)
Optional\<String\> userId
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0>)
class OrganizationUsageEmbeddingsResult:
The aggregated embeddings usage details of the specific time bucket.
long inputTokens
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) input_tokens>)
long numModelRequests
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) num_model_requests>)
JsonValue; object\_ "organization.usage.embeddings.result"constant"organization.usage.embeddings.result"constant
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) object>)
Optional\<String\> apiKeyId
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) api_key_id>)
Optional\<String\> model
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) model>)
Optional\<String\> projectId
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) project_id>)
Optional\<String\> userId
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1>)
class OrganizationUsageModerationsResult:
The aggregated moderations usage details of the specific time bucket.
long inputTokens
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) input_tokens>)
long numModelRequests
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) num_model_requests>)
JsonValue; object\_ "organization.usage.moderations.result"constant"organization.usage.moderations.result"constant
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) object>)
Optional\<String\> apiKeyId
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) api_key_id>)
Optional\<String\> model
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) model>)
Optional\<String\> projectId
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) project_id>)
Optional\<String\> userId
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2>)
class OrganizationUsageImagesResult:
The aggregated images usage details of the specific time bucket.
long images
The number of images processed.
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) images>)
long numModelRequests
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) num_model_requests>)
JsonValue; object\_ "organization.usage.images.result"constant"organization.usage.images.result"constant
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) object>)
Optional\<String\> apiKeyId
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) api_key_id>)
Optional\<String\> model
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) model>)
Optional\<String\> projectId
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) project_id>)
Optional\<String\> size
When `group\_by=size`, this field provides the image size of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) size>)
Optional\<String\> source
When `group\_by=source`, this field provides the source of the grouped usage result, possible values are `image.generation`, `image.edit`, `image.variation`.
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) source>)
Optional\<String\> userId
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3>)
class OrganizationUsageAudioSpeechesResult:
The aggregated audio speeches usage details of the specific time bucket.
long characters
The number of characters processed.
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) characters>)
long numModelRequests
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) num_model_requests>)
JsonValue; object\_ "organization.usage.audio\_speeches.result"constant"organization.usage.audio\_speeches.result"constant
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) object>)
Optional\<String\> apiKeyId
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) api_key_id>)
Optional\<String\> model
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) model>)
Optional\<String\> projectId
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) project_id>)
Optional\<String\> userId
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4>)
class OrganizationUsageAudioTranscriptionsResult:
The aggregated audio transcriptions usage details of the specific time bucket.
long numModelRequests
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) num_model_requests>)
JsonValue; object\_ "organization.usage.audio\_transcriptions.result"constant"organization.usage.audio\_transcriptions.result"constant
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) object>)
long seconds
The number of seconds processed.
formatint64
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) seconds>)
Optional\<String\> apiKeyId
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) api_key_id>)
Optional\<String\> model
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) model>)
Optional\<String\> projectId
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) project_id>)
Optional\<String\> userId
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5>)
class OrganizationUsageVectorStoresResult:
The aggregated vector stores usage details of the specific time bucket.
JsonValue; object\_ "organization.usage.vector\_stores.result"constant"organization.usage.vector\_stores.result"constant
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) object>)
long usageBytes
The vector stores usage in bytes.
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) usage_bytes>)
Optional\<String\> projectId
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6>)
class OrganizationUsageCodeInterpreterSessionsResult:
The aggregated code interpreter sessions usage details of the specific time bucket.
JsonValue; object\_ "organization.usage.code\_interpreter\_sessions.result"constant"organization.usage.code\_interpreter\_sessions.result"constant
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) object>)
Optional\<Long\> numSessions
The number of code interpreter sessions.
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) num_sessions>)
Optional\<String\> projectId
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7>)
class OrganizationCostsResult:
The aggregated costs details of the specific time bucket.
JsonValue; object\_ "organization.costs.result"constant"organization.costs.result"constant
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) object>)
Optional\<Amount\> amount
The monetary value in its associated currency.
Optional\<String\> currency
Lowercase ISO-4217 currency e.g. “usd”
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) currency>)
Optional\<Double\> value
The numeric value of the cost.
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) value>)
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount>)
Optional\<String\> apiKeyId
When `group\_by=api\_key\_id`, this field provides the API Key ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) api_key_id>)
Optional\<String\> lineItem
When `group\_by=line\_item`, this field provides the line item of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) line_item>)
Optional\<String\> projectId
When `group\_by=project\_id`, this field provides the project ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8>)
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) result>)
long startTime
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data > (items) > (property) start_time>)
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) data>)
boolean hasMore
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) has_more>)
String nextPage
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) next_page>)
JsonValue; object\_ "page"constant"page"constant
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema) > (property) object>)
[](<#(resource) admin.organization.usage > (model) UsageCostsResponse > (schema)>)
### Costs
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
import com.openai.models.admin.organization.usage.UsageCostsParams;
import com.openai.models.admin.organization.usage.UsageCostsResponse;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
UsageCostsParams params = UsageCostsParams.builder()
.startTime(0L)
.build();
UsageCostsResponse response = client.admin().organization().usage().costs(params);
}
}`
```
```
`{
"object": "page",
"data": [
{
"object": "bucket",
"start\_time": 1730419200,
"end\_time": 1730505600,
"results": [
{
"object": "organization.costs.result",
"amount": {
"value": 0.06,
"currency": "usd"
},
"line\_item": null,
"project\_id": null,
"api\_key\_id": null
}
]
}
],
"has\_more": false,
"next\_page": null
}
`
```
##### Returns Examples
```
`{
"object": "page",
"data": [
{
"object": "bucket",
"start\_time": 1730419200,
"end\_time": 1730505600,
"results": [
{
"object": "organization.costs.result",
"amount": {
"value": 0.06,
"currency": "usd"
},
"line\_item": null,
"project\_id": null,
"api\_key\_id": null
}
]
}
],
"has\_more": false,
"next\_page": null
}
`
```