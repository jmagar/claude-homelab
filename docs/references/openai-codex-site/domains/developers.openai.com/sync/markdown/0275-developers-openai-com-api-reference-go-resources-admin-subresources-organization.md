Costs | OpenAI API Reference
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
# Costs
client.Admin.Organization.Usage.Costs(ctx, query) (\*[AdminOrganizationUsageCostsResponse](</api/reference/go/resources/admin#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema)>), error)
GET/organization/costs
Get costs details for the organization.
##### ParametersExpand Collapse
query AdminOrganizationUsageCostsParams
StartTime param.Field[int64]
Start time (Unix seconds) of the query time range, inclusive.
[](<#(resource) admin.organization.usage > (method) costs > (params) default > (param) start_time>)
APIKeyIDs param.Field[[]string]Optional
Return only costs for these API keys.
[](<#(resource) admin.organization.usage > (method) costs > (params) default > (param) api_key_ids>)
BucketWidth param.Field[[AdminOrganizationUsageCostsParamsBucketWidth](</api/reference/go/resources/admin/subresources/organization/subresources/usage/methods/costs#(resource) admin.organization.usage > (method) costs > (params) default > (param) bucket_width > (schema)>)]Optional
Width of each time bucket in response. Currently only `1d` is supported, default to `1d`.
const AdminOrganizationUsageCostsParamsBucketWidth1d [AdminOrganizationUsageCostsParamsBucketWidth](</api/reference/go/resources/admin/subresources/organization/subresources/usage/methods/costs#(resource) admin.organization.usage > (method) costs > (params) default > (param) bucket_width > (schema)>) = "1d"
[](<#(resource) admin.organization.usage > (method) costs > (params) default > (param) bucket_width > (schema) > (member) 0>)
[](<#(resource) admin.organization.usage > (method) costs > (params) default > (param) bucket_width>)
EndTime param.Field[int64]Optional
End time (Unix seconds) of the query time range, exclusive.
[](<#(resource) admin.organization.usage > (method) costs > (params) default > (param) end_time>)
GroupBy param.Field[[]string]Optional
Group the costs by the specified fields. Support fields include `project\_id`, `line\_item`, `api\_key\_id` and any combination of them.
const AdminOrganizationUsageCostsParamsGroupByProjectID AdminOrganizationUsageCostsParamsGroupBy = "project\_id"
[](<#(resource) admin.organization.usage > (method) costs > (params) default > (param) group_by > (schema) > (items) > (member) 0>)
const AdminOrganizationUsageCostsParamsGroupByLineItem AdminOrganizationUsageCostsParamsGroupBy = "line\_item"
[](<#(resource) admin.organization.usage > (method) costs > (params) default > (param) group_by > (schema) > (items) > (member) 1>)
const AdminOrganizationUsageCostsParamsGroupByAPIKeyID AdminOrganizationUsageCostsParamsGroupBy = "api\_key\_id"
[](<#(resource) admin.organization.usage > (method) costs > (params) default > (param) group_by > (schema) > (items) > (member) 2>)
[](<#(resource) admin.organization.usage > (method) costs > (params) default > (param) group_by>)
Limit param.Field[int64]Optional
A limit on the number of buckets to be returned. Limit can range between 1 and 180, and the default is 7.
[](<#(resource) admin.organization.usage > (method) costs > (params) default > (param) limit>)
Page param.Field[string]Optional
A cursor for use in pagination. Corresponding to the `next\_page` field from the previous response.
[](<#(resource) admin.organization.usage > (method) costs > (params) default > (param) page>)
ProjectIDs param.Field[[]string]Optional
Return only costs for these projects.
[](<#(resource) admin.organization.usage > (method) costs > (params) default > (param) project_ids>)
[](<#(resource) admin.organization.usage > (method) costs > (params) default>)
##### ReturnsExpand Collapse
type AdminOrganizationUsageCostsResponse struct{…}
Data []AdminOrganizationUsageCostsResponseData
EndTime int64
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) end_time>)
Object Bucket
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) object>)
Result []AdminOrganizationUsageCostsResponseDataResultUnion
One of the following:
type AdminOrganizationUsageCostsResponseDataResultOrganizationUsageCompletionsResult struct{…}
The aggregated completions usage details of the specific time bucket.
InputTokens int64
The aggregated number of text input tokens used, including cached tokens. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_tokens>)
NumModelRequests int64
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) num_model_requests>)
Object OrganizationUsageCompletionsResult
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) object>)
OutputTokens int64
The aggregated number of text output tokens used. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_tokens>)
APIKeyID stringOptional
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) api_key_id>)
Batch boolOptional
When `group\_by=batch`, this field tells whether the grouped usage result is batch or not.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) batch>)
InputAudioTokens int64Optional
The aggregated number of audio input tokens used, including cached tokens.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_audio_tokens>)
InputCachedTokens int64Optional
The aggregated number of text input tokens that has been cached from previous requests. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_cached_tokens>)
Model stringOptional
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) model>)
OutputAudioTokens int64Optional
The aggregated number of audio output tokens used.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_audio_tokens>)
ProjectID stringOptional
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) project_id>)
ServiceTier stringOptional
When `group\_by=service\_tier`, this field provides the service tier of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) service_tier>)
UserID stringOptional
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0>)
type AdminOrganizationUsageCostsResponseDataResultOrganizationUsageEmbeddingsResult struct{…}
The aggregated embeddings usage details of the specific time bucket.
InputTokens int64
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) input_tokens>)
NumModelRequests int64
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) num_model_requests>)
Object OrganizationUsageEmbeddingsResult
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) object>)
APIKeyID stringOptional
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) api_key_id>)
Model stringOptional
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) model>)
ProjectID stringOptional
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) project_id>)
UserID stringOptional
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1>)
type AdminOrganizationUsageCostsResponseDataResultOrganizationUsageModerationsResult struct{…}
The aggregated moderations usage details of the specific time bucket.
InputTokens int64
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) input_tokens>)
NumModelRequests int64
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) num_model_requests>)
Object OrganizationUsageModerationsResult
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) object>)
APIKeyID stringOptional
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) api_key_id>)
Model stringOptional
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) model>)
ProjectID stringOptional
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) project_id>)
UserID stringOptional
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2>)
type AdminOrganizationUsageCostsResponseDataResultOrganizationUsageImagesResult struct{…}
The aggregated images usage details of the specific time bucket.
Images int64
The number of images processed.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) images>)
NumModelRequests int64
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) num_model_requests>)
Object OrganizationUsageImagesResult
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) object>)
APIKeyID stringOptional
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) api_key_id>)
Model stringOptional
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) model>)
ProjectID stringOptional
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) project_id>)
Size stringOptional
When `group\_by=size`, this field provides the image size of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) size>)
Source stringOptional
When `group\_by=source`, this field provides the source of the grouped usage result, possible values are `image.generation`, `image.edit`, `image.variation`.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) source>)
UserID stringOptional
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3>)
type AdminOrganizationUsageCostsResponseDataResultOrganizationUsageAudioSpeechesResult struct{…}
The aggregated audio speeches usage details of the specific time bucket.
Characters int64
The number of characters processed.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) characters>)
NumModelRequests int64
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) num_model_requests>)
Object OrganizationUsageAudioSpeechesResult
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) object>)
APIKeyID stringOptional
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) api_key_id>)
Model stringOptional
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) model>)
ProjectID stringOptional
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) project_id>)
UserID stringOptional
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4>)
type AdminOrganizationUsageCostsResponseDataResultOrganizationUsageAudioTranscriptionsResult struct{…}
The aggregated audio transcriptions usage details of the specific time bucket.
NumModelRequests int64
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) num_model_requests>)
Object OrganizationUsageAudioTranscriptionsResult
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) object>)
Seconds int64
The number of seconds processed.
formatint64
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) seconds>)
APIKeyID stringOptional
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) api_key_id>)
Model stringOptional
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) model>)
ProjectID stringOptional
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) project_id>)
UserID stringOptional
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5>)
type AdminOrganizationUsageCostsResponseDataResultOrganizationUsageVectorStoresResult struct{…}
The aggregated vector stores usage details of the specific time bucket.
Object OrganizationUsageVectorStoresResult
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) object>)
UsageBytes int64
The vector stores usage in bytes.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) usage_bytes>)
ProjectID stringOptional
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6>)
type AdminOrganizationUsageCostsResponseDataResultOrganizationUsageCodeInterpreterSessionsResult struct{…}
The aggregated code interpreter sessions usage details of the specific time bucket.
Object OrganizationUsageCodeInterpreterSessionsResult
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) object>)
NumSessions int64Optional
The number of code interpreter sessions.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) num_sessions>)
ProjectID stringOptional
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7>)
type AdminOrganizationUsageCostsResponseDataResultOrganizationCostsResult struct{…}
The aggregated costs details of the specific time bucket.
Object OrganizationCostsResult
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) object>)
Amount AdminOrganizationUsageCostsResponseDataResultOrganizationCostsResultAmountOptional
The monetary value in its associated currency.
Currency stringOptional
Lowercase ISO-4217 currency e.g. “usd”
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) currency>)
Value float64Optional
The numeric value of the cost.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) value>)
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount>)
APIKeyID stringOptional
When `group\_by=api\_key\_id`, this field provides the API Key ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) api_key_id>)
LineItem stringOptional
When `group\_by=line\_item`, this field provides the line item of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) line_item>)
ProjectID stringOptional
When `group\_by=project\_id`, this field provides the project ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8>)
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) result>)
StartTime int64
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data > (items) > (property) start_time>)
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) data>)
HasMore bool
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) has_more>)
NextPage string
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) next_page>)
Object Page
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema) > (property) object>)
[](<#(resource) admin.organization.usage > (model) AdminOrganizationUsageCostsResponse > (schema)>)
### Costs
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
response, err := client.Admin.Organization.Usage.Costs(context.TODO(), openai.AdminOrganizationUsageCostsParams{
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