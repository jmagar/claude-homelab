Create chat completion | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Chat](/api/reference/resources/chat)
[Completions](/api/reference/resources/chat/subresources/completions)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create chat completion
POST/chat/completions
**Starting a new project?** We recommend trying [Responses](/docs/api-reference/responses)
to take advantage of the latest OpenAI platform features. Compare
[Chat Completions with Responses](/docs/guides/responses-vs-chat-completions?api-mode=responses).
Creates a model response for the given chat conversation. Learn more in the
[text generation](/docs/guides/text-generation), [vision](/docs/guides/vision),
and [audio](/docs/guides/audio) guides.
Parameter support can differ depending on the model used to generate the
response, particularly for newer reasoning models. Parameters that are only
supported for reasoning models are noted below. For the current state of
unsupported parameters in reasoning models,
[refer to the reasoning guide](/docs/guides/reasoning).
Returns a chat completion object, or a streamed sequence of chat completion
chunk objects if the request is streamed.
##### Body ParametersJSONExpand Collapse
messages: array of [ChatCompletionMessageParam](</api/reference/resources/chat#(resource) chat.completions > (model) chat_completion_message_param > (schema)>)
A list of messages comprising the conversation so far. Depending on the
[model](/docs/models) you use, different message types (modalities) are
supported, like [text](/docs/guides/text-generation),
[images](/docs/guides/vision), and [audio](/docs/guides/audio).
One of the following:
ChatCompletionDeveloperMessageParam object { content, role, name }
Developer-provided instructions that the model should follow, regardless of
messages sent by the user. With o1 models and newer, `developer` messages
replace the previous `system` messages.
content: string or array of [ChatCompletionContentPartText](</api/reference/resources/chat#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>) { text, type }
The contents of the developer message.
One of the following:
TextContent = string
The contents of the developer message.
[](<#(resource) chat.completions > (model) chat_completion_developer_message_param > (schema) > (property) content > (variant) 0>)
ArrayOfContentParts = array of [ChatCompletionContentPartText](</api/reference/resources/chat#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>) { text, type }
An array of content parts with a defined type. For developer messages, only type `text` is supported.
text: string
The text content.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) text>)
type: "text"
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_developer_message_param > (schema) > (property) content > (variant) 1>)
[](<#(resource) chat.completions > (model) chat_completion_developer_message_param > (schema) > (property) content>)
role: "developer"
The role of the messages author, in this case `developer`.
[](<#(resource) chat.completions > (model) chat_completion_developer_message_param > (schema) > (property) role>)
name: optional string
An optional name for the participant. Provides the model information to differentiate between participants of the same role.
[](<#(resource) chat.completions > (model) chat_completion_developer_message_param > (schema) > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_developer_message_param > (schema)>)
ChatCompletionSystemMessageParam object { content, role, name }
Developer-provided instructions that the model should follow, regardless of
messages sent by the user. With o1 models and newer, use `developer` messages
for this purpose instead.
content: string or array of [ChatCompletionContentPartText](</api/reference/resources/chat#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>) { text, type }
The contents of the system message.
One of the following:
TextContent = string
The contents of the system message.
[](<#(resource) chat.completions > (model) chat_completion_system_message_param > (schema) > (property) content > (variant) 0>)
ArrayOfContentParts = array of [ChatCompletionContentPartText](</api/reference/resources/chat#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>) { text, type }
An array of content parts with a defined type. For system messages, only type `text` is supported.
text: string
The text content.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) text>)
type: "text"
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_system_message_param > (schema) > (property) content > (variant) 1>)
[](<#(resource) chat.completions > (model) chat_completion_system_message_param > (schema) > (property) content>)
role: "system"
The role of the messages author, in this case `system`.
[](<#(resource) chat.completions > (model) chat_completion_system_message_param > (schema) > (property) role>)
name: optional string
An optional name for the participant. Provides the model information to differentiate between participants of the same role.
[](<#(resource) chat.completions > (model) chat_completion_system_message_param > (schema) > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_system_message_param > (schema)>)
ChatCompletionUserMessageParam object { content, role, name }
Messages sent by an end user, containing prompts or additional context
information.
content: string or array of [ChatCompletionContentPart](</api/reference/resources/chat#(resource) chat.completions > (model) chat_completion_content_part > (schema)>)
The contents of the user message.
One of the following:
TextContent = string
The text contents of the message.
[](<#(resource) chat.completions > (model) chat_completion_user_message_param > (schema) > (property) content > (variant) 0>)
ArrayOfContentParts = array of [ChatCompletionContentPart](</api/reference/resources/chat#(resource) chat.completions > (model) chat_completion_content_part > (schema)>)
An array of content parts with a defined type. Supported options differ based on the [model](/docs/models) being used to generate the response. Can contain text, image, or audio inputs.
One of the following:
ChatCompletionContentPartText object { text, type }
Learn about [text inputs](/docs/guides/text-generation).
text: string
The text content.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) text>)
type: "text"
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>)
ChatCompletionContentPartImage object { image\_url, type }
Learn about [image inputs](/docs/guides/vision).
image\_url: object { url, detail }
url: string
Either a URL of the image or the base64 encoded image data.
formaturi
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) url>)
detail: optional "auto" or "low" or "high"
Specifies the detail level of the image. Learn more in the [Vision guide](/docs/guides/vision#low-or-high-fidelity-image-understanding).
One of the following:
"auto"
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail > (member) 0>)
"low"
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail > (member) 1>)
"high"
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail > (member) 2>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url > (property) detail>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) image_url>)
type: "image\_url"
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_image > (schema)>)
ChatCompletionContentPartInputAudio object { input\_audio, type }
Learn about [audio inputs](/docs/guides/audio).
input\_audio: object { data, format }
data: string
Base64 encoded audio data.
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio > (property) data>)
format: "wav" or "mp3"
The format of the encoded audio data. Currently supports “wav” and “mp3”.
One of the following:
"wav"
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio > (property) format > (member) 0>)
"mp3"
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio > (property) format > (member) 1>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio > (property) format>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) input_audio>)
type: "input\_audio"
The type of the content part. Always `input\_audio`.
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_input_audio > (schema)>)
FileContentPart object { file, type }
Learn about [file inputs](/docs/guides/text) for text generation.
file: object { file\_data, file\_id, filename }
file\_data: optional string
The base64 encoded file data, used when passing the file to the model
as a string.
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3 > (property) file > (property) file_data>)
file\_id: optional string
The ID of an uploaded file to use as input.
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3 > (property) file > (property) file_id>)
filename: optional string
The name of the file, used when passing the file to the model as a
string.
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3 > (property) file > (property) filename>)
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3 > (property) file>)
type: "file"
The type of the content part. Always `file`.
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3 > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part > (schema) > (variant) 3>)
[](<#(resource) chat.completions > (model) chat_completion_user_message_param > (schema) > (property) content > (variant) 1>)
[](<#(resource) chat.completions > (model) chat_completion_user_message_param > (schema) > (property) content>)
role: "user"
The role of the messages author, in this case `user`.
[](<#(resource) chat.completions > (model) chat_completion_user_message_param > (schema) > (property) role>)
name: optional string
An optional name for the participant. Provides the model information to differentiate between participants of the same role.
[](<#(resource) chat.completions > (model) chat_completion_user_message_param > (schema) > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_user_message_param > (schema)>)
ChatCompletionAssistantMessageParam object { role, audio, content, 4 more }
Messages sent by the model in response to user messages.
role: "assistant"
The role of the messages author, in this case `assistant`.
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) role>)
audio: optional object { id }
Data about a previous audio response from the model.
[Learn more](/docs/guides/audio).
id: string
Unique identifier for a previous audio response from the model.
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) audio > (property) id>)
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) audio>)
content: optional string or array of [ChatCompletionContentPartText](</api/reference/resources/chat#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>) { text, type } or [ChatCompletionContentPartRefusal](</api/reference/resources/chat#(resource) chat.completions > (model) chat_completion_content_part_refusal > (schema)>) { refusal, type }
The contents of the assistant message. Required unless `tool\_calls` or `function\_call` is specified.
One of the following:
TextContent = string
The contents of the assistant message.
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) content > (variant) 0>)
ArrayOfContentParts = array of [ChatCompletionContentPartText](</api/reference/resources/chat#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>) { text, type } or [ChatCompletionContentPartRefusal](</api/reference/resources/chat#(resource) chat.completions > (model) chat_completion_content_part_refusal > (schema)>) { refusal, type }
An array of content parts with a defined type. Can be one or more of type `text`, or exactly one of type `refusal`.
One of the following:
ChatCompletionContentPartText object { text, type }
Learn about [text inputs](/docs/guides/text-generation).
text: string
The text content.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) text>)
type: "text"
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>)
ChatCompletionContentPartRefusal object { refusal, type }
refusal: string
The refusal message generated by the model.
[](<#(resource) chat.completions > (model) chat_completion_content_part_refusal > (schema) > (property) refusal>)
type: "refusal"
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_refusal > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_content_part_refusal > (schema)>)
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) content > (variant) 1>)
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) content>)
Deprecatedfunction\_call: optional object { arguments, name }
Deprecated and replaced by `tool\_calls`. The name and arguments of a function that should be called, as generated by the model.
arguments: string
The arguments to call the function with, as generated by the model in JSON format. Note that the model does not always generate valid JSON, and may hallucinate parameters not defined by your function schema. Validate the arguments in your code before calling your function.
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) function_call > (property) arguments>)
name: string
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) function_call > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) function_call>)
name: optional string
An optional name for the participant. Provides the model information to differentiate between participants of the same role.
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) name>)
refusal: optional string
The refusal message by the assistant.
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) refusal>)
tool\_calls: optional array of [ChatCompletionMessageToolCall](</api/reference/resources/chat#(resource) chat.completions > (model) chat_completion_message_tool_call > (schema)>)
The tool calls generated by the model, such as function calls.
One of the following:
ChatCompletionMessageFunctionToolCall object { id, function, type }
A call to a function tool created by the model.
id: string
The ID of the tool call.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) id>)
function: object { arguments, name }
The function that the model called.
arguments: string
The arguments to call the function with, as generated by the model in JSON format. Note that the model does not always generate valid JSON, and may hallucinate parameters not defined by your function schema. Validate the arguments in your code before calling your function.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function > (property) arguments>)
name: string
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function>)
type: "function"
The type of the tool. Currently, only `function` is supported.
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema)>)
ChatCompletionMessageCustomToolCall object { id, custom, type }
A call to a custom tool created by the model.
id: string
The ID of the tool call.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) id>)
custom: object { input, name }
The custom tool that the model called.
input: string
The input for the custom tool call generated by the model.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom > (property) input>)
name: string
The name of the custom tool to call.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom>)
type: "custom"
The type of the tool. Always `custom`.
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema)>)
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema) > (property) tool_calls>)
[](<#(resource) chat.completions > (model) chat_completion_assistant_message_param > (schema)>)
ChatCompletionToolMessageParam object { content, role, tool\_call\_id }
content: string or array of [ChatCompletionContentPartText](</api/reference/resources/chat#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>) { text, type }
The contents of the tool message.
One of the following:
TextContent = string
The contents of the tool message.
[](<#(resource) chat.completions > (model) chat_completion_tool_message_param > (schema) > (property) content > (variant) 0>)
ArrayOfContentParts = array of [ChatCompletionContentPartText](</api/reference/resources/chat#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>) { text, type }
An array of content parts with a defined type. For tool messages, only type `text` is supported.
text: string
The text content.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) text>)
type: "text"
The type of the content part.
[](<#(resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_tool_message_param > (schema) > (property) content > (variant) 1>)
[](<#(resource) chat.completions > (model) chat_completion_tool_message_param > (schema) > (property) content>)
role: "tool"
The role of the messages author, in this case `tool`.
[](<#(resource) chat.completions > (model) chat_completion_tool_message_param > (schema) > (property) role>)
tool\_call\_id: string
Tool call that this message is responding to.
[](<#(resource) chat.completions > (model) chat_completion_tool_message_param > (schema) > (property) tool_call_id>)
[](<#(resource) chat.completions > (model) chat_completion_tool_message_param > (schema)>)
ChatCompletionFunctionMessageParam object { content, name, role }
content: string
The contents of the function message.
[](<#(resource) chat.completions > (model) chat_completion_function_message_param > (schema) > (property) content>)
name: string
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion_function_message_param > (schema) > (property) name>)
role: "function"
The role of the messages author, in this case `function`.
[](<#(resource) chat.completions > (model) chat_completion_function_message_param > (schema) > (property) role>)
[](<#(resource) chat.completions > (model) chat_completion_function_message_param > (schema)>)
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) messages > (schema)>)
model: string or "gpt-5.4" or "gpt-5.4-mini" or "gpt-5.4-nano" or 75 more
Model ID used to generate the response, like `gpt-4o` or `o3`. OpenAI
offers a wide range of models with different capabilities, performance
characteristics, and price points. Refer to the [model guide](/docs/models)
to browse and compare available models.
One of the following:
string
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 0>)
"gpt-5.4" or "gpt-5.4-mini" or "gpt-5.4-nano" or 75 more
Model ID used to generate the response, like `gpt-4o` or `o3`. OpenAI
offers a wide range of models with different capabilities, performance
characteristics, and price points. Refer to the [model guide](/docs/models)
to browse and compare available models.
One of the following:
"gpt-5.4"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 0>)
"gpt-5.4-mini"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 1>)
"gpt-5.4-nano"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 2>)
"gpt-5.4-mini-2026-03-17"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 3>)
"gpt-5.4-nano-2026-03-17"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 4>)
"gpt-5.3-chat-latest"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 5>)
"gpt-5.2"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 6>)
"gpt-5.2-2025-12-11"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 7>)
"gpt-5.2-chat-latest"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 8>)
"gpt-5.2-pro"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 9>)
"gpt-5.2-pro-2025-12-11"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 10>)
"gpt-5.1"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 11>)
"gpt-5.1-2025-11-13"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 12>)
"gpt-5.1-codex"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 13>)
"gpt-5.1-mini"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 14>)
"gpt-5.1-chat-latest"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 15>)
"gpt-5"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 16>)
"gpt-5-mini"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 17>)
"gpt-5-nano"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 18>)
"gpt-5-2025-08-07"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 19>)
"gpt-5-mini-2025-08-07"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 20>)
"gpt-5-nano-2025-08-07"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 21>)
"gpt-5-chat-latest"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 22>)
"gpt-4.1"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 23>)
"gpt-4.1-mini"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 24>)
"gpt-4.1-nano"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 25>)
"gpt-4.1-2025-04-14"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 26>)
"gpt-4.1-mini-2025-04-14"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 27>)
"gpt-4.1-nano-2025-04-14"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 28>)
"o4-mini"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 29>)
"o4-mini-2025-04-16"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 30>)
"o3"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 31>)
"o3-2025-04-16"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 32>)
"o3-mini"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 33>)
"o3-mini-2025-01-31"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 34>)
"o1"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 35>)
"o1-2024-12-17"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 36>)
"o1-preview"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 37>)
"o1-preview-2024-09-12"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 38>)
"o1-mini"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 39>)
"o1-mini-2024-09-12"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 40>)
"gpt-4o"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 41>)
"gpt-4o-2024-11-20"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 42>)
"gpt-4o-2024-08-06"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 43>)
"gpt-4o-2024-05-13"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 44>)
"gpt-4o-audio-preview"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 45>)
"gpt-4o-audio-preview-2024-10-01"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 46>)
"gpt-4o-audio-preview-2024-12-17"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 47>)
"gpt-4o-audio-preview-2025-06-03"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 48>)
"gpt-4o-mini-audio-preview"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 49>)
"gpt-4o-mini-audio-preview-2024-12-17"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 50>)
"gpt-4o-search-preview"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 51>)
"gpt-4o-mini-search-preview"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 52>)
"gpt-4o-search-preview-2025-03-11"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 53>)
"gpt-4o-mini-search-preview-2025-03-11"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 54>)
"chatgpt-4o-latest"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 55>)
"codex-mini-latest"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 56>)
"gpt-4o-mini"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 57>)
"gpt-4o-mini-2024-07-18"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 58>)
"gpt-4-turbo"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 59>)
"gpt-4-turbo-2024-04-09"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 60>)
"gpt-4-0125-preview"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 61>)
"gpt-4-turbo-preview"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 62>)
"gpt-4-1106-preview"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 63>)
"gpt-4-vision-preview"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 64>)
"gpt-4"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 65>)
"gpt-4-0314"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 66>)
"gpt-4-0613"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 67>)
"gpt-4-32k"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 68>)
"gpt-4-32k-0314"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 69>)
"gpt-4-32k-0613"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 70>)
"gpt-3.5-turbo"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 71>)
"gpt-3.5-turbo-16k"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 72>)
"gpt-3.5-turbo-0301"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 73>)
"gpt-3.5-turbo-0613"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 74>)
"gpt-3.5-turbo-1106"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 75>)
"gpt-3.5-turbo-0125"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 76>)
"gpt-3.5-turbo-16k-0613"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 77>)
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema) > (variant) 1>)
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) model > (schema)>)
audio: optional [ChatCompletionAudioParam](</api/reference/resources/chat#(resource) chat.completions > (model) chat_completion_audio_param > (schema)>) { format, voice }
Parameters for audio output. Required when audio output is requested with
`modalities: ["audio"]`. [Learn more](/docs/guides/audio).
format: "wav" or "aac" or "mp3" or 3 more
Specifies the output audio format. Must be one of `wav`, `mp3`, `flac`,
`opus`, or `pcm16`.
One of the following:
"wav"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) audio > (schema) + (resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) format > (member) 0>)
"aac"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) audio > (schema) + (resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) format > (member) 1>)
"mp3"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) audio > (schema) + (resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) format > (member) 2>)
"flac"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) audio > (schema) + (resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) format > (member) 3>)
"opus"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) audio > (schema) + (resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) format > (member) 4>)
"pcm16"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) audio > (schema) + (resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) format > (member) 5>)
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) audio > (schema) + (resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) format>)
voice: string or "alloy" or "ash" or "ballad" or 7 more or object { id }
The voice the model uses to respond. Supported built-in voices are
`alloy`, `ash`, `ballad`, `coral`, `echo`, `fable`, `nova`, `onyx`,
`sage`, `shimmer`, `marin`, and `cedar`. You may also provide a
custom voice object with an `id`, for example `{ "id": "voice\_1234" }`.
One of the following:
string
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) audio > (schema) + (resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 0>)
"alloy" or "ash" or "ballad" or 7 more
One of the following:
"alloy"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) audio > (schema) + (resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 1 > (member) 0>)
"ash"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) audio > (schema) + (resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 1 > (member) 1>)
"ballad"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) audio > (schema) + (resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 1 > (member) 2>)
"coral"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) audio > (schema) + (resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 1 > (member) 3>)
"echo"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) audio > (schema) + (resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 1 > (member) 4>)
"sage"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) audio > (schema) + (resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 1 > (member) 5>)
"shimmer"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) audio > (schema) + (resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 1 > (member) 6>)
"verse"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) audio > (schema) + (resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 1 > (member) 7>)
"marin"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) audio > (schema) + (resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 1 > (member) 8>)
"cedar"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) audio > (schema) + (resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 1 > (member) 9>)
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) audio > (schema) + (resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 1>)
ID object { id }
Custom voice reference.
id: string
The custom voice ID, e.g. `voice\_1234`.
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) audio > (schema) + (resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 2 > (property) id>)
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) audio > (schema) + (resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice > (variant) 2>)
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) audio > (schema) + (resource) chat.completions > (model) chat_completion_audio_param > (schema) > (property) voice>)
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) audio > (schema)>)
frequency\_penalty: optional number
Number between -2.0 and 2.0. Positive values penalize new tokens based on
their existing frequency in the text so far, decreasing the model’s
likelihood to repeat the same line verbatim.
minimum-2
maximum2
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) frequency_penalty > (schema)>)
Deprecatedfunction\_call: optional "none" or "auto" or [ChatCompletionFunctionCallOption](</api/reference/resources/chat#(resource) chat.completions > (model) chat_completion_function_call_option > (schema)>) { name }
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
One of the following:
"none" or "auto"
`none` means the model will not call a function and instead generates a message. `auto` means the model can pick between generating a message or calling a function.
One of the following:
"none"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) function_call > (schema) > (variant) 0 > (member) 0>)
"auto"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) function_call > (schema) > (variant) 0 > (member) 1>)
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) function_call > (schema) > (variant) 0>)
ChatCompletionFunctionCallOption object { name }
Specifying a particular function via `{"name": "my\_function"}` forces the model to call that function.
name: string
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion_function_call_option > (schema) > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_function_call_option > (schema)>)
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) function_call > (schema)>)
Deprecatedfunctions: optional array of object { name, description, parameters }
Deprecated in favor of `tools`.
A list of functions the model may generate JSON inputs for.
name: string
The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) functions > (schema) > (items) > (property) name>)
description: optional string
A description of what the function does, used by the model to choose when and how to call the function.
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) functions > (schema) > (items) > (property) description>)
parameters: optional [FunctionParameters](</api/reference/resources/$shared#(resource) $shared > (model) function_parameters > (schema)>)
The parameters the functions accepts, described as a JSON Schema object. See the [guide](/docs/guides/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format.
Omitting `parameters` defines a function with an empty parameter list.
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) functions > (schema) > (items) > (property) parameters>)
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) functions > (schema)>)
logit\_bias: optional map[number]
Modify the likelihood of specified tokens appearing in the completion.
Accepts a JSON object that maps tokens (specified by their token ID in the
tokenizer) to an associated bias value from -100 to 100. Mathematically,
the bias is added to the logits generated by the model prior to sampling.
The exact effect will vary per model, but values between -1 and 1 should
decrease or increase likelihood of selection; values like -100 or 100
should result in a ban or exclusive selection of the relevant token.
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) logit_bias > (schema)>)
logprobs: optional boolean
Whether to return log probabilities of the output tokens or not. If true,
returns the log probabilities of each output token returned in the
`content` of `message`.
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) logprobs > (schema)>)
max\_completion\_tokens: optional number
An upper bound for the number of tokens that can be generated for a completion, including visible output tokens and [reasoning tokens](/docs/guides/reasoning).
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) max_completion_tokens > (schema)>)
Deprecatedmax\_tokens: optional number
The maximum number of [tokens](/tokenizer) that can be generated in the
chat completion. This value can be used to control
[costs](https://openai.com/api/pricing/) for text generated via API.
This value is now deprecated in favor of `max\_completion\_tokens`, and is
not compatible with [o-series models](/docs/guides/reasoning).
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) max_tokens > (schema)>)
metadata: optional [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) metadata > (schema)>)
modalities: optional array of "text" or "audio"
Output types that you would like the model to generate.
Most models are capable of generating text, which is the default:
`["text"]`
The `gpt-4o-audio-preview` model can also be used to
[generate audio](/docs/guides/audio). To request that this model generate
both text and audio responses, you can use:
`["text", "audio"]`
One of the following:
"text"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) modalities > (schema) > (items) > (member) 0>)
"audio"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) modalities > (schema) > (items) > (member) 1>)
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) modalities > (schema)>)
n: optional number
How many chat completion choices to generate for each input message. Note that you will be charged based on the number of generated tokens across all of the choices. Keep `n` as `1` to minimize costs.
minimum1
maximum128
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) n > (schema)>)
parallel\_tool\_calls: optional boolean
Whether to enable [parallel function calling](/docs/guides/function-calling#configuring-parallel-function-calling) during tool use.
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) parallel_tool_calls > (schema)>)
prediction: optional [ChatCompletionPredictionContent](</api/reference/resources/chat#(resource) chat.completions > (model) chat_completion_prediction_content > (schema)>) { content, type }
Static predicted output content, such as the content of a text file that is
being regenerated.
content: string or array of [ChatCompletionContentPartText](</api/reference/resources/chat#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>) { text, type }
The content that should be matched when generating a model response.
If generated tokens would match this content, the entire model response
can be returned much more quickly.
One of the following:
TextContent = string
The content used for a Predicted Output. This is often the
text of a file you are regenerating with minor changes.
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) prediction > (schema) + (resource) chat.completions > (model) chat_completion_prediction_content > (schema) > (property) content > (variant) 0>)
ArrayOfContentParts = array of [ChatCompletionContentPartText](</api/reference/resources/chat#(resource) chat.completions > (model) chat_completion_content_part_text > (schema)>) { text, type }
An array of content parts with a defined type. Supported options differ based on the [model](/docs/models) being used to generate the response. Can contain text inputs.
text: string
The text content.
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) prediction > (schema) + (resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) text>)
type: "text"
The type of the content part.
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) prediction > (schema) + (resource) chat.completions > (model) chat_completion_content_part_text > (schema) > (property) type>)
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) prediction > (schema) + (resource) chat.completions > (model) chat_completion_prediction_content > (schema) > (property) content > (variant) 1>)
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) prediction > (schema) + (resource) chat.completions > (model) chat_completion_prediction_content > (schema) > (property) content>)
type: "content"
The type of the predicted content you want to provide. This type is
currently always `content`.
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) prediction > (schema) + (resource) chat.completions > (model) chat_completion_prediction_content > (schema) > (property) type>)
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) prediction > (schema)>)
presence\_penalty: optional number
Number between -2.0 and 2.0. Positive values penalize new tokens based on
whether they appear in the text so far, increasing the model’s likelihood
to talk about new topics.
minimum-2
maximum2
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) presence_penalty > (schema)>)
prompt\_cache\_key: optional string
Used by OpenAI to cache responses for similar requests to optimize your cache hit rates. Replaces the `user` field. [Learn more](/docs/guides/prompt-caching).
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) prompt_cache_key > (schema)>)
prompt\_cache\_retention: optional "in\_memory" or "24h"
The retention policy for the prompt cache. Set to `24h` to enable extended prompt caching, which keeps cached prefixes active for longer, up to a maximum of 24 hours. [Learn more](/docs/guides/prompt-caching#prompt-cache-retention).
One of the following:
"in\_memory"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) prompt_cache_retention > (schema) > (member) 0>)
"24h"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) prompt_cache_retention > (schema) > (member) 1>)
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) prompt_cache_retention > (schema)>)
reasoning\_effort: optional [ReasoningEffort](</api/reference/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>)
Constrains effort on reasoning for
[reasoning models](https://platform.openai.com/docs/guides/reasoning).
Currently supported values are `none`, `minimal`, `low`, `medium`, `high`, and `xhigh`. Reducing
reasoning effort can result in faster responses and fewer tokens used
on reasoning in a response.
* `gpt-5.1` defaults to `none`, which does not perform reasoning. The supported reasoning values for `gpt-5.1` are `none`, `low`, `medium`, and `high`. Tool calls are supported for all reasoning values in gpt-5.1.
* All models before `gpt-5.1` default to `medium` reasoning effort, and do not support `none`.
* The `gpt-5-pro` model defaults to (and only supports) `high` reasoning effort.
* `xhigh` is supported for all models after `gpt-5.1-codex-max`.
One of the following:
"none"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) reasoning_effort > (schema) + (resource) $shared > (model) reasoning_effort > (schema) > (member) 0>)
"minimal"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) reasoning_effort > (schema) + (resource) $shared > (model) reasoning_effort > (schema) > (member) 1>)
"low"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) reasoning_effort > (schema) + (resource) $shared > (model) reasoning_effort > (schema) > (member) 2>)
"medium"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) reasoning_effort > (schema) + (resource) $shared > (model) reasoning_effort > (schema) > (member) 3>)
"high"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) reasoning_effort > (schema) + (resource) $shared > (model) reasoning_effort > (schema) > (member) 4>)
"xhigh"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) reasoning_effort > (schema) + (resource) $shared > (model) reasoning_effort > (schema) > (member) 5>)
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) reasoning_effort > (schema)>)
response\_format: optional [ResponseFormatText](</api/reference/resources/$shared#(resource) $shared > (model) response_format_text > (schema)>) { type } or [ResponseFormatJSONSchema](</api/reference/resources/$shared#(resource) $shared > (model) response_format_json_schema > (schema)>) { json\_schema, type } or [ResponseFormatJSONObject](</api/reference/resources/$shared#(resource) $shared > (model) response_format_json_object > (schema)>) { type }
An object specifying the format that the model must output.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables
Structured Outputs which ensures the model will match your supplied JSON
schema. Learn more in the [Structured Outputs
guide](/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables the older JSON mode, which
ensures the message the model generates is valid JSON. Using `json\_schema`
is preferred for models that support it.
One of the following:
ResponseFormatText object { type }
Default response format. Used to generate text responses.
type: "text"
The type of response format being defined. Always `text`.
[](<#(resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) $shared > (model) response_format_text > (schema)>)
ResponseFormatJSONSchema object { json\_schema, type }
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](/docs/guides/structured-outputs).
json\_schema: object { name, description, schema, strict }
Structured Outputs configuration options, including a JSON Schema.
name: string
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
description: optional string
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
schema: optional map[unknown]
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
strict: optional boolean
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](/docs/guides/structured-outputs).
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
type: "json\_schema"
The type of response format being defined. Always `json\_schema`.
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) $shared > (model) response_format_json_schema > (schema)>)
ResponseFormatJSONObject object { type }
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
type: "json\_object"
The type of response format being defined. Always `json\_object`.
[](<#(resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) $shared > (model) response_format_json_object > (schema)>)
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) response_format > (schema)>)
safety\_identifier: optional string
A stable identifier used to help detect users of your application that may be violating OpenAI’s usage policies.
The IDs should be a string that uniquely identifies each user, with a maximum length of 64 characters. We recommend hashing their username or email address, in order to avoid sending us any identifying information. [Learn more](/docs/guides/safety-best-practices#safety-identifiers).
maxLength64
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) safety_identifier > (schema)>)
Deprecatedseed: optional number
This feature is in Beta.
If specified, our system will make a best effort to sample deterministically, such that repeated requests with the same `seed` and parameters should return the same result.
Determinism is not guaranteed, and you should refer to the `system\_fingerprint` response parameter to monitor changes in the backend.
minimum-9223372036854776000
maximum9223372036854776000
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) seed > (schema)>)
service\_tier: optional "auto" or "default" or "flex" or 2 more
Specifies the processing type used for serving the request.
* If set to ‘auto’, then the request will be processed with the service tier configured in the Project settings. Unless otherwise configured, the Project will use ‘default’.
* If set to ‘default’, then the request will be processed with the standard pricing and performance for the selected model.
* If set to ‘[flex](/docs/guides/flex-processing)’ or ‘[priority](https://openai.com/api-priority-processing/)’, then the request will be processed with the corresponding service tier.
* When not set, the default behavior is ‘auto’.
When the `service\_tier` parameter is set, the response body will include the `service\_tier` value based on the processing mode actually used to serve the request. This response value may be different from the value set in the parameter.
One of the following:
"auto"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) service_tier > (schema) > (member) 0>)
"default"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) service_tier > (schema) > (member) 1>)
"flex"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) service_tier > (schema) > (member) 2>)
"scale"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) service_tier > (schema) > (member) 3>)
"priority"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) service_tier > (schema) > (member) 4>)
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) service_tier > (schema)>)
stop: optional string or array of string
Not supported with latest reasoning models `o3` and `o4-mini`.
Up to 4 sequences where the API will stop generating further tokens. The
returned text will not contain the stop sequence.
One of the following:
string
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) stop > (schema) > (variant) 0>)
array of string
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) stop > (schema) > (variant) 1>)
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) stop > (schema)>)
store: optional boolean
Whether or not to store the output of this chat completion request for
use in our [model distillation](/docs/guides/distillation) or
[evals](/docs/guides/evals) products.
Supports text and image inputs. Note: image inputs over 8MB will be dropped.
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) store > (schema)>)
stream: optional boolean
If set to true, the model response data will be streamed to the client
as it is generated using [server-sent events](https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events#Event_stream_format).
See the [Streaming section below](/docs/api-reference/chat/streaming)
for more information, along with the [streaming responses](/docs/guides/streaming-responses)
guide for more information on how to handle the streaming events.
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) stream > (schema)>)
stream\_options: optional [ChatCompletionStreamOptions](</api/reference/resources/chat#(resource) chat.completions > (model) chat_completion_stream_options > (schema)>) { include\_obfuscation, include\_usage }
Options for streaming response. Only set this when you set `stream: true`.
include\_obfuscation: optional boolean
When true, stream obfuscation will be enabled. Stream obfuscation adds
random characters to an `obfuscation` field on streaming delta events to
normalize payload sizes as a mitigation to certain side-channel attacks.
These obfuscation fields are included by default, but add a small amount
of overhead to the data stream. You can set `include\_obfuscation` to
false to optimize for bandwidth if you trust the network links between
your application and the OpenAI API.
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) stream_options > (schema) + (resource) chat.completions > (model) chat_completion_stream_options > (schema) > (property) include_obfuscation>)
include\_usage: optional boolean
If set, an additional chunk will be streamed before the `data: [DONE]`
message. The `usage` field on this chunk shows the token usage statistics
for the entire request, and the `choices` field will always be an empty
array.
All other chunks will also include a `usage` field, but with a null
value. **NOTE:** If the stream is interrupted, you may not receive the
final usage chunk which contains the total token usage for the request.
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) stream_options > (schema) + (resource) chat.completions > (model) chat_completion_stream_options > (schema) > (property) include_usage>)
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) stream_options > (schema)>)
temperature: optional number
What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
We generally recommend altering this or `top\_p` but not both.
minimum0
maximum2
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) temperature > (schema)>)
tool\_choice: optional [ChatCompletionToolChoiceOption](</api/reference/resources/chat#(resource) chat.completions > (model) chat_completion_tool_choice_option > (schema)>)
Controls which (if any) tool is called by the model.
`none` means the model will not call any tool and instead generates a message.
`auto` means the model can pick between generating a message or calling one or more tools.
`required` means the model must call one or more tools.
Specifying a particular tool via `{"type": "function", "function": {"name": "my\_function"}}` forces the model to call that tool.
`none` is the default when no tools are present. `auto` is the default if tools are present.
One of the following:
ToolChoiceMode = "none" or "auto" or "required"
`none` means the model will not call any tool and instead generates a message. `auto` means the model can pick between generating a message or calling one or more tools. `required` means the model must call one or more tools.
One of the following:
"none"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) tool_choice > (schema) + (resource) chat.completions > (model) chat_completion_tool_choice_option > (schema) > (variant) 0 > (member) 0>)
"auto"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) tool_choice > (schema) + (resource) chat.completions > (model) chat_completion_tool_choice_option > (schema) > (variant) 0 > (member) 1>)
"required"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) tool_choice > (schema) + (resource) chat.completions > (model) chat_completion_tool_choice_option > (schema) > (variant) 0 > (member) 2>)
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) tool_choice > (schema) + (resource) chat.completions > (model) chat_completion_tool_choice_option > (schema) > (variant) 0>)
ChatCompletionAllowedToolChoice object { allowed\_tools, type }
Constrains the tools available to the model to a pre-defined set.
allowed\_tools: [ChatCompletionAllowedTools](</api/reference/resources/chat#(resource) chat.completions > (model) ChatCompletionAllowedTools > (schema)>) { mode, tools }
Constrains the tools available to the model to a pre-defined set.
mode: "auto" or "required"
Constrains the tools available to the model to a pre-defined set.
`auto` allows the model to pick from among the allowed tools and generate a
message.
`required` requires the model to call one or more of the allowed tools.
One of the following:
"auto"
[](<#(resource) chat.completions > (model) chat_completion_allowed_tool_choice > (schema) > (property) allowed_tools + (resource) chat.completions > (model) ChatCompletionAllowedTools > (schema) > (property) mode > (member) 0>)
"required"
[](<#(resource) chat.completions > (model) chat_completion_allowed_tool_choice > (schema) > (property) allowed_tools + (resource) chat.completions > (model) ChatCompletionAllowedTools > (schema) > (property) mode > (member) 1>)
[](<#(resource) chat.completions > (model) chat_completion_allowed_tool_choice > (schema) > (property) allowed_tools + (resource) chat.completions > (model) ChatCompletionAllowedTools > (schema) > (property) mode>)
tools: array of map[unknown]
A list of tool definitions that the model should be allowed to call.
For the Chat Completions API, the list of tool definitions might look like:
```
`[
{ "type": "function", "function": { "name": "get\_weather" } },
{ "type": "function", "function": { "name": "get\_time" } }
]`
```
[](<#(resource) chat.completions > (model) chat_completion_allowed_tool_choice > (schema) > (property) allowed_tools + (resource) chat.completions > (model) ChatCompletionAllowedTools > (schema) > (property) tools>)
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) tool_choice > (schema) + (resource) chat.completions > (model) chat_completion_allowed_tool_choice > (schema) > (property) allowed_tools>)
type: "allowed\_tools"
Allowed tool configuration type. Always `allowed\_tools`.
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) tool_choice > (schema) + (resource) chat.completions > (model) chat_completion_allowed_tool_choice > (schema) > (property) type>)
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) tool_choice > (schema) + (resource) chat.completions > (model) chat_completion_allowed_tool_choice > (schema)>)
ChatCompletionNamedToolChoice object { function, type }
Specifies a tool the model should use. Use to force the model to call a specific function.
function: object { name }
name: string
The name of the function to call.
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) tool_choice > (schema) + (resource) chat.completions > (model) chat_completion_named_tool_choice > (schema) > (property) function > (property) name>)
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) tool_choice > (schema) + (resource) chat.completions > (model) chat_completion_named_tool_choice > (schema) > (property) function>)
type: "function"
For function calling, the type is always `function`.
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) tool_choice > (schema) + (resource) chat.completions > (model) chat_completion_named_tool_choice > (schema) > (property) type>)
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) tool_choice > (schema) + (resource) chat.completions > (model) chat_completion_named_tool_choice > (schema)>)
ChatCompletionNamedToolChoiceCustom object { custom, type }
Specifies a tool the model should use. Use to force the model to call a specific custom tool.
custom: object { name }
name: string
The name of the custom tool to call.
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) tool_choice > (schema) + (resource) chat.completions > (model) chat_completion_named_tool_choice_custom > (schema) > (property) custom > (property) name>)
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) tool_choice > (schema) + (resource) chat.completions > (model) chat_completion_named_tool_choice_custom > (schema) > (property) custom>)
type: "custom"
For custom tool calling, the type is always `custom`.
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) tool_choice > (schema) + (resource) chat.completions > (model) chat_completion_named_tool_choice_custom > (schema) > (property) type>)
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) tool_choice > (schema) + (resource) chat.completions > (model) chat_completion_named_tool_choice_custom > (schema)>)
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) tool_choice > (schema)>)
tools: optional array of [ChatCompletionTool](</api/reference/resources/chat#(resource) chat.completions > (model) chat_completion_tool > (schema)>)
A list of tools the model may call. You can provide either
[custom tools](/docs/guides/function-calling#custom-tools) or
[function tools](/docs/guides/function-calling).
One of the following:
ChatCompletionFunctionTool object { function, type }
A function tool that can be used to generate a response.
function: [FunctionDefinition](</api/reference/resources/$shared#(resource) $shared > (model) function_definition > (schema)>) { name, description, parameters, strict }
name: string
The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) name>)
description: optional string
A description of what the function does, used by the model to choose when and how to call the function.
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) description>)
parameters: optional [FunctionParameters](</api/reference/resources/$shared#(resource) $shared > (model) function_parameters > (schema)>)
The parameters the functions accepts, described as a JSON Schema object. See the [guide](/docs/guides/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format.
Omitting `parameters` defines a function with an empty parameter list.
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) parameters>)
strict: optional boolean
Whether to enable strict schema adherence when generating the function call. If set to true, the model will follow the exact schema defined in the `parameters` field. Only a subset of JSON Schema is supported when `strict` is `true`. Learn more about Structured Outputs in the [function calling guide](/docs/guides/function-calling).
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) strict>)
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema) > (property) function>)
type: "function"
The type of the tool. Currently, only `function` is supported.
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema)>)
ChatCompletionCustomTool object { custom, type }
A custom tool that processes input using a specified format.
custom: object { name, description, format }
Properties of the custom tool.
name: string
The name of the custom tool, used to identify it in tool calls.
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) name>)
description: optional string
Optional description of the custom tool, used to provide more context.
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) description>)
format: optional object { type } or object { grammar, type }
The input format for the custom tool. Default is unconstrained text.
One of the following:
TextFormat object { type }
Unconstrained free-form text.
type: "text"
Unconstrained text format. Always `text`.
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 0 > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 0>)
GrammarFormat object { grammar, type }
A grammar defined by the user.
grammar: object { definition, syntax }
Your chosen grammar.
definition: string
The grammar definition.
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 1 > (property) grammar > (property) definition>)
syntax: "lark" or "regex"
The syntax of the grammar definition. One of `lark` or `regex`.
One of the following:
"lark"
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 1 > (property) grammar > (property) syntax > (member) 0>)
"regex"
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 1 > (property) grammar > (property) syntax > (member) 1>)
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 1 > (property) grammar > (property) syntax>)
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 1 > (property) grammar>)
type: "grammar"
Grammar format. Always `grammar`.
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 1 > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format > (variant) 1>)
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom > (property) format>)
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) custom>)
type: "custom"
The type of the custom tool. Always `custom`.
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion_custom_tool > (schema)>)
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) tools > (schema)>)
top\_logprobs: optional number
An integer between 0 and 20 specifying the number of most likely tokens to
return at each token position, each with an associated log probability.
`logprobs` must be set to `true` if this parameter is used.
minimum0
maximum20
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) top_logprobs > (schema)>)
top\_p: optional number
An alternative to sampling with temperature, called nucleus sampling,
where the model considers the results of the tokens with top\_p probability
mass. So 0.1 means only the tokens comprising the top 10% probability mass
are considered.
We generally recommend altering this or `temperature` but not both.
minimum0
maximum1
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) top_p > (schema)>)
Deprecateduser: optional string
This field is being replaced by `safety\_identifier` and `prompt\_cache\_key`. Use `prompt\_cache\_key` instead to maintain caching optimizations.
A stable identifier for your end-users.
Used to boost cache hit rates by better bucketing similar requests and to help OpenAI detect and prevent abuse. [Learn more](/docs/guides/safety-best-practices#safety-identifiers).
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) user > (schema)>)
verbosity: optional "low" or "medium" or "high"
Constrains the verbosity of the model’s response. Lower values will result in
more concise responses, while higher values will result in more verbose responses.
Currently supported values are `low`, `medium`, and `high`.
One of the following:
"low"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) verbosity > (schema) > (member) 0>)
"medium"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) verbosity > (schema) > (member) 1>)
"high"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) verbosity > (schema) > (member) 2>)
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) verbosity > (schema)>)
web\_search\_options: optional object { search\_context\_size, user\_location }
This tool searches the web for relevant results to use in a response.
Learn more about the [web search tool](/docs/guides/tools-web-search?api-mode=chat).
search\_context\_size: optional "low" or "medium" or "high"
High level guidance for the amount of context window space to use for the
search. One of `low`, `medium`, or `high`. `medium` is the default.
One of the following:
"low"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) web_search_options > (schema) > (property) search_context_size > (member) 0>)
"medium"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) web_search_options > (schema) > (property) search_context_size > (member) 1>)
"high"
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) web_search_options > (schema) > (property) search_context_size > (member) 2>)
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) web_search_options > (schema) > (property) search_context_size>)
user\_location: optional object { approximate, type }
Approximate location parameters for the search.
approximate: object { city, country, region, timezone }
Approximate location parameters for the search.
city: optional string
Free text input for the city of the user, e.g. `San Francisco`.
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) web_search_options > (schema) > (property) user_location > (property) approximate > (property) city>)
country: optional string
The two-letter
[ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1) of the user,
e.g. `US`.
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) web_search_options > (schema) > (property) user_location > (property) approximate > (property) country>)
region: optional string
Free text input for the region of the user, e.g. `California`.
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) web_search_options > (schema) > (property) user_location > (property) approximate > (property) region>)
timezone: optional string
The [IANA timezone](https://timeapi.io/documentation/iana-timezones)
of the user, e.g. `America/Los\_Angeles`.
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) web_search_options > (schema) > (property) user_location > (property) approximate > (property) timezone>)
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) web_search_options > (schema) > (property) user_location > (property) approximate>)
type: "approximate"
The type of location approximation. Always `approximate`.
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) web_search_options > (schema) > (property) user_location > (property) type>)
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) web_search_options > (schema) > (property) user_location>)
[](<#(resource) chat.completions > (method) create > (params) 0.non_streaming > (param) web_search_options > (schema)>)
##### ReturnsExpand Collapse
ChatCompletion object { id, choices, created, 5 more }
Represents a chat completion response returned by model, based on the provided input.
id: string
A unique identifier for the chat completion.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) id>)
choices: array of object { finish\_reason, index, logprobs, message }
A list of chat completion choices. Can be more than one if `n` is greater than 1.
finish\_reason: "stop" or "length" or "tool\_calls" or 2 more
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
logprobs: object { content, refusal }
Log probability information for the choice.
content: array of [ChatCompletionTokenLogprob](</api/reference/resources/chat#(resource) chat.completions > (model) chat_completion_token_logprob > (schema)>) { token, bytes, logprob, top\_logprobs }
A list of message content tokens with log probability information.
token: string
The token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) token>)
bytes: array of number
A list of integers representing the UTF-8 bytes representation of the token. Useful in instances where characters are represented by multiple tokens and their byte representations must be combined to generate the correct text representation. Can be `null` if there is no bytes representation for the token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) bytes>)
logprob: number
The log probability of this token, if it is within the top 20 most likely tokens. Otherwise, the value `-9999.0` is used to signify that the token is very unlikely.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) logprob>)
top\_logprobs: array of object { token, bytes, logprob }
List of the most likely tokens and their log probability, at this token position. In rare cases, there may be fewer than the number of requested `top\_logprobs` returned.
token: string
The token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) token>)
bytes: array of number
A list of integers representing the UTF-8 bytes representation of the token. Useful in instances where characters are represented by multiple tokens and their byte representations must be combined to generate the correct text representation. Can be `null` if there is no bytes representation for the token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) bytes>)
logprob: number
The log probability of this token, if it is within the top 20 most likely tokens. Otherwise, the value `-9999.0` is used to signify that the token is very unlikely.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) logprob>)
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) logprobs > (property) content>)
refusal: array of [ChatCompletionTokenLogprob](</api/reference/resources/chat#(resource) chat.completions > (model) chat_completion_token_logprob > (schema)>) { token, bytes, logprob, top\_logprobs }
A list of message refusal tokens with log probability information.
token: string
The token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) token>)
bytes: array of number
A list of integers representing the UTF-8 bytes representation of the token. Useful in instances where characters are represented by multiple tokens and their byte representations must be combined to generate the correct text representation. Can be `null` if there is no bytes representation for the token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) bytes>)
logprob: number
The log probability of this token, if it is within the top 20 most likely tokens. Otherwise, the value `-9999.0` is used to signify that the token is very unlikely.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) logprob>)
top\_logprobs: array of object { token, bytes, logprob }
List of the most likely tokens and their log probability, at this token position. In rare cases, there may be fewer than the number of requested `top\_logprobs` returned.
token: string
The token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) token>)
bytes: array of number
A list of integers representing the UTF-8 bytes representation of the token. Useful in instances where characters are represented by multiple tokens and their byte representations must be combined to generate the correct text representation. Can be `null` if there is no bytes representation for the token.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) bytes>)
logprob: number
The log probability of this token, if it is within the top 20 most likely tokens. Otherwise, the value `-9999.0` is used to signify that the token is very unlikely.
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs > (items) > (property) logprob>)
[](<#(resource) chat.completions > (model) chat_completion_token_logprob > (schema) > (property) top_logprobs>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) logprobs > (property) refusal>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) logprobs>)
message: [ChatCompletionMessage](</api/reference/resources/chat#(resource) chat.completions > (model) chat_completion_message > (schema)>) { content, refusal, role, 4 more }
A chat completion message generated by the model.
content: string
The contents of the message.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) content>)
refusal: string
The refusal message generated by the model.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) refusal>)
role: "assistant"
The role of the author of this message.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) role>)
annotations: optional array of object { type, url\_citation }
Annotations for the message, when applicable, as when using the
[web search tool](/docs/guides/tools-web-search?api-mode=chat).
type: "url\_citation"
The type of the URL citation. Always `url\_citation`.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) annotations > (items) > (property) type>)
url\_citation: object { end\_index, start\_index, title, url }
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
audio: optional [ChatCompletionAudio](</api/reference/resources/chat#(resource) chat.completions > (model) chat_completion_audio > (schema)>) { id, data, expires\_at, transcript }
If the audio output modality is requested, this object contains data
about the audio response from the model. [Learn more](/docs/guides/audio).
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
Deprecatedfunction\_call: optional object { arguments, name }
Deprecated and replaced by `tool\_calls`. The name and arguments of a function that should be called, as generated by the model.
arguments: string
The arguments to call the function with, as generated by the model in JSON format. Note that the model does not always generate valid JSON, and may hallucinate parameters not defined by your function schema. Validate the arguments in your code before calling your function.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) function_call > (property) arguments>)
name: string
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) function_call > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) function_call>)
tool\_calls: optional array of [ChatCompletionMessageToolCall](</api/reference/resources/chat#(resource) chat.completions > (model) chat_completion_message_tool_call > (schema)>)
The tool calls generated by the model, such as function calls.
One of the following:
ChatCompletionMessageFunctionToolCall object { id, function, type }
A call to a function tool created by the model.
id: string
The ID of the tool call.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) id>)
function: object { arguments, name }
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
ChatCompletionMessageCustomToolCall object { id, custom, type }
A call to a custom tool created by the model.
id: string
The ID of the tool call.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) id>)
custom: object { input, name }
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
service\_tier: optional "auto" or "default" or "flex" or 2 more
Specifies the processing type used for serving the request.
* If set to ‘auto’, then the request will be processed with the service tier configured in the Project settings. Unless otherwise configured, the Project will use ‘default’.
* If set to ‘default’, then the request will be processed with the standard pricing and performance for the selected model.
* If set to ‘[flex](/docs/guides/flex-processing)’ or ‘[priority](https://openai.com/api-priority-processing/)’, then the request will be processed with the corresponding service tier.
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
Deprecatedsystem\_fingerprint: optional string
This fingerprint represents the backend configuration that the model runs with.
Can be used in conjunction with the `seed` request parameter to understand when backend changes have been made that might impact determinism.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) system_fingerprint>)
usage: optional [CompletionUsage](</api/reference/resources/completions#(resource) completions > (model) completion_usage > (schema)>) { completion\_tokens, prompt\_tokens, total\_tokens, 2 more }
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
completion\_tokens\_details: optional object { accepted\_prediction\_tokens, audio\_tokens, reasoning\_tokens, rejected\_prediction\_tokens }
Breakdown of tokens used in a completion.
accepted\_prediction\_tokens: optional number
When using Predicted Outputs, the number of tokens in the
prediction that appeared in the completion.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details > (property) accepted_prediction_tokens>)
audio\_tokens: optional number
Audio input tokens generated by the model.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details > (property) audio_tokens>)
reasoning\_tokens: optional number
Tokens generated by the model for reasoning.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details > (property) reasoning_tokens>)
rejected\_prediction\_tokens: optional number
When using Predicted Outputs, the number of tokens in the
prediction that did not appear in the completion. However, like
reasoning tokens, these tokens are still counted in the total
completion tokens for purposes of billing, output, and context window
limits.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details > (property) rejected_prediction_tokens>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details>)
prompt\_tokens\_details: optional object { audio\_tokens, cached\_tokens }
Breakdown of tokens used in the prompt.
audio\_tokens: optional number
Audio input tokens present in the prompt.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) prompt_tokens_details > (property) audio_tokens>)
cached\_tokens: optional number
Cached tokens present in the prompt.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) prompt_tokens_details > (property) cached_tokens>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) prompt_tokens_details>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage>)
[](<#(resource) chat.completions > (model) chat_completion > (schema)>)
DefaultImage inputStreamingFunctionsLogprobs
### Create chat completion
HTTP
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
`curl https://api.openai.com/v1/chat/completions \\
-H "Content-Type: application/json" \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-d '{
"model": "VAR\_chat\_model\_id",
"messages": [
{
"role": "developer",
"content": "You are a helpful assistant."
},
{
"role": "user",
"content": "Hello!"
}
]
}'
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
### Create chat completion
HTTP
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
`curl https://api.openai.com/v1/chat/completions \\
-H "Content-Type: application/json" \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-d '{
"model": "gpt-5.4",
"messages": [
{
"role": "user",
"content": [
{
"type": "text",
"text": "What is in this image?"
},
{
"type": "image\_url",
"image\_url": {
"url": "https://upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Gfp-wisconsin-madison-the-nature-boardwalk.jpg/2560px-Gfp-wisconsin-madison-the-nature-boardwalk.jpg"
}
}
]
}
],
"max\_tokens": 300
}'
`
```
```
`{
"id": "chatcmpl-B9MHDbslfkBeAs8l4bebGdFOJ6PeG",
"object": "chat.completion",
"created": 1741570283,
"model": "gpt-5.4",
"choices": [
{
"index": 0,
"message": {
"role": "assistant",
"content": "The image shows a wooden boardwalk path running through a lush green field or meadow. The sky is bright blue with some scattered clouds, giving the scene a serene and peaceful atmosphere. Trees and shrubs are visible in the background.",
"refusal": null,
"annotations": []
},
"logprobs": null,
"finish\_reason": "stop"
}
],
"usage": {
"prompt\_tokens": 1117,
"completion\_tokens": 46,
"total\_tokens": 1163,
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
### Create chat completion
HTTP
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
`curl https://api.openai.com/v1/chat/completions \\
-H "Content-Type: application/json" \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-d '{
"model": "VAR\_chat\_model\_id",
"messages": [
{
"role": "developer",
"content": "You are a helpful assistant."
},
{
"role": "user",
"content": "Hello!"
}
],
"stream": true
}'
`
```
```
`{"id":"chatcmpl-123","object":"chat.completion.chunk","created":1694268190,"model":"gpt-4o-mini", "system\_fingerprint": "fp\_44709d6fcb", "choices":[{"index":0,"delta":{"role":"assistant","content":""},"logprobs":null,"finish\_reason":null}]}
{"id":"chatcmpl-123","object":"chat.completion.chunk","created":1694268190,"model":"gpt-4o-mini", "system\_fingerprint": "fp\_44709d6fcb", "choices":[{"index":0,"delta":{"content":"Hello"},"logprobs":null,"finish\_reason":null}]}
....
{"id":"chatcmpl-123","object":"chat.completion.chunk","created":1694268190,"model":"gpt-4o-mini", "system\_fingerprint": "fp\_44709d6fcb", "choices":[{"index":0,"delta":{},"logprobs":null,"finish\_reason":"stop"}]}
`
```
### Create chat completion
HTTP
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
`curl https://api.openai.com/v1/chat/completions \\
-H "Content-Type: application/json" \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-d '{
"model": "gpt-5.4",
"messages": [
{
"role": "user",
"content": "What is the weather like in Boston today?"
}
],
"tools": [
{
"type": "function",
"function": {
"name": "get\_current\_weather",
"description": "Get the current weather in a given location",
"parameters": {
"type": "object",
"properties": {
"location": {
"type": "string",
"description": "The city and state, e.g. San Francisco, CA"
},
"unit": {
"type": "string",
"enum": ["celsius", "fahrenheit"]
}
},
"required": ["location"]
}
}
}
],
"tool\_choice": "auto"
}'
`
```
```
`{
"id": "chatcmpl-abc123",
"object": "chat.completion",
"created": 1699896916,
"model": "gpt-4o-mini",
"choices": [
{
"index": 0,
"message": {
"role": "assistant",
"content": null,
"tool\_calls": [
{
"id": "call\_abc123",
"type": "function",
"function": {
"name": "get\_current\_weather",
"arguments": "{\\n\\"location\\": \\"Boston, MA\\"\\n}"
}
}
]
},
"logprobs": null,
"finish\_reason": "tool\_calls"
}
],
"usage": {
"prompt\_tokens": 82,
"completion\_tokens": 17,
"total\_tokens": 99,
"completion\_tokens\_details": {
"reasoning\_tokens": 0,
"accepted\_prediction\_tokens": 0,
"rejected\_prediction\_tokens": 0
}
}
}
`
```
### Create chat completion
HTTP
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
`curl https://api.openai.com/v1/chat/completions \\
-H "Content-Type: application/json" \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-d '{
"model": "VAR\_chat\_model\_id",
"messages": [
{
"role": "user",
"content": "Hello!"
}
],
"logprobs": true,
"top\_logprobs": 2
}'
`
```
```
`{
"id": "chatcmpl-123",
"object": "chat.completion",
"created": 1702685778,
"model": "gpt-4o-mini",
"choices": [
{
"index": 0,
"message": {
"role": "assistant",
"content": "Hello! How can I assist you today?"
},
"logprobs": {
"content": [
{
"token": "Hello",
"logprob": -0.31725305,
"bytes": [72, 101, 108, 108, 111],
"top\_logprobs": [
{
"token": "Hello",
"logprob": -0.31725305,
"bytes": [72, 101, 108, 108, 111]
},
{
"token": "Hi",
"logprob": -1.3190403,
"bytes": [72, 105]
}
]
},
{
"token": "!",
"logprob": -0.02380986,
"bytes": [
33
],
"top\_logprobs": [
{
"token": "!",
"logprob": -0.02380986,
"bytes": [33]
},
{
"token": " there",
"logprob": -3.787621,
"bytes": [32, 116, 104, 101, 114, 101]
}
]
},
{
"token": " How",
"logprob": -0.000054669687,
"bytes": [32, 72, 111, 119],
"top\_logprobs": [
{
"token": " How",
"logprob": -0.000054669687,
"bytes": [32, 72, 111, 119]
},
{
"token": "\<|end|\>",
"logprob": -10.953937,
"bytes": null
}
]
},
{
"token": " can",
"logprob": -0.015801601,
"bytes": [32, 99, 97, 110],
"top\_logprobs": [
{
"token": " can",
"logprob": -0.015801601,
"bytes": [32, 99, 97, 110]
},
{
"token": " may",
"logprob": -4.161023,
"bytes": [32, 109, 97, 121]
}
]
},
{
"token": " I",
"logprob": -3.7697225e-6,
"bytes": [
32,
73
],
"top\_logprobs": [
{
"token": " I",
"logprob": -3.7697225e-6,
"bytes": [32, 73]
},
{
"token": " assist",
"logprob": -13.596657,
"bytes": [32, 97, 115, 115, 105, 115, 116]
}
]
},
{
"token": " assist",
"logprob": -0.04571125,
"bytes": [32, 97, 115, 115, 105, 115, 116],
"top\_logprobs": [
{
"token": " assist",
"logprob": -0.04571125,
"bytes": [32, 97, 115, 115, 105, 115, 116]
},
{
"token": " help",
"logprob": -3.1089056,
"bytes": [32, 104, 101, 108, 112]
}
]
},
{
"token": " you",
"logprob": -5.4385737e-6,
"bytes": [32, 121, 111, 117],
"top\_logprobs": [
{
"token": " you",
"logprob": -5.4385737e-6,
"bytes": [32, 121, 111, 117]
},
{
"token": " today",
"logprob": -12.807695,
"bytes": [32, 116, 111, 100, 97, 121]
}
]
},
{
"token": " today",
"logprob": -0.0040071653,
"bytes": [32, 116, 111, 100, 97, 121],
"top\_logprobs": [
{
"token": " today",
"logprob": -0.0040071653,
"bytes": [32, 116, 111, 100, 97, 121]
},
{
"token": "?",
"logprob": -5.5247097,
"bytes": [63]
}
]
},
{
"token": "?",
"logprob": -0.0008108172,
"bytes": [63],
"top\_logprobs": [
{
"token": "?",
"logprob": -0.0008108172,
"bytes": [63]
},
{
"token": "?\\n",
"logprob": -7.184561,
"bytes": [63, 10]
}
]
}
]
},
"finish\_reason": "stop"
}
],
"usage": {
"prompt\_tokens": 9,
"completion\_tokens": 9,
"total\_tokens": 18,
"completion\_tokens\_details": {
"reasoning\_tokens": 0,
"accepted\_prediction\_tokens": 0,
"rejected\_prediction\_tokens": 0
}
},
"system\_fingerprint": null
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