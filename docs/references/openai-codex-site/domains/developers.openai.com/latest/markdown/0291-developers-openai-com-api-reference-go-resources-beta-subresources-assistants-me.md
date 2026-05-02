Create assistant | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Beta](/api/reference/go/resources/beta)
[Assistants](/api/reference/go/resources/beta/subresources/assistants)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create assistant
Deprecated
client.Beta.Assistants.New(ctx, body) (\*[Assistant](</api/reference/go/resources/beta#(resource) beta.assistants > (model) assistant > (schema)>), error)
POST/assistants
Create an assistant with a model and instructions.
##### ParametersExpand Collapse
body BetaAssistantNewParams
Model param.Field[[ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>)]
ID of the model to use. You can use the [List models](https://platform.openai.com/docs/api-reference/models/list) API to see all of your available models, or see our [Model overview](https://platform.openai.com/docs/models) for descriptions of them.
string
[](<#(resource) beta.assistants > (method) create > (params) default > (param) model > (schema) > (variant) 0>)
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
[](<#(resource) beta.assistants > (method) create > (params) default > (param) model>)
Description param.Field[string]Optional
The description of the assistant. The maximum length is 512 characters.
maxLength512
[](<#(resource) beta.assistants > (method) create > (params) default > (param) description>)
Instructions param.Field[string]Optional
The system instructions that the assistant uses. The maximum length is 256,000 characters.
maxLength256000
[](<#(resource) beta.assistants > (method) create > (params) default > (param) instructions>)
Metadata param.Field[[Metadata](</api/reference/go/resources/$shared#(resource) $shared > (model) metadata > (schema)>)]Optional
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (method) create > (params) default > (param) metadata>)
Name param.Field[string]Optional
The name of the assistant. The maximum length is 256 characters.
maxLength256
[](<#(resource) beta.assistants > (method) create > (params) default > (param) name>)
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
[](<#(resource) beta.assistants > (method) create > (params) default > (param) reasoning_effort>)
ResponseFormat param.Field[[AssistantResponseFormatOptionUnion](</api/reference/go/resources/beta#(resource) beta.threads > (model) assistant_response_format_option > (schema)>)]Optional
Specifies the format that the model must output. Compatible with [GPT-4o](https://platform.openai.com/docs/models#gpt-4o), [GPT-4 Turbo](https://platform.openai.com/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly “stuck” request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
[](<#(resource) beta.assistants > (method) create > (params) default > (param) response_format>)
Temperature param.Field[float64]Optional
What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
minimum0
maximum2
[](<#(resource) beta.assistants > (method) create > (params) default > (param) temperature>)
ToolResources param.Field[[BetaAssistantNewParamsToolResources](</api/reference/go/resources/beta/subresources/assistants/methods/create#(resource) beta.assistants > (method) create > (params) default > (param) tool_resources > (schema)>)]Optional
A set of resources that are used by the assistant’s tools. The resources are specific to the type of tool. For example, the `code\_interpreter` tool requires a list of file IDs, while the `file\_search` tool requires a list of vector store IDs.
CodeInterpreter BetaAssistantNewParamsToolResourcesCodeInterpreterOptional
FileIDs []stringOptional
A list of [file](https://platform.openai.com/docs/api-reference/files) IDs made available to the `code\_interpreter` tool. There can be a maximum of 20 files associated with the tool.
[](<#(resource) beta.assistants > (method) create > (params) default > (param) tool_resources > (schema) > (property) code_interpreter > (property) file_ids>)
[](<#(resource) beta.assistants > (method) create > (params) default > (param) tool_resources > (schema) > (property) code_interpreter>)
FileSearch BetaAssistantNewParamsToolResourcesFileSearchOptional
VectorStoreIDs []stringOptional
The [vector store](https://platform.openai.com/docs/api-reference/vector-stores/object) attached to this assistant. There can be a maximum of 1 vector store attached to the assistant.
[](<#(resource) beta.assistants > (method) create > (params) default > (param) tool_resources > (schema) > (property) file_search > (property) vector_store_ids>)
VectorStores []BetaAssistantNewParamsToolResourcesFileSearchVectorStoreOptional
A helper to create a [vector store](https://platform.openai.com/docs/api-reference/vector-stores/object) with file\_ids and attach it to this assistant. There can be a maximum of 1 vector store attached to the assistant.
ChunkingStrategy BetaAssistantNewParamsToolResourcesFileSearchVectorStoreChunkingStrategyUnionOptional
The chunking strategy used to chunk the file(s). If not set, will use the `auto` strategy.
One of the following:
type BetaAssistantNewParamsToolResourcesFileSearchVectorStoreChunkingStrategyAuto struct{…}
The default strategy. This strategy currently uses a `max\_chunk\_size\_tokens` of `800` and `chunk\_overlap\_tokens` of `400`.
Type Auto
Always `auto`.
[](<#(resource) beta.assistants > (method) create > (params) default > (param) tool_resources > (schema) > (property) file_search > (property) vector_stores > (items) > (property) chunking_strategy > (variant) 0 > (property) type>)
[](<#(resource) beta.assistants > (method) create > (params) default > (param) tool_resources > (schema) > (property) file_search > (property) vector_stores > (items) > (property) chunking_strategy > (variant) 0>)
type BetaAssistantNewParamsToolResourcesFileSearchVectorStoreChunkingStrategyStatic struct{…}
Static BetaAssistantNewParamsToolResourcesFileSearchVectorStoreChunkingStrategyStaticStatic
ChunkOverlapTokens int64
The number of tokens that overlap between chunks. The default value is `400`.
Note that the overlap must not exceed half of `max\_chunk\_size\_tokens`.
[](<#(resource) beta.assistants > (method) create > (params) default > (param) tool_resources > (schema) > (property) file_search > (property) vector_stores > (items) > (property) chunking_strategy > (variant) 1 > (property) static > (property) chunk_overlap_tokens>)
MaxChunkSizeTokens int64
The maximum number of tokens in each chunk. The default value is `800`. The minimum value is `100` and the maximum value is `4096`.
minimum100
maximum4096
[](<#(resource) beta.assistants > (method) create > (params) default > (param) tool_resources > (schema) > (property) file_search > (property) vector_stores > (items) > (property) chunking_strategy > (variant) 1 > (property) static > (property) max_chunk_size_tokens>)
[](<#(resource) beta.assistants > (method) create > (params) default > (param) tool_resources > (schema) > (property) file_search > (property) vector_stores > (items) > (property) chunking_strategy > (variant) 1 > (property) static>)
Type Static
Always `static`.
[](<#(resource) beta.assistants > (method) create > (params) default > (param) tool_resources > (schema) > (property) file_search > (property) vector_stores > (items) > (property) chunking_strategy > (variant) 1 > (property) type>)
[](<#(resource) beta.assistants > (method) create > (params) default > (param) tool_resources > (schema) > (property) file_search > (property) vector_stores > (items) > (property) chunking_strategy > (variant) 1>)
[](<#(resource) beta.assistants > (method) create > (params) default > (param) tool_resources > (schema) > (property) file_search > (property) vector_stores > (items) > (property) chunking_strategy>)
FileIDs []stringOptional
A list of [file](https://platform.openai.com/docs/api-reference/files) IDs to add to the vector store. For vector stores created before Nov 2025, there can be a maximum of 10,000 files in a vector store. For vector stores created starting in Nov 2025, the limit is 100,000,000 files.
[](<#(resource) beta.assistants > (method) create > (params) default > (param) tool_resources > (schema) > (property) file_search > (property) vector_stores > (items) > (property) file_ids>)
Metadata [Metadata](</api/reference/go/resources/$shared#(resource) $shared > (model) metadata > (schema)>)Optional
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (method) create > (params) default > (param) tool_resources > (schema) > (property) file_search > (property) vector_stores > (items) > (property) metadata>)
[](<#(resource) beta.assistants > (method) create > (params) default > (param) tool_resources > (schema) > (property) file_search > (property) vector_stores>)
[](<#(resource) beta.assistants > (method) create > (params) default > (param) tool_resources > (schema) > (property) file_search>)
[](<#(resource) beta.assistants > (method) create > (params) default > (param) tool_resources>)
Tools param.Field[[][AssistantToolUnion](</api/reference/go/resources/beta#(resource) beta.assistants > (model) assistant_tool > (schema)>)]Optional
A list of tool enabled on the assistant. There can be a maximum of 128 tools per assistant. Tools can be of types `code\_interpreter`, `file\_search`, or `function`.
type CodeInterpreterTool struct{…}
Type CodeInterpreter
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
type FileSearchTool struct{…}
Type FileSearch
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
FileSearch FileSearchToolFileSearchOptional
Overrides for the file search tool.
MaxNumResults int64Optional
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
RankingOptions FileSearchToolFileSearchRankingOptionsOptional
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
ScoreThreshold float64
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
Ranker stringOptional
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
const FileSearchToolFileSearchRankingOptionsRankerAuto FileSearchToolFileSearchRankingOptionsRanker = "auto"
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
const FileSearchToolFileSearchRankingOptionsRankerDefault2024\_08\_21 FileSearchToolFileSearchRankingOptionsRanker = "default\_2024\_08\_21"
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema)>)
type FunctionTool struct{…}
Function [FunctionDefinition](</api/reference/go/resources/$shared#(resource) $shared > (model) function_definition > (schema)>)
Name string
The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) name>)
Description stringOptional
A description of what the function does, used by the model to choose when and how to call the function.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) description>)
Parameters [FunctionParameters](</api/reference/go/resources/$shared#(resource) $shared > (model) function_parameters > (schema)>)Optional
The parameters the functions accepts, described as a JSON Schema object. See the [guide](https://platform.openai.com/docs/guides/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format.
Omitting `parameters` defines a function with an empty parameter list.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) parameters>)
Strict boolOptional
Whether to enable strict schema adherence when generating the function call. If set to true, the model will follow the exact schema defined in the `parameters` field. Only a subset of JSON Schema is supported when `strict` is `true`. Learn more about Structured Outputs in the [function calling guide](https://platform.openai.com/docs/guides/function-calling).
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) strict>)
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
Type Function
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.assistants > (method) create > (params) default > (param) tools>)
TopP param.Field[float64]Optional
An alternative to sampling with temperature, called nucleus sampling, where the model considers the results of the tokens with top\_p probability mass. So 0.1 means only the tokens comprising the top 10% probability mass are considered.
We generally recommend altering this or temperature but not both.
minimum0
maximum1
[](<#(resource) beta.assistants > (method) create > (params) default > (param) top_p>)
[](<#(resource) beta.assistants > (method) create > (params) default>)
##### ReturnsExpand Collapse
type Assistant struct{…}
Represents an `assistant` that can call the model and use tools.
ID string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) id>)
CreatedAt int64
The Unix timestamp (in seconds) for when the assistant was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) created_at>)
Description string
The description of the assistant. The maximum length is 512 characters.
maxLength512
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) description>)
Instructions string
The system instructions that the assistant uses. The maximum length is 256,000 characters.
maxLength256000
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) instructions>)
Metadata [Metadata](</api/reference/go/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) metadata>)
Model string
ID of the model to use. You can use the [List models](https://platform.openai.com/docs/api-reference/models/list) API to see all of your available models, or see our [Model overview](https://platform.openai.com/docs/models) for descriptions of them.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) model>)
Name string
The name of the assistant. The maximum length is 256 characters.
maxLength256
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) name>)
Object Assistant
The object type, which is always `assistant`.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) object>)
Tools [][AssistantToolUnion](</api/reference/go/resources/beta#(resource) beta.assistants > (model) assistant_tool > (schema)>)
A list of tool enabled on the assistant. There can be a maximum of 128 tools per assistant. Tools can be of types `code\_interpreter`, `file\_search`, or `function`.
One of the following:
type CodeInterpreterTool struct{…}
Type CodeInterpreter
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
type FileSearchTool struct{…}
Type FileSearch
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
FileSearch FileSearchToolFileSearchOptional
Overrides for the file search tool.
MaxNumResults int64Optional
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
RankingOptions FileSearchToolFileSearchRankingOptionsOptional
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
ScoreThreshold float64
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
Ranker stringOptional
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
const FileSearchToolFileSearchRankingOptionsRankerAuto FileSearchToolFileSearchRankingOptionsRanker = "auto"
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
const FileSearchToolFileSearchRankingOptionsRankerDefault2024\_08\_21 FileSearchToolFileSearchRankingOptionsRanker = "default\_2024\_08\_21"
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema)>)
type FunctionTool struct{…}
Function [FunctionDefinition](</api/reference/go/resources/$shared#(resource) $shared > (model) function_definition > (schema)>)
Name string
The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) name>)
Description stringOptional
A description of what the function does, used by the model to choose when and how to call the function.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) description>)
Parameters [FunctionParameters](</api/reference/go/resources/$shared#(resource) $shared > (model) function_parameters > (schema)>)Optional
The parameters the functions accepts, described as a JSON Schema object. See the [guide](https://platform.openai.com/docs/guides/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format.
Omitting `parameters` defines a function with an empty parameter list.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) parameters>)
Strict boolOptional
Whether to enable strict schema adherence when generating the function call. If set to true, the model will follow the exact schema defined in the `parameters` field. Only a subset of JSON Schema is supported when `strict` is `true`. Learn more about Structured Outputs in the [function calling guide](https://platform.openai.com/docs/guides/function-calling).
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) strict>)
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
Type Function
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tools>)
ResponseFormat [AssistantResponseFormatOptionUnion](</api/reference/go/resources/beta#(resource) beta.threads > (model) assistant_response_format_option > (schema)>)Optional
Specifies the format that the model must output. Compatible with [GPT-4o](https://platform.openai.com/docs/models#gpt-4o), [GPT-4 Turbo](https://platform.openai.com/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly “stuck” request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
One of the following:
type Auto string
`auto` is the default value
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format + (resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0>)
type ResponseFormatText struct{…}
Default response format. Used to generate text responses.
Type Text
The type of response format being defined. Always `text`.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema)>)
type ResponseFormatJSONObject struct{…}
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
Type JSONObject
The type of response format being defined. Always `json\_object`.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema)>)
type ResponseFormatJSONSchema struct{…}
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](https://platform.openai.com/docs/guides/structured-outputs).
JSONSchema ResponseFormatJSONSchemaJSONSchema
Structured Outputs configuration options, including a JSON Schema.
Name string
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
Description stringOptional
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
Schema map[string, any]Optional
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
Strict boolOptional
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
Type JSONSchema
The type of response format being defined. Always `json\_schema`.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema)>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) response_format>)
Temperature float64Optional
What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
minimum0
maximum2
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) temperature>)
ToolResources AssistantToolResourcesOptional
A set of resources that are used by the assistant’s tools. The resources are specific to the type of tool. For example, the `code\_interpreter` tool requires a list of file IDs, while the `file\_search` tool requires a list of vector store IDs.
CodeInterpreter AssistantToolResourcesCodeInterpreterOptional
FileIDs []stringOptional
A list of [file](https://platform.openai.com/docs/api-reference/files) IDs made available to the `code\_interpreter“ tool. There can be a maximum of 20 files associated with the tool.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tool_resources > (property) code_interpreter > (property) file_ids>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tool_resources > (property) code_interpreter>)
FileSearch AssistantToolResourcesFileSearchOptional
VectorStoreIDs []stringOptional
The ID of the [vector store](https://platform.openai.com/docs/api-reference/vector-stores/object) attached to this assistant. There can be a maximum of 1 vector store attached to the assistant.
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tool_resources > (property) file_search > (property) vector_store_ids>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tool_resources > (property) file_search>)
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) tool_resources>)
TopP float64Optional
An alternative to sampling with temperature, called nucleus sampling, where the model considers the results of the tokens with top\_p probability mass. So 0.1 means only the tokens comprising the top 10% probability mass are considered.
We generally recommend altering this or temperature but not both.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant > (schema) > (property) top_p>)
[](<#(resource) beta.assistants > (model) assistant > (schema)>)
### Create assistant
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
assistant, err := client.Beta.Assistants.New(context.TODO(), openai.BetaAssistantNewParams{
Model: shared.ChatModelGPT4o,
})
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", assistant.ID)
}
`
```
200 example
```
`{
"id": "id",
"created\_at": 0,
"description": "description",
"instructions": "instructions",
"metadata": {
"foo": "string"
},
"model": "model",
"name": "name",
"object": "assistant",
"tools": [
{
"type": "code\_interpreter"
}
],
"response\_format": "auto",
"temperature": 1,
"tool\_resources": {
"code\_interpreter": {
"file\_ids": [
"string"
]
},
"file\_search": {
"vector\_store\_ids": [
"string"
]
}
},
"top\_p": 1
}`
```
##### Returns Examples
200 example
```
`{
"id": "id",
"created\_at": 0,
"description": "description",
"instructions": "instructions",
"metadata": {
"foo": "string"
},
"model": "model",
"name": "name",
"object": "assistant",
"tools": [
{
"type": "code\_interpreter"
}
],
"response\_format": "auto",
"temperature": 1,
"tool\_resources": {
"code\_interpreter": {
"file\_ids": [
"string"
]
},
"file\_search": {
"vector\_store\_ids": [
"string"
]
}
},
"top\_p": 1
}`
```