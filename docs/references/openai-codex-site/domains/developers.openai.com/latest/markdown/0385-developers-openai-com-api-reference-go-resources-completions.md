Completions | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Completions
Given a prompt, the model will return one or more predicted completions, and can also return the probabilities of alternative tokens at each position.
##### [Create completion](/api/reference/go/resources/completions/methods/create)
client.Completions.New(ctx, body) (\*[Completion](</api/reference/go/resources/completions#(resource) completions > (model) completion > (schema)>), error)
POST/completions
##### ModelsExpand Collapse
type Completion struct{…}
Represents a completion response from the API. Note: both the streamed and non-streamed response objects share the same shape (unlike the chat endpoint).
ID string
A unique identifier for the completion.
[](<#(resource) completions > (model) completion > (schema) > (property) id>)
Choices [][CompletionChoice](</api/reference/go/resources/completions#(resource) completions > (model) completion_choice > (schema)>)
The list of completion choices the model generated for the input prompt.
FinishReason CompletionChoiceFinishReason
The reason the model stopped generating tokens. This will be `stop` if the model hit a natural stop point or a provided stop sequence,
`length` if the maximum number of tokens specified in the request was reached,
or `content\_filter` if content was omitted due to a flag from our content filters.
One of the following:
const CompletionChoiceFinishReasonStop CompletionChoiceFinishReason = "stop"
[](<#(resource) completions > (model) completion_choice > (schema) > (property) finish_reason > (member) 0>)
const CompletionChoiceFinishReasonLength CompletionChoiceFinishReason = "length"
[](<#(resource) completions > (model) completion_choice > (schema) > (property) finish_reason > (member) 1>)
const CompletionChoiceFinishReasonContentFilter CompletionChoiceFinishReason = "content\_filter"
[](<#(resource) completions > (model) completion_choice > (schema) > (property) finish_reason > (member) 2>)
[](<#(resource) completions > (model) completion_choice > (schema) > (property) finish_reason>)
Index int64
[](<#(resource) completions > (model) completion_choice > (schema) > (property) index>)
Logprobs CompletionChoiceLogprobs
TextOffset []int64Optional
[](<#(resource) completions > (model) completion_choice > (schema) > (property) logprobs > (property) text_offset>)
TokenLogprobs []float64Optional
[](<#(resource) completions > (model) completion_choice > (schema) > (property) logprobs > (property) token_logprobs>)
Tokens []stringOptional
[](<#(resource) completions > (model) completion_choice > (schema) > (property) logprobs > (property) tokens>)
TopLogprobs []map[string, float64]Optional
[](<#(resource) completions > (model) completion_choice > (schema) > (property) logprobs > (property) top_logprobs>)
[](<#(resource) completions > (model) completion_choice > (schema) > (property) logprobs>)
Text string
[](<#(resource) completions > (model) completion_choice > (schema) > (property) text>)
[](<#(resource) completions > (model) completion > (schema) > (property) choices>)
Created int64
The Unix timestamp (in seconds) of when the completion was created.
formatunixtime
[](<#(resource) completions > (model) completion > (schema) > (property) created>)
Model string
The model used for completion.
[](<#(resource) completions > (model) completion > (schema) > (property) model>)
Object TextCompletion
The object type, which is always “text\_completion”
[](<#(resource) completions > (model) completion > (schema) > (property) object>)
SystemFingerprint stringOptional
This fingerprint represents the backend configuration that the model runs with.
Can be used in conjunction with the `seed` request parameter to understand when backend changes have been made that might impact determinism.
[](<#(resource) completions > (model) completion > (schema) > (property) system_fingerprint>)
Usage [CompletionUsage](</api/reference/go/resources/completions#(resource) completions > (model) completion_usage > (schema)>)Optional
Usage statistics for the completion request.
[](<#(resource) completions > (model) completion > (schema) > (property) usage>)
[](<#(resource) completions > (model) completion > (schema)>)
type CompletionChoice struct{…}
FinishReason CompletionChoiceFinishReason
The reason the model stopped generating tokens. This will be `stop` if the model hit a natural stop point or a provided stop sequence,
`length` if the maximum number of tokens specified in the request was reached,
or `content\_filter` if content was omitted due to a flag from our content filters.
One of the following:
const CompletionChoiceFinishReasonStop CompletionChoiceFinishReason = "stop"
[](<#(resource) completions > (model) completion_choice > (schema) > (property) finish_reason > (member) 0>)
const CompletionChoiceFinishReasonLength CompletionChoiceFinishReason = "length"
[](<#(resource) completions > (model) completion_choice > (schema) > (property) finish_reason > (member) 1>)
const CompletionChoiceFinishReasonContentFilter CompletionChoiceFinishReason = "content\_filter"
[](<#(resource) completions > (model) completion_choice > (schema) > (property) finish_reason > (member) 2>)
[](<#(resource) completions > (model) completion_choice > (schema) > (property) finish_reason>)
Index int64
[](<#(resource) completions > (model) completion_choice > (schema) > (property) index>)
Logprobs CompletionChoiceLogprobs
TextOffset []int64Optional
[](<#(resource) completions > (model) completion_choice > (schema) > (property) logprobs > (property) text_offset>)
TokenLogprobs []float64Optional
[](<#(resource) completions > (model) completion_choice > (schema) > (property) logprobs > (property) token_logprobs>)
Tokens []stringOptional
[](<#(resource) completions > (model) completion_choice > (schema) > (property) logprobs > (property) tokens>)
TopLogprobs []map[string, float64]Optional
[](<#(resource) completions > (model) completion_choice > (schema) > (property) logprobs > (property) top_logprobs>)
[](<#(resource) completions > (model) completion_choice > (schema) > (property) logprobs>)
Text string
[](<#(resource) completions > (model) completion_choice > (schema) > (property) text>)
[](<#(resource) completions > (model) completion_choice > (schema)>)
type CompletionUsage struct{…}
Usage statistics for the completion request.
CompletionTokens int64
Number of tokens in the generated completion.
[](<#(resource) completions > (model) completion_usage > (schema) > (property) completion_tokens>)
PromptTokens int64
Number of tokens in the prompt.
[](<#(resource) completions > (model) completion_usage > (schema) > (property) prompt_tokens>)
TotalTokens int64
Total number of tokens used in the request (prompt + completion).
[](<#(resource) completions > (model) completion_usage > (schema) > (property) total_tokens>)
CompletionTokensDetails CompletionUsageCompletionTokensDetailsOptional
Breakdown of tokens used in a completion.
AcceptedPredictionTokens int64Optional
When using Predicted Outputs, the number of tokens in the
prediction that appeared in the completion.
[](<#(resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details > (property) accepted_prediction_tokens>)
AudioTokens int64Optional
Audio input tokens generated by the model.
[](<#(resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details > (property) audio_tokens>)
ReasoningTokens int64Optional
Tokens generated by the model for reasoning.
[](<#(resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details > (property) reasoning_tokens>)
RejectedPredictionTokens int64Optional
When using Predicted Outputs, the number of tokens in the
prediction that did not appear in the completion. However, like
reasoning tokens, these tokens are still counted in the total
completion tokens for purposes of billing, output, and context window
limits.
[](<#(resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details > (property) rejected_prediction_tokens>)
[](<#(resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details>)
PromptTokensDetails CompletionUsagePromptTokensDetailsOptional
Breakdown of tokens used in the prompt.
AudioTokens int64Optional
Audio input tokens present in the prompt.
[](<#(resource) completions > (model) completion_usage > (schema) > (property) prompt_tokens_details > (property) audio_tokens>)
CachedTokens int64Optional
Cached tokens present in the prompt.
[](<#(resource) completions > (model) completion_usage > (schema) > (property) prompt_tokens_details > (property) cached_tokens>)
[](<#(resource) completions > (model) completion_usage > (schema) > (property) prompt_tokens_details>)
[](<#(resource) completions > (model) completion_usage > (schema)>)