Completions | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Chat](/api/reference/go/resources/chat)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Completions
Given a list of messages comprising a conversation, the model will return a response.
##### [Create chat completion](/api/reference/go/resources/chat/subresources/completions/methods/create)
client.Chat.Completions.New(ctx, body) (\*[ChatCompletion](</api/reference/go/resources/chat#(resource) chat.completions > (model) chat_completion > (schema)>), error)
POST/chat/completions
##### [List Chat Completions](/api/reference/go/resources/chat/subresources/completions/methods/list)
client.Chat.Completions.List(ctx, query) (\*CursorPage[[ChatCompletion](</api/reference/go/resources/chat#(resource) chat.completions > (model) chat_completion > (schema)>)], error)
GET/chat/completions
##### [Get chat completion](/api/reference/go/resources/chat/subresources/completions/methods/retrieve)
client.Chat.Completions.Get(ctx, completionID) (\*[ChatCompletion](</api/reference/go/resources/chat#(resource) chat.completions > (model) chat_completion > (schema)>), error)
GET/chat/completions/{completion\_id}
##### [Update chat completion](/api/reference/go/resources/chat/subresources/completions/methods/update)
client.Chat.Completions.Update(ctx, completionID, body) (\*[ChatCompletion](</api/reference/go/resources/chat#(resource) chat.completions > (model) chat_completion > (schema)>), error)
POST/chat/completions/{completion\_id}
##### [Delete chat completion](/api/reference/go/resources/chat/subresources/completions/methods/delete)
client.Chat.Completions.Delete(ctx, completionID) (\*[ChatCompletionDeleted](</api/reference/go/resources/chat#(resource) chat.completions > (model) chat_completion_deleted > (schema)>), error)
DELETE/chat/completions/{completion\_id}
##### ModelsExpand Collapse
type ChatCompletion struct{…}
Represents a chat completion response returned by model, based on the provided input.
ID string
A unique identifier for the chat completion.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) id>)
Choices []ChatCompletionChoice
A list of chat completion choices. Can be more than one if `n` is greater than 1.
FinishReason string
The reason the model stopped generating tokens. This will be `stop` if the model hit a natural stop point or a provided stop sequence,
`length` if the maximum number of tokens specified in the request was reached,
`content\_filter` if content was omitted due to a flag from our content filters,
`tool\_calls` if the model called a tool, or `function\_call` (deprecated) if the model called a function.
One of the following:
const ChatCompletionChoiceFinishReasonStop ChatCompletionChoiceFinishReason = "stop"
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) finish_reason > (member) 0>)
const ChatCompletionChoiceFinishReasonLength ChatCompletionChoiceFinishReason = "length"
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) finish_reason > (member) 1>)
const ChatCompletionChoiceFinishReasonToolCalls ChatCompletionChoiceFinishReason = "tool\_calls"
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) finish_reason > (member) 2>)
const ChatCompletionChoiceFinishReasonContentFilter ChatCompletionChoiceFinishReason = "content\_filter"
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) finish_reason > (member) 3>)
const ChatCompletionChoiceFinishReasonFunctionCall ChatCompletionChoiceFinishReason = "function\_call"
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) finish_reason > (member) 4>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) finish_reason>)
Index int64
The index of the choice in the list of choices.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) index>)
Logprobs ChatCompletionChoiceLogprobs
Log probability information for the choice.
Content [][ChatCompletionTokenLogprob](</api/reference/go/resources/chat#(resource) chat.completions > (model) chat_completion_token_logprob > (schema)>)
A list of message content tokens with log probability information.
Token string
The token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) token>)
Bytes []int64
A list of integers representing the UTF-8 bytes representation of the token. Useful in instances where characters are represented by multiple tokens and their byte representations must be combined to generate the correct text representation. Can be `null` if there is no bytes representation for the token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) bytes>)
Logprob float64
The log probability of this token, if it is within the top 20 most likely tokens. Otherwise, the value `-9999.0` is used to signify that the token is very unlikely.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) logprob>)
TopLogprobs []ChatCompletionTokenLogprobTopLogprob
List of the most likely tokens and their log probability, at this token position. In rare cases, there may be fewer than the number of requested `top\_logprobs` returned.
Token string
The token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) token>)
Bytes []int64
A list of integers representing the UTF-8 bytes representation of the token. Useful in instances where characters are represented by multiple tokens and their byte representations must be combined to generate the correct text representation. Can be `null` if there is no bytes representation for the token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) bytes>)
Logprob float64
The log probability of this token, if it is within the top 20 most likely tokens. Otherwise, the value `-9999.0` is used to signify that the token is very unlikely.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) logprob>)
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) logprobs > (property) content>)
Refusal [][ChatCompletionTokenLogprob](</api/reference/go/resources/chat#(resource) chat.completions > (model) chat_completion_token_logprob > (schema)>)
A list of message refusal tokens with log probability information.
Token string
The token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) token>)
Bytes []int64
A list of integers representing the UTF-8 bytes representation of the token. Useful in instances where characters are represented by multiple tokens and their byte representations must be combined to generate the correct text representation. Can be `null` if there is no bytes representation for the token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) bytes>)
Logprob float64
The log probability of this token, if it is within the top 20 most likely tokens. Otherwise, the value `-9999.0` is used to signify that the token is very unlikely.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) logprob>)
TopLogprobs []ChatCompletionTokenLogprobTopLogprob
List of the most likely tokens and their log probability, at this token position. In rare cases, there may be fewer than the number of requested `top\_logprobs` returned.
Token string
The token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) token>)
Bytes []int64
A list of integers representing the UTF-8 bytes representation of the token. Useful in instances where characters are represented by multiple tokens and their byte representations must be combined to generate the correct text representation. Can be `null` if there is no bytes representation for the token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) bytes>)
Logprob float64
The log probability of this token, if it is within the top 20 most likely tokens. Otherwise, the value `-9999.0` is used to signify that the token is very unlikely.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) logprob>)
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) logprobs > (property) refusal>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) logprobs>)
Message [ChatCompletionMessage](</api/reference/go/resources/chat#(resource) chat.completions > (model) chat_completion_message > (schema)>)
A chat completion message generated by the model.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices>)
Created int64
The Unix timestamp (in seconds) of when the chat completion was created.
formatunixtime
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) created>)
Model string
The model used for the chat completion.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) model>)
Object ChatCompletion
The object type, which is always `chat.completion`.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) object>)
ServiceTier ChatCompletionServiceTierOptional
Specifies the processing type used for serving the request.
* If set to ‘auto’, then the request will be processed with the service tier configured in the Project settings. Unless otherwise configured, the Project will use ‘default’.
* If set to ‘default’, then the request will be processed with the standard pricing and performance for the selected model.
* If set to ‘[flex](https://platform.openai.com/docs/guides/flex-processing)’ or ‘[priority](https://openai.com/api-priority-processing/)’, then the request will be processed with the corresponding service tier.
* When not set, the default behavior is ‘auto’.
When the `service\_tier` parameter is set, the response body will include the `service\_tier` value based on the processing mode actually used to serve the request. This response value may be different from the value set in the parameter.
One of the following:
const ChatCompletionServiceTierAuto ChatCompletionServiceTier = "auto"
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) service_tier > (member) 0>)
const ChatCompletionServiceTierDefault ChatCompletionServiceTier = "default"
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) service_tier > (member) 1>)
const ChatCompletionServiceTierFlex ChatCompletionServiceTier = "flex"
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) service_tier > (member) 2>)
const ChatCompletionServiceTierScale ChatCompletionServiceTier = "scale"
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) service_tier > (member) 3>)
const ChatCompletionServiceTierPriority ChatCompletionServiceTier = "priority"
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) service_tier > (member) 4>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) service_tier>)
DeprecatedSystemFingerprint stringOptional
This fingerprint represents the backend configuration that the model runs with.
Can be used in conjunction with the `seed` request parameter to understand when backend changes have been made that might impact determinism.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) system_fingerprint>)
Usage [CompletionUsage](</api/reference/go/resources/completions#(resource) completions > (model) completion_usage > (schema)>)Optional
Usage statistics for the completion request.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage>)
[](<#(resource) chat.completions > (model) chat_completion > (schema)>)
type ChatCompletionAllowedToolChoice struct{…}
Constrains the tools available to the model to a pre-defined set.
AllowedTools [ChatCompletionAllowedTools](</api/reference/go/resources/chat#(resource) chat.completions > (model) ChatCompletionAllowedTools > (schema)>)
Constrains the tools available to the model to a pre-defined set.
[](<#(resource) chat.completions > (model) chat_completion_allowed_tool_choice > (schema) > (property) allowed_tools>)
Type AllowedTools
Allowed tool configuration type. Always `allowed\_tools`.
[](<#(resource) chat.completions > (model) chat_completion_allowed_tool_choice > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_allowed_tool_choice > (schema)>)
type ChatCompletionAssistantMessageParamResp struct{…}
Messages sent by the model in response to user messages.
Role Assistant
The role of the messages author, in this case `assistant`.
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) role>)
Audio ChatCompletionAssistantMessageParamAudioRespOptional
Data about a previous audio response from the model.
[Learn more](https://platform.openai.com/docs/guides/audio).
ID string
Unique identifier for a previous audio response from the model.
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) audio > (property) id>)
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) audio>)
Content ChatCompletionAssistantMessageParamContentUnionRespOptional
The contents of the assistant message. Required unless `tool\_calls` or `function\_call` is specified.
One of the following:
string
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) content > (variant) 0>)
[]ChatCompletionAssistantMessageParamContentArrayOfContentPartUnionResp
One of the following:
type ChatCompletionContentPartText struct{…}
Learn about [text inputs](https://platform.openai.com/docs/guides/text-generation).
Text string
The text content.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) text>)
Type Text
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>)
type ChatCompletionContentPartRefusal struct{…}
Refusal string
The refusal message generated by the model.
[](<#(resource) chat.completions > (model) chat_completion_content_part_refusal > (schema) > (property) refusal>)
Type Refusal
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_refusal > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_refusal > (schema)>)
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) content > (variant) 1>)
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) content>)
DeprecatedFunctionCall ChatCompletionAssistantMessageParamFunctionCallRespOptional
Deprecated and replaced by `tool\_calls`. The name and arguments of a function that should be called, as generated by the model.
Arguments string
The arguments to call the function with, as generated by the model in JSON format. Note that the model does not always generate valid JSON, and may hallucinate parameters not defined by your function schema. Validate the arguments in your code before calling your function.
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) function_call > (property) arguments>)
Name string
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) function_call > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) function_call>)
Name stringOptional
An optional name for the participant. Provides the model information to differentiate between participants of the same role.
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) name>)
Refusal stringOptional
The refusal message by the assistant.
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) refusal>)
ToolCalls [][ChatCompletionMessageToolCallUnion](</api/reference/go/resources/chat#(resource) chat.completions > (model) chat_completion_message_tool_call > (schema)>)Optional
The tool calls generated by the model, such as function calls.
One of the following:
type ChatCompletionMessageFunctionToolCall struct{…}
A call to a function tool created by the model.
ID string
The ID of the tool call.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) id>)
Function ChatCompletionMessageFunctionToolCallFunction
The function that the model called.
Arguments string
The arguments to call the function with, as generated by the model in JSON format. Note that the model does not always generate valid JSON, and may hallucinate parameters not defined by your function schema. Validate the arguments in your code before calling your function.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function > (property) arguments>)
Name string
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function>)
Type Function
The type of the tool. Currently, only `function` is supported.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema)>)
type ChatCompletionMessageCustomToolCall struct{…}
A call to a custom tool created by the model.
ID string
The ID of the tool call.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) id>)
Custom ChatCompletionMessageCustomToolCallCustom
The custom tool that the model called.
Input string
The input for the custom tool call generated by the model.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom > (property) input>)
Name string
The name of the custom tool to call.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom>)
Type Custom
The type of the tool. Always `custom`.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema)>)
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) tool_calls>)
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema)>)
type ChatCompletionAudio struct{…}
If the audio output modality is requested, this object contains data
about the audio response from the model. [Learn more](https://platform.openai.com/docs/guides/audio).
ID string
Unique identifier for this audio response.
[](<#(resource) chat.completions > (model) chat_completion_audio > (schema) > (property) id>)
Data string
Base64 encoded audio bytes generated by the model, in the format
specified in the request.
[](<#(resource) chat.completions > (model) chat_completion_audio > (schema) > (property) data>)
ExpiresAt int64
The Unix timestamp (in seconds) for when this audio response will
no longer be accessible on the server for use in multi-turn
conversations.
formatunixtime
[](<#(resource) chat.completions > (model) chat_completion_audio > (schema) > (property) expires_at>)
Transcript string
Transcript of the audio generated by the model.
[](<#(resource) chat.completions > (model) chat_completion_audio > (schema) > (property) transcript>)
[](<#(resource) chat.completions > (model) chat_completion_audio > (schema)>)
type ChatCompletionAudioParamResp struct{…}
Parameters for audio output. Required when audio output is requested with
`modalities: ["audio"]`. [Learn more](https://platform.openai.com/docs/guides/audio).
Format ChatCompletionAudioParamFormat
Specifies the output audio format. Must be one of `wav`, `mp3`, `flac`,
`opus`, or `pcm16`.
One of the following:
const ChatCompletionAudioParamFormatWAV ChatCompletionAudioParamFormat = "wav"
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) format > (member) 0>)
const ChatCompletionAudioParamFormatAAC ChatCompletionAudioParamFormat = "aac"
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) format > (member) 1>)
const ChatCompletionAudioParamFormatMP3 ChatCompletionAudioParamFormat = "mp3"
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) format > (member) 2>)
const ChatCompletionAudioParamFormatFLAC ChatCompletionAudioParamFormat = "flac"
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) format > (member) 3>)
const ChatCompletionAudioParamFormatOpus ChatCompletionAudioParamFormat = "opus"
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) format > (member) 4>)
const ChatCompletionAudioParamFormatPcm16 ChatCompletionAudioParamFormat = "pcm16"
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) format > (member) 5>)
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) format>)
Voice ChatCompletionAudioParamVoiceUnionResp
The voice the model uses to respond. Supported built-in voices are
`alloy`, `ash`, `ballad`, `coral`, `echo`, `fable`, `nova`, `onyx`,
`sage`, `shimmer`, `marin`, and `cedar`. You may also provide a
custom voice object with an `id`, for example `{ "id": "voice\_1234" }`.
One of the following:
string
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 0>)
string
One of the following:
const ChatCompletionAudioParamVoiceStringAlloy ChatCompletionAudioParamVoiceString = "alloy"
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 1 > (member) 0>)
const ChatCompletionAudioParamVoiceStringAsh ChatCompletionAudioParamVoiceString = "ash"
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 1 > (member) 1>)
const ChatCompletionAudioParamVoiceStringBallad ChatCompletionAudioParamVoiceString = "ballad"
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 1 > (member) 2>)
const ChatCompletionAudioParamVoiceStringCoral ChatCompletionAudioParamVoiceString = "coral"
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 1 > (member) 3>)
const ChatCompletionAudioParamVoiceStringEcho ChatCompletionAudioParamVoiceString = "echo"
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 1 > (member) 4>)
const ChatCompletionAudioParamVoiceStringSage ChatCompletionAudioParamVoiceString = "sage"
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 1 > (member) 5>)
const ChatCompletionAudioParamVoiceStringShimmer ChatCompletionAudioParamVoiceString = "shimmer"
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 1 > (member) 6>)
const ChatCompletionAudioParamVoiceStringVerse ChatCompletionAudioParamVoiceString = "verse"
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 1 > (member) 7>)
const ChatCompletionAudioParamVoiceStringMarin ChatCompletionAudioParamVoiceString = "marin"
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 1 > (member) 8>)
const ChatCompletionAudioParamVoiceStringCedar ChatCompletionAudioParamVoiceString = "cedar"
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 1 > (member) 9>)
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 1>)
ChatCompletionAudioParamVoiceIDResp
ID string
The custom voice ID, e.g. `voice\_1234`.
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 2 > (property) id>)
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 2>)
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice>)
[](<#(resource) chat.completions > (model) chat_completion_audio_param > (schema)>)
type ChatCompletionChunk struct{…}
Represents a streamed chunk of a chat completion response returned
by the model, based on the provided input.
[Learn more](https://platform.openai.com/docs/guides/streaming-responses).
ID string
A unique identifier for the chat completion. Each chunk has the same ID.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) id>)
Choices []ChatCompletionChunkChoice
A list of chat completion choices. Can contain more than one elements if `n` is greater than 1. Can also be empty for the
last chunk if you set `stream\_options: {"include\_usage": true}`.
Delta ChatCompletionChunkChoiceDelta
A chat completion delta generated by streamed model responses.
Content stringOptional
The contents of the chunk message.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta > (property) content>)
DeprecatedFunctionCall ChatCompletionChunkChoiceDeltaFunctionCallOptional
Deprecated and replaced by `tool\_calls`. The name and arguments of a function that should be called, as generated by the model.
Arguments stringOptional
The arguments to call the function with, as generated by the model in JSON format. Note that the model does not always generate valid JSON, and may hallucinate parameters not defined by your function schema. Validate the arguments in your code before calling your function.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta > (property) function_call > (property) arguments>)
Name stringOptional
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta > (property) function_call > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta > (property) function_call>)
Refusal stringOptional
The refusal message generated by the model.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta > (property) refusal>)
Role stringOptional
The role of the author of this message.
One of the following:
const ChatCompletionChunkChoiceDeltaRoleDeveloper ChatCompletionChunkChoiceDeltaRole = "developer"
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta > (property) role > (member) 0>)
const ChatCompletionChunkChoiceDeltaRoleSystem ChatCompletionChunkChoiceDeltaRole = "system"
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta > (property) role > (member) 1>)
const ChatCompletionChunkChoiceDeltaRoleUser ChatCompletionChunkChoiceDeltaRole = "user"
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta > (property) role > (member) 2>)
const ChatCompletionChunkChoiceDeltaRoleAssistant ChatCompletionChunkChoiceDeltaRole = "assistant"
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta > (property) role > (member) 3>)
const ChatCompletionChunkChoiceDeltaRoleTool ChatCompletionChunkChoiceDeltaRole = "tool"
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta > (property) role > (member) 4>)
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta > (property) role>)
ToolCalls []ChatCompletionChunkChoiceDeltaToolCallOptional
Index int64
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta > (property) tool_calls > (items) > (property) index>)
ID stringOptional
The ID of the tool call.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta > (property) tool_calls > (items) > (property) id>)
Function ChatCompletionChunkChoiceDeltaToolCallFunctionOptional
Arguments stringOptional
The arguments to call the function with, as generated by the model in JSON format. Note that the model does not always generate valid JSON, and may hallucinate parameters not defined by your function schema. Validate the arguments in your code before calling your function.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta > (property) tool_calls > (items) > (property) function > (property) arguments>)
Name stringOptional
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta > (property) tool_calls > (items) > (property) function > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta > (property) tool_calls > (items) > (property) function>)
Type stringOptional
The type of the tool. Currently, only `function` is supported.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta > (property) tool_calls > (items) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta > (property) tool_calls>)
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) delta>)
FinishReason string
The reason the model stopped generating tokens. This will be `stop` if the model hit a natural stop point or a provided stop sequence,
`length` if the maximum number of tokens specified in the request was reached,
`content\_filter` if content was omitted due to a flag from our content filters,
`tool\_calls` if the model called a tool, or `function\_call` (deprecated) if the model called a function.
One of the following:
const ChatCompletionChunkChoiceFinishReasonStop ChatCompletionChunkChoiceFinishReason = "stop"
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) finish_reason > (member) 0>)
const ChatCompletionChunkChoiceFinishReasonLength ChatCompletionChunkChoiceFinishReason = "length"
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) finish_reason > (member) 1>)
const ChatCompletionChunkChoiceFinishReasonToolCalls ChatCompletionChunkChoiceFinishReason = "tool\_calls"
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) finish_reason > (member) 2>)
const ChatCompletionChunkChoiceFinishReasonContentFilter ChatCompletionChunkChoiceFinishReason = "content\_filter"
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) finish_reason > (member) 3>)
const ChatCompletionChunkChoiceFinishReasonFunctionCall ChatCompletionChunkChoiceFinishReason = "function\_call"
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) finish_reason > (member) 4>)
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) finish_reason>)
Index int64
The index of the choice in the list of choices.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) index>)
Logprobs ChatCompletionChunkChoiceLogprobsOptional
Log probability information for the choice.
Content [][ChatCompletionTokenLogprob](</api/reference/go/resources/chat#(resource) chat.completions > (model) chat_completion_token_logprob > (schema)>)
A list of message content tokens with log probability information.
Token string
The token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) token>)
Bytes []int64
A list of integers representing the UTF-8 bytes representation of the token. Useful in instances where characters are represented by multiple tokens and their byte representations must be combined to generate the correct text representation. Can be `null` if there is no bytes representation for the token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) bytes>)
Logprob float64
The log probability of this token, if it is within the top 20 most likely tokens. Otherwise, the value `-9999.0` is used to signify that the token is very unlikely.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) logprob>)
TopLogprobs []ChatCompletionTokenLogprobTopLogprob
List of the most likely tokens and their log probability, at this token position. In rare cases, there may be fewer than the number of requested `top\_logprobs` returned.
Token string
The token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) token>)
Bytes []int64
A list of integers representing the UTF-8 bytes representation of the token. Useful in instances where characters are represented by multiple tokens and their byte representations must be combined to generate the correct text representation. Can be `null` if there is no bytes representation for the token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) bytes>)
Logprob float64
The log probability of this token, if it is within the top 20 most likely tokens. Otherwise, the value `-9999.0` is used to signify that the token is very unlikely.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) logprob>)
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs>)
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) logprobs > (property) content>)
Refusal [][ChatCompletionTokenLogprob](</api/reference/go/resources/chat#(resource) chat.completions > (model) chat_completion_token_logprob > (schema)>)
A list of message refusal tokens with log probability information.
Token string
The token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) token>)
Bytes []int64
A list of integers representing the UTF-8 bytes representation of the token. Useful in instances where characters are represented by multiple tokens and their byte representations must be combined to generate the correct text representation. Can be `null` if there is no bytes representation for the token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) bytes>)
Logprob float64
The log probability of this token, if it is within the top 20 most likely tokens. Otherwise, the value `-9999.0` is used to signify that the token is very unlikely.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) logprob>)
TopLogprobs []ChatCompletionTokenLogprobTopLogprob
List of the most likely tokens and their log probability, at this token position. In rare cases, there may be fewer than the number of requested `top\_logprobs` returned.
Token string
The token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) token>)
Bytes []int64
A list of integers representing the UTF-8 bytes representation of the token. Useful in instances where characters are represented by multiple tokens and their byte representations must be combined to generate the correct text representation. Can be `null` if there is no bytes representation for the token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) bytes>)
Logprob float64
The log probability of this token, if it is within the top 20 most likely tokens. Otherwise, the value `-9999.0` is used to signify that the token is very unlikely.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) logprob>)
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs>)
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) logprobs > (property) refusal>)
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices > (items) > (property) logprobs>)
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) choices>)
Created int64
The Unix timestamp (in seconds) of when the chat completion was created. Each chunk has the same timestamp.
formatunixtime
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) created>)
Model string
The model to generate the completion.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) model>)
Object ChatCompletionChunk
The object type, which is always `chat.completion.chunk`.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) object>)
ServiceTier ChatCompletionChunkServiceTierOptional
Specifies the processing type used for serving the request.
* If set to ‘auto’, then the request will be processed with the service tier configured in the Project settings. Unless otherwise configured, the Project will use ‘default’.
* If set to ‘default’, then the request will be processed with the standard pricing and performance for the selected model.
* If set to ‘[flex](https://platform.openai.com/docs/guides/flex-processing)’ or ‘[priority](https://openai.com/api-priority-processing/)’, then the request will be processed with the corresponding service tier.
* When not set, the default behavior is ‘auto’.
When the `service\_tier` parameter is set, the response body will include the `service\_tier` value based on the processing mode actually used to serve the request. This response value may be different from the value set in the parameter.
One of the following:
const ChatCompletionChunkServiceTierAuto ChatCompletionChunkServiceTier = "auto"
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) service_tier > (member) 0>)
const ChatCompletionChunkServiceTierDefault ChatCompletionChunkServiceTier = "default"
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) service_tier > (member) 1>)
const ChatCompletionChunkServiceTierFlex ChatCompletionChunkServiceTier = "flex"
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) service_tier > (member) 2>)
const ChatCompletionChunkServiceTierScale ChatCompletionChunkServiceTier = "scale"
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) service_tier > (member) 3>)
const ChatCompletionChunkServiceTierPriority ChatCompletionChunkServiceTier = "priority"
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) service_tier > (member) 4>)
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) service_tier>)
DeprecatedSystemFingerprint stringOptional
This fingerprint represents the backend configuration that the model runs with.
Can be used in conjunction with the `seed` request parameter to understand when backend changes have been made that might impact determinism.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) system_fingerprint>)
Usage [CompletionUsage](</api/reference/go/resources/completions#(resource) completions > (model) completion_usage > (schema)>)Optional
An optional field that will only be present when you set
`stream\_options: {"include\_usage": true}` in your request. When present, it
contains a null value **except for the last chunk** which contains the
token usage statistics for the entire request.
**NOTE:** If the stream is interrupted or cancelled, you may not
receive the final usage chunk which contains the total token usage for
the request.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) usage>)
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema)>)
type ChatCompletionContentPartUnion interface{…}
Learn about [text inputs](https://platform.openai.com/docs/guides/text-generation).
One of the following:
type ChatCompletionContentPartText struct{…}
Learn about [text inputs](https://platform.openai.com/docs/guides/text-generation).
Text string
The text content.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) text>)
Type Text
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>)
type ChatCompletionContentPartImage struct{…}
Learn about [image inputs](https://platform.openai.com/docs/guides/vision).
ImageURL ChatCompletionContentPartImageImageURL
URL string
Either a URL of the image or the base64 encoded image data.
formaturi
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) url>)
Detail stringOptional
Specifies the detail level of the image. Learn more in the [Vision guide](https://platform.openai.com/docs/guides/vision#low-or-high-fidelity-image-understanding).
One of the following:
const ChatCompletionContentPartImageImageURLDetailAuto ChatCompletionContentPartImageImageURLDetail = "auto"
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail > (member) 0>)
const ChatCompletionContentPartImageImageURLDetailLow ChatCompletionContentPartImageImageURLDetail = "low"
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail > (member) 1>)
const ChatCompletionContentPartImageImageURLDetailHigh ChatCompletionContentPartImageImageURLDetail = "high"
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail > (member) 2>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url>)
Type ImageURL
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema)>)
type ChatCompletionContentPartInputAudio struct{…}
Learn about [audio inputs](https://platform.openai.com/docs/guides/audio).
InputAudio ChatCompletionContentPartInputAudioInputAudio
Data string
Base64 encoded audio data.
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio > (property) data>)
Format string
The format of the encoded audio data. Currently supports “wav” and “mp3”.
One of the following:
const ChatCompletionContentPartInputAudioInputAudioFormatWAV ChatCompletionContentPartInputAudioInputAudioFormat = "wav"
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
const ChatCompletionContentPartInputAudioInputAudioFormatMP3 ChatCompletionContentPartInputAudioInputAudioFormat = "mp3"
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio>)
Type InputAudio
The type of the content part. Always `input\_audio`.
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema)>)
ChatCompletionContentPartFile
File ChatCompletionContentPartFileFile
FileData stringOptional
The base64 encoded file data, used when passing the file to the model
as a string.
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3 > (property) file > (property) file_data>)
FileID stringOptional
The ID of an uploaded file to use as input.
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3 > (property) file > (property) file_id>)
Filename stringOptional
The name of the file, used when passing the file to the model as a
string.
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3 > (property) file > (property) filename>)
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3 > (property) file>)
Type File
The type of the content part. Always `file`.
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3 > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3>)
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema)>)
type ChatCompletionContentPartImage struct{…}
Learn about [image inputs](https://platform.openai.com/docs/guides/vision).
ImageURL ChatCompletionContentPartImageImageURL
URL string
Either a URL of the image or the base64 encoded image data.
formaturi
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) url>)
Detail stringOptional
Specifies the detail level of the image. Learn more in the [Vision guide](https://platform.openai.com/docs/guides/vision#low-or-high-fidelity-image-understanding).
One of the following:
const ChatCompletionContentPartImageImageURLDetailAuto ChatCompletionContentPartImageImageURLDetail = "auto"
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail > (member) 0>)
const ChatCompletionContentPartImageImageURLDetailLow ChatCompletionContentPartImageImageURLDetail = "low"
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail > (member) 1>)
const ChatCompletionContentPartImageImageURLDetailHigh ChatCompletionContentPartImageImageURLDetail = "high"
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail > (member) 2>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url>)
Type ImageURL
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema)>)
type ChatCompletionContentPartInputAudio struct{…}
Learn about [audio inputs](https://platform.openai.com/docs/guides/audio).
InputAudio ChatCompletionContentPartInputAudioInputAudio
Data string
Base64 encoded audio data.
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio > (property) data>)
Format string
The format of the encoded audio data. Currently supports “wav” and “mp3”.
One of the following:
const ChatCompletionContentPartInputAudioInputAudioFormatWAV ChatCompletionContentPartInputAudioInputAudioFormat = "wav"
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
const ChatCompletionContentPartInputAudioInputAudioFormatMP3 ChatCompletionContentPartInputAudioInputAudioFormat = "mp3"
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio>)
Type InputAudio
The type of the content part. Always `input\_audio`.
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema)>)
type ChatCompletionContentPartRefusal struct{…}
Refusal string
The refusal message generated by the model.
[](<#(resource) chat.completions > (model) chat_completion_content_part_refusal > (schema) > (property) refusal>)
Type Refusal
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_refusal > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_refusal > (schema)>)
type ChatCompletionContentPartText struct{…}
Learn about [text inputs](https://platform.openai.com/docs/guides/text-generation).
Text string
The text content.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) text>)
Type Text
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>)
type ChatCompletionCustomTool struct{…}
A custom tool that processes input using a specified format.
Custom ChatCompletionCustomToolCustom
Properties of the custom tool.
Name string
The name of the custom tool, used to identify it in tool calls.
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) name>)
Description stringOptional
Optional description of the custom tool, used to provide more context.
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) description>)
Format ChatCompletionCustomToolCustomFormatUnionOptional
The input format for the custom tool. Default is unconstrained text.
One of the following:
ChatCompletionCustomToolCustomFormatText
Type Text
Unconstrained text format. Always `text`.
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 0 > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 0>)
ChatCompletionCustomToolCustomFormatGrammar
Grammar ChatCompletionCustomToolCustomFormatGrammarGrammar
Your chosen grammar.
Definition string
The grammar definition.
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 1 > (property) grammar > (property) definition>)
Syntax string
The syntax of the grammar definition. One of `lark` or `regex`.
One of the following:
const ChatCompletionCustomToolCustomFormatGrammarGrammarSyntaxLark ChatCompletionCustomToolCustomFormatGrammarGrammarSyntax = "lark"
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 1 > (property) grammar > (property) syntax > (member) 0>)
const ChatCompletionCustomToolCustomFormatGrammarGrammarSyntaxRegex ChatCompletionCustomToolCustomFormatGrammarGrammarSyntax = "regex"
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 1 > (property) grammar > (property) syntax > (member) 1>)
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 1 > (property) grammar > (property) syntax>)
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 1 > (property) grammar>)
Type Grammar
Grammar format. Always `grammar`.
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 1 > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 1>)
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format>)
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom>)
Type Custom
The type of the custom tool. Always `custom`.
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema)>)
type ChatCompletionDeleted struct{…}
ID string
The ID of the chat completion that was deleted.
[](<#(resource) chat.completions > (model) chat_completion_deleted > (schema) > (property) id>)
Deleted bool
Whether the chat completion was deleted.
[](<#(resource) chat.completions > (model) chat_completion_deleted > (schema) > (property) deleted>)
Object ChatCompletionDeleted
The type of object being deleted.
[](<#(resource) chat.completions > (model) chat_completion_deleted > (schema) > (property) object>)
[](<#(resource) chat.completions > (model) chat_completion_deleted > (schema)>)
type ChatCompletionDeveloperMessageParamResp struct{…}
Developer-provided instructions that the model should follow, regardless of
messages sent by the user. With o1 models and newer, `developer` messages
replace the previous `system` messages.
Content ChatCompletionDeveloperMessageParamContentUnionResp
The contents of the developer message.
One of the following:
string
[](<#(resource) chat.completions > (model) chat_completion_developer_message_param > (schema) > (property) content > (variant) 0>)
[][ChatCompletionContentPartText](</api/reference/go/resources/chat#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>)
Text string
The text content.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) text>)
Type Text
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_developer_message_param > (schema) > (property) content > (variant) 1>)
[](<#(resource) chat.completions > (model) chat_completion_developer_message_param > (schema) > (property) content>)
Role Developer
The role of the messages author, in this case `developer`.
[](<#(resource) chat.completions > (model) chat_completion_developer_message_param > (schema) > (property) role>)
Name stringOptional
An optional name for the participant. Provides the model information to differentiate between participants of the same role.
[](<#(resource) chat.completions > (model) chat_completion_developer_message_param > (schema) > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_developer_message_param > (schema)>)
type ChatCompletionFunctionCallOption struct{…}
Specifying a particular function via `{"name": "my\_function"}` forces the model to call that function.
Name string
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion_function_call_option > (schema) > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_function_call_option > (schema)>)
type ChatCompletionFunctionMessageParamResp struct{…}
Content string
The contents of the function message.
[](<#(resource) chat.completions > (model) chat_completion_function_message_param > (schema) > (property) content>)
Name string
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion_function_message_param > (schema) > (property) name>)
Role Function
The role of the messages author, in this case `function`.
[](<#(resource) chat.completions > (model) chat_completion_function_message_param > (schema) > (property) role>)
[](<#(resource) chat.completions > (model) chat_completion_function_message_param > (schema)>)
type ChatCompletionFunctionTool struct{…}
A function tool that can be used to generate a response.
Function [FunctionDefinition](</api/reference/go/resources/$shared#(resource) $shared > (model) function_definition > (schema)>)
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema) > (property) function>)
Type Function
The type of the tool. Currently, only `function` is supported.
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema)>)
type ChatCompletionMessage struct{…}
A chat completion message generated by the model.
Content string
The contents of the message.
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) content>)
Refusal string
The refusal message generated by the model.
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) refusal>)
Role Assistant
The role of the author of this message.
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) role>)
Annotations []ChatCompletionMessageAnnotationOptional
Annotations for the message, when applicable, as when using the
[web search tool](https://platform.openai.com/docs/guides/tools-web-search?api-mode=chat).
Type URLCitation
The type of the URL citation. Always `url\_citation`.
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) annotations > (items) > (property) type>)
URLCitation ChatCompletionMessageAnnotationURLCitation
A URL citation when using web search.
EndIndex int64
The index of the last character of the URL citation in the message.
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) annotations > (items) > (property) url_citation > (property) end_index>)
StartIndex int64
The index of the first character of the URL citation in the message.
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) annotations > (items) > (property) url_citation > (property) start_index>)
Title string
The title of the web resource.
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) annotations > (items) > (property) url_citation > (property) title>)
URL string
The URL of the web resource.
formaturi
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) annotations > (items) > (property) url_citation > (property) url>)
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) annotations > (items) > (property) url_citation>)
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) annotations>)
Audio [ChatCompletionAudio](</api/reference/go/resources/chat#(resource) chat.completions > (model) chat_completion_audio > (schema)>)Optional
If the audio output modality is requested, this object contains data
about the audio response from the model. [Learn more](https://platform.openai.com/docs/guides/audio).
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) audio>)
DeprecatedFunctionCall ChatCompletionMessageFunctionCallOptional
Deprecated and replaced by `tool\_calls`. The name and arguments of a function that should be called, as generated by the model.
Arguments string
The arguments to call the function with, as generated by the model in JSON format. Note that the model does not always generate valid JSON, and may hallucinate parameters not defined by your function schema. Validate the arguments in your code before calling your function.
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) function_call > (property) arguments>)
Name string
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) function_call > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) function_call>)
ToolCalls [][ChatCompletionMessageToolCallUnion](</api/reference/go/resources/chat#(resource) chat.completions > (model) chat_completion_message_tool_call > (schema)>)Optional
The tool calls generated by the model, such as function calls.
One of the following:
type ChatCompletionMessageFunctionToolCall struct{…}
A call to a function tool created by the model.
ID string
The ID of the tool call.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) id>)
Function ChatCompletionMessageFunctionToolCallFunction
The function that the model called.
Arguments string
The arguments to call the function with, as generated by the model in JSON format. Note that the model does not always generate valid JSON, and may hallucinate parameters not defined by your function schema. Validate the arguments in your code before calling your function.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function > (property) arguments>)
Name string
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function>)
Type Function
The type of the tool. Currently, only `function` is supported.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema)>)
type ChatCompletionMessageCustomToolCall struct{…}
A call to a custom tool created by the model.
ID string
The ID of the tool call.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) id>)
Custom ChatCompletionMessageCustomToolCallCustom
The custom tool that the model called.
Input string
The input for the custom tool call generated by the model.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom > (property) input>)
Name string
The name of the custom tool to call.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom>)
Type Custom
The type of the tool. Always `custom`.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema)>)
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) tool_calls>)
[](<#(resource) chat.completions > (model) chat_completion_message > (schema)>)
type ChatCompletionMessageCustomToolCall struct{…}
A call to a custom tool created by the model.
ID string
The ID of the tool call.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) id>)
Custom ChatCompletionMessageCustomToolCallCustom
The custom tool that the model called.
Input string
The input for the custom tool call generated by the model.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom > (property) input>)
Name string
The name of the custom tool to call.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom>)
Type Custom
The type of the tool. Always `custom`.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema)>)
type ChatCompletionMessageFunctionToolCall struct{…}
A call to a function tool created by the model.
ID string
The ID of the tool call.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) id>)
Function ChatCompletionMessageFunctionToolCallFunction
The function that the model called.
Arguments string
The arguments to call the function with, as generated by the model in JSON format. Note that the model does not always generate valid JSON, and may hallucinate parameters not defined by your function schema. Validate the arguments in your code before calling your function.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function > (property) arguments>)
Name string
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function>)
Type Function
The type of the tool. Currently, only `function` is supported.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema)>)
type ChatCompletionMessageParamUnionResp interface{…}
Developer-provided instructions that the model should follow, regardless of
messages sent by the user. With o1 models and newer, `developer` messages
replace the previous `system` messages.
One of the following:
type ChatCompletionDeveloperMessageParamResp struct{…}
Developer-provided instructions that the model should follow, regardless of
messages sent by the user. With o1 models and newer, `developer` messages
replace the previous `system` messages.
Content ChatCompletionDeveloperMessageParamContentUnionResp
The contents of the developer message.
One of the following:
string
[](<#(resource) chat.completions > (model) chat_completion_developer_message_param > (schema) > (property) content > (variant) 0>)
[][ChatCompletionContentPartText](</api/reference/go/resources/chat#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>)
Text string
The text content.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) text>)
Type Text
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_developer_message_param > (schema) > (property) content > (variant) 1>)
[](<#(resource) chat.completions > (model) chat_completion_developer_message_param > (schema) > (property) content>)
Role Developer
The role of the messages author, in this case `developer`.
[](<#(resource) chat.completions > (model) chat_completion_developer_message_param > (schema) > (property) role>)
Name stringOptional
An optional name for the participant. Provides the model information to differentiate between participants of the same role.
[](<#(resource) chat.completions > (model) chat_completion_developer_message_param > (schema) > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_developer_message_param > (schema)>)
type ChatCompletionSystemMessageParamResp struct{…}
Developer-provided instructions that the model should follow, regardless of
messages sent by the user. With o1 models and newer, use `developer` messages
for this purpose instead.
Content ChatCompletionSystemMessageParamContentUnionResp
The contents of the system message.
One of the following:
string
[](<#(resource) chat.completions > (model) chat_completion_system_message_param > (schema) > (property) content > (variant) 0>)
[][ChatCompletionContentPartText](</api/reference/go/resources/chat#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>)
Text string
The text content.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) text>)
Type Text
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_system_message_param > (schema) > (property) content > (variant) 1>)
[](<#(resource) chat.completions > (model) chat_completion_system_message_param > (schema) > (property) content>)
Role System
The role of the messages author, in this case `system`.
[](<#(resource) chat.completions > (model) chat_completion_system_message_param > (schema) > (property) role>)
Name stringOptional
An optional name for the participant. Provides the model information to differentiate between participants of the same role.
[](<#(resource) chat.completions > (model) chat_completion_system_message_param > (schema) > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_system_message_param > (schema)>)
type ChatCompletionUserMessageParamResp struct{…}
Messages sent by an end user, containing prompts or additional context
information.
Content ChatCompletionUserMessageParamContentUnionResp
The contents of the user message.
One of the following:
string
[](<#(resource) chat.completions > (model) chat_completion_user_message_param > (schema) > (property) content > (variant) 0>)
[][ChatCompletionContentPartUnion](</api/reference/go/resources/chat#(resource) chat.completions > (model) chat_completion_content_part > (schema)>)
One of the following:
type ChatCompletionContentPartText struct{…}
Learn about [text inputs](https://platform.openai.com/docs/guides/text-generation).
Text string
The text content.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) text>)
Type Text
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>)
type ChatCompletionContentPartImage struct{…}
Learn about [image inputs](https://platform.openai.com/docs/guides/vision).
ImageURL ChatCompletionContentPartImageImageURL
URL string
Either a URL of the image or the base64 encoded image data.
formaturi
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) url>)
Detail stringOptional
Specifies the detail level of the image. Learn more in the [Vision guide](https://platform.openai.com/docs/guides/vision#low-or-high-fidelity-image-understanding).
One of the following:
const ChatCompletionContentPartImageImageURLDetailAuto ChatCompletionContentPartImageImageURLDetail = "auto"
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail > (member) 0>)
const ChatCompletionContentPartImageImageURLDetailLow ChatCompletionContentPartImageImageURLDetail = "low"
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail > (member) 1>)
const ChatCompletionContentPartImageImageURLDetailHigh ChatCompletionContentPartImageImageURLDetail = "high"
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail > (member) 2>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url>)
Type ImageURL
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema)>)
type ChatCompletionContentPartInputAudio struct{…}
Learn about [audio inputs](https://platform.openai.com/docs/guides/audio).
InputAudio ChatCompletionContentPartInputAudioInputAudio
Data string
Base64 encoded audio data.
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio > (property) data>)
Format string
The format of the encoded audio data. Currently supports “wav” and “mp3”.
One of the following:
const ChatCompletionContentPartInputAudioInputAudioFormatWAV ChatCompletionContentPartInputAudioInputAudioFormat = "wav"
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
const ChatCompletionContentPartInputAudioInputAudioFormatMP3 ChatCompletionContentPartInputAudioInputAudioFormat = "mp3"
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio>)
Type InputAudio
The type of the content part. Always `input\_audio`.
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema)>)
ChatCompletionContentPartFile
File ChatCompletionContentPartFileFile
FileData stringOptional
The base64 encoded file data, used when passing the file to the model
as a string.
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3 > (property) file > (property) file_data>)
FileID stringOptional
The ID of an uploaded file to use as input.
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3 > (property) file > (property) file_id>)
Filename stringOptional
The name of the file, used when passing the file to the model as a
string.
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3 > (property) file > (property) filename>)
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3 > (property) file>)
Type File
The type of the content part. Always `file`.
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3 > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3>)
[](<#(resource) chat.completions > (model) chat_completion_user_message_param > (schema) > (property) content > (variant) 1>)
[](<#(resource) chat.completions > (model) chat_completion_user_message_param > (schema) > (property) content>)
Role User
The role of the messages author, in this case `user`.
[](<#(resource) chat.completions > (model) chat_completion_user_message_param > (schema) > (property) role>)
Name stringOptional
An optional name for the participant. Provides the model information to differentiate between participants of the same role.
[](<#(resource) chat.completions > (model) chat_completion_user_message_param > (schema) > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_user_message_param > (schema)>)
type ChatCompletionAssistantMessageParamResp struct{…}
Messages sent by the model in response to user messages.
Role Assistant
The role of the messages author, in this case `assistant`.
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) role>)
Audio ChatCompletionAssistantMessageParamAudioRespOptional
Data about a previous audio response from the model.
[Learn more](https://platform.openai.com/docs/guides/audio).
ID string
Unique identifier for a previous audio response from the model.
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) audio > (property) id>)
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) audio>)
Content ChatCompletionAssistantMessageParamContentUnionRespOptional
The contents of the assistant message. Required unless `tool\_calls` or `function\_call` is specified.
One of the following:
string
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) content > (variant) 0>)
[]ChatCompletionAssistantMessageParamContentArrayOfContentPartUnionResp
One of the following:
type ChatCompletionContentPartText struct{…}
Learn about [text inputs](https://platform.openai.com/docs/guides/text-generation).
Text string
The text content.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) text>)
Type Text
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>)
type ChatCompletionContentPartRefusal struct{…}
Refusal string
The refusal message generated by the model.
[](<#(resource) chat.completions > (model) chat_completion_content_part_refusal > (schema) > (property) refusal>)
Type Refusal
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_refusal > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_refusal > (schema)>)
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) content > (variant) 1>)
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) content>)
DeprecatedFunctionCall ChatCompletionAssistantMessageParamFunctionCallRespOptional
Deprecated and replaced by `tool\_calls`. The name and arguments of a function that should be called, as generated by the model.
Arguments string
The arguments to call the function with, as generated by the model in JSON format. Note that the model does not always generate valid JSON, and may hallucinate parameters not defined by your function schema. Validate the arguments in your code before calling your function.
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) function_call > (property) arguments>)
Name string
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) function_call > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) function_call>)
Name stringOptional
An optional name for the participant. Provides the model information to differentiate between participants of the same role.
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) name>)
Refusal stringOptional
The refusal message by the assistant.
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) refusal>)
ToolCalls [][ChatCompletionMessageToolCallUnion](</api/reference/go/resources/chat#(resource) chat.completions > (model) chat_completion_message_tool_call > (schema)>)Optional
The tool calls generated by the model, such as function calls.
One of the following:
type ChatCompletionMessageFunctionToolCall struct{…}
A call to a function tool created by the model.
ID string
The ID of the tool call.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) id>)
Function ChatCompletionMessageFunctionToolCallFunction
The function that the model called.
Arguments string
The arguments to call the function with, as generated by the model in JSON format. Note that the model does not always generate valid JSON, and may hallucinate parameters not defined by your function schema. Validate the arguments in your code before calling your function.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function > (property) arguments>)
Name string
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function>)
Type Function
The type of the tool. Currently, only `function` is supported.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema)>)
type ChatCompletionMessageCustomToolCall struct{…}
A call to a custom tool created by the model.
ID string
The ID of the tool call.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) id>)
Custom ChatCompletionMessageCustomToolCallCustom
The custom tool that the model called.
Input string
The input for the custom tool call generated by the model.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom > (property) input>)
Name string
The name of the custom tool to call.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom>)
Type Custom
The type of the tool. Always `custom`.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema)>)
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) tool_calls>)
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema)>)
type ChatCompletionToolMessageParamResp struct{…}
Content ChatCompletionToolMessageParamContentUnionResp
The contents of the tool message.
One of the following:
string
[](<#(resource) chat.completions > (model) chat_completion_tool_message_param > (schema) > (property) content > (variant) 0>)
[][ChatCompletionContentPartText](</api/reference/go/resources/chat#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>)
Text string
The text content.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) text>)
Type Text
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_tool_message_param > (schema) > (property) content > (variant) 1>)
[](<#(resource) chat.completions > (model) chat_completion_tool_message_param > (schema) > (property) content>)
Role Tool
The role of the messages author, in this case `tool`.
[](<#(resource) chat.completions > (model) chat_completion_tool_message_param > (schema) > (property) role>)
ToolCallID string
Tool call that this message is responding to.
[](<#(resource) chat.completions > (model) chat_completion_tool_message_param > (schema) > (property) tool_call_id>)
[](<#(resource) chat.completions > (model) chat_completion_tool_message_param > (schema)>)
type ChatCompletionFunctionMessageParamResp struct{…}
Content string
The contents of the function message.
[](<#(resource) chat.completions > (model) chat_completion_function_message_param > (schema) > (property) content>)
Name string
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion_function_message_param > (schema) > (property) name>)
Role Function
The role of the messages author, in this case `function`.
[](<#(resource) chat.completions > (model) chat_completion_function_message_param > (schema) > (property) role>)
[](<#(resource) chat.completions > (model) chat_completion_function_message_param > (schema)>)
[](<#(resource) chat.completions > (model) chat_completion_message_param > (schema)>)
type ChatCompletionMessageToolCallUnion interface{…}
A call to a function tool created by the model.
One of the following:
type ChatCompletionMessageFunctionToolCall struct{…}
A call to a function tool created by the model.
ID string
The ID of the tool call.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) id>)
Function ChatCompletionMessageFunctionToolCallFunction
The function that the model called.
Arguments string
The arguments to call the function with, as generated by the model in JSON format. Note that the model does not always generate valid JSON, and may hallucinate parameters not defined by your function schema. Validate the arguments in your code before calling your function.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function > (property) arguments>)
Name string
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function>)
Type Function
The type of the tool. Currently, only `function` is supported.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema)>)
type ChatCompletionMessageCustomToolCall struct{…}
A call to a custom tool created by the model.
ID string
The ID of the tool call.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) id>)
Custom ChatCompletionMessageCustomToolCallCustom
The custom tool that the model called.
Input string
The input for the custom tool call generated by the model.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom > (property) input>)
Name string
The name of the custom tool to call.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom>)
Type Custom
The type of the tool. Always `custom`.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema)>)
[](<#(resource) chat.completions > (model) chat_completion_message_tool_call > (schema)>)
type ChatCompletionModality string
One of the following:
const ChatCompletionModalityText [ChatCompletionModality](</api/reference/go/resources/chat#(resource) chat.completions > (model) chat_completion_modality > (schema)>) = "text"
[](<#(resource) chat.completions > (model) chat_completion_modality > (schema) > (member) 0>)
const ChatCompletionModalityAudio [ChatCompletionModality](</api/reference/go/resources/chat#(resource) chat.completions > (model) chat_completion_modality > (schema)>) = "audio"
[](<#(resource) chat.completions > (model) chat_completion_modality > (schema) > (member) 1>)
[](<#(resource) chat.completions > (model) chat_completion_modality > (schema)>)
type ChatCompletionNamedToolChoice struct{…}
Specifies a tool the model should use. Use to force the model to call a specific function.
Function ChatCompletionNamedToolChoiceFunction
Name string
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion_named_tool_choice > (schema) > (property) function > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_named_tool_choice > (schema) > (property) function>)
Type Function
For function calling, the type is always `function`.
[](<#(resource) chat.completions > (model) chat_completion_named_tool_choice > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_named_tool_choice > (schema)>)
type ChatCompletionNamedToolChoiceCustom struct{…}
Specifies a tool the model should use. Use to force the model to call a specific custom tool.
Custom ChatCompletionNamedToolChoiceCustomCustom
Name string
The name of the custom tool to call.
[](<#(resource) chat.completions > (model) chat_completion_named_tool_choice_custom > (schema) > (property) custom > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_named_tool_choice_custom > (schema) > (property) custom>)
Type Custom
For custom tool calling, the type is always `custom`.
[](<#(resource) chat.completions > (model) chat_completion_named_tool_choice_custom > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_named_tool_choice_custom > (schema)>)
type ChatCompletionPredictionContent struct{…}
Static predicted output content, such as the content of a text file that is
being regenerated.
Content ChatCompletionPredictionContentContentUnion
The content that should be matched when generating a model response.
If generated tokens would match this content, the entire model response
can be returned much more quickly.
One of the following:
string
[](<#(resource) chat.completions > (model) chat_completion_prediction_content > (schema) > (property) content > (variant) 0>)
[][ChatCompletionContentPartText](</api/reference/go/resources/chat#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>)
Text string
The text content.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) text>)
Type Text
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_prediction_content > (schema) > (property) content > (variant) 1>)
[](<#(resource) chat.completions > (model) chat_completion_prediction_content > (schema) > (property) content>)
Type Content
The type of the predicted content you want to provide. This type is
currently always `content`.
[](<#(resource) chat.completions > (model) chat_completion_prediction_content > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_prediction_content > (schema)>)
type ChatCompletionRole string
The role of the author of a message
One of the following:
const ChatCompletionRoleDeveloper [ChatCompletionRole](</api/reference/go/resources/chat#(resource) chat.completions > (model) chat_completion_role > (schema)>) = "developer"
[](<#(resource) chat.completions > (model) chat_completion_role > (schema) > (member) 0>)
const ChatCompletionRoleSystem [ChatCompletionRole](</api/reference/go/resources/chat#(resource) chat.completions > (model) chat_completion_role > (schema)>) = "system"
[](<#(resource) chat.completions > (model) chat_completion_role > (schema) > (member) 1>)
const ChatCompletionRoleUser [ChatCompletionRole](</api/reference/go/resources/chat#(resource) chat.completions > (model) chat_completion_role > (schema)>) = "user"
[](<#(resource) chat.completions > (model) chat_completion_role > (schema) > (member) 2>)
const ChatCompletionRoleAssistant [ChatCompletionRole](</api/reference/go/resources/chat#(resource) chat.completions > (model) chat_completion_role > (schema)>) = "assistant"
[](<#(resource) chat.completions > (model) chat_completion_role > (schema) > (member) 3>)
const ChatCompletionRoleTool [ChatCompletionRole](</api/reference/go/resources/chat#(resource) chat.completions > (model) chat_completion_role > (schema)>) = "tool"
[](<#(resource) chat.completions > (model) chat_completion_role > (schema) > (member) 4>)
const ChatCompletionRoleFunction [ChatCompletionRole](</api/reference/go/resources/chat#(resource) chat.completions > (model) chat_completion_role > (schema)>) = "function"
[](<#(resource) chat.completions > (model) chat_completion_role > (schema) > (member) 5>)
[](<#(resource) chat.completions > (model) chat_completion_role > (schema)>)
type ChatCompletionStoreMessage struct{…}
A chat completion message generated by the model.
ID string
The identifier of the chat message.
[](<#(resource) chat.completions > (model) chat_completion_store_message > (schema) > (entry) 1 > (property) id>)
ContentParts []ChatCompletionStoreMessageContentPartUnionOptional
If a content parts array was provided, this is an array of `text` and `image\_url` parts.
Otherwise, null.
One of the following:
type ChatCompletionContentPartText struct{…}
Learn about [text inputs](https://platform.openai.com/docs/guides/text-generation).
Text string
The text content.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) text>)
Type Text
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>)
type ChatCompletionContentPartImage struct{…}
Learn about [image inputs](https://platform.openai.com/docs/guides/vision).
ImageURL ChatCompletionContentPartImageImageURL
URL string
Either a URL of the image or the base64 encoded image data.
formaturi
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) url>)
Detail stringOptional
Specifies the detail level of the image. Learn more in the [Vision guide](https://platform.openai.com/docs/guides/vision#low-or-high-fidelity-image-understanding).
One of the following:
const ChatCompletionContentPartImageImageURLDetailAuto ChatCompletionContentPartImageImageURLDetail = "auto"
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail > (member) 0>)
const ChatCompletionContentPartImageImageURLDetailLow ChatCompletionContentPartImageImageURLDetail = "low"
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail > (member) 1>)
const ChatCompletionContentPartImageImageURLDetailHigh ChatCompletionContentPartImageImageURLDetail = "high"
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail > (member) 2>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url>)
Type ImageURL
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema)>)
[](<#(resource) chat.completions > (model) chat_completion_store_message > (schema) > (entry) 1 > (property) content_parts>)
[](<#(resource) chat.completions > (model) chat_completion_store_message > (schema)>)
type ChatCompletionStreamOptions struct{…}
Options for streaming response. Only set this when you set `stream: true`.
IncludeObfuscation boolOptional
When true, stream obfuscation will be enabled. Stream obfuscation adds
random characters to an `obfuscation` field on streaming delta events to
normalize payload sizes as a mitigation to certain side-channel attacks.
These obfuscation fields are included by default, but add a small amount
of overhead to the data stream. You can set `include\_obfuscation` to
false to optimize for bandwidth if you trust the network links between
your application and the OpenAI API.
[](<#(resource) chat.completions > (model) chat_completion_stream_options > (schema) > (property) include_obfuscation>)
IncludeUsage boolOptional
If set, an additional chunk will be streamed before the `data: [DONE]`
message. The `usage` field on this chunk shows the token usage statistics
for the entire request, and the `choices` field will always be an empty
array.
All other chunks will also include a `usage` field, but with a null
value. **NOTE:** If the stream is interrupted, you may not receive the
final usage chunk which contains the total token usage for the request.
[](<#(resource) chat.completions > (model) chat_completion_stream_options > (schema) > (property) include_usage>)
[](<#(resource) chat.completions > (model) chat_completion_stream_options > (schema)>)
type ChatCompletionSystemMessageParamResp struct{…}
Developer-provided instructions that the model should follow, regardless of
messages sent by the user. With o1 models and newer, use `developer` messages
for this purpose instead.
Content ChatCompletionSystemMessageParamContentUnionResp
The contents of the system message.
One of the following:
string
[](<#(resource) chat.completions > (model) chat_completion_system_message_param > (schema) > (property) content > (variant) 0>)
[][ChatCompletionContentPartText](</api/reference/go/resources/chat#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>)
Text string
The text content.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) text>)
Type Text
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_system_message_param > (schema) > (property) content > (variant) 1>)
[](<#(resource) chat.completions > (model) chat_completion_system_message_param > (schema) > (property) content>)
Role System
The role of the messages author, in this case `system`.
[](<#(resource) chat.completions > (model) chat_completion_system_message_param > (schema) > (property) role>)
Name stringOptional
An optional name for the participant. Provides the model information to differentiate between participants of the same role.
[](<#(resource) chat.completions > (model) chat_completion_system_message_param > (schema) > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_system_message_param > (schema)>)
type ChatCompletionTokenLogprob struct{…}
Token string
The token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) token>)
Bytes []int64
A list of integers representing the UTF-8 bytes representation of the token. Useful in instances where characters are represented by multiple tokens and their byte representations must be combined to generate the correct text representation. Can be `null` if there is no bytes representation for the token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) bytes>)
Logprob float64
The log probability of this token, if it is within the top 20 most likely tokens. Otherwise, the value `-9999.0` is used to signify that the token is very unlikely.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) logprob>)
TopLogprobs []ChatCompletionTokenLogprobTopLogprob
List of the most likely tokens and their log probability, at this token position. In rare cases, there may be fewer than the number of requested `top\_logprobs` returned.
Token string
The token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) token>)
Bytes []int64
A list of integers representing the UTF-8 bytes representation of the token. Useful in instances where characters are represented by multiple tokens and their byte representations must be combined to generate the correct text representation. Can be `null` if there is no bytes representation for the token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) bytes>)
Logprob float64
The log probability of this token, if it is within the top 20 most likely tokens. Otherwise, the value `-9999.0` is used to signify that the token is very unlikely.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) logprob>)
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs>)
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema)>)
type ChatCompletionToolUnion interface{…}
A function tool that can be used to generate a response.
One of the following:
type ChatCompletionFunctionTool struct{…}
A function tool that can be used to generate a response.
Function [FunctionDefinition](</api/reference/go/resources/$shared#(resource) $shared > (model) function_definition > (schema)>)
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema) > (property) function>)
Type Function
The type of the tool. Currently, only `function` is supported.
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema)>)
type ChatCompletionCustomTool struct{…}
A custom tool that processes input using a specified format.
Custom ChatCompletionCustomToolCustom
Properties of the custom tool.
Name string
The name of the custom tool, used to identify it in tool calls.
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) name>)
Description stringOptional
Optional description of the custom tool, used to provide more context.
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) description>)
Format ChatCompletionCustomToolCustomFormatUnionOptional
The input format for the custom tool. Default is unconstrained text.
One of the following:
ChatCompletionCustomToolCustomFormatText
Type Text
Unconstrained text format. Always `text`.
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 0 > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 0>)
ChatCompletionCustomToolCustomFormatGrammar
Grammar ChatCompletionCustomToolCustomFormatGrammarGrammar
Your chosen grammar.
Definition string
The grammar definition.
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 1 > (property) grammar > (property) definition>)
Syntax string
The syntax of the grammar definition. One of `lark` or `regex`.
One of the following:
const ChatCompletionCustomToolCustomFormatGrammarGrammarSyntaxLark ChatCompletionCustomToolCustomFormatGrammarGrammarSyntax = "lark"
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 1 > (property) grammar > (property) syntax > (member) 0>)
const ChatCompletionCustomToolCustomFormatGrammarGrammarSyntaxRegex ChatCompletionCustomToolCustomFormatGrammarGrammarSyntax = "regex"
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 1 > (property) grammar > (property) syntax > (member) 1>)
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 1 > (property) grammar > (property) syntax>)
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 1 > (property) grammar>)
Type Grammar
Grammar format. Always `grammar`.
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 1 > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 1>)
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format>)
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom>)
Type Custom
The type of the custom tool. Always `custom`.
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema)>)
[](<#(resource) chat.completions > (model) chat_completion_tool > (schema)>)
type ChatCompletionToolChoiceOptionUnion interface{…}
Controls which (if any) tool is called by the model.
`none` means the model will not call any tool and instead generates a message.
`auto` means the model can pick between generating a message or calling one or more tools.
`required` means the model must call one or more tools.
Specifying a particular tool via `{"type": "function", "function": {"name": "my\_function"}}` forces the model to call that tool.
`none` is the default when no tools are present. `auto` is the default if tools are present.
One of the following:
string
One of the following:
const ChatCompletionToolChoiceOptionAutoNone ChatCompletionToolChoiceOptionAuto = "none"
[](<#(resource) chat.completions > (model) chat_completion_tool_choice_option > (schema) > (variant) 0 > (member) 0>)
const ChatCompletionToolChoiceOptionAutoAuto ChatCompletionToolChoiceOptionAuto = "auto"
[](<#(resource) chat.completions > (model) chat_completion_tool_choice_option > (schema) > (variant) 0 > (member) 1>)
const ChatCompletionToolChoiceOptionAutoRequired ChatCompletionToolChoiceOptionAuto = "required"
[](<#(resource) chat.completions > (model) chat_completion_tool_choice_option > (schema) > (variant) 0 > (member) 2>)
[](<#(resource) chat.completions > (model) chat_completion_tool_choice_option > (schema) > (variant) 0>)
type ChatCompletionAllowedToolChoice struct{…}
Constrains the tools available to the model to a pre-defined set.
AllowedTools [ChatCompletionAllowedTools](</api/reference/go/resources/chat#(resource) chat.completions > (model) ChatCompletionAllowedTools > (schema)>)
Constrains the tools available to the model to a pre-defined set.
[](<#(resource) chat.completions > (model) chat_completion_allowed_tool_choice > (schema) > (property) allowed_tools>)
Type AllowedTools
Allowed tool configuration type. Always `allowed\_tools`.
[](<#(resource) chat.completions > (model) chat_completion_allowed_tool_choice > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_allowed_tool_choice > (schema)>)
type ChatCompletionNamedToolChoice struct{…}
Specifies a tool the model should use. Use to force the model to call a specific function.
Function ChatCompletionNamedToolChoiceFunction
Name string
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion_named_tool_choice > (schema) > (property) function > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_named_tool_choice > (schema) > (property) function>)
Type Function
For function calling, the type is always `function`.
[](<#(resource) chat.completions > (model) chat_completion_named_tool_choice > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_named_tool_choice > (schema)>)
type ChatCompletionNamedToolChoiceCustom struct{…}
Specifies a tool the model should use. Use to force the model to call a specific custom tool.
Custom ChatCompletionNamedToolChoiceCustomCustom
Name string
The name of the custom tool to call.
[](<#(resource) chat.completions > (model) chat_completion_named_tool_choice_custom > (schema) > (property) custom > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_named_tool_choice_custom > (schema) > (property) custom>)
Type Custom
For custom tool calling, the type is always `custom`.
[](<#(resource) chat.completions > (model) chat_completion_named_tool_choice_custom > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_named_tool_choice_custom > (schema)>)
[](<#(resource) chat.completions > (model) chat_completion_tool_choice_option > (schema)>)
type ChatCompletionToolMessageParamResp struct{…}
Content ChatCompletionToolMessageParamContentUnionResp
The contents of the tool message.
One of the following:
string
[](<#(resource) chat.completions > (model) chat_completion_tool_message_param > (schema) > (property) content > (variant) 0>)
[][ChatCompletionContentPartText](</api/reference/go/resources/chat#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>)
Text string
The text content.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) text>)
Type Text
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_tool_message_param > (schema) > (property) content > (variant) 1>)
[](<#(resource) chat.completions > (model) chat_completion_tool_message_param > (schema) > (property) content>)
Role Tool
The role of the messages author, in this case `tool`.
[](<#(resource) chat.completions > (model) chat_completion_tool_message_param > (schema) > (property) role>)
ToolCallID string
Tool call that this message is responding to.
[](<#(resource) chat.completions > (model) chat_completion_tool_message_param > (schema) > (property) tool_call_id>)
[](<#(resource) chat.completions > (model) chat_completion_tool_message_param > (schema)>)
type ChatCompletionUserMessageParamResp struct{…}
Messages sent by an end user, containing prompts or additional context
information.
Content ChatCompletionUserMessageParamContentUnionResp
The contents of the user message.
One of the following:
string
[](<#(resource) chat.completions > (model) chat_completion_user_message_param > (schema) > (property) content > (variant) 0>)
[][ChatCompletionContentPartUnion](</api/reference/go/resources/chat#(resource) chat.completions > (model) chat_completion_content_part > (schema)>)
One of the following:
type ChatCompletionContentPartText struct{…}
Learn about [text inputs](https://platform.openai.com/docs/guides/text-generation).
Text string
The text content.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) text>)
Type Text
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>)
type ChatCompletionContentPartImage struct{…}
Learn about [image inputs](https://platform.openai.com/docs/guides/vision).
ImageURL ChatCompletionContentPartImageImageURL
URL string
Either a URL of the image or the base64 encoded image data.
formaturi
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) url>)
Detail stringOptional
Specifies the detail level of the image. Learn more in the [Vision guide](https://platform.openai.com/docs/guides/vision#low-or-high-fidelity-image-understanding).
One of the following:
const ChatCompletionContentPartImageImageURLDetailAuto ChatCompletionContentPartImageImageURLDetail = "auto"
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail > (member) 0>)
const ChatCompletionContentPartImageImageURLDetailLow ChatCompletionContentPartImageImageURLDetail = "low"
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail > (member) 1>)
const ChatCompletionContentPartImageImageURLDetailHigh ChatCompletionContentPartImageImageURLDetail = "high"
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail > (member) 2>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url>)
Type ImageURL
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema)>)
type ChatCompletionContentPartInputAudio struct{…}
Learn about [audio inputs](https://platform.openai.com/docs/guides/audio).
InputAudio ChatCompletionContentPartInputAudioInputAudio
Data string
Base64 encoded audio data.
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio > (property) data>)
Format string
The format of the encoded audio data. Currently supports “wav” and “mp3”.
One of the following:
const ChatCompletionContentPartInputAudioInputAudioFormatWAV ChatCompletionContentPartInputAudioInputAudioFormat = "wav"
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
const ChatCompletionContentPartInputAudioInputAudioFormatMP3 ChatCompletionContentPartInputAudioInputAudioFormat = "mp3"
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio>)
Type InputAudio
The type of the content part. Always `input\_audio`.
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema)>)
ChatCompletionContentPartFile
File ChatCompletionContentPartFileFile
FileData stringOptional
The base64 encoded file data, used when passing the file to the model
as a string.
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3 > (property) file > (property) file_data>)
FileID stringOptional
The ID of an uploaded file to use as input.
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3 > (property) file > (property) file_id>)
Filename stringOptional
The name of the file, used when passing the file to the model as a
string.
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3 > (property) file > (property) filename>)
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3 > (property) file>)
Type File
The type of the content part. Always `file`.
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3 > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3>)
[](<#(resource) chat.completions > (model) chat_completion_user_message_param > (schema) > (property) content > (variant) 1>)
[](<#(resource) chat.completions > (model) chat_completion_user_message_param > (schema) > (property) content>)
Role User
The role of the messages author, in this case `user`.
[](<#(resource) chat.completions > (model) chat_completion_user_message_param > (schema) > (property) role>)
Name stringOptional
An optional name for the participant. Provides the model information to differentiate between participants of the same role.
[](<#(resource) chat.completions > (model) chat_completion_user_message_param > (schema) > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_user_message_param > (schema)>)
type ChatCompletionAllowedTools struct{…}
Constrains the tools available to the model to a pre-defined set.
Mode ChatCompletionAllowedToolsMode
Constrains the tools available to the model to a pre-defined set.
`auto` allows the model to pick from among the allowed tools and generate a
message.
`required` requires the model to call one or more of the allowed tools.
One of the following:
const ChatCompletionAllowedToolsModeAuto ChatCompletionAllowedToolsMode = "auto"
[](<#(resource) chat.completions > (model) ChatCompletionAllowedTools > (schema) > (property) mode > (member) 0>)
const ChatCompletionAllowedToolsModeRequired ChatCompletionAllowedToolsMode = "required"
[](<#(resource) chat.completions > (model) ChatCompletionAllowedTools > (schema) > (property) mode > (member) 1>)
[](<#(resource) chat.completions > (model) ChatCompletionAllowedTools > (schema) > (property) mode>)
Tools []map[string, any]
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
##### [Get chat messages](/api/reference/go/resources/chat/subresources/completions/subresources/messages/methods/list)
client.Chat.Completions.Messages.List(ctx, completionID, query) (\*CursorPage[[ChatCompletionStoreMessage](</api/reference/go/resources/chat#(resource) chat.completions > (model) chat_completion_store_message > (schema)>)], error)
GET/chat/completions/{completion\_id}/messages