Create chat completion | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Chat](/api/reference/java/resources/chat)
[Completions](/api/reference/java/resources/chat/subresources/completions)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create chat completion
[ChatCompletion](</api/reference/java/resources/chat#(resource) chat.completions > (model) chat_completion > (schema)>) chat().completions().create(ChatCompletionCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
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
ChatCompletionCreateParams params
List\<[ChatCompletionMessageParam](</api/reference/java/resources/chat#(resource) chat.completions > (model) chat_completion_message_param > (schema)>)\> messages
A list of messages comprising the conversation so far. Depending on the
[model](https://platform.openai.com/docs/models) you use, different message types (modalities) are
supported, like [text](https://platform.openai.com/docs/guides/text-generation),
[images](https://platform.openai.com/docs/guides/vision), and [audio](https://platform.openai.com/docs/guides/audio).
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
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) messages>)
[ChatModel](</api/reference/java/resources/$shared#(resource) $shared > (model) chat_model > (schema)>) model
Model ID used to generate the response, like `gpt-4o` or `o3`. OpenAI
offers a wide range of models with different capabilities, performance
characteristics, and price points. Refer to the [model guide](https://platform.openai.com/docs/models)
to browse and compare available models.
GPT\_5\_4("gpt-5.4")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 0>)
GPT\_5\_4\_MINI("gpt-5.4-mini")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 1>)
GPT\_5\_4\_NANO("gpt-5.4-nano")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 2>)
GPT\_5\_4\_MINI\_2026\_03\_17("gpt-5.4-mini-2026-03-17")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 3>)
GPT\_5\_4\_NANO\_2026\_03\_17("gpt-5.4-nano-2026-03-17")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 4>)
GPT\_5\_3\_CHAT\_LATEST("gpt-5.3-chat-latest")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 5>)
GPT\_5\_2("gpt-5.2")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 6>)
GPT\_5\_2\_2025\_12\_11("gpt-5.2-2025-12-11")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 7>)
GPT\_5\_2\_CHAT\_LATEST("gpt-5.2-chat-latest")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 8>)
GPT\_5\_2\_PRO("gpt-5.2-pro")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 9>)
GPT\_5\_2\_PRO\_2025\_12\_11("gpt-5.2-pro-2025-12-11")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 10>)
GPT\_5\_1("gpt-5.1")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 11>)
GPT\_5\_1\_2025\_11\_13("gpt-5.1-2025-11-13")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 12>)
GPT\_5\_1\_CODEX("gpt-5.1-codex")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 13>)
GPT\_5\_1\_MINI("gpt-5.1-mini")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 14>)
GPT\_5\_1\_CHAT\_LATEST("gpt-5.1-chat-latest")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 15>)
GPT\_5("gpt-5")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 16>)
GPT\_5\_MINI("gpt-5-mini")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 17>)
GPT\_5\_NANO("gpt-5-nano")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 18>)
GPT\_5\_2025\_08\_07("gpt-5-2025-08-07")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 19>)
GPT\_5\_MINI\_2025\_08\_07("gpt-5-mini-2025-08-07")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 20>)
GPT\_5\_NANO\_2025\_08\_07("gpt-5-nano-2025-08-07")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 21>)
GPT\_5\_CHAT\_LATEST("gpt-5-chat-latest")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 22>)
GPT\_4\_1("gpt-4.1")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 23>)
GPT\_4\_1\_MINI("gpt-4.1-mini")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 24>)
GPT\_4\_1\_NANO("gpt-4.1-nano")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 25>)
GPT\_4\_1\_2025\_04\_14("gpt-4.1-2025-04-14")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 26>)
GPT\_4\_1\_MINI\_2025\_04\_14("gpt-4.1-mini-2025-04-14")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 27>)
GPT\_4\_1\_NANO\_2025\_04\_14("gpt-4.1-nano-2025-04-14")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 28>)
O4\_MINI("o4-mini")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 29>)
O4\_MINI\_2025\_04\_16("o4-mini-2025-04-16")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 30>)
O3("o3")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 31>)
O3\_2025\_04\_16("o3-2025-04-16")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 32>)
O3\_MINI("o3-mini")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 33>)
O3\_MINI\_2025\_01\_31("o3-mini-2025-01-31")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 34>)
O1("o1")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 35>)
O1\_2024\_12\_17("o1-2024-12-17")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 36>)
O1\_PREVIEW("o1-preview")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 37>)
O1\_PREVIEW\_2024\_09\_12("o1-preview-2024-09-12")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 38>)
O1\_MINI("o1-mini")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 39>)
O1\_MINI\_2024\_09\_12("o1-mini-2024-09-12")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 40>)
GPT\_4O("gpt-4o")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 41>)
GPT\_4O\_2024\_11\_20("gpt-4o-2024-11-20")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 42>)
GPT\_4O\_2024\_08\_06("gpt-4o-2024-08-06")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 43>)
GPT\_4O\_2024\_05\_13("gpt-4o-2024-05-13")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 44>)
GPT\_4O\_AUDIO\_PREVIEW("gpt-4o-audio-preview")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 45>)
GPT\_4O\_AUDIO\_PREVIEW\_2024\_10\_01("gpt-4o-audio-preview-2024-10-01")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 46>)
GPT\_4O\_AUDIO\_PREVIEW\_2024\_12\_17("gpt-4o-audio-preview-2024-12-17")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 47>)
GPT\_4O\_AUDIO\_PREVIEW\_2025\_06\_03("gpt-4o-audio-preview-2025-06-03")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 48>)
GPT\_4O\_MINI\_AUDIO\_PREVIEW("gpt-4o-mini-audio-preview")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 49>)
GPT\_4O\_MINI\_AUDIO\_PREVIEW\_2024\_12\_17("gpt-4o-mini-audio-preview-2024-12-17")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 50>)
GPT\_4O\_SEARCH\_PREVIEW("gpt-4o-search-preview")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 51>)
GPT\_4O\_MINI\_SEARCH\_PREVIEW("gpt-4o-mini-search-preview")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 52>)
GPT\_4O\_SEARCH\_PREVIEW\_2025\_03\_11("gpt-4o-search-preview-2025-03-11")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 53>)
GPT\_4O\_MINI\_SEARCH\_PREVIEW\_2025\_03\_11("gpt-4o-mini-search-preview-2025-03-11")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 54>)
CHATGPT\_4O\_LATEST("chatgpt-4o-latest")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 55>)
CODEX\_MINI\_LATEST("codex-mini-latest")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 56>)
GPT\_4O\_MINI("gpt-4o-mini")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 57>)
GPT\_4O\_MINI\_2024\_07\_18("gpt-4o-mini-2024-07-18")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 58>)
GPT\_4\_TURBO("gpt-4-turbo")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 59>)
GPT\_4\_TURBO\_2024\_04\_09("gpt-4-turbo-2024-04-09")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 60>)
GPT\_4\_0125\_PREVIEW("gpt-4-0125-preview")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 61>)
GPT\_4\_TURBO\_PREVIEW("gpt-4-turbo-preview")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 62>)
GPT\_4\_1106\_PREVIEW("gpt-4-1106-preview")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 63>)
GPT\_4\_VISION\_PREVIEW("gpt-4-vision-preview")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 64>)
GPT\_4("gpt-4")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 65>)
GPT\_4\_0314("gpt-4-0314")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 66>)
GPT\_4\_0613("gpt-4-0613")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 67>)
GPT\_4\_32K("gpt-4-32k")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 68>)
GPT\_4\_32K\_0314("gpt-4-32k-0314")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 69>)
GPT\_4\_32K\_0613("gpt-4-32k-0613")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 70>)
GPT\_3\_5\_TURBO("gpt-3.5-turbo")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 71>)
GPT\_3\_5\_TURBO\_16K("gpt-3.5-turbo-16k")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 72>)
GPT\_3\_5\_TURBO\_0301("gpt-3.5-turbo-0301")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 73>)
GPT\_3\_5\_TURBO\_0613("gpt-3.5-turbo-0613")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 74>)
GPT\_3\_5\_TURBO\_1106("gpt-3.5-turbo-1106")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 75>)
GPT\_3\_5\_TURBO\_0125("gpt-3.5-turbo-0125")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 76>)
GPT\_3\_5\_TURBO\_16K\_0613("gpt-3.5-turbo-16k-0613")
[](<#(resource) $shared > (model) chat_model > (schema) > (member) 77>)
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) model>)
Optional\<[ChatCompletionAudioParam](</api/reference/java/resources/chat#(resource) chat.completions > (model) chat_completion_audio_param > (schema)>)\> audio
Parameters for audio output. Required when audio output is requested with
`modalities: ["audio"]`. [Learn more](https://platform.openai.com/docs/guides/audio).
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) audio>)
Optional\<Double\> frequencyPenalty
Number between -2.0 and 2.0. Positive values penalize new tokens based on
their existing frequency in the text so far, decreasing the model’s
likelihood to repeat the same line verbatim.
minimum-2
maximum2
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) frequency_penalty>)
DeprecatedOptional\<FunctionCall\> functionCall
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
enum FunctionCallMode:
`none` means the model will not call a function and instead generates a message. `auto` means the model can pick between generating a message or calling a function.
NONE("none")
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) function_call > (variant) 0 > (member) 0>)
AUTO("auto")
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) function_call > (variant) 0 > (member) 1>)
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) function_call > (variant) 0>)
class ChatCompletionFunctionCallOption:
Specifying a particular function via `{"name": "my\_function"}` forces the model to call that function.
String name
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion_function_call_option > (schema) > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion_function_call_option > (schema)>)
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) function_call>)
DeprecatedOptional\<List\<Function\>\> functions
Deprecated in favor of `tools`.
A list of functions the model may generate JSON inputs for.
String name
The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) functions > (items) > (property) name>)
Optional\<String\> description
A description of what the function does, used by the model to choose when and how to call the function.
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) functions > (items) > (property) description>)
Optional\<[FunctionParameters](</api/reference/java/resources/$shared#(resource) $shared > (model) function_parameters > (schema)>)\> parameters
The parameters the functions accepts, described as a JSON Schema object. See the [guide](https://platform.openai.com/docs/guides/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format.
Omitting `parameters` defines a function with an empty parameter list.
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) functions > (items) > (property) parameters>)
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) functions>)
Optional\<LogitBias\> logitBias
Modify the likelihood of specified tokens appearing in the completion.
Accepts a JSON object that maps tokens (specified by their token ID in the
tokenizer) to an associated bias value from -100 to 100. Mathematically,
the bias is added to the logits generated by the model prior to sampling.
The exact effect will vary per model, but values between -1 and 1 should
decrease or increase likelihood of selection; values like -100 or 100
should result in a ban or exclusive selection of the relevant token.
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) logit_bias>)
Optional\<Boolean\> logprobs
Whether to return log probabilities of the output tokens or not. If true,
returns the log probabilities of each output token returned in the
`content` of `message`.
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) logprobs>)
Optional\<Long\> maxCompletionTokens
An upper bound for the number of tokens that can be generated for a completion, including visible output tokens and [reasoning tokens](https://platform.openai.com/docs/guides/reasoning).
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) max_completion_tokens>)
DeprecatedOptional\<Long\> maxTokens
The maximum number of [tokens](/tokenizer) that can be generated in the
chat completion. This value can be used to control
[costs](https://openai.com/api/pricing/) for text generated via API.
This value is now deprecated in favor of `max\_completion\_tokens`, and is
not compatible with [o-series models](https://platform.openai.com/docs/guides/reasoning).
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) max_tokens>)
Optional\<Metadata\> metadata
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) metadata>)
Optional\<List\<Modality\>\> modalities
Output types that you would like the model to generate.
Most models are capable of generating text, which is the default:
`["text"]`
The `gpt-4o-audio-preview` model can also be used to
[generate audio](https://platform.openai.com/docs/guides/audio). To request that this model generate
both text and audio responses, you can use:
`["text", "audio"]`
TEXT("text")
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) modalities > (items) > (member) 0>)
AUDIO("audio")
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) modalities > (items) > (member) 1>)
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) modalities>)
Optional\<Long\> n
How many chat completion choices to generate for each input message. Note that you will be charged based on the number of generated tokens across all of the choices. Keep `n` as `1` to minimize costs.
minimum1
maximum128
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) n>)
Optional\<Boolean\> parallelToolCalls
Whether to enable [parallel function calling](https://platform.openai.com/docs/guides/function-calling#configuring-parallel-function-calling) during tool use.
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) parallel_tool_calls>)
Optional\<[ChatCompletionPredictionContent](</api/reference/java/resources/chat#(resource) chat.completions > (model) chat_completion_prediction_content > (schema)>)\> prediction
Static predicted output content, such as the content of a text file that is
being regenerated.
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) prediction>)
Optional\<Double\> presencePenalty
Number between -2.0 and 2.0. Positive values penalize new tokens based on
whether they appear in the text so far, increasing the model’s likelihood
to talk about new topics.
minimum-2
maximum2
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) presence_penalty>)
Optional\<String\> promptCacheKey
Used by OpenAI to cache responses for similar requests to optimize your cache hit rates. Replaces the `user` field. [Learn more](https://platform.openai.com/docs/guides/prompt-caching).
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) prompt_cache_key>)
Optional\<PromptCacheRetention\> promptCacheRetention
The retention policy for the prompt cache. Set to `24h` to enable extended prompt caching, which keeps cached prefixes active for longer, up to a maximum of 24 hours. [Learn more](https://platform.openai.com/docs/guides/prompt-caching#prompt-cache-retention).
IN\_MEMORY("in\_memory")
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) prompt_cache_retention > (member) 0>)
\_24H("24h")
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) prompt_cache_retention > (member) 1>)
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) prompt_cache_retention>)
Optional\<[ReasoningEffort](</api/reference/java/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>)\> reasoningEffort
Constrains effort on reasoning for
[reasoning models](https://platform.openai.com/docs/guides/reasoning).
Currently supported values are `none`, `minimal`, `low`, `medium`, `high`, and `xhigh`. Reducing
reasoning effort can result in faster responses and fewer tokens used
on reasoning in a response.
* `gpt-5.1` defaults to `none`, which does not perform reasoning. The supported reasoning values for `gpt-5.1` are `none`, `low`, `medium`, and `high`. Tool calls are supported for all reasoning values in gpt-5.1.
* All models before `gpt-5.1` default to `medium` reasoning effort, and do not support `none`.
* The `gpt-5-pro` model defaults to (and only supports) `high` reasoning effort.
* `xhigh` is supported for all models after `gpt-5.1-codex-max`.
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) reasoning_effort>)
Optional\<ResponseFormat\> responseFormat
An object specifying the format that the model must output.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables
Structured Outputs which ensures the model will match your supplied JSON
schema. Learn more in the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables the older JSON mode, which
ensures the message the model generates is valid JSON. Using `json\_schema`
is preferred for models that support it.
class ResponseFormatText:
Default response format. Used to generate text responses.
JsonValue; type "text"constant"text"constant
The type of response format being defined. Always `text`.
[](<#(resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) $shared > (model) response_format_text > (schema)>)
class ResponseFormatJsonSchema:
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](https://platform.openai.com/docs/guides/structured-outputs).
JsonSchema jsonSchema
Structured Outputs configuration options, including a JSON Schema.
String name
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
Optional\<String\> description
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
Optional\<Schema\> schema
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
Optional\<Boolean\> strict
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
JsonValue; type "json\_schema"constant"json\_schema"constant
The type of response format being defined. Always `json\_schema`.
[](<#(resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) $shared > (model) response_format_json_schema > (schema)>)
class ResponseFormatJsonObject:
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
JsonValue; type "json\_object"constant"json\_object"constant
The type of response format being defined. Always `json\_object`.
[](<#(resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) $shared > (model) response_format_json_object > (schema)>)
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) response_format>)
Optional\<String\> safetyIdentifier
A stable identifier used to help detect users of your application that may be violating OpenAI’s usage policies.
The IDs should be a string that uniquely identifies each user, with a maximum length of 64 characters. We recommend hashing their username or email address, in order to avoid sending us any identifying information. [Learn more](https://platform.openai.com/docs/guides/safety-best-practices#safety-identifiers).
maxLength64
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) safety_identifier>)
DeprecatedOptional\<Long\> seed
This feature is in Beta.
If specified, our system will make a best effort to sample deterministically, such that repeated requests with the same `seed` and parameters should return the same result.
Determinism is not guaranteed, and you should refer to the `system\_fingerprint` response parameter to monitor changes in the backend.
minimum-9223372036854776000
maximum9223372036854776000
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) seed>)
Optional\<ServiceTier\> serviceTier
Specifies the processing type used for serving the request.
* If set to ‘auto’, then the request will be processed with the service tier configured in the Project settings. Unless otherwise configured, the Project will use ‘default’.
* If set to ‘default’, then the request will be processed with the standard pricing and performance for the selected model.
* If set to ‘[flex](https://platform.openai.com/docs/guides/flex-processing)’ or ‘[priority](https://openai.com/api-priority-processing/)’, then the request will be processed with the corresponding service tier.
* When not set, the default behavior is ‘auto’.
When the `service\_tier` parameter is set, the response body will include the `service\_tier` value based on the processing mode actually used to serve the request. This response value may be different from the value set in the parameter.
AUTO("auto")
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) service_tier > (member) 0>)
DEFAULT("default")
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) service_tier > (member) 1>)
FLEX("flex")
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) service_tier > (member) 2>)
SCALE("scale")
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) service_tier > (member) 3>)
PRIORITY("priority")
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) service_tier > (member) 4>)
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) service_tier>)
Optional\<Stop\> stop
Not supported with latest reasoning models `o3` and `o4-mini`.
Up to 4 sequences where the API will stop generating further tokens. The
returned text will not contain the stop sequence.
String
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) stop > (variant) 0>)
List\<String\>
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) stop > (variant) 1>)
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) stop>)
Optional\<Boolean\> store
Whether or not to store the output of this chat completion request for
use in our [model distillation](https://platform.openai.com/docs/guides/distillation) or
[evals](https://platform.openai.com/docs/guides/evals) products.
Supports text and image inputs. Note: image inputs over 8MB will be dropped.
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) store>)
Optional\<[ChatCompletionStreamOptions](</api/reference/java/resources/chat#(resource) chat.completions > (model) chat_completion_stream_options > (schema)>)\> streamOptions
Options for streaming response. Only set this when you set `stream: true`.
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) stream_options>)
Optional\<Double\> temperature
What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
We generally recommend altering this or `top\_p` but not both.
minimum0
maximum2
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) temperature>)
Optional\<[ChatCompletionToolChoiceOption](</api/reference/java/resources/chat#(resource) chat.completions > (model) chat_completion_tool_choice_option > (schema)>)\> toolChoice
Controls which (if any) tool is called by the model.
`none` means the model will not call any tool and instead generates a message.
`auto` means the model can pick between generating a message or calling one or more tools.
`required` means the model must call one or more tools.
Specifying a particular tool via `{"type": "function", "function": {"name": "my\_function"}}` forces the model to call that tool.
`none` is the default when no tools are present. `auto` is the default if tools are present.
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) tool_choice>)
Optional\<List\<[ChatCompletionTool](</api/reference/java/resources/chat#(resource) chat.completions > (model) chat_completion_tool > (schema)>)\>\> tools
A list of tools the model may call. You can provide either
[custom tools](https://platform.openai.com/docs/guides/function-calling#custom-tools) or
[function tools](https://platform.openai.com/docs/guides/function-calling).
class ChatCompletionFunctionTool:
A function tool that can be used to generate a response.
[FunctionDefinition](</api/reference/java/resources/$shared#(resource) $shared > (model) function_definition > (schema)>) function
String name
The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) name>)
Optional\<String\> description
A description of what the function does, used by the model to choose when and how to call the function.
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) description>)
Optional\<[FunctionParameters](</api/reference/java/resources/$shared#(resource) $shared > (model) function_parameters > (schema)>)\> parameters
The parameters the functions accepts, described as a JSON Schema object. See the [guide](https://platform.openai.com/docs/guides/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format.
Omitting `parameters` defines a function with an empty parameter list.
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) parameters>)
Optional\<Boolean\> strict
Whether to enable strict schema adherence when generating the function call. If set to true, the model will follow the exact schema defined in the `parameters` field. Only a subset of JSON Schema is supported when `strict` is `true`. Learn more about Structured Outputs in the [function calling guide](https://platform.openai.com/docs/guides/function-calling).
[](<#(resource) chat.completions > (model) chat_completion_function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) strict>)
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
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) tools>)
Optional\<Long\> topLogprobs
An integer between 0 and 20 specifying the number of most likely tokens to
return at each token position, each with an associated log probability.
`logprobs` must be set to `true` if this parameter is used.
minimum0
maximum20
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) top_logprobs>)
Optional\<Double\> topP
An alternative to sampling with temperature, called nucleus sampling,
where the model considers the results of the tokens with top\_p probability
mass. So 0.1 means only the tokens comprising the top 10% probability mass
are considered.
We generally recommend altering this or `temperature` but not both.
minimum0
maximum1
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) top_p>)
DeprecatedOptional\<String\> user
This field is being replaced by `safety\_identifier` and `prompt\_cache\_key`. Use `prompt\_cache\_key` instead to maintain caching optimizations.
A stable identifier for your end-users.
Used to boost cache hit rates by better bucketing similar requests and to help OpenAI detect and prevent abuse. [Learn more](https://platform.openai.com/docs/guides/safety-best-practices#safety-identifiers).
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) user>)
Optional\<Verbosity\> verbosity
Constrains the verbosity of the model’s response. Lower values will result in
more concise responses, while higher values will result in more verbose responses.
Currently supported values are `low`, `medium`, and `high`.
LOW("low")
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) verbosity > (member) 0>)
MEDIUM("medium")
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) verbosity > (member) 1>)
HIGH("high")
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) verbosity > (member) 2>)
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) verbosity>)
Optional\<WebSearchOptions\> webSearchOptions
This tool searches the web for relevant results to use in a response.
Learn more about the [web search tool](https://platform.openai.com/docs/guides/tools-web-search?api-mode=chat).
Optional\<SearchContextSize\> searchContextSize
High level guidance for the amount of context window space to use for the
search. One of `low`, `medium`, or `high`. `medium` is the default.
One of the following:
LOW("low")
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) web_search_options > (property) search_context_size > (member) 0>)
MEDIUM("medium")
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) web_search_options > (property) search_context_size > (member) 1>)
HIGH("high")
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) web_search_options > (property) search_context_size > (member) 2>)
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) web_search_options > (property) search_context_size>)
Optional\<UserLocation\> userLocation
Approximate location parameters for the search.
Approximate approximate
Approximate location parameters for the search.
Optional\<String\> city
Free text input for the city of the user, e.g. `San Francisco`.
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) web_search_options > (property) user_location > (property) approximate > (property) city>)
Optional\<String\> country
The two-letter
[ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1) of the user,
e.g. `US`.
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) web_search_options > (property) user_location > (property) approximate > (property) country>)
Optional\<String\> region
Free text input for the region of the user, e.g. `California`.
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) web_search_options > (property) user_location > (property) approximate > (property) region>)
Optional\<String\> timezone
The [IANA timezone](https://timeapi.io/documentation/iana-timezones)
of the user, e.g. `America/Los\_Angeles`.
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) web_search_options > (property) user_location > (property) approximate > (property) timezone>)
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) web_search_options > (property) user_location > (property) approximate>)
JsonValue; type "approximate"constant"approximate"constant
The type of location approximation. Always `approximate`.
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) web_search_options > (property) user_location > (property) type>)
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) web_search_options > (property) user_location>)
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming > (param) body > (schema) > (property) web_search_options>)
[](<#(resource) chat.completions > (method) create > (params) default.non_streaming>)
##### ReturnsExpand Collapse
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
Optional\<String\> content
The contents of the message.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) content>)
Optional\<String\> refusal
The refusal message generated by the model.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) refusal>)
JsonValue; role "assistant"constant"assistant"constant
The role of the author of this message.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) role>)
Optional\<List\<Annotation\>\> annotations
Annotations for the message, when applicable, as when using the
[web search tool](https://platform.openai.com/docs/guides/tools-web-search?api-mode=chat).
JsonValue; type "url\_citation"constant"url\_citation"constant
The type of the URL citation. Always `url\_citation`.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) annotations > (items) > (property) type>)
UrlCitation urlCitation
A URL citation when using web search.
long endIndex
The index of the last character of the URL citation in the message.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) annotations > (items) > (property) url_citation > (property) end_index>)
long startIndex
The index of the first character of the URL citation in the message.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) annotations > (items) > (property) url_citation > (property) start_index>)
String title
The title of the web resource.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) annotations > (items) > (property) url_citation > (property) title>)
String url
The URL of the web resource.
formaturi
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) annotations > (items) > (property) url_citation > (property) url>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) annotations > (items) > (property) url_citation>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) annotations>)
Optional\<[ChatCompletionAudio](</api/reference/java/resources/chat#(resource) chat.completions > (model) chat_completion_audio > (schema)>)\> audio
If the audio output modality is requested, this object contains data
about the audio response from the model. [Learn more](https://platform.openai.com/docs/guides/audio).
String id
Unique identifier for this audio response.
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) audio + (resource) chat.completions > (model) chat_completion_audio > (schema) > (property) id>)
String data
Base64 encoded audio bytes generated by the model, in the format
specified in the request.
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) audio + (resource) chat.completions > (model) chat_completion_audio > (schema) > (property) data>)
long expiresAt
The Unix timestamp (in seconds) for when this audio response will
no longer be accessible on the server for use in multi-turn
conversations.
formatunixtime
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) audio + (resource) chat.completions > (model) chat_completion_audio > (schema) > (property) expires_at>)
String transcript
Transcript of the audio generated by the model.
[](<#(resource) chat.completions > (model) chat_completion_message > (schema) > (property) audio + (resource) chat.completions > (model) chat_completion_audio > (schema) > (property) transcript>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) audio>)
DeprecatedOptional\<FunctionCall\> functionCall
Deprecated and replaced by `tool\_calls`. The name and arguments of a function that should be called, as generated by the model.
String arguments
The arguments to call the function with, as generated by the model in JSON format. Note that the model does not always generate valid JSON, and may hallucinate parameters not defined by your function schema. Validate the arguments in your code before calling your function.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) function_call > (property) arguments>)
String name
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) function_call > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) function_call>)
Optional\<List\<[ChatCompletionMessageToolCall](</api/reference/java/resources/chat#(resource) chat.completions > (model) chat_completion_message_tool_call > (schema)>)\>\> toolCalls
The tool calls generated by the model, such as function calls.
One of the following:
class ChatCompletionMessageFunctionToolCall:
A call to a function tool created by the model.
String id
The ID of the tool call.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) id>)
Function function
The function that the model called.
String arguments
The arguments to call the function with, as generated by the model in JSON format. Note that the model does not always generate valid JSON, and may hallucinate parameters not defined by your function schema. Validate the arguments in your code before calling your function.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function > (property) arguments>)
String name
The name of the function to call.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) function>)
JsonValue; type "function"constant"function"constant
The type of the tool. Currently, only `function` is supported.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message_function_tool_call > (schema)>)
class ChatCompletionMessageCustomToolCall:
A call to a custom tool created by the model.
String id
The ID of the tool call.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) id>)
Custom custom
The custom tool that the model called.
String input
The input for the custom tool call generated by the model.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom > (property) input>)
String name
The name of the custom tool to call.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom > (property) name>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) custom>)
JsonValue; type "custom"constant"custom"constant
The type of the tool. Always `custom`.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema) > (property) type>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message_custom_tool_call > (schema)>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) choices > (items) > (property) message + (resource) chat.completions > (model) chat_completion_message > (schema) > (property) tool_calls>)
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
long completionTokens
Number of tokens in the generated completion.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) completion_tokens>)
long promptTokens
Number of tokens in the prompt.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) prompt_tokens>)
long totalTokens
Total number of tokens used in the request (prompt + completion).
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) total_tokens>)
Optional\<CompletionTokensDetails\> completionTokensDetails
Breakdown of tokens used in a completion.
Optional\<Long\> acceptedPredictionTokens
When using Predicted Outputs, the number of tokens in the
prediction that appeared in the completion.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details > (property) accepted_prediction_tokens>)
Optional\<Long\> audioTokens
Audio input tokens generated by the model.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details > (property) audio_tokens>)
Optional\<Long\> reasoningTokens
Tokens generated by the model for reasoning.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details > (property) reasoning_tokens>)
Optional\<Long\> rejectedPredictionTokens
When using Predicted Outputs, the number of tokens in the
prediction that did not appear in the completion. However, like
reasoning tokens, these tokens are still counted in the total
completion tokens for purposes of billing, output, and context window
limits.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details > (property) rejected_prediction_tokens>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details>)
Optional\<PromptTokensDetails\> promptTokensDetails
Breakdown of tokens used in the prompt.
Optional\<Long\> audioTokens
Audio input tokens present in the prompt.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) prompt_tokens_details > (property) audio_tokens>)
Optional\<Long\> cachedTokens
Cached tokens present in the prompt.
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) prompt_tokens_details > (property) cached_tokens>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) prompt_tokens_details>)
[](<#(resource) chat.completions > (model) chat_completion > (schema) > (property) usage>)
[](<#(resource) chat.completions > (model) chat_completion > (schema)>)
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
long completionTokens
Number of tokens in the generated completion.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) completion_tokens>)
long promptTokens
Number of tokens in the prompt.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) prompt_tokens>)
long totalTokens
Total number of tokens used in the request (prompt + completion).
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) total_tokens>)
Optional\<CompletionTokensDetails\> completionTokensDetails
Breakdown of tokens used in a completion.
Optional\<Long\> acceptedPredictionTokens
When using Predicted Outputs, the number of tokens in the
prediction that appeared in the completion.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details > (property) accepted_prediction_tokens>)
Optional\<Long\> audioTokens
Audio input tokens generated by the model.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details > (property) audio_tokens>)
Optional\<Long\> reasoningTokens
Tokens generated by the model for reasoning.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details > (property) reasoning_tokens>)
Optional\<Long\> rejectedPredictionTokens
When using Predicted Outputs, the number of tokens in the
prediction that did not appear in the completion. However, like
reasoning tokens, these tokens are still counted in the total
completion tokens for purposes of billing, output, and context window
limits.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details > (property) rejected_prediction_tokens>)
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) completion_tokens_details>)
Optional\<PromptTokensDetails\> promptTokensDetails
Breakdown of tokens used in the prompt.
Optional\<Long\> audioTokens
Audio input tokens present in the prompt.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) prompt_tokens_details > (property) audio_tokens>)
Optional\<Long\> cachedTokens
Cached tokens present in the prompt.
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) prompt_tokens_details > (property) cached_tokens>)
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) usage + (resource) completions > (model) completion_usage > (schema) > (property) prompt_tokens_details>)
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema) > (property) usage>)
[](<#(resource) chat.completions > (model) chat_completion_chunk > (schema)>)
### Create chat completion
Java
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
`package com.openai.example;
import com.openai.client.OpenAIClient;
import com.openai.client.okhttp.OpenAIOkHttpClient;
import com.openai.models.ChatModel;
import com.openai.models.chat.completions.ChatCompletion;
import com.openai.models.chat.completions.ChatCompletionCreateParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
ChatCompletionCreateParams params = ChatCompletionCreateParams.builder()
.addDeveloperMessage("string")
.model(ChatModel.GPT\_5\_4)
.build();
ChatCompletion chatCompletion = client.chat().completions().create(params);
}
}`
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