List Chat Completions | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Chat](/api/reference/typescript/resources/chat)
[Completions](/api/reference/typescript/resources/chat/subresources/completions)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List Chat Completions
client.chat.completions.list(ChatCompletionListParams { after, limit, metadata, 2 more } query?, RequestOptionsoptions?): CursorPage\<[ChatCompletion](</api/reference/typescript/resources/chat#(resource) chat.completions > (model) chat_completion > (schema)>) { id, choices, created, 5 more } \>
GET/chat/completions
List stored Chat Completions. Only Chat Completions that have been stored
with the `store` parameter set to `true` will be returned.
##### ParametersExpand Collapse
query: ChatCompletionListParams { after, limit, metadata, 2 more }
after?: string
Identifier for the last chat completion from the previous pagination request.
[](<#(resource) chat.completions > (method) list > (params) default > (param) after>)
limit?: number
Number of Chat Completions to retrieve.
[](<#(resource) chat.completions > (method) list > (params) default > (param) limit>)
metadata?: [Metadata](</api/reference/typescript/resources/$shared#(resource) $shared > (model) metadata > (schema)>) | null
A list of metadata keys to filter the Chat Completions by. Example:
`metadata[key1]=value1&metadata[key2]=value2`
[](<#(resource) chat.completions > (method) list > (params) default > (param) metadata>)
model?: string
The model used to generate the Chat Completions.
[](<#(resource) chat.completions > (method) list > (params) default > (param) model>)
order?: "asc" | "desc"
Sort order for Chat Completions by timestamp. Use `asc` for ascending order or `desc` for descending order. Defaults to `asc`.
One of the following:
"asc"
[](<#(resource) chat.completions > (method) list > (params) default > (param) order > (schema) > (member) 0>)
"desc"
[](<#(resource) chat.completions > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) chat.completions > (method) list > (params) default > (param) order>)
[](<#(resource) chat.completions > (method) list > (params) default>)
##### ReturnsExpand Collapse
ChatCompletion { id, choices, created, 5 more }
Represents a chat completion response returned by model, based on the provided input.
id: string
A unique identifier for the chat completion.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) id>)
choices: Array\<Choice\>
A list of chat completion choices. Can be more than one if `n` is greater than 1.
finish\_reason: "stop" | "length" | "tool\_calls" | 2 more
The reason the model stopped generating tokens. This will be `stop` if the model hit a natural stop point or a provided stop sequence,
`length` if the maximum number of tokens specified in the request was reached,
`content\_filter` if content was omitted due to a flag from our content filters,
`tool\_calls` if the model called a tool, or `function\_call` (deprecated) if the model called a function.
One of the following:
"stop"
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) finish_reason > (member) 0>)
"length"
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) finish_reason > (member) 1>)
"tool\_calls"
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) finish_reason > (member) 2>)
"content\_filter"
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) finish_reason > (member) 3>)
"function\_call"
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) finish_reason > (member) 4>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) finish_reason>)
index: number
The index of the choice in the list of choices.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) index>)
logprobs: Logprobs | null
Log probability information for the choice.
content: Array\<[ChatCompletionTokenLogprob](</api/reference/typescript/resources/chat#(resource) chat.completions > (model) chat_completion_token_logprob > (schema)>) { token, bytes, logprob, top\_logprobs } \> | null
A list of message content tokens with log probability information.
token: string
The token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) token>)
bytes: Array\<number\> | null
A list of integers representing the UTF-8 bytes representation of the token. Useful in instances where characters are represented by multiple tokens and their byte representations must be combined to generate the correct text representation. Can be `null` if there is no bytes representation for the token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) bytes>)
logprob: number
The log probability of this token, if it is within the top 20 most likely tokens. Otherwise, the value `-9999.0` is used to signify that the token is very unlikely.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) logprob>)
top\_logprobs: Array\<TopLogprob\>
List of the most likely tokens and their log probability, at this token position. In rare cases, there may be fewer than the number of requested `top\_logprobs` returned.
token: string
The token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) token>)
bytes: Array\<number\> | null
A list of integers representing the UTF-8 bytes representation of the token. Useful in instances where characters are represented by multiple tokens and their byte representations must be combined to generate the correct text representation. Can be `null` if there is no bytes representation for the token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) bytes>)
logprob: number
The log probability of this token, if it is within the top 20 most likely tokens. Otherwise, the value `-9999.0` is used to signify that the token is very unlikely.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) logprob>)
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) logprobs > (property) content>)
refusal: Array\<[ChatCompletionTokenLogprob](</api/reference/typescript/resources/chat#(resource) chat.completions > (model) chat_completion_token_logprob > (schema)>) { token, bytes, logprob, top\_logprobs } \> | null
A list of message refusal tokens with log probability information.
token: string
The token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) token>)
bytes: Array\<number\> | null
A list of integers representing the UTF-8 bytes representation of the token. Useful in instances where characters are represented by multiple tokens and their byte representations must be combined to generate the correct text representation. Can be `null` if there is no bytes representation for the token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) bytes>)
logprob: number
The log probability of this token, if it is within the top 20 most likely tokens. Otherwise, the value `-9999.0` is used to signify that the token is very unlikely.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) logprob>)
top\_logprobs: Array\<TopLogprob\>
List of the most likely tokens and their log probability, at this token position. In rare cases, there may be fewer than the number of requested `top\_logprobs` returned.
token: string
The token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) token>)
bytes: Array\<number\> | null
A list of integers representing the UTF-8 bytes representation of the token. Useful in instances where characters are represented by multiple tokens and their byte representations must be combined to generate the correct text representation. Can be `null` if there is no bytes representation for the token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) bytes>)
logprob: number
The log probability of this token, if it is within the top 20 most likely tokens. Otherwise, the value `-9999.0` is used to signify that the token is very unlikely.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) logprob>)
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) logprobs > (property) refusal>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) logprobs>)
message: [ChatCompletionMessage](</api/reference/typescript/resources/chat#(resource) chat.completions > (model) chat_completion_message > (schema)>) { content, refusal, role, 4 more }
A chat completion message generated by the model.
content: string | null
The contents of the message.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) content>)
refusal: string | null
The refusal message generated by the model.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) refusal>)
role: "assistant"
The role of the author of this message.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) role>)
annotations?: Array\<Annotation\>
Annotations for the message, when applicable, as when using the
[web search tool](https://platform.openai.com/docs/guides/tools-web-search?api-mode=chat).
type: "url\_citation"
The type of the URL citation. Always `url\_citation`.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) annotations > (items) > (property) type>)
url\_citation: URLCitation { end\_index, start\_index, title, url }
A URL citation when using web search.
end\_index: number
The index of the last character of the URL citation in the message.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) annotations > (items) > (property) url_citation > (property) end_index>)
start\_index: number
The index of the first character of the URL citation in the message.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) annotations > (items) > (property) url_citation > (property) start_index>)
title: string
The title of the web resource.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) annotations > (items) > (property) url_citation > (property) title>)
url: string
The URL of the web resource.
formaturi
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) annotations > (items) > (property) url_citation > (property) url>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) annotations > (items) > (property) url_citation>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) annotations>)
audio?: [ChatCompletionAudio](</api/reference/typescript/resources/chat#(resource) chat.completions > (model) chat_completion_audio > (schema)>) { id, data, expires\_at, transcript } | null
If the audio output modality is requested, this object contains data
about the audio response from the model. [Learn more](https://platform.openai.com/docs/guides/audio).
id: string
Unique identifier for this audio response.
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) audio + (resource) chat.completions > (model) chat_completion_audio > (schema) > (property) id>)
data: string
Base64 encoded audio bytes generated by the model, in the format
specified in the request.
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) audio + (resource) chat.completions > (model) chat_completion_audio > (schema) > (property) data>)
expires\_at: number
The Unix timestamp (in seconds) for when this audio response will
no longer be accessible on the server for use in multi-turn
conversations.
formatunixtime
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) audio + (resource) chat.completions > (model) chat_completion_audio > (schema) > (property) expires_at>)
transcript: string
Transcript of the audio generated by the model.
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) audio + (resource) chat.completions > (model) chat_completion_audio > (schema) > (property) transcript>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) audio>)
Deprecatedfunction\_call?: FunctionCall { arguments, name }
Deprecated and replaced by `tool\_calls`. The name and arguments of a function that should be called, as generated by the model.
arguments: string
The arguments to call the function with, as generated by the model in JSON format. Note that the model does not always generate valid JSON, and may hallucinate parameters not defined by your function schema. Validate the arguments in your code before calling your function.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) function_call > (property) arguments>)
name: string
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) function_call > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) function_call>)
tool\_calls?: Array\<[ChatCompletionMessageToolCall](</api/reference/typescript/resources/chat#(resource) chat.completions > (model) chat_completion_message_tool_call > (schema)>)\>
The tool calls generated by the model, such as function calls.
One of the following:
ChatCompletionMessageFunctionToolCall { id, function, type }
A call to a function tool created by the model.
id: string
The ID of the tool call.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) id>)
function: Function { arguments, name }
The function that the model called.
arguments: string
The arguments to call the function with, as generated by the model in JSON format. Note that the model does not always generate valid JSON, and may hallucinate parameters not defined by your function schema. Validate the arguments in your code before calling your function.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function > (property) arguments>)
name: string
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function>)
type: "function"
The type of the tool. Currently, only `function` is supported.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema)>)
ChatCompletionMessageCustomToolCall { id, custom, type }
A call to a custom tool created by the model.
id: string
The ID of the tool call.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) id>)
custom: Custom { input, name }
The custom tool that the model called.
input: string
The input for the custom tool call generated by the model.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom > (property) input>)
name: string
The name of the custom tool to call.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom>)
type: "custom"
The type of the tool. Always `custom`.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema)>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) tool_calls>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices>)
created: number
The Unix timestamp (in seconds) of when the chat completion was created.
formatunixtime
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) created>)
model: string
The model used for the chat completion.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) model>)
object: "chat.completion"
The object type, which is always `chat.completion`.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) object>)
service\_tier?: "auto" | "default" | "flex" | 2 more | null
Specifies the processing type used for serving the request.
* If set to ‘auto’, then the request will be processed with the service tier configured in the Project settings. Unless otherwise configured, the Project will use ‘default’.
* If set to ‘default’, then the request will be processed with the standard pricing and performance for the selected model.
* If set to ‘[flex](https://platform.openai.com/docs/guides/flex-processing)’ or ‘[priority](https://openai.com/api-priority-processing/)’, then the request will be processed with the corresponding service tier.
* When not set, the default behavior is ‘auto’.
When the `service\_tier` parameter is set, the response body will include the `service\_tier` value based on the processing mode actually used to serve the request. This response value may be different from the value set in the parameter.
One of the following:
"auto"
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) service_tier > (member) 0>)
"default"
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) service_tier > (member) 1>)
"flex"
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) service_tier > (member) 2>)
"scale"
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) service_tier > (member) 3>)
"priority"
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) service_tier > (member) 4>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) service_tier>)
Deprecatedsystem\_fingerprint?: string
This fingerprint represents the backend configuration that the model runs with.
Can be used in conjunction with the `seed` request parameter to understand when backend changes have been made that might impact determinism.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) system_fingerprint>)
usage?: [CompletionUsage](</api/reference/typescript/resources/completions#(resource) completions > (model) completion_usage > (schema)>) { completion\_tokens, prompt\_tokens, total\_tokens, 2 more }
Usage statistics for the completion request.
completion\_tokens: number
Number of tokens in the generated completion.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) completion_tokens>)
prompt\_tokens: number
Number of tokens in the prompt.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) prompt_tokens>)
total\_tokens: number
Total number of tokens used in the request (prompt + completion).
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) total_tokens>)
completion\_tokens\_details?: CompletionTokensDetails { accepted\_prediction\_tokens, audio\_tokens, reasoning\_tokens, rejected\_prediction\_tokens }
Breakdown of tokens used in a completion.
accepted\_prediction\_tokens?: number
When using Predicted Outputs, the number of tokens in the
prediction that appeared in the completion.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details > (property) accepted_prediction_tokens>)
audio\_tokens?: number
Audio input tokens generated by the model.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details > (property) audio_tokens>)
reasoning\_tokens?: number
Tokens generated by the model for reasoning.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details > (property) reasoning_tokens>)
rejected\_prediction\_tokens?: number
When using Predicted Outputs, the number of tokens in the
prediction that did not appear in the completion. However, like
reasoning tokens, these tokens are still counted in the total
completion tokens for purposes of billing, output, and context window
limits.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details > (property) rejected_prediction_tokens>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details>)
prompt\_tokens\_details?: PromptTokensDetails { audio\_tokens, cached\_tokens }
Breakdown of tokens used in the prompt.
audio\_tokens?: number
Audio input tokens present in the prompt.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) prompt_tokens_details > (property) audio_tokens>)
cached\_tokens?: number
Cached tokens present in the prompt.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) prompt_tokens_details > (property) cached_tokens>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) prompt_tokens_details>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage>)
[](<#(resource) chat.completions > (model) chat_completion > (schema)>)
### List Chat Completions
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
apiKey: process.env['OPENAI\_API\_KEY'], // This is the default and can be omitted
});
// Automatically fetches more pages as needed.
for await (const chatCompletion of client.chat.completions.list()) {
console.log(chatCompletion.id);
}`
```
```
`{
"object": "list",
"data": [
{
"object": "chat.completion",
"id": "chatcmpl-AyPNinnUqUDYo9SAdA52NobMflmj2",
"model": "gpt-5.4",
"created": 1738960610,
"request\_id": "req\_ded8ab984ec4bf840f37566c1011c417",
"tool\_choice": null,
"usage": {
"total\_tokens": 31,
"completion\_tokens": 18,
"prompt\_tokens": 13
},
"seed": 4944116822809979520,
"top\_p": 1.0,
"temperature": 1.0,
"presence\_penalty": 0.0,
"frequency\_penalty": 0.0,
"system\_fingerprint": "fp\_50cad350e4",
"input\_user": null,
"service\_tier": "default",
"tools": null,
"metadata": {},
"choices": [
{
"index": 0,
"message": {
"content": "Mind of circuits hum, \\nLearning patterns in silence— \\nFuture's quiet spark.",
"role": "assistant",
"tool\_calls": null,
"function\_call": null
},
"finish\_reason": "stop",
"logprobs": null
}
],
"response\_format": null
}
],
"first\_id": "chatcmpl-AyPNinnUqUDYo9SAdA52NobMflmj2",
"last\_id": "chatcmpl-AyPNinnUqUDYo9SAdA52NobMflmj2",
"has\_more": false
}
`
```
##### Returns Examples
```
`{
"object": "list",
"data": [
{
"object": "chat.completion",
"id": "chatcmpl-AyPNinnUqUDYo9SAdA52NobMflmj2",
"model": "gpt-5.4",
"created": 1738960610,
"request\_id": "req\_ded8ab984ec4bf840f37566c1011c417",
"tool\_choice": null,
"usage": {
"total\_tokens": 31,
"completion\_tokens": 18,
"prompt\_tokens": 13
},
"seed": 4944116822809979520,
"top\_p": 1.0,
"temperature": 1.0,
"presence\_penalty": 0.0,
"frequency\_penalty": 0.0,
"system\_fingerprint": "fp\_50cad350e4",
"input\_user": null,
"service\_tier": "default",
"tools": null,
"metadata": {},
"choices": [
{
"index": 0,
"message": {
"content": "Mind of circuits hum, \\nLearning patterns in silence— \\nFuture's quiet spark.",
"role": "assistant",
"tool\_calls": null,
"function\_call": null
},
"finish\_reason": "stop",
"logprobs": null
}
],
"response\_format": null
}
],
"first\_id": "chatcmpl-AyPNinnUqUDYo9SAdA52NobMflmj2",
"last\_id": "chatcmpl-AyPNinnUqUDYo9SAdA52NobMflmj2",
"has\_more": false
}
`
```