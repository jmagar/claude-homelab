Create completion | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Completions](/api/reference/typescript/resources/completions)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create completion
client.completions.create(CompletionCreateParamsbody, RequestOptionsoptions?): [Completion](</api/reference/typescript/resources/completions#(resource) completions > (model) completion > (schema)>) { id, choices, created, 4 more } | Stream\<[Completion](</api/reference/typescript/resources/completions#(resource) completions > (model) completion > (schema)>) { id, choices, created, 4 more } \>
POST/completions
Creates a completion for the provided prompt and parameters.
Returns a completion object, or a sequence of completion objects if the request is streamed.
##### ParametersExpand Collapse
CompletionCreateParams = CompletionCreateParamsNonStreaming { stream } | CompletionCreateParamsStreaming { stream }
CompletionCreateParamsBase { model, prompt, best\_of, 15 more }
model: (string & {}) | "gpt-3.5-turbo-instruct" | "davinci-002" | "babbage-002"
ID of the model to use. You can use the [List models](https://platform.openai.com/docs/api-reference/models/list) API to see all of your available models, or see our [Model overview](https://platform.openai.com/docs/models) for descriptions of them.
One of the following:
(string & {})
[](<#(resource) completions > (method) create > (params) default.non_streaming > (param) model > (schema) > (variant) 0>)
"gpt-3.5-turbo-instruct" | "davinci-002" | "babbage-002"
"gpt-3.5-turbo-instruct"
[](<#(resource) completions > (method) create > (params) default.non_streaming > (param) model > (schema) > (variant) 1 > (member) 0>)
"davinci-002"
[](<#(resource) completions > (method) create > (params) default.non_streaming > (param) model > (schema) > (variant) 1 > (member) 1>)
"babbage-002"
[](<#(resource) completions > (method) create > (params) default.non_streaming > (param) model > (schema) > (variant) 1 > (member) 2>)
[](<#(resource) completions > (method) create > (params) default.non_streaming > (param) model > (schema) > (variant) 1>)
[](<#(resource) completions > (method) create > (params) default.non_streaming > (param) model>)
prompt: string | Array\<string\> | Array\<number\> | Array\<Array\<number\>\> | null
The prompt(s) to generate completions for, encoded as a string, array of strings, array of tokens, or array of token arrays.
Note that \<|endoftext|\> is the document separator that the model sees during training, so if a prompt is not specified the model will generate as if from the beginning of a new document.
One of the following:
string
[](<#(resource) completions > (method) create > (params) default.non_streaming > (param) prompt > (schema) > (variant) 0>)
Array\<string\>
[](<#(resource) completions > (method) create > (params) default.non_streaming > (param) prompt > (schema) > (variant) 1>)
Array\<number\>
[](<#(resource) completions > (method) create > (params) default.non_streaming > (param) prompt > (schema) > (variant) 2>)
Array\<Array\<number\>\>
[](<#(resource) completions > (method) create > (params) default.non_streaming > (param) prompt > (schema) > (variant) 3>)
[](<#(resource) completions > (method) create > (params) default.non_streaming > (param) prompt>)
best\_of?: number | null
Generates `best\_of` completions server-side and returns the “best” (the one with the highest log probability per token). Results cannot be streamed.
When used with `n`, `best\_of` controls the number of candidate completions and `n` specifies how many to return – `best\_of` must be greater than `n`.
**Note:** Because this parameter generates many completions, it can quickly consume your token quota. Use carefully and ensure that you have reasonable settings for `max\_tokens` and `stop`.
minimum0
maximum20
[](<#(resource) completions > (method) create > (params) default.non_streaming > (param) best_of>)
echo?: boolean | null
Echo back the prompt in addition to the completion
[](<#(resource) completions > (method) create > (params) default.non_streaming > (param) echo>)
frequency\_penalty?: number | null
Number between -2.0 and 2.0. Positive values penalize new tokens based on their existing frequency in the text so far, decreasing the model’s likelihood to repeat the same line verbatim.
[See more information about frequency and presence penalties.](https://platform.openai.com/docs/guides/text-generation)
minimum-2
maximum2
[](<#(resource) completions > (method) create > (params) default.non_streaming > (param) frequency_penalty>)
logit\_bias?: Record\<string, number\> | null
Modify the likelihood of specified tokens appearing in the completion.
Accepts a JSON object that maps tokens (specified by their token ID in the GPT tokenizer) to an associated bias value from -100 to 100. You can use this [tokenizer tool](/tokenizer?view=bpe) to convert text to token IDs. Mathematically, the bias is added to the logits generated by the model prior to sampling. The exact effect will vary per model, but values between -1 and 1 should decrease or increase likelihood of selection; values like -100 or 100 should result in a ban or exclusive selection of the relevant token.
As an example, you can pass `{"50256": -100}` to prevent the \<|endoftext|\> token from being generated.
[](<#(resource) completions > (method) create > (params) default.non_streaming > (param) logit_bias>)
logprobs?: number | null
Include the log probabilities on the `logprobs` most likely output tokens, as well the chosen tokens. For example, if `logprobs` is 5, the API will return a list of the 5 most likely tokens. The API will always return the `logprob` of the sampled token, so there may be up to `logprobs+1` elements in the response.
The maximum value for `logprobs` is 5.
minimum0
maximum5
[](<#(resource) completions > (method) create > (params) default.non_streaming > (param) logprobs>)
max\_tokens?: number | null
The maximum number of [tokens](/tokenizer) that can be generated in the completion.
The token count of your prompt plus `max\_tokens` cannot exceed the model’s context length. [Example Python code](https://cookbook.openai.com/examples/how_to_count_tokens_with_tiktoken) for counting tokens.
minimum0
[](<#(resource) completions > (method) create > (params) default.non_streaming > (param) max_tokens>)
n?: number | null
How many completions to generate for each prompt.
**Note:** Because this parameter generates many completions, it can quickly consume your token quota. Use carefully and ensure that you have reasonable settings for `max\_tokens` and `stop`.
minimum1
maximum128
[](<#(resource) completions > (method) create > (params) default.non_streaming > (param) n>)
presence\_penalty?: number | null
Number between -2.0 and 2.0. Positive values penalize new tokens based on whether they appear in the text so far, increasing the model’s likelihood to talk about new topics.
[See more information about frequency and presence penalties.](https://platform.openai.com/docs/guides/text-generation)
minimum-2
maximum2
[](<#(resource) completions > (method) create > (params) default.non_streaming > (param) presence_penalty>)
seed?: number | null
If specified, our system will make a best effort to sample deterministically, such that repeated requests with the same `seed` and parameters should return the same result.
Determinism is not guaranteed, and you should refer to the `system\_fingerprint` response parameter to monitor changes in the backend.
formatint64
[](<#(resource) completions > (method) create > (params) default.non_streaming > (param) seed>)
stop?: string | null | Array\<string\>
Not supported with latest reasoning models `o3` and `o4-mini`.
Up to 4 sequences where the API will stop generating further tokens. The
returned text will not contain the stop sequence.
One of the following:
string | null
[](<#(resource) completions > (method) create > (params) default.non_streaming > (param) stop > (schema) > (variant) 0>)
Array\<string\>
[](<#(resource) completions > (method) create > (params) default.non_streaming > (param) stop > (schema) > (variant) 1>)
[](<#(resource) completions > (method) create > (params) default.non_streaming > (param) stop>)
stream?: false | null
Whether to stream back partial progress. If set, tokens will be sent as data-only [server-sent events](https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events#Event_stream_format) as they become available, with the stream terminated by a `data: [DONE]` message. [Example Python code](https://cookbook.openai.com/examples/how_to_stream_completions).
[](<#(resource) completions > (method) create > (params) default.non_streaming > (param) stream>)
stream\_options?: [ChatCompletionStreamOptions](</api/reference/typescript/resources/chat#(resource) chat.completions > (model) chat_completion_stream_options > (schema)>) { include\_obfuscation, include\_usage } | null
Options for streaming response. Only set this when you set `stream: true`.
include\_obfuscation?: boolean
When true, stream obfuscation will be enabled. Stream obfuscation adds
random characters to an `obfuscation` field on streaming delta events to
normalize payload sizes as a mitigation to certain side-channel attacks.
These obfuscation fields are included by default, but add a small amount
of overhead to the data stream. You can set `include\_obfuscation` to
false to optimize for bandwidth if you trust the network links between
your application and the OpenAI API.
[](<#(resource) completions > (method) create > (params) default.non_streaming > (param) stream_options + (resource) chat.completions > (model) chat_completion_stream_options > (schema) > (property) include_obfuscation>)
include\_usage?: boolean
If set, an additional chunk will be streamed before the `data: [DONE]`
message. The `usage` field on this chunk shows the token usage statistics
for the entire request, and the `choices` field will always be an empty
array.
All other chunks will also include a `usage` field, but with a null
value. **NOTE:** If the stream is interrupted, you may not receive the
final usage chunk which contains the total token usage for the request.
[](<#(resource) completions > (method) create > (params) default.non_streaming > (param) stream_options + (resource) chat.completions > (model) chat_completion_stream_options > (schema) > (property) include_usage>)
[](<#(resource) completions > (method) create > (params) default.non_streaming > (param) stream_options>)
suffix?: string | null
The suffix that comes after a completion of inserted text.
This parameter is only supported for `gpt-3.5-turbo-instruct`.
[](<#(resource) completions > (method) create > (params) default.non_streaming > (param) suffix>)
temperature?: number | null
What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
We generally recommend altering this or `top\_p` but not both.
minimum0
maximum2
[](<#(resource) completions > (method) create > (params) default.non_streaming > (param) temperature>)
top\_p?: number | null
An alternative to sampling with temperature, called nucleus sampling, where the model considers the results of the tokens with top\_p probability mass. So 0.1 means only the tokens comprising the top 10% probability mass are considered.
We generally recommend altering this or `temperature` but not both.
minimum0
maximum1
[](<#(resource) completions > (method) create > (params) default.non_streaming > (param) top_p>)
user?: string
A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](https://platform.openai.com/docs/guides/safety-best-practices#end-user-ids).
[](<#(resource) completions > (method) create > (params) default.non_streaming > (param) user>)
[](<#(resource) completions > (method) create.typescript.base_params>)
CompletionCreateParamsNonStreaming extends CompletionCreateParamsBase { model, prompt, best\_of, 15 more } { stream }
stream?: false | null
Whether to stream back partial progress. If set, tokens will be sent as data-only [server-sent events](https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events#Event_stream_format) as they become available, with the stream terminated by a `data: [DONE]` message. [Example Python code](https://cookbook.openai.com/examples/how_to_stream_completions).
[](<#(resource) completions > (method) create > (params) default.non_streaming > (param) stream>)
[](<#(resource) completions > (method) create > (params) default.non_streaming>)
CompletionCreateParamsStreaming extends CompletionCreateParamsBase { model, prompt, best\_of, 15 more } { stream }
stream: true
Whether to stream back partial progress. If set, tokens will be sent as data-only [server-sent events](https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events#Event_stream_format) as they become available, with the stream terminated by a `data: [DONE]` message. [Example Python code](https://cookbook.openai.com/examples/how_to_stream_completions).
[](<#(resource) completions > (method) create > (params) default.streaming > (param) stream>)
[](<#(resource) completions > (method) create > (params) default.streaming>)
[](<#(resource) completions > (method) create.typescript.params>)
##### ReturnsExpand Collapse
Completion { id, choices, created, 4 more }
Represents a completion response from the API. Note: both the streamed and non-streamed response objects share the same shape (unlike the chat endpoint).
id: string
A unique identifier for the completion.
[](<#(resource) completions > (model) completion > (schema) > (property) id>)
choices: Array\<[CompletionChoice](</api/reference/typescript/resources/completions#(resource) completions > (model) completion_choice > (schema)>) { finish\_reason, index, logprobs, text } \>
The list of completion choices the model generated for the input prompt.
finish\_reason: "stop" | "length" | "content\_filter"
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
index: number
[](<#(resource) completions > (model) completion_choice > (schema) > (property) index>)
logprobs: Logprobs | null
text\_offset?: Array\<number\>
[](<#(resource) completions > (model) completion_choice > (schema) > (property) logprobs > (property) text_offset>)
token\_logprobs?: Array\<number\>
[](<#(resource) completions > (model) completion_choice > (schema) > (property) logprobs > (property) token_logprobs>)
tokens?: Array\<string\>
[](<#(resource) completions > (model) completion_choice > (schema) > (property) logprobs > (property) tokens>)
top\_logprobs?: Array\<Record\<string, number\>\>
[](<#(resource) completions > (model) completion_choice > (schema) > (property) logprobs > (property) top_logprobs>)
[](<#(resource) completions > (model) completion_choice > (schema) > (property) logprobs>)
text: string
[](<#(resource) completions > (model) completion_choice > (schema) > (property) text>)
[](<#(resource) completions > (model) completion > (schema) > (property) choices>)
created: number
The Unix timestamp (in seconds) of when the completion was created.
formatunixtime
[](<#(resource) completions > (model) completion > (schema) > (property) created>)
model: string
The model used for completion.
[](<#(resource) completions > (model) completion > (schema) > (property) model>)
object: "text\_completion"
The object type, which is always “text\_completion”
[](<#(resource) completions > (model) completion > (schema) > (property) object>)
system\_fingerprint?: string
This fingerprint represents the backend configuration that the model runs with.
Can be used in conjunction with the `seed` request parameter to understand when backend changes have been made that might impact determinism.
[](<#(resource) completions > (model) completion > (schema) > (property) system_fingerprint>)
usage?: [CompletionUsage](</api/reference/typescript/resources/completions#(resource) completions > (model) completion_usage > (schema)>) { completion\_tokens, prompt\_tokens, total\_tokens, 2 more }
Usage statistics for the completion request.
completion\_tokens: number
Number of tokens in the generated completion.
[](<#(resource) completions > (model) completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) completion_tokens>)
prompt\_tokens: number
Number of tokens in the prompt.
[](<#(resource) completions > (model) completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) prompt_tokens>)
total\_tokens: number
Total number of tokens used in the request (prompt + completion).
[](<#(resource) completions > (model) completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) total_tokens>)
completion\_tokens\_details?: CompletionTokensDetails { accepted\_prediction\_tokens, audio\_tokens, reasoning\_tokens, rejected\_prediction\_tokens }
Breakdown of tokens used in a completion.
accepted\_prediction\_tokens?: number
When using Predicted Outputs, the number of tokens in the
prediction that appeared in the completion.
[](<#(resource) completions > (model) completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details > (property) accepted_prediction_tokens>)
audio\_tokens?: number
Audio input tokens generated by the model.
[](<#(resource) completions > (model) completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details > (property) audio_tokens>)
reasoning\_tokens?: number
Tokens generated by the model for reasoning.
[](<#(resource) completions > (model) completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details > (property) reasoning_tokens>)
rejected\_prediction\_tokens?: number
When using Predicted Outputs, the number of tokens in the
prediction that did not appear in the completion. However, like
reasoning tokens, these tokens are still counted in the total
completion tokens for purposes of billing, output, and context window
limits.
[](<#(resource) completions > (model) completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details > (property) rejected_prediction_tokens>)
[](<#(resource) completions > (model) completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details>)
prompt\_tokens\_details?: PromptTokensDetails { audio\_tokens, cached\_tokens }
Breakdown of tokens used in the prompt.
audio\_tokens?: number
Audio input tokens present in the prompt.
[](<#(resource) completions > (model) completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) prompt_tokens_details > (property) audio_tokens>)
cached\_tokens?: number
Cached tokens present in the prompt.
[](<#(resource) completions > (model) completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) prompt_tokens_details > (property) cached_tokens>)
[](<#(resource) completions > (model) completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) prompt_tokens_details>)
[](<#(resource) completions > (model) completion > (schema) > (property) usage>)
[](<#(resource) completions > (model) completion > (schema)>)
Completion { id, choices, created, 4 more }
Represents a completion response from the API. Note: both the streamed and non-streamed response objects share the same shape (unlike the chat endpoint).
id: string
A unique identifier for the completion.
[](<#(resource) completions > (model) completion > (schema) > (property) id>)
choices: Array\<[CompletionChoice](</api/reference/typescript/resources/completions#(resource) completions > (model) completion_choice > (schema)>) { finish\_reason, index, logprobs, text } \>
The list of completion choices the model generated for the input prompt.
finish\_reason: "stop" | "length" | "content\_filter"
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
index: number
[](<#(resource) completions > (model) completion_choice > (schema) > (property) index>)
logprobs: Logprobs | null
text\_offset?: Array\<number\>
[](<#(resource) completions > (model) completion_choice > (schema) > (property) logprobs > (property) text_offset>)
token\_logprobs?: Array\<number\>
[](<#(resource) completions > (model) completion_choice > (schema) > (property) logprobs > (property) token_logprobs>)
tokens?: Array\<string\>
[](<#(resource) completions > (model) completion_choice > (schema) > (property) logprobs > (property) tokens>)
top\_logprobs?: Array\<Record\<string, number\>\>
[](<#(resource) completions > (model) completion_choice > (schema) > (property) logprobs > (property) top_logprobs>)
[](<#(resource) completions > (model) completion_choice > (schema) > (property) logprobs>)
text: string
[](<#(resource) completions > (model) completion_choice > (schema) > (property) text>)
[](<#(resource) completions > (model) completion > (schema) > (property) choices>)
created: number
The Unix timestamp (in seconds) of when the completion was created.
formatunixtime
[](<#(resource) completions > (model) completion > (schema) > (property) created>)
model: string
The model used for completion.
[](<#(resource) completions > (model) completion > (schema) > (property) model>)
object: "text\_completion"
The object type, which is always “text\_completion”
[](<#(resource) completions > (model) completion > (schema) > (property) object>)
system\_fingerprint?: string
This fingerprint represents the backend configuration that the model runs with.
Can be used in conjunction with the `seed` request parameter to understand when backend changes have been made that might impact determinism.
[](<#(resource) completions > (model) completion > (schema) > (property) system_fingerprint>)
usage?: [CompletionUsage](</api/reference/typescript/resources/completions#(resource) completions > (model) completion_usage > (schema)>) { completion\_tokens, prompt\_tokens, total\_tokens, 2 more }
Usage statistics for the completion request.
completion\_tokens: number
Number of tokens in the generated completion.
[](<#(resource) completions > (model) completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) completion_tokens>)
prompt\_tokens: number
Number of tokens in the prompt.
[](<#(resource) completions > (model) completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) prompt_tokens>)
total\_tokens: number
Total number of tokens used in the request (prompt + completion).
[](<#(resource) completions > (model) completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) total_tokens>)
completion\_tokens\_details?: CompletionTokensDetails { accepted\_prediction\_tokens, audio\_tokens, reasoning\_tokens, rejected\_prediction\_tokens }
Breakdown of tokens used in a completion.
accepted\_prediction\_tokens?: number
When using Predicted Outputs, the number of tokens in the
prediction that appeared in the completion.
[](<#(resource) completions > (model) completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details > (property) accepted_prediction_tokens>)
audio\_tokens?: number
Audio input tokens generated by the model.
[](<#(resource) completions > (model) completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details > (property) audio_tokens>)
reasoning\_tokens?: number
Tokens generated by the model for reasoning.
[](<#(resource) completions > (model) completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details > (property) reasoning_tokens>)
rejected\_prediction\_tokens?: number
When using Predicted Outputs, the number of tokens in the
prediction that did not appear in the completion. However, like
reasoning tokens, these tokens are still counted in the total
completion tokens for purposes of billing, output, and context window
limits.
[](<#(resource) completions > (model) completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details > (property) rejected_prediction_tokens>)
[](<#(resource) completions > (model) completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details>)
prompt\_tokens\_details?: PromptTokensDetails { audio\_tokens, cached\_tokens }
Breakdown of tokens used in the prompt.
audio\_tokens?: number
Audio input tokens present in the prompt.
[](<#(resource) completions > (model) completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) prompt_tokens_details > (property) audio_tokens>)
cached\_tokens?: number
Cached tokens present in the prompt.
[](<#(resource) completions > (model) completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) prompt_tokens_details > (property) cached_tokens>)
[](<#(resource) completions > (model) completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) prompt_tokens_details>)
[](<#(resource) completions > (model) completion > (schema) > (property) usage>)
[](<#(resource) completions > (model) completion > (schema)>)
No streamingStreaming
### Create completion
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
`import OpenAI from "openai";
const openai = new OpenAI();
async function main() {
const completion = await openai.completions.create({
model: "VAR\_completion\_model\_id",
prompt: "Say this is a test.",
max\_tokens: 7,
temperature: 0,
});
console.log(completion);
}
main();`
```
```
`{
"id": "cmpl-uqkvlQyYK7bGYrRHQ0eXlWi7",
"object": "text\_completion",
"created": 1589478378,
"model": "VAR\_completion\_model\_id",
"system\_fingerprint": "fp\_44709d6fcb",
"choices": [
{
"text": "\\n\\nThis is indeed a test",
"index": 0,
"logprobs": null,
"finish\_reason": "length"
}
],
"usage": {
"prompt\_tokens": 5,
"completion\_tokens": 7,
"total\_tokens": 12
}
}
`
```
### Create completion
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
`import OpenAI from "openai";
const openai = new OpenAI();
async function main() {
const stream = await openai.completions.create({
model: "VAR\_completion\_model\_id",
prompt: "Say this is a test.",
stream: true,
});
for await (const chunk of stream) {
console.log(chunk.choices[0].text)
}
}
main();`
```
```
`{
"id": "cmpl-7iA7iJjj8V2zOkCGvWF2hAkDWBQZe",
"object": "text\_completion",
"created": 1690759702,
"choices": [
{
"text": "This",
"index": 0,
"logprobs": null,
"finish\_reason": null
}
],
"model": "gpt-3.5-turbo-instruct"
"system\_fingerprint": "fp\_44709d6fcb",
}
`
```
##### Returns Examples
200 example
```
`{
"id": "id",
"choices": [
{
"finish\_reason": "stop",
"index": 0,
"logprobs": {
"text\_offset": [
0
],
"token\_logprobs": [
0
],
"tokens": [
"string"
],
"top\_logprobs": [
{
"foo": 0
}
]
},
"text": "text"
}
],
"created": 0,
"model": "model",
"object": "text\_completion",
"system\_fingerprint": "system\_fingerprint",
"usage": {
"completion\_tokens": 0,
"prompt\_tokens": 0,
"total\_tokens": 0,
"completion\_tokens\_details": {
"accepted\_prediction\_tokens": 0,
"audio\_tokens": 0,
"reasoning\_tokens": 0,
"rejected\_prediction\_tokens": 0
},
"prompt\_tokens\_details": {
"audio\_tokens": 0,
"cached\_tokens": 0
}
}
}`
```