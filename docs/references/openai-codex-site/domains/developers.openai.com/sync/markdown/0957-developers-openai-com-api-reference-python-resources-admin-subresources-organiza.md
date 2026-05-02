Usage | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Admin](/api/reference/python/resources/admin)
[Organization](/api/reference/python/resources/admin/subresources/organization)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Usage
##### [Audio speeches](/api/reference/python/resources/admin/subresources/organization/subresources/usage/methods/audio_speeches)
admin.organization.usage.audio\_speeches(UsageAudioSpeechesParams\*\*kwargs) -\> [UsageAudioSpeechesResponse](</api/reference/python/resources/admin#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema)>)
GET/organization/usage/audio\_speeches
##### [Audio transcriptions](/api/reference/python/resources/admin/subresources/organization/subresources/usage/methods/audio_transcriptions)
admin.organization.usage.audio\_transcriptions(UsageAudioTranscriptionsParams\*\*kwargs) -\> [UsageAudioTranscriptionsResponse](</api/reference/python/resources/admin#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema)>)
GET/organization/usage/audio\_transcriptions
##### [Code interpreter sessions](/api/reference/python/resources/admin/subresources/organization/subresources/usage/methods/code_interpreter_sessions)
admin.organization.usage.code\_interpreter\_sessions(UsageCodeInterpreterSessionsParams\*\*kwargs) -\> [UsageCodeInterpreterSessionsResponse](</api/reference/python/resources/admin#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema)>)
GET/organization/usage/code\_interpreter\_sessions
##### [Completions](/api/reference/python/resources/admin/subresources/organization/subresources/usage/methods/completions)
admin.organization.usage.completions(UsageCompletionsParams\*\*kwargs) -\> [UsageCompletionsResponse](</api/reference/python/resources/admin#(resource) admin.organization.usage > (model) usage_completions_response > (schema)>)
GET/organization/usage/completions
##### [Embeddings](/api/reference/python/resources/admin/subresources/organization/subresources/usage/methods/embeddings)
admin.organization.usage.embeddings(UsageEmbeddingsParams\*\*kwargs) -\> [UsageEmbeddingsResponse](</api/reference/python/resources/admin#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema)>)
GET/organization/usage/embeddings
##### [Images](/api/reference/python/resources/admin/subresources/organization/subresources/usage/methods/images)
admin.organization.usage.images(UsageImagesParams\*\*kwargs) -\> [UsageImagesResponse](</api/reference/python/resources/admin#(resource) admin.organization.usage > (model) usage_images_response > (schema)>)
GET/organization/usage/images
##### [Moderations](/api/reference/python/resources/admin/subresources/organization/subresources/usage/methods/moderations)
admin.organization.usage.moderations(UsageModerationsParams\*\*kwargs) -\> [UsageModerationsResponse](</api/reference/python/resources/admin#(resource) admin.organization.usage > (model) usage_moderations_response > (schema)>)
GET/organization/usage/moderations
##### [Vector stores](/api/reference/python/resources/admin/subresources/organization/subresources/usage/methods/vector_stores)
admin.organization.usage.vector\_stores(UsageVectorStoresParams\*\*kwargs) -\> [UsageVectorStoresResponse](</api/reference/python/resources/admin#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema)>)
GET/organization/usage/vector\_stores
##### [Costs](/api/reference/python/resources/admin/subresources/organization/subresources/usage/methods/costs)
admin.organization.usage.costs(UsageCostsParams\*\*kwargs) -\> [UsageCostsResponse](</api/reference/python/resources/admin#(resource) admin.organization.usage > (model) usage_costs_response > (schema)>)
GET/organization/costs
##### ModelsExpand Collapse
class UsageAudioSpeechesResponse: …
data: List[Data]
end\_time: int
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) end_time>)
object: Literal["bucket"]
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) object>)
result: List[DataResult]
One of the following:
class DataResultOrganizationUsageCompletionsResult: …
The aggregated completions usage details of the specific time bucket.
input\_tokens: int
The aggregated number of text input tokens used, including cached tokens. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_tokens>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) num_model_requests>)
object: Literal["organization.usage.completions.result"]
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) object>)
output\_tokens: int
The aggregated number of text output tokens used. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_tokens>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) api_key_id>)
batch: Optional[bool]
When `group\_by=batch`, this field tells whether the grouped usage result is batch or not.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) batch>)
input\_audio\_tokens: Optional[int]
The aggregated number of audio input tokens used, including cached tokens.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_audio_tokens>)
input\_cached\_tokens: Optional[int]
The aggregated number of text input tokens that has been cached from previous requests. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_cached_tokens>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) model>)
output\_audio\_tokens: Optional[int]
The aggregated number of audio output tokens used.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_audio_tokens>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) project_id>)
service\_tier: Optional[str]
When `group\_by=service\_tier`, this field provides the service tier of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) service_tier>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0>)
class DataResultOrganizationUsageEmbeddingsResult: …
The aggregated embeddings usage details of the specific time bucket.
input\_tokens: int
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) input_tokens>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) num_model_requests>)
object: Literal["organization.usage.embeddings.result"]
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1>)
class DataResultOrganizationUsageModerationsResult: …
The aggregated moderations usage details of the specific time bucket.
input\_tokens: int
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) input_tokens>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) num_model_requests>)
object: Literal["organization.usage.moderations.result"]
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2>)
class DataResultOrganizationUsageImagesResult: …
The aggregated images usage details of the specific time bucket.
images: int
The number of images processed.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) images>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) num_model_requests>)
object: Literal["organization.usage.images.result"]
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) project_id>)
size: Optional[str]
When `group\_by=size`, this field provides the image size of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) size>)
source: Optional[str]
When `group\_by=source`, this field provides the source of the grouped usage result, possible values are `image.generation`, `image.edit`, `image.variation`.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) source>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3>)
class DataResultOrganizationUsageAudioSpeechesResult: …
The aggregated audio speeches usage details of the specific time bucket.
characters: int
The number of characters processed.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) characters>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) num_model_requests>)
object: Literal["organization.usage.audio\_speeches.result"]
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4>)
class DataResultOrganizationUsageAudioTranscriptionsResult: …
The aggregated audio transcriptions usage details of the specific time bucket.
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) num_model_requests>)
object: Literal["organization.usage.audio\_transcriptions.result"]
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) object>)
seconds: int
The number of seconds processed.
formatint64
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) seconds>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5>)
class DataResultOrganizationUsageVectorStoresResult: …
The aggregated vector stores usage details of the specific time bucket.
object: Literal["organization.usage.vector\_stores.result"]
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) object>)
usage\_bytes: int
The vector stores usage in bytes.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) usage_bytes>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6>)
class DataResultOrganizationUsageCodeInterpreterSessionsResult: …
The aggregated code interpreter sessions usage details of the specific time bucket.
object: Literal["organization.usage.code\_interpreter\_sessions.result"]
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) object>)
num\_sessions: Optional[int]
The number of code interpreter sessions.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) num_sessions>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7>)
class DataResultOrganizationCostsResult: …
The aggregated costs details of the specific time bucket.
object: Literal["organization.costs.result"]
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) object>)
amount: Optional[DataResultOrganizationCostsResultAmount]
The monetary value in its associated currency.
currency: Optional[str]
Lowercase ISO-4217 currency e.g. “usd”
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) currency>)
value: Optional[float]
The numeric value of the cost.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) value>)
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API Key ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) api_key_id>)
line\_item: Optional[str]
When `group\_by=line\_item`, this field provides the line item of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) line_item>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8>)
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result>)
start\_time: int
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) start_time>)
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data>)
has\_more: bool
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) has_more>)
next\_page: str
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) next_page>)
object: Literal["page"]
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) object>)
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema)>)
class UsageAudioTranscriptionsResponse: …
data: List[Data]
end\_time: int
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) end_time>)
object: Literal["bucket"]
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) object>)
result: List[DataResult]
One of the following:
class DataResultOrganizationUsageCompletionsResult: …
The aggregated completions usage details of the specific time bucket.
input\_tokens: int
The aggregated number of text input tokens used, including cached tokens. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_tokens>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) num_model_requests>)
object: Literal["organization.usage.completions.result"]
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) object>)
output\_tokens: int
The aggregated number of text output tokens used. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_tokens>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) api_key_id>)
batch: Optional[bool]
When `group\_by=batch`, this field tells whether the grouped usage result is batch or not.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) batch>)
input\_audio\_tokens: Optional[int]
The aggregated number of audio input tokens used, including cached tokens.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_audio_tokens>)
input\_cached\_tokens: Optional[int]
The aggregated number of text input tokens that has been cached from previous requests. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_cached_tokens>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) model>)
output\_audio\_tokens: Optional[int]
The aggregated number of audio output tokens used.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_audio_tokens>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) project_id>)
service\_tier: Optional[str]
When `group\_by=service\_tier`, this field provides the service tier of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) service_tier>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0>)
class DataResultOrganizationUsageEmbeddingsResult: …
The aggregated embeddings usage details of the specific time bucket.
input\_tokens: int
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) input_tokens>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) num_model_requests>)
object: Literal["organization.usage.embeddings.result"]
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1>)
class DataResultOrganizationUsageModerationsResult: …
The aggregated moderations usage details of the specific time bucket.
input\_tokens: int
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) input_tokens>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) num_model_requests>)
object: Literal["organization.usage.moderations.result"]
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2>)
class DataResultOrganizationUsageImagesResult: …
The aggregated images usage details of the specific time bucket.
images: int
The number of images processed.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) images>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) num_model_requests>)
object: Literal["organization.usage.images.result"]
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) project_id>)
size: Optional[str]
When `group\_by=size`, this field provides the image size of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) size>)
source: Optional[str]
When `group\_by=source`, this field provides the source of the grouped usage result, possible values are `image.generation`, `image.edit`, `image.variation`.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) source>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3>)
class DataResultOrganizationUsageAudioSpeechesResult: …
The aggregated audio speeches usage details of the specific time bucket.
characters: int
The number of characters processed.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) characters>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) num_model_requests>)
object: Literal["organization.usage.audio\_speeches.result"]
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4>)
class DataResultOrganizationUsageAudioTranscriptionsResult: …
The aggregated audio transcriptions usage details of the specific time bucket.
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) num_model_requests>)
object: Literal["organization.usage.audio\_transcriptions.result"]
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) object>)
seconds: int
The number of seconds processed.
formatint64
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) seconds>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5>)
class DataResultOrganizationUsageVectorStoresResult: …
The aggregated vector stores usage details of the specific time bucket.
object: Literal["organization.usage.vector\_stores.result"]
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) object>)
usage\_bytes: int
The vector stores usage in bytes.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) usage_bytes>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6>)
class DataResultOrganizationUsageCodeInterpreterSessionsResult: …
The aggregated code interpreter sessions usage details of the specific time bucket.
object: Literal["organization.usage.code\_interpreter\_sessions.result"]
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) object>)
num\_sessions: Optional[int]
The number of code interpreter sessions.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) num_sessions>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7>)
class DataResultOrganizationCostsResult: …
The aggregated costs details of the specific time bucket.
object: Literal["organization.costs.result"]
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) object>)
amount: Optional[DataResultOrganizationCostsResultAmount]
The monetary value in its associated currency.
currency: Optional[str]
Lowercase ISO-4217 currency e.g. “usd”
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) currency>)
value: Optional[float]
The numeric value of the cost.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) value>)
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API Key ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) api_key_id>)
line\_item: Optional[str]
When `group\_by=line\_item`, this field provides the line item of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) line_item>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8>)
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result>)
start\_time: int
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) start_time>)
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data>)
has\_more: bool
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) has_more>)
next\_page: str
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) next_page>)
object: Literal["page"]
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) object>)
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema)>)
class UsageCodeInterpreterSessionsResponse: …
data: List[Data]
end\_time: int
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) end_time>)
object: Literal["bucket"]
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) object>)
result: List[DataResult]
One of the following:
class DataResultOrganizationUsageCompletionsResult: …
The aggregated completions usage details of the specific time bucket.
input\_tokens: int
The aggregated number of text input tokens used, including cached tokens. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_tokens>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) num_model_requests>)
object: Literal["organization.usage.completions.result"]
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) object>)
output\_tokens: int
The aggregated number of text output tokens used. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_tokens>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) api_key_id>)
batch: Optional[bool]
When `group\_by=batch`, this field tells whether the grouped usage result is batch or not.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) batch>)
input\_audio\_tokens: Optional[int]
The aggregated number of audio input tokens used, including cached tokens.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_audio_tokens>)
input\_cached\_tokens: Optional[int]
The aggregated number of text input tokens that has been cached from previous requests. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_cached_tokens>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) model>)
output\_audio\_tokens: Optional[int]
The aggregated number of audio output tokens used.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_audio_tokens>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) project_id>)
service\_tier: Optional[str]
When `group\_by=service\_tier`, this field provides the service tier of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) service_tier>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0>)
class DataResultOrganizationUsageEmbeddingsResult: …
The aggregated embeddings usage details of the specific time bucket.
input\_tokens: int
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) input_tokens>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) num_model_requests>)
object: Literal["organization.usage.embeddings.result"]
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1>)
class DataResultOrganizationUsageModerationsResult: …
The aggregated moderations usage details of the specific time bucket.
input\_tokens: int
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) input_tokens>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) num_model_requests>)
object: Literal["organization.usage.moderations.result"]
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2>)
class DataResultOrganizationUsageImagesResult: …
The aggregated images usage details of the specific time bucket.
images: int
The number of images processed.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) images>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) num_model_requests>)
object: Literal["organization.usage.images.result"]
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) project_id>)
size: Optional[str]
When `group\_by=size`, this field provides the image size of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) size>)
source: Optional[str]
When `group\_by=source`, this field provides the source of the grouped usage result, possible values are `image.generation`, `image.edit`, `image.variation`.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) source>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3>)
class DataResultOrganizationUsageAudioSpeechesResult: …
The aggregated audio speeches usage details of the specific time bucket.
characters: int
The number of characters processed.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) characters>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) num_model_requests>)
object: Literal["organization.usage.audio\_speeches.result"]
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4>)
class DataResultOrganizationUsageAudioTranscriptionsResult: …
The aggregated audio transcriptions usage details of the specific time bucket.
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) num_model_requests>)
object: Literal["organization.usage.audio\_transcriptions.result"]
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) object>)
seconds: int
The number of seconds processed.
formatint64
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) seconds>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5>)
class DataResultOrganizationUsageVectorStoresResult: …
The aggregated vector stores usage details of the specific time bucket.
object: Literal["organization.usage.vector\_stores.result"]
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) object>)
usage\_bytes: int
The vector stores usage in bytes.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) usage_bytes>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6>)
class DataResultOrganizationUsageCodeInterpreterSessionsResult: …
The aggregated code interpreter sessions usage details of the specific time bucket.
object: Literal["organization.usage.code\_interpreter\_sessions.result"]
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) object>)
num\_sessions: Optional[int]
The number of code interpreter sessions.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) num_sessions>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7>)
class DataResultOrganizationCostsResult: …
The aggregated costs details of the specific time bucket.
object: Literal["organization.costs.result"]
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) object>)
amount: Optional[DataResultOrganizationCostsResultAmount]
The monetary value in its associated currency.
currency: Optional[str]
Lowercase ISO-4217 currency e.g. “usd”
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) currency>)
value: Optional[float]
The numeric value of the cost.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) value>)
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API Key ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) api_key_id>)
line\_item: Optional[str]
When `group\_by=line\_item`, this field provides the line item of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) line_item>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8>)
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result>)
start\_time: int
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) start_time>)
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data>)
has\_more: bool
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) has_more>)
next\_page: str
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) next_page>)
object: Literal["page"]
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) object>)
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema)>)
class UsageCompletionsResponse: …
data: List[Data]
end\_time: int
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) end_time>)
object: Literal["bucket"]
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) object>)
result: List[DataResult]
One of the following:
class DataResultOrganizationUsageCompletionsResult: …
The aggregated completions usage details of the specific time bucket.
input\_tokens: int
The aggregated number of text input tokens used, including cached tokens. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_tokens>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) num_model_requests>)
object: Literal["organization.usage.completions.result"]
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) object>)
output\_tokens: int
The aggregated number of text output tokens used. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_tokens>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) api_key_id>)
batch: Optional[bool]
When `group\_by=batch`, this field tells whether the grouped usage result is batch or not.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) batch>)
input\_audio\_tokens: Optional[int]
The aggregated number of audio input tokens used, including cached tokens.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_audio_tokens>)
input\_cached\_tokens: Optional[int]
The aggregated number of text input tokens that has been cached from previous requests. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_cached_tokens>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) model>)
output\_audio\_tokens: Optional[int]
The aggregated number of audio output tokens used.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_audio_tokens>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) project_id>)
service\_tier: Optional[str]
When `group\_by=service\_tier`, this field provides the service tier of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) service_tier>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0>)
class DataResultOrganizationUsageEmbeddingsResult: …
The aggregated embeddings usage details of the specific time bucket.
input\_tokens: int
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) input_tokens>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) num_model_requests>)
object: Literal["organization.usage.embeddings.result"]
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1>)
class DataResultOrganizationUsageModerationsResult: …
The aggregated moderations usage details of the specific time bucket.
input\_tokens: int
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) input_tokens>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) num_model_requests>)
object: Literal["organization.usage.moderations.result"]
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2>)
class DataResultOrganizationUsageImagesResult: …
The aggregated images usage details of the specific time bucket.
images: int
The number of images processed.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) images>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) num_model_requests>)
object: Literal["organization.usage.images.result"]
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) project_id>)
size: Optional[str]
When `group\_by=size`, this field provides the image size of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) size>)
source: Optional[str]
When `group\_by=source`, this field provides the source of the grouped usage result, possible values are `image.generation`, `image.edit`, `image.variation`.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) source>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3>)
class DataResultOrganizationUsageAudioSpeechesResult: …
The aggregated audio speeches usage details of the specific time bucket.
characters: int
The number of characters processed.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) characters>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) num_model_requests>)
object: Literal["organization.usage.audio\_speeches.result"]
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4>)
class DataResultOrganizationUsageAudioTranscriptionsResult: …
The aggregated audio transcriptions usage details of the specific time bucket.
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) num_model_requests>)
object: Literal["organization.usage.audio\_transcriptions.result"]
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) object>)
seconds: int
The number of seconds processed.
formatint64
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) seconds>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5>)
class DataResultOrganizationUsageVectorStoresResult: …
The aggregated vector stores usage details of the specific time bucket.
object: Literal["organization.usage.vector\_stores.result"]
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) object>)
usage\_bytes: int
The vector stores usage in bytes.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) usage_bytes>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6>)
class DataResultOrganizationUsageCodeInterpreterSessionsResult: …
The aggregated code interpreter sessions usage details of the specific time bucket.
object: Literal["organization.usage.code\_interpreter\_sessions.result"]
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) object>)
num\_sessions: Optional[int]
The number of code interpreter sessions.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) num_sessions>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7>)
class DataResultOrganizationCostsResult: …
The aggregated costs details of the specific time bucket.
object: Literal["organization.costs.result"]
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) object>)
amount: Optional[DataResultOrganizationCostsResultAmount]
The monetary value in its associated currency.
currency: Optional[str]
Lowercase ISO-4217 currency e.g. “usd”
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) currency>)
value: Optional[float]
The numeric value of the cost.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) value>)
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API Key ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) api_key_id>)
line\_item: Optional[str]
When `group\_by=line\_item`, this field provides the line item of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) line_item>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8>)
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result>)
start\_time: int
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) start_time>)
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data>)
has\_more: bool
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) has_more>)
next\_page: str
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) next_page>)
object: Literal["page"]
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) object>)
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema)>)
class UsageEmbeddingsResponse: …
data: List[Data]
end\_time: int
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) end_time>)
object: Literal["bucket"]
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) object>)
result: List[DataResult]
One of the following:
class DataResultOrganizationUsageCompletionsResult: …
The aggregated completions usage details of the specific time bucket.
input\_tokens: int
The aggregated number of text input tokens used, including cached tokens. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_tokens>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) num_model_requests>)
object: Literal["organization.usage.completions.result"]
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) object>)
output\_tokens: int
The aggregated number of text output tokens used. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_tokens>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) api_key_id>)
batch: Optional[bool]
When `group\_by=batch`, this field tells whether the grouped usage result is batch or not.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) batch>)
input\_audio\_tokens: Optional[int]
The aggregated number of audio input tokens used, including cached tokens.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_audio_tokens>)
input\_cached\_tokens: Optional[int]
The aggregated number of text input tokens that has been cached from previous requests. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_cached_tokens>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) model>)
output\_audio\_tokens: Optional[int]
The aggregated number of audio output tokens used.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_audio_tokens>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) project_id>)
service\_tier: Optional[str]
When `group\_by=service\_tier`, this field provides the service tier of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) service_tier>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0>)
class DataResultOrganizationUsageEmbeddingsResult: …
The aggregated embeddings usage details of the specific time bucket.
input\_tokens: int
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) input_tokens>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) num_model_requests>)
object: Literal["organization.usage.embeddings.result"]
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1>)
class DataResultOrganizationUsageModerationsResult: …
The aggregated moderations usage details of the specific time bucket.
input\_tokens: int
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) input_tokens>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) num_model_requests>)
object: Literal["organization.usage.moderations.result"]
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2>)
class DataResultOrganizationUsageImagesResult: …
The aggregated images usage details of the specific time bucket.
images: int
The number of images processed.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) images>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) num_model_requests>)
object: Literal["organization.usage.images.result"]
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) project_id>)
size: Optional[str]
When `group\_by=size`, this field provides the image size of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) size>)
source: Optional[str]
When `group\_by=source`, this field provides the source of the grouped usage result, possible values are `image.generation`, `image.edit`, `image.variation`.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) source>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3>)
class DataResultOrganizationUsageAudioSpeechesResult: …
The aggregated audio speeches usage details of the specific time bucket.
characters: int
The number of characters processed.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) characters>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) num_model_requests>)
object: Literal["organization.usage.audio\_speeches.result"]
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4>)
class DataResultOrganizationUsageAudioTranscriptionsResult: …
The aggregated audio transcriptions usage details of the specific time bucket.
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) num_model_requests>)
object: Literal["organization.usage.audio\_transcriptions.result"]
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) object>)
seconds: int
The number of seconds processed.
formatint64
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) seconds>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5>)
class DataResultOrganizationUsageVectorStoresResult: …
The aggregated vector stores usage details of the specific time bucket.
object: Literal["organization.usage.vector\_stores.result"]
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) object>)
usage\_bytes: int
The vector stores usage in bytes.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) usage_bytes>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6>)
class DataResultOrganizationUsageCodeInterpreterSessionsResult: …
The aggregated code interpreter sessions usage details of the specific time bucket.
object: Literal["organization.usage.code\_interpreter\_sessions.result"]
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) object>)
num\_sessions: Optional[int]
The number of code interpreter sessions.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) num_sessions>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7>)
class DataResultOrganizationCostsResult: …
The aggregated costs details of the specific time bucket.
object: Literal["organization.costs.result"]
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) object>)
amount: Optional[DataResultOrganizationCostsResultAmount]
The monetary value in its associated currency.
currency: Optional[str]
Lowercase ISO-4217 currency e.g. “usd”
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) currency>)
value: Optional[float]
The numeric value of the cost.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) value>)
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API Key ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) api_key_id>)
line\_item: Optional[str]
When `group\_by=line\_item`, this field provides the line item of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) line_item>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8>)
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result>)
start\_time: int
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) start_time>)
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data>)
has\_more: bool
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) has_more>)
next\_page: str
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) next_page>)
object: Literal["page"]
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) object>)
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema)>)
class UsageImagesResponse: …
data: List[Data]
end\_time: int
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) end_time>)
object: Literal["bucket"]
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) object>)
result: List[DataResult]
One of the following:
class DataResultOrganizationUsageCompletionsResult: …
The aggregated completions usage details of the specific time bucket.
input\_tokens: int
The aggregated number of text input tokens used, including cached tokens. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_tokens>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) num_model_requests>)
object: Literal["organization.usage.completions.result"]
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) object>)
output\_tokens: int
The aggregated number of text output tokens used. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_tokens>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) api_key_id>)
batch: Optional[bool]
When `group\_by=batch`, this field tells whether the grouped usage result is batch or not.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) batch>)
input\_audio\_tokens: Optional[int]
The aggregated number of audio input tokens used, including cached tokens.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_audio_tokens>)
input\_cached\_tokens: Optional[int]
The aggregated number of text input tokens that has been cached from previous requests. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_cached_tokens>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) model>)
output\_audio\_tokens: Optional[int]
The aggregated number of audio output tokens used.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_audio_tokens>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) project_id>)
service\_tier: Optional[str]
When `group\_by=service\_tier`, this field provides the service tier of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) service_tier>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0>)
class DataResultOrganizationUsageEmbeddingsResult: …
The aggregated embeddings usage details of the specific time bucket.
input\_tokens: int
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) input_tokens>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) num_model_requests>)
object: Literal["organization.usage.embeddings.result"]
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1>)
class DataResultOrganizationUsageModerationsResult: …
The aggregated moderations usage details of the specific time bucket.
input\_tokens: int
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) input_tokens>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) num_model_requests>)
object: Literal["organization.usage.moderations.result"]
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2>)
class DataResultOrganizationUsageImagesResult: …
The aggregated images usage details of the specific time bucket.
images: int
The number of images processed.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) images>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) num_model_requests>)
object: Literal["organization.usage.images.result"]
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) project_id>)
size: Optional[str]
When `group\_by=size`, this field provides the image size of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) size>)
source: Optional[str]
When `group\_by=source`, this field provides the source of the grouped usage result, possible values are `image.generation`, `image.edit`, `image.variation`.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) source>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3>)
class DataResultOrganizationUsageAudioSpeechesResult: …
The aggregated audio speeches usage details of the specific time bucket.
characters: int
The number of characters processed.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) characters>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) num_model_requests>)
object: Literal["organization.usage.audio\_speeches.result"]
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4>)
class DataResultOrganizationUsageAudioTranscriptionsResult: …
The aggregated audio transcriptions usage details of the specific time bucket.
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) num_model_requests>)
object: Literal["organization.usage.audio\_transcriptions.result"]
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) object>)
seconds: int
The number of seconds processed.
formatint64
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) seconds>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5>)
class DataResultOrganizationUsageVectorStoresResult: …
The aggregated vector stores usage details of the specific time bucket.
object: Literal["organization.usage.vector\_stores.result"]
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) object>)
usage\_bytes: int
The vector stores usage in bytes.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) usage_bytes>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6>)
class DataResultOrganizationUsageCodeInterpreterSessionsResult: …
The aggregated code interpreter sessions usage details of the specific time bucket.
object: Literal["organization.usage.code\_interpreter\_sessions.result"]
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) object>)
num\_sessions: Optional[int]
The number of code interpreter sessions.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) num_sessions>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7>)
class DataResultOrganizationCostsResult: …
The aggregated costs details of the specific time bucket.
object: Literal["organization.costs.result"]
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) object>)
amount: Optional[DataResultOrganizationCostsResultAmount]
The monetary value in its associated currency.
currency: Optional[str]
Lowercase ISO-4217 currency e.g. “usd”
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) currency>)
value: Optional[float]
The numeric value of the cost.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) value>)
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API Key ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) api_key_id>)
line\_item: Optional[str]
When `group\_by=line\_item`, this field provides the line item of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) line_item>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8>)
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result>)
start\_time: int
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) start_time>)
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data>)
has\_more: bool
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) has_more>)
next\_page: str
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) next_page>)
object: Literal["page"]
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) object>)
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema)>)
class UsageModerationsResponse: …
data: List[Data]
end\_time: int
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) end_time>)
object: Literal["bucket"]
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) object>)
result: List[DataResult]
One of the following:
class DataResultOrganizationUsageCompletionsResult: …
The aggregated completions usage details of the specific time bucket.
input\_tokens: int
The aggregated number of text input tokens used, including cached tokens. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_tokens>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) num_model_requests>)
object: Literal["organization.usage.completions.result"]
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) object>)
output\_tokens: int
The aggregated number of text output tokens used. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_tokens>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) api_key_id>)
batch: Optional[bool]
When `group\_by=batch`, this field tells whether the grouped usage result is batch or not.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) batch>)
input\_audio\_tokens: Optional[int]
The aggregated number of audio input tokens used, including cached tokens.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_audio_tokens>)
input\_cached\_tokens: Optional[int]
The aggregated number of text input tokens that has been cached from previous requests. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_cached_tokens>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) model>)
output\_audio\_tokens: Optional[int]
The aggregated number of audio output tokens used.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_audio_tokens>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) project_id>)
service\_tier: Optional[str]
When `group\_by=service\_tier`, this field provides the service tier of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) service_tier>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0>)
class DataResultOrganizationUsageEmbeddingsResult: …
The aggregated embeddings usage details of the specific time bucket.
input\_tokens: int
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) input_tokens>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) num_model_requests>)
object: Literal["organization.usage.embeddings.result"]
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1>)
class DataResultOrganizationUsageModerationsResult: …
The aggregated moderations usage details of the specific time bucket.
input\_tokens: int
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) input_tokens>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) num_model_requests>)
object: Literal["organization.usage.moderations.result"]
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2>)
class DataResultOrganizationUsageImagesResult: …
The aggregated images usage details of the specific time bucket.
images: int
The number of images processed.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) images>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) num_model_requests>)
object: Literal["organization.usage.images.result"]
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) project_id>)
size: Optional[str]
When `group\_by=size`, this field provides the image size of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) size>)
source: Optional[str]
When `group\_by=source`, this field provides the source of the grouped usage result, possible values are `image.generation`, `image.edit`, `image.variation`.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) source>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3>)
class DataResultOrganizationUsageAudioSpeechesResult: …
The aggregated audio speeches usage details of the specific time bucket.
characters: int
The number of characters processed.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) characters>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) num_model_requests>)
object: Literal["organization.usage.audio\_speeches.result"]
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4>)
class DataResultOrganizationUsageAudioTranscriptionsResult: …
The aggregated audio transcriptions usage details of the specific time bucket.
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) num_model_requests>)
object: Literal["organization.usage.audio\_transcriptions.result"]
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) object>)
seconds: int
The number of seconds processed.
formatint64
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) seconds>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5>)
class DataResultOrganizationUsageVectorStoresResult: …
The aggregated vector stores usage details of the specific time bucket.
object: Literal["organization.usage.vector\_stores.result"]
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) object>)
usage\_bytes: int
The vector stores usage in bytes.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) usage_bytes>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6>)
class DataResultOrganizationUsageCodeInterpreterSessionsResult: …
The aggregated code interpreter sessions usage details of the specific time bucket.
object: Literal["organization.usage.code\_interpreter\_sessions.result"]
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) object>)
num\_sessions: Optional[int]
The number of code interpreter sessions.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) num_sessions>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7>)
class DataResultOrganizationCostsResult: …
The aggregated costs details of the specific time bucket.
object: Literal["organization.costs.result"]
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) object>)
amount: Optional[DataResultOrganizationCostsResultAmount]
The monetary value in its associated currency.
currency: Optional[str]
Lowercase ISO-4217 currency e.g. “usd”
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) currency>)
value: Optional[float]
The numeric value of the cost.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) value>)
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API Key ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) api_key_id>)
line\_item: Optional[str]
When `group\_by=line\_item`, this field provides the line item of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) line_item>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8>)
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result>)
start\_time: int
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) start_time>)
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data>)
has\_more: bool
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) has_more>)
next\_page: str
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) next_page>)
object: Literal["page"]
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) object>)
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema)>)
class UsageVectorStoresResponse: …
data: List[Data]
end\_time: int
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) end_time>)
object: Literal["bucket"]
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) object>)
result: List[DataResult]
One of the following:
class DataResultOrganizationUsageCompletionsResult: …
The aggregated completions usage details of the specific time bucket.
input\_tokens: int
The aggregated number of text input tokens used, including cached tokens. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_tokens>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) num_model_requests>)
object: Literal["organization.usage.completions.result"]
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) object>)
output\_tokens: int
The aggregated number of text output tokens used. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_tokens>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) api_key_id>)
batch: Optional[bool]
When `group\_by=batch`, this field tells whether the grouped usage result is batch or not.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) batch>)
input\_audio\_tokens: Optional[int]
The aggregated number of audio input tokens used, including cached tokens.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_audio_tokens>)
input\_cached\_tokens: Optional[int]
The aggregated number of text input tokens that has been cached from previous requests. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_cached_tokens>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) model>)
output\_audio\_tokens: Optional[int]
The aggregated number of audio output tokens used.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_audio_tokens>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) project_id>)
service\_tier: Optional[str]
When `group\_by=service\_tier`, this field provides the service tier of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) service_tier>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0>)
class DataResultOrganizationUsageEmbeddingsResult: …
The aggregated embeddings usage details of the specific time bucket.
input\_tokens: int
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) input_tokens>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) num_model_requests>)
object: Literal["organization.usage.embeddings.result"]
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1>)
class DataResultOrganizationUsageModerationsResult: …
The aggregated moderations usage details of the specific time bucket.
input\_tokens: int
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) input_tokens>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) num_model_requests>)
object: Literal["organization.usage.moderations.result"]
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2>)
class DataResultOrganizationUsageImagesResult: …
The aggregated images usage details of the specific time bucket.
images: int
The number of images processed.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) images>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) num_model_requests>)
object: Literal["organization.usage.images.result"]
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) project_id>)
size: Optional[str]
When `group\_by=size`, this field provides the image size of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) size>)
source: Optional[str]
When `group\_by=source`, this field provides the source of the grouped usage result, possible values are `image.generation`, `image.edit`, `image.variation`.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) source>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3>)
class DataResultOrganizationUsageAudioSpeechesResult: …
The aggregated audio speeches usage details of the specific time bucket.
characters: int
The number of characters processed.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) characters>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) num_model_requests>)
object: Literal["organization.usage.audio\_speeches.result"]
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4>)
class DataResultOrganizationUsageAudioTranscriptionsResult: …
The aggregated audio transcriptions usage details of the specific time bucket.
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) num_model_requests>)
object: Literal["organization.usage.audio\_transcriptions.result"]
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) object>)
seconds: int
The number of seconds processed.
formatint64
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) seconds>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5>)
class DataResultOrganizationUsageVectorStoresResult: …
The aggregated vector stores usage details of the specific time bucket.
object: Literal["organization.usage.vector\_stores.result"]
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) object>)
usage\_bytes: int
The vector stores usage in bytes.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) usage_bytes>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6>)
class DataResultOrganizationUsageCodeInterpreterSessionsResult: …
The aggregated code interpreter sessions usage details of the specific time bucket.
object: Literal["organization.usage.code\_interpreter\_sessions.result"]
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) object>)
num\_sessions: Optional[int]
The number of code interpreter sessions.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) num_sessions>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7>)
class DataResultOrganizationCostsResult: …
The aggregated costs details of the specific time bucket.
object: Literal["organization.costs.result"]
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) object>)
amount: Optional[DataResultOrganizationCostsResultAmount]
The monetary value in its associated currency.
currency: Optional[str]
Lowercase ISO-4217 currency e.g. “usd”
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) currency>)
value: Optional[float]
The numeric value of the cost.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) value>)
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API Key ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) api_key_id>)
line\_item: Optional[str]
When `group\_by=line\_item`, this field provides the line item of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) line_item>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8>)
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result>)
start\_time: int
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) start_time>)
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data>)
has\_more: bool
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) has_more>)
next\_page: str
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) next_page>)
object: Literal["page"]
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) object>)
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema)>)
class UsageCostsResponse: …
data: List[Data]
end\_time: int
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) end_time>)
object: Literal["bucket"]
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) object>)
result: List[DataResult]
One of the following:
class DataResultOrganizationUsageCompletionsResult: …
The aggregated completions usage details of the specific time bucket.
input\_tokens: int
The aggregated number of text input tokens used, including cached tokens. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_tokens>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) num_model_requests>)
object: Literal["organization.usage.completions.result"]
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) object>)
output\_tokens: int
The aggregated number of text output tokens used. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_tokens>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) api_key_id>)
batch: Optional[bool]
When `group\_by=batch`, this field tells whether the grouped usage result is batch or not.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) batch>)
input\_audio\_tokens: Optional[int]
The aggregated number of audio input tokens used, including cached tokens.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_audio_tokens>)
input\_cached\_tokens: Optional[int]
The aggregated number of text input tokens that has been cached from previous requests. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_cached_tokens>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) model>)
output\_audio\_tokens: Optional[int]
The aggregated number of audio output tokens used.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_audio_tokens>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) project_id>)
service\_tier: Optional[str]
When `group\_by=service\_tier`, this field provides the service tier of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) service_tier>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0>)
class DataResultOrganizationUsageEmbeddingsResult: …
The aggregated embeddings usage details of the specific time bucket.
input\_tokens: int
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) input_tokens>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) num_model_requests>)
object: Literal["organization.usage.embeddings.result"]
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1>)
class DataResultOrganizationUsageModerationsResult: …
The aggregated moderations usage details of the specific time bucket.
input\_tokens: int
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) input_tokens>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) num_model_requests>)
object: Literal["organization.usage.moderations.result"]
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2>)
class DataResultOrganizationUsageImagesResult: …
The aggregated images usage details of the specific time bucket.
images: int
The number of images processed.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) images>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) num_model_requests>)
object: Literal["organization.usage.images.result"]
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) project_id>)
size: Optional[str]
When `group\_by=size`, this field provides the image size of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) size>)
source: Optional[str]
When `group\_by=source`, this field provides the source of the grouped usage result, possible values are `image.generation`, `image.edit`, `image.variation`.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) source>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3>)
class DataResultOrganizationUsageAudioSpeechesResult: …
The aggregated audio speeches usage details of the specific time bucket.
characters: int
The number of characters processed.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) characters>)
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) num_model_requests>)
object: Literal["organization.usage.audio\_speeches.result"]
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) object>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4>)
class DataResultOrganizationUsageAudioTranscriptionsResult: …
The aggregated audio transcriptions usage details of the specific time bucket.
num\_model\_requests: int
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) num_model_requests>)
object: Literal["organization.usage.audio\_transcriptions.result"]
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) object>)
seconds: int
The number of seconds processed.
formatint64
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) seconds>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) api_key_id>)
model: Optional[str]
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) model>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) project_id>)
user\_id: Optional[str]
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5>)
class DataResultOrganizationUsageVectorStoresResult: …
The aggregated vector stores usage details of the specific time bucket.
object: Literal["organization.usage.vector\_stores.result"]
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) object>)
usage\_bytes: int
The vector stores usage in bytes.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) usage_bytes>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6>)
class DataResultOrganizationUsageCodeInterpreterSessionsResult: …
The aggregated code interpreter sessions usage details of the specific time bucket.
object: Literal["organization.usage.code\_interpreter\_sessions.result"]
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) object>)
num\_sessions: Optional[int]
The number of code interpreter sessions.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) num_sessions>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7>)
class DataResultOrganizationCostsResult: …
The aggregated costs details of the specific time bucket.
object: Literal["organization.costs.result"]
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) object>)
amount: Optional[DataResultOrganizationCostsResultAmount]
The monetary value in its associated currency.
currency: Optional[str]
Lowercase ISO-4217 currency e.g. “usd”
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) currency>)
value: Optional[float]
The numeric value of the cost.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) value>)
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount>)
api\_key\_id: Optional[str]
When `group\_by=api\_key\_id`, this field provides the API Key ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) api_key_id>)
line\_item: Optional[str]
When `group\_by=line\_item`, this field provides the line item of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) line_item>)
project\_id: Optional[str]
When `group\_by=project\_id`, this field provides the project ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8>)
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result>)
start\_time: int
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) start_time>)
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data>)
has\_more: bool
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) has_more>)
next\_page: str
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) next_page>)
object: Literal["page"]
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) object>)
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema)>)