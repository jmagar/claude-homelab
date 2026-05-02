Create chat completion | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Chat](/api/reference/go/resources/chat)
[Completions](/api/reference/go/resources/chat/subresources/completions)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create chat completion
client.Chat.Completions.New(ctx, body) (\*[ChatCompletion](</api/reference/go/resources/chat#(resource) chat.completions > (model) chat_completion > (schema)>), error)
POST/chat/completions
**Starting a new project?** We recommend trying [Responses](https://platform.openai.com/docs/api-reference/responses)
to take advantage of the latest OpenAI platform features. Compare
[Chat Completions with Responses](https://platform.openai.com/docs/guides/responses-vs-chat-completions?api-mode=responses).
Creates a model response for the given chat conversation. Learn more in the
[text generation](https://platform.openai.com/docs/guides/text-generation), [vision](https://platform.openai.com/docs/guides/vision),
and [audio](https://platform.openai.com/docs/guides/audio) guides.
Parameter support can differ depending on the model used to generate the
response, particularly for newer reasoning models. Parameters that are only
supported for reasoning models are noted below. For the current state of
unsupported parameters in reasoning models,
[refer to the reasoning guide](https://platform.openai.com/docs/guides/reasoning).
Returns a chat completion object, or a streamed sequence of chat completion
chunk objects if the request is streamed.
##### ParametersExpand Collapse
body ChatCompletionNewParams
Messages param.Field[[][ChatCompletionMessageParamUnionResp](</api/reference/go/resources/chat#(resource) chat.completions > (model) chat_completion_message_param > (schema)>)]
A list of messages comprising the conversation so far. Depending on the
[model](https://platform.openai.com/docs/models) you use, different message types (modalities) are
supported, like [text](https://platform.openai.com/docs/guides/text-generation),
[images](https://platform.openai.com/docs/guides/vision), and [audio](https://platform.openai.com/docs/guides/audio).
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
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) messages>)
Model param.Field[[ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>)]
Model ID used to generate the response, like `gpt-4o` or `o3`. OpenAI
offers a wide range of models with different capabilities, performance
characteristics, and price points. Refer to the [model guide](https://platform.openai.com/docs/models)
to browse and compare available models.
string
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) model > (schema) > (variant) 0>)
type ChatModel string
One of the following:
const ChatModelGPT5\_4 [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-5.4"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 0>)
const ChatModelGPT5\_4Mini [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-5.4-mini"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 1>)
const ChatModelGPT5\_4Nano [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-5.4-nano"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 2>)
const ChatModelGPT5\_4Mini2026\_03\_17 [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-5.4-mini-2026-03-17"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 3>)
const ChatModelGPT5\_4Nano2026\_03\_17 [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-5.4-nano-2026-03-17"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 4>)
const ChatModelGPT5\_3ChatLatest [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-5.3-chat-latest"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 5>)
const ChatModelGPT5\_2 [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-5.2"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 6>)
const ChatModelGPT5\_2\_2025\_12\_11 [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-5.2-2025-12-11"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 7>)
const ChatModelGPT5\_2ChatLatest [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-5.2-chat-latest"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 8>)
const ChatModelGPT5\_2Pro [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-5.2-pro"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 9>)
const ChatModelGPT5\_2Pro2025\_12\_11 [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-5.2-pro-2025-12-11"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 10>)
const ChatModelGPT5\_1 [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-5.1"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 11>)
const ChatModelGPT5\_1\_2025\_11\_13 [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-5.1-2025-11-13"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 12>)
const ChatModelGPT5\_1Codex [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-5.1-codex"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 13>)
const ChatModelGPT5\_1Mini [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-5.1-mini"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 14>)
const ChatModelGPT5\_1ChatLatest [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-5.1-chat-latest"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 15>)
const ChatModelGPT5 [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-5"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 16>)
const ChatModelGPT5Mini [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-5-mini"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 17>)
const ChatModelGPT5Nano [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-5-nano"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 18>)
const ChatModelGPT5\_2025\_08\_07 [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-5-2025-08-07"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 19>)
const ChatModelGPT5Mini2025\_08\_07 [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-5-mini-2025-08-07"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 20>)
const ChatModelGPT5Nano2025\_08\_07 [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-5-nano-2025-08-07"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 21>)
const ChatModelGPT5ChatLatest [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-5-chat-latest"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 22>)
const ChatModelGPT4\_1 [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-4.1"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 23>)
const ChatModelGPT4\_1Mini [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-4.1-mini"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 24>)
const ChatModelGPT4\_1Nano [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-4.1-nano"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 25>)
const ChatModelGPT4\_1\_2025\_04\_14 [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-4.1-2025-04-14"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 26>)
const ChatModelGPT4\_1Mini2025\_04\_14 [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-4.1-mini-2025-04-14"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 27>)
const ChatModelGPT4\_1Nano2025\_04\_14 [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-4.1-nano-2025-04-14"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 28>)
const ChatModelO4Mini [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "o4-mini"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 29>)
const ChatModelO4Mini2025\_04\_16 [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "o4-mini-2025-04-16"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 30>)
const ChatModelO3 [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "o3"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 31>)
const ChatModelO3\_2025\_04\_16 [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "o3-2025-04-16"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 32>)
const ChatModelO3Mini [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "o3-mini"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 33>)
const ChatModelO3Mini2025\_01\_31 [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "o3-mini-2025-01-31"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 34>)
const ChatModelO1 [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "o1"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 35>)
const ChatModelO1\_2024\_12\_17 [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "o1-2024-12-17"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 36>)
const ChatModelO1Preview [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "o1-preview"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 37>)
const ChatModelO1Preview2024\_09\_12 [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "o1-preview-2024-09-12"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 38>)
const ChatModelO1Mini [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "o1-mini"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 39>)
const ChatModelO1Mini2024\_09\_12 [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "o1-mini-2024-09-12"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 40>)
const ChatModelGPT4o [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-4o"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 41>)
const ChatModelGPT4o2024\_11\_20 [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-4o-2024-11-20"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 42>)
const ChatModelGPT4o2024\_08\_06 [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-4o-2024-08-06"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 43>)
const ChatModelGPT4o2024\_05\_13 [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-4o-2024-05-13"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 44>)
const ChatModelGPT4oAudioPreview [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-4o-audio-preview"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 45>)
const ChatModelGPT4oAudioPreview2024\_10\_01 [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-4o-audio-preview-2024-10-01"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 46>)
const ChatModelGPT4oAudioPreview2024\_12\_17 [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-4o-audio-preview-2024-12-17"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 47>)
const ChatModelGPT4oAudioPreview2025\_06\_03 [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-4o-audio-preview-2025-06-03"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 48>)
const ChatModelGPT4oMiniAudioPreview [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-4o-mini-audio-preview"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 49>)
const ChatModelGPT4oMiniAudioPreview2024\_12\_17 [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-4o-mini-audio-preview-2024-12-17"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 50>)
const ChatModelGPT4oSearchPreview [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-4o-search-preview"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 51>)
const ChatModelGPT4oMiniSearchPreview [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-4o-mini-search-preview"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 52>)
const ChatModelGPT4oSearchPreview2025\_03\_11 [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-4o-search-preview-2025-03-11"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 53>)
const ChatModelGPT4oMiniSearchPreview2025\_03\_11 [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-4o-mini-search-preview-2025-03-11"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 54>)
const ChatModelChatgpt4oLatest [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "chatgpt-4o-latest"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 55>)
const ChatModelCodexMiniLatest [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "codex-mini-latest"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 56>)
const ChatModelGPT4oMini [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-4o-mini"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 57>)
const ChatModelGPT4oMini2024\_07\_18 [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-4o-mini-2024-07-18"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 58>)
const ChatModelGPT4Turbo [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-4-turbo"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 59>)
const ChatModelGPT4Turbo2024\_04\_09 [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-4-turbo-2024-04-09"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 60>)
const ChatModelGPT4\_0125Preview [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-4-0125-preview"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 61>)
const ChatModelGPT4TurboPreview [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-4-turbo-preview"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 62>)
const ChatModelGPT4\_1106Preview [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-4-1106-preview"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 63>)
const ChatModelGPT4VisionPreview [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-4-vision-preview"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 64>)
const ChatModelGPT4 [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-4"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 65>)
const ChatModelGPT4\_0314 [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-4-0314"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 66>)
const ChatModelGPT4\_0613 [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-4-0613"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 67>)
const ChatModelGPT4\_32k [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-4-32k"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 68>)
const ChatModelGPT4\_32k0314 [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-4-32k-0314"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 69>)
const ChatModelGPT4\_32k0613 [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-4-32k-0613"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 70>)
const ChatModelGPT3\_5Turbo [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-3.5-turbo"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 71>)
const ChatModelGPT3\_5Turbo16k [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-3.5-turbo-16k"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 72>)
const ChatModelGPT3\_5Turbo0301 [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-3.5-turbo-0301"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 73>)
const ChatModelGPT3\_5Turbo0613 [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-3.5-turbo-0613"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 74>)
const ChatModelGPT3\_5Turbo1106 [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-3.5-turbo-1106"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 75>)
const ChatModelGPT3\_5Turbo0125 [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-3.5-turbo-0125"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 76>)
const ChatModelGPT3\_5Turbo16k0613 [ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) = "gpt-3.5-turbo-16k-0613"
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 77>)
[](<#(resource) $shared > (model) chat_model > (schema)>)
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) model>)
Audio param.Field[[ChatCompletionAudioParamResp](</api/reference/go/resources/chat#(resource) chat.completions > (model) chat_completion_audio_param > (schema)>)]Optional
Parameters for audio output. Required when audio output is requested with
`modalities: ["audio"]`. [Learn more](https://platform.openai.com/docs/guides/audio).
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) audio>)
FrequencyPenalty param.Field[float64]Optional
Number between -2.0 and 2.0. Positive values penalize new tokens based on
their existing frequency in the text so far, decreasing the model’s
likelihood to repeat the same line verbatim.
minimum-2
maximum2
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) frequency_penalty>)
DeprecatedFunctionCall param.Field[[ChatCompletionNewParamsFunctionCallUnion](</api/reference/go/resources/chat/subresources/completions/methods/create#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) function_call > (schema)>)]Optional
Deprecated in favor of `tool\_choice`.
Controls which (if any) function is called by the model.
`none` means the model will not call a function and instead generates a
message.
`auto` means the model can pick between generating a message or calling a
function.
Specifying a particular function via `{"name": "my\_function"}` forces the
model to call that function.
`none` is the default when no functions are present. `auto` is the default
if functions are present.
string
One of the following:
const ChatCompletionNewParamsFunctionCallFunctionCallModeNone ChatCompletionNewParamsFunctionCallFunctionCallMode = "none"
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) function_call > (schema) > (variant) 0 > (member) 0>)
const ChatCompletionNewParamsFunctionCallFunctionCallModeAuto ChatCompletionNewParamsFunctionCallFunctionCallMode = "auto"
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) function_call > (schema) > (variant) 0 > (member) 1>)
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) function_call > (schema) > (variant) 0>)
type ChatCompletionFunctionCallOption struct{…}
Specifying a particular function via `{"name": "my\_function"}` forces the model to call that function.
Name string
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion_function_call_option > (schema) > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_function_call_option > (schema)>)
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) function_call>)
DeprecatedFunctions param.Field[[]ChatCompletionNewParamsFunction]Optional
Deprecated in favor of `tools`.
A list of functions the model may generate JSON inputs for.
Name string
The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) functions > (schema) > (items) > (property) name>)
Description stringOptional
A description of what the function does, used by the model to choose when and how to call the function.
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) functions > (schema) > (items) > (property) description>)
Parameters [FunctionParameters](</api/reference/go/resources/$shared#(resource) $shared > (model) function_parameters > (schema)>)Optional
The parameters the functions accepts, described as a JSON Schema object. See the [guide](https://platform.openai.com/docs/guides/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format.
Omitting `parameters` defines a function with an empty parameter list.
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) functions > (schema) > (items) > (property) parameters>)
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) functions>)
LogitBias param.Field[map[string, int64]]Optional
Modify the likelihood of specified tokens appearing in the completion.
Accepts a JSON object that maps tokens (specified by their token ID in the
tokenizer) to an associated bias value from -100 to 100. Mathematically,
the bias is added to the logits generated by the model prior to sampling.
The exact effect will vary per model, but values between -1 and 1 should
decrease or increase likelihood of selection; values like -100 or 100
should result in a ban or exclusive selection of the relevant token.
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) logit_bias>)
Logprobs param.Field[bool]Optional
Whether to return log probabilities of the output tokens or not. If true,
returns the log probabilities of each output token returned in the
`content` of `message`.
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) logprobs>)
MaxCompletionTokens param.Field[int64]Optional
An upper bound for the number of tokens that can be generated for a completion, including visible output tokens and [reasoning tokens](https://platform.openai.com/docs/guides/reasoning).
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) max_completion_tokens>)
DeprecatedMaxTokens param.Field[int64]Optional
The maximum number of [tokens](/tokenizer) that can be generated in the
chat completion. This value can be used to control
[costs](https://openai.com/api/pricing/) for text generated via API.
This value is now deprecated in favor of `max\_completion\_tokens`, and is
not compatible with [o-series models](https://platform.openai.com/docs/guides/reasoning).
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) max_tokens>)
Metadata param.Field[[Metadata](</api/reference/go/resources/$shared#(resource) $shared > (model) metadata > (schema)>)]Optional
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) metadata>)
Modalities param.Field[[]string]Optional
Output types that you would like the model to generate.
Most models are capable of generating text, which is the default:
`["text"]`
The `gpt-4o-audio-preview` model can also be used to
[generate audio](https://platform.openai.com/docs/guides/audio). To request that this model generate
both text and audio responses, you can use:
`["text", "audio"]`
const ChatCompletionNewParamsModalityText ChatCompletionNewParamsModality = "text"
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) modalities > (schema) > (items) > (member) 0>)
const ChatCompletionNewParamsModalityAudio ChatCompletionNewParamsModality = "audio"
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) modalities > (schema) > (items) > (member) 1>)
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) modalities>)
N param.Field[int64]Optional
How many chat completion choices to generate for each input message. Note that you will be charged based on the number of generated tokens across all of the choices. Keep `n` as `1` to minimize costs.
minimum1
maximum128
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) n>)
ParallelToolCalls param.Field[bool]Optional
Whether to enable [parallel function calling](https://platform.openai.com/docs/guides/function-calling#configuring-parallel-function-calling) during tool use.
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) parallel_tool_calls>)
Prediction param.Field[[ChatCompletionPredictionContent](</api/reference/go/resources/chat#(resource) chat.completions > (model) chat_completion_prediction_content > (schema)>)]Optional
Static predicted output content, such as the content of a text file that is
being regenerated.
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) prediction>)
PresencePenalty param.Field[float64]Optional
Number between -2.0 and 2.0. Positive values penalize new tokens based on
whether they appear in the text so far, increasing the model’s likelihood
to talk about new topics.
minimum-2
maximum2
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) presence_penalty>)
PromptCacheKey param.Field[string]Optional
Used by OpenAI to cache responses for similar requests to optimize your cache hit rates. Replaces the `user` field. [Learn more](https://platform.openai.com/docs/guides/prompt-caching).
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) prompt_cache_key>)
PromptCacheRetention param.Field[[ChatCompletionNewParamsPromptCacheRetention](</api/reference/go/resources/chat/subresources/completions/methods/create#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) prompt_cache_retention > (schema)>)]Optional
The retention policy for the prompt cache. Set to `24h` to enable extended prompt caching, which keeps cached prefixes active for longer, up to a maximum of 24 hours. [Learn more](https://platform.openai.com/docs/guides/prompt-caching#prompt-cache-retention).
const ChatCompletionNewParamsPromptCacheRetentionInMemory [ChatCompletionNewParamsPromptCacheRetention](</api/reference/go/resources/chat/subresources/completions/methods/create#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) prompt_cache_retention > (schema)>) = "in\_memory"
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) prompt_cache_retention > (schema) > (member) 0>)
const ChatCompletionNewParamsPromptCacheRetention24h [ChatCompletionNewParamsPromptCacheRetention](</api/reference/go/resources/chat/subresources/completions/methods/create#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) prompt_cache_retention > (schema)>) = "24h"
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) prompt_cache_retention > (schema) > (member) 1>)
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) prompt_cache_retention>)
ReasoningEffort param.Field[[ReasoningEffort](</api/reference/go/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>)]Optional
Constrains effort on reasoning for
[reasoning models](https://platform.openai.com/docs/guides/reasoning).
Currently supported values are `none`, `minimal`, `low`, `medium`, `high`, and `xhigh`. Reducing
reasoning effort can result in faster responses and fewer tokens used
on reasoning in a response.
* `gpt-5.1` defaults to `none`, which does not perform reasoning. The supported reasoning values for `gpt-5.1` are `none`, `low`, `medium`, and `high`. Tool calls are supported for all reasoning values in gpt-5.1.
* All models before `gpt-5.1` default to `medium` reasoning effort, and do not support `none`.
* The `gpt-5-pro` model defaults to (and only supports) `high` reasoning effort.
* `xhigh` is supported for all models after `gpt-5.1-codex-max`.
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) reasoning_effort>)
ResponseFormat param.Field[[ChatCompletionNewParamsResponseFormatUnion](</api/reference/go/resources/chat/subresources/completions/methods/create#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) response_format > (schema)>)]Optional
An object specifying the format that the model must output.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables
Structured Outputs which ensures the model will match your supplied JSON
schema. Learn more in the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables the older JSON mode, which
ensures the message the model generates is valid JSON. Using `json\_schema`
is preferred for models that support it.
type ResponseFormatText struct{…}
Default response format. Used to generate text responses.
Type Text
The type of response format being defined. Always `text`.
[](<#(resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) $shared > (model) response_format_text > (schema)>)
type ResponseFormatJSONSchema struct{…}
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](https://platform.openai.com/docs/guides/structured-outputs).
JSONSchema ResponseFormatJSONSchemaJSONSchema
Structured Outputs configuration options, including a JSON Schema.
Name string
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
Description stringOptional
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
Schema map[string, any]Optional
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
Strict boolOptional
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
Type JSONSchema
The type of response format being defined. Always `json\_schema`.
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) $shared > (model) response_format_json_schema > (schema)>)
type ResponseFormatJSONObject struct{…}
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
Type JSONObject
The type of response format being defined. Always `json\_object`.
[](<#(resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) $shared > (model) response_format_json_object > (schema)>)
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) response_format>)
SafetyIdentifier param.Field[string]Optional
A stable identifier used to help detect users of your application that may be violating OpenAI’s usage policies.
The IDs should be a string that uniquely identifies each user, with a maximum length of 64 characters. We recommend hashing their username or email address, in order to avoid sending us any identifying information. [Learn more](https://platform.openai.com/docs/guides/safety-best-practices#safety-identifiers).
maxLength64
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) safety_identifier>)
DeprecatedSeed param.Field[int64]Optional
This feature is in Beta.
If specified, our system will make a best effort to sample deterministically, such that repeated requests with the same `seed` and parameters should return the same result.
Determinism is not guaranteed, and you should refer to the `system\_fingerprint` response parameter to monitor changes in the backend.
minimum-9223372036854776000
maximum9223372036854776000
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) seed>)
ServiceTier param.Field[[ChatCompletionNewParamsServiceTier](</api/reference/go/resources/chat/subresources/completions/methods/create#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) service_tier > (schema)>)]Optional
Specifies the processing type used for serving the request.
* If set to ‘auto’, then the request will be processed with the service tier configured in the Project settings. Unless otherwise configured, the Project will use ‘default’.
* If set to ‘default’, then the request will be processed with the standard pricing and performance for the selected model.
* If set to ‘[flex](https://platform.openai.com/docs/guides/flex-processing)’ or ‘[priority](https://openai.com/api-priority-processing/)’, then the request will be processed with the corresponding service tier.
* When not set, the default behavior is ‘auto’.
When the `service\_tier` parameter is set, the response body will include the `service\_tier` value based on the processing mode actually used to serve the request. This response value may be different from the value set in the parameter.
const ChatCompletionNewParamsServiceTierAuto [ChatCompletionNewParamsServiceTier](</api/reference/go/resources/chat/subresources/completions/methods/create#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) service_tier > (schema)>) = "auto"
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) service_tier > (schema) > (member) 0>)
const ChatCompletionNewParamsServiceTierDefault [ChatCompletionNewParamsServiceTier](</api/reference/go/resources/chat/subresources/completions/methods/create#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) service_tier > (schema)>) = "default"
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) service_tier > (schema) > (member) 1>)
const ChatCompletionNewParamsServiceTierFlex [ChatCompletionNewParamsServiceTier](</api/reference/go/resources/chat/subresources/completions/methods/create#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) service_tier > (schema)>) = "flex"
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) service_tier > (schema) > (member) 2>)
const ChatCompletionNewParamsServiceTierScale [ChatCompletionNewParamsServiceTier](</api/reference/go/resources/chat/subresources/completions/methods/create#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) service_tier > (schema)>) = "scale"
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) service_tier > (schema) > (member) 3>)
const ChatCompletionNewParamsServiceTierPriority [ChatCompletionNewParamsServiceTier](</api/reference/go/resources/chat/subresources/completions/methods/create#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) service_tier > (schema)>) = "priority"
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) service_tier > (schema) > (member) 4>)
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) service_tier>)
Stop param.Field[[ChatCompletionNewParamsStopUnion](</api/reference/go/resources/chat/subresources/completions/methods/create#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) stop > (schema)>)]Optional
Not supported with latest reasoning models `o3` and `o4-mini`.
Up to 4 sequences where the API will stop generating further tokens. The
returned text will not contain the stop sequence.
string
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) stop > (schema) > (variant) 0>)
[]string
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) stop > (schema) > (variant) 1>)
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) stop>)
Store param.Field[bool]Optional
Whether or not to store the output of this chat completion request for
use in our [model distillation](https://platform.openai.com/docs/guides/distillation) or
[evals](https://platform.openai.com/docs/guides/evals) products.
Supports text and image inputs. Note: image inputs over 8MB will be dropped.
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) store>)
StreamOptions param.Field[[ChatCompletionStreamOptions](</api/reference/go/resources/chat#(resource) chat.completions > (model) chat_completion_stream_options > (schema)>)]Optional
Options for streaming response. Only set this when you set `stream: true`.
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) stream_options>)
Temperature param.Field[float64]Optional
What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
We generally recommend altering this or `top\_p` but not both.
minimum0
maximum2
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) temperature>)
ToolChoice param.Field[[ChatCompletionToolChoiceOptionUnion](</api/reference/go/resources/chat#(resource) chat.completions > (model) chat_completion_tool_choice_option > (schema)>)]Optional
Controls which (if any) tool is called by the model.
`none` means the model will not call any tool and instead generates a message.
`auto` means the model can pick between generating a message or calling one or more tools.
`required` means the model must call one or more tools.
Specifying a particular tool via `{"type": "function", "function": {"name": "my\_function"}}` forces the model to call that tool.
`none` is the default when no tools are present. `auto` is the default if tools are present.
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) tool_choice>)
Tools param.Field[[][ChatCompletionToolUnion](</api/reference/go/resources/chat#(resource) chat.completions > (model) chat_completion_tool > (schema)>)]Optional
A list of tools the model may call. You can provide either
[custom tools](https://platform.openai.com/docs/guides/function-calling#custom-tools) or
[function tools](https://platform.openai.com/docs/guides/function-calling).
type ChatCompletionFunctionTool struct{…}
A function tool that can be used to generate a response.
Function [FunctionDefinition](</api/reference/go/resources/$shared#(resource) $shared > (model) function_definition > (schema)>)
Name string
The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) name>)
Description stringOptional
A description of what the function does, used by the model to choose when and how to call the function.
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) description>)
Parameters [FunctionParameters](</api/reference/go/resources/$shared#(resource) $shared > (model) function_parameters > (schema)>)Optional
The parameters the functions accepts, described as a JSON Schema object. See the [guide](https://platform.openai.com/docs/guides/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format.
Omitting `parameters` defines a function with an empty parameter list.
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) parameters>)
Strict boolOptional
Whether to enable strict schema adherence when generating the function call. If set to true, the model will follow the exact schema defined in the `parameters` field. Only a subset of JSON Schema is supported when `strict` is `true`. Learn more about Structured Outputs in the [function calling guide](https://platform.openai.com/docs/guides/function-calling).
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) strict>)
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
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) tools>)
TopLogprobs param.Field[int64]Optional
An integer between 0 and 20 specifying the number of most likely tokens to
return at each token position, each with an associated log probability.
`logprobs` must be set to `true` if this parameter is used.
minimum0
maximum20
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) top_logprobs>)
TopP param.Field[float64]Optional
An alternative to sampling with temperature, called nucleus sampling,
where the model considers the results of the tokens with top\_p probability
mass. So 0.1 means only the tokens comprising the top 10% probability mass
are considered.
We generally recommend altering this or `temperature` but not both.
minimum0
maximum1
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) top_p>)
DeprecatedUser param.Field[string]Optional
This field is being replaced by `safety\_identifier` and `prompt\_cache\_key`. Use `prompt\_cache\_key` instead to maintain caching optimizations.
A stable identifier for your end-users.
Used to boost cache hit rates by better bucketing similar requests and to help OpenAI detect and prevent abuse. [Learn more](https://platform.openai.com/docs/guides/safety-best-practices#safety-identifiers).
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) user>)
Verbosity param.Field[[ChatCompletionNewParamsVerbosity](</api/reference/go/resources/chat/subresources/completions/methods/create#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) verbosity > (schema)>)]Optional
Constrains the verbosity of the model’s response. Lower values will result in
more concise responses, while higher values will result in more verbose responses.
Currently supported values are `low`, `medium`, and `high`.
const ChatCompletionNewParamsVerbosityLow [ChatCompletionNewParamsVerbosity](</api/reference/go/resources/chat/subresources/completions/methods/create#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) verbosity > (schema)>) = "low"
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) verbosity > (schema) > (member) 0>)
const ChatCompletionNewParamsVerbosityMedium [ChatCompletionNewParamsVerbosity](</api/reference/go/resources/chat/subresources/completions/methods/create#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) verbosity > (schema)>) = "medium"
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) verbosity > (schema) > (member) 1>)
const ChatCompletionNewParamsVerbosityHigh [ChatCompletionNewParamsVerbosity](</api/reference/go/resources/chat/subresources/completions/methods/create#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) verbosity > (schema)>) = "high"
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) verbosity > (schema) > (member) 2>)
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) verbosity>)
WebSearchOptions param.Field[[ChatCompletionNewParamsWebSearchOptions](</api/reference/go/resources/chat/subresources/completions/methods/create#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) web_search_options > (schema)>)]Optional
This tool searches the web for relevant results to use in a response.
Learn more about the [web search tool](https://platform.openai.com/docs/guides/tools-web-search?api-mode=chat).
SearchContextSize stringOptional
High level guidance for the amount of context window space to use for the
search. One of `low`, `medium`, or `high`. `medium` is the default.
One of the following:
const ChatCompletionNewParamsWebSearchOptionsSearchContextSizeLow ChatCompletionNewParamsWebSearchOptionsSearchContextSize = "low"
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) web_search_options > (schema) > (property) search_context_size > (member) 0>)
const ChatCompletionNewParamsWebSearchOptionsSearchContextSizeMedium ChatCompletionNewParamsWebSearchOptionsSearchContextSize = "medium"
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) web_search_options > (schema) > (property) search_context_size > (member) 1>)
const ChatCompletionNewParamsWebSearchOptionsSearchContextSizeHigh ChatCompletionNewParamsWebSearchOptionsSearchContextSize = "high"
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) web_search_options > (schema) > (property) search_context_size > (member) 2>)
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) web_search_options > (schema) > (property) search_context_size>)
UserLocation ChatCompletionNewParamsWebSearchOptionsUserLocationOptional
Approximate location parameters for the search.
Approximate ChatCompletionNewParamsWebSearchOptionsUserLocationApproximate
Approximate location parameters for the search.
City stringOptional
Free text input for the city of the user, e.g. `San Francisco`.
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) web_search_options > (schema) > (property) user_location > (property) approximate > (property) city>)
Country stringOptional
The two-letter
[ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1) of the user,
e.g. `US`.
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) web_search_options > (schema) > (property) user_location > (property) approximate > (property) country>)
Region stringOptional
Free text input for the region of the user, e.g. `California`.
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) web_search_options > (schema) > (property) user_location > (property) approximate > (property) region>)
Timezone stringOptional
The [IANA timezone](https://timeapi.io/documentation/iana-timezones)
of the user, e.g. `America/Los\_Angeles`.
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) web_search_options > (schema) > (property) user_location > (property) approximate > (property) timezone>)
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) web_search_options > (schema) > (property) user_location > (property) approximate>)
Type Approximate
The type of location approximation. Always `approximate`.
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) web_search_options > (schema) > (property) user_location > (property) type>)
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) web_search_options > (schema) > (property) user_location>)
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) web_search_options>)
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming>)
##### ReturnsExpand Collapse
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
Content string
The contents of the message.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) content>)
Refusal string
The refusal message generated by the model.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) refusal>)
Role Assistant
The role of the author of this message.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) role>)
Annotations []ChatCompletionMessageAnnotationOptional
Annotations for the message, when applicable, as when using the
[web search tool](https://platform.openai.com/docs/guides/tools-web-search?api-mode=chat).
Type URLCitation
The type of the URL citation. Always `url\_citation`.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) annotations > (items) > (property) type>)
URLCitation ChatCompletionMessageAnnotationURLCitation
A URL citation when using web search.
EndIndex int64
The index of the last character of the URL citation in the message.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) annotations > (items) > (property) url_citation > (property) end_index>)
StartIndex int64
The index of the first character of the URL citation in the message.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) annotations > (items) > (property) url_citation > (property) start_index>)
Title string
The title of the web resource.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) annotations > (items) > (property) url_citation > (property) title>)
URL string
The URL of the web resource.
formaturi
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) annotations > (items) > (property) url_citation > (property) url>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) annotations > (items) > (property) url_citation>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) annotations>)
Audio [ChatCompletionAudio](</api/reference/go/resources/chat#(resource) chat.completions > (model) chat_completion_audio > (schema)>)Optional
If the audio output modality is requested, this object contains data
about the audio response from the model. [Learn more](https://platform.openai.com/docs/guides/audio).
ID string
Unique identifier for this audio response.
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) audio + (resource) chat.completions > (model) chat_completion_audio > (schema) > (property) id>)
Data string
Base64 encoded audio bytes generated by the model, in the format
specified in the request.
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) audio + (resource) chat.completions > (model) chat_completion_audio > (schema) > (property) data>)
ExpiresAt int64
The Unix timestamp (in seconds) for when this audio response will
no longer be accessible on the server for use in multi-turn
conversations.
formatunixtime
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) audio + (resource) chat.completions > (model) chat_completion_audio > (schema) > (property) expires_at>)
Transcript string
Transcript of the audio generated by the model.
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) audio + (resource) chat.completions > (model) chat_completion_audio > (schema) > (property) transcript>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) audio>)
DeprecatedFunctionCall ChatCompletionMessageFunctionCallOptional
Deprecated and replaced by `tool\_calls`. The name and arguments of a function that should be called, as generated by the model.
Arguments string
The arguments to call the function with, as generated by the model in JSON format. Note that the model does not always generate valid JSON, and may hallucinate parameters not defined by your function schema. Validate the arguments in your code before calling your function.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) function_call > (property) arguments>)
Name string
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) function_call > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) function_call>)
ToolCalls [][ChatCompletionMessageToolCallUnion](</api/reference/go/resources/chat#(resource) chat.completions > (model) chat_completion_message_tool_call > (schema)>)Optional
The tool calls generated by the model, such as function calls.
One of the following:
type ChatCompletionMessageFunctionToolCall struct{…}
A call to a function tool created by the model.
ID string
The ID of the tool call.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) id>)
Function ChatCompletionMessageFunctionToolCallFunction
The function that the model called.
Arguments string
The arguments to call the function with, as generated by the model in JSON format. Note that the model does not always generate valid JSON, and may hallucinate parameters not defined by your function schema. Validate the arguments in your code before calling your function.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function > (property) arguments>)
Name string
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function>)
Type Function
The type of the tool. Currently, only `function` is supported.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema)>)
type ChatCompletionMessageCustomToolCall struct{…}
A call to a custom tool created by the model.
ID string
The ID of the tool call.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) id>)
Custom ChatCompletionMessageCustomToolCallCustom
The custom tool that the model called.
Input string
The input for the custom tool call generated by the model.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom > (property) input>)
Name string
The name of the custom tool to call.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom>)
Type Custom
The type of the tool. Always `custom`.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema)>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) tool_calls>)
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
CompletionTokens int64
Number of tokens in the generated completion.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) completion_tokens>)
PromptTokens int64
Number of tokens in the prompt.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) prompt_tokens>)
TotalTokens int64
Total number of tokens used in the request (prompt + completion).
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) total_tokens>)
CompletionTokensDetails CompletionUsageCompletionTokensDetailsOptional
Breakdown of tokens used in a completion.
AcceptedPredictionTokens int64Optional
When using Predicted Outputs, the number of tokens in the
prediction that appeared in the completion.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details > (property) accepted_prediction_tokens>)
AudioTokens int64Optional
Audio input tokens generated by the model.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details > (property) audio_tokens>)
ReasoningTokens int64Optional
Tokens generated by the model for reasoning.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details > (property) reasoning_tokens>)
RejectedPredictionTokens int64Optional
When using Predicted Outputs, the number of tokens in the
prediction that did not appear in the completion. However, like
reasoning tokens, these tokens are still counted in the total
completion tokens for purposes of billing, output, and context window
limits.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details > (property) rejected_prediction_tokens>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details>)
PromptTokensDetails CompletionUsagePromptTokensDetailsOptional
Breakdown of tokens used in the prompt.
AudioTokens int64Optional
Audio input tokens present in the prompt.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) prompt_tokens_details > (property) audio_tokens>)
CachedTokens int64Optional
Cached tokens present in the prompt.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) prompt_tokens_details > (property) cached_tokens>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) prompt_tokens_details>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage>)
[](<#(resource) chat.completions > (model) chat_completion > (schema)>)
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
CompletionTokens int64
Number of tokens in the generated completion.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) completion_tokens>)
PromptTokens int64
Number of tokens in the prompt.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) prompt_tokens>)
TotalTokens int64
Total number of tokens used in the request (prompt + completion).
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) total_tokens>)
CompletionTokensDetails CompletionUsageCompletionTokensDetailsOptional
Breakdown of tokens used in a completion.
AcceptedPredictionTokens int64Optional
When using Predicted Outputs, the number of tokens in the
prediction that appeared in the completion.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details > (property) accepted_prediction_tokens>)
AudioTokens int64Optional
Audio input tokens generated by the model.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details > (property) audio_tokens>)
ReasoningTokens int64Optional
Tokens generated by the model for reasoning.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details > (property) reasoning_tokens>)
RejectedPredictionTokens int64Optional
When using Predicted Outputs, the number of tokens in the
prediction that did not appear in the completion. However, like
reasoning tokens, these tokens are still counted in the total
completion tokens for purposes of billing, output, and context window
limits.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details > (property) rejected_prediction_tokens>)
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details>)
PromptTokensDetails CompletionUsagePromptTokensDetailsOptional
Breakdown of tokens used in the prompt.
AudioTokens int64Optional
Audio input tokens present in the prompt.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) prompt_tokens_details > (property) audio_tokens>)
CachedTokens int64Optional
Cached tokens present in the prompt.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) prompt_tokens_details > (property) cached_tokens>)
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) prompt_tokens_details>)
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) usage>)
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema)>)
### Create chat completion
Go
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
`package main
import (
"context"
"fmt"
"github.com/openai/openai-go"
"github.com/openai/openai-go/option"
"github.com/openai/openai-go/shared"
)
func main() {
client := openai.NewClient(
option.WithAPIKey("My API Key"),
)
chatCompletion, err := client.Chat.Completions.New(context.TODO(), openai.ChatCompletionNewParams{
Messages: []openai.ChatCompletionMessageParamUnion{openai.ChatCompletionMessageParamUnion{
OfDeveloper: &openai.ChatCompletionDeveloperMessageParam{
Content: openai.ChatCompletionDeveloperMessageParamContentUnion{
OfString: openai.String("string"),
},
},
}},
Model: shared.ChatModelGPT5\_4,
})
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", chatCompletion)
}
`
```
```
`{
"id": "chatcmpl-B9MBs8CjcvOU2jLn4n570S5qMJKcT",
"object": "chat.completion",
"created": 1741569952,
"model": "gpt-5.4",
"choices": [
{
"index": 0,
"message": {
"role": "assistant",
"content": "Hello! How can I assist you today?",
"refusal": null,
"annotations": []
},
"logprobs": null,
"finish\_reason": "stop"
}
],
"usage": {
"prompt\_tokens": 19,
"completion\_tokens": 10,
"total\_tokens": 29,
"prompt\_tokens\_details": {
"cached\_tokens": 0,
"audio\_tokens": 0
},
"completion\_tokens\_details": {
"reasoning\_tokens": 0,
"audio\_tokens": 0,
"accepted\_prediction\_tokens": 0,
"rejected\_prediction\_tokens": 0
}
},
"service\_tier": "default"
}
`
```
##### Returns Examples
```
`{
"id": "chatcmpl-B9MBs8CjcvOU2jLn4n570S5qMJKcT",
"object": "chat.completion",
"created": 1741569952,
"model": "gpt-5.4",
"choices": [
{
"index": 0,
"message": {
"role": "assistant",
"content": "Hello! How can I assist you today?",
"refusal": null,
"annotations": []
},
"logprobs": null,
"finish\_reason": "stop"
}
],
"usage": {
"prompt\_tokens": 19,
"completion\_tokens": 10,
"total\_tokens": 29,
"prompt\_tokens\_details": {
"cached\_tokens": 0,
"audio\_tokens": 0
},
"completion\_tokens\_details": {
"reasoning\_tokens": 0,
"audio\_tokens": 0,
"accepted\_prediction\_tokens": 0,
"rejected\_prediction\_tokens": 0
}
},
"service\_tier": "default"
}
`
```