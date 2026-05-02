Usage | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Admin](/api/reference/ruby/resources/admin)
[Organization](/api/reference/ruby/resources/admin/subresources/organization)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Usage
##### [Audio speeches](/api/reference/ruby/resources/admin/subresources/organization/subresources/usage/methods/audio_speeches)
admin.organization.usage.audio\_speeches(\*\*kwargs) -\> [UsageAudioSpeechesResponse](</api/reference/ruby/resources/admin#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema)>) { data, has\_more, next\_page, object }
GET/organization/usage/audio\_speeches
##### [Audio transcriptions](/api/reference/ruby/resources/admin/subresources/organization/subresources/usage/methods/audio_transcriptions)
admin.organization.usage.audio\_transcriptions(\*\*kwargs) -\> [UsageAudioTranscriptionsResponse](</api/reference/ruby/resources/admin#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema)>) { data, has\_more, next\_page, object }
GET/organization/usage/audio\_transcriptions
##### [Code interpreter sessions](/api/reference/ruby/resources/admin/subresources/organization/subresources/usage/methods/code_interpreter_sessions)
admin.organization.usage.code\_interpreter\_sessions(\*\*kwargs) -\> [UsageCodeInterpreterSessionsResponse](</api/reference/ruby/resources/admin#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema)>) { data, has\_more, next\_page, object }
GET/organization/usage/code\_interpreter\_sessions
##### [Completions](/api/reference/ruby/resources/admin/subresources/organization/subresources/usage/methods/completions)
admin.organization.usage.completions(\*\*kwargs) -\> [UsageCompletionsResponse](</api/reference/ruby/resources/admin#(resource) admin.organization.usage > (model) usage_completions_response > (schema)>) { data, has\_more, next\_page, object }
GET/organization/usage/completions
##### [Embeddings](/api/reference/ruby/resources/admin/subresources/organization/subresources/usage/methods/embeddings)
admin.organization.usage.embeddings(\*\*kwargs) -\> [UsageEmbeddingsResponse](</api/reference/ruby/resources/admin#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema)>) { data, has\_more, next\_page, object }
GET/organization/usage/embeddings
##### [Images](/api/reference/ruby/resources/admin/subresources/organization/subresources/usage/methods/images)
admin.organization.usage.images(\*\*kwargs) -\> [UsageImagesResponse](</api/reference/ruby/resources/admin#(resource) admin.organization.usage > (model) usage_images_response > (schema)>) { data, has\_more, next\_page, object }
GET/organization/usage/images
##### [Moderations](/api/reference/ruby/resources/admin/subresources/organization/subresources/usage/methods/moderations)
admin.organization.usage.moderations(\*\*kwargs) -\> [UsageModerationsResponse](</api/reference/ruby/resources/admin#(resource) admin.organization.usage > (model) usage_moderations_response > (schema)>) { data, has\_more, next\_page, object }
GET/organization/usage/moderations
##### [Vector stores](/api/reference/ruby/resources/admin/subresources/organization/subresources/usage/methods/vector_stores)
admin.organization.usage.vector\_stores(\*\*kwargs) -\> [UsageVectorStoresResponse](</api/reference/ruby/resources/admin#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema)>) { data, has\_more, next\_page, object }
GET/organization/usage/vector\_stores
##### [Costs](/api/reference/ruby/resources/admin/subresources/organization/subresources/usage/methods/costs)
admin.organization.usage.costs(\*\*kwargs) -\> [UsageCostsResponse](</api/reference/ruby/resources/admin#(resource) admin.organization.usage > (model) usage_costs_response > (schema)>) { data, has\_more, next\_page, object }
GET/organization/costs
##### ModelsExpand Collapse
class UsageAudioSpeechesResponse { data, has\_more, next\_page, object }
data: Array[Data{ end\_time, object, result, start\_time}]
end\_time: Integer
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) end_time>)
object: :bucket
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) object>)
result: Array[OrganizationUsageCompletionsResult{ input\_tokens, num\_model\_requests, object, 10 more} | OrganizationUsageEmbeddingsResult{ input\_tokens, num\_model\_requests, object, 4 more} | OrganizationUsageModerationsResult{ input\_tokens, num\_model\_requests, object, 4 more} | 6 more]
One of the following:
class OrganizationUsageCompletionsResult { input\_tokens, num\_model\_requests, object, 10 more }
The aggregated completions usage details of the specific time bucket.
input\_tokens: Integer
The aggregated number of text input tokens used, including cached tokens. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_tokens>)
num\_model\_requests: Integer
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) num_model_requests>)
object: :"organization.usage.completions.result"
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) object>)
output\_tokens: Integer
The aggregated number of text output tokens used. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_tokens>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) api_key_id>)
batch: bool
When `group\_by=batch`, this field tells whether the grouped usage result is batch or not.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) batch>)
input\_audio\_tokens: Integer
The aggregated number of audio input tokens used, including cached tokens.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_audio_tokens>)
input\_cached\_tokens: Integer
The aggregated number of text input tokens that has been cached from previous requests. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_cached_tokens>)
model: String
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) model>)
output\_audio\_tokens: Integer
The aggregated number of audio output tokens used.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_audio_tokens>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) project_id>)
service\_tier: String
When `group\_by=service\_tier`, this field provides the service tier of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) service_tier>)
user\_id: String
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0>)
class OrganizationUsageEmbeddingsResult { input\_tokens, num\_model\_requests, object, 4 more }
The aggregated embeddings usage details of the specific time bucket.
input\_tokens: Integer
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) input_tokens>)
num\_model\_requests: Integer
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) num_model_requests>)
object: :"organization.usage.embeddings.result"
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) object>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) api_key_id>)
model: String
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) model>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) project_id>)
user\_id: String
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1>)
class OrganizationUsageModerationsResult { input\_tokens, num\_model\_requests, object, 4 more }
The aggregated moderations usage details of the specific time bucket.
input\_tokens: Integer
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) input_tokens>)
num\_model\_requests: Integer
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) num_model_requests>)
object: :"organization.usage.moderations.result"
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) object>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) api_key_id>)
model: String
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) model>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) project_id>)
user\_id: String
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2>)
class OrganizationUsageImagesResult { images, num\_model\_requests, object, 6 more }
The aggregated images usage details of the specific time bucket.
images: Integer
The number of images processed.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) images>)
num\_model\_requests: Integer
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) num_model_requests>)
object: :"organization.usage.images.result"
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) object>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) api_key_id>)
model: String
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) model>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) project_id>)
size: String
When `group\_by=size`, this field provides the image size of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) size>)
source: String
When `group\_by=source`, this field provides the source of the grouped usage result, possible values are `image.generation`, `image.edit`, `image.variation`.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) source>)
user\_id: String
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3>)
class OrganizationUsageAudioSpeechesResult { characters, num\_model\_requests, object, 4 more }
The aggregated audio speeches usage details of the specific time bucket.
characters: Integer
The number of characters processed.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) characters>)
num\_model\_requests: Integer
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) num_model_requests>)
object: :"organization.usage.audio\_speeches.result"
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) object>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) api_key_id>)
model: String
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) model>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) project_id>)
user\_id: String
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4>)
class OrganizationUsageAudioTranscriptionsResult { num\_model\_requests, object, seconds, 4 more }
The aggregated audio transcriptions usage details of the specific time bucket.
num\_model\_requests: Integer
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) num_model_requests>)
object: :"organization.usage.audio\_transcriptions.result"
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) object>)
seconds: Integer
The number of seconds processed.
formatint64
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) seconds>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) api_key_id>)
model: String
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) model>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) project_id>)
user\_id: String
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5>)
class OrganizationUsageVectorStoresResult { object, usage\_bytes, project\_id }
The aggregated vector stores usage details of the specific time bucket.
object: :"organization.usage.vector\_stores.result"
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) object>)
usage\_bytes: Integer
The vector stores usage in bytes.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) usage_bytes>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6>)
class OrganizationUsageCodeInterpreterSessionsResult { object, num\_sessions, project\_id }
The aggregated code interpreter sessions usage details of the specific time bucket.
object: :"organization.usage.code\_interpreter\_sessions.result"
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) object>)
num\_sessions: Integer
The number of code interpreter sessions.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) num_sessions>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7>)
class OrganizationCostsResult { object, amount, api\_key\_id, 2 more }
The aggregated costs details of the specific time bucket.
object: :"organization.costs.result"
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) object>)
amount: Amount{ currency, value}
The monetary value in its associated currency.
currency: String
Lowercase ISO-4217 currency e.g. “usd”
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) currency>)
value: Float
The numeric value of the cost.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) value>)
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API Key ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) api_key_id>)
line\_item: String
When `group\_by=line\_item`, this field provides the line item of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) line_item>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8>)
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) result>)
start\_time: Integer
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data > (items) > (property) start_time>)
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) data>)
has\_more: bool
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) has_more>)
next\_page: String
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) next_page>)
object: :page
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema) > (property) object>)
[](<#(resource) admin.organization.usage > (model) usage_audio_speeches_response > (schema)>)
class UsageAudioTranscriptionsResponse { data, has\_more, next\_page, object }
data: Array[Data{ end\_time, object, result, start\_time}]
end\_time: Integer
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) end_time>)
object: :bucket
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) object>)
result: Array[OrganizationUsageCompletionsResult{ input\_tokens, num\_model\_requests, object, 10 more} | OrganizationUsageEmbeddingsResult{ input\_tokens, num\_model\_requests, object, 4 more} | OrganizationUsageModerationsResult{ input\_tokens, num\_model\_requests, object, 4 more} | 6 more]
One of the following:
class OrganizationUsageCompletionsResult { input\_tokens, num\_model\_requests, object, 10 more }
The aggregated completions usage details of the specific time bucket.
input\_tokens: Integer
The aggregated number of text input tokens used, including cached tokens. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_tokens>)
num\_model\_requests: Integer
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) num_model_requests>)
object: :"organization.usage.completions.result"
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) object>)
output\_tokens: Integer
The aggregated number of text output tokens used. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_tokens>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) api_key_id>)
batch: bool
When `group\_by=batch`, this field tells whether the grouped usage result is batch or not.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) batch>)
input\_audio\_tokens: Integer
The aggregated number of audio input tokens used, including cached tokens.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_audio_tokens>)
input\_cached\_tokens: Integer
The aggregated number of text input tokens that has been cached from previous requests. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_cached_tokens>)
model: String
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) model>)
output\_audio\_tokens: Integer
The aggregated number of audio output tokens used.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_audio_tokens>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) project_id>)
service\_tier: String
When `group\_by=service\_tier`, this field provides the service tier of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) service_tier>)
user\_id: String
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0>)
class OrganizationUsageEmbeddingsResult { input\_tokens, num\_model\_requests, object, 4 more }
The aggregated embeddings usage details of the specific time bucket.
input\_tokens: Integer
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) input_tokens>)
num\_model\_requests: Integer
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) num_model_requests>)
object: :"organization.usage.embeddings.result"
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) object>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) api_key_id>)
model: String
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) model>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) project_id>)
user\_id: String
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1>)
class OrganizationUsageModerationsResult { input\_tokens, num\_model\_requests, object, 4 more }
The aggregated moderations usage details of the specific time bucket.
input\_tokens: Integer
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) input_tokens>)
num\_model\_requests: Integer
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) num_model_requests>)
object: :"organization.usage.moderations.result"
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) object>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) api_key_id>)
model: String
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) model>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) project_id>)
user\_id: String
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2>)
class OrganizationUsageImagesResult { images, num\_model\_requests, object, 6 more }
The aggregated images usage details of the specific time bucket.
images: Integer
The number of images processed.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) images>)
num\_model\_requests: Integer
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) num_model_requests>)
object: :"organization.usage.images.result"
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) object>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) api_key_id>)
model: String
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) model>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) project_id>)
size: String
When `group\_by=size`, this field provides the image size of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) size>)
source: String
When `group\_by=source`, this field provides the source of the grouped usage result, possible values are `image.generation`, `image.edit`, `image.variation`.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) source>)
user\_id: String
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3>)
class OrganizationUsageAudioSpeechesResult { characters, num\_model\_requests, object, 4 more }
The aggregated audio speeches usage details of the specific time bucket.
characters: Integer
The number of characters processed.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) characters>)
num\_model\_requests: Integer
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) num_model_requests>)
object: :"organization.usage.audio\_speeches.result"
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) object>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) api_key_id>)
model: String
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) model>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) project_id>)
user\_id: String
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4>)
class OrganizationUsageAudioTranscriptionsResult { num\_model\_requests, object, seconds, 4 more }
The aggregated audio transcriptions usage details of the specific time bucket.
num\_model\_requests: Integer
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) num_model_requests>)
object: :"organization.usage.audio\_transcriptions.result"
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) object>)
seconds: Integer
The number of seconds processed.
formatint64
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) seconds>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) api_key_id>)
model: String
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) model>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) project_id>)
user\_id: String
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5>)
class OrganizationUsageVectorStoresResult { object, usage\_bytes, project\_id }
The aggregated vector stores usage details of the specific time bucket.
object: :"organization.usage.vector\_stores.result"
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) object>)
usage\_bytes: Integer
The vector stores usage in bytes.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) usage_bytes>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6>)
class OrganizationUsageCodeInterpreterSessionsResult { object, num\_sessions, project\_id }
The aggregated code interpreter sessions usage details of the specific time bucket.
object: :"organization.usage.code\_interpreter\_sessions.result"
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) object>)
num\_sessions: Integer
The number of code interpreter sessions.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) num_sessions>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7>)
class OrganizationCostsResult { object, amount, api\_key\_id, 2 more }
The aggregated costs details of the specific time bucket.
object: :"organization.costs.result"
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) object>)
amount: Amount{ currency, value}
The monetary value in its associated currency.
currency: String
Lowercase ISO-4217 currency e.g. “usd”
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) currency>)
value: Float
The numeric value of the cost.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) value>)
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API Key ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) api_key_id>)
line\_item: String
When `group\_by=line\_item`, this field provides the line item of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) line_item>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8>)
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) result>)
start\_time: Integer
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data > (items) > (property) start_time>)
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) data>)
has\_more: bool
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) has_more>)
next\_page: String
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) next_page>)
object: :page
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema) > (property) object>)
[](<#(resource) admin.organization.usage > (model) usage_audio_transcriptions_response > (schema)>)
class UsageCodeInterpreterSessionsResponse { data, has\_more, next\_page, object }
data: Array[Data{ end\_time, object, result, start\_time}]
end\_time: Integer
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) end_time>)
object: :bucket
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) object>)
result: Array[OrganizationUsageCompletionsResult{ input\_tokens, num\_model\_requests, object, 10 more} | OrganizationUsageEmbeddingsResult{ input\_tokens, num\_model\_requests, object, 4 more} | OrganizationUsageModerationsResult{ input\_tokens, num\_model\_requests, object, 4 more} | 6 more]
One of the following:
class OrganizationUsageCompletionsResult { input\_tokens, num\_model\_requests, object, 10 more }
The aggregated completions usage details of the specific time bucket.
input\_tokens: Integer
The aggregated number of text input tokens used, including cached tokens. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_tokens>)
num\_model\_requests: Integer
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) num_model_requests>)
object: :"organization.usage.completions.result"
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) object>)
output\_tokens: Integer
The aggregated number of text output tokens used. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_tokens>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) api_key_id>)
batch: bool
When `group\_by=batch`, this field tells whether the grouped usage result is batch or not.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) batch>)
input\_audio\_tokens: Integer
The aggregated number of audio input tokens used, including cached tokens.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_audio_tokens>)
input\_cached\_tokens: Integer
The aggregated number of text input tokens that has been cached from previous requests. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_cached_tokens>)
model: String
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) model>)
output\_audio\_tokens: Integer
The aggregated number of audio output tokens used.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_audio_tokens>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) project_id>)
service\_tier: String
When `group\_by=service\_tier`, this field provides the service tier of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) service_tier>)
user\_id: String
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0>)
class OrganizationUsageEmbeddingsResult { input\_tokens, num\_model\_requests, object, 4 more }
The aggregated embeddings usage details of the specific time bucket.
input\_tokens: Integer
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) input_tokens>)
num\_model\_requests: Integer
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) num_model_requests>)
object: :"organization.usage.embeddings.result"
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) object>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) api_key_id>)
model: String
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) model>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) project_id>)
user\_id: String
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1>)
class OrganizationUsageModerationsResult { input\_tokens, num\_model\_requests, object, 4 more }
The aggregated moderations usage details of the specific time bucket.
input\_tokens: Integer
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) input_tokens>)
num\_model\_requests: Integer
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) num_model_requests>)
object: :"organization.usage.moderations.result"
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) object>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) api_key_id>)
model: String
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) model>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) project_id>)
user\_id: String
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2>)
class OrganizationUsageImagesResult { images, num\_model\_requests, object, 6 more }
The aggregated images usage details of the specific time bucket.
images: Integer
The number of images processed.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) images>)
num\_model\_requests: Integer
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) num_model_requests>)
object: :"organization.usage.images.result"
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) object>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) api_key_id>)
model: String
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) model>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) project_id>)
size: String
When `group\_by=size`, this field provides the image size of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) size>)
source: String
When `group\_by=source`, this field provides the source of the grouped usage result, possible values are `image.generation`, `image.edit`, `image.variation`.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) source>)
user\_id: String
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3>)
class OrganizationUsageAudioSpeechesResult { characters, num\_model\_requests, object, 4 more }
The aggregated audio speeches usage details of the specific time bucket.
characters: Integer
The number of characters processed.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) characters>)
num\_model\_requests: Integer
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) num_model_requests>)
object: :"organization.usage.audio\_speeches.result"
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) object>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) api_key_id>)
model: String
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) model>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) project_id>)
user\_id: String
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4>)
class OrganizationUsageAudioTranscriptionsResult { num\_model\_requests, object, seconds, 4 more }
The aggregated audio transcriptions usage details of the specific time bucket.
num\_model\_requests: Integer
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) num_model_requests>)
object: :"organization.usage.audio\_transcriptions.result"
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) object>)
seconds: Integer
The number of seconds processed.
formatint64
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) seconds>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) api_key_id>)
model: String
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) model>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) project_id>)
user\_id: String
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5>)
class OrganizationUsageVectorStoresResult { object, usage\_bytes, project\_id }
The aggregated vector stores usage details of the specific time bucket.
object: :"organization.usage.vector\_stores.result"
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) object>)
usage\_bytes: Integer
The vector stores usage in bytes.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) usage_bytes>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6>)
class OrganizationUsageCodeInterpreterSessionsResult { object, num\_sessions, project\_id }
The aggregated code interpreter sessions usage details of the specific time bucket.
object: :"organization.usage.code\_interpreter\_sessions.result"
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) object>)
num\_sessions: Integer
The number of code interpreter sessions.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) num_sessions>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7>)
class OrganizationCostsResult { object, amount, api\_key\_id, 2 more }
The aggregated costs details of the specific time bucket.
object: :"organization.costs.result"
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) object>)
amount: Amount{ currency, value}
The monetary value in its associated currency.
currency: String
Lowercase ISO-4217 currency e.g. “usd”
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) currency>)
value: Float
The numeric value of the cost.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) value>)
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API Key ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) api_key_id>)
line\_item: String
When `group\_by=line\_item`, this field provides the line item of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) line_item>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8>)
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) result>)
start\_time: Integer
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data > (items) > (property) start_time>)
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) data>)
has\_more: bool
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) has_more>)
next\_page: String
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) next_page>)
object: :page
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema) > (property) object>)
[](<#(resource) admin.organization.usage > (model) usage_code_interpreter_sessions_response > (schema)>)
class UsageCompletionsResponse { data, has\_more, next\_page, object }
data: Array[Data{ end\_time, object, result, start\_time}]
end\_time: Integer
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) end_time>)
object: :bucket
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) object>)
result: Array[OrganizationUsageCompletionsResult{ input\_tokens, num\_model\_requests, object, 10 more} | OrganizationUsageEmbeddingsResult{ input\_tokens, num\_model\_requests, object, 4 more} | OrganizationUsageModerationsResult{ input\_tokens, num\_model\_requests, object, 4 more} | 6 more]
One of the following:
class OrganizationUsageCompletionsResult { input\_tokens, num\_model\_requests, object, 10 more }
The aggregated completions usage details of the specific time bucket.
input\_tokens: Integer
The aggregated number of text input tokens used, including cached tokens. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_tokens>)
num\_model\_requests: Integer
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) num_model_requests>)
object: :"organization.usage.completions.result"
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) object>)
output\_tokens: Integer
The aggregated number of text output tokens used. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_tokens>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) api_key_id>)
batch: bool
When `group\_by=batch`, this field tells whether the grouped usage result is batch or not.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) batch>)
input\_audio\_tokens: Integer
The aggregated number of audio input tokens used, including cached tokens.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_audio_tokens>)
input\_cached\_tokens: Integer
The aggregated number of text input tokens that has been cached from previous requests. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_cached_tokens>)
model: String
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) model>)
output\_audio\_tokens: Integer
The aggregated number of audio output tokens used.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_audio_tokens>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) project_id>)
service\_tier: String
When `group\_by=service\_tier`, this field provides the service tier of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) service_tier>)
user\_id: String
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0>)
class OrganizationUsageEmbeddingsResult { input\_tokens, num\_model\_requests, object, 4 more }
The aggregated embeddings usage details of the specific time bucket.
input\_tokens: Integer
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) input_tokens>)
num\_model\_requests: Integer
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) num_model_requests>)
object: :"organization.usage.embeddings.result"
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) object>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) api_key_id>)
model: String
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) model>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) project_id>)
user\_id: String
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1>)
class OrganizationUsageModerationsResult { input\_tokens, num\_model\_requests, object, 4 more }
The aggregated moderations usage details of the specific time bucket.
input\_tokens: Integer
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) input_tokens>)
num\_model\_requests: Integer
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) num_model_requests>)
object: :"organization.usage.moderations.result"
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) object>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) api_key_id>)
model: String
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) model>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) project_id>)
user\_id: String
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2>)
class OrganizationUsageImagesResult { images, num\_model\_requests, object, 6 more }
The aggregated images usage details of the specific time bucket.
images: Integer
The number of images processed.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) images>)
num\_model\_requests: Integer
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) num_model_requests>)
object: :"organization.usage.images.result"
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) object>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) api_key_id>)
model: String
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) model>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) project_id>)
size: String
When `group\_by=size`, this field provides the image size of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) size>)
source: String
When `group\_by=source`, this field provides the source of the grouped usage result, possible values are `image.generation`, `image.edit`, `image.variation`.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) source>)
user\_id: String
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3>)
class OrganizationUsageAudioSpeechesResult { characters, num\_model\_requests, object, 4 more }
The aggregated audio speeches usage details of the specific time bucket.
characters: Integer
The number of characters processed.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) characters>)
num\_model\_requests: Integer
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) num_model_requests>)
object: :"organization.usage.audio\_speeches.result"
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) object>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) api_key_id>)
model: String
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) model>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) project_id>)
user\_id: String
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4>)
class OrganizationUsageAudioTranscriptionsResult { num\_model\_requests, object, seconds, 4 more }
The aggregated audio transcriptions usage details of the specific time bucket.
num\_model\_requests: Integer
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) num_model_requests>)
object: :"organization.usage.audio\_transcriptions.result"
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) object>)
seconds: Integer
The number of seconds processed.
formatint64
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) seconds>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) api_key_id>)
model: String
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) model>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) project_id>)
user\_id: String
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5>)
class OrganizationUsageVectorStoresResult { object, usage\_bytes, project\_id }
The aggregated vector stores usage details of the specific time bucket.
object: :"organization.usage.vector\_stores.result"
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) object>)
usage\_bytes: Integer
The vector stores usage in bytes.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) usage_bytes>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6>)
class OrganizationUsageCodeInterpreterSessionsResult { object, num\_sessions, project\_id }
The aggregated code interpreter sessions usage details of the specific time bucket.
object: :"organization.usage.code\_interpreter\_sessions.result"
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) object>)
num\_sessions: Integer
The number of code interpreter sessions.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) num_sessions>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7>)
class OrganizationCostsResult { object, amount, api\_key\_id, 2 more }
The aggregated costs details of the specific time bucket.
object: :"organization.costs.result"
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) object>)
amount: Amount{ currency, value}
The monetary value in its associated currency.
currency: String
Lowercase ISO-4217 currency e.g. “usd”
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) currency>)
value: Float
The numeric value of the cost.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) value>)
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API Key ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) api_key_id>)
line\_item: String
When `group\_by=line\_item`, this field provides the line item of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) line_item>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8>)
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) result>)
start\_time: Integer
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data > (items) > (property) start_time>)
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) data>)
has\_more: bool
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) has_more>)
next\_page: String
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) next_page>)
object: :page
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema) > (property) object>)
[](<#(resource) admin.organization.usage > (model) usage_completions_response > (schema)>)
class UsageEmbeddingsResponse { data, has\_more, next\_page, object }
data: Array[Data{ end\_time, object, result, start\_time}]
end\_time: Integer
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) end_time>)
object: :bucket
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) object>)
result: Array[OrganizationUsageCompletionsResult{ input\_tokens, num\_model\_requests, object, 10 more} | OrganizationUsageEmbeddingsResult{ input\_tokens, num\_model\_requests, object, 4 more} | OrganizationUsageModerationsResult{ input\_tokens, num\_model\_requests, object, 4 more} | 6 more]
One of the following:
class OrganizationUsageCompletionsResult { input\_tokens, num\_model\_requests, object, 10 more }
The aggregated completions usage details of the specific time bucket.
input\_tokens: Integer
The aggregated number of text input tokens used, including cached tokens. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_tokens>)
num\_model\_requests: Integer
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) num_model_requests>)
object: :"organization.usage.completions.result"
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) object>)
output\_tokens: Integer
The aggregated number of text output tokens used. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_tokens>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) api_key_id>)
batch: bool
When `group\_by=batch`, this field tells whether the grouped usage result is batch or not.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) batch>)
input\_audio\_tokens: Integer
The aggregated number of audio input tokens used, including cached tokens.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_audio_tokens>)
input\_cached\_tokens: Integer
The aggregated number of text input tokens that has been cached from previous requests. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_cached_tokens>)
model: String
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) model>)
output\_audio\_tokens: Integer
The aggregated number of audio output tokens used.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_audio_tokens>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) project_id>)
service\_tier: String
When `group\_by=service\_tier`, this field provides the service tier of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) service_tier>)
user\_id: String
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0>)
class OrganizationUsageEmbeddingsResult { input\_tokens, num\_model\_requests, object, 4 more }
The aggregated embeddings usage details of the specific time bucket.
input\_tokens: Integer
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) input_tokens>)
num\_model\_requests: Integer
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) num_model_requests>)
object: :"organization.usage.embeddings.result"
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) object>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) api_key_id>)
model: String
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) model>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) project_id>)
user\_id: String
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1>)
class OrganizationUsageModerationsResult { input\_tokens, num\_model\_requests, object, 4 more }
The aggregated moderations usage details of the specific time bucket.
input\_tokens: Integer
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) input_tokens>)
num\_model\_requests: Integer
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) num_model_requests>)
object: :"organization.usage.moderations.result"
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) object>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) api_key_id>)
model: String
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) model>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) project_id>)
user\_id: String
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2>)
class OrganizationUsageImagesResult { images, num\_model\_requests, object, 6 more }
The aggregated images usage details of the specific time bucket.
images: Integer
The number of images processed.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) images>)
num\_model\_requests: Integer
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) num_model_requests>)
object: :"organization.usage.images.result"
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) object>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) api_key_id>)
model: String
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) model>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) project_id>)
size: String
When `group\_by=size`, this field provides the image size of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) size>)
source: String
When `group\_by=source`, this field provides the source of the grouped usage result, possible values are `image.generation`, `image.edit`, `image.variation`.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) source>)
user\_id: String
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3>)
class OrganizationUsageAudioSpeechesResult { characters, num\_model\_requests, object, 4 more }
The aggregated audio speeches usage details of the specific time bucket.
characters: Integer
The number of characters processed.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) characters>)
num\_model\_requests: Integer
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) num_model_requests>)
object: :"organization.usage.audio\_speeches.result"
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) object>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) api_key_id>)
model: String
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) model>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) project_id>)
user\_id: String
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4>)
class OrganizationUsageAudioTranscriptionsResult { num\_model\_requests, object, seconds, 4 more }
The aggregated audio transcriptions usage details of the specific time bucket.
num\_model\_requests: Integer
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) num_model_requests>)
object: :"organization.usage.audio\_transcriptions.result"
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) object>)
seconds: Integer
The number of seconds processed.
formatint64
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) seconds>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) api_key_id>)
model: String
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) model>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) project_id>)
user\_id: String
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5>)
class OrganizationUsageVectorStoresResult { object, usage\_bytes, project\_id }
The aggregated vector stores usage details of the specific time bucket.
object: :"organization.usage.vector\_stores.result"
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) object>)
usage\_bytes: Integer
The vector stores usage in bytes.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) usage_bytes>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6>)
class OrganizationUsageCodeInterpreterSessionsResult { object, num\_sessions, project\_id }
The aggregated code interpreter sessions usage details of the specific time bucket.
object: :"organization.usage.code\_interpreter\_sessions.result"
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) object>)
num\_sessions: Integer
The number of code interpreter sessions.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) num_sessions>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7>)
class OrganizationCostsResult { object, amount, api\_key\_id, 2 more }
The aggregated costs details of the specific time bucket.
object: :"organization.costs.result"
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) object>)
amount: Amount{ currency, value}
The monetary value in its associated currency.
currency: String
Lowercase ISO-4217 currency e.g. “usd”
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) currency>)
value: Float
The numeric value of the cost.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) value>)
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API Key ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) api_key_id>)
line\_item: String
When `group\_by=line\_item`, this field provides the line item of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) line_item>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8>)
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) result>)
start\_time: Integer
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data > (items) > (property) start_time>)
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) data>)
has\_more: bool
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) has_more>)
next\_page: String
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) next_page>)
object: :page
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema) > (property) object>)
[](<#(resource) admin.organization.usage > (model) usage_embeddings_response > (schema)>)
class UsageImagesResponse { data, has\_more, next\_page, object }
data: Array[Data{ end\_time, object, result, start\_time}]
end\_time: Integer
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) end_time>)
object: :bucket
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) object>)
result: Array[OrganizationUsageCompletionsResult{ input\_tokens, num\_model\_requests, object, 10 more} | OrganizationUsageEmbeddingsResult{ input\_tokens, num\_model\_requests, object, 4 more} | OrganizationUsageModerationsResult{ input\_tokens, num\_model\_requests, object, 4 more} | 6 more]
One of the following:
class OrganizationUsageCompletionsResult { input\_tokens, num\_model\_requests, object, 10 more }
The aggregated completions usage details of the specific time bucket.
input\_tokens: Integer
The aggregated number of text input tokens used, including cached tokens. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_tokens>)
num\_model\_requests: Integer
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) num_model_requests>)
object: :"organization.usage.completions.result"
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) object>)
output\_tokens: Integer
The aggregated number of text output tokens used. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_tokens>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) api_key_id>)
batch: bool
When `group\_by=batch`, this field tells whether the grouped usage result is batch or not.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) batch>)
input\_audio\_tokens: Integer
The aggregated number of audio input tokens used, including cached tokens.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_audio_tokens>)
input\_cached\_tokens: Integer
The aggregated number of text input tokens that has been cached from previous requests. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_cached_tokens>)
model: String
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) model>)
output\_audio\_tokens: Integer
The aggregated number of audio output tokens used.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_audio_tokens>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) project_id>)
service\_tier: String
When `group\_by=service\_tier`, this field provides the service tier of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) service_tier>)
user\_id: String
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0>)
class OrganizationUsageEmbeddingsResult { input\_tokens, num\_model\_requests, object, 4 more }
The aggregated embeddings usage details of the specific time bucket.
input\_tokens: Integer
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) input_tokens>)
num\_model\_requests: Integer
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) num_model_requests>)
object: :"organization.usage.embeddings.result"
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) object>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) api_key_id>)
model: String
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) model>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) project_id>)
user\_id: String
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1>)
class OrganizationUsageModerationsResult { input\_tokens, num\_model\_requests, object, 4 more }
The aggregated moderations usage details of the specific time bucket.
input\_tokens: Integer
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) input_tokens>)
num\_model\_requests: Integer
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) num_model_requests>)
object: :"organization.usage.moderations.result"
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) object>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) api_key_id>)
model: String
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) model>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) project_id>)
user\_id: String
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2>)
class OrganizationUsageImagesResult { images, num\_model\_requests, object, 6 more }
The aggregated images usage details of the specific time bucket.
images: Integer
The number of images processed.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) images>)
num\_model\_requests: Integer
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) num_model_requests>)
object: :"organization.usage.images.result"
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) object>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) api_key_id>)
model: String
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) model>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) project_id>)
size: String
When `group\_by=size`, this field provides the image size of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) size>)
source: String
When `group\_by=source`, this field provides the source of the grouped usage result, possible values are `image.generation`, `image.edit`, `image.variation`.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) source>)
user\_id: String
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3>)
class OrganizationUsageAudioSpeechesResult { characters, num\_model\_requests, object, 4 more }
The aggregated audio speeches usage details of the specific time bucket.
characters: Integer
The number of characters processed.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) characters>)
num\_model\_requests: Integer
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) num_model_requests>)
object: :"organization.usage.audio\_speeches.result"
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) object>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) api_key_id>)
model: String
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) model>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) project_id>)
user\_id: String
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4>)
class OrganizationUsageAudioTranscriptionsResult { num\_model\_requests, object, seconds, 4 more }
The aggregated audio transcriptions usage details of the specific time bucket.
num\_model\_requests: Integer
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) num_model_requests>)
object: :"organization.usage.audio\_transcriptions.result"
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) object>)
seconds: Integer
The number of seconds processed.
formatint64
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) seconds>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) api_key_id>)
model: String
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) model>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) project_id>)
user\_id: String
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5>)
class OrganizationUsageVectorStoresResult { object, usage\_bytes, project\_id }
The aggregated vector stores usage details of the specific time bucket.
object: :"organization.usage.vector\_stores.result"
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) object>)
usage\_bytes: Integer
The vector stores usage in bytes.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) usage_bytes>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6>)
class OrganizationUsageCodeInterpreterSessionsResult { object, num\_sessions, project\_id }
The aggregated code interpreter sessions usage details of the specific time bucket.
object: :"organization.usage.code\_interpreter\_sessions.result"
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) object>)
num\_sessions: Integer
The number of code interpreter sessions.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) num_sessions>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7>)
class OrganizationCostsResult { object, amount, api\_key\_id, 2 more }
The aggregated costs details of the specific time bucket.
object: :"organization.costs.result"
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) object>)
amount: Amount{ currency, value}
The monetary value in its associated currency.
currency: String
Lowercase ISO-4217 currency e.g. “usd”
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) currency>)
value: Float
The numeric value of the cost.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) value>)
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API Key ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) api_key_id>)
line\_item: String
When `group\_by=line\_item`, this field provides the line item of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) line_item>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8>)
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) result>)
start\_time: Integer
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data > (items) > (property) start_time>)
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) data>)
has\_more: bool
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) has_more>)
next\_page: String
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) next_page>)
object: :page
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema) > (property) object>)
[](<#(resource) admin.organization.usage > (model) usage_images_response > (schema)>)
class UsageModerationsResponse { data, has\_more, next\_page, object }
data: Array[Data{ end\_time, object, result, start\_time}]
end\_time: Integer
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) end_time>)
object: :bucket
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) object>)
result: Array[OrganizationUsageCompletionsResult{ input\_tokens, num\_model\_requests, object, 10 more} | OrganizationUsageEmbeddingsResult{ input\_tokens, num\_model\_requests, object, 4 more} | OrganizationUsageModerationsResult{ input\_tokens, num\_model\_requests, object, 4 more} | 6 more]
One of the following:
class OrganizationUsageCompletionsResult { input\_tokens, num\_model\_requests, object, 10 more }
The aggregated completions usage details of the specific time bucket.
input\_tokens: Integer
The aggregated number of text input tokens used, including cached tokens. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_tokens>)
num\_model\_requests: Integer
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) num_model_requests>)
object: :"organization.usage.completions.result"
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) object>)
output\_tokens: Integer
The aggregated number of text output tokens used. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_tokens>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) api_key_id>)
batch: bool
When `group\_by=batch`, this field tells whether the grouped usage result is batch or not.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) batch>)
input\_audio\_tokens: Integer
The aggregated number of audio input tokens used, including cached tokens.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_audio_tokens>)
input\_cached\_tokens: Integer
The aggregated number of text input tokens that has been cached from previous requests. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_cached_tokens>)
model: String
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) model>)
output\_audio\_tokens: Integer
The aggregated number of audio output tokens used.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_audio_tokens>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) project_id>)
service\_tier: String
When `group\_by=service\_tier`, this field provides the service tier of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) service_tier>)
user\_id: String
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0>)
class OrganizationUsageEmbeddingsResult { input\_tokens, num\_model\_requests, object, 4 more }
The aggregated embeddings usage details of the specific time bucket.
input\_tokens: Integer
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) input_tokens>)
num\_model\_requests: Integer
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) num_model_requests>)
object: :"organization.usage.embeddings.result"
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) object>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) api_key_id>)
model: String
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) model>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) project_id>)
user\_id: String
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1>)
class OrganizationUsageModerationsResult { input\_tokens, num\_model\_requests, object, 4 more }
The aggregated moderations usage details of the specific time bucket.
input\_tokens: Integer
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) input_tokens>)
num\_model\_requests: Integer
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) num_model_requests>)
object: :"organization.usage.moderations.result"
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) object>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) api_key_id>)
model: String
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) model>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) project_id>)
user\_id: String
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2>)
class OrganizationUsageImagesResult { images, num\_model\_requests, object, 6 more }
The aggregated images usage details of the specific time bucket.
images: Integer
The number of images processed.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) images>)
num\_model\_requests: Integer
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) num_model_requests>)
object: :"organization.usage.images.result"
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) object>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) api_key_id>)
model: String
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) model>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) project_id>)
size: String
When `group\_by=size`, this field provides the image size of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) size>)
source: String
When `group\_by=source`, this field provides the source of the grouped usage result, possible values are `image.generation`, `image.edit`, `image.variation`.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) source>)
user\_id: String
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3>)
class OrganizationUsageAudioSpeechesResult { characters, num\_model\_requests, object, 4 more }
The aggregated audio speeches usage details of the specific time bucket.
characters: Integer
The number of characters processed.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) characters>)
num\_model\_requests: Integer
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) num_model_requests>)
object: :"organization.usage.audio\_speeches.result"
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) object>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) api_key_id>)
model: String
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) model>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) project_id>)
user\_id: String
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4>)
class OrganizationUsageAudioTranscriptionsResult { num\_model\_requests, object, seconds, 4 more }
The aggregated audio transcriptions usage details of the specific time bucket.
num\_model\_requests: Integer
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) num_model_requests>)
object: :"organization.usage.audio\_transcriptions.result"
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) object>)
seconds: Integer
The number of seconds processed.
formatint64
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) seconds>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) api_key_id>)
model: String
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) model>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) project_id>)
user\_id: String
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5>)
class OrganizationUsageVectorStoresResult { object, usage\_bytes, project\_id }
The aggregated vector stores usage details of the specific time bucket.
object: :"organization.usage.vector\_stores.result"
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) object>)
usage\_bytes: Integer
The vector stores usage in bytes.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) usage_bytes>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6>)
class OrganizationUsageCodeInterpreterSessionsResult { object, num\_sessions, project\_id }
The aggregated code interpreter sessions usage details of the specific time bucket.
object: :"organization.usage.code\_interpreter\_sessions.result"
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) object>)
num\_sessions: Integer
The number of code interpreter sessions.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) num_sessions>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7>)
class OrganizationCostsResult { object, amount, api\_key\_id, 2 more }
The aggregated costs details of the specific time bucket.
object: :"organization.costs.result"
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) object>)
amount: Amount{ currency, value}
The monetary value in its associated currency.
currency: String
Lowercase ISO-4217 currency e.g. “usd”
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) currency>)
value: Float
The numeric value of the cost.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) value>)
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API Key ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) api_key_id>)
line\_item: String
When `group\_by=line\_item`, this field provides the line item of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) line_item>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8>)
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) result>)
start\_time: Integer
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data > (items) > (property) start_time>)
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) data>)
has\_more: bool
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) has_more>)
next\_page: String
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) next_page>)
object: :page
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema) > (property) object>)
[](<#(resource) admin.organization.usage > (model) usage_moderations_response > (schema)>)
class UsageVectorStoresResponse { data, has\_more, next\_page, object }
data: Array[Data{ end\_time, object, result, start\_time}]
end\_time: Integer
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) end_time>)
object: :bucket
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) object>)
result: Array[OrganizationUsageCompletionsResult{ input\_tokens, num\_model\_requests, object, 10 more} | OrganizationUsageEmbeddingsResult{ input\_tokens, num\_model\_requests, object, 4 more} | OrganizationUsageModerationsResult{ input\_tokens, num\_model\_requests, object, 4 more} | 6 more]
One of the following:
class OrganizationUsageCompletionsResult { input\_tokens, num\_model\_requests, object, 10 more }
The aggregated completions usage details of the specific time bucket.
input\_tokens: Integer
The aggregated number of text input tokens used, including cached tokens. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_tokens>)
num\_model\_requests: Integer
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) num_model_requests>)
object: :"organization.usage.completions.result"
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) object>)
output\_tokens: Integer
The aggregated number of text output tokens used. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_tokens>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) api_key_id>)
batch: bool
When `group\_by=batch`, this field tells whether the grouped usage result is batch or not.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) batch>)
input\_audio\_tokens: Integer
The aggregated number of audio input tokens used, including cached tokens.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_audio_tokens>)
input\_cached\_tokens: Integer
The aggregated number of text input tokens that has been cached from previous requests. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_cached_tokens>)
model: String
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) model>)
output\_audio\_tokens: Integer
The aggregated number of audio output tokens used.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_audio_tokens>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) project_id>)
service\_tier: String
When `group\_by=service\_tier`, this field provides the service tier of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) service_tier>)
user\_id: String
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0>)
class OrganizationUsageEmbeddingsResult { input\_tokens, num\_model\_requests, object, 4 more }
The aggregated embeddings usage details of the specific time bucket.
input\_tokens: Integer
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) input_tokens>)
num\_model\_requests: Integer
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) num_model_requests>)
object: :"organization.usage.embeddings.result"
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) object>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) api_key_id>)
model: String
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) model>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) project_id>)
user\_id: String
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1>)
class OrganizationUsageModerationsResult { input\_tokens, num\_model\_requests, object, 4 more }
The aggregated moderations usage details of the specific time bucket.
input\_tokens: Integer
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) input_tokens>)
num\_model\_requests: Integer
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) num_model_requests>)
object: :"organization.usage.moderations.result"
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) object>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) api_key_id>)
model: String
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) model>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) project_id>)
user\_id: String
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2>)
class OrganizationUsageImagesResult { images, num\_model\_requests, object, 6 more }
The aggregated images usage details of the specific time bucket.
images: Integer
The number of images processed.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) images>)
num\_model\_requests: Integer
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) num_model_requests>)
object: :"organization.usage.images.result"
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) object>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) api_key_id>)
model: String
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) model>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) project_id>)
size: String
When `group\_by=size`, this field provides the image size of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) size>)
source: String
When `group\_by=source`, this field provides the source of the grouped usage result, possible values are `image.generation`, `image.edit`, `image.variation`.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) source>)
user\_id: String
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3>)
class OrganizationUsageAudioSpeechesResult { characters, num\_model\_requests, object, 4 more }
The aggregated audio speeches usage details of the specific time bucket.
characters: Integer
The number of characters processed.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) characters>)
num\_model\_requests: Integer
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) num_model_requests>)
object: :"organization.usage.audio\_speeches.result"
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) object>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) api_key_id>)
model: String
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) model>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) project_id>)
user\_id: String
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4>)
class OrganizationUsageAudioTranscriptionsResult { num\_model\_requests, object, seconds, 4 more }
The aggregated audio transcriptions usage details of the specific time bucket.
num\_model\_requests: Integer
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) num_model_requests>)
object: :"organization.usage.audio\_transcriptions.result"
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) object>)
seconds: Integer
The number of seconds processed.
formatint64
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) seconds>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) api_key_id>)
model: String
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) model>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) project_id>)
user\_id: String
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5>)
class OrganizationUsageVectorStoresResult { object, usage\_bytes, project\_id }
The aggregated vector stores usage details of the specific time bucket.
object: :"organization.usage.vector\_stores.result"
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) object>)
usage\_bytes: Integer
The vector stores usage in bytes.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) usage_bytes>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6>)
class OrganizationUsageCodeInterpreterSessionsResult { object, num\_sessions, project\_id }
The aggregated code interpreter sessions usage details of the specific time bucket.
object: :"organization.usage.code\_interpreter\_sessions.result"
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) object>)
num\_sessions: Integer
The number of code interpreter sessions.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) num_sessions>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7>)
class OrganizationCostsResult { object, amount, api\_key\_id, 2 more }
The aggregated costs details of the specific time bucket.
object: :"organization.costs.result"
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) object>)
amount: Amount{ currency, value}
The monetary value in its associated currency.
currency: String
Lowercase ISO-4217 currency e.g. “usd”
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) currency>)
value: Float
The numeric value of the cost.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) value>)
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API Key ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) api_key_id>)
line\_item: String
When `group\_by=line\_item`, this field provides the line item of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) line_item>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8>)
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) result>)
start\_time: Integer
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data > (items) > (property) start_time>)
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) data>)
has\_more: bool
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) has_more>)
next\_page: String
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) next_page>)
object: :page
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema) > (property) object>)
[](<#(resource) admin.organization.usage > (model) usage_vector_stores_response > (schema)>)
class UsageCostsResponse { data, has\_more, next\_page, object }
data: Array[Data{ end\_time, object, result, start\_time}]
end\_time: Integer
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) end_time>)
object: :bucket
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) object>)
result: Array[OrganizationUsageCompletionsResult{ input\_tokens, num\_model\_requests, object, 10 more} | OrganizationUsageEmbeddingsResult{ input\_tokens, num\_model\_requests, object, 4 more} | OrganizationUsageModerationsResult{ input\_tokens, num\_model\_requests, object, 4 more} | 6 more]
One of the following:
class OrganizationUsageCompletionsResult { input\_tokens, num\_model\_requests, object, 10 more }
The aggregated completions usage details of the specific time bucket.
input\_tokens: Integer
The aggregated number of text input tokens used, including cached tokens. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_tokens>)
num\_model\_requests: Integer
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) num_model_requests>)
object: :"organization.usage.completions.result"
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) object>)
output\_tokens: Integer
The aggregated number of text output tokens used. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_tokens>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) api_key_id>)
batch: bool
When `group\_by=batch`, this field tells whether the grouped usage result is batch or not.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) batch>)
input\_audio\_tokens: Integer
The aggregated number of audio input tokens used, including cached tokens.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_audio_tokens>)
input\_cached\_tokens: Integer
The aggregated number of text input tokens that has been cached from previous requests. For customers subscribe to scale tier, this includes scale tier tokens.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) input_cached_tokens>)
model: String
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) model>)
output\_audio\_tokens: Integer
The aggregated number of audio output tokens used.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) output_audio_tokens>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) project_id>)
service\_tier: String
When `group\_by=service\_tier`, this field provides the service tier of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) service_tier>)
user\_id: String
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 0>)
class OrganizationUsageEmbeddingsResult { input\_tokens, num\_model\_requests, object, 4 more }
The aggregated embeddings usage details of the specific time bucket.
input\_tokens: Integer
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) input_tokens>)
num\_model\_requests: Integer
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) num_model_requests>)
object: :"organization.usage.embeddings.result"
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) object>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) api_key_id>)
model: String
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) model>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) project_id>)
user\_id: String
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 1>)
class OrganizationUsageModerationsResult { input\_tokens, num\_model\_requests, object, 4 more }
The aggregated moderations usage details of the specific time bucket.
input\_tokens: Integer
The aggregated number of input tokens used.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) input_tokens>)
num\_model\_requests: Integer
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) num_model_requests>)
object: :"organization.usage.moderations.result"
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) object>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) api_key_id>)
model: String
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) model>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) project_id>)
user\_id: String
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 2>)
class OrganizationUsageImagesResult { images, num\_model\_requests, object, 6 more }
The aggregated images usage details of the specific time bucket.
images: Integer
The number of images processed.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) images>)
num\_model\_requests: Integer
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) num_model_requests>)
object: :"organization.usage.images.result"
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) object>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) api_key_id>)
model: String
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) model>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) project_id>)
size: String
When `group\_by=size`, this field provides the image size of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) size>)
source: String
When `group\_by=source`, this field provides the source of the grouped usage result, possible values are `image.generation`, `image.edit`, `image.variation`.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) source>)
user\_id: String
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 3>)
class OrganizationUsageAudioSpeechesResult { characters, num\_model\_requests, object, 4 more }
The aggregated audio speeches usage details of the specific time bucket.
characters: Integer
The number of characters processed.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) characters>)
num\_model\_requests: Integer
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) num_model_requests>)
object: :"organization.usage.audio\_speeches.result"
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) object>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) api_key_id>)
model: String
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) model>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) project_id>)
user\_id: String
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 4>)
class OrganizationUsageAudioTranscriptionsResult { num\_model\_requests, object, seconds, 4 more }
The aggregated audio transcriptions usage details of the specific time bucket.
num\_model\_requests: Integer
The count of requests made to the model.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) num_model_requests>)
object: :"organization.usage.audio\_transcriptions.result"
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) object>)
seconds: Integer
The number of seconds processed.
formatint64
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) seconds>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API key ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) api_key_id>)
model: String
When `group\_by=model`, this field provides the model name of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) model>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) project_id>)
user\_id: String
When `group\_by=user\_id`, this field provides the user ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5 > (property) user_id>)
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 5>)
class OrganizationUsageVectorStoresResult { object, usage\_bytes, project\_id }
The aggregated vector stores usage details of the specific time bucket.
object: :"organization.usage.vector\_stores.result"
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) object>)
usage\_bytes: Integer
The vector stores usage in bytes.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) usage_bytes>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 6>)
class OrganizationUsageCodeInterpreterSessionsResult { object, num\_sessions, project\_id }
The aggregated code interpreter sessions usage details of the specific time bucket.
object: :"organization.usage.code\_interpreter\_sessions.result"
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) object>)
num\_sessions: Integer
The number of code interpreter sessions.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) num_sessions>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped usage result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 7>)
class OrganizationCostsResult { object, amount, api\_key\_id, 2 more }
The aggregated costs details of the specific time bucket.
object: :"organization.costs.result"
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) object>)
amount: Amount{ currency, value}
The monetary value in its associated currency.
currency: String
Lowercase ISO-4217 currency e.g. “usd”
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) currency>)
value: Float
The numeric value of the cost.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount > (property) value>)
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) amount>)
api\_key\_id: String
When `group\_by=api\_key\_id`, this field provides the API Key ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) api_key_id>)
line\_item: String
When `group\_by=line\_item`, this field provides the line item of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) line_item>)
project\_id: String
When `group\_by=project\_id`, this field provides the project ID of the grouped costs result.
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8 > (property) project_id>)
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result > (items) > (variant) 8>)
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) result>)
start\_time: Integer
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data > (items) > (property) start_time>)
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) data>)
has\_more: bool
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) has_more>)
next\_page: String
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) next_page>)
object: :page
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema) > (property) object>)
[](<#(resource) admin.organization.usage > (model) usage_costs_response > (schema)>)