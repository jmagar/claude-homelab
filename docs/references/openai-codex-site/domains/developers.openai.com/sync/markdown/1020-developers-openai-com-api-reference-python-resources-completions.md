Completions | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Completions
Given a prompt, the model will return one or more predicted completions, and can also return the probabilities of alternative tokens at each position.
##### [Create completion](/api/reference/python/resources/completions/methods/create)
completions.create(CompletionCreateParams\*\*kwargs) -\> [Completion](</api/reference/python/resources/completions#(resource) completions > (model) completion > (schema)>)
POST/completions
##### ModelsExpand Collapse
class Completion: …
Represents a completion response from the API. Note: both the streamed and non-streamed response objects share the same shape (unlike the chat endpoint).
id: str
A unique identifier for the completion.
[](<#(resource) completions > (model) completion > (schema) > (property) id>)
choices: List[[CompletionChoice](</api/reference/python/resources/completions#(resource) completions > (model) completion_choice > (schema)>)]
The list of completion choices the model generated for the input prompt.
finish\_reason: Literal["stop", "length", "content\_filter"]
The reason the model stopped generating tokens. This will be `stop` if the model hit a natural stop point or a provided stop sequence,
`length` if the maximum number of tokens specified in the request was reached,
or `content\_filter` if content was omitted due to a flag from our content filters.
One of the following:
"stop"
[](<#(resource) completions > (model) completion_choice > (schema) > (property) finish_reason > (member) 0>)
"length"
[](<#(resource) completions > (model) completion_choice > (schema) > (property) finish_reason > (member) 1>)
"content\_filter"
[](<#(resource) completions > (model) completion_choice > (schema) > (property) finish_reason > (member) 2>)
[](<#(resource) completions > (model) completion_choice > (schema) > (property) finish_reason>)
index: int
[](<#(resource) completions > (model) completion_choice > (schema) > (property) index>)
logprobs: Optional[Logprobs]
text\_offset: Optional[List[int]]
[](<#(resource) completions > (model) completion_choice > (schema) > (property) logprobs > (property) text_offset>)
token\_logprobs: Optional[List[float]]
[](<#(resource) completions > (model) completion_choice > (schema) > (property) logprobs > (property) token_logprobs>)
tokens: Optional[List[str]]
[](<#(resource) completions > (model) completion_choice > (schema) > (property) logprobs > (property) tokens>)
top\_logprobs: Optional[List[Dict[str, float]]]
[](<#(resource) completions > (model) completion_choice > (schema) > (property) logprobs > (property) top_logprobs>)
[](<#(resource) completions > (model) completion_choice > (schema) > (property) logprobs>)
text: str
[](<#(resource) completions > (model) completion_choice > (schema) > (property) text>)
[](<#(resource) completions > (model) completion > (schema) > (property) choices>)
created: int
The Unix timestamp (in seconds) of when the completion was created.
formatunixtime
[](<#(resource) completions > (model) completion > (schema) > (property) created>)
model: str
The model used for completion.
[](<#(resource) completions > (model) completion > (schema) > (property) model>)
object: Literal["text\_completion"]
The object type, which is always “text\_completion”
[](<#(resource) completions > (model) completion > (schema) > (property) object>)
system\_fingerprint: Optional[str]
This fingerprint represents the backend configuration that the model runs with.
Can be used in conjunction with the `seed` request parameter to understand when backend changes have been made that might impact determinism.
[](<#(resource) completions > (model) completion > (schema) > (property) system_fingerprint>)
usage: Optional[CompletionUsage]
Usage statistics for the completion request.
[](<#(resource) completions > (model) completion > (schema) > (property) usage>)
[](<#(resource) completions > (model) completion > (schema)>)
class CompletionChoice: …
finish\_reason: Literal["stop", "length", "content\_filter"]
The reason the model stopped generating tokens. This will be `stop` if the model hit a natural stop point or a provided stop sequence,
`length` if the maximum number of tokens specified in the request was reached,
or `content\_filter` if content was omitted due to a flag from our content filters.
One of the following:
"stop"
[](<#(resource) completions > (model) completion_choice > (schema) > (property) finish_reason > (member) 0>)
"length"
[](<#(resource) completions > (model) completion_choice > (schema) > (property) finish_reason > (member) 1>)
"content\_filter"
[](<#(resource) completions > (model) completion_choice > (schema) > (property) finish_reason > (member) 2>)
[](<#(resource) completions > (model) completion_choice > (schema) > (property) finish_reason>)
index: int
[](<#(resource) completions > (model) completion_choice > (schema) > (property) index>)
logprobs: Optional[Logprobs]
text\_offset: Optional[List[int]]
[](<#(resource) completions > (model) completion_choice > (schema) > (property) logprobs > (property) text_offset>)
token\_logprobs: Optional[List[float]]
[](<#(resource) completions > (model) completion_choice > (schema) > (property) logprobs > (property) token_logprobs>)
tokens: Optional[List[str]]
[](<#(resource) completions > (model) completion_choice > (schema) > (property) logprobs > (property) tokens>)
top\_logprobs: Optional[List[Dict[str, float]]]
[](<#(resource) completions > (model) completion_choice > (schema) > (property) logprobs > (property) top_logprobs>)
[](<#(resource) completions > (model) completion_choice > (schema) > (property) logprobs>)
text: str
[](<#(resource) completions > (model) completion_choice > (schema) > (property) text>)
[](<#(resource) completions > (model) completion_choice > (schema)>)
class CompletionUsage: …
Usage statistics for the completion request.
completion\_tokens: int
Number of tokens in the generated completion.
[](<#(resource) completions > (model) completion_usage > (schema) > (property) completion_tokens>)
prompt\_tokens: int
Number of tokens in the prompt.
[](<#(resource) completions > (model) completion_usage > (schema) > (property) prompt_tokens>)
total\_tokens: int
Total number of tokens used in the request (prompt + completion).
[](<#(resource) completions > (model) completion_usage > (schema) > (property) total_tokens>)
completion\_tokens\_details: Optional[CompletionTokensDetails]
Breakdown of tokens used in a completion.
accepted\_prediction\_tokens: Optional[int]
When using Predicted Outputs, the number of tokens in the
prediction that appeared in the completion.
[](<#(resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details > (property) accepted_prediction_tokens>)
audio\_tokens: Optional[int]
Audio input tokens generated by the model.
[](<#(resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details > (property) audio_tokens>)
reasoning\_tokens: Optional[int]
Tokens generated by the model for reasoning.
[](<#(resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details > (property) reasoning_tokens>)
rejected\_prediction\_tokens: Optional[int]
When using Predicted Outputs, the number of tokens in the
prediction that did not appear in the completion. However, like
reasoning tokens, these tokens are still counted in the total
completion tokens for purposes of billing, output, and context window
limits.
[](<#(resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details > (property) rejected_prediction_tokens>)
[](<#(resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details>)
prompt\_tokens\_details: Optional[PromptTokensDetails]
Breakdown of tokens used in the prompt.
audio\_tokens: Optional[int]
Audio input tokens present in the prompt.
[](<#(resource) completions > (model) completion_usage > (schema) > (property) prompt_tokens_details > (property) audio_tokens>)
cached\_tokens: Optional[int]
Cached tokens present in the prompt.
[](<#(resource) completions > (model) completion_usage > (schema) > (property) prompt_tokens_details > (property) cached_tokens>)
[](<#(resource) completions > (model) completion_usage > (schema) > (property) prompt_tokens_details>)
[](<#(resource) completions > (model) completion_usage > (schema)>)