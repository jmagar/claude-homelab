Completions | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Completions
Given a prompt, the model will return one or more predicted completions, and can also return the probabilities of alternative tokens at each position.
##### [Create completion](/api/reference/java/resources/completions/methods/create)
[Completion](</api/reference/java/resources/completions#(resource) completions > (model) completion > (schema)>) completions().create(CompletionCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/completions
##### ModelsExpand Collapse
class Completion:
Represents a completion response from the API. Note: both the streamed and non-streamed response objects share the same shape (unlike the chat endpoint).
String id
A unique identifier for the completion.
[](<#(resource) completions > (model) completion > (schema) > (property) id>)
List\<[CompletionChoice](</api/reference/java/resources/completions#(resource) completions > (model) completion_choice > (schema)>)\> choices
The list of completion choices the model generated for the input prompt.
FinishReason finishReason
The reason the model stopped generating tokens. This will be `stop` if the model hit a natural stop point or a provided stop sequence,
`length` if the maximum number of tokens specified in the request was reached,
or `content\_filter` if content was omitted due to a flag from our content filters.
One of the following:
STOP("stop")
[](<#(resource) completions > (model) completion_choice > (schema) > (property) finish_reason > (member) 0>)
LENGTH("length")
[](<#(resource) completions > (model) completion_choice > (schema) > (property) finish_reason > (member) 1>)
CONTENT\_FILTER("content\_filter")
[](<#(resource) completions > (model) completion_choice > (schema) > (property) finish_reason > (member) 2>)
[](<#(resource) completions > (model) completion_choice > (schema) > (property) finish_reason>)
long index
[](<#(resource) completions > (model) completion_choice > (schema) > (property) index>)
Optional\<Logprobs\> logprobs
Optional\<List\<Long\>\> textOffset
[](<#(resource) completions > (model) completion_choice > (schema) > (property) logprobs > (property) text_offset>)
Optional\<List\<Double\>\> tokenLogprobs
[](<#(resource) completions > (model) completion_choice > (schema) > (property) logprobs > (property) token_logprobs>)
Optional\<List\<String\>\> tokens
[](<#(resource) completions > (model) completion_choice > (schema) > (property) logprobs > (property) tokens>)
Optional\<List\<TopLogprob\>\> topLogprobs
[](<#(resource) completions > (model) completion_choice > (schema) > (property) logprobs > (property) top_logprobs>)
[](<#(resource) completions > (model) completion_choice > (schema) > (property) logprobs>)
String text
[](<#(resource) completions > (model) completion_choice > (schema) > (property) text>)
[](<#(resource) completions > (model) completion > (schema) > (property) choices>)
long created
The Unix timestamp (in seconds) of when the completion was created.
formatunixtime
[](<#(resource) completions > (model) completion > (schema) > (property) created>)
String model
The model used for completion.
[](<#(resource) completions > (model) completion > (schema) > (property) model>)
JsonValue; object\_ "text\_completion"constant"text\_completion"constant
The object type, which is always “text\_completion”
[](<#(resource) completions > (model) completion > (schema) > (property) object>)
Optional\<String\> systemFingerprint
This fingerprint represents the backend configuration that the model runs with.
Can be used in conjunction with the `seed` request parameter to understand when backend changes have been made that might impact determinism.
[](<#(resource) completions > (model) completion > (schema) > (property) system_fingerprint>)
Optional\<[CompletionUsage](</api/reference/java/resources/completions#(resource) completions > (model) completion_usage > (schema)>)\> usage
Usage statistics for the completion request.
[](<#(resource) completions > (model) completion > (schema) > (property) usage>)
[](<#(resource) completions > (model) completion > (schema)>)
class CompletionChoice:
FinishReason finishReason
The reason the model stopped generating tokens. This will be `stop` if the model hit a natural stop point or a provided stop sequence,
`length` if the maximum number of tokens specified in the request was reached,
or `content\_filter` if content was omitted due to a flag from our content filters.
One of the following:
STOP("stop")
[](<#(resource) completions > (model) completion_choice > (schema) > (property) finish_reason > (member) 0>)
LENGTH("length")
[](<#(resource) completions > (model) completion_choice > (schema) > (property) finish_reason > (member) 1>)
CONTENT\_FILTER("content\_filter")
[](<#(resource) completions > (model) completion_choice > (schema) > (property) finish_reason > (member) 2>)
[](<#(resource) completions > (model) completion_choice > (schema) > (property) finish_reason>)
long index
[](<#(resource) completions > (model) completion_choice > (schema) > (property) index>)
Optional\<Logprobs\> logprobs
Optional\<List\<Long\>\> textOffset
[](<#(resource) completions > (model) completion_choice > (schema) > (property) logprobs > (property) text_offset>)
Optional\<List\<Double\>\> tokenLogprobs
[](<#(resource) completions > (model) completion_choice > (schema) > (property) logprobs > (property) token_logprobs>)
Optional\<List\<String\>\> tokens
[](<#(resource) completions > (model) completion_choice > (schema) > (property) logprobs > (property) tokens>)
Optional\<List\<TopLogprob\>\> topLogprobs
[](<#(resource) completions > (model) completion_choice > (schema) > (property) logprobs > (property) top_logprobs>)
[](<#(resource) completions > (model) completion_choice > (schema) > (property) logprobs>)
String text
[](<#(resource) completions > (model) completion_choice > (schema) > (property) text>)
[](<#(resource) completions > (model) completion_choice > (schema)>)
class CompletionUsage:
Usage statistics for the completion request.
long completionTokens
Number of tokens in the generated completion.
[](<#(resource) completions > (model) completion_usage > (schema) > (property) completion_tokens>)
long promptTokens
Number of tokens in the prompt.
[](<#(resource) completions > (model) completion_usage > (schema) > (property) prompt_tokens>)
long totalTokens
Total number of tokens used in the request (prompt + completion).
[](<#(resource) completions > (model) completion_usage > (schema) > (property) total_tokens>)
Optional\<CompletionTokensDetails\> completionTokensDetails
Breakdown of tokens used in a completion.
Optional\<Long\> acceptedPredictionTokens
When using Predicted Outputs, the number of tokens in the
prediction that appeared in the completion.
[](<#(resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details > (property) accepted_prediction_tokens>)
Optional\<Long\> audioTokens
Audio input tokens generated by the model.
[](<#(resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details > (property) audio_tokens>)
Optional\<Long\> reasoningTokens
Tokens generated by the model for reasoning.
[](<#(resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details > (property) reasoning_tokens>)
Optional\<Long\> rejectedPredictionTokens
When using Predicted Outputs, the number of tokens in the
prediction that did not appear in the completion. However, like
reasoning tokens, these tokens are still counted in the total
completion tokens for purposes of billing, output, and context window
limits.
[](<#(resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details > (property) rejected_prediction_tokens>)
[](<#(resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details>)
Optional\<PromptTokensDetails\> promptTokensDetails
Breakdown of tokens used in the prompt.
Optional\<Long\> audioTokens
Audio input tokens present in the prompt.
[](<#(resource) completions > (model) completion_usage > (schema) > (property) prompt_tokens_details > (property) audio_tokens>)
Optional\<Long\> cachedTokens
Cached tokens present in the prompt.
[](<#(resource) completions > (model) completion_usage > (schema) > (property) prompt_tokens_details > (property) cached_tokens>)
[](<#(resource) completions > (model) completion_usage > (schema) > (property) prompt_tokens_details>)
[](<#(resource) completions > (model) completion_usage > (schema)>)