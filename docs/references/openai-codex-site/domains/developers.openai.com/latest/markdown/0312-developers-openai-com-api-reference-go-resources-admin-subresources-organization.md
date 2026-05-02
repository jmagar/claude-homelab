Embeddings | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Admin](/api/reference/go/resources/admin)
[Organization](/api/reference/go/resources/admin/subresources/organization)
[Usage](/api/reference/go/resources/admin/subresources/organization/subresources/usage)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Embeddings
client.Admin.Organization.Usage.Embeddings(ctx, query) (\*[AdminOrganizationUsageEmbeddingsResponse](</api/reference/go/resources/admin#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema)>), error)
GET/organization/usage/embeddings
Get embeddings usage details for the organization.
##### ParametersExpand Collapse
query AdminOrganizationUsageEmbeddingsParams
StartTime param.Field[int64]
Start time (Unix seconds) of the query time range, inclusive.
[](<#(resource) admin.organization.usage > (method) embeddings > (params) default > (param) start_time>)
APIKeyIDs param.Field[[]string]Optional
Return only usage for these API keys.
[](<#(resource) admin.organization.usage > (method) embeddings > (params) default > (param) api_key_ids>)
BucketWidth param.Field[[AdminOrganizationUsageEmbeddingsParamsBucketWidth](</api/reference/go/resources/admin/subresources/organization/subresources/usage/methods/embeddings#(resource) admin.organization.usage > (method) embeddings > (params) default > (param) bucket_width > (schema)>)]Optional
Width of each time bucket in response. Currently `1m`, `1h` and `1d` are supported, default to `1d`.
const AdminOrganizationUsageEmbeddingsParamsBucketWidth1m [AdminOrganizationUsageEmbeddingsParamsBucketWidth](</api/reference/go/resources/admin/subresources/organization/subresources/usage/methods/embeddings#(resource) admin.organization.usage > (method) embeddings > (params) default > (param) bucket_width > (schema)>) = "1m"
[](<#(resource) admin.organization.usage > (method) embeddings > (params) default > (param) bucket_width > (schema) > (member) 0>)
const AdminOrganizationUsageEmbeddingsParamsBucketWidth1h [AdminOrganizationUsageEmbeddingsParamsBucketWidth](</api/reference/go/resources/admin/subresources/organization/subresources/usage/methods/embeddings#(resource) admin.organization.usage > (method) embeddings > (params) default > (param) bucket_width > (schema)>) = "1h"
[](<#(resource) admin.organization.usage > (method) embeddings > (params) default > (param) bucket_width > (schema) > (member) 1>)
const AdminOrganizationUsageEmbeddingsParamsBucketWidth1d [AdminOrganizationUsageEmbeddingsParamsBucketWidth](</api/reference/go/resources/admin/subresources/organization/subresources/usage/methods/embeddings#(resource) admin.organization.usage > (method) embeddings > (params) default > (param) bucket_width > (schema)>) = "1d"
[](<#(resource) admin.organization.usage > (method) embeddings > (params) default > (param) bucket_width > (schema) > (member) 2>)
[](<#(resource) admin.organization.usage > (method) embeddings > (params) default > (param) bucket_width>)
EndTime param.Field[int64]Optional
End time (Unix seconds) of the query time range, exclusive.
[](<#(resource) admin.organization.usage > (method) embeddings > (params) default > (param) end_time>)
GroupBy param.Field[[]string]Optional
Group the usage data by the specified fields. Support fields include `project\_id`, `user\_id`, `api\_key\_id`, `model` or any combination of them.
const AdminOrganizationUsageEmbeddingsParamsGroupByProjectID AdminOrganizationUsageEmbeddingsParamsGroupBy = "project\_id"
[](<#(resource) admin.organization.usage > (method) embeddings > (params) default > (param) group_by > (schema) > (items) > (member) 0>)
const AdminOrganizationUsageEmbeddingsParamsGroupByUserID AdminOrganizationUsageEmbeddingsParamsGroupBy = "user\_id"
[](<#(resource) admin.organization.usage > (method) embeddings > (params) default > (param) group_by > (schema) > (items) > (member) 1>)
const AdminOrganizationUsageEmbeddingsParamsGroupByAPIKeyID AdminOrganizationUsageEmbeddingsParamsGroupBy = "api\_key\_id"
[](<#(resource) admin.organization.usage > (method) embeddings > (params) default > (param) group_by > (schema) > (items) > (member) 2>)
const AdminOrganizationUsageEmbeddingsParamsGroupByModel AdminOrganizationUsageEmbeddingsParamsGroupBy = "model"
[](<#(resource) admin.organization.usage > (method) embeddings > (params) default > (param) group_by > (schema) > (items) > (member) 3>)
[](<#(resource) admin.organization.usage > (method) embeddings > (params) default > (param) group_by>)
Limit param.Field[int64]Optional
Specifies the number of buckets to return.
* `bucket\_width=1d`: default: 7, max: 31
* `bucket\_width=1h`: default: 24, max: 168
* `bucket\_width=1m`: default: 60, max: 1440
[](<#(resource) admin.organization.usage > (method) embeddings > (params) default > (param) limit>)
Models param.Field[[]string]Optional
Return only usage for these models.
[](<#(resource) admin.organization.usage > (method) embeddings > (params) default > (param) models>)
Page param.Field[string]Optional
A cursor for use in pagination. Corresponding to the `next\_page` field from the previous response.
[](<#(resource) admin.organization.usage > (method) embeddings > (params) default > (param) page>)
ProjectIDs param.Field[[]string]Optional
Return only usage for these projects.
[](<#(resource) admin.organization.usage > (method) embeddings > (params) default > (param) project_ids>)
UserIDs param.Field[[]string]Optional
Return only usage for these users.
[](<#(resource) admin.organization.usage > (method) embeddings > (params) default > (param) user_ids>)
[](<#(resource) admin.organization.usage > (method) embeddings > (params) default>)
##### ReturnsExpand Collapse
type AdminOrganizationUsageEmbeddingsResponse struct{…}
Data []AdminOrganizationUsageEmbeddingsResponseData
EndTime int64
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) end_time>)
Object Bucket
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) object>)
Result []AdminOrganizationUsageEmbeddingsResponseDataResultUnion
One of the following:
type AdminOrganizationUsageEmbeddingsResponseDataResultOrganizationUsageCompletionsResult struct{…}
The aggregated completions usage details of the specific time bucket.
InputTokens int64
The aggregated number of text input tokens used, including cached tokens. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_tokens>)
NumModelRequests int64
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) num_model_requests>)
Object OrganizationUsageCompletionsResult
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) object>)
OutputTokens int64
The aggregated number of text output tokens used. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_tokens>)
APIKeyID stringOptional
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) api_key_id>)
Batch boolOptional
When `group\_by=batch`, this field tells whether the grouped usage result is batch or not.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) batch>)
InputAudioTokens int64Optional
The aggregated number of audio input tokens used, including cached tokens.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_audio_tokens>)
InputCachedTokens int64Optional
The aggregated number of text input tokens that has been cached from previous requests. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_cached_tokens>)
Model stringOptional
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) model>)
OutputAudioTokens int64Optional
The aggregated number of audio output tokens used.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_audio_tokens>)
ProjectID stringOptional
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) project_id>)
ServiceTier stringOptional
When `group\_by=service\_tier`, this field provides the service tier of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) service_tier>)
UserID stringOptional
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0>)
type AdminOrganizationUsageEmbeddingsResponseDataResultOrganizationUsageEmbeddingsResult struct{…}
The aggregated embeddings usage details of the specific time bucket.
InputTokens int64
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) input_tokens>)
NumModelRequests int64
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) num_model_requests>)
Object OrganizationUsageEmbeddingsResult
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) object>)
APIKeyID stringOptional
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) api_key_id>)
Model stringOptional
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) model>)
ProjectID stringOptional
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) project_id>)
UserID stringOptional
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1>)
type AdminOrganizationUsageEmbeddingsResponseDataResultOrganizationUsageModerationsResult struct{…}
The aggregated moderations usage details of the specific time bucket.
InputTokens int64
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) input_tokens>)
NumModelRequests int64
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) num_model_requests>)
Object OrganizationUsageModerationsResult
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) object>)
APIKeyID stringOptional
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) api_key_id>)
Model stringOptional
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) model>)
ProjectID stringOptional
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) project_id>)
UserID stringOptional
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2>)
type AdminOrganizationUsageEmbeddingsResponseDataResultOrganizationUsageImagesResult struct{…}
The aggregated images usage details of the specific time bucket.
Images int64
The number of images processed.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) images>)
NumModelRequests int64
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) num_model_requests>)
Object OrganizationUsageImagesResult
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) object>)
APIKeyID stringOptional
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) api_key_id>)
Model stringOptional
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) model>)
ProjectID stringOptional
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) project_id>)
Size stringOptional
When `group\_by=size`, this field provides the image size of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) size>)
Source stringOptional
When `group\_by=source`, this field provides the source of the grouped usage result, possible values are `image.generation`, `image.edit`, `image.variation`.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) source>)
UserID stringOptional
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3>)
type AdminOrganizationUsageEmbeddingsResponseDataResultOrganizationUsageAudioSpeechesResult struct{…}
The aggregated audio speeches usage details of the specific time bucket.
Characters int64
The number of characters processed.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) characters>)
NumModelRequests int64
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) num_model_requests>)
Object OrganizationUsageAudioSpeechesResult
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) object>)
APIKeyID stringOptional
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) api_key_id>)
Model stringOptional
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) model>)
ProjectID stringOptional
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) project_id>)
UserID stringOptional
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4>)
type AdminOrganizationUsageEmbeddingsResponseDataResultOrganizationUsageAudioTranscriptionsResult struct{…}
The aggregated audio transcriptions usage details of the specific time bucket.
NumModelRequests int64
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) num_model_requests>)
Object OrganizationUsageAudioTranscriptionsResult
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) object>)
Seconds int64
The number of seconds processed.
formatint64
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) seconds>)
APIKeyID stringOptional
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) api_key_id>)
Model stringOptional
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) model>)
ProjectID stringOptional
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) project_id>)
UserID stringOptional
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5>)
type AdminOrganizationUsageEmbeddingsResponseDataResultOrganizationUsageVectorStoresResult struct{…}
The aggregated vector stores usage details of the specific time bucket.
Object OrganizationUsageVectorStoresResult
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) object>)
UsageBytes int64
The vector stores usage in bytes.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) usage_bytes>)
ProjectID stringOptional
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6>)
type AdminOrganizationUsageEmbeddingsResponseDataResultOrganizationUsageCodeInterpreterSessionsResult struct{…}
The aggregated code interpreter sessions usage details of the specific time bucket.
Object OrganizationUsageCodeInterpreterSessionsResult
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) object>)
NumSessions int64Optional
The number of code interpreter sessions.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) num_sessions>)
ProjectID stringOptional
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7>)
type AdminOrganizationUsageEmbeddingsResponseDataResultOrganizationCostsResult struct{…}
The aggregated costs details of the specific time bucket.
Object OrganizationCostsResult
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) object>)
Amount AdminOrganizationUsageEmbeddingsResponseDataResultOrganizationCostsResultAmountOptional
The monetary value in its associated currency.
Currency stringOptional
Lowercase ISO-4217 currency e.g. “usd”
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) currency>)
Value float64Optional
The numeric value of the cost.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) value>)
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount>)
APIKeyID stringOptional
When `group\_by=api\_key\_id`, this field provides the API Key ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) api_key_id>)
LineItem stringOptional
When `group\_by=line\_item`, this field provides the line item of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) line_item>)
ProjectID stringOptional
When `group\_by=project\_id`, this field provides the project ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8>)
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) result>)
StartTime int64
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data > (items) > (property) start_time>)
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) data>)
HasMore bool
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) has_more>)
NextPage string
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) next_page>)
Object Page
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema) > (property) object>)
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageEmbeddingsResponse > (schema)>)
### Embeddings
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
response, err := client.Admin.Organization.Usage.Embeddings(context.TODO(), openai.AdminOrganizationUsageEmbeddingsParams{
StartTime: 0,
})
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", response.Data)
}
`
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
"object": "organization.usage.embeddings.result",
"input\_tokens": 16,
"num\_model\_requests": 2,
"project\_id": null,
"user\_id": null,
"api\_key\_id": null,
"model": null
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
"object": "organization.usage.embeddings.result",
"input\_tokens": 16,
"num\_model\_requests": 2,
"project\_id": null,
"user\_id": null,
"api\_key\_id": null,
"model": null
}
]
}
],
"has\_more": false,
"next\_page": null
}
`
```