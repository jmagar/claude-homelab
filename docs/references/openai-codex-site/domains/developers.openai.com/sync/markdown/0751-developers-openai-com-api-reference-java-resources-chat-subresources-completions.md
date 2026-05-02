Completions | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Chat](/api/reference/java/resources/chat)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Completions
Given a list of messages comprising a conversation, the model will return a response.
##### [Create chat completion](/api/reference/java/resources/chat/subresources/completions/methods/create)
[ChatCompletion](</api/reference/java/resources/chat#(resource) chat.completions > (model) chat_completion > (schema)>) chat().completions().create(ChatCompletionCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/chat/completions
##### [List Chat Completions](/api/reference/java/resources/chat/subresources/completions/methods/list)
ChatCompletionListPage chat().completions().list(ChatCompletionListParamsparams = ChatCompletionListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/chat/completions
##### [Get chat completion](/api/reference/java/resources/chat/subresources/completions/methods/retrieve)
[ChatCompletion](</api/reference/java/resources/chat#(resource) chat.completions > (model) chat_completion > (schema)>) chat().completions().retrieve(ChatCompletionRetrieveParamsparams = ChatCompletionRetrieveParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/chat/completions/{completion\_id}
##### [Update chat completion](/api/reference/java/resources/chat/subresources/completions/methods/update)
[ChatCompletion](</api/reference/java/resources/chat#(resource) chat.completions > (model) chat_completion > (schema)>) chat().completions().update(ChatCompletionUpdateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/chat/completions/{completion\_id}
##### [Delete chat completion](/api/reference/java/resources/chat/subresources/completions/methods/delete)
[ChatCompletionDeleted](</api/reference/java/resources/chat#(resource) chat.completions > (model) chat_completion_deleted > (schema)>) chat().completions().delete(ChatCompletionDeleteParamsparams = ChatCompletionDeleteParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
DELETE/chat/completions/{completion\_id}
##### ModelsExpand Collapse
class ChatCompletion:
Represents a chat completion response returned by model, based on the provided input.
String id
A unique identifier for the chat completion.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) id>)
List\<Choice\> choices
A list of chat completion choices. Can be more than one if `n` is greater than 1.
FinishReason finishReason
The reason the model stopped generating tokens. This will be `stop` if the model hit a natural stop point or a provided stop sequence,
`length` if the maximum number of tokens specified in the request was reached,
`content\_filter` if content was omitted due to a flag from our content filters,
`tool\_calls` if the model called a tool, or `function\_call` (deprecated) if the model called a function.
One of the following:
STOP("stop")
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) finish_reason > (member) 0>)
LENGTH("length")
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) finish_reason > (member) 1>)
TOOL\_CALLS("tool\_calls")
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) finish_reason > (member) 2>)
CONTENT\_FILTER("content\_filter")
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) finish_reason > (member) 3>)
FUNCTION\_CALL("function\_call")
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) finish_reason > (member) 4>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) finish_reason>)
long index
The index of the choice in the list of choices.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) index>)
Optional\<Logprobs\> logprobs
Log probability information for the choice.
Optional\<List\<[ChatCompletionTokenLogprob](</api/reference/java/resources/chat#(resource) chat.completions > (model) chat_completion_token_logprob > (schema)>)\>\> content
A list of message content tokens with log probability information.
String token
The token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) token>)
Optional\<List\<Long\>\> bytes
A list of integers representing the UTF-8 bytes representation of the token. Useful in instances where characters are represented by multiple tokens and their byte representations must be combined to generate the correct text representation. Can be `null` if there is no bytes representation for the token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) bytes>)
double logprob
The log probability of this token, if it is within the top 20 most likely tokens. Otherwise, the value `-9999.0` is used to signify that the token is very unlikely.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) logprob>)
List\<TopLogprob\> topLogprobs
List of the most likely tokens and their log probability, at this token position. In rare cases, there may be fewer than the number of requested `top\_logprobs` returned.
String token
The token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) token>)
Optional\<List\<Long\>\> bytes
A list of integers representing the UTF-8 bytes representation of the token. Useful in instances where characters are represented by multiple tokens and their byte representations must be combined to generate the correct text representation. Can be `null` if there is no bytes representation for the token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) bytes>)
double logprob
The log probability of this token, if it is within the top 20 most likely tokens. Otherwise, the value `-9999.0` is used to signify that the token is very unlikely.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) logprob>)
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) logprobs > (property) content>)
Optional\<List\<[ChatCompletionTokenLogprob](</api/reference/java/resources/chat#(resource) chat.completions > (model) chat_completion_token_logprob > (schema)>)\>\> refusal
A list of message refusal tokens with log probability information.
String token
The token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) token>)
Optional\<List\<Long\>\> bytes
A list of integers representing the UTF-8 bytes representation of the token. Useful in instances where characters are represented by multiple tokens and their byte representations must be combined to generate the correct text representation. Can be `null` if there is no bytes representation for the token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) bytes>)
double logprob
The log probability of this token, if it is within the top 20 most likely tokens. Otherwise, the value `-9999.0` is used to signify that the token is very unlikely.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) logprob>)
List\<TopLogprob\> topLogprobs
List of the most likely tokens and their log probability, at this token position. In rare cases, there may be fewer than the number of requested `top\_logprobs` returned.
String token
The token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) token>)
Optional\<List\<Long\>\> bytes
A list of integers representing the UTF-8 bytes representation of the token. Useful in instances where characters are represented by multiple tokens and their byte representations must be combined to generate the correct text representation. Can be `null` if there is no bytes representation for the token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) bytes>)
double logprob
The log probability of this token, if it is within the top 20 most likely tokens. Otherwise, the value `-9999.0` is used to signify that the token is very unlikely.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) logprob>)
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) logprobs > (property) refusal>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) logprobs>)
[ChatCompletionMessage](</api/reference/java/resources/chat#(resource) chat.completions > (model) chat_completion_message > (schema)>) message
A chat completion message generated by the model.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices>)
long created
The Unix timestamp (in seconds) of when the chat completion was created.
formatunixtime
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) created>)
String model
The model used for the chat completion.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) model>)
JsonValue; object\_ "chat.completion"constant"chat.completion"constant
The object type, which is always `chat.completion`.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) object>)
Optional\<ServiceTier\> serviceTier
Specifies the processing type used for serving the request.
* If set to ‘auto’, then the request will be processed with the service tier configured in the Project settings. Unless otherwise configured, the Project will use ‘default’.
* If set to ‘default’, then the request will be processed with the standard pricing and performance for the selected model.
* If set to ‘[flex](https://platform.openai.com/docs/guides/flex-processing)’ or ‘[priority](https://openai.com/api-priority-processing/)’, then the request will be processed with the corresponding service tier.
* When not set, the default behavior is ‘auto’.
When the `service\_tier` parameter is set, the response body will include the `service\_tier` value based on the processing mode actually used to serve the request. This response value may be different from the value set in the parameter.
One of the following:
AUTO("auto")
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) service_tier > (member) 0>)
DEFAULT("default")
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) service_tier > (member) 1>)
FLEX("flex")
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) service_tier > (member) 2>)
SCALE("scale")
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) service_tier > (member) 3>)
PRIORITY("priority")
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) service_tier > (member) 4>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) service_tier>)
DeprecatedOptional\<String\> systemFingerprint
This fingerprint represents the backend configuration that the model runs with.
Can be used in conjunction with the `seed` request parameter to understand when backend changes have been made that might impact determinism.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) system_fingerprint>)
Optional\<[CompletionUsage](</api/reference/java/resources/completions#(resource) completions > (model) completion_usage > (schema)>)\> usage
Usage statistics for the completion request.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage>)
[](<#(resource) chat.completions > (model) chat_completion > (schema)>)
class ChatCompletionAllowedToolChoice:
Constrains the tools available to the model to a pre-defined set.
[ChatCompletionAllowedTools](</api/reference/java/resources/chat#(resource) chat.completions > (model) ChatCompletionAllowedTools > (schema)>) allowedTools
Constrains the tools available to the model to a pre-defined set.
[](<#(resource) chat.completions > (model) chat_completion_allowed_tool_choice > (schema) > (property) allowed_tools>)
JsonValue; type "allowed\_tools"constant"allowed\_tools"constant
Allowed tool configuration type. Always `allowed\_tools`.
[](<#(resource) chat.completions > (model) chat_completion_allowed_tool_choice > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_allowed_tool_choice > (schema)>)
class ChatCompletionAssistantMessageParam:
Messages sent by the model in response to user messages.
JsonValue; role "assistant"constant"assistant"constant
The role of the messages author, in this case `assistant`.
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) role>)
Optional\<Audio\> audio
Data about a previous audio response from the model.
[Learn more](https://platform.openai.com/docs/guides/audio).
String id
Unique identifier for a previous audio response from the model.
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) audio > (property) id>)
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) audio>)
Optional\<Content\> content
The contents of the assistant message. Required unless `tool\_calls` or `function\_call` is specified.
One of the following:
String
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) content > (variant) 0>)
List\<ChatCompletionRequestAssistantMessageContentPart\>
One of the following:
class ChatCompletionContentPartText:
Learn about [text inputs](https://platform.openai.com/docs/guides/text-generation).
String text
The text content.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) text>)
JsonValue; type "text"constant"text"constant
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>)
class ChatCompletionContentPartRefusal:
String refusal
The refusal message generated by the model.
[](<#(resource) chat.completions > (model) chat_completion_content_part_refusal > (schema) > (property) refusal>)
JsonValue; type "refusal"constant"refusal"constant
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_refusal > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_refusal > (schema)>)
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) content > (variant) 1>)
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) content>)
DeprecatedOptional\<FunctionCall\> functionCall
Deprecated and replaced by `tool\_calls`. The name and arguments of a function that should be called, as generated by the model.
String arguments
The arguments to call the function with, as generated by the model in JSON format. Note that the model does not always generate valid JSON, and may hallucinate parameters not defined by your function schema. Validate the arguments in your code before calling your function.
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) function_call > (property) arguments>)
String name
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) function_call > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) function_call>)
Optional\<String\> name
An optional name for the participant. Provides the model information to differentiate between participants of the same role.
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) name>)
Optional\<String\> refusal
The refusal message by the assistant.
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) refusal>)
Optional\<List\<[ChatCompletionMessageToolCall](</api/reference/java/resources/chat#(resource) chat.completions > (model) chat_completion_message_tool_call > (schema)>)\>\> toolCalls
The tool calls generated by the model, such as function calls.
One of the following:
class ChatCompletionMessageFunctionToolCall:
A call to a function tool created by the model.
String id
The ID of the tool call.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) id>)
Function function
The function that the model called.
String arguments
The arguments to call the function with, as generated by the model in JSON format. Note that the model does not always generate valid JSON, and may hallucinate parameters not defined by your function schema. Validate the arguments in your code before calling your function.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function > (property) arguments>)
String name
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function>)
JsonValue; type "function"constant"function"constant
The type of the tool. Currently, only `function` is supported.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema)>)
class ChatCompletionMessageCustomToolCall:
A call to a custom tool created by the model.
String id
The ID of the tool call.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) id>)
Custom custom
The custom tool that the model called.
String input
The input for the custom tool call generated by the model.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom > (property) input>)
String name
The name of the custom tool to call.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom>)
JsonValue; type "custom"constant"custom"constant
The type of the tool. Always `custom`.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema)>)
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) tool_calls>)
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema)>)
class ChatCompletionAudio:
If the audio output modality is requested, this object contains data
about the audio response from the model. [Learn more](https://platform.openai.com/docs/guides/audio).
String id
Unique identifier for this audio response.
[](<#(resource) chat.completions > (model) chat_completion_audio > (schema) > (property) id>)
String data
Base64 encoded audio bytes generated by the model, in the format
specified in the request.
[](<#(resource) chat.completions > (model) chat_completion_audio > (schema) > (property) data>)
long expiresAt
The Unix timestamp (in seconds) for when this audio response will
no longer be accessible on the server for use in multi-turn
conversations.
formatunixtime
[](<#(resource) chat.completions > (model) chat_completion_audio > (schema) > (property) expires_at>)
String transcript
Transcript of the audio generated by the model.
[](<#(resource) chat.completions > (model) chat_completion_audio > (schema) > (property) transcript>)
[](<#(resource) chat.completions > (model) chat_completion_audio > (schema)>)
class ChatCompletionAudioParam:
Parameters for audio output. Required when audio output is requested with
`modalities: ["audio"]`. [Learn more](https://platform.openai.com/docs/guides/audio).
Format format
Specifies the output audio format. Must be one of `wav`, `mp3`, `flac`,
`opus`, or `pcm16`.
One of the following:
WAV("wav")
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) format > (member) 0>)
AAC("aac")
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) format > (member) 1>)
MP3("mp3")
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) format > (member) 2>)
FLAC("flac")
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) format > (member) 3>)
OPUS("opus")
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) format > (member) 4>)
PCM16("pcm16")
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) format > (member) 5>)
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) format>)
Voice voice
The voice the model uses to respond. Supported built-in voices are
`alloy`, `ash`, `ballad`, `coral`, `echo`, `fable`, `nova`, `onyx`,
`sage`, `shimmer`, `marin`, and `cedar`. You may also provide a
custom voice object with an `id`, for example `{ "id": "voice\_1234" }`.
One of the following:
String
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 0>)
enum UnionMember1:
ALLOY("alloy")
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 1 > (member) 0>)
ASH("ash")
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 1 > (member) 1>)
BALLAD("ballad")
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 1 > (member) 2>)
CORAL("coral")
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 1 > (member) 3>)
ECHO("echo")
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 1 > (member) 4>)
SAGE("sage")
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 1 > (member) 5>)
SHIMMER("shimmer")
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 1 > (member) 6>)
VERSE("verse")
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 1 > (member) 7>)
MARIN("marin")
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 1 > (member) 8>)
CEDAR("cedar")
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 1 > (member) 9>)
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 1>)
class Id:
Custom voice reference.
String id
The custom voice ID, e.g. `voice\_1234`.
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 2 > (property) id>)
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 2>)
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice>)
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema)>)
class ChatCompletionChunk:
Represents a streamed chunk of a chat completion response returned
by the model, based on the provided input.
[Learn more](https://platform.openai.com/docs/guides/streaming-responses).
String id
A unique identifier for the chat completion. Each chunk has the same ID.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) id>)
List\<Choice\> choices
A list of chat completion choices. Can contain more than one elements if `n` is greater than 1. Can also be empty for the
last chunk if you set `stream\_options: {"include\_usage": true}`.
Delta delta
A chat completion delta generated by streamed model responses.
Optional\<String\> content
The contents of the chunk message.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta > (property) content>)
DeprecatedOptional\<FunctionCall\> functionCall
Deprecated and replaced by `tool\_calls`. The name and arguments of a function that should be called, as generated by the model.
Optional\<String\> arguments
The arguments to call the function with, as generated by the model in JSON format. Note that the model does not always generate valid JSON, and may hallucinate parameters not defined by your function schema. Validate the arguments in your code before calling your function.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta > (property) function_call > (property) arguments>)
Optional\<String\> name
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta > (property) function_call > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta > (property) function_call>)
Optional\<String\> refusal
The refusal message generated by the model.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta > (property) refusal>)
Optional\<Role\> role
The role of the author of this message.
One of the following:
DEVELOPER("developer")
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta > (property) role > (member) 0>)
SYSTEM("system")
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta > (property) role > (member) 1>)
USER("user")
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta > (property) role > (member) 2>)
ASSISTANT("assistant")
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta > (property) role > (member) 3>)
TOOL("tool")
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta > (property) role > (member) 4>)
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta > (property) role>)
Optional\<List\<ToolCall\>\> toolCalls
long index
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta > (property) tool_calls > (items) > (property) index>)
Optional\<String\> id
The ID of the tool call.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta > (property) tool_calls > (items) > (property) id>)
Optional\<Function\> function
Optional\<String\> arguments
The arguments to call the function with, as generated by the model in JSON format. Note that the model does not always generate valid JSON, and may hallucinate parameters not defined by your function schema. Validate the arguments in your code before calling your function.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta > (property) tool_calls > (items) > (property) function > (property) arguments>)
Optional\<String\> name
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta > (property) tool_calls > (items) > (property) function > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta > (property) tool_calls > (items) > (property) function>)
Optional\<Type\> type
The type of the tool. Currently, only `function` is supported.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta > (property) tool_calls > (items) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta > (property) tool_calls>)
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta>)
Optional\<FinishReason\> finishReason
The reason the model stopped generating tokens. This will be `stop` if the model hit a natural stop point or a provided stop sequence,
`length` if the maximum number of tokens specified in the request was reached,
`content\_filter` if content was omitted due to a flag from our content filters,
`tool\_calls` if the model called a tool, or `function\_call` (deprecated) if the model called a function.
One of the following:
STOP("stop")
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) finish_reason > (member) 0>)
LENGTH("length")
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) finish_reason > (member) 1>)
TOOL\_CALLS("tool\_calls")
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) finish_reason > (member) 2>)
CONTENT\_FILTER("content\_filter")
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) finish_reason > (member) 3>)
FUNCTION\_CALL("function\_call")
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) finish_reason > (member) 4>)
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) finish_reason>)
long index
The index of the choice in the list of choices.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) index>)
Optional\<Logprobs\> logprobs
Log probability information for the choice.
Optional\<List\<[ChatCompletionTokenLogprob](</api/reference/java/resources/chat#(resource) chat.completions > (model) chat_completion_token_logprob > (schema)>)\>\> content
A list of message content tokens with log probability information.
String token
The token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) token>)
Optional\<List\<Long\>\> bytes
A list of integers representing the UTF-8 bytes representation of the token. Useful in instances where characters are represented by multiple tokens and their byte representations must be combined to generate the correct text representation. Can be `null` if there is no bytes representation for the token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) bytes>)
double logprob
The log probability of this token, if it is within the top 20 most likely tokens. Otherwise, the value `-9999.0` is used to signify that the token is very unlikely.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) logprob>)
List\<TopLogprob\> topLogprobs
List of the most likely tokens and their log probability, at this token position. In rare cases, there may be fewer than the number of requested `top\_logprobs` returned.
String token
The token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) token>)
Optional\<List\<Long\>\> bytes
A list of integers representing the UTF-8 bytes representation of the token. Useful in instances where characters are represented by multiple tokens and their byte representations must be combined to generate the correct text representation. Can be `null` if there is no bytes representation for the token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) bytes>)
double logprob
The log probability of this token, if it is within the top 20 most likely tokens. Otherwise, the value `-9999.0` is used to signify that the token is very unlikely.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) logprob>)
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs>)
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) logprobs > (property) content>)
Optional\<List\<[ChatCompletionTokenLogprob](</api/reference/java/resources/chat#(resource) chat.completions > (model) chat_completion_token_logprob > (schema)>)\>\> refusal
A list of message refusal tokens with log probability information.
String token
The token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) token>)
Optional\<List\<Long\>\> bytes
A list of integers representing the UTF-8 bytes representation of the token. Useful in instances where characters are represented by multiple tokens and their byte representations must be combined to generate the correct text representation. Can be `null` if there is no bytes representation for the token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) bytes>)
double logprob
The log probability of this token, if it is within the top 20 most likely tokens. Otherwise, the value `-9999.0` is used to signify that the token is very unlikely.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) logprob>)
List\<TopLogprob\> topLogprobs
List of the most likely tokens and their log probability, at this token position. In rare cases, there may be fewer than the number of requested `top\_logprobs` returned.
String token
The token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) token>)
Optional\<List\<Long\>\> bytes
A list of integers representing the UTF-8 bytes representation of the token. Useful in instances where characters are represented by multiple tokens and their byte representations must be combined to generate the correct text representation. Can be `null` if there is no bytes representation for the token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) bytes>)
double logprob
The log probability of this token, if it is within the top 20 most likely tokens. Otherwise, the value `-9999.0` is used to signify that the token is very unlikely.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) logprob>)
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs>)
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) logprobs > (property) refusal>)
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) logprobs>)
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices>)
long created
The Unix timestamp (in seconds) of when the chat completion was created. Each chunk has the same timestamp.
formatunixtime
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) created>)
String model
The model to generate the completion.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) model>)
JsonValue; object\_ "chat.completion.chunk"constant"chat.completion.chunk"constant
The object type, which is always `chat.completion.chunk`.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) object>)
Optional\<ServiceTier\> serviceTier
Specifies the processing type used for serving the request.
* If set to ‘auto’, then the request will be processed with the service tier configured in the Project settings. Unless otherwise configured, the Project will use ‘default’.
* If set to ‘default’, then the request will be processed with the standard pricing and performance for the selected model.
* If set to ‘[flex](https://platform.openai.com/docs/guides/flex-processing)’ or ‘[priority](https://openai.com/api-priority-processing/)’, then the request will be processed with the corresponding service tier.
* When not set, the default behavior is ‘auto’.
When the `service\_tier` parameter is set, the response body will include the `service\_tier` value based on the processing mode actually used to serve the request. This response value may be different from the value set in the parameter.
One of the following:
AUTO("auto")
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) service_tier > (member) 0>)
DEFAULT("default")
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) service_tier > (member) 1>)
FLEX("flex")
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) service_tier > (member) 2>)
SCALE("scale")
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) service_tier > (member) 3>)
PRIORITY("priority")
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) service_tier > (member) 4>)
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) service_tier>)
DeprecatedOptional\<String\> systemFingerprint
This fingerprint represents the backend configuration that the model runs with.
Can be used in conjunction with the `seed` request parameter to understand when backend changes have been made that might impact determinism.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) system_fingerprint>)
Optional\<[CompletionUsage](</api/reference/java/resources/completions#(resource) completions > (model) completion_usage > (schema)>)\> usage
An optional field that will only be present when you set
`stream\_options: {"include\_usage": true}` in your request. When present, it
contains a null value **except for the last chunk** which contains the
token usage statistics for the entire request.
**NOTE:** If the stream is interrupted or cancelled, you may not
receive the final usage chunk which contains the total token usage for
the request.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) usage>)
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema)>)
class ChatCompletionContentPart: A class that can be one of several variants.union
Learn about [text inputs](https://platform.openai.com/docs/guides/text-generation).
class ChatCompletionContentPartText:
Learn about [text inputs](https://platform.openai.com/docs/guides/text-generation).
String text
The text content.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) text>)
JsonValue; type "text"constant"text"constant
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>)
class ChatCompletionContentPartImage:
Learn about [image inputs](https://platform.openai.com/docs/guides/vision).
ImageUrl imageUrl
String url
Either a URL of the image or the base64 encoded image data.
formaturi
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) url>)
Optional\<Detail\> detail
Specifies the detail level of the image. Learn more in the [Vision guide](https://platform.openai.com/docs/guides/vision#low-or-high-fidelity-image-understanding).
One of the following:
AUTO("auto")
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail > (member) 0>)
LOW("low")
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail > (member) 1>)
HIGH("high")
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail > (member) 2>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url>)
JsonValue; type "image\_url"constant"image\_url"constant
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema)>)
class ChatCompletionContentPartInputAudio:
Learn about [audio inputs](https://platform.openai.com/docs/guides/audio).
InputAudio inputAudio
String data
Base64 encoded audio data.
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio > (property) data>)
Format format
The format of the encoded audio data. Currently supports “wav” and “mp3”.
One of the following:
WAV("wav")
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
MP3("mp3")
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio>)
JsonValue; type "input\_audio"constant"input\_audio"constant
The type of the content part. Always `input\_audio`.
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema)>)
File
FileObject file
Optional\<String\> fileData
The base64 encoded file data, used when passing the file to the model
as a string.
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3 > (property) file > (property) file_data>)
Optional\<String\> fileId
The ID of an uploaded file to use as input.
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3 > (property) file > (property) file_id>)
Optional\<String\> filename
The name of the file, used when passing the file to the model as a
string.
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3 > (property) file > (property) filename>)
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3 > (property) file>)
JsonValue; type "file"constant"file"constant
The type of the content part. Always `file`.
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3 > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3>)
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema)>)
class ChatCompletionContentPartImage:
Learn about [image inputs](https://platform.openai.com/docs/guides/vision).
ImageUrl imageUrl
String url
Either a URL of the image or the base64 encoded image data.
formaturi
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) url>)
Optional\<Detail\> detail
Specifies the detail level of the image. Learn more in the [Vision guide](https://platform.openai.com/docs/guides/vision#low-or-high-fidelity-image-understanding).
One of the following:
AUTO("auto")
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail > (member) 0>)
LOW("low")
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail > (member) 1>)
HIGH("high")
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail > (member) 2>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url>)
JsonValue; type "image\_url"constant"image\_url"constant
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema)>)
class ChatCompletionContentPartInputAudio:
Learn about [audio inputs](https://platform.openai.com/docs/guides/audio).
InputAudio inputAudio
String data
Base64 encoded audio data.
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio > (property) data>)
Format format
The format of the encoded audio data. Currently supports “wav” and “mp3”.
One of the following:
WAV("wav")
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
MP3("mp3")
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio>)
JsonValue; type "input\_audio"constant"input\_audio"constant
The type of the content part. Always `input\_audio`.
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema)>)
class ChatCompletionContentPartRefusal:
String refusal
The refusal message generated by the model.
[](<#(resource) chat.completions > (model) chat_completion_content_part_refusal > (schema) > (property) refusal>)
JsonValue; type "refusal"constant"refusal"constant
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_refusal > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_refusal > (schema)>)
class ChatCompletionContentPartText:
Learn about [text inputs](https://platform.openai.com/docs/guides/text-generation).
String text
The text content.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) text>)
JsonValue; type "text"constant"text"constant
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>)
class ChatCompletionCustomTool:
A custom tool that processes input using a specified format.
Custom custom
Properties of the custom tool.
String name
The name of the custom tool, used to identify it in tool calls.
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) name>)
Optional\<String\> description
Optional description of the custom tool, used to provide more context.
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) description>)
Optional\<Format\> format
The input format for the custom tool. Default is unconstrained text.
One of the following:
JsonValue;
JsonValue; type "text"constant"text"constant
Unconstrained text format. Always `text`.
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 0 > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 0>)
class Grammar:
A grammar defined by the user.
InnerGrammar grammar
Your chosen grammar.
String definition
The grammar definition.
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 1 > (property) grammar > (property) definition>)
Syntax syntax
The syntax of the grammar definition. One of `lark` or `regex`.
One of the following:
LARK("lark")
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 1 > (property) grammar > (property) syntax > (member) 0>)
REGEX("regex")
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 1 > (property) grammar > (property) syntax > (member) 1>)
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 1 > (property) grammar > (property) syntax>)
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 1 > (property) grammar>)
JsonValue; type "grammar"constant"grammar"constant
Grammar format. Always `grammar`.
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 1 > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 1>)
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format>)
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom>)
JsonValue; type "custom"constant"custom"constant
The type of the custom tool. Always `custom`.
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema)>)
class ChatCompletionDeleted:
String id
The ID of the chat completion that was deleted.
[](<#(resource) chat.completions > (model) chat_completion_deleted > (schema) > (property) id>)
boolean deleted
Whether the chat completion was deleted.
[](<#(resource) chat.completions > (model) chat_completion_deleted > (schema) > (property) deleted>)
JsonValue; object\_ "chat.completion.deleted"constant"chat.completion.deleted"constant
The type of object being deleted.
[](<#(resource) chat.completions > (model) chat_completion_deleted > (schema) > (property) object>)
[](<#(resource) chat.completions > (model) chat_completion_deleted > (schema)>)
class ChatCompletionDeveloperMessageParam:
Developer-provided instructions that the model should follow, regardless of
messages sent by the user. With o1 models and newer, `developer` messages
replace the previous `system` messages.
Content content
The contents of the developer message.
One of the following:
String
[](<#(resource) chat.completions > (model) chat_completion_developer_message_param > (schema) > (property) content > (variant) 0>)
List\<[ChatCompletionContentPartText](</api/reference/java/resources/chat#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>)\>
String text
The text content.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) text>)
JsonValue; type "text"constant"text"constant
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_developer_message_param > (schema) > (property) content > (variant) 1>)
[](<#(resource) chat.completions > (model) chat_completion_developer_message_param > (schema) > (property) content>)
JsonValue; role "developer"constant"developer"constant
The role of the messages author, in this case `developer`.
[](<#(resource) chat.completions > (model) chat_completion_developer_message_param > (schema) > (property) role>)
Optional\<String\> name
An optional name for the participant. Provides the model information to differentiate between participants of the same role.
[](<#(resource) chat.completions > (model) chat_completion_developer_message_param > (schema) > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_developer_message_param > (schema)>)
class ChatCompletionFunctionCallOption:
Specifying a particular function via `{"name": "my\_function"}` forces the model to call that function.
String name
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion_function_call_option > (schema) > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_function_call_option > (schema)>)
class ChatCompletionFunctionMessageParam:
Optional\<String\> content
The contents of the function message.
[](<#(resource) chat.completions > (model) chat_completion_function_message_param > (schema) > (property) content>)
String name
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion_function_message_param > (schema) > (property) name>)
JsonValue; role "function"constant"function"constant
The role of the messages author, in this case `function`.
[](<#(resource) chat.completions > (model) chat_completion_function_message_param > (schema) > (property) role>)
[](<#(resource) chat.completions > (model) chat_completion_function_message_param > (schema)>)
class ChatCompletionFunctionTool:
A function tool that can be used to generate a response.
[FunctionDefinition](</api/reference/java/resources/$shared#(resource) $shared > (model) function_definition > (schema)>) function
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema) > (property) function>)
JsonValue; type "function"constant"function"constant
The type of the tool. Currently, only `function` is supported.
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema)>)
class ChatCompletionMessage:
A chat completion message generated by the model.
Optional\<String\> content
The contents of the message.
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) content>)
Optional\<String\> refusal
The refusal message generated by the model.
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) refusal>)
JsonValue; role "assistant"constant"assistant"constant
The role of the author of this message.
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) role>)
Optional\<List\<Annotation\>\> annotations
Annotations for the message, when applicable, as when using the
[web search tool](https://platform.openai.com/docs/guides/tools-web-search?api-mode=chat).
JsonValue; type "url\_citation"constant"url\_citation"constant
The type of the URL citation. Always `url\_citation`.
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) annotations > (items) > (property) type>)
UrlCitation urlCitation
A URL citation when using web search.
long endIndex
The index of the last character of the URL citation in the message.
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) annotations > (items) > (property) url_citation > (property) end_index>)
long startIndex
The index of the first character of the URL citation in the message.
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) annotations > (items) > (property) url_citation > (property) start_index>)
String title
The title of the web resource.
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) annotations > (items) > (property) url_citation > (property) title>)
String url
The URL of the web resource.
formaturi
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) annotations > (items) > (property) url_citation > (property) url>)
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) annotations > (items) > (property) url_citation>)
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) annotations>)
Optional\<[ChatCompletionAudio](</api/reference/java/resources/chat#(resource) chat.completions > (model) chat_completion_audio > (schema)>)\> audio
If the audio output modality is requested, this object contains data
about the audio response from the model. [Learn more](https://platform.openai.com/docs/guides/audio).
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) audio>)
DeprecatedOptional\<FunctionCall\> functionCall
Deprecated and replaced by `tool\_calls`. The name and arguments of a function that should be called, as generated by the model.
String arguments
The arguments to call the function with, as generated by the model in JSON format. Note that the model does not always generate valid JSON, and may hallucinate parameters not defined by your function schema. Validate the arguments in your code before calling your function.
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) function_call > (property) arguments>)
String name
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) function_call > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) function_call>)
Optional\<List\<[ChatCompletionMessageToolCall](</api/reference/java/resources/chat#(resource) chat.completions > (model) chat_completion_message_tool_call > (schema)>)\>\> toolCalls
The tool calls generated by the model, such as function calls.
One of the following:
class ChatCompletionMessageFunctionToolCall:
A call to a function tool created by the model.
String id
The ID of the tool call.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) id>)
Function function
The function that the model called.
String arguments
The arguments to call the function with, as generated by the model in JSON format. Note that the model does not always generate valid JSON, and may hallucinate parameters not defined by your function schema. Validate the arguments in your code before calling your function.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function > (property) arguments>)
String name
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function>)
JsonValue; type "function"constant"function"constant
The type of the tool. Currently, only `function` is supported.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema)>)
class ChatCompletionMessageCustomToolCall:
A call to a custom tool created by the model.
String id
The ID of the tool call.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) id>)
Custom custom
The custom tool that the model called.
String input
The input for the custom tool call generated by the model.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom > (property) input>)
String name
The name of the custom tool to call.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom>)
JsonValue; type "custom"constant"custom"constant
The type of the tool. Always `custom`.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema)>)
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) tool_calls>)
[](<#(resource) chat.completions > (model) chat_completion_message > (schema)>)
class ChatCompletionMessageCustomToolCall:
A call to a custom tool created by the model.
String id
The ID of the tool call.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) id>)
Custom custom
The custom tool that the model called.
String input
The input for the custom tool call generated by the model.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom > (property) input>)
String name
The name of the custom tool to call.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom>)
JsonValue; type "custom"constant"custom"constant
The type of the tool. Always `custom`.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema)>)
class ChatCompletionMessageFunctionToolCall:
A call to a function tool created by the model.
String id
The ID of the tool call.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) id>)
Function function
The function that the model called.
String arguments
The arguments to call the function with, as generated by the model in JSON format. Note that the model does not always generate valid JSON, and may hallucinate parameters not defined by your function schema. Validate the arguments in your code before calling your function.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function > (property) arguments>)
String name
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function>)
JsonValue; type "function"constant"function"constant
The type of the tool. Currently, only `function` is supported.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema)>)
class ChatCompletionMessageParam: A class that can be one of several variants.union
Developer-provided instructions that the model should follow, regardless of
messages sent by the user. With o1 models and newer, `developer` messages
replace the previous `system` messages.
class ChatCompletionDeveloperMessageParam:
Developer-provided instructions that the model should follow, regardless of
messages sent by the user. With o1 models and newer, `developer` messages
replace the previous `system` messages.
Content content
The contents of the developer message.
One of the following:
String
[](<#(resource) chat.completions > (model) chat_completion_developer_message_param > (schema) > (property) content > (variant) 0>)
List\<[ChatCompletionContentPartText](</api/reference/java/resources/chat#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>)\>
String text
The text content.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) text>)
JsonValue; type "text"constant"text"constant
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_developer_message_param > (schema) > (property) content > (variant) 1>)
[](<#(resource) chat.completions > (model) chat_completion_developer_message_param > (schema) > (property) content>)
JsonValue; role "developer"constant"developer"constant
The role of the messages author, in this case `developer`.
[](<#(resource) chat.completions > (model) chat_completion_developer_message_param > (schema) > (property) role>)
Optional\<String\> name
An optional name for the participant. Provides the model information to differentiate between participants of the same role.
[](<#(resource) chat.completions > (model) chat_completion_developer_message_param > (schema) > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_developer_message_param > (schema)>)
class ChatCompletionSystemMessageParam:
Developer-provided instructions that the model should follow, regardless of
messages sent by the user. With o1 models and newer, use `developer` messages
for this purpose instead.
Content content
The contents of the system message.
One of the following:
String
[](<#(resource) chat.completions > (model) chat_completion_system_message_param > (schema) > (property) content > (variant) 0>)
List\<[ChatCompletionContentPartText](</api/reference/java/resources/chat#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>)\>
String text
The text content.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) text>)
JsonValue; type "text"constant"text"constant
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_system_message_param > (schema) > (property) content > (variant) 1>)
[](<#(resource) chat.completions > (model) chat_completion_system_message_param > (schema) > (property) content>)
JsonValue; role "system"constant"system"constant
The role of the messages author, in this case `system`.
[](<#(resource) chat.completions > (model) chat_completion_system_message_param > (schema) > (property) role>)
Optional\<String\> name
An optional name for the participant. Provides the model information to differentiate between participants of the same role.
[](<#(resource) chat.completions > (model) chat_completion_system_message_param > (schema) > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_system_message_param > (schema)>)
class ChatCompletionUserMessageParam:
Messages sent by an end user, containing prompts or additional context
information.
Content content
The contents of the user message.
One of the following:
String
[](<#(resource) chat.completions > (model) chat_completion_user_message_param > (schema) > (property) content > (variant) 0>)
List\<[ChatCompletionContentPart](</api/reference/java/resources/chat#(resource) chat.completions > (model) chat_completion_content_part > (schema)>)\>
One of the following:
class ChatCompletionContentPartText:
Learn about [text inputs](https://platform.openai.com/docs/guides/text-generation).
String text
The text content.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) text>)
JsonValue; type "text"constant"text"constant
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>)
class ChatCompletionContentPartImage:
Learn about [image inputs](https://platform.openai.com/docs/guides/vision).
ImageUrl imageUrl
String url
Either a URL of the image or the base64 encoded image data.
formaturi
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) url>)
Optional\<Detail\> detail
Specifies the detail level of the image. Learn more in the [Vision guide](https://platform.openai.com/docs/guides/vision#low-or-high-fidelity-image-understanding).
One of the following:
AUTO("auto")
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail > (member) 0>)
LOW("low")
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail > (member) 1>)
HIGH("high")
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail > (member) 2>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url>)
JsonValue; type "image\_url"constant"image\_url"constant
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema)>)
class ChatCompletionContentPartInputAudio:
Learn about [audio inputs](https://platform.openai.com/docs/guides/audio).
InputAudio inputAudio
String data
Base64 encoded audio data.
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio > (property) data>)
Format format
The format of the encoded audio data. Currently supports “wav” and “mp3”.
One of the following:
WAV("wav")
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
MP3("mp3")
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio>)
JsonValue; type "input\_audio"constant"input\_audio"constant
The type of the content part. Always `input\_audio`.
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema)>)
File
FileObject file
Optional\<String\> fileData
The base64 encoded file data, used when passing the file to the model
as a string.
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3 > (property) file > (property) file_data>)
Optional\<String\> fileId
The ID of an uploaded file to use as input.
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3 > (property) file > (property) file_id>)
Optional\<String\> filename
The name of the file, used when passing the file to the model as a
string.
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3 > (property) file > (property) filename>)
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3 > (property) file>)
JsonValue; type "file"constant"file"constant
The type of the content part. Always `file`.
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3 > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3>)
[](<#(resource) chat.completions > (model) chat_completion_user_message_param > (schema) > (property) content > (variant) 1>)
[](<#(resource) chat.completions > (model) chat_completion_user_message_param > (schema) > (property) content>)
JsonValue; role "user"constant"user"constant
The role of the messages author, in this case `user`.
[](<#(resource) chat.completions > (model) chat_completion_user_message_param > (schema) > (property) role>)
Optional\<String\> name
An optional name for the participant. Provides the model information to differentiate between participants of the same role.
[](<#(resource) chat.completions > (model) chat_completion_user_message_param > (schema) > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_user_message_param > (schema)>)
class ChatCompletionAssistantMessageParam:
Messages sent by the model in response to user messages.
JsonValue; role "assistant"constant"assistant"constant
The role of the messages author, in this case `assistant`.
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) role>)
Optional\<Audio\> audio
Data about a previous audio response from the model.
[Learn more](https://platform.openai.com/docs/guides/audio).
String id
Unique identifier for a previous audio response from the model.
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) audio > (property) id>)
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) audio>)
Optional\<Content\> content
The contents of the assistant message. Required unless `tool\_calls` or `function\_call` is specified.
One of the following:
String
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) content > (variant) 0>)
List\<ChatCompletionRequestAssistantMessageContentPart\>
One of the following:
class ChatCompletionContentPartText:
Learn about [text inputs](https://platform.openai.com/docs/guides/text-generation).
String text
The text content.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) text>)
JsonValue; type "text"constant"text"constant
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>)
class ChatCompletionContentPartRefusal:
String refusal
The refusal message generated by the model.
[](<#(resource) chat.completions > (model) chat_completion_content_part_refusal > (schema) > (property) refusal>)
JsonValue; type "refusal"constant"refusal"constant
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_refusal > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_refusal > (schema)>)
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) content > (variant) 1>)
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) content>)
DeprecatedOptional\<FunctionCall\> functionCall
Deprecated and replaced by `tool\_calls`. The name and arguments of a function that should be called, as generated by the model.
String arguments
The arguments to call the function with, as generated by the model in JSON format. Note that the model does not always generate valid JSON, and may hallucinate parameters not defined by your function schema. Validate the arguments in your code before calling your function.
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) function_call > (property) arguments>)
String name
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) function_call > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) function_call>)
Optional\<String\> name
An optional name for the participant. Provides the model information to differentiate between participants of the same role.
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) name>)
Optional\<String\> refusal
The refusal message by the assistant.
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) refusal>)
Optional\<List\<[ChatCompletionMessageToolCall](</api/reference/java/resources/chat#(resource) chat.completions > (model) chat_completion_message_tool_call > (schema)>)\>\> toolCalls
The tool calls generated by the model, such as function calls.
One of the following:
class ChatCompletionMessageFunctionToolCall:
A call to a function tool created by the model.
String id
The ID of the tool call.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) id>)
Function function
The function that the model called.
String arguments
The arguments to call the function with, as generated by the model in JSON format. Note that the model does not always generate valid JSON, and may hallucinate parameters not defined by your function schema. Validate the arguments in your code before calling your function.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function > (property) arguments>)
String name
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function>)
JsonValue; type "function"constant"function"constant
The type of the tool. Currently, only `function` is supported.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema)>)
class ChatCompletionMessageCustomToolCall:
A call to a custom tool created by the model.
String id
The ID of the tool call.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) id>)
Custom custom
The custom tool that the model called.
String input
The input for the custom tool call generated by the model.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom > (property) input>)
String name
The name of the custom tool to call.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom>)
JsonValue; type "custom"constant"custom"constant
The type of the tool. Always `custom`.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema)>)
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) tool_calls>)
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema)>)
class ChatCompletionToolMessageParam:
Content content
The contents of the tool message.
One of the following:
String
[](<#(resource) chat.completions > (model) chat_completion_tool_message_param > (schema) > (property) content > (variant) 0>)
List\<[ChatCompletionContentPartText](</api/reference/java/resources/chat#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>)\>
String text
The text content.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) text>)
JsonValue; type "text"constant"text"constant
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_tool_message_param > (schema) > (property) content > (variant) 1>)
[](<#(resource) chat.completions > (model) chat_completion_tool_message_param > (schema) > (property) content>)
JsonValue; role "tool"constant"tool"constant
The role of the messages author, in this case `tool`.
[](<#(resource) chat.completions > (model) chat_completion_tool_message_param > (schema) > (property) role>)
String toolCallId
Tool call that this message is responding to.
[](<#(resource) chat.completions > (model) chat_completion_tool_message_param > (schema) > (property) tool_call_id>)
[](<#(resource) chat.completions > (model) chat_completion_tool_message_param > (schema)>)
class ChatCompletionFunctionMessageParam:
Optional\<String\> content
The contents of the function message.
[](<#(resource) chat.completions > (model) chat_completion_function_message_param > (schema) > (property) content>)
String name
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion_function_message_param > (schema) > (property) name>)
JsonValue; role "function"constant"function"constant
The role of the messages author, in this case `function`.
[](<#(resource) chat.completions > (model) chat_completion_function_message_param > (schema) > (property) role>)
[](<#(resource) chat.completions > (model) chat_completion_function_message_param > (schema)>)
[](<#(resource) chat.completions > (model) chat_completion_message_param > (schema)>)
class ChatCompletionMessageToolCall: A class that can be one of several variants.union
A call to a function tool created by the model.
class ChatCompletionMessageFunctionToolCall:
A call to a function tool created by the model.
String id
The ID of the tool call.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) id>)
Function function
The function that the model called.
String arguments
The arguments to call the function with, as generated by the model in JSON format. Note that the model does not always generate valid JSON, and may hallucinate parameters not defined by your function schema. Validate the arguments in your code before calling your function.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function > (property) arguments>)
String name
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function>)
JsonValue; type "function"constant"function"constant
The type of the tool. Currently, only `function` is supported.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema)>)
class ChatCompletionMessageCustomToolCall:
A call to a custom tool created by the model.
String id
The ID of the tool call.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) id>)
Custom custom
The custom tool that the model called.
String input
The input for the custom tool call generated by the model.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom > (property) input>)
String name
The name of the custom tool to call.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom>)
JsonValue; type "custom"constant"custom"constant
The type of the tool. Always `custom`.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema)>)
[](<#(resource) chat.completions > (model) chat_completion_message_tool_call > (schema)>)
enum ChatCompletionModality:
TEXT("text")
[](<#(resource) chat.completions > (model) chat_completion_modality > (schema) > (member) 0>)
AUDIO("audio")
[](<#(resource) chat.completions > (model) chat_completion_modality > (schema) > (member) 1>)
[](<#(resource) chat.completions > (model) chat_completion_modality > (schema)>)
class ChatCompletionNamedToolChoice:
Specifies a tool the model should use. Use to force the model to call a specific function.
Function function
String name
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion_named_tool_choice > (schema) > (property) function > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_named_tool_choice > (schema) > (property) function>)
JsonValue; type "function"constant"function"constant
For function calling, the type is always `function`.
[](<#(resource) chat.completions > (model) chat_completion_named_tool_choice > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_named_tool_choice > (schema)>)
class ChatCompletionNamedToolChoiceCustom:
Specifies a tool the model should use. Use to force the model to call a specific custom tool.
Custom custom
String name
The name of the custom tool to call.
[](<#(resource) chat.completions > (model) chat_completion_named_tool_choice_custom > (schema) > (property) custom > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_named_tool_choice_custom > (schema) > (property) custom>)
JsonValue; type "custom"constant"custom"constant
For custom tool calling, the type is always `custom`.
[](<#(resource) chat.completions > (model) chat_completion_named_tool_choice_custom > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_named_tool_choice_custom > (schema)>)
class ChatCompletionPredictionContent:
Static predicted output content, such as the content of a text file that is
being regenerated.
Content content
The content that should be matched when generating a model response.
If generated tokens would match this content, the entire model response
can be returned much more quickly.
One of the following:
String
[](<#(resource) chat.completions > (model) chat_completion_prediction_content > (schema) > (property) content > (variant) 0>)
List\<[ChatCompletionContentPartText](</api/reference/java/resources/chat#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>)\>
String text
The text content.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) text>)
JsonValue; type "text"constant"text"constant
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_prediction_content > (schema) > (property) content > (variant) 1>)
[](<#(resource) chat.completions > (model) chat_completion_prediction_content > (schema) > (property) content>)
JsonValue; type "content"constant"content"constant
The type of the predicted content you want to provide. This type is
currently always `content`.
[](<#(resource) chat.completions > (model) chat_completion_prediction_content > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_prediction_content > (schema)>)
enum ChatCompletionRole:
The role of the author of a message
DEVELOPER("developer")
[](<#(resource) chat.completions > (model) chat_completion_role > (schema) > (member) 0>)
SYSTEM("system")
[](<#(resource) chat.completions > (model) chat_completion_role > (schema) > (member) 1>)
USER("user")
[](<#(resource) chat.completions > (model) chat_completion_role > (schema) > (member) 2>)
ASSISTANT("assistant")
[](<#(resource) chat.completions > (model) chat_completion_role > (schema) > (member) 3>)
TOOL("tool")
[](<#(resource) chat.completions > (model) chat_completion_role > (schema) > (member) 4>)
FUNCTION("function")
[](<#(resource) chat.completions > (model) chat_completion_role > (schema) > (member) 5>)
[](<#(resource) chat.completions > (model) chat_completion_role > (schema)>)
class ChatCompletionStoreMessage:
A chat completion message generated by the model.
String id
The identifier of the chat message.
[](<#(resource) chat.completions > (model) chat_completion_store_message > (schema) > (entry) 1 > (property) id>)
Optional\<List\<ContentPart\>\> contentParts
If a content parts array was provided, this is an array of `text` and `image\_url` parts.
Otherwise, null.
One of the following:
class ChatCompletionContentPartText:
Learn about [text inputs](https://platform.openai.com/docs/guides/text-generation).
String text
The text content.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) text>)
JsonValue; type "text"constant"text"constant
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>)
class ChatCompletionContentPartImage:
Learn about [image inputs](https://platform.openai.com/docs/guides/vision).
ImageUrl imageUrl
String url
Either a URL of the image or the base64 encoded image data.
formaturi
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) url>)
Optional\<Detail\> detail
Specifies the detail level of the image. Learn more in the [Vision guide](https://platform.openai.com/docs/guides/vision#low-or-high-fidelity-image-understanding).
One of the following:
AUTO("auto")
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail > (member) 0>)
LOW("low")
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail > (member) 1>)
HIGH("high")
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail > (member) 2>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url>)
JsonValue; type "image\_url"constant"image\_url"constant
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema)>)
[](<#(resource) chat.completions > (model) chat_completion_store_message > (schema) > (entry) 1 > (property) content_parts>)
[](<#(resource) chat.completions > (model) chat_completion_store_message > (schema)>)
class ChatCompletionStreamOptions:
Options for streaming response. Only set this when you set `stream: true`.
Optional\<Boolean\> includeObfuscation
When true, stream obfuscation will be enabled. Stream obfuscation adds
random characters to an `obfuscation` field on streaming delta events to
normalize payload sizes as a mitigation to certain side-channel attacks.
These obfuscation fields are included by default, but add a small amount
of overhead to the data stream. You can set `include\_obfuscation` to
false to optimize for bandwidth if you trust the network links between
your application and the OpenAI API.
[](<#(resource) chat.completions > (model) chat_completion_stream_options > (schema) > (property) include_obfuscation>)
Optional\<Boolean\> includeUsage
If set, an additional chunk will be streamed before the `data: [DONE]`
message. The `usage` field on this chunk shows the token usage statistics
for the entire request, and the `choices` field will always be an empty
array.
All other chunks will also include a `usage` field, but with a null
value. **NOTE:** If the stream is interrupted, you may not receive the
final usage chunk which contains the total token usage for the request.
[](<#(resource) chat.completions > (model) chat_completion_stream_options > (schema) > (property) include_usage>)
[](<#(resource) chat.completions > (model) chat_completion_stream_options > (schema)>)
class ChatCompletionSystemMessageParam:
Developer-provided instructions that the model should follow, regardless of
messages sent by the user. With o1 models and newer, use `developer` messages
for this purpose instead.
Content content
The contents of the system message.
One of the following:
String
[](<#(resource) chat.completions > (model) chat_completion_system_message_param > (schema) > (property) content > (variant) 0>)
List\<[ChatCompletionContentPartText](</api/reference/java/resources/chat#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>)\>
String text
The text content.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) text>)
JsonValue; type "text"constant"text"constant
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_system_message_param > (schema) > (property) content > (variant) 1>)
[](<#(resource) chat.completions > (model) chat_completion_system_message_param > (schema) > (property) content>)
JsonValue; role "system"constant"system"constant
The role of the messages author, in this case `system`.
[](<#(resource) chat.completions > (model) chat_completion_system_message_param > (schema) > (property) role>)
Optional\<String\> name
An optional name for the participant. Provides the model information to differentiate between participants of the same role.
[](<#(resource) chat.completions > (model) chat_completion_system_message_param > (schema) > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_system_message_param > (schema)>)
class ChatCompletionTokenLogprob:
String token
The token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) token>)
Optional\<List\<Long\>\> bytes
A list of integers representing the UTF-8 bytes representation of the token. Useful in instances where characters are represented by multiple tokens and their byte representations must be combined to generate the correct text representation. Can be `null` if there is no bytes representation for the token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) bytes>)
double logprob
The log probability of this token, if it is within the top 20 most likely tokens. Otherwise, the value `-9999.0` is used to signify that the token is very unlikely.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) logprob>)
List\<TopLogprob\> topLogprobs
List of the most likely tokens and their log probability, at this token position. In rare cases, there may be fewer than the number of requested `top\_logprobs` returned.
String token
The token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) token>)
Optional\<List\<Long\>\> bytes
A list of integers representing the UTF-8 bytes representation of the token. Useful in instances where characters are represented by multiple tokens and their byte representations must be combined to generate the correct text representation. Can be `null` if there is no bytes representation for the token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) bytes>)
double logprob
The log probability of this token, if it is within the top 20 most likely tokens. Otherwise, the value `-9999.0` is used to signify that the token is very unlikely.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) logprob>)
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs>)
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema)>)
class ChatCompletionTool: A class that can be one of several variants.union
A function tool that can be used to generate a response.
class ChatCompletionFunctionTool:
A function tool that can be used to generate a response.
[FunctionDefinition](</api/reference/java/resources/$shared#(resource) $shared > (model) function_definition > (schema)>) function
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema) > (property) function>)
JsonValue; type "function"constant"function"constant
The type of the tool. Currently, only `function` is supported.
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema)>)
class ChatCompletionCustomTool:
A custom tool that processes input using a specified format.
Custom custom
Properties of the custom tool.
String name
The name of the custom tool, used to identify it in tool calls.
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) name>)
Optional\<String\> description
Optional description of the custom tool, used to provide more context.
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) description>)
Optional\<Format\> format
The input format for the custom tool. Default is unconstrained text.
One of the following:
JsonValue;
JsonValue; type "text"constant"text"constant
Unconstrained text format. Always `text`.
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 0 > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 0>)
class Grammar:
A grammar defined by the user.
InnerGrammar grammar
Your chosen grammar.
String definition
The grammar definition.
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 1 > (property) grammar > (property) definition>)
Syntax syntax
The syntax of the grammar definition. One of `lark` or `regex`.
One of the following:
LARK("lark")
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 1 > (property) grammar > (property) syntax > (member) 0>)
REGEX("regex")
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 1 > (property) grammar > (property) syntax > (member) 1>)
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 1 > (property) grammar > (property) syntax>)
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 1 > (property) grammar>)
JsonValue; type "grammar"constant"grammar"constant
Grammar format. Always `grammar`.
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 1 > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 1>)
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format>)
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom>)
JsonValue; type "custom"constant"custom"constant
The type of the custom tool. Always `custom`.
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema)>)
[](<#(resource) chat.completions > (model) chat_completion_tool > (schema)>)
class ChatCompletionToolChoiceOption: A class that can be one of several variants.union
Controls which (if any) tool is called by the model.
`none` means the model will not call any tool and instead generates a message.
`auto` means the model can pick between generating a message or calling one or more tools.
`required` means the model must call one or more tools.
Specifying a particular tool via `{"type": "function", "function": {"name": "my\_function"}}` forces the model to call that tool.
`none` is the default when no tools are present. `auto` is the default if tools are present.
Auto
One of the following:
NONE("none")
[](<#(resource) chat.completions > (model) chat_completion_tool_choice_option > (schema) > (variant) 0 > (member) 0>)
AUTO("auto")
[](<#(resource) chat.completions > (model) chat_completion_tool_choice_option > (schema) > (variant) 0 > (member) 1>)
REQUIRED("required")
[](<#(resource) chat.completions > (model) chat_completion_tool_choice_option > (schema) > (variant) 0 > (member) 2>)
[](<#(resource) chat.completions > (model) chat_completion_tool_choice_option > (schema) > (variant) 0>)
class ChatCompletionAllowedToolChoice:
Constrains the tools available to the model to a pre-defined set.
[ChatCompletionAllowedTools](</api/reference/java/resources/chat#(resource) chat.completions > (model) ChatCompletionAllowedTools > (schema)>) allowedTools
Constrains the tools available to the model to a pre-defined set.
[](<#(resource) chat.completions > (model) chat_completion_allowed_tool_choice > (schema) > (property) allowed_tools>)
JsonValue; type "allowed\_tools"constant"allowed\_tools"constant
Allowed tool configuration type. Always `allowed\_tools`.
[](<#(resource) chat.completions > (model) chat_completion_allowed_tool_choice > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_allowed_tool_choice > (schema)>)
class ChatCompletionNamedToolChoice:
Specifies a tool the model should use. Use to force the model to call a specific function.
Function function
String name
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion_named_tool_choice > (schema) > (property) function > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_named_tool_choice > (schema) > (property) function>)
JsonValue; type "function"constant"function"constant
For function calling, the type is always `function`.
[](<#(resource) chat.completions > (model) chat_completion_named_tool_choice > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_named_tool_choice > (schema)>)
class ChatCompletionNamedToolChoiceCustom:
Specifies a tool the model should use. Use to force the model to call a specific custom tool.
Custom custom
String name
The name of the custom tool to call.
[](<#(resource) chat.completions > (model) chat_completion_named_tool_choice_custom > (schema) > (property) custom > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_named_tool_choice_custom > (schema) > (property) custom>)
JsonValue; type "custom"constant"custom"constant
For custom tool calling, the type is always `custom`.
[](<#(resource) chat.completions > (model) chat_completion_named_tool_choice_custom > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_named_tool_choice_custom > (schema)>)
[](<#(resource) chat.completions > (model) chat_completion_tool_choice_option > (schema)>)
class ChatCompletionToolMessageParam:
Content content
The contents of the tool message.
One of the following:
String
[](<#(resource) chat.completions > (model) chat_completion_tool_message_param > (schema) > (property) content > (variant) 0>)
List\<[ChatCompletionContentPartText](</api/reference/java/resources/chat#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>)\>
String text
The text content.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) text>)
JsonValue; type "text"constant"text"constant
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_tool_message_param > (schema) > (property) content > (variant) 1>)
[](<#(resource) chat.completions > (model) chat_completion_tool_message_param > (schema) > (property) content>)
JsonValue; role "tool"constant"tool"constant
The role of the messages author, in this case `tool`.
[](<#(resource) chat.completions > (model) chat_completion_tool_message_param > (schema) > (property) role>)
String toolCallId
Tool call that this message is responding to.
[](<#(resource) chat.completions > (model) chat_completion_tool_message_param > (schema) > (property) tool_call_id>)
[](<#(resource) chat.completions > (model) chat_completion_tool_message_param > (schema)>)
class ChatCompletionUserMessageParam:
Messages sent by an end user, containing prompts or additional context
information.
Content content
The contents of the user message.
One of the following:
String
[](<#(resource) chat.completions > (model) chat_completion_user_message_param > (schema) > (property) content > (variant) 0>)
List\<[ChatCompletionContentPart](</api/reference/java/resources/chat#(resource) chat.completions > (model) chat_completion_content_part > (schema)>)\>
One of the following:
class ChatCompletionContentPartText:
Learn about [text inputs](https://platform.openai.com/docs/guides/text-generation).
String text
The text content.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) text>)
JsonValue; type "text"constant"text"constant
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>)
class ChatCompletionContentPartImage:
Learn about [image inputs](https://platform.openai.com/docs/guides/vision).
ImageUrl imageUrl
String url
Either a URL of the image or the base64 encoded image data.
formaturi
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) url>)
Optional\<Detail\> detail
Specifies the detail level of the image. Learn more in the [Vision guide](https://platform.openai.com/docs/guides/vision#low-or-high-fidelity-image-understanding).
One of the following:
AUTO("auto")
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail > (member) 0>)
LOW("low")
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail > (member) 1>)
HIGH("high")
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail > (member) 2>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url>)
JsonValue; type "image\_url"constant"image\_url"constant
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema)>)
class ChatCompletionContentPartInputAudio:
Learn about [audio inputs](https://platform.openai.com/docs/guides/audio).
InputAudio inputAudio
String data
Base64 encoded audio data.
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio > (property) data>)
Format format
The format of the encoded audio data. Currently supports “wav” and “mp3”.
One of the following:
WAV("wav")
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
MP3("mp3")
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio>)
JsonValue; type "input\_audio"constant"input\_audio"constant
The type of the content part. Always `input\_audio`.
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema)>)
File
FileObject file
Optional\<String\> fileData
The base64 encoded file data, used when passing the file to the model
as a string.
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3 > (property) file > (property) file_data>)
Optional\<String\> fileId
The ID of an uploaded file to use as input.
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3 > (property) file > (property) file_id>)
Optional\<String\> filename
The name of the file, used when passing the file to the model as a
string.
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3 > (property) file > (property) filename>)
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3 > (property) file>)
JsonValue; type "file"constant"file"constant
The type of the content part. Always `file`.
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3 > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3>)
[](<#(resource) chat.completions > (model) chat_completion_user_message_param > (schema) > (property) content > (variant) 1>)
[](<#(resource) chat.completions > (model) chat_completion_user_message_param > (schema) > (property) content>)
JsonValue; role "user"constant"user"constant
The role of the messages author, in this case `user`.
[](<#(resource) chat.completions > (model) chat_completion_user_message_param > (schema) > (property) role>)
Optional\<String\> name
An optional name for the participant. Provides the model information to differentiate between participants of the same role.
[](<#(resource) chat.completions > (model) chat_completion_user_message_param > (schema) > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_user_message_param > (schema)>)
class ChatCompletionAllowedTools:
Constrains the tools available to the model to a pre-defined set.
Mode mode
Constrains the tools available to the model to a pre-defined set.
`auto` allows the model to pick from among the allowed tools and generate a
message.
`required` requires the model to call one or more of the allowed tools.
One of the following:
AUTO("auto")
[](<#(resource) chat.completions > (model) ChatCompletionAllowedTools > (schema) > (property) mode > (member) 0>)
REQUIRED("required")
[](<#(resource) chat.completions > (model) ChatCompletionAllowedTools > (schema) > (property) mode > (member) 1>)
[](<#(resource) chat.completions > (model) ChatCompletionAllowedTools > (schema) > (property) mode>)
List\<Tool\> tools
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
##### [Get chat messages](/api/reference/java/resources/chat/subresources/completions/subresources/messages/methods/list)
MessageListPage chat().completions().messages().list(MessageListParamsparams = MessageListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/chat/completions/{completion\_id}/messages