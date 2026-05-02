Completions | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Chat](/api/reference/ruby/resources/chat)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Completions
Given a list of messages comprising a conversation, the model will return a response.
##### [Create chat completion](/api/reference/ruby/resources/chat/subresources/completions/methods/create)
chat.completions.create(\*\*kwargs) -\> [ChatCompletion](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion > (schema)>) { id, choices, created, 5 more }
POST/chat/completions
##### [List Chat Completions](/api/reference/ruby/resources/chat/subresources/completions/methods/list)
chat.completions.list(\*\*kwargs) -\> CursorPage\<[ChatCompletion](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion > (schema)>) { id, choices, created, 5 more } \>
GET/chat/completions
##### [Get chat completion](/api/reference/ruby/resources/chat/subresources/completions/methods/retrieve)
chat.completions.retrieve(completion\_id) -\> [ChatCompletion](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion > (schema)>) { id, choices, created, 5 more }
GET/chat/completions/{completion\_id}
##### [Update chat completion](/api/reference/ruby/resources/chat/subresources/completions/methods/update)
chat.completions.update(completion\_id, \*\*kwargs) -\> [ChatCompletion](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion > (schema)>) { id, choices, created, 5 more }
POST/chat/completions/{completion\_id}
##### [Delete chat completion](/api/reference/ruby/resources/chat/subresources/completions/methods/delete)
chat.completions.delete(completion\_id) -\> [ChatCompletionDeleted](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion_deleted > (schema)>) { id, deleted, object }
DELETE/chat/completions/{completion\_id}
##### ModelsExpand Collapse
class ChatCompletion { id, choices, created, 5 more }
Represents a chat completion response returned by model, based on the provided input.
id: String
A unique identifier for the chat completion.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) id>)
choices: Array[Choice{ finish\_reason, index, logprobs, message}]
A list of chat completion choices. Can be more than one if `n` is greater than 1.
finish\_reason: :stop | :length | :tool\_calls | 2 more
The reason the model stopped generating tokens. This will be `stop` if the model hit a natural stop point or a provided stop sequence,
`length` if the maximum number of tokens specified in the request was reached,
`content\_filter` if content was omitted due to a flag from our content filters,
`tool\_calls` if the model called a tool, or `function\_call` (deprecated) if the model called a function.
One of the following:
:stop
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) finish_reason > (member) 0>)
:length
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) finish_reason > (member) 1>)
:tool\_calls
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) finish_reason > (member) 2>)
:content\_filter
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) finish_reason > (member) 3>)
:function\_call
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) finish_reason > (member) 4>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) finish_reason>)
index: Integer
The index of the choice in the list of choices.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) index>)
logprobs: Logprobs{ content, refusal}
Log probability information for the choice.
content: Array[[ChatCompletionTokenLogprob](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion_token_logprob > (schema)>) { token, bytes, logprob, top\_logprobs } ]
A list of message content tokens with log probability information.
token: String
The token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) token>)
bytes: Array[Integer]
A list of integers representing the UTF-8 bytes representation of the token. Useful in instances where characters are represented by multiple tokens and their byte representations must be combined to generate the correct text representation. Can be `null` if there is no bytes representation for the token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) bytes>)
logprob: Float
The log probability of this token, if it is within the top 20 most likely tokens. Otherwise, the value `-9999.0` is used to signify that the token is very unlikely.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) logprob>)
top\_logprobs: Array[TopLogprob{ token, bytes, logprob}]
List of the most likely tokens and their log probability, at this token position. In rare cases, there may be fewer than the number of requested `top\_logprobs` returned.
token: String
The token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) token>)
bytes: Array[Integer]
A list of integers representing the UTF-8 bytes representation of the token. Useful in instances where characters are represented by multiple tokens and their byte representations must be combined to generate the correct text representation. Can be `null` if there is no bytes representation for the token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) bytes>)
logprob: Float
The log probability of this token, if it is within the top 20 most likely tokens. Otherwise, the value `-9999.0` is used to signify that the token is very unlikely.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) logprob>)
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) logprobs > (property) content>)
refusal: Array[[ChatCompletionTokenLogprob](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion_token_logprob > (schema)>) { token, bytes, logprob, top\_logprobs } ]
A list of message refusal tokens with log probability information.
token: String
The token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) token>)
bytes: Array[Integer]
A list of integers representing the UTF-8 bytes representation of the token. Useful in instances where characters are represented by multiple tokens and their byte representations must be combined to generate the correct text representation. Can be `null` if there is no bytes representation for the token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) bytes>)
logprob: Float
The log probability of this token, if it is within the top 20 most likely tokens. Otherwise, the value `-9999.0` is used to signify that the token is very unlikely.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) logprob>)
top\_logprobs: Array[TopLogprob{ token, bytes, logprob}]
List of the most likely tokens and their log probability, at this token position. In rare cases, there may be fewer than the number of requested `top\_logprobs` returned.
token: String
The token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) token>)
bytes: Array[Integer]
A list of integers representing the UTF-8 bytes representation of the token. Useful in instances where characters are represented by multiple tokens and their byte representations must be combined to generate the correct text representation. Can be `null` if there is no bytes representation for the token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) bytes>)
logprob: Float
The log probability of this token, if it is within the top 20 most likely tokens. Otherwise, the value `-9999.0` is used to signify that the token is very unlikely.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) logprob>)
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) logprobs > (property) refusal>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) logprobs>)
message: [ChatCompletionMessage](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion_message > (schema)>) { content, refusal, role, 4 more }
A chat completion message generated by the model.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices>)
created: Integer
The Unix timestamp (in seconds) of when the chat completion was created.
formatunixtime
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) created>)
model: String
The model used for the chat completion.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) model>)
object: :"chat.completion"
The object type, which is always `chat.completion`.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) object>)
service\_tier: :auto | :default | :flex | 2 more
Specifies the processing type used for serving the request.
* If set to ‘auto’, then the request will be processed with the service tier configured in the Project settings. Unless otherwise configured, the Project will use ‘default’.
* If set to ‘default’, then the request will be processed with the standard pricing and performance for the selected model.
* If set to ‘[flex](https://platform.openai.com/docs/guides/flex-processing)’ or ‘[priority](https://openai.com/api-priority-processing/)’, then the request will be processed with the corresponding service tier.
* When not set, the default behavior is ‘auto’.
When the `service\_tier` parameter is set, the response body will include the `service\_tier` value based on the processing mode actually used to serve the request. This response value may be different from the value set in the parameter.
One of the following:
:auto
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) service_tier > (member) 0>)
:default
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) service_tier > (member) 1>)
:flex
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) service_tier > (member) 2>)
:scale
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) service_tier > (member) 3>)
:priority
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) service_tier > (member) 4>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) service_tier>)
Deprecatedsystem\_fingerprint: String
This fingerprint represents the backend configuration that the model runs with.
Can be used in conjunction with the `seed` request parameter to understand when backend changes have been made that might impact determinism.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) system_fingerprint>)
usage: [CompletionUsage](</api/reference/ruby/resources/completions#(resource) completions > (model) completion_usage > (schema)>) { completion\_tokens, prompt\_tokens, total\_tokens, 2 more }
Usage statistics for the completion request.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage>)
[](<#(resource) chat.completions > (model) chat_completion > (schema)>)
class ChatCompletionAllowedToolChoice { allowed\_tools, type }
Constrains the tools available to the model to a pre-defined set.
allowed\_tools: [ChatCompletionAllowedTools](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) ChatCompletionAllowedTools > (schema)>) { mode, tools }
Constrains the tools available to the model to a pre-defined set.
[](<#(resource) chat.completions > (model) chat_completion_allowed_tool_choice > (schema) > (property) allowed_tools>)
type: :allowed\_tools
Allowed tool configuration type. Always `allowed\_tools`.
[](<#(resource) chat.completions > (model) chat_completion_allowed_tool_choice > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_allowed_tool_choice > (schema)>)
class ChatCompletionAssistantMessageParam { role, audio, content, 4 more }
Messages sent by the model in response to user messages.
role: :assistant
The role of the messages author, in this case `assistant`.
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) role>)
audio: Audio{ id}
Data about a previous audio response from the model.
[Learn more](https://platform.openai.com/docs/guides/audio).
id: String
Unique identifier for a previous audio response from the model.
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) audio > (property) id>)
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) audio>)
content: String | Array[[ChatCompletionContentPartText](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>) { text, type } | [ChatCompletionContentPartRefusal](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion_content_part_refusal > (schema)>) { refusal, type } ]
The contents of the assistant message. Required unless `tool\_calls` or `function\_call` is specified.
One of the following:
String = String
The contents of the assistant message.
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) content > (variant) 0>)
ArrayOfContentParts = Array[[ChatCompletionContentPartText](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>) { text, type } | [ChatCompletionContentPartRefusal](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion_content_part_refusal > (schema)>) { refusal, type } ]
An array of content parts with a defined type. Can be one or more of type `text`, or exactly one of type `refusal`.
One of the following:
class ChatCompletionContentPartText { text, type }
Learn about [text inputs](https://platform.openai.com/docs/guides/text-generation).
text: String
The text content.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) text>)
type: :text
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>)
class ChatCompletionContentPartRefusal { refusal, type }
refusal: String
The refusal message generated by the model.
[](<#(resource) chat.completions > (model) chat_completion_content_part_refusal > (schema) > (property) refusal>)
type: :refusal
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_refusal > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_refusal > (schema)>)
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) content > (variant) 1>)
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) content>)
Deprecatedfunction\_call: FunctionCall{ arguments, name}
Deprecated and replaced by `tool\_calls`. The name and arguments of a function that should be called, as generated by the model.
arguments: String
The arguments to call the function with, as generated by the model in JSON format. Note that the model does not always generate valid JSON, and may hallucinate parameters not defined by your function schema. Validate the arguments in your code before calling your function.
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) function_call > (property) arguments>)
name: String
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) function_call > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) function_call>)
name: String
An optional name for the participant. Provides the model information to differentiate between participants of the same role.
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) name>)
refusal: String
The refusal message by the assistant.
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) refusal>)
tool\_calls: Array[[ChatCompletionMessageToolCall](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion_message_tool_call > (schema)>)]
The tool calls generated by the model, such as function calls.
One of the following:
class ChatCompletionMessageFunctionToolCall { id, function, type }
A call to a function tool created by the model.
id: String
The ID of the tool call.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) id>)
function: Function{ arguments, name}
The function that the model called.
arguments: String
The arguments to call the function with, as generated by the model in JSON format. Note that the model does not always generate valid JSON, and may hallucinate parameters not defined by your function schema. Validate the arguments in your code before calling your function.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function > (property) arguments>)
name: String
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function>)
type: :function
The type of the tool. Currently, only `function` is supported.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema)>)
class ChatCompletionMessageCustomToolCall { id, custom, type }
A call to a custom tool created by the model.
id: String
The ID of the tool call.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) id>)
custom: Custom{ input, name}
The custom tool that the model called.
input: String
The input for the custom tool call generated by the model.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom > (property) input>)
name: String
The name of the custom tool to call.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom>)
type: :custom
The type of the tool. Always `custom`.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema)>)
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) tool_calls>)
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema)>)
class ChatCompletionAudio { id, data, expires\_at, transcript }
If the audio output modality is requested, this object contains data
about the audio response from the model. [Learn more](https://platform.openai.com/docs/guides/audio).
id: String
Unique identifier for this audio response.
[](<#(resource) chat.completions > (model) chat_completion_audio > (schema) > (property) id>)
data: String
Base64 encoded audio bytes generated by the model, in the format
specified in the request.
[](<#(resource) chat.completions > (model) chat_completion_audio > (schema) > (property) data>)
expires\_at: Integer
The Unix timestamp (in seconds) for when this audio response will
no longer be accessible on the server for use in multi-turn
conversations.
formatunixtime
[](<#(resource) chat.completions > (model) chat_completion_audio > (schema) > (property) expires_at>)
transcript: String
Transcript of the audio generated by the model.
[](<#(resource) chat.completions > (model) chat_completion_audio > (schema) > (property) transcript>)
[](<#(resource) chat.completions > (model) chat_completion_audio > (schema)>)
class ChatCompletionAudioParam { format\_, voice }
Parameters for audio output. Required when audio output is requested with
`modalities: ["audio"]`. [Learn more](https://platform.openai.com/docs/guides/audio).
format\_: :wav | :aac | :mp3 | 3 more
Specifies the output audio format. Must be one of `wav`, `mp3`, `flac`,
`opus`, or `pcm16`.
One of the following:
:wav
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) format > (member) 0>)
:aac
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) format > (member) 1>)
:mp3
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) format > (member) 2>)
:flac
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) format > (member) 3>)
:opus
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) format > (member) 4>)
:pcm16
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) format > (member) 5>)
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) format>)
voice: String | :alloy | :ash | :ballad | 7 more | ID{ id}
The voice the model uses to respond. Supported built-in voices are
`alloy`, `ash`, `ballad`, `coral`, `echo`, `fable`, `nova`, `onyx`,
`sage`, `shimmer`, `marin`, and `cedar`. You may also provide a
custom voice object with an `id`, for example `{ "id": "voice\_1234" }`.
One of the following:
String = String
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 0>)
Voice = :alloy | :ash | :ballad | 7 more
One of the following:
:alloy
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 1 > (member) 0>)
:ash
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 1 > (member) 1>)
:ballad
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 1 > (member) 2>)
:coral
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 1 > (member) 3>)
:echo
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 1 > (member) 4>)
:sage
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 1 > (member) 5>)
:shimmer
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 1 > (member) 6>)
:verse
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 1 > (member) 7>)
:marin
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 1 > (member) 8>)
:cedar
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 1 > (member) 9>)
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 1>)
class ID { id }
Custom voice reference.
id: String
The custom voice ID, e.g. `voice\_1234`.
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 2 > (property) id>)
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 2>)
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice>)
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema)>)
class ChatCompletionChunk { id, choices, created, 5 more }
Represents a streamed chunk of a chat completion response returned
by the model, based on the provided input.
[Learn more](https://platform.openai.com/docs/guides/streaming-responses).
id: String
A unique identifier for the chat completion. Each chunk has the same ID.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) id>)
choices: Array[Choice{ delta, finish\_reason, index, logprobs}]
A list of chat completion choices. Can contain more than one elements if `n` is greater than 1. Can also be empty for the
last chunk if you set `stream\_options: {"include\_usage": true}`.
delta: Delta{ content, function\_call, refusal, 2 more}
A chat completion delta generated by streamed model responses.
content: String
The contents of the chunk message.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta > (property) content>)
Deprecatedfunction\_call: FunctionCall{ arguments, name}
Deprecated and replaced by `tool\_calls`. The name and arguments of a function that should be called, as generated by the model.
arguments: String
The arguments to call the function with, as generated by the model in JSON format. Note that the model does not always generate valid JSON, and may hallucinate parameters not defined by your function schema. Validate the arguments in your code before calling your function.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta > (property) function_call > (property) arguments>)
name: String
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta > (property) function_call > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta > (property) function_call>)
refusal: String
The refusal message generated by the model.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta > (property) refusal>)
role: :developer | :system | :user | 2 more
The role of the author of this message.
One of the following:
:developer
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta > (property) role > (member) 0>)
:system
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta > (property) role > (member) 1>)
:user
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta > (property) role > (member) 2>)
:assistant
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta > (property) role > (member) 3>)
:tool
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta > (property) role > (member) 4>)
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta > (property) role>)
tool\_calls: Array[ToolCall{ index, id, function, type}]
index: Integer
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta > (property) tool_calls > (items) > (property) index>)
id: String
The ID of the tool call.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta > (property) tool_calls > (items) > (property) id>)
function: Function{ arguments, name}
arguments: String
The arguments to call the function with, as generated by the model in JSON format. Note that the model does not always generate valid JSON, and may hallucinate parameters not defined by your function schema. Validate the arguments in your code before calling your function.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta > (property) tool_calls > (items) > (property) function > (property) arguments>)
name: String
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta > (property) tool_calls > (items) > (property) function > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta > (property) tool_calls > (items) > (property) function>)
type: :function
The type of the tool. Currently, only `function` is supported.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta > (property) tool_calls > (items) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta > (property) tool_calls>)
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta>)
finish\_reason: :stop | :length | :tool\_calls | 2 more
The reason the model stopped generating tokens. This will be `stop` if the model hit a natural stop point or a provided stop sequence,
`length` if the maximum number of tokens specified in the request was reached,
`content\_filter` if content was omitted due to a flag from our content filters,
`tool\_calls` if the model called a tool, or `function\_call` (deprecated) if the model called a function.
One of the following:
:stop
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) finish_reason > (member) 0>)
:length
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) finish_reason > (member) 1>)
:tool\_calls
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) finish_reason > (member) 2>)
:content\_filter
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) finish_reason > (member) 3>)
:function\_call
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) finish_reason > (member) 4>)
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) finish_reason>)
index: Integer
The index of the choice in the list of choices.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) index>)
logprobs: Logprobs{ content, refusal}
Log probability information for the choice.
content: Array[[ChatCompletionTokenLogprob](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion_token_logprob > (schema)>) { token, bytes, logprob, top\_logprobs } ]
A list of message content tokens with log probability information.
token: String
The token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) token>)
bytes: Array[Integer]
A list of integers representing the UTF-8 bytes representation of the token. Useful in instances where characters are represented by multiple tokens and their byte representations must be combined to generate the correct text representation. Can be `null` if there is no bytes representation for the token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) bytes>)
logprob: Float
The log probability of this token, if it is within the top 20 most likely tokens. Otherwise, the value `-9999.0` is used to signify that the token is very unlikely.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) logprob>)
top\_logprobs: Array[TopLogprob{ token, bytes, logprob}]
List of the most likely tokens and their log probability, at this token position. In rare cases, there may be fewer than the number of requested `top\_logprobs` returned.
token: String
The token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) token>)
bytes: Array[Integer]
A list of integers representing the UTF-8 bytes representation of the token. Useful in instances where characters are represented by multiple tokens and their byte representations must be combined to generate the correct text representation. Can be `null` if there is no bytes representation for the token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) bytes>)
logprob: Float
The log probability of this token, if it is within the top 20 most likely tokens. Otherwise, the value `-9999.0` is used to signify that the token is very unlikely.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) logprob>)
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs>)
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) logprobs > (property) content>)
refusal: Array[[ChatCompletionTokenLogprob](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion_token_logprob > (schema)>) { token, bytes, logprob, top\_logprobs } ]
A list of message refusal tokens with log probability information.
token: String
The token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) token>)
bytes: Array[Integer]
A list of integers representing the UTF-8 bytes representation of the token. Useful in instances where characters are represented by multiple tokens and their byte representations must be combined to generate the correct text representation. Can be `null` if there is no bytes representation for the token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) bytes>)
logprob: Float
The log probability of this token, if it is within the top 20 most likely tokens. Otherwise, the value `-9999.0` is used to signify that the token is very unlikely.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) logprob>)
top\_logprobs: Array[TopLogprob{ token, bytes, logprob}]
List of the most likely tokens and their log probability, at this token position. In rare cases, there may be fewer than the number of requested `top\_logprobs` returned.
token: String
The token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) token>)
bytes: Array[Integer]
A list of integers representing the UTF-8 bytes representation of the token. Useful in instances where characters are represented by multiple tokens and their byte representations must be combined to generate the correct text representation. Can be `null` if there is no bytes representation for the token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) bytes>)
logprob: Float
The log probability of this token, if it is within the top 20 most likely tokens. Otherwise, the value `-9999.0` is used to signify that the token is very unlikely.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) logprob>)
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs>)
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) logprobs > (property) refusal>)
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) logprobs>)
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices>)
created: Integer
The Unix timestamp (in seconds) of when the chat completion was created. Each chunk has the same timestamp.
formatunixtime
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) created>)
model: String
The model to generate the completion.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) model>)
object: :"chat.completion.chunk"
The object type, which is always `chat.completion.chunk`.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) object>)
service\_tier: :auto | :default | :flex | 2 more
Specifies the processing type used for serving the request.
* If set to ‘auto’, then the request will be processed with the service tier configured in the Project settings. Unless otherwise configured, the Project will use ‘default’.
* If set to ‘default’, then the request will be processed with the standard pricing and performance for the selected model.
* If set to ‘[flex](https://platform.openai.com/docs/guides/flex-processing)’ or ‘[priority](https://openai.com/api-priority-processing/)’, then the request will be processed with the corresponding service tier.
* When not set, the default behavior is ‘auto’.
When the `service\_tier` parameter is set, the response body will include the `service\_tier` value based on the processing mode actually used to serve the request. This response value may be different from the value set in the parameter.
One of the following:
:auto
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) service_tier > (member) 0>)
:default
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) service_tier > (member) 1>)
:flex
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) service_tier > (member) 2>)
:scale
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) service_tier > (member) 3>)
:priority
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) service_tier > (member) 4>)
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) service_tier>)
Deprecatedsystem\_fingerprint: String
This fingerprint represents the backend configuration that the model runs with.
Can be used in conjunction with the `seed` request parameter to understand when backend changes have been made that might impact determinism.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) system_fingerprint>)
usage: [CompletionUsage](</api/reference/ruby/resources/completions#(resource) completions > (model) completion_usage > (schema)>) { completion\_tokens, prompt\_tokens, total\_tokens, 2 more }
An optional field that will only be present when you set
`stream\_options: {"include\_usage": true}` in your request. When present, it
contains a null value **except for the last chunk** which contains the
token usage statistics for the entire request.
**NOTE:** If the stream is interrupted or cancelled, you may not
receive the final usage chunk which contains the total token usage for
the request.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) usage>)
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema)>)
ChatCompletionContentPart = [ChatCompletionContentPartText](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>) { text, type } | [ChatCompletionContentPartImage](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion_content_part_image > (schema)>) { image\_url, type } | [ChatCompletionContentPartInputAudio](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema)>) { input\_audio, type } | File{ file, type}
Learn about [text inputs](https://platform.openai.com/docs/guides/text-generation).
One of the following:
class ChatCompletionContentPartText { text, type }
Learn about [text inputs](https://platform.openai.com/docs/guides/text-generation).
text: String
The text content.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) text>)
type: :text
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>)
class ChatCompletionContentPartImage { image\_url, type }
Learn about [image inputs](https://platform.openai.com/docs/guides/vision).
image\_url: ImageURL{ url, detail}
url: String
Either a URL of the image or the base64 encoded image data.
formaturi
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) url>)
detail: :auto | :low | :high
Specifies the detail level of the image. Learn more in the [Vision guide](https://platform.openai.com/docs/guides/vision#low-or-high-fidelity-image-understanding).
One of the following:
:auto
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail > (member) 0>)
:low
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail > (member) 1>)
:high
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail > (member) 2>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url>)
type: :image\_url
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema)>)
class ChatCompletionContentPartInputAudio { input\_audio, type }
Learn about [audio inputs](https://platform.openai.com/docs/guides/audio).
input\_audio: InputAudio{ data, format\_}
data: String
Base64 encoded audio data.
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio > (property) data>)
format\_: :wav | :mp3
The format of the encoded audio data. Currently supports “wav” and “mp3”.
One of the following:
:wav
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
:mp3
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio>)
type: :input\_audio
The type of the content part. Always `input\_audio`.
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema)>)
class File { file, type }
Learn about [file inputs](https://platform.openai.com/docs/guides/text) for text generation.
file: File{ file\_data, file\_id, filename}
file\_data: String
The base64 encoded file data, used when passing the file to the model
as a string.
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3 > (property) file > (property) file_data>)
file\_id: String
The ID of an uploaded file to use as input.
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3 > (property) file > (property) file_id>)
filename: String
The name of the file, used when passing the file to the model as a
string.
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3 > (property) file > (property) filename>)
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3 > (property) file>)
type: :file
The type of the content part. Always `file`.
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3 > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3>)
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema)>)
class ChatCompletionContentPartImage { image\_url, type }
Learn about [image inputs](https://platform.openai.com/docs/guides/vision).
image\_url: ImageURL{ url, detail}
url: String
Either a URL of the image or the base64 encoded image data.
formaturi
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) url>)
detail: :auto | :low | :high
Specifies the detail level of the image. Learn more in the [Vision guide](https://platform.openai.com/docs/guides/vision#low-or-high-fidelity-image-understanding).
One of the following:
:auto
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail > (member) 0>)
:low
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail > (member) 1>)
:high
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail > (member) 2>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url>)
type: :image\_url
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema)>)
class ChatCompletionContentPartInputAudio { input\_audio, type }
Learn about [audio inputs](https://platform.openai.com/docs/guides/audio).
input\_audio: InputAudio{ data, format\_}
data: String
Base64 encoded audio data.
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio > (property) data>)
format\_: :wav | :mp3
The format of the encoded audio data. Currently supports “wav” and “mp3”.
One of the following:
:wav
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
:mp3
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio>)
type: :input\_audio
The type of the content part. Always `input\_audio`.
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema)>)
class ChatCompletionContentPartRefusal { refusal, type }
refusal: String
The refusal message generated by the model.
[](<#(resource) chat.completions > (model) chat_completion_content_part_refusal > (schema) > (property) refusal>)
type: :refusal
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_refusal > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_refusal > (schema)>)
class ChatCompletionContentPartText { text, type }
Learn about [text inputs](https://platform.openai.com/docs/guides/text-generation).
text: String
The text content.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) text>)
type: :text
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>)
class ChatCompletionCustomTool { custom, type }
A custom tool that processes input using a specified format.
custom: Custom{ name, description, format\_}
Properties of the custom tool.
name: String
The name of the custom tool, used to identify it in tool calls.
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) name>)
description: String
Optional description of the custom tool, used to provide more context.
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) description>)
format\_: Text{ type} | Grammar{ grammar, type}
The input format for the custom tool. Default is unconstrained text.
One of the following:
class Text { type }
Unconstrained free-form text.
type: :text
Unconstrained text format. Always `text`.
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 0 > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 0>)
class Grammar { grammar, type }
A grammar defined by the user.
grammar: Grammar{ definition, syntax}
Your chosen grammar.
definition: String
The grammar definition.
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 1 > (property) grammar > (property) definition>)
syntax: :lark | :regex
The syntax of the grammar definition. One of `lark` or `regex`.
One of the following:
:lark
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 1 > (property) grammar > (property) syntax > (member) 0>)
:regex
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 1 > (property) grammar > (property) syntax > (member) 1>)
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 1 > (property) grammar > (property) syntax>)
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 1 > (property) grammar>)
type: :grammar
Grammar format. Always `grammar`.
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 1 > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 1>)
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format>)
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom>)
type: :custom
The type of the custom tool. Always `custom`.
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema)>)
class ChatCompletionDeleted { id, deleted, object }
id: String
The ID of the chat completion that was deleted.
[](<#(resource) chat.completions > (model) chat_completion_deleted > (schema) > (property) id>)
deleted: bool
Whether the chat completion was deleted.
[](<#(resource) chat.completions > (model) chat_completion_deleted > (schema) > (property) deleted>)
object: :"chat.completion.deleted"
The type of object being deleted.
[](<#(resource) chat.completions > (model) chat_completion_deleted > (schema) > (property) object>)
[](<#(resource) chat.completions > (model) chat_completion_deleted > (schema)>)
class ChatCompletionDeveloperMessageParam { content, role, name }
Developer-provided instructions that the model should follow, regardless of
messages sent by the user. With o1 models and newer, `developer` messages
replace the previous `system` messages.
content: String | Array[[ChatCompletionContentPartText](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>) { text, type } ]
The contents of the developer message.
One of the following:
String = String
The contents of the developer message.
[](<#(resource) chat.completions > (model) chat_completion_developer_message_param > (schema) > (property) content > (variant) 0>)
ArrayOfContentParts = Array[[ChatCompletionContentPartText](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>) { text, type } ]
An array of content parts with a defined type. For developer messages, only type `text` is supported.
text: String
The text content.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) text>)
type: :text
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_developer_message_param > (schema) > (property) content > (variant) 1>)
[](<#(resource) chat.completions > (model) chat_completion_developer_message_param > (schema) > (property) content>)
role: :developer
The role of the messages author, in this case `developer`.
[](<#(resource) chat.completions > (model) chat_completion_developer_message_param > (schema) > (property) role>)
name: String
An optional name for the participant. Provides the model information to differentiate between participants of the same role.
[](<#(resource) chat.completions > (model) chat_completion_developer_message_param > (schema) > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_developer_message_param > (schema)>)
class ChatCompletionFunctionCallOption { name }
Specifying a particular function via `{"name": "my\_function"}` forces the model to call that function.
name: String
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion_function_call_option > (schema) > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_function_call_option > (schema)>)
class ChatCompletionFunctionMessageParam { content, name, role }
content: String
The contents of the function message.
[](<#(resource) chat.completions > (model) chat_completion_function_message_param > (schema) > (property) content>)
name: String
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion_function_message_param > (schema) > (property) name>)
role: :function
The role of the messages author, in this case `function`.
[](<#(resource) chat.completions > (model) chat_completion_function_message_param > (schema) > (property) role>)
[](<#(resource) chat.completions > (model) chat_completion_function_message_param > (schema)>)
class ChatCompletionFunctionTool { function, type }
A function tool that can be used to generate a response.
function: [FunctionDefinition](</api/reference/ruby/resources/$shared#(resource) $shared > (model) function_definition > (schema)>) { name, description, parameters, strict }
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema) > (property) function>)
type: :function
The type of the tool. Currently, only `function` is supported.
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema)>)
class ChatCompletionMessage { content, refusal, role, 4 more }
A chat completion message generated by the model.
content: String
The contents of the message.
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) content>)
refusal: String
The refusal message generated by the model.
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) refusal>)
role: :assistant
The role of the author of this message.
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) role>)
annotations: Array[Annotation{ type, url\_citation}]
Annotations for the message, when applicable, as when using the
[web search tool](https://platform.openai.com/docs/guides/tools-web-search?api-mode=chat).
type: :url\_citation
The type of the URL citation. Always `url\_citation`.
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) annotations > (items) > (property) type>)
url\_citation: URLCitation{ end\_index, start\_index, title, url}
A URL citation when using web search.
end\_index: Integer
The index of the last character of the URL citation in the message.
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) annotations > (items) > (property) url_citation > (property) end_index>)
start\_index: Integer
The index of the first character of the URL citation in the message.
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) annotations > (items) > (property) url_citation > (property) start_index>)
title: String
The title of the web resource.
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) annotations > (items) > (property) url_citation > (property) title>)
url: String
The URL of the web resource.
formaturi
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) annotations > (items) > (property) url_citation > (property) url>)
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) annotations > (items) > (property) url_citation>)
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) annotations>)
audio: [ChatCompletionAudio](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion_audio > (schema)>) { id, data, expires\_at, transcript }
If the audio output modality is requested, this object contains data
about the audio response from the model. [Learn more](https://platform.openai.com/docs/guides/audio).
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) audio>)
Deprecatedfunction\_call: FunctionCall{ arguments, name}
Deprecated and replaced by `tool\_calls`. The name and arguments of a function that should be called, as generated by the model.
arguments: String
The arguments to call the function with, as generated by the model in JSON format. Note that the model does not always generate valid JSON, and may hallucinate parameters not defined by your function schema. Validate the arguments in your code before calling your function.
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) function_call > (property) arguments>)
name: String
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) function_call > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) function_call>)
tool\_calls: Array[[ChatCompletionMessageToolCall](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion_message_tool_call > (schema)>)]
The tool calls generated by the model, such as function calls.
One of the following:
class ChatCompletionMessageFunctionToolCall { id, function, type }
A call to a function tool created by the model.
id: String
The ID of the tool call.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) id>)
function: Function{ arguments, name}
The function that the model called.
arguments: String
The arguments to call the function with, as generated by the model in JSON format. Note that the model does not always generate valid JSON, and may hallucinate parameters not defined by your function schema. Validate the arguments in your code before calling your function.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function > (property) arguments>)
name: String
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function>)
type: :function
The type of the tool. Currently, only `function` is supported.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema)>)
class ChatCompletionMessageCustomToolCall { id, custom, type }
A call to a custom tool created by the model.
id: String
The ID of the tool call.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) id>)
custom: Custom{ input, name}
The custom tool that the model called.
input: String
The input for the custom tool call generated by the model.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom > (property) input>)
name: String
The name of the custom tool to call.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom>)
type: :custom
The type of the tool. Always `custom`.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema)>)
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) tool_calls>)
[](<#(resource) chat.completions > (model) chat_completion_message > (schema)>)
class ChatCompletionMessageCustomToolCall { id, custom, type }
A call to a custom tool created by the model.
id: String
The ID of the tool call.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) id>)
custom: Custom{ input, name}
The custom tool that the model called.
input: String
The input for the custom tool call generated by the model.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom > (property) input>)
name: String
The name of the custom tool to call.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom>)
type: :custom
The type of the tool. Always `custom`.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema)>)
class ChatCompletionMessageFunctionToolCall { id, function, type }
A call to a function tool created by the model.
id: String
The ID of the tool call.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) id>)
function: Function{ arguments, name}
The function that the model called.
arguments: String
The arguments to call the function with, as generated by the model in JSON format. Note that the model does not always generate valid JSON, and may hallucinate parameters not defined by your function schema. Validate the arguments in your code before calling your function.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function > (property) arguments>)
name: String
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function>)
type: :function
The type of the tool. Currently, only `function` is supported.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema)>)
ChatCompletionMessageParam = [ChatCompletionDeveloperMessageParam](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion_developer_message_param > (schema)>) { content, role, name } | [ChatCompletionSystemMessageParam](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion_system_message_param > (schema)>) { content, role, name } | [ChatCompletionUserMessageParam](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion_user_message_param > (schema)>) { content, role, name } | 3 more
Developer-provided instructions that the model should follow, regardless of
messages sent by the user. With o1 models and newer, `developer` messages
replace the previous `system` messages.
One of the following:
class ChatCompletionDeveloperMessageParam { content, role, name }
Developer-provided instructions that the model should follow, regardless of
messages sent by the user. With o1 models and newer, `developer` messages
replace the previous `system` messages.
content: String | Array[[ChatCompletionContentPartText](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>) { text, type } ]
The contents of the developer message.
One of the following:
String = String
The contents of the developer message.
[](<#(resource) chat.completions > (model) chat_completion_developer_message_param > (schema) > (property) content > (variant) 0>)
ArrayOfContentParts = Array[[ChatCompletionContentPartText](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>) { text, type } ]
An array of content parts with a defined type. For developer messages, only type `text` is supported.
text: String
The text content.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) text>)
type: :text
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_developer_message_param > (schema) > (property) content > (variant) 1>)
[](<#(resource) chat.completions > (model) chat_completion_developer_message_param > (schema) > (property) content>)
role: :developer
The role of the messages author, in this case `developer`.
[](<#(resource) chat.completions > (model) chat_completion_developer_message_param > (schema) > (property) role>)
name: String
An optional name for the participant. Provides the model information to differentiate between participants of the same role.
[](<#(resource) chat.completions > (model) chat_completion_developer_message_param > (schema) > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_developer_message_param > (schema)>)
class ChatCompletionSystemMessageParam { content, role, name }
Developer-provided instructions that the model should follow, regardless of
messages sent by the user. With o1 models and newer, use `developer` messages
for this purpose instead.
content: String | Array[[ChatCompletionContentPartText](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>) { text, type } ]
The contents of the system message.
One of the following:
String = String
The contents of the system message.
[](<#(resource) chat.completions > (model) chat_completion_system_message_param > (schema) > (property) content > (variant) 0>)
ArrayOfContentParts = Array[[ChatCompletionContentPartText](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>) { text, type } ]
An array of content parts with a defined type. For system messages, only type `text` is supported.
text: String
The text content.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) text>)
type: :text
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_system_message_param > (schema) > (property) content > (variant) 1>)
[](<#(resource) chat.completions > (model) chat_completion_system_message_param > (schema) > (property) content>)
role: :system
The role of the messages author, in this case `system`.
[](<#(resource) chat.completions > (model) chat_completion_system_message_param > (schema) > (property) role>)
name: String
An optional name for the participant. Provides the model information to differentiate between participants of the same role.
[](<#(resource) chat.completions > (model) chat_completion_system_message_param > (schema) > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_system_message_param > (schema)>)
class ChatCompletionUserMessageParam { content, role, name }
Messages sent by an end user, containing prompts or additional context
information.
content: String | Array[[ChatCompletionContentPart](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion_content_part > (schema)>)]
The contents of the user message.
One of the following:
String = String
The text contents of the message.
[](<#(resource) chat.completions > (model) chat_completion_user_message_param > (schema) > (property) content > (variant) 0>)
ArrayOfContentParts = Array[[ChatCompletionContentPart](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion_content_part > (schema)>)]
An array of content parts with a defined type. Supported options differ based on the [model](https://platform.openai.com/docs/models) being used to generate the response. Can contain text, image, or audio inputs.
One of the following:
class ChatCompletionContentPartText { text, type }
Learn about [text inputs](https://platform.openai.com/docs/guides/text-generation).
text: String
The text content.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) text>)
type: :text
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>)
class ChatCompletionContentPartImage { image\_url, type }
Learn about [image inputs](https://platform.openai.com/docs/guides/vision).
image\_url: ImageURL{ url, detail}
url: String
Either a URL of the image or the base64 encoded image data.
formaturi
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) url>)
detail: :auto | :low | :high
Specifies the detail level of the image. Learn more in the [Vision guide](https://platform.openai.com/docs/guides/vision#low-or-high-fidelity-image-understanding).
One of the following:
:auto
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail > (member) 0>)
:low
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail > (member) 1>)
:high
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail > (member) 2>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url>)
type: :image\_url
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema)>)
class ChatCompletionContentPartInputAudio { input\_audio, type }
Learn about [audio inputs](https://platform.openai.com/docs/guides/audio).
input\_audio: InputAudio{ data, format\_}
data: String
Base64 encoded audio data.
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio > (property) data>)
format\_: :wav | :mp3
The format of the encoded audio data. Currently supports “wav” and “mp3”.
One of the following:
:wav
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
:mp3
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio>)
type: :input\_audio
The type of the content part. Always `input\_audio`.
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema)>)
class File { file, type }
Learn about [file inputs](https://platform.openai.com/docs/guides/text) for text generation.
file: File{ file\_data, file\_id, filename}
file\_data: String
The base64 encoded file data, used when passing the file to the model
as a string.
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3 > (property) file > (property) file_data>)
file\_id: String
The ID of an uploaded file to use as input.
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3 > (property) file > (property) file_id>)
filename: String
The name of the file, used when passing the file to the model as a
string.
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3 > (property) file > (property) filename>)
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3 > (property) file>)
type: :file
The type of the content part. Always `file`.
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3 > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3>)
[](<#(resource) chat.completions > (model) chat_completion_user_message_param > (schema) > (property) content > (variant) 1>)
[](<#(resource) chat.completions > (model) chat_completion_user_message_param > (schema) > (property) content>)
role: :user
The role of the messages author, in this case `user`.
[](<#(resource) chat.completions > (model) chat_completion_user_message_param > (schema) > (property) role>)
name: String
An optional name for the participant. Provides the model information to differentiate between participants of the same role.
[](<#(resource) chat.completions > (model) chat_completion_user_message_param > (schema) > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_user_message_param > (schema)>)
class ChatCompletionAssistantMessageParam { role, audio, content, 4 more }
Messages sent by the model in response to user messages.
role: :assistant
The role of the messages author, in this case `assistant`.
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) role>)
audio: Audio{ id}
Data about a previous audio response from the model.
[Learn more](https://platform.openai.com/docs/guides/audio).
id: String
Unique identifier for a previous audio response from the model.
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) audio > (property) id>)
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) audio>)
content: String | Array[[ChatCompletionContentPartText](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>) { text, type } | [ChatCompletionContentPartRefusal](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion_content_part_refusal > (schema)>) { refusal, type } ]
The contents of the assistant message. Required unless `tool\_calls` or `function\_call` is specified.
One of the following:
String = String
The contents of the assistant message.
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) content > (variant) 0>)
ArrayOfContentParts = Array[[ChatCompletionContentPartText](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>) { text, type } | [ChatCompletionContentPartRefusal](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion_content_part_refusal > (schema)>) { refusal, type } ]
An array of content parts with a defined type. Can be one or more of type `text`, or exactly one of type `refusal`.
One of the following:
class ChatCompletionContentPartText { text, type }
Learn about [text inputs](https://platform.openai.com/docs/guides/text-generation).
text: String
The text content.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) text>)
type: :text
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>)
class ChatCompletionContentPartRefusal { refusal, type }
refusal: String
The refusal message generated by the model.
[](<#(resource) chat.completions > (model) chat_completion_content_part_refusal > (schema) > (property) refusal>)
type: :refusal
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_refusal > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_refusal > (schema)>)
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) content > (variant) 1>)
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) content>)
Deprecatedfunction\_call: FunctionCall{ arguments, name}
Deprecated and replaced by `tool\_calls`. The name and arguments of a function that should be called, as generated by the model.
arguments: String
The arguments to call the function with, as generated by the model in JSON format. Note that the model does not always generate valid JSON, and may hallucinate parameters not defined by your function schema. Validate the arguments in your code before calling your function.
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) function_call > (property) arguments>)
name: String
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) function_call > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) function_call>)
name: String
An optional name for the participant. Provides the model information to differentiate between participants of the same role.
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) name>)
refusal: String
The refusal message by the assistant.
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) refusal>)
tool\_calls: Array[[ChatCompletionMessageToolCall](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion_message_tool_call > (schema)>)]
The tool calls generated by the model, such as function calls.
One of the following:
class ChatCompletionMessageFunctionToolCall { id, function, type }
A call to a function tool created by the model.
id: String
The ID of the tool call.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) id>)
function: Function{ arguments, name}
The function that the model called.
arguments: String
The arguments to call the function with, as generated by the model in JSON format. Note that the model does not always generate valid JSON, and may hallucinate parameters not defined by your function schema. Validate the arguments in your code before calling your function.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function > (property) arguments>)
name: String
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function>)
type: :function
The type of the tool. Currently, only `function` is supported.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema)>)
class ChatCompletionMessageCustomToolCall { id, custom, type }
A call to a custom tool created by the model.
id: String
The ID of the tool call.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) id>)
custom: Custom{ input, name}
The custom tool that the model called.
input: String
The input for the custom tool call generated by the model.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom > (property) input>)
name: String
The name of the custom tool to call.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom>)
type: :custom
The type of the tool. Always `custom`.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema)>)
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) tool_calls>)
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema)>)
class ChatCompletionToolMessageParam { content, role, tool\_call\_id }
content: String | Array[[ChatCompletionContentPartText](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>) { text, type } ]
The contents of the tool message.
One of the following:
String = String
The contents of the tool message.
[](<#(resource) chat.completions > (model) chat_completion_tool_message_param > (schema) > (property) content > (variant) 0>)
ArrayOfContentParts = Array[[ChatCompletionContentPartText](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>) { text, type } ]
An array of content parts with a defined type. For tool messages, only type `text` is supported.
text: String
The text content.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) text>)
type: :text
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_tool_message_param > (schema) > (property) content > (variant) 1>)
[](<#(resource) chat.completions > (model) chat_completion_tool_message_param > (schema) > (property) content>)
role: :tool
The role of the messages author, in this case `tool`.
[](<#(resource) chat.completions > (model) chat_completion_tool_message_param > (schema) > (property) role>)
tool\_call\_id: String
Tool call that this message is responding to.
[](<#(resource) chat.completions > (model) chat_completion_tool_message_param > (schema) > (property) tool_call_id>)
[](<#(resource) chat.completions > (model) chat_completion_tool_message_param > (schema)>)
class ChatCompletionFunctionMessageParam { content, name, role }
content: String
The contents of the function message.
[](<#(resource) chat.completions > (model) chat_completion_function_message_param > (schema) > (property) content>)
name: String
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion_function_message_param > (schema) > (property) name>)
role: :function
The role of the messages author, in this case `function`.
[](<#(resource) chat.completions > (model) chat_completion_function_message_param > (schema) > (property) role>)
[](<#(resource) chat.completions > (model) chat_completion_function_message_param > (schema)>)
[](<#(resource) chat.completions > (model) chat_completion_message_param > (schema)>)
ChatCompletionMessageToolCall = [ChatCompletionMessageFunctionToolCall](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema)>) { id, function, type } | [ChatCompletionMessageCustomToolCall](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema)>) { id, custom, type }
A call to a function tool created by the model.
One of the following:
class ChatCompletionMessageFunctionToolCall { id, function, type }
A call to a function tool created by the model.
id: String
The ID of the tool call.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) id>)
function: Function{ arguments, name}
The function that the model called.
arguments: String
The arguments to call the function with, as generated by the model in JSON format. Note that the model does not always generate valid JSON, and may hallucinate parameters not defined by your function schema. Validate the arguments in your code before calling your function.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function > (property) arguments>)
name: String
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function>)
type: :function
The type of the tool. Currently, only `function` is supported.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema)>)
class ChatCompletionMessageCustomToolCall { id, custom, type }
A call to a custom tool created by the model.
id: String
The ID of the tool call.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) id>)
custom: Custom{ input, name}
The custom tool that the model called.
input: String
The input for the custom tool call generated by the model.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom > (property) input>)
name: String
The name of the custom tool to call.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom>)
type: :custom
The type of the tool. Always `custom`.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema)>)
[](<#(resource) chat.completions > (model) chat_completion_message_tool_call > (schema)>)
ChatCompletionModality = :text | :audio
One of the following:
:text
[](<#(resource) chat.completions > (model) chat_completion_modality > (schema) > (member) 0>)
:audio
[](<#(resource) chat.completions > (model) chat_completion_modality > (schema) > (member) 1>)
[](<#(resource) chat.completions > (model) chat_completion_modality > (schema)>)
class ChatCompletionNamedToolChoice { function, type }
Specifies a tool the model should use. Use to force the model to call a specific function.
function: Function{ name}
name: String
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion_named_tool_choice > (schema) > (property) function > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_named_tool_choice > (schema) > (property) function>)
type: :function
For function calling, the type is always `function`.
[](<#(resource) chat.completions > (model) chat_completion_named_tool_choice > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_named_tool_choice > (schema)>)
class ChatCompletionNamedToolChoiceCustom { custom, type }
Specifies a tool the model should use. Use to force the model to call a specific custom tool.
custom: Custom{ name}
name: String
The name of the custom tool to call.
[](<#(resource) chat.completions > (model) chat_completion_named_tool_choice_custom > (schema) > (property) custom > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_named_tool_choice_custom > (schema) > (property) custom>)
type: :custom
For custom tool calling, the type is always `custom`.
[](<#(resource) chat.completions > (model) chat_completion_named_tool_choice_custom > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_named_tool_choice_custom > (schema)>)
class ChatCompletionPredictionContent { content, type }
Static predicted output content, such as the content of a text file that is
being regenerated.
content: String | Array[[ChatCompletionContentPartText](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>) { text, type } ]
The content that should be matched when generating a model response.
If generated tokens would match this content, the entire model response
can be returned much more quickly.
One of the following:
String = String
The content used for a Predicted Output. This is often the
text of a file you are regenerating with minor changes.
[](<#(resource) chat.completions > (model) chat_completion_prediction_content > (schema) > (property) content > (variant) 0>)
ArrayOfContentParts = Array[[ChatCompletionContentPartText](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>) { text, type } ]
An array of content parts with a defined type. Supported options differ based on the [model](https://platform.openai.com/docs/models) being used to generate the response. Can contain text inputs.
text: String
The text content.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) text>)
type: :text
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_prediction_content > (schema) > (property) content > (variant) 1>)
[](<#(resource) chat.completions > (model) chat_completion_prediction_content > (schema) > (property) content>)
type: :content
The type of the predicted content you want to provide. This type is
currently always `content`.
[](<#(resource) chat.completions > (model) chat_completion_prediction_content > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_prediction_content > (schema)>)
ChatCompletionRole = :developer | :system | :user | 3 more
The role of the author of a message
One of the following:
:developer
[](<#(resource) chat.completions > (model) chat_completion_role > (schema) > (member) 0>)
:system
[](<#(resource) chat.completions > (model) chat_completion_role > (schema) > (member) 1>)
:user
[](<#(resource) chat.completions > (model) chat_completion_role > (schema) > (member) 2>)
:assistant
[](<#(resource) chat.completions > (model) chat_completion_role > (schema) > (member) 3>)
:tool
[](<#(resource) chat.completions > (model) chat_completion_role > (schema) > (member) 4>)
:function
[](<#(resource) chat.completions > (model) chat_completion_role > (schema) > (member) 5>)
[](<#(resource) chat.completions > (model) chat_completion_role > (schema)>)
class ChatCompletionStoreMessage { id, content\_parts }
A chat completion message generated by the model.
id: String
The identifier of the chat message.
[](<#(resource) chat.completions > (model) chat_completion_store_message > (schema) > (entry) 1 > (property) id>)
content\_parts: Array[[ChatCompletionContentPartText](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>) { text, type } | [ChatCompletionContentPartImage](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion_content_part_image > (schema)>) { image\_url, type } ]
If a content parts array was provided, this is an array of `text` and `image\_url` parts.
Otherwise, null.
One of the following:
class ChatCompletionContentPartText { text, type }
Learn about [text inputs](https://platform.openai.com/docs/guides/text-generation).
text: String
The text content.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) text>)
type: :text
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>)
class ChatCompletionContentPartImage { image\_url, type }
Learn about [image inputs](https://platform.openai.com/docs/guides/vision).
image\_url: ImageURL{ url, detail}
url: String
Either a URL of the image or the base64 encoded image data.
formaturi
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) url>)
detail: :auto | :low | :high
Specifies the detail level of the image. Learn more in the [Vision guide](https://platform.openai.com/docs/guides/vision#low-or-high-fidelity-image-understanding).
One of the following:
:auto
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail > (member) 0>)
:low
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail > (member) 1>)
:high
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail > (member) 2>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url>)
type: :image\_url
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema)>)
[](<#(resource) chat.completions > (model) chat_completion_store_message > (schema) > (entry) 1 > (property) content_parts>)
[](<#(resource) chat.completions > (model) chat_completion_store_message > (schema)>)
class ChatCompletionStreamOptions { include\_obfuscation, include\_usage }
Options for streaming response. Only set this when you set `stream: true`.
include\_obfuscation: bool
When true, stream obfuscation will be enabled. Stream obfuscation adds
random characters to an `obfuscation` field on streaming delta events to
normalize payload sizes as a mitigation to certain side-channel attacks.
These obfuscation fields are included by default, but add a small amount
of overhead to the data stream. You can set `include\_obfuscation` to
false to optimize for bandwidth if you trust the network links between
your application and the OpenAI API.
[](<#(resource) chat.completions > (model) chat_completion_stream_options > (schema) > (property) include_obfuscation>)
include\_usage: bool
If set, an additional chunk will be streamed before the `data: [DONE]`
message. The `usage` field on this chunk shows the token usage statistics
for the entire request, and the `choices` field will always be an empty
array.
All other chunks will also include a `usage` field, but with a null
value. **NOTE:** If the stream is interrupted, you may not receive the
final usage chunk which contains the total token usage for the request.
[](<#(resource) chat.completions > (model) chat_completion_stream_options > (schema) > (property) include_usage>)
[](<#(resource) chat.completions > (model) chat_completion_stream_options > (schema)>)
class ChatCompletionSystemMessageParam { content, role, name }
Developer-provided instructions that the model should follow, regardless of
messages sent by the user. With o1 models and newer, use `developer` messages
for this purpose instead.
content: String | Array[[ChatCompletionContentPartText](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>) { text, type } ]
The contents of the system message.
One of the following:
String = String
The contents of the system message.
[](<#(resource) chat.completions > (model) chat_completion_system_message_param > (schema) > (property) content > (variant) 0>)
ArrayOfContentParts = Array[[ChatCompletionContentPartText](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>) { text, type } ]
An array of content parts with a defined type. For system messages, only type `text` is supported.
text: String
The text content.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) text>)
type: :text
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_system_message_param > (schema) > (property) content > (variant) 1>)
[](<#(resource) chat.completions > (model) chat_completion_system_message_param > (schema) > (property) content>)
role: :system
The role of the messages author, in this case `system`.
[](<#(resource) chat.completions > (model) chat_completion_system_message_param > (schema) > (property) role>)
name: String
An optional name for the participant. Provides the model information to differentiate between participants of the same role.
[](<#(resource) chat.completions > (model) chat_completion_system_message_param > (schema) > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_system_message_param > (schema)>)
class ChatCompletionTokenLogprob { token, bytes, logprob, top\_logprobs }
token: String
The token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) token>)
bytes: Array[Integer]
A list of integers representing the UTF-8 bytes representation of the token. Useful in instances where characters are represented by multiple tokens and their byte representations must be combined to generate the correct text representation. Can be `null` if there is no bytes representation for the token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) bytes>)
logprob: Float
The log probability of this token, if it is within the top 20 most likely tokens. Otherwise, the value `-9999.0` is used to signify that the token is very unlikely.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) logprob>)
top\_logprobs: Array[TopLogprob{ token, bytes, logprob}]
List of the most likely tokens and their log probability, at this token position. In rare cases, there may be fewer than the number of requested `top\_logprobs` returned.
token: String
The token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) token>)
bytes: Array[Integer]
A list of integers representing the UTF-8 bytes representation of the token. Useful in instances where characters are represented by multiple tokens and their byte representations must be combined to generate the correct text representation. Can be `null` if there is no bytes representation for the token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) bytes>)
logprob: Float
The log probability of this token, if it is within the top 20 most likely tokens. Otherwise, the value `-9999.0` is used to signify that the token is very unlikely.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) logprob>)
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs>)
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema)>)
ChatCompletionTool = [ChatCompletionFunctionTool](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion_function_tool > (schema)>) { function, type } | [ChatCompletionCustomTool](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion_custom_tool > (schema)>) { custom, type }
A function tool that can be used to generate a response.
One of the following:
class ChatCompletionFunctionTool { function, type }
A function tool that can be used to generate a response.
function: [FunctionDefinition](</api/reference/ruby/resources/$shared#(resource) $shared > (model) function_definition > (schema)>) { name, description, parameters, strict }
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema) > (property) function>)
type: :function
The type of the tool. Currently, only `function` is supported.
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema)>)
class ChatCompletionCustomTool { custom, type }
A custom tool that processes input using a specified format.
custom: Custom{ name, description, format\_}
Properties of the custom tool.
name: String
The name of the custom tool, used to identify it in tool calls.
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) name>)
description: String
Optional description of the custom tool, used to provide more context.
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) description>)
format\_: Text{ type} | Grammar{ grammar, type}
The input format for the custom tool. Default is unconstrained text.
One of the following:
class Text { type }
Unconstrained free-form text.
type: :text
Unconstrained text format. Always `text`.
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 0 > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 0>)
class Grammar { grammar, type }
A grammar defined by the user.
grammar: Grammar{ definition, syntax}
Your chosen grammar.
definition: String
The grammar definition.
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 1 > (property) grammar > (property) definition>)
syntax: :lark | :regex
The syntax of the grammar definition. One of `lark` or `regex`.
One of the following:
:lark
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 1 > (property) grammar > (property) syntax > (member) 0>)
:regex
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 1 > (property) grammar > (property) syntax > (member) 1>)
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 1 > (property) grammar > (property) syntax>)
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 1 > (property) grammar>)
type: :grammar
Grammar format. Always `grammar`.
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 1 > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 1>)
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format>)
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom>)
type: :custom
The type of the custom tool. Always `custom`.
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema)>)
[](<#(resource) chat.completions > (model) chat_completion_tool > (schema)>)
ChatCompletionToolChoiceOption = :none | :auto | :required | [ChatCompletionAllowedToolChoice](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion_allowed_tool_choice > (schema)>) { allowed\_tools, type } | [ChatCompletionNamedToolChoice](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion_named_tool_choice > (schema)>) { function, type } | [ChatCompletionNamedToolChoiceCustom](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion_named_tool_choice_custom > (schema)>) { custom, type }
Controls which (if any) tool is called by the model.
`none` means the model will not call any tool and instead generates a message.
`auto` means the model can pick between generating a message or calling one or more tools.
`required` means the model must call one or more tools.
Specifying a particular tool via `{"type": "function", "function": {"name": "my\_function"}}` forces the model to call that tool.
`none` is the default when no tools are present. `auto` is the default if tools are present.
One of the following:
Auto = :none | :auto | :required
`none` means the model will not call any tool and instead generates a message. `auto` means the model can pick between generating a message or calling one or more tools. `required` means the model must call one or more tools.
One of the following:
:none
[](<#(resource) chat.completions > (model) chat_completion_tool_choice_option > (schema) > (variant) 0 > (member) 0>)
:auto
[](<#(resource) chat.completions > (model) chat_completion_tool_choice_option > (schema) > (variant) 0 > (member) 1>)
:required
[](<#(resource) chat.completions > (model) chat_completion_tool_choice_option > (schema) > (variant) 0 > (member) 2>)
[](<#(resource) chat.completions > (model) chat_completion_tool_choice_option > (schema) > (variant) 0>)
class ChatCompletionAllowedToolChoice { allowed\_tools, type }
Constrains the tools available to the model to a pre-defined set.
allowed\_tools: [ChatCompletionAllowedTools](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) ChatCompletionAllowedTools > (schema)>) { mode, tools }
Constrains the tools available to the model to a pre-defined set.
[](<#(resource) chat.completions > (model) chat_completion_allowed_tool_choice > (schema) > (property) allowed_tools>)
type: :allowed\_tools
Allowed tool configuration type. Always `allowed\_tools`.
[](<#(resource) chat.completions > (model) chat_completion_allowed_tool_choice > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_allowed_tool_choice > (schema)>)
class ChatCompletionNamedToolChoice { function, type }
Specifies a tool the model should use. Use to force the model to call a specific function.
function: Function{ name}
name: String
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion_named_tool_choice > (schema) > (property) function > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_named_tool_choice > (schema) > (property) function>)
type: :function
For function calling, the type is always `function`.
[](<#(resource) chat.completions > (model) chat_completion_named_tool_choice > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_named_tool_choice > (schema)>)
class ChatCompletionNamedToolChoiceCustom { custom, type }
Specifies a tool the model should use. Use to force the model to call a specific custom tool.
custom: Custom{ name}
name: String
The name of the custom tool to call.
[](<#(resource) chat.completions > (model) chat_completion_named_tool_choice_custom > (schema) > (property) custom > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_named_tool_choice_custom > (schema) > (property) custom>)
type: :custom
For custom tool calling, the type is always `custom`.
[](<#(resource) chat.completions > (model) chat_completion_named_tool_choice_custom > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_named_tool_choice_custom > (schema)>)
[](<#(resource) chat.completions > (model) chat_completion_tool_choice_option > (schema)>)
class ChatCompletionToolMessageParam { content, role, tool\_call\_id }
content: String | Array[[ChatCompletionContentPartText](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>) { text, type } ]
The contents of the tool message.
One of the following:
String = String
The contents of the tool message.
[](<#(resource) chat.completions > (model) chat_completion_tool_message_param > (schema) > (property) content > (variant) 0>)
ArrayOfContentParts = Array[[ChatCompletionContentPartText](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>) { text, type } ]
An array of content parts with a defined type. For tool messages, only type `text` is supported.
text: String
The text content.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) text>)
type: :text
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_tool_message_param > (schema) > (property) content > (variant) 1>)
[](<#(resource) chat.completions > (model) chat_completion_tool_message_param > (schema) > (property) content>)
role: :tool
The role of the messages author, in this case `tool`.
[](<#(resource) chat.completions > (model) chat_completion_tool_message_param > (schema) > (property) role>)
tool\_call\_id: String
Tool call that this message is responding to.
[](<#(resource) chat.completions > (model) chat_completion_tool_message_param > (schema) > (property) tool_call_id>)
[](<#(resource) chat.completions > (model) chat_completion_tool_message_param > (schema)>)
class ChatCompletionUserMessageParam { content, role, name }
Messages sent by an end user, containing prompts or additional context
information.
content: String | Array[[ChatCompletionContentPart](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion_content_part > (schema)>)]
The contents of the user message.
One of the following:
String = String
The text contents of the message.
[](<#(resource) chat.completions > (model) chat_completion_user_message_param > (schema) > (property) content > (variant) 0>)
ArrayOfContentParts = Array[[ChatCompletionContentPart](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion_content_part > (schema)>)]
An array of content parts with a defined type. Supported options differ based on the [model](https://platform.openai.com/docs/models) being used to generate the response. Can contain text, image, or audio inputs.
One of the following:
class ChatCompletionContentPartText { text, type }
Learn about [text inputs](https://platform.openai.com/docs/guides/text-generation).
text: String
The text content.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) text>)
type: :text
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>)
class ChatCompletionContentPartImage { image\_url, type }
Learn about [image inputs](https://platform.openai.com/docs/guides/vision).
image\_url: ImageURL{ url, detail}
url: String
Either a URL of the image or the base64 encoded image data.
formaturi
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) url>)
detail: :auto | :low | :high
Specifies the detail level of the image. Learn more in the [Vision guide](https://platform.openai.com/docs/guides/vision#low-or-high-fidelity-image-understanding).
One of the following:
:auto
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail > (member) 0>)
:low
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail > (member) 1>)
:high
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail > (member) 2>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url>)
type: :image\_url
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema)>)
class ChatCompletionContentPartInputAudio { input\_audio, type }
Learn about [audio inputs](https://platform.openai.com/docs/guides/audio).
input\_audio: InputAudio{ data, format\_}
data: String
Base64 encoded audio data.
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio > (property) data>)
format\_: :wav | :mp3
The format of the encoded audio data. Currently supports “wav” and “mp3”.
One of the following:
:wav
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
:mp3
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio>)
type: :input\_audio
The type of the content part. Always `input\_audio`.
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema)>)
class File { file, type }
Learn about [file inputs](https://platform.openai.com/docs/guides/text) for text generation.
file: File{ file\_data, file\_id, filename}
file\_data: String
The base64 encoded file data, used when passing the file to the model
as a string.
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3 > (property) file > (property) file_data>)
file\_id: String
The ID of an uploaded file to use as input.
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3 > (property) file > (property) file_id>)
filename: String
The name of the file, used when passing the file to the model as a
string.
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3 > (property) file > (property) filename>)
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3 > (property) file>)
type: :file
The type of the content part. Always `file`.
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3 > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3>)
[](<#(resource) chat.completions > (model) chat_completion_user_message_param > (schema) > (property) content > (variant) 1>)
[](<#(resource) chat.completions > (model) chat_completion_user_message_param > (schema) > (property) content>)
role: :user
The role of the messages author, in this case `user`.
[](<#(resource) chat.completions > (model) chat_completion_user_message_param > (schema) > (property) role>)
name: String
An optional name for the participant. Provides the model information to differentiate between participants of the same role.
[](<#(resource) chat.completions > (model) chat_completion_user_message_param > (schema) > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_user_message_param > (schema)>)
class ChatCompletionAllowedTools { mode, tools }
Constrains the tools available to the model to a pre-defined set.
mode: :auto | :required
Constrains the tools available to the model to a pre-defined set.
`auto` allows the model to pick from among the allowed tools and generate a
message.
`required` requires the model to call one or more of the allowed tools.
One of the following:
:auto
[](<#(resource) chat.completions > (model) ChatCompletionAllowedTools > (schema) > (property) mode > (member) 0>)
:required
[](<#(resource) chat.completions > (model) ChatCompletionAllowedTools > (schema) > (property) mode > (member) 1>)
[](<#(resource) chat.completions > (model) ChatCompletionAllowedTools > (schema) > (property) mode>)
tools: Array[Hash[Symbol, untyped]]
A list of tool definitions that the model should be allowed to call.
For the Chat Completions API, the list of tool definitions might look like:
```
`[
{ "type": "function", "function": { "name": "get\_weather" } },
{ "type": "function", "function": { "name": "get\_time" } }
]`
```
[](<#(resource) chat.completions > (model) ChatCompletionAllowedTools > (schema) > (property) tools>)
[](<#(resource) chat.completions > (model) ChatCompletionAllowedTools > (schema)>)
#### CompletionsMessages
Given a list of messages comprising a conversation, the model will return a response.
##### [Get chat messages](/api/reference/ruby/resources/chat/subresources/completions/subresources/messages/methods/list)
chat.completions.messages.list(completion\_id, \*\*kwargs) -\> CursorPage\<[ChatCompletionStoreMessage](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion_store_message > (schema)>) { id, content\_parts } \>
GET/chat/completions/{completion\_id}/messages