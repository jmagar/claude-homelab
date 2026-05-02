Compact a response | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Responses](/api/reference/resources/responses)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Compact a response
POST/responses/compact
Compact a conversation. Returns a compacted response object.
Learn when and how to compact long-running conversations in the [conversation state guide](/docs/guides/conversation-state#managing-the-context-window). For ZDR-compatible compaction details, see [Compaction (advanced)](/docs/guides/conversation-state#compaction-advanced).
##### Body ParametersJSONExpand Collapse
model: "gpt-5.4" or "gpt-5.4-mini" or "gpt-5.4-nano" or 89 more or string
Model ID used to generate the response, like `gpt-5` or `o3`. OpenAI offers a wide range of models with different capabilities, performance characteristics, and price points. Refer to the [model guide](/docs/models) to browse and compare available models.
One of the following:
"gpt-5.4" or "gpt-5.4-mini" or "gpt-5.4-nano" or 89 more
Model ID used to generate the response, like `gpt-5` or `o3`. OpenAI offers a wide range of models with different capabilities, performance characteristics, and price points. Refer to the [model guide](/docs/models) to browse and compare available models.
One of the following:
"gpt-5.4"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 0>)
"gpt-5.4-mini"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 1>)
"gpt-5.4-nano"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 2>)
"gpt-5.4-mini-2026-03-17"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 3>)
"gpt-5.4-nano-2026-03-17"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 4>)
"gpt-5.3-chat-latest"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 5>)
"gpt-5.2"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 6>)
"gpt-5.2-2025-12-11"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 7>)
"gpt-5.2-chat-latest"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 8>)
"gpt-5.2-pro"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 9>)
"gpt-5.2-pro-2025-12-11"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 10>)
"gpt-5.1"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 11>)
"gpt-5.1-2025-11-13"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 12>)
"gpt-5.1-codex"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 13>)
"gpt-5.1-mini"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 14>)
"gpt-5.1-chat-latest"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 15>)
"gpt-5"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 16>)
"gpt-5-mini"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 17>)
"gpt-5-nano"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 18>)
"gpt-5-2025-08-07"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 19>)
"gpt-5-mini-2025-08-07"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 20>)
"gpt-5-nano-2025-08-07"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 21>)
"gpt-5-chat-latest"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 22>)
"gpt-4.1"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 23>)
"gpt-4.1-mini"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 24>)
"gpt-4.1-nano"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 25>)
"gpt-4.1-2025-04-14"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 26>)
"gpt-4.1-mini-2025-04-14"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 27>)
"gpt-4.1-nano-2025-04-14"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 28>)
"o4-mini"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 29>)
"o4-mini-2025-04-16"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 30>)
"o3"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 31>)
"o3-2025-04-16"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 32>)
"o3-mini"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 33>)
"o3-mini-2025-01-31"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 34>)
"o1"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 35>)
"o1-2024-12-17"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 36>)
"o1-preview"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 37>)
"o1-preview-2024-09-12"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 38>)
"o1-mini"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 39>)
"o1-mini-2024-09-12"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 40>)
"gpt-4o"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 41>)
"gpt-4o-2024-11-20"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 42>)
"gpt-4o-2024-08-06"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 43>)
"gpt-4o-2024-05-13"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 44>)
"gpt-4o-audio-preview"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 45>)
"gpt-4o-audio-preview-2024-10-01"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 46>)
"gpt-4o-audio-preview-2024-12-17"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 47>)
"gpt-4o-audio-preview-2025-06-03"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 48>)
"gpt-4o-mini-audio-preview"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 49>)
"gpt-4o-mini-audio-preview-2024-12-17"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 50>)
"gpt-4o-search-preview"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 51>)
"gpt-4o-mini-search-preview"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 52>)
"gpt-4o-search-preview-2025-03-11"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 53>)
"gpt-4o-mini-search-preview-2025-03-11"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 54>)
"chatgpt-4o-latest"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 55>)
"codex-mini-latest"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 56>)
"gpt-4o-mini"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 57>)
"gpt-4o-mini-2024-07-18"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 58>)
"gpt-4-turbo"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 59>)
"gpt-4-turbo-2024-04-09"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 60>)
"gpt-4-0125-preview"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 61>)
"gpt-4-turbo-preview"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 62>)
"gpt-4-1106-preview"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 63>)
"gpt-4-vision-preview"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 64>)
"gpt-4"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 65>)
"gpt-4-0314"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 66>)
"gpt-4-0613"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 67>)
"gpt-4-32k"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 68>)
"gpt-4-32k-0314"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 69>)
"gpt-4-32k-0613"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 70>)
"gpt-3.5-turbo"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 71>)
"gpt-3.5-turbo-16k"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 72>)
"gpt-3.5-turbo-0301"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 73>)
"gpt-3.5-turbo-0613"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 74>)
"gpt-3.5-turbo-1106"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 75>)
"gpt-3.5-turbo-0125"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 76>)
"gpt-3.5-turbo-16k-0613"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 77>)
"o1-pro"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 78>)
"o1-pro-2025-03-19"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 79>)
"o3-pro"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 80>)
"o3-pro-2025-06-10"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 81>)
"o3-deep-research"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 82>)
"o3-deep-research-2025-06-26"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 83>)
"o4-mini-deep-research"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 84>)
"o4-mini-deep-research-2025-06-26"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 85>)
"computer-use-preview"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 86>)
"computer-use-preview-2025-03-11"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 87>)
"gpt-5-codex"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 88>)
"gpt-5-pro"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 89>)
"gpt-5-pro-2025-10-06"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 90>)
"gpt-5.1-codex-max"
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0 > (member) 91>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 0>)
string
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema) > (variant) 1>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) model > (schema)>)
input: optional string or array of [EasyInputMessage](</api/reference/resources/responses#(resource) responses > (model) easy_input_message > (schema)>) { content, role, phase, type } or object { content, role, status, type } or [ResponseOutputMessage](</api/reference/resources/responses#(resource) responses > (model) response_output_message > (schema)>) { id, content, role, 3 more } or 25 more
Text, image, or file inputs to the model, used to generate a response
One of the following:
string
A text input to the model, equivalent to a text input with the `user` role.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 0>)
array of [EasyInputMessage](</api/reference/resources/responses#(resource) responses > (model) easy_input_message > (schema)>) { content, role, phase, type } or object { content, role, status, type } or [ResponseOutputMessage](</api/reference/resources/responses#(resource) responses > (model) response_output_message > (schema)>) { id, content, role, 3 more } or 25 more
A list of one or many input items to the model, containing different content types.
One of the following:
EasyInputMessage object { content, role, phase, type }
A message input to the model with a role indicating instruction following
hierarchy. Instructions given with the `developer` or `system` role take
precedence over instructions given with the `user` role. Messages with the
`assistant` role are presumed to have been generated by the model in previous
interactions.
content: string or [ResponseInputMessageContentList](</api/reference/resources/responses#(resource) responses > (model) response_input_message_content_list > (schema)>) { , , }
Text, image, or audio input to the model, used to generate a response.
Can also contain previous assistant responses.
One of the following:
TextInput = string
A text input to the model.
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) content > (variant) 0>)
ResponseInputMessageContentList = array of [ResponseInputContent](</api/reference/resources/responses#(resource) responses > (model) response_input_content > (schema)>)
A list of one or many input items to the model, containing different content
types.
One of the following:
ResponseInputText object { text, type }
A text input to the model.
text: string
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
type: "input\_text"
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
ResponseInputImage object { detail, type, file\_id, image\_url }
An image input to the model. Learn about [image inputs](/docs/guides/vision).
detail: "low" or "high" or "auto" or "original"
The detail level of the image to be sent to the model. One of `high`, `low`, `auto`, or `original`. Defaults to `auto`.
One of the following:
"low"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 0>)
"high"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 1>)
"auto"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 2>)
"original"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 3>)
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail>)
type: "input\_image"
The type of the input item. Always `input\_image`.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) type>)
file\_id: optional string
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) file_id>)
image\_url: optional string
The URL of the image to be sent to the model. A fully qualified URL or base64 encoded image in a data URL.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) image_url>)
[](<#(resource) responses > (model) response_input_image > (schema)>)
ResponseInputFile object { type, detail, file\_data, 3 more }
A file input to the model.
type: "input\_file"
The type of the input item. Always `input\_file`.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) type>)
detail: optional "low" or "high"
The detail level of the file to be sent to the model. Use `low` for the default rendering behavior, or `high` to render the file at higher quality. Defaults to `low`.
One of the following:
"low"
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 0>)
"high"
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 1>)
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail>)
file\_data: optional string
The content of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_data>)
file\_id: optional string
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_id>)
file\_url: optional string
The URL of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_url>)
filename: optional string
The name of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) filename>)
[](<#(resource) responses > (model) response_input_file > (schema)>)
[](<#(resource) responses > (model) response_input_message_content_list > (schema)>)
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) content>)
role: "user" or "assistant" or "system" or "developer"
The role of the message input. One of `user`, `assistant`, `system`, or
`developer`.
One of the following:
"user"
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) role > (member) 0>)
"assistant"
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) role > (member) 1>)
"system"
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) role > (member) 2>)
"developer"
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) role > (member) 3>)
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) role>)
phase: optional "commentary" or "final\_answer"
Labels an `assistant` message as intermediate commentary (`commentary`) or the final answer (`final\_answer`).
For models like `gpt-5.3-codex` and beyond, when sending follow-up requests, preserve and resend
phase on all assistant messages — dropping it can degrade performance. Not used for user messages.
One of the following:
"commentary"
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) phase > (member) 0>)
"final\_answer"
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) phase > (member) 1>)
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) phase>)
type: optional "message"
The type of the message input. Always `message`.
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) type>)
[](<#(resource) responses > (model) easy_input_message > (schema)>)
Message object { content, role, status, type }
A message input to the model with a role indicating instruction following
hierarchy. Instructions given with the `developer` or `system` role take
precedence over instructions given with the `user` role.
content: [ResponseInputMessageContentList](</api/reference/resources/responses#(resource) responses > (model) response_input_message_content_list > (schema)>) { , , }
A list of one or many input items to the model, containing different content
types.
One of the following:
ResponseInputText object { text, type }
A text input to the model.
text: string
The text input to the model.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 1 > (property) content + (resource) responses > (model) response_input_text > (schema) > (property) text>)
type: "input\_text"
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 1 > (property) content + (resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 1 > (property) content + (resource) responses > (model) response_input_text > (schema)>)
ResponseInputImage object { detail, type, file\_id, image\_url }
An image input to the model. Learn about [image inputs](/docs/guides/vision).
detail: "low" or "high" or "auto" or "original"
The detail level of the image to be sent to the model. One of `high`, `low`, `auto`, or `original`. Defaults to `auto`.
One of the following:
"low"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 1 > (property) content + (resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 0>)
"high"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 1 > (property) content + (resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 1>)
"auto"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 1 > (property) content + (resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 2>)
"original"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 1 > (property) content + (resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 3>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 1 > (property) content + (resource) responses > (model) response_input_image > (schema) > (property) detail>)
type: "input\_image"
The type of the input item. Always `input\_image`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 1 > (property) content + (resource) responses > (model) response_input_image > (schema) > (property) type>)
file\_id: optional string
The ID of the file to be sent to the model.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 1 > (property) content + (resource) responses > (model) response_input_image > (schema) > (property) file_id>)
image\_url: optional string
The URL of the image to be sent to the model. A fully qualified URL or base64 encoded image in a data URL.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 1 > (property) content + (resource) responses > (model) response_input_image > (schema) > (property) image_url>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 1 > (property) content + (resource) responses > (model) response_input_image > (schema)>)
ResponseInputFile object { type, detail, file\_data, 3 more }
A file input to the model.
type: "input\_file"
The type of the input item. Always `input\_file`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 1 > (property) content + (resource) responses > (model) response_input_file > (schema) > (property) type>)
detail: optional "low" or "high"
The detail level of the file to be sent to the model. Use `low` for the default rendering behavior, or `high` to render the file at higher quality. Defaults to `low`.
One of the following:
"low"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 1 > (property) content + (resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 0>)
"high"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 1 > (property) content + (resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 1>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 1 > (property) content + (resource) responses > (model) response_input_file > (schema) > (property) detail>)
file\_data: optional string
The content of the file to be sent to the model.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 1 > (property) content + (resource) responses > (model) response_input_file > (schema) > (property) file_data>)
file\_id: optional string
The ID of the file to be sent to the model.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 1 > (property) content + (resource) responses > (model) response_input_file > (schema) > (property) file_id>)
file\_url: optional string
The URL of the file to be sent to the model.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 1 > (property) content + (resource) responses > (model) response_input_file > (schema) > (property) file_url>)
filename: optional string
The name of the file to be sent to the model.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 1 > (property) content + (resource) responses > (model) response_input_file > (schema) > (property) filename>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 1 > (property) content + (resource) responses > (model) response_input_file > (schema)>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 1 > (property) content>)
role: "user" or "system" or "developer"
The role of the message input. One of `user`, `system`, or `developer`.
One of the following:
"user"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 1 > (property) role > (member) 0>)
"system"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 1 > (property) role > (member) 1>)
"developer"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 1 > (property) role > (member) 2>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 1 > (property) role>)
status: optional "in\_progress" or "completed" or "incomplete"
The status of item. One of `in\_progress`, `completed`, or
`incomplete`. Populated when items are returned via API.
One of the following:
"in\_progress"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 1 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 1 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 1 > (property) status > (member) 2>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 1 > (property) status>)
type: optional "message"
The type of the message input. Always set to `message`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 1 > (property) type>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 1>)
ResponseOutputMessage object { id, content, role, 3 more }
An output message from the model.
id: string
The unique ID of the output message.
[](<#(resource) responses > (model) response_output_message > (schema) > (property) id>)
content: array of [ResponseOutputText](</api/reference/resources/responses#(resource) responses > (model) response_output_text > (schema)>) { annotations, logprobs, text, type } or [ResponseOutputRefusal](</api/reference/resources/responses#(resource) responses > (model) response_output_refusal > (schema)>) { refusal, type }
The content of the output message.
One of the following:
ResponseOutputText object { annotations, logprobs, text, type }
A text output from the model.
annotations: array of object { file\_id, filename, index, type } or object { end\_index, start\_index, title, 2 more } or object { container\_id, end\_index, file\_id, 3 more } or object { file\_id, index, type }
The annotations of the text output.
One of the following:
FileCitation object { file\_id, filename, index, type }
A citation to a file.
file\_id: string
The ID of the file.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) file_id>)
filename: string
The filename of the file cited.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) filename>)
index: number
The index of the file in the list of files.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) index>)
type: "file\_citation"
The type of the file citation. Always `file\_citation`.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) type>)
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 0>)
URLCitation object { end\_index, start\_index, title, 2 more }
A citation for a web resource used to generate a model response.
end\_index: number
The index of the last character of the URL citation in the message.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) end_index>)
start\_index: number
The index of the first character of the URL citation in the message.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) start_index>)
title: string
The title of the web resource.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) title>)
type: "url\_citation"
The type of the URL citation. Always `url\_citation`.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) type>)
url: string
The URL of the web resource.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) url>)
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 1>)
ContainerFileCitation object { container\_id, end\_index, file\_id, 3 more }
A citation for a container file used to generate a model response.
container\_id: string
The ID of the container file.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 2 > (property) container_id>)
end\_index: number
The index of the last character of the container file citation in the message.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 2 > (property) end_index>)
file\_id: string
The ID of the file.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 2 > (property) file_id>)
filename: string
The filename of the container file cited.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 2 > (property) filename>)
start\_index: number
The index of the first character of the container file citation in the message.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 2 > (property) start_index>)
type: "container\_file\_citation"
The type of the container file citation. Always `container\_file\_citation`.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 2 > (property) type>)
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 2>)
FilePath object { file\_id, index, type }
A path to a file.
file\_id: string
The ID of the file.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 3 > (property) file_id>)
index: number
The index of the file in the list of files.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 3 > (property) index>)
type: "file\_path"
The type of the file path. Always `file\_path`.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 3 > (property) type>)
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 3>)
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations>)
logprobs: array of object { token, bytes, logprob, top\_logprobs }
token: string
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) token>)
bytes: array of number
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) bytes>)
logprob: number
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) logprob>)
top\_logprobs: array of object { token, bytes, logprob }
token: string
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) top_logprobs > (items) > (property) token>)
bytes: array of number
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) top_logprobs > (items) > (property) bytes>)
logprob: number
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) top_logprobs > (items) > (property) logprob>)
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) top_logprobs>)
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs>)
text: string
The text output from the model.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) text>)
type: "output\_text"
The type of the output text. Always `output\_text`.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_output_text > (schema)>)
ResponseOutputRefusal object { refusal, type }
A refusal from the model.
refusal: string
The refusal explanation from the model.
[](<#(resource) responses > (model) response_output_refusal > (schema) > (property) refusal>)
type: "refusal"
The type of the refusal. Always `refusal`.
[](<#(resource) responses > (model) response_output_refusal > (schema) > (property) type>)
[](<#(resource) responses > (model) response_output_refusal > (schema)>)
[](<#(resource) responses > (model) response_output_message > (schema) > (property) content>)
role: "assistant"
The role of the output message. Always `assistant`.
[](<#(resource) responses > (model) response_output_message > (schema) > (property) role>)
status: "in\_progress" or "completed" or "incomplete"
The status of the message input. One of `in\_progress`, `completed`, or
`incomplete`. Populated when input items are returned via API.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_output_message > (schema) > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) response_output_message > (schema) > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) response_output_message > (schema) > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_output_message > (schema) > (property) status>)
type: "message"
The type of the output message. Always `message`.
[](<#(resource) responses > (model) response_output_message > (schema) > (property) type>)
phase: optional "commentary" or "final\_answer"
Labels an `assistant` message as intermediate commentary (`commentary`) or the final answer (`final\_answer`).
For models like `gpt-5.3-codex` and beyond, when sending follow-up requests, preserve and resend
phase on all assistant messages — dropping it can degrade performance. Not used for user messages.
One of the following:
"commentary"
[](<#(resource) responses > (model) response_output_message > (schema) > (property) phase > (member) 0>)
"final\_answer"
[](<#(resource) responses > (model) response_output_message > (schema) > (property) phase > (member) 1>)
[](<#(resource) responses > (model) response_output_message > (schema) > (property) phase>)
[](<#(resource) responses > (model) response_output_message > (schema)>)
FileSearchCall object { id, queries, status, 2 more }
The results of a file search tool call. See the
[file search guide](/docs/guides/tools-file-search) for more information.
id: string
The unique ID of the file search tool call.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 3 > (property) id>)
queries: array of string
The queries used to search for files.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 3 > (property) queries>)
status: "in\_progress" or "searching" or "completed" or 2 more
The status of the file search tool call. One of `in\_progress`,
`searching`, `incomplete` or `failed`,
One of the following:
"in\_progress"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 3 > (property) status > (member) 0>)
"searching"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 3 > (property) status > (member) 1>)
"completed"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 3 > (property) status > (member) 2>)
"incomplete"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 3 > (property) status > (member) 3>)
"failed"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 3 > (property) status > (member) 4>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 3 > (property) status>)
type: "file\_search\_call"
The type of the file search tool call. Always `file\_search\_call`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 3 > (property) type>)
results: optional array of object { attributes, file\_id, filename, 2 more }
The results of the file search tool call.
attributes: optional map[string or number or boolean]
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard. Keys are strings
with a maximum length of 64 characters. Values are strings with a maximum
length of 512 characters, booleans, or numbers.
One of the following:
string
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 3 > (property) results > (items) > (property) attributes > (items) > (variant) 0>)
number
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 3 > (property) results > (items) > (property) attributes > (items) > (variant) 1>)
boolean
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 3 > (property) results > (items) > (property) attributes > (items) > (variant) 2>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 3 > (property) results > (items) > (property) attributes>)
file\_id: optional string
The unique ID of the file.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 3 > (property) results > (items) > (property) file_id>)
filename: optional string
The name of the file.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 3 > (property) results > (items) > (property) filename>)
score: optional number
The relevance score of the file - a value between 0 and 1.
formatfloat
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 3 > (property) results > (items) > (property) score>)
text: optional string
The text that was retrieved from the file.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 3 > (property) results > (items) > (property) text>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 3 > (property) results>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 3>)
ComputerCall object { id, call\_id, pending\_safety\_checks, 4 more }
A tool call to a computer use tool. See the
[computer use guide](/docs/guides/tools-computer-use) for more information.
id: string
The unique ID of the computer call.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) id>)
call\_id: string
An identifier used when responding to the tool call with output.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) call_id>)
pending\_safety\_checks: array of object { id, code, message }
The pending safety checks for the computer call.
id: string
The ID of the pending safety check.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) pending_safety_checks > (items) > (property) id>)
code: optional string
The type of the pending safety check.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) pending_safety_checks > (items) > (property) code>)
message: optional string
Details about the pending safety check.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) pending_safety_checks > (items) > (property) message>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) pending_safety_checks>)
status: "in\_progress" or "completed" or "incomplete"
The status of the item. One of `in\_progress`, `completed`, or
`incomplete`. Populated when items are returned via API.
One of the following:
"in\_progress"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) status > (member) 2>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) status>)
type: "computer\_call"
The type of the computer call. Always `computer\_call`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) type>)
action: optional [ComputerAction](</api/reference/resources/responses#(resource) responses > (model) computer_action > (schema)>)
A click action.
One of the following:
Click object { button, type, x, 2 more }
A click action.
button: "left" or "right" or "wheel" or 2 more
Indicates which mouse button was pressed during the click. One of `left`, `right`, `wheel`, `back`, or `forward`.
One of the following:
"left"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) button > (member) 0>)
"right"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) button > (member) 1>)
"wheel"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) button > (member) 2>)
"back"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) button > (member) 3>)
"forward"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) button > (member) 4>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) button>)
type: "click"
Specifies the event type. For a click action, this property is always `click`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) type>)
x: number
The x-coordinate where the click occurred.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) x>)
y: number
The y-coordinate where the click occurred.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) y>)
keys: optional array of string
The keys being held while clicking.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) keys>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 0>)
DoubleClick object { keys, type, x, y }
A double click action.
keys: array of string
The keys being held while double-clicking.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 1 > (property) keys>)
type: "double\_click"
Specifies the event type. For a double click action, this property is always set to `double\_click`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 1 > (property) type>)
x: number
The x-coordinate where the double click occurred.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 1 > (property) x>)
y: number
The y-coordinate where the double click occurred.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 1 > (property) y>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 1>)
Drag object { path, type, keys }
A drag action.
path: array of object { x, y }
An array of coordinates representing the path of the drag action. Coordinates will appear as an array of objects, eg
```
`[
{ x: 100, y: 200 },
{ x: 200, y: 300 }
]`
```
x: number
The x-coordinate.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 2 > (property) path > (items) > (property) x>)
y: number
The y-coordinate.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 2 > (property) path > (items) > (property) y>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 2 > (property) path>)
type: "drag"
Specifies the event type. For a drag action, this property is always set to `drag`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 2 > (property) type>)
keys: optional array of string
The keys being held while dragging the mouse.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 2 > (property) keys>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 2>)
Keypress object { keys, type }
A collection of keypresses the model would like to perform.
keys: array of string
The combination of keys the model is requesting to be pressed. This is an array of strings, each representing a key.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 3 > (property) keys>)
type: "keypress"
Specifies the event type. For a keypress action, this property is always set to `keypress`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 3 > (property) type>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 3>)
Move object { type, x, y, keys }
A mouse move action.
type: "move"
Specifies the event type. For a move action, this property is always set to `move`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 4 > (property) type>)
x: number
The x-coordinate to move to.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 4 > (property) x>)
y: number
The y-coordinate to move to.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 4 > (property) y>)
keys: optional array of string
The keys being held while moving the mouse.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 4 > (property) keys>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 4>)
Screenshot object { type }
A screenshot action.
type: "screenshot"
Specifies the event type. For a screenshot action, this property is always set to `screenshot`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 5 > (property) type>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 5>)
Scroll object { scroll\_x, scroll\_y, type, 3 more }
A scroll action.
scroll\_x: number
The horizontal scroll distance.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 6 > (property) scroll_x>)
scroll\_y: number
The vertical scroll distance.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 6 > (property) scroll_y>)
type: "scroll"
Specifies the event type. For a scroll action, this property is always set to `scroll`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 6 > (property) type>)
x: number
The x-coordinate where the scroll occurred.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 6 > (property) x>)
y: number
The y-coordinate where the scroll occurred.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 6 > (property) y>)
keys: optional array of string
The keys being held while scrolling.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 6 > (property) keys>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 6>)
Type object { text, type }
An action to type in text.
text: string
The text to type.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 7 > (property) text>)
type: "type"
Specifies the event type. For a type action, this property is always set to `type`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 7 > (property) type>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 7>)
Wait object { type }
A wait action.
type: "wait"
Specifies the event type. For a wait action, this property is always set to `wait`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 8 > (property) type>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 8>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) action>)
actions: optional [ComputerActionList](</api/reference/resources/responses#(resource) responses > (model) computer_action_list > (schema)>) { Click, DoubleClick, Drag, 6 more }
Flattened batched actions for `computer\_use`. Each action includes an
`type` discriminator and action-specific fields.
One of the following:
Click object { button, type, x, 2 more }
A click action.
button: "left" or "right" or "wheel" or 2 more
Indicates which mouse button was pressed during the click. One of `left`, `right`, `wheel`, `back`, or `forward`.
One of the following:
"left"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) button > (member) 0>)
"right"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) button > (member) 1>)
"wheel"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) button > (member) 2>)
"back"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) button > (member) 3>)
"forward"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) button > (member) 4>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) button>)
type: "click"
Specifies the event type. For a click action, this property is always `click`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) type>)
x: number
The x-coordinate where the click occurred.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) x>)
y: number
The y-coordinate where the click occurred.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) y>)
keys: optional array of string
The keys being held while clicking.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) keys>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0>)
DoubleClick object { keys, type, x, y }
A double click action.
keys: array of string
The keys being held while double-clicking.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 1 > (property) keys>)
type: "double\_click"
Specifies the event type. For a double click action, this property is always set to `double\_click`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 1 > (property) type>)
x: number
The x-coordinate where the double click occurred.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 1 > (property) x>)
y: number
The y-coordinate where the double click occurred.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 1 > (property) y>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 1>)
Drag object { path, type, keys }
A drag action.
path: array of object { x, y }
An array of coordinates representing the path of the drag action. Coordinates will appear as an array of objects, eg
```
`[
{ x: 100, y: 200 },
{ x: 200, y: 300 }
]`
```
x: number
The x-coordinate.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 2 > (property) path > (items) > (property) x>)
y: number
The y-coordinate.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 2 > (property) path > (items) > (property) y>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 2 > (property) path>)
type: "drag"
Specifies the event type. For a drag action, this property is always set to `drag`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 2 > (property) type>)
keys: optional array of string
The keys being held while dragging the mouse.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 2 > (property) keys>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 2>)
Keypress object { keys, type }
A collection of keypresses the model would like to perform.
keys: array of string
The combination of keys the model is requesting to be pressed. This is an array of strings, each representing a key.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 3 > (property) keys>)
type: "keypress"
Specifies the event type. For a keypress action, this property is always set to `keypress`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 3 > (property) type>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 3>)
Move object { type, x, y, keys }
A mouse move action.
type: "move"
Specifies the event type. For a move action, this property is always set to `move`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 4 > (property) type>)
x: number
The x-coordinate to move to.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 4 > (property) x>)
y: number
The y-coordinate to move to.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 4 > (property) y>)
keys: optional array of string
The keys being held while moving the mouse.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 4 > (property) keys>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 4>)
Screenshot object { type }
A screenshot action.
type: "screenshot"
Specifies the event type. For a screenshot action, this property is always set to `screenshot`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 5 > (property) type>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 5>)
Scroll object { scroll\_x, scroll\_y, type, 3 more }
A scroll action.
scroll\_x: number
The horizontal scroll distance.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 6 > (property) scroll_x>)
scroll\_y: number
The vertical scroll distance.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 6 > (property) scroll_y>)
type: "scroll"
Specifies the event type. For a scroll action, this property is always set to `scroll`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 6 > (property) type>)
x: number
The x-coordinate where the scroll occurred.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 6 > (property) x>)
y: number
The y-coordinate where the scroll occurred.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 6 > (property) y>)
keys: optional array of string
The keys being held while scrolling.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 6 > (property) keys>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 6>)
Type object { text, type }
An action to type in text.
text: string
The text to type.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 7 > (property) text>)
type: "type"
Specifies the event type. For a type action, this property is always set to `type`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 7 > (property) type>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 7>)
Wait object { type }
A wait action.
type: "wait"
Specifies the event type. For a wait action, this property is always set to `wait`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 8 > (property) type>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 8>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4 > (property) actions>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 4>)
ComputerCallOutput object { call\_id, output, type, 3 more }
The output of a computer tool call.
call\_id: string
The ID of the computer tool call that produced the output.
maxLength64
minLength1
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 5 > (property) call_id>)
output: [ResponseComputerToolCallOutputScreenshot](</api/reference/resources/responses#(resource) responses > (model) response_computer_tool_call_output_screenshot > (schema)>) { type, file\_id, image\_url }
A computer screenshot image used with the computer use tool.
type: "computer\_screenshot"
Specifies the event type. For a computer screenshot, this property is
always set to `computer\_screenshot`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 5 > (property) output + (resource) responses > (model) response_computer_tool_call_output_screenshot > (schema) > (property) type>)
file\_id: optional string
The identifier of an uploaded file that contains the screenshot.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 5 > (property) output + (resource) responses > (model) response_computer_tool_call_output_screenshot > (schema) > (property) file_id>)
image\_url: optional string
The URL of the screenshot image.
formaturi
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 5 > (property) output + (resource) responses > (model) response_computer_tool_call_output_screenshot > (schema) > (property) image_url>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 5 > (property) output>)
type: "computer\_call\_output"
The type of the computer tool call output. Always `computer\_call\_output`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 5 > (property) type>)
id: optional string
The ID of the computer tool call output.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 5 > (property) id>)
acknowledged\_safety\_checks: optional array of object { id, code, message }
The safety checks reported by the API that have been acknowledged by the developer.
id: string
The ID of the pending safety check.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 5 > (property) acknowledged_safety_checks > (items) > (property) id>)
code: optional string
The type of the pending safety check.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 5 > (property) acknowledged_safety_checks > (items) > (property) code>)
message: optional string
Details about the pending safety check.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 5 > (property) acknowledged_safety_checks > (items) > (property) message>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 5 > (property) acknowledged_safety_checks>)
status: optional "in\_progress" or "completed" or "incomplete"
The status of the message input. One of `in\_progress`, `completed`, or `incomplete`. Populated when input items are returned via API.
One of the following:
"in\_progress"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 5 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 5 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 5 > (property) status > (member) 2>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 5 > (property) status>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 5>)
WebSearchCall object { id, action, status, type }
The results of a web search tool call. See the
[web search guide](/docs/guides/tools-web-search) for more information.
id: string
The unique ID of the web search tool call.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 6 > (property) id>)
action: object { query, type, queries, sources } or object { type, url } or object { pattern, type, url }
An object describing the specific action taken in this web search call.
Includes details on how the model used the web (search, open\_page, find\_in\_page).
One of the following:
Search object { query, type, queries, sources }
Action type “search” - Performs a web search query.
query: string
[DEPRECATED] The search query.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 6 > (property) action > (variant) 0 > (property) query>)
type: "search"
The action type.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 6 > (property) action > (variant) 0 > (property) type>)
queries: optional array of string
The search queries.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 6 > (property) action > (variant) 0 > (property) queries>)
sources: optional array of object { type, url }
The sources used in the search.
type: "url"
The type of source. Always `url`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 6 > (property) action > (variant) 0 > (property) sources > (items) > (property) type>)
url: string
The URL of the source.
formaturi
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 6 > (property) action > (variant) 0 > (property) sources > (items) > (property) url>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 6 > (property) action > (variant) 0 > (property) sources>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 6 > (property) action > (variant) 0>)
OpenPage object { type, url }
Action type “open\_page” - Opens a specific URL from search results.
type: "open\_page"
The action type.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 6 > (property) action > (variant) 1 > (property) type>)
url: optional string
The URL opened by the model.
formaturi
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 6 > (property) action > (variant) 1 > (property) url>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 6 > (property) action > (variant) 1>)
FindInPage object { pattern, type, url }
Action type “find\_in\_page”: Searches for a pattern within a loaded page.
pattern: string
The pattern or text to search for within the page.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 6 > (property) action > (variant) 2 > (property) pattern>)
type: "find\_in\_page"
The action type.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 6 > (property) action > (variant) 2 > (property) type>)
url: string
The URL of the page searched for the pattern.
formaturi
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 6 > (property) action > (variant) 2 > (property) url>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 6 > (property) action > (variant) 2>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 6 > (property) action>)
status: "in\_progress" or "searching" or "completed" or "failed"
The status of the web search tool call.
One of the following:
"in\_progress"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 6 > (property) status > (member) 0>)
"searching"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 6 > (property) status > (member) 1>)
"completed"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 6 > (property) status > (member) 2>)
"failed"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 6 > (property) status > (member) 3>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 6 > (property) status>)
type: "web\_search\_call"
The type of the web search tool call. Always `web\_search\_call`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 6 > (property) type>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 6>)
FunctionCall object { arguments, call\_id, name, 4 more }
A tool call to run a function. See the
[function calling guide](/docs/guides/function-calling) for more information.
arguments: string
A JSON string of the arguments to pass to the function.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 7 > (property) arguments>)
call\_id: string
The unique ID of the function tool call generated by the model.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 7 > (property) call_id>)
name: string
The name of the function to run.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 7 > (property) name>)
type: "function\_call"
The type of the function tool call. Always `function\_call`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 7 > (property) type>)
id: optional string
The unique ID of the function tool call.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 7 > (property) id>)
namespace: optional string
The namespace of the function to run.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 7 > (property) namespace>)
status: optional "in\_progress" or "completed" or "incomplete"
The status of the item. One of `in\_progress`, `completed`, or
`incomplete`. Populated when items are returned via API.
One of the following:
"in\_progress"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 7 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 7 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 7 > (property) status > (member) 2>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 7 > (property) status>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 7>)
FunctionCallOutput object { call\_id, output, type, 2 more }
The output of a function tool call.
call\_id: string
The unique ID of the function tool call generated by the model.
maxLength64
minLength1
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 8 > (property) call_id>)
output: string or array of [ResponseInputTextContent](</api/reference/resources/responses#(resource) responses > (model) response_input_text_content > (schema)>) { text, type } or [ResponseInputImageContent](</api/reference/resources/responses#(resource) responses > (model) response_input_image_content > (schema)>) { type, detail, file\_id, image\_url } or [ResponseInputFileContent](</api/reference/resources/responses#(resource) responses > (model) response_input_file_content > (schema)>) { type, detail, file\_data, 3 more }
Text, image, or file output of the function tool call.
One of the following:
string
A JSON string of the output of the function tool call.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 8 > (property) output > (variant) 0>)
array of [ResponseInputTextContent](</api/reference/resources/responses#(resource) responses > (model) response_input_text_content > (schema)>) { text, type } or [ResponseInputImageContent](</api/reference/resources/responses#(resource) responses > (model) response_input_image_content > (schema)>) { type, detail, file\_id, image\_url } or [ResponseInputFileContent](</api/reference/resources/responses#(resource) responses > (model) response_input_file_content > (schema)>) { type, detail, file\_data, 3 more }
An array of content outputs (text, image, file) for the function tool call.
One of the following:
ResponseInputTextContent object { text, type }
A text input to the model.
text: string
The text input to the model.
maxLength10485760
[](<#(resource) responses > (model) response_input_text_content > (schema) > (property) text>)
type: "input\_text"
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text_content > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text_content > (schema)>)
ResponseInputImageContent object { type, detail, file\_id, image\_url }
An image input to the model. Learn about [image inputs](/docs/guides/vision)
type: "input\_image"
The type of the input item. Always `input\_image`.
[](<#(resource) responses > (model) response_input_image_content > (schema) > (property) type>)
detail: optional "low" or "high" or "auto" or "original"
The detail level of the image to be sent to the model. One of `high`, `low`, `auto`, or `original`. Defaults to `auto`.
One of the following:
"low"
[](<#(resource) responses > (model) response_input_image_content > (schema) > (property) detail > (member) 0>)
"high"
[](<#(resource) responses > (model) response_input_image_content > (schema) > (property) detail > (member) 1>)
"auto"
[](<#(resource) responses > (model) response_input_image_content > (schema) > (property) detail > (member) 2>)
"original"
[](<#(resource) responses > (model) response_input_image_content > (schema) > (property) detail > (member) 3>)
[](<#(resource) responses > (model) response_input_image_content > (schema) > (property) detail>)
file\_id: optional string
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_image_content > (schema) > (property) file_id>)
image\_url: optional string
The URL of the image to be sent to the model. A fully qualified URL or base64 encoded image in a data URL.
maxLength20971520
[](<#(resource) responses > (model) response_input_image_content > (schema) > (property) image_url>)
[](<#(resource) responses > (model) response_input_image_content > (schema)>)
ResponseInputFileContent object { type, detail, file\_data, 3 more }
A file input to the model.
type: "input\_file"
The type of the input item. Always `input\_file`.
[](<#(resource) responses > (model) response_input_file_content > (schema) > (property) type>)
detail: optional "low" or "high"
The detail level of the file to be sent to the model. Use `low` for the default rendering behavior, or `high` to render the file at higher quality. Defaults to `low`.
One of the following:
"low"
[](<#(resource) responses > (model) response_input_file_content > (schema) > (property) detail > (member) 0>)
"high"
[](<#(resource) responses > (model) response_input_file_content > (schema) > (property) detail > (member) 1>)
[](<#(resource) responses > (model) response_input_file_content > (schema) > (property) detail>)
file\_data: optional string
The base64-encoded data of the file to be sent to the model.
maxLength73400320
[](<#(resource) responses > (model) response_input_file_content > (schema) > (property) file_data>)
file\_id: optional string
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file_content > (schema) > (property) file_id>)
file\_url: optional string
The URL of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file_content > (schema) > (property) file_url>)
filename: optional string
The name of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file_content > (schema) > (property) filename>)
[](<#(resource) responses > (model) response_input_file_content > (schema)>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 8 > (property) output > (variant) 1>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 8 > (property) output>)
type: "function\_call\_output"
The type of the function tool call output. Always `function\_call\_output`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 8 > (property) type>)
id: optional string
The unique ID of the function tool call output. Populated when this item is returned via API.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 8 > (property) id>)
status: optional "in\_progress" or "completed" or "incomplete"
The status of the item. One of `in\_progress`, `completed`, or `incomplete`. Populated when items are returned via API.
One of the following:
"in\_progress"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 8 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 8 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 8 > (property) status > (member) 2>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 8 > (property) status>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 8>)
ToolSearchCall object { arguments, type, id, 3 more }
arguments: unknown
The arguments supplied to the tool search call.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 9 > (property) arguments>)
type: "tool\_search\_call"
The item type. Always `tool\_search\_call`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 9 > (property) type>)
id: optional string
The unique ID of this tool search call.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 9 > (property) id>)
call\_id: optional string
The unique ID of the tool search call generated by the model.
maxLength64
minLength1
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 9 > (property) call_id>)
execution: optional "server" or "client"
Whether tool search was executed by the server or by the client.
One of the following:
"server"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 9 > (property) execution > (member) 0>)
"client"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 9 > (property) execution > (member) 1>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 9 > (property) execution>)
status: optional "in\_progress" or "completed" or "incomplete"
The status of the tool search call.
One of the following:
"in\_progress"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 9 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 9 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 9 > (property) status > (member) 2>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 9 > (property) status>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 9>)
ToolSearchOutput object { tools, type, id, 3 more }
tools: array of object { name, parameters, strict, 3 more } or object { type, vector\_store\_ids, filters, 2 more } or object { type } or 12 more
The loaded tool definitions returned by the tool search output.
One of the following:
Function object { name, parameters, strict, 3 more }
Defines a function in your own code the model can choose to call. Learn more about [function calling](https://platform.openai.com/docs/guides/function-calling).
name: string
The name of the function to call.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 0 > (property) name>)
parameters: map[unknown]
A JSON schema object describing the parameters of the function.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 0 > (property) parameters>)
strict: boolean
Whether to enforce strict parameter validation. Default `true`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 0 > (property) strict>)
type: "function"
The type of the function tool. Always `function`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 0 > (property) type>)
defer\_loading: optional boolean
Whether this function is deferred and loaded via tool search.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 0 > (property) defer_loading>)
description: optional string
A description of the function. Used by the model to determine whether or not to call the function.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 0 > (property) description>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 0>)
FileSearch object { type, vector\_store\_ids, filters, 2 more }
A tool that searches for relevant content from uploaded files. Learn more about the [file search tool](https://platform.openai.com/docs/guides/tools-file-search).
type: "file\_search"
The type of the file search tool. Always `file\_search`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 1 > (property) type>)
vector\_store\_ids: array of string
The IDs of the vector stores to search.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 1 > (property) vector_store_ids>)
filters: optional [ComparisonFilter](</api/reference/resources/$shared#(resource) $shared > (model) comparison_filter > (schema)>) { key, type, value } or [CompoundFilter](</api/reference/resources/$shared#(resource) $shared > (model) compound_filter > (schema)>) { filters, type }
A filter to apply.
One of the following:
ComparisonFilter object { key, type, value }
A filter used to compare a specified attribute key to a given value using a defined comparison operation.
key: string
The key to compare against the value.
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) key>)
type: "eq" or "ne" or "gt" or 5 more
Specifies the comparison operator: `eq`, `ne`, `gt`, `gte`, `lt`, `lte`, `in`, `nin`.
* `eq`: equals
* `ne`: not equal
* `gt`: greater than
* `gte`: greater than or equal
* `lt`: less than
* `lte`: less than or equal
* `in`: in
* `nin`: not in
One of the following:
"eq"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 0>)
"ne"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 1>)
"gt"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 2>)
"gte"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 3>)
"lt"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 4>)
"lte"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 5>)
"in"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 6>)
"nin"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 7>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type>)
value: string or number or boolean or array of string or number
The value to compare against the attribute key; supports string, number, or boolean types.
One of the following:
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 0>)
number
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 1>)
boolean
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 2>)
array of string or number
One of the following:
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 0>)
number
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 1>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value>)
[](<#(resource) $shared > (model) comparison_filter > (schema)>)
CompoundFilter object { filters, type }
Combine multiple filters using `and` or `or`.
filters: array of [ComparisonFilter](</api/reference/resources/$shared#(resource) $shared > (model) comparison_filter > (schema)>) { key, type, value } or unknown
Array of filters to combine. Items can be `ComparisonFilter` or `CompoundFilter`.
One of the following:
ComparisonFilter object { key, type, value }
A filter used to compare a specified attribute key to a given value using a defined comparison operation.
key: string
The key to compare against the value.
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) key>)
type: "eq" or "ne" or "gt" or 5 more
Specifies the comparison operator: `eq`, `ne`, `gt`, `gte`, `lt`, `lte`, `in`, `nin`.
* `eq`: equals
* `ne`: not equal
* `gt`: greater than
* `gte`: greater than or equal
* `lt`: less than
* `lte`: less than or equal
* `in`: in
* `nin`: not in
One of the following:
"eq"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 0>)
"ne"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 1>)
"gt"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 2>)
"gte"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 3>)
"lt"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 4>)
"lte"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 5>)
"in"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 6>)
"nin"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 7>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type>)
value: string or number or boolean or array of string or number
The value to compare against the attribute key; supports string, number, or boolean types.
One of the following:
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 0>)
number
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 1>)
boolean
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 2>)
array of string or number
One of the following:
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 0>)
number
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 1>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value>)
[](<#(resource) $shared > (model) comparison_filter > (schema)>)
unknown
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) filters > (items) > (variant) 1>)
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) filters>)
type: "and" or "or"
Type of operation: `and` or `or`.
One of the following:
"and"
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type > (member) 0>)
"or"
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type > (member) 1>)
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type>)
[](<#(resource) $shared > (model) compound_filter > (schema)>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 1 > (property) filters>)
max\_num\_results: optional number
The maximum number of results to return. This number should be between 1 and 50 inclusive.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 1 > (property) max_num_results>)
ranking\_options: optional object { hybrid\_search, ranker, score\_threshold }
Ranking options for search.
hybrid\_search: optional object { embedding\_weight, text\_weight }
Weights that control how reciprocal rank fusion balances semantic embedding matches versus sparse keyword matches when hybrid search is enabled.
embedding\_weight: number
The weight of the embedding in the reciprocal ranking fusion.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 1 > (property) ranking_options > (property) hybrid_search > (property) embedding_weight>)
text\_weight: number
The weight of the text in the reciprocal ranking fusion.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 1 > (property) ranking_options > (property) hybrid_search > (property) text_weight>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 1 > (property) ranking_options > (property) hybrid_search>)
ranker: optional "auto" or "default-2024-11-15"
The ranker to use for the file search.
One of the following:
"auto"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 1 > (property) ranking_options > (property) ranker > (member) 0>)
"default-2024-11-15"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 1 > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 1 > (property) ranking_options > (property) ranker>)
score\_threshold: optional number
The score threshold for the file search, a number between 0 and 1. Numbers closer to 1 will attempt to return only the most relevant results, but may return fewer results.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 1 > (property) ranking_options > (property) score_threshold>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 1 > (property) ranking_options>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 1>)
Computer object { type }
A tool that controls a virtual computer. Learn more about the [computer tool](https://platform.openai.com/docs/guides/tools-computer-use).
type: "computer"
The type of the computer tool. Always `computer`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 2 > (property) type>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 2>)
ComputerUsePreview object { display\_height, display\_width, environment, type }
A tool that controls a virtual computer. Learn more about the [computer tool](https://platform.openai.com/docs/guides/tools-computer-use).
display\_height: number
The height of the computer display.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 3 > (property) display_height>)
display\_width: number
The width of the computer display.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 3 > (property) display_width>)
environment: "windows" or "mac" or "linux" or 2 more
The type of computer environment to control.
One of the following:
"windows"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 3 > (property) environment > (member) 0>)
"mac"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 3 > (property) environment > (member) 1>)
"linux"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 3 > (property) environment > (member) 2>)
"ubuntu"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 3 > (property) environment > (member) 3>)
"browser"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 3 > (property) environment > (member) 4>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 3 > (property) environment>)
type: "computer\_use\_preview"
The type of the computer use tool. Always `computer\_use\_preview`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 3 > (property) type>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 3>)
WebSearch object { type, filters, search\_context\_size, user\_location }
Search the Internet for sources related to the prompt. Learn more about the
[web search tool](/docs/guides/tools-web-search).
type: "web\_search" or "web\_search\_2025\_08\_26"
The type of the web search tool. One of `web\_search` or `web\_search\_2025\_08\_26`.
One of the following:
"web\_search"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 4 > (property) type > (member) 0>)
"web\_search\_2025\_08\_26"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 4 > (property) type > (member) 1>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 4 > (property) type>)
filters: optional object { allowed\_domains }
Filters for the search.
allowed\_domains: optional array of string
Allowed domains for the search. If not provided, all domains are allowed.
Subdomains of the provided domains are allowed as well.
Example: `["pubmed.ncbi.nlm.nih.gov"]`
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 4 > (property) filters > (property) allowed_domains>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 4 > (property) filters>)
search\_context\_size: optional "low" or "medium" or "high"
High level guidance for the amount of context window space to use for the search. One of `low`, `medium`, or `high`. `medium` is the default.
One of the following:
"low"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 4 > (property) search_context_size > (member) 0>)
"medium"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 4 > (property) search_context_size > (member) 1>)
"high"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 4 > (property) search_context_size > (member) 2>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 4 > (property) search_context_size>)
user\_location: optional object { city, country, region, 2 more }
The approximate location of the user.
city: optional string
Free text input for the city of the user, e.g. `San Francisco`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 4 > (property) user_location > (property) city>)
country: optional string
The two-letter [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1) of the user, e.g. `US`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 4 > (property) user_location > (property) country>)
region: optional string
Free text input for the region of the user, e.g. `California`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 4 > (property) user_location > (property) region>)
timezone: optional string
The [IANA timezone](https://timeapi.io/documentation/iana-timezones) of the user, e.g. `America/Los\_Angeles`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 4 > (property) user_location > (property) timezone>)
type: optional "approximate"
The type of location approximation. Always `approximate`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 4 > (property) user_location > (property) type>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 4 > (property) user_location>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 4>)
Mcp object { server\_label, type, allowed\_tools, 7 more }
Give the model access to additional tools via remote Model Context Protocol
(MCP) servers. [Learn more about MCP](/docs/guides/tools-remote-mcp).
server\_label: string
A label for this MCP server, used to identify it in tool calls.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 5 > (property) server_label>)
type: "mcp"
The type of the MCP tool. Always `mcp`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 5 > (property) type>)
allowed\_tools: optional array of string or object { read\_only, tool\_names }
List of allowed tool names or a filter object.
One of the following:
McpAllowedTools = array of string
A string array of allowed tool names
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 5 > (property) allowed_tools > (variant) 0>)
McpToolFilter object { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only: optional boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 5 > (property) allowed_tools > (variant) 1 > (property) read_only>)
tool\_names: optional array of string
List of allowed tool names.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 5 > (property) allowed_tools > (variant) 1 > (property) tool_names>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 5 > (property) allowed_tools > (variant) 1>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 5 > (property) allowed_tools>)
authorization: optional string
An OAuth access token that can be used with a remote MCP server, either
with a custom MCP server URL or a service connector. Your application
must handle the OAuth authorization flow and provide the token here.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 5 > (property) authorization>)
connector\_id: optional "connector\_dropbox" or "connector\_gmail" or "connector\_googlecalendar" or 5 more
Identifier for service connectors, like those available in ChatGPT. One of
`server\_url` or `connector\_id` must be provided. Learn more about service
connectors [here](/docs/guides/tools-remote-mcp#connectors).
Currently supported `connector\_id` values are:
* Dropbox: `connector\_dropbox`
* Gmail: `connector\_gmail`
* Google Calendar: `connector\_googlecalendar`
* Google Drive: `connector\_googledrive`
* Microsoft Teams: `connector\_microsoftteams`
* Outlook Calendar: `connector\_outlookcalendar`
* Outlook Email: `connector\_outlookemail`
* SharePoint: `connector\_sharepoint`
One of the following:
"connector\_dropbox"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 0>)
"connector\_gmail"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 1>)
"connector\_googlecalendar"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 2>)
"connector\_googledrive"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 3>)
"connector\_microsoftteams"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 4>)
"connector\_outlookcalendar"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 5>)
"connector\_outlookemail"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 6>)
"connector\_sharepoint"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 7>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 5 > (property) connector_id>)
defer\_loading: optional boolean
Whether this MCP tool is deferred and discovered via tool search.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 5 > (property) defer_loading>)
headers: optional map[string]
Optional HTTP headers to send to the MCP server. Use for authentication
or other purposes.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 5 > (property) headers>)
require\_approval: optional object { always, never } or "always" or "never"
Specify which of the MCP server’s tools require approval.
One of the following:
McpToolApprovalFilter object { always, never }
Specify which of the MCP server’s tools require approval. Can be
`always`, `never`, or a filter object associated with tools
that require approval.
always: optional object { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only: optional boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 0 > (property) always > (property) read_only>)
tool\_names: optional array of string
List of allowed tool names.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 0 > (property) always > (property) tool_names>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 0 > (property) always>)
never: optional object { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only: optional boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 0 > (property) never > (property) read_only>)
tool\_names: optional array of string
List of allowed tool names.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 0 > (property) never > (property) tool_names>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 0 > (property) never>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 0>)
McpToolApprovalSetting = "always" or "never"
Specify a single approval policy for all tools. One of `always` or
`never`. When set to `always`, all tools will require approval. When
set to `never`, all tools will not require approval.
One of the following:
"always"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 1 > (member) 0>)
"never"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 1 > (member) 1>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 1>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 5 > (property) require_approval>)
server\_description: optional string
Optional description of the MCP server, used to provide more context.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 5 > (property) server_description>)
server\_url: optional string
The URL for the MCP server. One of `server\_url` or `connector\_id` must be
provided.
formaturi
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 5 > (property) server_url>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 5>)
CodeInterpreter object { container, type }
A tool that runs Python code to help generate a response to a prompt.
container: string or object { type, file\_ids, memory\_limit, network\_policy }
The code interpreter container. Can be a container ID or an object that
specifies uploaded file IDs to make available to your code, along with an
optional `memory\_limit` setting.
One of the following:
string
The container ID.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 6 > (property) container > (variant) 0>)
CodeInterpreterToolAuto object { type, file\_ids, memory\_limit, network\_policy }
Configuration for a code interpreter container. Optionally specify the IDs of the files to run the code on.
type: "auto"
Always `auto`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) type>)
file\_ids: optional array of string
An optional list of uploaded files to make available to your code.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) file_ids>)
memory\_limit: optional "1g" or "4g" or "16g" or "64g"
The memory limit for the code interpreter container.
One of the following:
"1g"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 0>)
"4g"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 1>)
"16g"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 2>)
"64g"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 3>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit>)
network\_policy: optional [ContainerNetworkPolicyDisabled](</api/reference/resources/responses#(resource) responses > (model) container_network_policy_disabled > (schema)>) { type } or [ContainerNetworkPolicyAllowlist](</api/reference/resources/responses#(resource) responses > (model) container_network_policy_allowlist > (schema)>) { allowed\_domains, type, domain\_secrets }
Network access policy for the container.
One of the following:
ContainerNetworkPolicyDisabled object { type }
type: "disabled"
Disable outbound network access. Always `disabled`.
[](<#(resource) responses > (model) container_network_policy_disabled > (schema) > (property) type>)
[](<#(resource) responses > (model) container_network_policy_disabled > (schema)>)
ContainerNetworkPolicyAllowlist object { allowed\_domains, type, domain\_secrets }
allowed\_domains: array of string
A list of allowed domains when type is `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) allowed_domains>)
type: "allowlist"
Allow outbound network access only to specified domains. Always `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) type>)
domain\_secrets: optional array of [ContainerNetworkPolicyDomainSecret](</api/reference/resources/responses#(resource) responses > (model) container_network_policy_domain_secret > (schema)>) { domain, name, value }
Optional domain-scoped secrets for allowlisted domains.
domain: string
The domain associated with the secret.
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) domain>)
name: string
The name of the secret to inject for the domain.
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) name>)
value: string
The secret value to inject for the domain.
maxLength10485760
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) value>)
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) domain_secrets>)
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema)>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) network_policy>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 6 > (property) container>)
type: "code\_interpreter"
The type of the code interpreter tool. Always `code\_interpreter`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 6 > (property) type>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 6>)
ImageGeneration object { type, action, background, 9 more }
A tool that generates images using the GPT image models.
type: "image\_generation"
The type of the image generation tool. Always `image\_generation`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 7 > (property) type>)
action: optional "generate" or "edit" or "auto"
Whether to generate a new image or edit an existing image. Default: `auto`.
One of the following:
"generate"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 7 > (property) action > (member) 0>)
"edit"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 7 > (property) action > (member) 1>)
"auto"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 7 > (property) action > (member) 2>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 7 > (property) action>)
background: optional "transparent" or "opaque" or "auto"
Background type for the generated image. One of `transparent`,
`opaque`, or `auto`. Default: `auto`.
One of the following:
"transparent"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 7 > (property) background > (member) 0>)
"opaque"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 7 > (property) background > (member) 1>)
"auto"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 7 > (property) background > (member) 2>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 7 > (property) background>)
input\_fidelity: optional "high" or "low"
Control how much effort the model will exert to match the style and features, especially facial features, of input images. This parameter is only supported for `gpt-image-1` and `gpt-image-1.5` and later models, unsupported for `gpt-image-1-mini`. Supports `high` and `low`. Defaults to `low`.
One of the following:
"high"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 7 > (property) input_fidelity > (member) 0>)
"low"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 7 > (property) input_fidelity > (member) 1>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 7 > (property) input_fidelity>)
input\_image\_mask: optional object { file\_id, image\_url }
Optional mask for inpainting. Contains `image\_url`
(string, optional) and `file\_id` (string, optional).
file\_id: optional string
File ID for the mask image.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 7 > (property) input_image_mask > (property) file_id>)
image\_url: optional string
Base64-encoded mask image.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 7 > (property) input_image_mask > (property) image_url>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 7 > (property) input_image_mask>)
model: optional string or "gpt-image-1" or "gpt-image-1-mini" or "gpt-image-1.5"
The image generation model to use. Default: `gpt-image-1`.
One of the following:
string
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 7 > (property) model > (variant) 0>)
"gpt-image-1" or "gpt-image-1-mini" or "gpt-image-1.5"
The image generation model to use. Default: `gpt-image-1`.
One of the following:
"gpt-image-1"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 7 > (property) model > (variant) 1 > (member) 0>)
"gpt-image-1-mini"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 7 > (property) model > (variant) 1 > (member) 1>)
"gpt-image-1.5"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 7 > (property) model > (variant) 1 > (member) 2>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 7 > (property) model > (variant) 1>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 7 > (property) model>)
moderation: optional "auto" or "low"
Moderation level for the generated image. Default: `auto`.
One of the following:
"auto"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 7 > (property) moderation > (member) 0>)
"low"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 7 > (property) moderation > (member) 1>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 7 > (property) moderation>)
output\_compression: optional number
Compression level for the output image. Default: 100.
minimum0
maximum100
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 7 > (property) output_compression>)
output\_format: optional "png" or "webp" or "jpeg"
The output format of the generated image. One of `png`, `webp`, or
`jpeg`. Default: `png`.
One of the following:
"png"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 7 > (property) output_format > (member) 0>)
"webp"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 7 > (property) output_format > (member) 1>)
"jpeg"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 7 > (property) output_format > (member) 2>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 7 > (property) output_format>)
partial\_images: optional number
Number of partial images to generate in streaming mode, from 0 (default value) to 3.
minimum0
maximum3
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 7 > (property) partial_images>)
quality: optional "low" or "medium" or "high" or "auto"
The quality of the generated image. One of `low`, `medium`, `high`,
or `auto`. Default: `auto`.
One of the following:
"low"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 7 > (property) quality > (member) 0>)
"medium"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 7 > (property) quality > (member) 1>)
"high"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 7 > (property) quality > (member) 2>)
"auto"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 7 > (property) quality > (member) 3>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 7 > (property) quality>)
size: optional "1024x1024" or "1024x1536" or "1536x1024" or "auto"
The size of the generated image. One of `1024x1024`, `1024x1536`,
`1536x1024`, or `auto`. Default: `auto`.
One of the following:
"1024x1024"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 7 > (property) size > (member) 0>)
"1024x1536"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 7 > (property) size > (member) 1>)
"1536x1024"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 7 > (property) size > (member) 2>)
"auto"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 7 > (property) size > (member) 3>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 7 > (property) size>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 7>)
LocalShell object { type }
A tool that allows the model to execute shell commands in a local environment.
type: "local\_shell"
The type of the local shell tool. Always `local\_shell`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 8 > (property) type>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 8>)
Shell object { type, environment }
A tool that allows the model to execute shell commands.
type: "shell"
The type of the shell tool. Always `shell`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 9 > (property) type>)
environment: optional [ContainerAuto](</api/reference/resources/responses#(resource) responses > (model) container_auto > (schema)>) { type, file\_ids, memory\_limit, 2 more } or [LocalEnvironment](</api/reference/resources/responses#(resource) responses > (model) local_environment > (schema)>) { type, skills } or [ContainerReference](</api/reference/resources/responses#(resource) responses > (model) container_reference > (schema)>) { container\_id, type }
One of the following:
ContainerAuto object { type, file\_ids, memory\_limit, 2 more }
type: "container\_auto"
Automatically creates a container for this request
[](<#(resource) responses > (model) container_auto > (schema) > (property) type>)
file\_ids: optional array of string
An optional list of uploaded files to make available to your code.
[](<#(resource) responses > (model) container_auto > (schema) > (property) file_ids>)
memory\_limit: optional "1g" or "4g" or "16g" or "64g"
The memory limit for the container.
One of the following:
"1g"
[](<#(resource) responses > (model) container_auto > (schema) > (property) memory_limit > (member) 0>)
"4g"
[](<#(resource) responses > (model) container_auto > (schema) > (property) memory_limit > (member) 1>)
"16g"
[](<#(resource) responses > (model) container_auto > (schema) > (property) memory_limit > (member) 2>)
"64g"
[](<#(resource) responses > (model) container_auto > (schema) > (property) memory_limit > (member) 3>)
[](<#(resource) responses > (model) container_auto > (schema) > (property) memory_limit>)
network\_policy: optional [ContainerNetworkPolicyDisabled](</api/reference/resources/responses#(resource) responses > (model) container_network_policy_disabled > (schema)>) { type } or [ContainerNetworkPolicyAllowlist](</api/reference/resources/responses#(resource) responses > (model) container_network_policy_allowlist > (schema)>) { allowed\_domains, type, domain\_secrets }
Network access policy for the container.
One of the following:
ContainerNetworkPolicyDisabled object { type }
type: "disabled"
Disable outbound network access. Always `disabled`.
[](<#(resource) responses > (model) container_network_policy_disabled > (schema) > (property) type>)
[](<#(resource) responses > (model) container_network_policy_disabled > (schema)>)
ContainerNetworkPolicyAllowlist object { allowed\_domains, type, domain\_secrets }
allowed\_domains: array of string
A list of allowed domains when type is `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) allowed_domains>)
type: "allowlist"
Allow outbound network access only to specified domains. Always `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) type>)
domain\_secrets: optional array of [ContainerNetworkPolicyDomainSecret](</api/reference/resources/responses#(resource) responses > (model) container_network_policy_domain_secret > (schema)>) { domain, name, value }
Optional domain-scoped secrets for allowlisted domains.
domain: string
The domain associated with the secret.
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) domain>)
name: string
The name of the secret to inject for the domain.
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) name>)
value: string
The secret value to inject for the domain.
maxLength10485760
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) value>)
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) domain_secrets>)
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema)>)
[](<#(resource) responses > (model) container_auto > (schema) > (property) network_policy>)
skills: optional array of [SkillReference](</api/reference/resources/responses#(resource) responses > (model) skill_reference > (schema)>) { skill\_id, type, version } or [InlineSkill](</api/reference/resources/responses#(resource) responses > (model) inline_skill > (schema)>) { description, name, source, type }
An optional list of skills referenced by id or inline data.
One of the following:
SkillReference object { skill\_id, type, version }
skill\_id: string
The ID of the referenced skill.
maxLength64
minLength1
[](<#(resource) responses > (model) skill_reference > (schema) > (property) skill_id>)
type: "skill\_reference"
References a skill created with the /v1/skills endpoint.
[](<#(resource) responses > (model) skill_reference > (schema) > (property) type>)
version: optional string
Optional skill version. Use a positive integer or ‘latest’. Omit for default.
[](<#(resource) responses > (model) skill_reference > (schema) > (property) version>)
[](<#(resource) responses > (model) skill_reference > (schema)>)
InlineSkill object { description, name, source, type }
description: string
The description of the skill.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) description>)
name: string
The name of the skill.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) name>)
source: [InlineSkillSource](</api/reference/resources/responses#(resource) responses > (model) inline_skill_source > (schema)>) { data, media\_type, type }
Inline skill payload
data: string
Base64-encoded skill zip bundle.
maxLength70254592
minLength1
[](<#(resource) responses > (model) inline_skill > (schema) > (property) source + (resource) responses > (model) inline_skill_source > (schema) > (property) data>)
media\_type: "application/zip"
The media type of the inline skill payload. Must be `application/zip`.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) source + (resource) responses > (model) inline_skill_source > (schema) > (property) media_type>)
type: "base64"
The type of the inline skill source. Must be `base64`.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) source + (resource) responses > (model) inline_skill_source > (schema) > (property) type>)
[](<#(resource) responses > (model) inline_skill > (schema) > (property) source>)
type: "inline"
Defines an inline skill for this request.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) type>)
[](<#(resource) responses > (model) inline_skill > (schema)>)
[](<#(resource) responses > (model) container_auto > (schema) > (property) skills>)
[](<#(resource) responses > (model) container_auto > (schema)>)
LocalEnvironment object { type, skills }
type: "local"
Use a local computer environment.
[](<#(resource) responses > (model) local_environment > (schema) > (property) type>)
skills: optional array of [LocalSkill](</api/reference/resources/responses#(resource) responses > (model) local_skill > (schema)>) { description, name, path }
An optional list of skills.
description: string
The description of the skill.
[](<#(resource) responses > (model) local_skill > (schema) > (property) description>)
name: string
The name of the skill.
[](<#(resource) responses > (model) local_skill > (schema) > (property) name>)
path: string
The path to the directory containing the skill.
[](<#(resource) responses > (model) local_skill > (schema) > (property) path>)
[](<#(resource) responses > (model) local_environment > (schema) > (property) skills>)
[](<#(resource) responses > (model) local_environment > (schema)>)
ContainerReference object { container\_id, type }
container\_id: string
The ID of the referenced container.
[](<#(resource) responses > (model) container_reference > (schema) > (property) container_id>)
type: "container\_reference"
References a container created with the /v1/containers endpoint
[](<#(resource) responses > (model) container_reference > (schema) > (property) type>)
[](<#(resource) responses > (model) container_reference > (schema)>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 9 > (property) environment>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 9>)
Custom object { name, type, defer\_loading, 2 more }
A custom tool that processes input using a specified format. Learn more about [custom tools](/docs/guides/function-calling#custom-tools)
name: string
The name of the custom tool, used to identify it in tool calls.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 10 > (property) name>)
type: "custom"
The type of the custom tool. Always `custom`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 10 > (property) type>)
defer\_loading: optional boolean
Whether this tool should be deferred and discovered via tool search.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 10 > (property) defer_loading>)
description: optional string
Optional description of the custom tool, used to provide more context.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 10 > (property) description>)
format: optional [CustomToolInputFormat](</api/reference/resources/$shared#(resource) $shared > (model) custom_tool_input_format > (schema)>)
The input format for the custom tool. Default is unconstrained text.
One of the following:
Text object { type }
Unconstrained free-form text.
type: "text"
Unconstrained text format. Always `text`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 10 > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 0 > (property) type>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 10 > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 0>)
Grammar object { definition, syntax, type }
A grammar defined by the user.
definition: string
The grammar definition.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 10 > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) definition>)
syntax: "lark" or "regex"
The syntax of the grammar definition. One of `lark` or `regex`.
One of the following:
"lark"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 10 > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax > (member) 0>)
"regex"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 10 > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax > (member) 1>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 10 > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax>)
type: "grammar"
Grammar format. Always `grammar`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 10 > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) type>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 10 > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 10 > (property) format>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 10>)
Namespace object { description, name, tools, type }
Groups function/custom tools under a shared namespace.
description: string
A description of the namespace shown to the model.
minLength1
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 11 > (property) description>)
name: string
The namespace name used in tool calls (for example, `crm`).
minLength1
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 11 > (property) name>)
tools: array of object { name, type, defer\_loading, 3 more } or object { name, type, defer\_loading, 2 more }
The function/custom tools available inside this namespace.
One of the following:
Function object { name, type, defer\_loading, 3 more }
name: string
maxLength128
minLength1
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 0 > (property) name>)
type: "function"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 0 > (property) type>)
defer\_loading: optional boolean
Whether this function should be deferred and discovered via tool search.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 0 > (property) defer_loading>)
description: optional string
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 0 > (property) description>)
parameters: optional unknown
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 0 > (property) parameters>)
strict: optional boolean
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 0 > (property) strict>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 0>)
Custom object { name, type, defer\_loading, 2 more }
A custom tool that processes input using a specified format. Learn more about [custom tools](/docs/guides/function-calling#custom-tools)
name: string
The name of the custom tool, used to identify it in tool calls.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1 > (property) name>)
type: "custom"
The type of the custom tool. Always `custom`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1 > (property) type>)
defer\_loading: optional boolean
Whether this tool should be deferred and discovered via tool search.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1 > (property) defer_loading>)
description: optional string
Optional description of the custom tool, used to provide more context.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1 > (property) description>)
format: optional [CustomToolInputFormat](</api/reference/resources/$shared#(resource) $shared > (model) custom_tool_input_format > (schema)>)
The input format for the custom tool. Default is unconstrained text.
One of the following:
Text object { type }
Unconstrained free-form text.
type: "text"
Unconstrained text format. Always `text`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1 > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 0 > (property) type>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1 > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 0>)
Grammar object { definition, syntax, type }
A grammar defined by the user.
definition: string
The grammar definition.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1 > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) definition>)
syntax: "lark" or "regex"
The syntax of the grammar definition. One of `lark` or `regex`.
One of the following:
"lark"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1 > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax > (member) 0>)
"regex"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1 > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax > (member) 1>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1 > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax>)
type: "grammar"
Grammar format. Always `grammar`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1 > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) type>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1 > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1 > (property) format>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 11 > (property) tools>)
type: "namespace"
The type of the tool. Always `namespace`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 11 > (property) type>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 11>)
ToolSearch object { type, description, execution, parameters }
Hosted or BYOT tool search configuration for deferred tools.
type: "tool\_search"
The type of the tool. Always `tool\_search`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 12 > (property) type>)
description: optional string
Description shown to the model for a client-executed tool search tool.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 12 > (property) description>)
execution: optional "server" or "client"
Whether tool search is executed by the server or by the client.
One of the following:
"server"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 12 > (property) execution > (member) 0>)
"client"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 12 > (property) execution > (member) 1>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 12 > (property) execution>)
parameters: optional unknown
Parameter schema for a client-executed tool search tool.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 12 > (property) parameters>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 12>)
WebSearchPreview object { type, search\_content\_types, search\_context\_size, user\_location }
This tool searches the web for relevant results to use in a response. Learn more about the [web search tool](https://platform.openai.com/docs/guides/tools-web-search).
type: "web\_search\_preview" or "web\_search\_preview\_2025\_03\_11"
The type of the web search tool. One of `web\_search\_preview` or `web\_search\_preview\_2025\_03\_11`.
One of the following:
"web\_search\_preview"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 13 > (property) type > (member) 0>)
"web\_search\_preview\_2025\_03\_11"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 13 > (property) type > (member) 1>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 13 > (property) type>)
search\_content\_types: optional array of "text" or "image"
One of the following:
"text"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 13 > (property) search_content_types > (items) > (member) 0>)
"image"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 13 > (property) search_content_types > (items) > (member) 1>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 13 > (property) search_content_types>)
search\_context\_size: optional "low" or "medium" or "high"
High level guidance for the amount of context window space to use for the search. One of `low`, `medium`, or `high`. `medium` is the default.
One of the following:
"low"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 13 > (property) search_context_size > (member) 0>)
"medium"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 13 > (property) search_context_size > (member) 1>)
"high"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 13 > (property) search_context_size > (member) 2>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 13 > (property) search_context_size>)
user\_location: optional object { type, city, country, 2 more }
The user’s location.
type: "approximate"
The type of location approximation. Always `approximate`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 13 > (property) user_location > (property) type>)
city: optional string
Free text input for the city of the user, e.g. `San Francisco`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 13 > (property) user_location > (property) city>)
country: optional string
The two-letter [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1) of the user, e.g. `US`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 13 > (property) user_location > (property) country>)
region: optional string
Free text input for the region of the user, e.g. `California`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 13 > (property) user_location > (property) region>)
timezone: optional string
The [IANA timezone](https://timeapi.io/documentation/iana-timezones) of the user, e.g. `America/Los\_Angeles`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 13 > (property) user_location > (property) timezone>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 13 > (property) user_location>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 13>)
ApplyPatch object { type }
Allows the assistant to create, delete, or update files using unified diffs.
type: "apply\_patch"
The type of the tool. Always `apply\_patch`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 14 > (property) type>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools > (items) > (variant) 14>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) tools>)
type: "tool\_search\_output"
The item type. Always `tool\_search\_output`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) type>)
id: optional string
The unique ID of this tool search output.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) id>)
call\_id: optional string
The unique ID of the tool search call generated by the model.
maxLength64
minLength1
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) call_id>)
execution: optional "server" or "client"
Whether tool search was executed by the server or by the client.
One of the following:
"server"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) execution > (member) 0>)
"client"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) execution > (member) 1>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) execution>)
status: optional "in\_progress" or "completed" or "incomplete"
The status of the tool search output.
One of the following:
"in\_progress"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) status > (member) 2>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10 > (property) status>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 10>)
Reasoning object { id, summary, type, 3 more }
A description of the chain of thought used by a reasoning model while generating
a response. Be sure to include these items in your `input` to the Responses API
for subsequent turns of a conversation if you are manually
[managing context](/docs/guides/conversation-state).
id: string
The unique identifier of the reasoning content.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 11 > (property) id>)
summary: array of [SummaryTextContent](</api/reference/resources/conversations#(resource) conversations > (model) summary_text_content > (schema)>) { text, type }
Reasoning summary content.
text: string
A summary of the reasoning output from the model so far.
[](<#(resource) conversations > (model) summary_text_content > (schema) > (property) text>)
type: "summary\_text"
The type of the object. Always `summary\_text`.
[](<#(resource) conversations > (model) summary_text_content > (schema) > (property) type>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 11 > (property) summary>)
type: "reasoning"
The type of the object. Always `reasoning`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 11 > (property) type>)
content: optional array of object { text, type }
Reasoning text content.
text: string
The reasoning text from the model.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 11 > (property) content > (items) > (property) text>)
type: "reasoning\_text"
The type of the reasoning text. Always `reasoning\_text`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 11 > (property) content > (items) > (property) type>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 11 > (property) content>)
encrypted\_content: optional string
The encrypted content of the reasoning item - populated when a response is
generated with `reasoning.encrypted\_content` in the `include` parameter.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 11 > (property) encrypted_content>)
status: optional "in\_progress" or "completed" or "incomplete"
The status of the item. One of `in\_progress`, `completed`, or
`incomplete`. Populated when items are returned via API.
One of the following:
"in\_progress"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 11 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 11 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 11 > (property) status > (member) 2>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 11 > (property) status>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 11>)
Compaction object { encrypted\_content, type, id }
A compaction item generated by the [`v1/responses/compact` API](/docs/api-reference/responses/compact).
encrypted\_content: string
The encrypted content of the compaction summary.
maxLength10485760
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 12 > (property) encrypted_content>)
type: "compaction"
The type of the item. Always `compaction`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 12 > (property) type>)
id: optional string
The ID of the compaction item.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 12 > (property) id>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 12>)
ImageGenerationCall object { id, result, status, type }
An image generation request made by the model.
id: string
The unique ID of the image generation call.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 13 > (property) id>)
result: string
The generated image encoded in base64.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 13 > (property) result>)
status: "in\_progress" or "completed" or "generating" or "failed"
The status of the image generation call.
One of the following:
"in\_progress"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 13 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 13 > (property) status > (member) 1>)
"generating"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 13 > (property) status > (member) 2>)
"failed"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 13 > (property) status > (member) 3>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 13 > (property) status>)
type: "image\_generation\_call"
The type of the image generation call. Always `image\_generation\_call`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 13 > (property) type>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 13>)
CodeInterpreterCall object { id, code, container\_id, 3 more }
A tool call to run code.
id: string
The unique ID of the code interpreter tool call.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 14 > (property) id>)
code: string
The code to run, or null if not available.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 14 > (property) code>)
container\_id: string
The ID of the container used to run the code.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 14 > (property) container_id>)
outputs: array of object { logs, type } or object { type, url }
The outputs generated by the code interpreter, such as logs or images.
Can be null if no outputs are available.
One of the following:
Logs object { logs, type }
The logs output from the code interpreter.
logs: string
The logs output from the code interpreter.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 14 > (property) outputs > (items) > (variant) 0 > (property) logs>)
type: "logs"
The type of the output. Always `logs`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 14 > (property) outputs > (items) > (variant) 0 > (property) type>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 14 > (property) outputs > (items) > (variant) 0>)
Image object { type, url }
The image output from the code interpreter.
type: "image"
The type of the output. Always `image`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 14 > (property) outputs > (items) > (variant) 1 > (property) type>)
url: string
The URL of the image output from the code interpreter.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 14 > (property) outputs > (items) > (variant) 1 > (property) url>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 14 > (property) outputs > (items) > (variant) 1>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 14 > (property) outputs>)
status: "in\_progress" or "completed" or "incomplete" or 2 more
The status of the code interpreter tool call. Valid values are `in\_progress`, `completed`, `incomplete`, `interpreting`, and `failed`.
One of the following:
"in\_progress"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 14 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 14 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 14 > (property) status > (member) 2>)
"interpreting"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 14 > (property) status > (member) 3>)
"failed"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 14 > (property) status > (member) 4>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 14 > (property) status>)
type: "code\_interpreter\_call"
The type of the code interpreter tool call. Always `code\_interpreter\_call`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 14 > (property) type>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 14>)
LocalShellCall object { id, action, call\_id, 2 more }
A tool call to run a command on the local shell.
id: string
The unique ID of the local shell call.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 15 > (property) id>)
action: object { command, env, type, 3 more }
Execute a shell command on the server.
command: array of string
The command to run.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 15 > (property) action > (property) command>)
env: map[string]
Environment variables to set for the command.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 15 > (property) action > (property) env>)
type: "exec"
The type of the local shell action. Always `exec`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 15 > (property) action > (property) type>)
timeout\_ms: optional number
Optional timeout in milliseconds for the command.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 15 > (property) action > (property) timeout_ms>)
user: optional string
Optional user to run the command as.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 15 > (property) action > (property) user>)
working\_directory: optional string
Optional working directory to run the command in.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 15 > (property) action > (property) working_directory>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 15 > (property) action>)
call\_id: string
The unique ID of the local shell tool call generated by the model.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 15 > (property) call_id>)
status: "in\_progress" or "completed" or "incomplete"
The status of the local shell call.
One of the following:
"in\_progress"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 15 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 15 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 15 > (property) status > (member) 2>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 15 > (property) status>)
type: "local\_shell\_call"
The type of the local shell call. Always `local\_shell\_call`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 15 > (property) type>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 15>)
LocalShellCallOutput object { id, output, type, status }
The output of a local shell tool call.
id: string
The unique ID of the local shell tool call generated by the model.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 16 > (property) id>)
output: string
A JSON string of the output of the local shell tool call.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 16 > (property) output>)
type: "local\_shell\_call\_output"
The type of the local shell tool call output. Always `local\_shell\_call\_output`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 16 > (property) type>)
status: optional "in\_progress" or "completed" or "incomplete"
The status of the item. One of `in\_progress`, `completed`, or `incomplete`.
One of the following:
"in\_progress"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 16 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 16 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 16 > (property) status > (member) 2>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 16 > (property) status>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 16>)
ShellCall object { action, call\_id, type, 3 more }
A tool representing a request to execute one or more shell commands.
action: object { commands, max\_output\_length, timeout\_ms }
The shell commands and limits that describe how to run the tool call.
commands: array of string
Ordered shell commands for the execution environment to run.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 17 > (property) action > (property) commands>)
max\_output\_length: optional number
Maximum number of UTF-8 characters to capture from combined stdout and stderr output.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 17 > (property) action > (property) max_output_length>)
timeout\_ms: optional number
Maximum wall-clock time in milliseconds to allow the shell commands to run.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 17 > (property) action > (property) timeout_ms>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 17 > (property) action>)
call\_id: string
The unique ID of the shell tool call generated by the model.
maxLength64
minLength1
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 17 > (property) call_id>)
type: "shell\_call"
The type of the item. Always `shell\_call`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 17 > (property) type>)
id: optional string
The unique ID of the shell tool call. Populated when this item is returned via API.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 17 > (property) id>)
environment: optional [LocalEnvironment](</api/reference/resources/responses#(resource) responses > (model) local_environment > (schema)>) { type, skills } or [ContainerReference](</api/reference/resources/responses#(resource) responses > (model) container_reference > (schema)>) { container\_id, type }
The environment to execute the shell commands in.
One of the following:
LocalEnvironment object { type, skills }
type: "local"
Use a local computer environment.
[](<#(resource) responses > (model) local_environment > (schema) > (property) type>)
skills: optional array of [LocalSkill](</api/reference/resources/responses#(resource) responses > (model) local_skill > (schema)>) { description, name, path }
An optional list of skills.
description: string
The description of the skill.
[](<#(resource) responses > (model) local_skill > (schema) > (property) description>)
name: string
The name of the skill.
[](<#(resource) responses > (model) local_skill > (schema) > (property) name>)
path: string
The path to the directory containing the skill.
[](<#(resource) responses > (model) local_skill > (schema) > (property) path>)
[](<#(resource) responses > (model) local_environment > (schema) > (property) skills>)
[](<#(resource) responses > (model) local_environment > (schema)>)
ContainerReference object { container\_id, type }
container\_id: string
The ID of the referenced container.
[](<#(resource) responses > (model) container_reference > (schema) > (property) container_id>)
type: "container\_reference"
References a container created with the /v1/containers endpoint
[](<#(resource) responses > (model) container_reference > (schema) > (property) type>)
[](<#(resource) responses > (model) container_reference > (schema)>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 17 > (property) environment>)
status: optional "in\_progress" or "completed" or "incomplete"
The status of the shell call. One of `in\_progress`, `completed`, or `incomplete`.
One of the following:
"in\_progress"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 17 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 17 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 17 > (property) status > (member) 2>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 17 > (property) status>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 17>)
ShellCallOutput object { call\_id, output, type, 3 more }
The streamed output items emitted by a shell tool call.
call\_id: string
The unique ID of the shell tool call generated by the model.
maxLength64
minLength1
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 18 > (property) call_id>)
output: array of [ResponseFunctionShellCallOutputContent](</api/reference/resources/responses#(resource) responses > (model) response_function_shell_call_output_content > (schema)>) { outcome, stderr, stdout }
Captured chunks of stdout and stderr output, along with their associated outcomes.
outcome: object { type } or object { exit\_code, type }
The exit or timeout outcome associated with this shell call.
One of the following:
Timeout object { type }
Indicates that the shell call exceeded its configured time limit.
type: "timeout"
The outcome type. Always `timeout`.
[](<#(resource) responses > (model) response_function_shell_call_output_content > (schema) > (property) outcome > (variant) 0 > (property) type>)
[](<#(resource) responses > (model) response_function_shell_call_output_content > (schema) > (property) outcome > (variant) 0>)
Exit object { exit\_code, type }
Indicates that the shell commands finished and returned an exit code.
exit\_code: number
The exit code returned by the shell process.
[](<#(resource) responses > (model) response_function_shell_call_output_content > (schema) > (property) outcome > (variant) 1 > (property) exit_code>)
type: "exit"
The outcome type. Always `exit`.
[](<#(resource) responses > (model) response_function_shell_call_output_content > (schema) > (property) outcome > (variant) 1 > (property) type>)
[](<#(resource) responses > (model) response_function_shell_call_output_content > (schema) > (property) outcome > (variant) 1>)
[](<#(resource) responses > (model) response_function_shell_call_output_content > (schema) > (property) outcome>)
stderr: string
Captured stderr output for the shell call.
maxLength10485760
[](<#(resource) responses > (model) response_function_shell_call_output_content > (schema) > (property) stderr>)
stdout: string
Captured stdout output for the shell call.
maxLength10485760
[](<#(resource) responses > (model) response_function_shell_call_output_content > (schema) > (property) stdout>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 18 > (property) output>)
type: "shell\_call\_output"
The type of the item. Always `shell\_call\_output`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 18 > (property) type>)
id: optional string
The unique ID of the shell tool call output. Populated when this item is returned via API.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 18 > (property) id>)
max\_output\_length: optional number
The maximum number of UTF-8 characters captured for this shell call’s combined output.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 18 > (property) max_output_length>)
status: optional "in\_progress" or "completed" or "incomplete"
The status of the shell call output.
One of the following:
"in\_progress"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 18 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 18 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 18 > (property) status > (member) 2>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 18 > (property) status>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 18>)
ApplyPatchCall object { call\_id, operation, status, 2 more }
A tool call representing a request to create, delete, or update files using diff patches.
call\_id: string
The unique ID of the apply patch tool call generated by the model.
maxLength64
minLength1
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 19 > (property) call_id>)
operation: object { diff, path, type } or object { path, type } or object { diff, path, type }
The specific create, delete, or update instruction for the apply\_patch tool call.
One of the following:
CreateFile object { diff, path, type }
Instruction for creating a new file via the apply\_patch tool.
diff: string
Unified diff content to apply when creating the file.
maxLength10485760
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 19 > (property) operation > (variant) 0 > (property) diff>)
path: string
Path of the file to create relative to the workspace root.
minLength1
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 19 > (property) operation > (variant) 0 > (property) path>)
type: "create\_file"
The operation type. Always `create\_file`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 19 > (property) operation > (variant) 0 > (property) type>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 19 > (property) operation > (variant) 0>)
DeleteFile object { path, type }
Instruction for deleting an existing file via the apply\_patch tool.
path: string
Path of the file to delete relative to the workspace root.
minLength1
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 19 > (property) operation > (variant) 1 > (property) path>)
type: "delete\_file"
The operation type. Always `delete\_file`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 19 > (property) operation > (variant) 1 > (property) type>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 19 > (property) operation > (variant) 1>)
UpdateFile object { diff, path, type }
Instruction for updating an existing file via the apply\_patch tool.
diff: string
Unified diff content to apply to the existing file.
maxLength10485760
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 19 > (property) operation > (variant) 2 > (property) diff>)
path: string
Path of the file to update relative to the workspace root.
minLength1
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 19 > (property) operation > (variant) 2 > (property) path>)
type: "update\_file"
The operation type. Always `update\_file`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 19 > (property) operation > (variant) 2 > (property) type>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 19 > (property) operation > (variant) 2>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 19 > (property) operation>)
status: "in\_progress" or "completed"
The status of the apply patch tool call. One of `in\_progress` or `completed`.
One of the following:
"in\_progress"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 19 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 19 > (property) status > (member) 1>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 19 > (property) status>)
type: "apply\_patch\_call"
The type of the item. Always `apply\_patch\_call`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 19 > (property) type>)
id: optional string
The unique ID of the apply patch tool call. Populated when this item is returned via API.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 19 > (property) id>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 19>)
ApplyPatchCallOutput object { call\_id, status, type, 2 more }
The streamed output emitted by an apply patch tool call.
call\_id: string
The unique ID of the apply patch tool call generated by the model.
maxLength64
minLength1
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 20 > (property) call_id>)
status: "completed" or "failed"
The status of the apply patch tool call output. One of `completed` or `failed`.
One of the following:
"completed"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 20 > (property) status > (member) 0>)
"failed"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 20 > (property) status > (member) 1>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 20 > (property) status>)
type: "apply\_patch\_call\_output"
The type of the item. Always `apply\_patch\_call\_output`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 20 > (property) type>)
id: optional string
The unique ID of the apply patch tool call output. Populated when this item is returned via API.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 20 > (property) id>)
output: optional string
Optional human-readable log text from the apply patch tool (e.g., patch results or errors).
maxLength10485760
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 20 > (property) output>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 20>)
McpListTools object { id, server\_label, tools, 2 more }
A list of tools available on an MCP server.
id: string
The unique ID of the list.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 21 > (property) id>)
server\_label: string
The label of the MCP server.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 21 > (property) server_label>)
tools: array of object { input\_schema, name, annotations, description }
The tools available on the server.
input\_schema: unknown
The JSON schema describing the tool’s input.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 21 > (property) tools > (items) > (property) input_schema>)
name: string
The name of the tool.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 21 > (property) tools > (items) > (property) name>)
annotations: optional unknown
Additional annotations about the tool.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 21 > (property) tools > (items) > (property) annotations>)
description: optional string
The description of the tool.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 21 > (property) tools > (items) > (property) description>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 21 > (property) tools>)
type: "mcp\_list\_tools"
The type of the item. Always `mcp\_list\_tools`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 21 > (property) type>)
error: optional string
Error message if the server could not list tools.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 21 > (property) error>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 21>)
McpApprovalRequest object { id, arguments, name, 2 more }
A request for human approval of a tool invocation.
id: string
The unique ID of the approval request.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 22 > (property) id>)
arguments: string
A JSON string of arguments for the tool.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 22 > (property) arguments>)
name: string
The name of the tool to run.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 22 > (property) name>)
server\_label: string
The label of the MCP server making the request.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 22 > (property) server_label>)
type: "mcp\_approval\_request"
The type of the item. Always `mcp\_approval\_request`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 22 > (property) type>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 22>)
McpApprovalResponse object { approval\_request\_id, approve, type, 2 more }
A response to an MCP approval request.
approval\_request\_id: string
The ID of the approval request being answered.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 23 > (property) approval_request_id>)
approve: boolean
Whether the request was approved.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 23 > (property) approve>)
type: "mcp\_approval\_response"
The type of the item. Always `mcp\_approval\_response`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 23 > (property) type>)
id: optional string
The unique ID of the approval response
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 23 > (property) id>)
reason: optional string
Optional reason for the decision.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 23 > (property) reason>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 23>)
McpCall object { id, arguments, name, 6 more }
An invocation of a tool on an MCP server.
id: string
The unique ID of the tool call.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 24 > (property) id>)
arguments: string
A JSON string of the arguments passed to the tool.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 24 > (property) arguments>)
name: string
The name of the tool that was run.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 24 > (property) name>)
server\_label: string
The label of the MCP server running the tool.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 24 > (property) server_label>)
type: "mcp\_call"
The type of the item. Always `mcp\_call`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 24 > (property) type>)
approval\_request\_id: optional string
Unique identifier for the MCP tool call approval request.
Include this value in a subsequent `mcp\_approval\_response` input to approve or reject the corresponding tool call.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 24 > (property) approval_request_id>)
error: optional string
The error from the tool call, if any.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 24 > (property) error>)
output: optional string
The output from the tool call.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 24 > (property) output>)
status: optional "in\_progress" or "completed" or "incomplete" or 2 more
The status of the tool call. One of `in\_progress`, `completed`, `incomplete`, `calling`, or `failed`.
One of the following:
"in\_progress"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 24 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 24 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 24 > (property) status > (member) 2>)
"calling"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 24 > (property) status > (member) 3>)
"failed"
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 24 > (property) status > (member) 4>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 24 > (property) status>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 24>)
CustomToolCallOutput object { call\_id, output, type, id }
The output of a custom tool call from your code, being sent back to the model.
call\_id: string
The call ID, used to map this custom tool call output to a custom tool call.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 25 > (property) call_id>)
output: string or array of [ResponseInputText](</api/reference/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } or [ResponseInputImage](</api/reference/resources/responses#(resource) responses > (model) response_input_image > (schema)>) { detail, type, file\_id, image\_url } or [ResponseInputFile](</api/reference/resources/responses#(resource) responses > (model) response_input_file > (schema)>) { type, detail, file\_data, 3 more }
The output from the custom tool call generated by your code.
Can be a string or an list of output content.
One of the following:
StringOutput = string
A string of the output of the custom tool call.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 25 > (property) output > (variant) 0>)
OutputContentList = array of [ResponseInputText](</api/reference/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } or [ResponseInputImage](</api/reference/resources/responses#(resource) responses > (model) response_input_image > (schema)>) { detail, type, file\_id, image\_url } or [ResponseInputFile](</api/reference/resources/responses#(resource) responses > (model) response_input_file > (schema)>) { type, detail, file\_data, 3 more }
Text, image, or file output of the custom tool call.
One of the following:
ResponseInputText object { text, type }
A text input to the model.
text: string
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
type: "input\_text"
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
ResponseInputImage object { detail, type, file\_id, image\_url }
An image input to the model. Learn about [image inputs](/docs/guides/vision).
detail: "low" or "high" or "auto" or "original"
The detail level of the image to be sent to the model. One of `high`, `low`, `auto`, or `original`. Defaults to `auto`.
One of the following:
"low"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 0>)
"high"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 1>)
"auto"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 2>)
"original"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 3>)
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail>)
type: "input\_image"
The type of the input item. Always `input\_image`.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) type>)
file\_id: optional string
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) file_id>)
image\_url: optional string
The URL of the image to be sent to the model. A fully qualified URL or base64 encoded image in a data URL.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) image_url>)
[](<#(resource) responses > (model) response_input_image > (schema)>)
ResponseInputFile object { type, detail, file\_data, 3 more }
A file input to the model.
type: "input\_file"
The type of the input item. Always `input\_file`.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) type>)
detail: optional "low" or "high"
The detail level of the file to be sent to the model. Use `low` for the default rendering behavior, or `high` to render the file at higher quality. Defaults to `low`.
One of the following:
"low"
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 0>)
"high"
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 1>)
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail>)
file\_data: optional string
The content of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_data>)
file\_id: optional string
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_id>)
file\_url: optional string
The URL of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_url>)
filename: optional string
The name of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) filename>)
[](<#(resource) responses > (model) response_input_file > (schema)>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 25 > (property) output > (variant) 1>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 25 > (property) output>)
type: "custom\_tool\_call\_output"
The type of the custom tool call output. Always `custom\_tool\_call\_output`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 25 > (property) type>)
id: optional string
The unique ID of the custom tool call output in the OpenAI platform.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 25 > (property) id>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 25>)
CustomToolCall object { call\_id, input, name, 3 more }
A call to a custom tool created by the model.
call\_id: string
An identifier used to map this custom tool call to a tool call output.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 26 > (property) call_id>)
input: string
The input for the custom tool call generated by the model.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 26 > (property) input>)
name: string
The name of the custom tool being called.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 26 > (property) name>)
type: "custom\_tool\_call"
The type of the custom tool call. Always `custom\_tool\_call`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 26 > (property) type>)
id: optional string
The unique ID of the custom tool call in the OpenAI platform.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 26 > (property) id>)
namespace: optional string
The namespace of the custom tool being called.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 26 > (property) namespace>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 26>)
ItemReference object { id, type }
An internal identifier for an item to reference.
id: string
The ID of the item to reference.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 27 > (property) id>)
type: optional "item\_reference"
The type of item to reference. Always `item\_reference`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 27 > (property) type>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1 > (items) > (variant) 27>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema) > (variant) 1>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) input > (schema)>)
instructions: optional string
A system (or developer) message inserted into the model’s context.
When used along with `previous\_response\_id`, the instructions from a previous response will not be carried over to the next response. This makes it simple to swap out system (or developer) messages in new responses.
[](<#(resource) responses > (method) compact > (params) 0 > (param) instructions > (schema)>)
previous\_response\_id: optional string
The unique ID of the previous response to the model. Use this to create multi-turn conversations. Learn more about [conversation state](/docs/guides/conversation-state). Cannot be used in conjunction with `conversation`.
[](<#(resource) responses > (method) compact > (params) 0 > (param) previous_response_id > (schema)>)
prompt\_cache\_key: optional string
A key to use when reading from or writing to the prompt cache.
maxLength64
[](<#(resource) responses > (method) compact > (params) 0 > (param) prompt_cache_key > (schema)>)
prompt\_cache\_retention: optional "in\_memory" or "24h"
How long to retain a prompt cache entry created by this request.
One of the following:
"in\_memory"
[](<#(resource) responses > (method) compact > (params) 0 > (param) prompt_cache_retention > (schema) > (member) 0>)
"24h"
[](<#(resource) responses > (method) compact > (params) 0 > (param) prompt_cache_retention > (schema) > (member) 1>)
[](<#(resource) responses > (method) compact > (params) 0 > (param) prompt_cache_retention > (schema)>)
##### ReturnsExpand Collapse
CompactedResponse object { id, created\_at, object, 2 more }
id: string
The unique identifier for the compacted response.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) id>)
created\_at: number
Unix timestamp (in seconds) when the compacted conversation was created.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) created_at>)
object: "response.compaction"
The object type. Always `response.compaction`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) object>)
output: array of [Message](</api/reference/resources/conversations#(resource) conversations > (model) message > (schema)>) { id, content, role, 3 more } or object { arguments, call\_id, name, 4 more } or object { id, arguments, call\_id, 4 more } or 22 more
The compacted list of output items.
One of the following:
Message object { id, content, role, 3 more }
A message to or from the model.
id: string
The unique ID of the message.
[](<#(resource) conversations > (model) message > (schema) > (property) id>)
content: array of [ResponseInputText](</api/reference/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } or [ResponseOutputText](</api/reference/resources/responses#(resource) responses > (model) response_output_text > (schema)>) { annotations, logprobs, text, type } or [TextContent](</api/reference/resources/conversations#(resource) conversations > (model) text_content > (schema)>) { text, type } or 6 more
The content of the message
One of the following:
ResponseInputText object { text, type }
A text input to the model.
text: string
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
type: "input\_text"
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
ResponseOutputText object { annotations, logprobs, text, type }
A text output from the model.
annotations: array of object { file\_id, filename, index, type } or object { end\_index, start\_index, title, 2 more } or object { container\_id, end\_index, file\_id, 3 more } or object { file\_id, index, type }
The annotations of the text output.
One of the following:
FileCitation object { file\_id, filename, index, type }
A citation to a file.
file\_id: string
The ID of the file.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) file_id>)
filename: string
The filename of the file cited.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) filename>)
index: number
The index of the file in the list of files.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) index>)
type: "file\_citation"
The type of the file citation. Always `file\_citation`.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) type>)
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 0>)
URLCitation object { end\_index, start\_index, title, 2 more }
A citation for a web resource used to generate a model response.
end\_index: number
The index of the last character of the URL citation in the message.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) end_index>)
start\_index: number
The index of the first character of the URL citation in the message.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) start_index>)
title: string
The title of the web resource.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) title>)
type: "url\_citation"
The type of the URL citation. Always `url\_citation`.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) type>)
url: string
The URL of the web resource.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) url>)
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 1>)
ContainerFileCitation object { container\_id, end\_index, file\_id, 3 more }
A citation for a container file used to generate a model response.
container\_id: string
The ID of the container file.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 2 > (property) container_id>)
end\_index: number
The index of the last character of the container file citation in the message.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 2 > (property) end_index>)
file\_id: string
The ID of the file.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 2 > (property) file_id>)
filename: string
The filename of the container file cited.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 2 > (property) filename>)
start\_index: number
The index of the first character of the container file citation in the message.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 2 > (property) start_index>)
type: "container\_file\_citation"
The type of the container file citation. Always `container\_file\_citation`.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 2 > (property) type>)
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 2>)
FilePath object { file\_id, index, type }
A path to a file.
file\_id: string
The ID of the file.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 3 > (property) file_id>)
index: number
The index of the file in the list of files.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 3 > (property) index>)
type: "file\_path"
The type of the file path. Always `file\_path`.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 3 > (property) type>)
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 3>)
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations>)
logprobs: array of object { token, bytes, logprob, top\_logprobs }
token: string
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) token>)
bytes: array of number
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) bytes>)
logprob: number
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) logprob>)
top\_logprobs: array of object { token, bytes, logprob }
token: string
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) top_logprobs > (items) > (property) token>)
bytes: array of number
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) top_logprobs > (items) > (property) bytes>)
logprob: number
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) top_logprobs > (items) > (property) logprob>)
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) top_logprobs>)
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs>)
text: string
The text output from the model.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) text>)
type: "output\_text"
The type of the output text. Always `output\_text`.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_output_text > (schema)>)
TextContent object { text, type }
A text content.
text: string
[](<#(resource) conversations > (model) text_content > (schema) > (property) text>)
type: "text"
[](<#(resource) conversations > (model) text_content > (schema) > (property) type>)
[](<#(resource) conversations > (model) text_content > (schema)>)
SummaryTextContent object { text, type }
A summary text from the model.
text: string
A summary of the reasoning output from the model so far.
[](<#(resource) conversations > (model) summary_text_content > (schema) > (property) text>)
type: "summary\_text"
The type of the object. Always `summary\_text`.
[](<#(resource) conversations > (model) summary_text_content > (schema) > (property) type>)
[](<#(resource) conversations > (model) summary_text_content > (schema)>)
ReasoningText object { text, type }
Reasoning text from the model.
text: string
The reasoning text from the model.
[](<#(resource) conversations > (model) message > (schema) > (property) content > (items) > (variant) 4 > (property) text>)
type: "reasoning\_text"
The type of the reasoning text. Always `reasoning\_text`.
[](<#(resource) conversations > (model) message > (schema) > (property) content > (items) > (variant) 4 > (property) type>)
[](<#(resource) conversations > (model) message > (schema) > (property) content > (items) > (variant) 4>)
ResponseOutputRefusal object { refusal, type }
A refusal from the model.
refusal: string
The refusal explanation from the model.
[](<#(resource) responses > (model) response_output_refusal > (schema) > (property) refusal>)
type: "refusal"
The type of the refusal. Always `refusal`.
[](<#(resource) responses > (model) response_output_refusal > (schema) > (property) type>)
[](<#(resource) responses > (model) response_output_refusal > (schema)>)
ResponseInputImage object { detail, type, file\_id, image\_url }
An image input to the model. Learn about [image inputs](/docs/guides/vision).
detail: "low" or "high" or "auto" or "original"
The detail level of the image to be sent to the model. One of `high`, `low`, `auto`, or `original`. Defaults to `auto`.
One of the following:
"low"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 0>)
"high"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 1>)
"auto"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 2>)
"original"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 3>)
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail>)
type: "input\_image"
The type of the input item. Always `input\_image`.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) type>)
file\_id: optional string
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) file_id>)
image\_url: optional string
The URL of the image to be sent to the model. A fully qualified URL or base64 encoded image in a data URL.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) image_url>)
[](<#(resource) responses > (model) response_input_image > (schema)>)
ComputerScreenshotContent object { detail, file\_id, image\_url, type }
A screenshot of a computer.
detail: "low" or "high" or "auto" or "original"
The detail level of the screenshot image to be sent to the model. One of `high`, `low`, `auto`, or `original`. Defaults to `auto`.
One of the following:
"low"
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) detail > (member) 0>)
"high"
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) detail > (member) 1>)
"auto"
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) detail > (member) 2>)
"original"
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) detail > (member) 3>)
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) detail>)
file\_id: string
The identifier of an uploaded file that contains the screenshot.
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) file_id>)
image\_url: string
The URL of the screenshot image.
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) image_url>)
type: "computer\_screenshot"
Specifies the event type. For a computer screenshot, this property is always set to `computer\_screenshot`.
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) type>)
[](<#(resource) conversations > (model) computer_screenshot_content > (schema)>)
ResponseInputFile object { type, detail, file\_data, 3 more }
A file input to the model.
type: "input\_file"
The type of the input item. Always `input\_file`.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) type>)
detail: optional "low" or "high"
The detail level of the file to be sent to the model. Use `low` for the default rendering behavior, or `high` to render the file at higher quality. Defaults to `low`.
One of the following:
"low"
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 0>)
"high"
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 1>)
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail>)
file\_data: optional string
The content of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_data>)
file\_id: optional string
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_id>)
file\_url: optional string
The URL of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_url>)
filename: optional string
The name of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) filename>)
[](<#(resource) responses > (model) response_input_file > (schema)>)
[](<#(resource) conversations > (model) message > (schema) > (property) content>)
role: "unknown" or "user" or "assistant" or 5 more
The role of the message. One of `unknown`, `user`, `assistant`, `system`, `critic`, `discriminator`, `developer`, or `tool`.
One of the following:
"unknown"
[](<#(resource) conversations > (model) message > (schema) > (property) role > (member) 0>)
"user"
[](<#(resource) conversations > (model) message > (schema) > (property) role > (member) 1>)
"assistant"
[](<#(resource) conversations > (model) message > (schema) > (property) role > (member) 2>)
"system"
[](<#(resource) conversations > (model) message > (schema) > (property) role > (member) 3>)
"critic"
[](<#(resource) conversations > (model) message > (schema) > (property) role > (member) 4>)
"discriminator"
[](<#(resource) conversations > (model) message > (schema) > (property) role > (member) 5>)
"developer"
[](<#(resource) conversations > (model) message > (schema) > (property) role > (member) 6>)
"tool"
[](<#(resource) conversations > (model) message > (schema) > (property) role > (member) 7>)
[](<#(resource) conversations > (model) message > (schema) > (property) role>)
status: "in\_progress" or "completed" or "incomplete"
The status of item. One of `in\_progress`, `completed`, or `incomplete`. Populated when items are returned via API.
One of the following:
"in\_progress"
[](<#(resource) conversations > (model) message > (schema) > (property) status > (member) 0>)
"completed"
[](<#(resource) conversations > (model) message > (schema) > (property) status > (member) 1>)
"incomplete"
[](<#(resource) conversations > (model) message > (schema) > (property) status > (member) 2>)
[](<#(resource) conversations > (model) message > (schema) > (property) status>)
type: "message"
The type of the message. Always set to `message`.
[](<#(resource) conversations > (model) message > (schema) > (property) type>)
phase: optional "commentary" or "final\_answer"
Labels an `assistant` message as intermediate commentary (`commentary`) or the final answer (`final\_answer`). For models like `gpt-5.3-codex` and beyond, when sending follow-up requests, preserve and resend phase on all assistant messages — dropping it can degrade performance. Not used for user messages.
One of the following:
"commentary"
[](<#(resource) conversations > (model) message > (schema) > (property) phase > (member) 0>)
"final\_answer"
[](<#(resource) conversations > (model) message > (schema) > (property) phase > (member) 1>)
[](<#(resource) conversations > (model) message > (schema) > (property) phase>)
[](<#(resource) conversations > (model) message > (schema)>)
FunctionCall object { arguments, call\_id, name, 4 more }
A tool call to run a function. See the
[function calling guide](/docs/guides/function-calling) for more information.
arguments: string
A JSON string of the arguments to pass to the function.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 1 > (property) arguments>)
call\_id: string
The unique ID of the function tool call generated by the model.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 1 > (property) call_id>)
name: string
The name of the function to run.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 1 > (property) name>)
type: "function\_call"
The type of the function tool call. Always `function\_call`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 1 > (property) type>)
id: optional string
The unique ID of the function tool call.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 1 > (property) id>)
namespace: optional string
The namespace of the function to run.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 1 > (property) namespace>)
status: optional "in\_progress" or "completed" or "incomplete"
The status of the item. One of `in\_progress`, `completed`, or
`incomplete`. Populated when items are returned via API.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 1 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 1 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 1 > (property) status > (member) 2>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 1 > (property) status>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 1>)
ToolSearchCall object { id, arguments, call\_id, 4 more }
id: string
The unique ID of the tool search call item.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 2 > (property) id>)
arguments: unknown
Arguments used for the tool search call.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 2 > (property) arguments>)
call\_id: string
The unique ID of the tool search call generated by the model.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 2 > (property) call_id>)
execution: "server" or "client"
Whether tool search was executed by the server or by the client.
One of the following:
"server"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 2 > (property) execution > (member) 0>)
"client"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 2 > (property) execution > (member) 1>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 2 > (property) execution>)
status: "in\_progress" or "completed" or "incomplete"
The status of the tool search call item that was recorded.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 2 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 2 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 2 > (property) status > (member) 2>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 2 > (property) status>)
type: "tool\_search\_call"
The type of the item. Always `tool\_search\_call`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 2 > (property) type>)
created\_by: optional string
The identifier of the actor that created the item.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 2 > (property) created_by>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 2>)
ToolSearchOutput object { id, call\_id, execution, 4 more }
id: string
The unique ID of the tool search output item.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) id>)
call\_id: string
The unique ID of the tool search call generated by the model.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) call_id>)
execution: "server" or "client"
Whether tool search was executed by the server or by the client.
One of the following:
"server"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) execution > (member) 0>)
"client"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) execution > (member) 1>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) execution>)
status: "in\_progress" or "completed" or "incomplete"
The status of the tool search output item that was recorded.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) status > (member) 2>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) status>)
tools: array of object { name, parameters, strict, 3 more } or object { type, vector\_store\_ids, filters, 2 more } or object { type } or 12 more
The loaded tool definitions returned by tool search.
One of the following:
Function object { name, parameters, strict, 3 more }
Defines a function in your own code the model can choose to call. Learn more about [function calling](https://platform.openai.com/docs/guides/function-calling).
name: string
The name of the function to call.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 0 > (property) name>)
parameters: map[unknown]
A JSON schema object describing the parameters of the function.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 0 > (property) parameters>)
strict: boolean
Whether to enforce strict parameter validation. Default `true`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 0 > (property) strict>)
type: "function"
The type of the function tool. Always `function`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 0 > (property) type>)
defer\_loading: optional boolean
Whether this function is deferred and loaded via tool search.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 0 > (property) defer_loading>)
description: optional string
A description of the function. Used by the model to determine whether or not to call the function.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 0 > (property) description>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 0>)
FileSearch object { type, vector\_store\_ids, filters, 2 more }
A tool that searches for relevant content from uploaded files. Learn more about the [file search tool](https://platform.openai.com/docs/guides/tools-file-search).
type: "file\_search"
The type of the file search tool. Always `file\_search`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 1 > (property) type>)
vector\_store\_ids: array of string
The IDs of the vector stores to search.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 1 > (property) vector_store_ids>)
filters: optional [ComparisonFilter](</api/reference/resources/$shared#(resource) $shared > (model) comparison_filter > (schema)>) { key, type, value } or [CompoundFilter](</api/reference/resources/$shared#(resource) $shared > (model) compound_filter > (schema)>) { filters, type }
A filter to apply.
One of the following:
ComparisonFilter object { key, type, value }
A filter used to compare a specified attribute key to a given value using a defined comparison operation.
key: string
The key to compare against the value.
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) key>)
type: "eq" or "ne" or "gt" or 5 more
Specifies the comparison operator: `eq`, `ne`, `gt`, `gte`, `lt`, `lte`, `in`, `nin`.
* `eq`: equals
* `ne`: not equal
* `gt`: greater than
* `gte`: greater than or equal
* `lt`: less than
* `lte`: less than or equal
* `in`: in
* `nin`: not in
One of the following:
"eq"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 0>)
"ne"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 1>)
"gt"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 2>)
"gte"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 3>)
"lt"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 4>)
"lte"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 5>)
"in"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 6>)
"nin"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 7>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type>)
value: string or number or boolean or array of string or number
The value to compare against the attribute key; supports string, number, or boolean types.
One of the following:
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 0>)
number
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 1>)
boolean
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 2>)
array of string or number
One of the following:
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 0>)
number
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 1>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value>)
[](<#(resource) $shared > (model) comparison_filter > (schema)>)
CompoundFilter object { filters, type }
Combine multiple filters using `and` or `or`.
filters: array of [ComparisonFilter](</api/reference/resources/$shared#(resource) $shared > (model) comparison_filter > (schema)>) { key, type, value } or unknown
Array of filters to combine. Items can be `ComparisonFilter` or `CompoundFilter`.
One of the following:
ComparisonFilter object { key, type, value }
A filter used to compare a specified attribute key to a given value using a defined comparison operation.
key: string
The key to compare against the value.
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) key>)
type: "eq" or "ne" or "gt" or 5 more
Specifies the comparison operator: `eq`, `ne`, `gt`, `gte`, `lt`, `lte`, `in`, `nin`.
* `eq`: equals
* `ne`: not equal
* `gt`: greater than
* `gte`: greater than or equal
* `lt`: less than
* `lte`: less than or equal
* `in`: in
* `nin`: not in
One of the following:
"eq"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 0>)
"ne"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 1>)
"gt"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 2>)
"gte"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 3>)
"lt"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 4>)
"lte"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 5>)
"in"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 6>)
"nin"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 7>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type>)
value: string or number or boolean or array of string or number
The value to compare against the attribute key; supports string, number, or boolean types.
One of the following:
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 0>)
number
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 1>)
boolean
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 2>)
array of string or number
One of the following:
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 0>)
number
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 1>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value>)
[](<#(resource) $shared > (model) comparison_filter > (schema)>)
unknown
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) filters > (items) > (variant) 1>)
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) filters>)
type: "and" or "or"
Type of operation: `and` or `or`.
One of the following:
"and"
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type > (member) 0>)
"or"
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type > (member) 1>)
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type>)
[](<#(resource) $shared > (model) compound_filter > (schema)>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 1 > (property) filters>)
max\_num\_results: optional number
The maximum number of results to return. This number should be between 1 and 50 inclusive.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 1 > (property) max_num_results>)
ranking\_options: optional object { hybrid\_search, ranker, score\_threshold }
Ranking options for search.
hybrid\_search: optional object { embedding\_weight, text\_weight }
Weights that control how reciprocal rank fusion balances semantic embedding matches versus sparse keyword matches when hybrid search is enabled.
embedding\_weight: number
The weight of the embedding in the reciprocal ranking fusion.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 1 > (property) ranking_options > (property) hybrid_search > (property) embedding_weight>)
text\_weight: number
The weight of the text in the reciprocal ranking fusion.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 1 > (property) ranking_options > (property) hybrid_search > (property) text_weight>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 1 > (property) ranking_options > (property) hybrid_search>)
ranker: optional "auto" or "default-2024-11-15"
The ranker to use for the file search.
One of the following:
"auto"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 1 > (property) ranking_options > (property) ranker > (member) 0>)
"default-2024-11-15"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 1 > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 1 > (property) ranking_options > (property) ranker>)
score\_threshold: optional number
The score threshold for the file search, a number between 0 and 1. Numbers closer to 1 will attempt to return only the most relevant results, but may return fewer results.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 1 > (property) ranking_options > (property) score_threshold>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 1 > (property) ranking_options>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 1>)
Computer object { type }
A tool that controls a virtual computer. Learn more about the [computer tool](https://platform.openai.com/docs/guides/tools-computer-use).
type: "computer"
The type of the computer tool. Always `computer`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 2 > (property) type>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 2>)
ComputerUsePreview object { display\_height, display\_width, environment, type }
A tool that controls a virtual computer. Learn more about the [computer tool](https://platform.openai.com/docs/guides/tools-computer-use).
display\_height: number
The height of the computer display.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 3 > (property) display_height>)
display\_width: number
The width of the computer display.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 3 > (property) display_width>)
environment: "windows" or "mac" or "linux" or 2 more
The type of computer environment to control.
One of the following:
"windows"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 3 > (property) environment > (member) 0>)
"mac"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 3 > (property) environment > (member) 1>)
"linux"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 3 > (property) environment > (member) 2>)
"ubuntu"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 3 > (property) environment > (member) 3>)
"browser"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 3 > (property) environment > (member) 4>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 3 > (property) environment>)
type: "computer\_use\_preview"
The type of the computer use tool. Always `computer\_use\_preview`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 3 > (property) type>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 3>)
WebSearch object { type, filters, search\_context\_size, user\_location }
Search the Internet for sources related to the prompt. Learn more about the
[web search tool](/docs/guides/tools-web-search).
type: "web\_search" or "web\_search\_2025\_08\_26"
The type of the web search tool. One of `web\_search` or `web\_search\_2025\_08\_26`.
One of the following:
"web\_search"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 4 > (property) type > (member) 0>)
"web\_search\_2025\_08\_26"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 4 > (property) type > (member) 1>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 4 > (property) type>)
filters: optional object { allowed\_domains }
Filters for the search.
allowed\_domains: optional array of string
Allowed domains for the search. If not provided, all domains are allowed.
Subdomains of the provided domains are allowed as well.
Example: `["pubmed.ncbi.nlm.nih.gov"]`
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 4 > (property) filters > (property) allowed_domains>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 4 > (property) filters>)
search\_context\_size: optional "low" or "medium" or "high"
High level guidance for the amount of context window space to use for the search. One of `low`, `medium`, or `high`. `medium` is the default.
One of the following:
"low"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 4 > (property) search_context_size > (member) 0>)
"medium"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 4 > (property) search_context_size > (member) 1>)
"high"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 4 > (property) search_context_size > (member) 2>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 4 > (property) search_context_size>)
user\_location: optional object { city, country, region, 2 more }
The approximate location of the user.
city: optional string
Free text input for the city of the user, e.g. `San Francisco`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 4 > (property) user_location > (property) city>)
country: optional string
The two-letter [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1) of the user, e.g. `US`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 4 > (property) user_location > (property) country>)
region: optional string
Free text input for the region of the user, e.g. `California`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 4 > (property) user_location > (property) region>)
timezone: optional string
The [IANA timezone](https://timeapi.io/documentation/iana-timezones) of the user, e.g. `America/Los\_Angeles`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 4 > (property) user_location > (property) timezone>)
type: optional "approximate"
The type of location approximation. Always `approximate`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 4 > (property) user_location > (property) type>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 4 > (property) user_location>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 4>)
Mcp object { server\_label, type, allowed\_tools, 7 more }
Give the model access to additional tools via remote Model Context Protocol
(MCP) servers. [Learn more about MCP](/docs/guides/tools-remote-mcp).
server\_label: string
A label for this MCP server, used to identify it in tool calls.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 5 > (property) server_label>)
type: "mcp"
The type of the MCP tool. Always `mcp`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 5 > (property) type>)
allowed\_tools: optional array of string or object { read\_only, tool\_names }
List of allowed tool names or a filter object.
One of the following:
McpAllowedTools = array of string
A string array of allowed tool names
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 5 > (property) allowed_tools > (variant) 0>)
McpToolFilter object { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only: optional boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 5 > (property) allowed_tools > (variant) 1 > (property) read_only>)
tool\_names: optional array of string
List of allowed tool names.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 5 > (property) allowed_tools > (variant) 1 > (property) tool_names>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 5 > (property) allowed_tools > (variant) 1>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 5 > (property) allowed_tools>)
authorization: optional string
An OAuth access token that can be used with a remote MCP server, either
with a custom MCP server URL or a service connector. Your application
must handle the OAuth authorization flow and provide the token here.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 5 > (property) authorization>)
connector\_id: optional "connector\_dropbox" or "connector\_gmail" or "connector\_googlecalendar" or 5 more
Identifier for service connectors, like those available in ChatGPT. One of
`server\_url` or `connector\_id` must be provided. Learn more about service
connectors [here](/docs/guides/tools-remote-mcp#connectors).
Currently supported `connector\_id` values are:
* Dropbox: `connector\_dropbox`
* Gmail: `connector\_gmail`
* Google Calendar: `connector\_googlecalendar`
* Google Drive: `connector\_googledrive`
* Microsoft Teams: `connector\_microsoftteams`
* Outlook Calendar: `connector\_outlookcalendar`
* Outlook Email: `connector\_outlookemail`
* SharePoint: `connector\_sharepoint`
One of the following:
"connector\_dropbox"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 0>)
"connector\_gmail"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 1>)
"connector\_googlecalendar"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 2>)
"connector\_googledrive"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 3>)
"connector\_microsoftteams"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 4>)
"connector\_outlookcalendar"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 5>)
"connector\_outlookemail"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 6>)
"connector\_sharepoint"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 5 > (property) connector_id > (member) 7>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 5 > (property) connector_id>)
defer\_loading: optional boolean
Whether this MCP tool is deferred and discovered via tool search.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 5 > (property) defer_loading>)
headers: optional map[string]
Optional HTTP headers to send to the MCP server. Use for authentication
or other purposes.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 5 > (property) headers>)
require\_approval: optional object { always, never } or "always" or "never"
Specify which of the MCP server’s tools require approval.
One of the following:
McpToolApprovalFilter object { always, never }
Specify which of the MCP server’s tools require approval. Can be
`always`, `never`, or a filter object associated with tools
that require approval.
always: optional object { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only: optional boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 0 > (property) always > (property) read_only>)
tool\_names: optional array of string
List of allowed tool names.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 0 > (property) always > (property) tool_names>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 0 > (property) always>)
never: optional object { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only: optional boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 0 > (property) never > (property) read_only>)
tool\_names: optional array of string
List of allowed tool names.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 0 > (property) never > (property) tool_names>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 0 > (property) never>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 0>)
McpToolApprovalSetting = "always" or "never"
Specify a single approval policy for all tools. One of `always` or
`never`. When set to `always`, all tools will require approval. When
set to `never`, all tools will not require approval.
One of the following:
"always"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 1 > (member) 0>)
"never"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 1 > (member) 1>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 5 > (property) require_approval > (variant) 1>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 5 > (property) require_approval>)
server\_description: optional string
Optional description of the MCP server, used to provide more context.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 5 > (property) server_description>)
server\_url: optional string
The URL for the MCP server. One of `server\_url` or `connector\_id` must be
provided.
formaturi
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 5 > (property) server_url>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 5>)
CodeInterpreter object { container, type }
A tool that runs Python code to help generate a response to a prompt.
container: string or object { type, file\_ids, memory\_limit, network\_policy }
The code interpreter container. Can be a container ID or an object that
specifies uploaded file IDs to make available to your code, along with an
optional `memory\_limit` setting.
One of the following:
string
The container ID.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 6 > (property) container > (variant) 0>)
CodeInterpreterToolAuto object { type, file\_ids, memory\_limit, network\_policy }
Configuration for a code interpreter container. Optionally specify the IDs of the files to run the code on.
type: "auto"
Always `auto`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) type>)
file\_ids: optional array of string
An optional list of uploaded files to make available to your code.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) file_ids>)
memory\_limit: optional "1g" or "4g" or "16g" or "64g"
The memory limit for the code interpreter container.
One of the following:
"1g"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 0>)
"4g"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 1>)
"16g"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 2>)
"64g"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 3>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit>)
network\_policy: optional [ContainerNetworkPolicyDisabled](</api/reference/resources/responses#(resource) responses > (model) container_network_policy_disabled > (schema)>) { type } or [ContainerNetworkPolicyAllowlist](</api/reference/resources/responses#(resource) responses > (model) container_network_policy_allowlist > (schema)>) { allowed\_domains, type, domain\_secrets }
Network access policy for the container.
One of the following:
ContainerNetworkPolicyDisabled object { type }
type: "disabled"
Disable outbound network access. Always `disabled`.
[](<#(resource) responses > (model) container_network_policy_disabled > (schema) > (property) type>)
[](<#(resource) responses > (model) container_network_policy_disabled > (schema)>)
ContainerNetworkPolicyAllowlist object { allowed\_domains, type, domain\_secrets }
allowed\_domains: array of string
A list of allowed domains when type is `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) allowed_domains>)
type: "allowlist"
Allow outbound network access only to specified domains. Always `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) type>)
domain\_secrets: optional array of [ContainerNetworkPolicyDomainSecret](</api/reference/resources/responses#(resource) responses > (model) container_network_policy_domain_secret > (schema)>) { domain, name, value }
Optional domain-scoped secrets for allowlisted domains.
domain: string
The domain associated with the secret.
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) domain>)
name: string
The name of the secret to inject for the domain.
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) name>)
value: string
The secret value to inject for the domain.
maxLength10485760
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) value>)
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) domain_secrets>)
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema)>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1 > (property) network_policy>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 6 > (property) container > (variant) 1>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 6 > (property) container>)
type: "code\_interpreter"
The type of the code interpreter tool. Always `code\_interpreter`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 6 > (property) type>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 6>)
ImageGeneration object { type, action, background, 9 more }
A tool that generates images using the GPT image models.
type: "image\_generation"
The type of the image generation tool. Always `image\_generation`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 7 > (property) type>)
action: optional "generate" or "edit" or "auto"
Whether to generate a new image or edit an existing image. Default: `auto`.
One of the following:
"generate"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 7 > (property) action > (member) 0>)
"edit"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 7 > (property) action > (member) 1>)
"auto"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 7 > (property) action > (member) 2>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 7 > (property) action>)
background: optional "transparent" or "opaque" or "auto"
Background type for the generated image. One of `transparent`,
`opaque`, or `auto`. Default: `auto`.
One of the following:
"transparent"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 7 > (property) background > (member) 0>)
"opaque"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 7 > (property) background > (member) 1>)
"auto"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 7 > (property) background > (member) 2>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 7 > (property) background>)
input\_fidelity: optional "high" or "low"
Control how much effort the model will exert to match the style and features, especially facial features, of input images. This parameter is only supported for `gpt-image-1` and `gpt-image-1.5` and later models, unsupported for `gpt-image-1-mini`. Supports `high` and `low`. Defaults to `low`.
One of the following:
"high"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 7 > (property) input_fidelity > (member) 0>)
"low"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 7 > (property) input_fidelity > (member) 1>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 7 > (property) input_fidelity>)
input\_image\_mask: optional object { file\_id, image\_url }
Optional mask for inpainting. Contains `image\_url`
(string, optional) and `file\_id` (string, optional).
file\_id: optional string
File ID for the mask image.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 7 > (property) input_image_mask > (property) file_id>)
image\_url: optional string
Base64-encoded mask image.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 7 > (property) input_image_mask > (property) image_url>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 7 > (property) input_image_mask>)
model: optional string or "gpt-image-1" or "gpt-image-1-mini" or "gpt-image-1.5"
The image generation model to use. Default: `gpt-image-1`.
One of the following:
string
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 7 > (property) model > (variant) 0>)
"gpt-image-1" or "gpt-image-1-mini" or "gpt-image-1.5"
The image generation model to use. Default: `gpt-image-1`.
One of the following:
"gpt-image-1"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 7 > (property) model > (variant) 1 > (member) 0>)
"gpt-image-1-mini"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 7 > (property) model > (variant) 1 > (member) 1>)
"gpt-image-1.5"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 7 > (property) model > (variant) 1 > (member) 2>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 7 > (property) model > (variant) 1>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 7 > (property) model>)
moderation: optional "auto" or "low"
Moderation level for the generated image. Default: `auto`.
One of the following:
"auto"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 7 > (property) moderation > (member) 0>)
"low"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 7 > (property) moderation > (member) 1>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 7 > (property) moderation>)
output\_compression: optional number
Compression level for the output image. Default: 100.
minimum0
maximum100
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 7 > (property) output_compression>)
output\_format: optional "png" or "webp" or "jpeg"
The output format of the generated image. One of `png`, `webp`, or
`jpeg`. Default: `png`.
One of the following:
"png"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 7 > (property) output_format > (member) 0>)
"webp"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 7 > (property) output_format > (member) 1>)
"jpeg"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 7 > (property) output_format > (member) 2>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 7 > (property) output_format>)
partial\_images: optional number
Number of partial images to generate in streaming mode, from 0 (default value) to 3.
minimum0
maximum3
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 7 > (property) partial_images>)
quality: optional "low" or "medium" or "high" or "auto"
The quality of the generated image. One of `low`, `medium`, `high`,
or `auto`. Default: `auto`.
One of the following:
"low"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 7 > (property) quality > (member) 0>)
"medium"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 7 > (property) quality > (member) 1>)
"high"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 7 > (property) quality > (member) 2>)
"auto"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 7 > (property) quality > (member) 3>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 7 > (property) quality>)
size: optional "1024x1024" or "1024x1536" or "1536x1024" or "auto"
The size of the generated image. One of `1024x1024`, `1024x1536`,
`1536x1024`, or `auto`. Default: `auto`.
One of the following:
"1024x1024"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 7 > (property) size > (member) 0>)
"1024x1536"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 7 > (property) size > (member) 1>)
"1536x1024"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 7 > (property) size > (member) 2>)
"auto"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 7 > (property) size > (member) 3>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 7 > (property) size>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 7>)
LocalShell object { type }
A tool that allows the model to execute shell commands in a local environment.
type: "local\_shell"
The type of the local shell tool. Always `local\_shell`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 8 > (property) type>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 8>)
Shell object { type, environment }
A tool that allows the model to execute shell commands.
type: "shell"
The type of the shell tool. Always `shell`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 9 > (property) type>)
environment: optional [ContainerAuto](</api/reference/resources/responses#(resource) responses > (model) container_auto > (schema)>) { type, file\_ids, memory\_limit, 2 more } or [LocalEnvironment](</api/reference/resources/responses#(resource) responses > (model) local_environment > (schema)>) { type, skills } or [ContainerReference](</api/reference/resources/responses#(resource) responses > (model) container_reference > (schema)>) { container\_id, type }
One of the following:
ContainerAuto object { type, file\_ids, memory\_limit, 2 more }
type: "container\_auto"
Automatically creates a container for this request
[](<#(resource) responses > (model) container_auto > (schema) > (property) type>)
file\_ids: optional array of string
An optional list of uploaded files to make available to your code.
[](<#(resource) responses > (model) container_auto > (schema) > (property) file_ids>)
memory\_limit: optional "1g" or "4g" or "16g" or "64g"
The memory limit for the container.
One of the following:
"1g"
[](<#(resource) responses > (model) container_auto > (schema) > (property) memory_limit > (member) 0>)
"4g"
[](<#(resource) responses > (model) container_auto > (schema) > (property) memory_limit > (member) 1>)
"16g"
[](<#(resource) responses > (model) container_auto > (schema) > (property) memory_limit > (member) 2>)
"64g"
[](<#(resource) responses > (model) container_auto > (schema) > (property) memory_limit > (member) 3>)
[](<#(resource) responses > (model) container_auto > (schema) > (property) memory_limit>)
network\_policy: optional [ContainerNetworkPolicyDisabled](</api/reference/resources/responses#(resource) responses > (model) container_network_policy_disabled > (schema)>) { type } or [ContainerNetworkPolicyAllowlist](</api/reference/resources/responses#(resource) responses > (model) container_network_policy_allowlist > (schema)>) { allowed\_domains, type, domain\_secrets }
Network access policy for the container.
One of the following:
ContainerNetworkPolicyDisabled object { type }
type: "disabled"
Disable outbound network access. Always `disabled`.
[](<#(resource) responses > (model) container_network_policy_disabled > (schema) > (property) type>)
[](<#(resource) responses > (model) container_network_policy_disabled > (schema)>)
ContainerNetworkPolicyAllowlist object { allowed\_domains, type, domain\_secrets }
allowed\_domains: array of string
A list of allowed domains when type is `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) allowed_domains>)
type: "allowlist"
Allow outbound network access only to specified domains. Always `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) type>)
domain\_secrets: optional array of [ContainerNetworkPolicyDomainSecret](</api/reference/resources/responses#(resource) responses > (model) container_network_policy_domain_secret > (schema)>) { domain, name, value }
Optional domain-scoped secrets for allowlisted domains.
domain: string
The domain associated with the secret.
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) domain>)
name: string
The name of the secret to inject for the domain.
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) name>)
value: string
The secret value to inject for the domain.
maxLength10485760
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) value>)
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) domain_secrets>)
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema)>)
[](<#(resource) responses > (model) container_auto > (schema) > (property) network_policy>)
skills: optional array of [SkillReference](</api/reference/resources/responses#(resource) responses > (model) skill_reference > (schema)>) { skill\_id, type, version } or [InlineSkill](</api/reference/resources/responses#(resource) responses > (model) inline_skill > (schema)>) { description, name, source, type }
An optional list of skills referenced by id or inline data.
One of the following:
SkillReference object { skill\_id, type, version }
skill\_id: string
The ID of the referenced skill.
maxLength64
minLength1
[](<#(resource) responses > (model) skill_reference > (schema) > (property) skill_id>)
type: "skill\_reference"
References a skill created with the /v1/skills endpoint.
[](<#(resource) responses > (model) skill_reference > (schema) > (property) type>)
version: optional string
Optional skill version. Use a positive integer or ‘latest’. Omit for default.
[](<#(resource) responses > (model) skill_reference > (schema) > (property) version>)
[](<#(resource) responses > (model) skill_reference > (schema)>)
InlineSkill object { description, name, source, type }
description: string
The description of the skill.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) description>)
name: string
The name of the skill.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) name>)
source: [InlineSkillSource](</api/reference/resources/responses#(resource) responses > (model) inline_skill_source > (schema)>) { data, media\_type, type }
Inline skill payload
data: string
Base64-encoded skill zip bundle.
maxLength70254592
minLength1
[](<#(resource) responses > (model) inline_skill > (schema) > (property) source + (resource) responses > (model) inline_skill_source > (schema) > (property) data>)
media\_type: "application/zip"
The media type of the inline skill payload. Must be `application/zip`.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) source + (resource) responses > (model) inline_skill_source > (schema) > (property) media_type>)
type: "base64"
The type of the inline skill source. Must be `base64`.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) source + (resource) responses > (model) inline_skill_source > (schema) > (property) type>)
[](<#(resource) responses > (model) inline_skill > (schema) > (property) source>)
type: "inline"
Defines an inline skill for this request.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) type>)
[](<#(resource) responses > (model) inline_skill > (schema)>)
[](<#(resource) responses > (model) container_auto > (schema) > (property) skills>)
[](<#(resource) responses > (model) container_auto > (schema)>)
LocalEnvironment object { type, skills }
type: "local"
Use a local computer environment.
[](<#(resource) responses > (model) local_environment > (schema) > (property) type>)
skills: optional array of [LocalSkill](</api/reference/resources/responses#(resource) responses > (model) local_skill > (schema)>) { description, name, path }
An optional list of skills.
description: string
The description of the skill.
[](<#(resource) responses > (model) local_skill > (schema) > (property) description>)
name: string
The name of the skill.
[](<#(resource) responses > (model) local_skill > (schema) > (property) name>)
path: string
The path to the directory containing the skill.
[](<#(resource) responses > (model) local_skill > (schema) > (property) path>)
[](<#(resource) responses > (model) local_environment > (schema) > (property) skills>)
[](<#(resource) responses > (model) local_environment > (schema)>)
ContainerReference object { container\_id, type }
container\_id: string
The ID of the referenced container.
[](<#(resource) responses > (model) container_reference > (schema) > (property) container_id>)
type: "container\_reference"
References a container created with the /v1/containers endpoint
[](<#(resource) responses > (model) container_reference > (schema) > (property) type>)
[](<#(resource) responses > (model) container_reference > (schema)>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 9 > (property) environment>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 9>)
Custom object { name, type, defer\_loading, 2 more }
A custom tool that processes input using a specified format. Learn more about [custom tools](/docs/guides/function-calling#custom-tools)
name: string
The name of the custom tool, used to identify it in tool calls.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 10 > (property) name>)
type: "custom"
The type of the custom tool. Always `custom`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 10 > (property) type>)
defer\_loading: optional boolean
Whether this tool should be deferred and discovered via tool search.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 10 > (property) defer_loading>)
description: optional string
Optional description of the custom tool, used to provide more context.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 10 > (property) description>)
format: optional [CustomToolInputFormat](</api/reference/resources/$shared#(resource) $shared > (model) custom_tool_input_format > (schema)>)
The input format for the custom tool. Default is unconstrained text.
One of the following:
Text object { type }
Unconstrained free-form text.
type: "text"
Unconstrained text format. Always `text`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 10 > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 0 > (property) type>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 10 > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 0>)
Grammar object { definition, syntax, type }
A grammar defined by the user.
definition: string
The grammar definition.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 10 > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) definition>)
syntax: "lark" or "regex"
The syntax of the grammar definition. One of `lark` or `regex`.
One of the following:
"lark"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 10 > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax > (member) 0>)
"regex"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 10 > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax > (member) 1>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 10 > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax>)
type: "grammar"
Grammar format. Always `grammar`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 10 > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) type>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 10 > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 10 > (property) format>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 10>)
Namespace object { description, name, tools, type }
Groups function/custom tools under a shared namespace.
description: string
A description of the namespace shown to the model.
minLength1
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 11 > (property) description>)
name: string
The namespace name used in tool calls (for example, `crm`).
minLength1
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 11 > (property) name>)
tools: array of object { name, type, defer\_loading, 3 more } or object { name, type, defer\_loading, 2 more }
The function/custom tools available inside this namespace.
One of the following:
Function object { name, type, defer\_loading, 3 more }
name: string
maxLength128
minLength1
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 0 > (property) name>)
type: "function"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 0 > (property) type>)
defer\_loading: optional boolean
Whether this function should be deferred and discovered via tool search.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 0 > (property) defer_loading>)
description: optional string
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 0 > (property) description>)
parameters: optional unknown
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 0 > (property) parameters>)
strict: optional boolean
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 0 > (property) strict>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 0>)
Custom object { name, type, defer\_loading, 2 more }
A custom tool that processes input using a specified format. Learn more about [custom tools](/docs/guides/function-calling#custom-tools)
name: string
The name of the custom tool, used to identify it in tool calls.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1 > (property) name>)
type: "custom"
The type of the custom tool. Always `custom`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1 > (property) type>)
defer\_loading: optional boolean
Whether this tool should be deferred and discovered via tool search.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1 > (property) defer_loading>)
description: optional string
Optional description of the custom tool, used to provide more context.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1 > (property) description>)
format: optional [CustomToolInputFormat](</api/reference/resources/$shared#(resource) $shared > (model) custom_tool_input_format > (schema)>)
The input format for the custom tool. Default is unconstrained text.
One of the following:
Text object { type }
Unconstrained free-form text.
type: "text"
Unconstrained text format. Always `text`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1 > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 0 > (property) type>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1 > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 0>)
Grammar object { definition, syntax, type }
A grammar defined by the user.
definition: string
The grammar definition.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1 > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) definition>)
syntax: "lark" or "regex"
The syntax of the grammar definition. One of `lark` or `regex`.
One of the following:
"lark"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1 > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax > (member) 0>)
"regex"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1 > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax > (member) 1>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1 > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax>)
type: "grammar"
Grammar format. Always `grammar`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1 > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) type>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1 > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1 > (property) format>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 11 > (property) tools > (items) > (variant) 1>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 11 > (property) tools>)
type: "namespace"
The type of the tool. Always `namespace`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 11 > (property) type>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 11>)
ToolSearch object { type, description, execution, parameters }
Hosted or BYOT tool search configuration for deferred tools.
type: "tool\_search"
The type of the tool. Always `tool\_search`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 12 > (property) type>)
description: optional string
Description shown to the model for a client-executed tool search tool.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 12 > (property) description>)
execution: optional "server" or "client"
Whether tool search is executed by the server or by the client.
One of the following:
"server"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 12 > (property) execution > (member) 0>)
"client"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 12 > (property) execution > (member) 1>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 12 > (property) execution>)
parameters: optional unknown
Parameter schema for a client-executed tool search tool.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 12 > (property) parameters>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 12>)
WebSearchPreview object { type, search\_content\_types, search\_context\_size, user\_location }
This tool searches the web for relevant results to use in a response. Learn more about the [web search tool](https://platform.openai.com/docs/guides/tools-web-search).
type: "web\_search\_preview" or "web\_search\_preview\_2025\_03\_11"
The type of the web search tool. One of `web\_search\_preview` or `web\_search\_preview\_2025\_03\_11`.
One of the following:
"web\_search\_preview"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 13 > (property) type > (member) 0>)
"web\_search\_preview\_2025\_03\_11"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 13 > (property) type > (member) 1>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 13 > (property) type>)
search\_content\_types: optional array of "text" or "image"
One of the following:
"text"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 13 > (property) search_content_types > (items) > (member) 0>)
"image"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 13 > (property) search_content_types > (items) > (member) 1>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 13 > (property) search_content_types>)
search\_context\_size: optional "low" or "medium" or "high"
High level guidance for the amount of context window space to use for the search. One of `low`, `medium`, or `high`. `medium` is the default.
One of the following:
"low"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 13 > (property) search_context_size > (member) 0>)
"medium"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 13 > (property) search_context_size > (member) 1>)
"high"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 13 > (property) search_context_size > (member) 2>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 13 > (property) search_context_size>)
user\_location: optional object { type, city, country, 2 more }
The user’s location.
type: "approximate"
The type of location approximation. Always `approximate`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 13 > (property) user_location > (property) type>)
city: optional string
Free text input for the city of the user, e.g. `San Francisco`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 13 > (property) user_location > (property) city>)
country: optional string
The two-letter [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1) of the user, e.g. `US`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 13 > (property) user_location > (property) country>)
region: optional string
Free text input for the region of the user, e.g. `California`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 13 > (property) user_location > (property) region>)
timezone: optional string
The [IANA timezone](https://timeapi.io/documentation/iana-timezones) of the user, e.g. `America/Los\_Angeles`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 13 > (property) user_location > (property) timezone>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 13 > (property) user_location>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 13>)
ApplyPatch object { type }
Allows the assistant to create, delete, or update files using unified diffs.
type: "apply\_patch"
The type of the tool. Always `apply\_patch`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 14 > (property) type>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools > (items) > (variant) 14>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) tools>)
type: "tool\_search\_output"
The type of the item. Always `tool\_search\_output`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) type>)
created\_by: optional string
The identifier of the actor that created the item.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3 > (property) created_by>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 3>)
FunctionCallOutput object { call\_id, output, type, 2 more }
The output of a function tool call.
call\_id: string
The unique ID of the function tool call generated by the model.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 4 > (property) call_id>)
output: string or array of [ResponseInputText](</api/reference/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } or [ResponseInputImage](</api/reference/resources/responses#(resource) responses > (model) response_input_image > (schema)>) { detail, type, file\_id, image\_url } or [ResponseInputFile](</api/reference/resources/responses#(resource) responses > (model) response_input_file > (schema)>) { type, detail, file\_data, 3 more }
The output from the function call generated by your code.
Can be a string or an list of output content.
One of the following:
StringOutput = string
A string of the output of the function call.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 4 > (property) output > (variant) 0>)
OutputContentList = array of [ResponseInputText](</api/reference/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } or [ResponseInputImage](</api/reference/resources/responses#(resource) responses > (model) response_input_image > (schema)>) { detail, type, file\_id, image\_url } or [ResponseInputFile](</api/reference/resources/responses#(resource) responses > (model) response_input_file > (schema)>) { type, detail, file\_data, 3 more }
Text, image, or file output of the function call.
One of the following:
ResponseInputText object { text, type }
A text input to the model.
text: string
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
type: "input\_text"
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
ResponseInputImage object { detail, type, file\_id, image\_url }
An image input to the model. Learn about [image inputs](/docs/guides/vision).
detail: "low" or "high" or "auto" or "original"
The detail level of the image to be sent to the model. One of `high`, `low`, `auto`, or `original`. Defaults to `auto`.
One of the following:
"low"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 0>)
"high"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 1>)
"auto"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 2>)
"original"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 3>)
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail>)
type: "input\_image"
The type of the input item. Always `input\_image`.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) type>)
file\_id: optional string
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) file_id>)
image\_url: optional string
The URL of the image to be sent to the model. A fully qualified URL or base64 encoded image in a data URL.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) image_url>)
[](<#(resource) responses > (model) response_input_image > (schema)>)
ResponseInputFile object { type, detail, file\_data, 3 more }
A file input to the model.
type: "input\_file"
The type of the input item. Always `input\_file`.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) type>)
detail: optional "low" or "high"
The detail level of the file to be sent to the model. Use `low` for the default rendering behavior, or `high` to render the file at higher quality. Defaults to `low`.
One of the following:
"low"
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 0>)
"high"
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 1>)
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail>)
file\_data: optional string
The content of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_data>)
file\_id: optional string
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_id>)
file\_url: optional string
The URL of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_url>)
filename: optional string
The name of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) filename>)
[](<#(resource) responses > (model) response_input_file > (schema)>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 4 > (property) output > (variant) 1>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 4 > (property) output>)
type: "function\_call\_output"
The type of the function tool call output. Always `function\_call\_output`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 4 > (property) type>)
id: optional string
The unique ID of the function tool call output. Populated when this item
is returned via API.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 4 > (property) id>)
status: optional "in\_progress" or "completed" or "incomplete"
The status of the item. One of `in\_progress`, `completed`, or
`incomplete`. Populated when items are returned via API.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 4 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 4 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 4 > (property) status > (member) 2>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 4 > (property) status>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 4>)
FileSearchCall object { id, queries, status, 2 more }
The results of a file search tool call. See the
[file search guide](/docs/guides/tools-file-search) for more information.
id: string
The unique ID of the file search tool call.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 5 > (property) id>)
queries: array of string
The queries used to search for files.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 5 > (property) queries>)
status: "in\_progress" or "searching" or "completed" or 2 more
The status of the file search tool call. One of `in\_progress`,
`searching`, `incomplete` or `failed`,
One of the following:
"in\_progress"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 5 > (property) status > (member) 0>)
"searching"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 5 > (property) status > (member) 1>)
"completed"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 5 > (property) status > (member) 2>)
"incomplete"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 5 > (property) status > (member) 3>)
"failed"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 5 > (property) status > (member) 4>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 5 > (property) status>)
type: "file\_search\_call"
The type of the file search tool call. Always `file\_search\_call`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 5 > (property) type>)
results: optional array of object { attributes, file\_id, filename, 2 more }
The results of the file search tool call.
attributes: optional map[string or number or boolean]
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard. Keys are strings
with a maximum length of 64 characters. Values are strings with a maximum
length of 512 characters, booleans, or numbers.
One of the following:
string
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 5 > (property) results > (items) > (property) attributes > (items) > (variant) 0>)
number
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 5 > (property) results > (items) > (property) attributes > (items) > (variant) 1>)
boolean
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 5 > (property) results > (items) > (property) attributes > (items) > (variant) 2>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 5 > (property) results > (items) > (property) attributes>)
file\_id: optional string
The unique ID of the file.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 5 > (property) results > (items) > (property) file_id>)
filename: optional string
The name of the file.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 5 > (property) results > (items) > (property) filename>)
score: optional number
The relevance score of the file - a value between 0 and 1.
formatfloat
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 5 > (property) results > (items) > (property) score>)
text: optional string
The text that was retrieved from the file.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 5 > (property) results > (items) > (property) text>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 5 > (property) results>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 5>)
WebSearchCall object { id, action, status, type }
The results of a web search tool call. See the
[web search guide](/docs/guides/tools-web-search) for more information.
id: string
The unique ID of the web search tool call.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 6 > (property) id>)
action: object { query, type, queries, sources } or object { type, url } or object { pattern, type, url }
An object describing the specific action taken in this web search call.
Includes details on how the model used the web (search, open\_page, find\_in\_page).
One of the following:
Search object { query, type, queries, sources }
Action type “search” - Performs a web search query.
query: string
[DEPRECATED] The search query.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 6 > (property) action > (variant) 0 > (property) query>)
type: "search"
The action type.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 6 > (property) action > (variant) 0 > (property) type>)
queries: optional array of string
The search queries.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 6 > (property) action > (variant) 0 > (property) queries>)
sources: optional array of object { type, url }
The sources used in the search.
type: "url"
The type of source. Always `url`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 6 > (property) action > (variant) 0 > (property) sources > (items) > (property) type>)
url: string
The URL of the source.
formaturi
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 6 > (property) action > (variant) 0 > (property) sources > (items) > (property) url>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 6 > (property) action > (variant) 0 > (property) sources>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 6 > (property) action > (variant) 0>)
OpenPage object { type, url }
Action type “open\_page” - Opens a specific URL from search results.
type: "open\_page"
The action type.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 6 > (property) action > (variant) 1 > (property) type>)
url: optional string
The URL opened by the model.
formaturi
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 6 > (property) action > (variant) 1 > (property) url>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 6 > (property) action > (variant) 1>)
FindInPage object { pattern, type, url }
Action type “find\_in\_page”: Searches for a pattern within a loaded page.
pattern: string
The pattern or text to search for within the page.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 6 > (property) action > (variant) 2 > (property) pattern>)
type: "find\_in\_page"
The action type.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 6 > (property) action > (variant) 2 > (property) type>)
url: string
The URL of the page searched for the pattern.
formaturi
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 6 > (property) action > (variant) 2 > (property) url>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 6 > (property) action > (variant) 2>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 6 > (property) action>)
status: "in\_progress" or "searching" or "completed" or "failed"
The status of the web search tool call.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 6 > (property) status > (member) 0>)
"searching"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 6 > (property) status > (member) 1>)
"completed"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 6 > (property) status > (member) 2>)
"failed"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 6 > (property) status > (member) 3>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 6 > (property) status>)
type: "web\_search\_call"
The type of the web search tool call. Always `web\_search\_call`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 6 > (property) type>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 6>)
ImageGenerationCall object { id, result, status, type }
An image generation request made by the model.
id: string
The unique ID of the image generation call.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 7 > (property) id>)
result: string
The generated image encoded in base64.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 7 > (property) result>)
status: "in\_progress" or "completed" or "generating" or "failed"
The status of the image generation call.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 7 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 7 > (property) status > (member) 1>)
"generating"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 7 > (property) status > (member) 2>)
"failed"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 7 > (property) status > (member) 3>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 7 > (property) status>)
type: "image\_generation\_call"
The type of the image generation call. Always `image\_generation\_call`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 7 > (property) type>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 7>)
ComputerCall object { id, call\_id, pending\_safety\_checks, 4 more }
A tool call to a computer use tool. See the
[computer use guide](/docs/guides/tools-computer-use) for more information.
id: string
The unique ID of the computer call.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) id>)
call\_id: string
An identifier used when responding to the tool call with output.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) call_id>)
pending\_safety\_checks: array of object { id, code, message }
The pending safety checks for the computer call.
id: string
The ID of the pending safety check.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) pending_safety_checks > (items) > (property) id>)
code: optional string
The type of the pending safety check.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) pending_safety_checks > (items) > (property) code>)
message: optional string
Details about the pending safety check.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) pending_safety_checks > (items) > (property) message>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) pending_safety_checks>)
status: "in\_progress" or "completed" or "incomplete"
The status of the item. One of `in\_progress`, `completed`, or
`incomplete`. Populated when items are returned via API.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) status > (member) 2>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) status>)
type: "computer\_call"
The type of the computer call. Always `computer\_call`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) type>)
action: optional [ComputerAction](</api/reference/resources/responses#(resource) responses > (model) computer_action > (schema)>)
A click action.
One of the following:
Click object { button, type, x, 2 more }
A click action.
button: "left" or "right" or "wheel" or 2 more
Indicates which mouse button was pressed during the click. One of `left`, `right`, `wheel`, `back`, or `forward`.
One of the following:
"left"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) button > (member) 0>)
"right"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) button > (member) 1>)
"wheel"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) button > (member) 2>)
"back"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) button > (member) 3>)
"forward"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) button > (member) 4>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) button>)
type: "click"
Specifies the event type. For a click action, this property is always `click`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) type>)
x: number
The x-coordinate where the click occurred.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) x>)
y: number
The y-coordinate where the click occurred.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) y>)
keys: optional array of string
The keys being held while clicking.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) keys>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 0>)
DoubleClick object { keys, type, x, y }
A double click action.
keys: array of string
The keys being held while double-clicking.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 1 > (property) keys>)
type: "double\_click"
Specifies the event type. For a double click action, this property is always set to `double\_click`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 1 > (property) type>)
x: number
The x-coordinate where the double click occurred.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 1 > (property) x>)
y: number
The y-coordinate where the double click occurred.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 1 > (property) y>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 1>)
Drag object { path, type, keys }
A drag action.
path: array of object { x, y }
An array of coordinates representing the path of the drag action. Coordinates will appear as an array of objects, eg
```
`[
{ x: 100, y: 200 },
{ x: 200, y: 300 }
]`
```
x: number
The x-coordinate.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 2 > (property) path > (items) > (property) x>)
y: number
The y-coordinate.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 2 > (property) path > (items) > (property) y>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 2 > (property) path>)
type: "drag"
Specifies the event type. For a drag action, this property is always set to `drag`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 2 > (property) type>)
keys: optional array of string
The keys being held while dragging the mouse.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 2 > (property) keys>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 2>)
Keypress object { keys, type }
A collection of keypresses the model would like to perform.
keys: array of string
The combination of keys the model is requesting to be pressed. This is an array of strings, each representing a key.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 3 > (property) keys>)
type: "keypress"
Specifies the event type. For a keypress action, this property is always set to `keypress`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 3 > (property) type>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 3>)
Move object { type, x, y, keys }
A mouse move action.
type: "move"
Specifies the event type. For a move action, this property is always set to `move`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 4 > (property) type>)
x: number
The x-coordinate to move to.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 4 > (property) x>)
y: number
The y-coordinate to move to.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 4 > (property) y>)
keys: optional array of string
The keys being held while moving the mouse.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 4 > (property) keys>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 4>)
Screenshot object { type }
A screenshot action.
type: "screenshot"
Specifies the event type. For a screenshot action, this property is always set to `screenshot`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 5 > (property) type>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 5>)
Scroll object { scroll\_x, scroll\_y, type, 3 more }
A scroll action.
scroll\_x: number
The horizontal scroll distance.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 6 > (property) scroll_x>)
scroll\_y: number
The vertical scroll distance.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 6 > (property) scroll_y>)
type: "scroll"
Specifies the event type. For a scroll action, this property is always set to `scroll`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 6 > (property) type>)
x: number
The x-coordinate where the scroll occurred.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 6 > (property) x>)
y: number
The y-coordinate where the scroll occurred.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 6 > (property) y>)
keys: optional array of string
The keys being held while scrolling.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 6 > (property) keys>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 6>)
Type object { text, type }
An action to type in text.
text: string
The text to type.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 7 > (property) text>)
type: "type"
Specifies the event type. For a type action, this property is always set to `type`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 7 > (property) type>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 7>)
Wait object { type }
A wait action.
type: "wait"
Specifies the event type. For a wait action, this property is always set to `wait`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 8 > (property) type>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) action + (resource) responses > (model) computer_action > (schema) > (variant) 8>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) action>)
actions: optional [ComputerActionList](</api/reference/resources/responses#(resource) responses > (model) computer_action_list > (schema)>) { Click, DoubleClick, Drag, 6 more }
Flattened batched actions for `computer\_use`. Each action includes an
`type` discriminator and action-specific fields.
One of the following:
Click object { button, type, x, 2 more }
A click action.
button: "left" or "right" or "wheel" or 2 more
Indicates which mouse button was pressed during the click. One of `left`, `right`, `wheel`, `back`, or `forward`.
One of the following:
"left"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) button > (member) 0>)
"right"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) button > (member) 1>)
"wheel"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) button > (member) 2>)
"back"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) button > (member) 3>)
"forward"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) button > (member) 4>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) button>)
type: "click"
Specifies the event type. For a click action, this property is always `click`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) type>)
x: number
The x-coordinate where the click occurred.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) x>)
y: number
The y-coordinate where the click occurred.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) y>)
keys: optional array of string
The keys being held while clicking.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) keys>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0>)
DoubleClick object { keys, type, x, y }
A double click action.
keys: array of string
The keys being held while double-clicking.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 1 > (property) keys>)
type: "double\_click"
Specifies the event type. For a double click action, this property is always set to `double\_click`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 1 > (property) type>)
x: number
The x-coordinate where the double click occurred.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 1 > (property) x>)
y: number
The y-coordinate where the double click occurred.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 1 > (property) y>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 1>)
Drag object { path, type, keys }
A drag action.
path: array of object { x, y }
An array of coordinates representing the path of the drag action. Coordinates will appear as an array of objects, eg
```
`[
{ x: 100, y: 200 },
{ x: 200, y: 300 }
]`
```
x: number
The x-coordinate.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 2 > (property) path > (items) > (property) x>)
y: number
The y-coordinate.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 2 > (property) path > (items) > (property) y>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 2 > (property) path>)
type: "drag"
Specifies the event type. For a drag action, this property is always set to `drag`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 2 > (property) type>)
keys: optional array of string
The keys being held while dragging the mouse.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 2 > (property) keys>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 2>)
Keypress object { keys, type }
A collection of keypresses the model would like to perform.
keys: array of string
The combination of keys the model is requesting to be pressed. This is an array of strings, each representing a key.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 3 > (property) keys>)
type: "keypress"
Specifies the event type. For a keypress action, this property is always set to `keypress`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 3 > (property) type>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 3>)
Move object { type, x, y, keys }
A mouse move action.
type: "move"
Specifies the event type. For a move action, this property is always set to `move`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 4 > (property) type>)
x: number
The x-coordinate to move to.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 4 > (property) x>)
y: number
The y-coordinate to move to.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 4 > (property) y>)
keys: optional array of string
The keys being held while moving the mouse.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 4 > (property) keys>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 4>)
Screenshot object { type }
A screenshot action.
type: "screenshot"
Specifies the event type. For a screenshot action, this property is always set to `screenshot`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 5 > (property) type>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 5>)
Scroll object { scroll\_x, scroll\_y, type, 3 more }
A scroll action.
scroll\_x: number
The horizontal scroll distance.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 6 > (property) scroll_x>)
scroll\_y: number
The vertical scroll distance.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 6 > (property) scroll_y>)
type: "scroll"
Specifies the event type. For a scroll action, this property is always set to `scroll`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 6 > (property) type>)
x: number
The x-coordinate where the scroll occurred.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 6 > (property) x>)
y: number
The y-coordinate where the scroll occurred.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 6 > (property) y>)
keys: optional array of string
The keys being held while scrolling.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 6 > (property) keys>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 6>)
Type object { text, type }
An action to type in text.
text: string
The text to type.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 7 > (property) text>)
type: "type"
Specifies the event type. For a type action, this property is always set to `type`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 7 > (property) type>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 7>)
Wait object { type }
A wait action.
type: "wait"
Specifies the event type. For a wait action, this property is always set to `wait`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 8 > (property) type>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 8>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8 > (property) actions>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 8>)
ComputerCallOutput object { id, call\_id, output, 4 more }
id: string
The unique ID of the computer call tool output.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 9 > (property) id>)
call\_id: string
The ID of the computer tool call that produced the output.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 9 > (property) call_id>)
output: [ResponseComputerToolCallOutputScreenshot](</api/reference/resources/responses#(resource) responses > (model) response_computer_tool_call_output_screenshot > (schema)>) { type, file\_id, image\_url }
A computer screenshot image used with the computer use tool.
type: "computer\_screenshot"
Specifies the event type. For a computer screenshot, this property is
always set to `computer\_screenshot`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 9 > (property) output + (resource) responses > (model) response_computer_tool_call_output_screenshot > (schema) > (property) type>)
file\_id: optional string
The identifier of an uploaded file that contains the screenshot.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 9 > (property) output + (resource) responses > (model) response_computer_tool_call_output_screenshot > (schema) > (property) file_id>)
image\_url: optional string
The URL of the screenshot image.
formaturi
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 9 > (property) output + (resource) responses > (model) response_computer_tool_call_output_screenshot > (schema) > (property) image_url>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 9 > (property) output>)
status: "completed" or "incomplete" or "failed" or "in\_progress"
The status of the message input. One of `in\_progress`, `completed`, or
`incomplete`. Populated when input items are returned via API.
One of the following:
"completed"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 9 > (property) status > (member) 0>)
"incomplete"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 9 > (property) status > (member) 1>)
"failed"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 9 > (property) status > (member) 2>)
"in\_progress"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 9 > (property) status > (member) 3>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 9 > (property) status>)
type: "computer\_call\_output"
The type of the computer tool call output. Always `computer\_call\_output`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 9 > (property) type>)
acknowledged\_safety\_checks: optional array of object { id, code, message }
The safety checks reported by the API that have been acknowledged by the
developer.
id: string
The ID of the pending safety check.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 9 > (property) acknowledged_safety_checks > (items) > (property) id>)
code: optional string
The type of the pending safety check.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 9 > (property) acknowledged_safety_checks > (items) > (property) code>)
message: optional string
Details about the pending safety check.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 9 > (property) acknowledged_safety_checks > (items) > (property) message>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 9 > (property) acknowledged_safety_checks>)
created\_by: optional string
The identifier of the actor that created the item.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 9 > (property) created_by>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 9>)
Reasoning object { id, summary, type, 3 more }
A description of the chain of thought used by a reasoning model while generating
a response. Be sure to include these items in your `input` to the Responses API
for subsequent turns of a conversation if you are manually
[managing context](/docs/guides/conversation-state).
id: string
The unique identifier of the reasoning content.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 10 > (property) id>)
summary: array of [SummaryTextContent](</api/reference/resources/conversations#(resource) conversations > (model) summary_text_content > (schema)>) { text, type }
Reasoning summary content.
text: string
A summary of the reasoning output from the model so far.
[](<#(resource) conversations > (model) summary_text_content > (schema) > (property) text>)
type: "summary\_text"
The type of the object. Always `summary\_text`.
[](<#(resource) conversations > (model) summary_text_content > (schema) > (property) type>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 10 > (property) summary>)
type: "reasoning"
The type of the object. Always `reasoning`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 10 > (property) type>)
content: optional array of object { text, type }
Reasoning text content.
text: string
The reasoning text from the model.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 10 > (property) content > (items) > (property) text>)
type: "reasoning\_text"
The type of the reasoning text. Always `reasoning\_text`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 10 > (property) content > (items) > (property) type>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 10 > (property) content>)
encrypted\_content: optional string
The encrypted content of the reasoning item - populated when a response is
generated with `reasoning.encrypted\_content` in the `include` parameter.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 10 > (property) encrypted_content>)
status: optional "in\_progress" or "completed" or "incomplete"
The status of the item. One of `in\_progress`, `completed`, or
`incomplete`. Populated when items are returned via API.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 10 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 10 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 10 > (property) status > (member) 2>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 10 > (property) status>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 10>)
Compaction object { id, encrypted\_content, type, created\_by }
A compaction item generated by the [`v1/responses/compact` API](/docs/api-reference/responses/compact).
id: string
The unique ID of the compaction item.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 11 > (property) id>)
encrypted\_content: string
The encrypted content that was produced by compaction.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 11 > (property) encrypted_content>)
type: "compaction"
The type of the item. Always `compaction`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 11 > (property) type>)
created\_by: optional string
The identifier of the actor that created the item.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 11 > (property) created_by>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 11>)
CodeInterpreterCall object { id, code, container\_id, 3 more }
A tool call to run code.
id: string
The unique ID of the code interpreter tool call.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 12 > (property) id>)
code: string
The code to run, or null if not available.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 12 > (property) code>)
container\_id: string
The ID of the container used to run the code.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 12 > (property) container_id>)
outputs: array of object { logs, type } or object { type, url }
The outputs generated by the code interpreter, such as logs or images.
Can be null if no outputs are available.
One of the following:
Logs object { logs, type }
The logs output from the code interpreter.
logs: string
The logs output from the code interpreter.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 12 > (property) outputs > (items) > (variant) 0 > (property) logs>)
type: "logs"
The type of the output. Always `logs`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 12 > (property) outputs > (items) > (variant) 0 > (property) type>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 12 > (property) outputs > (items) > (variant) 0>)
Image object { type, url }
The image output from the code interpreter.
type: "image"
The type of the output. Always `image`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 12 > (property) outputs > (items) > (variant) 1 > (property) type>)
url: string
The URL of the image output from the code interpreter.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 12 > (property) outputs > (items) > (variant) 1 > (property) url>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 12 > (property) outputs > (items) > (variant) 1>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 12 > (property) outputs>)
status: "in\_progress" or "completed" or "incomplete" or 2 more
The status of the code interpreter tool call. Valid values are `in\_progress`, `completed`, `incomplete`, `interpreting`, and `failed`.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 12 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 12 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 12 > (property) status > (member) 2>)
"interpreting"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 12 > (property) status > (member) 3>)
"failed"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 12 > (property) status > (member) 4>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 12 > (property) status>)
type: "code\_interpreter\_call"
The type of the code interpreter tool call. Always `code\_interpreter\_call`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 12 > (property) type>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 12>)
LocalShellCall object { id, action, call\_id, 2 more }
A tool call to run a command on the local shell.
id: string
The unique ID of the local shell call.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 13 > (property) id>)
action: object { command, env, type, 3 more }
Execute a shell command on the server.
command: array of string
The command to run.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 13 > (property) action > (property) command>)
env: map[string]
Environment variables to set for the command.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 13 > (property) action > (property) env>)
type: "exec"
The type of the local shell action. Always `exec`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 13 > (property) action > (property) type>)
timeout\_ms: optional number
Optional timeout in milliseconds for the command.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 13 > (property) action > (property) timeout_ms>)
user: optional string
Optional user to run the command as.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 13 > (property) action > (property) user>)
working\_directory: optional string
Optional working directory to run the command in.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 13 > (property) action > (property) working_directory>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 13 > (property) action>)
call\_id: string
The unique ID of the local shell tool call generated by the model.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 13 > (property) call_id>)
status: "in\_progress" or "completed" or "incomplete"
The status of the local shell call.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 13 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 13 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 13 > (property) status > (member) 2>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 13 > (property) status>)
type: "local\_shell\_call"
The type of the local shell call. Always `local\_shell\_call`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 13 > (property) type>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 13>)
LocalShellCallOutput object { id, output, type, status }
The output of a local shell tool call.
id: string
The unique ID of the local shell tool call generated by the model.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 14 > (property) id>)
output: string
A JSON string of the output of the local shell tool call.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 14 > (property) output>)
type: "local\_shell\_call\_output"
The type of the local shell tool call output. Always `local\_shell\_call\_output`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 14 > (property) type>)
status: optional "in\_progress" or "completed" or "incomplete"
The status of the item. One of `in\_progress`, `completed`, or `incomplete`.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 14 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 14 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 14 > (property) status > (member) 2>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 14 > (property) status>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 14>)
ShellCall object { id, action, call\_id, 4 more }
A tool call that executes one or more shell commands in a managed environment.
id: string
The unique ID of the shell tool call. Populated when this item is returned via API.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 15 > (property) id>)
action: object { commands, max\_output\_length, timeout\_ms }
The shell commands and limits that describe how to run the tool call.
commands: array of string
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 15 > (property) action > (property) commands>)
max\_output\_length: number
Optional maximum number of characters to return from each command.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 15 > (property) action > (property) max_output_length>)
timeout\_ms: number
Optional timeout in milliseconds for the commands.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 15 > (property) action > (property) timeout_ms>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 15 > (property) action>)
call\_id: string
The unique ID of the shell tool call generated by the model.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 15 > (property) call_id>)
environment: [ResponseLocalEnvironment](</api/reference/resources/responses#(resource) responses > (model) response_local_environment > (schema)>) { type } or [ResponseContainerReference](</api/reference/resources/responses#(resource) responses > (model) response_container_reference > (schema)>) { container\_id, type }
Represents the use of a local environment to perform shell actions.
One of the following:
ResponseLocalEnvironment object { type }
Represents the use of a local environment to perform shell actions.
type: "local"
The environment type. Always `local`.
[](<#(resource) responses > (model) response_local_environment > (schema) > (property) type>)
[](<#(resource) responses > (model) response_local_environment > (schema)>)
ResponseContainerReference object { container\_id, type }
Represents a container created with /v1/containers.
container\_id: string
[](<#(resource) responses > (model) response_container_reference > (schema) > (property) container_id>)
type: "container\_reference"
The environment type. Always `container\_reference`.
[](<#(resource) responses > (model) response_container_reference > (schema) > (property) type>)
[](<#(resource) responses > (model) response_container_reference > (schema)>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 15 > (property) environment>)
status: "in\_progress" or "completed" or "incomplete"
The status of the shell call. One of `in\_progress`, `completed`, or `incomplete`.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 15 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 15 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 15 > (property) status > (member) 2>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 15 > (property) status>)
type: "shell\_call"
The type of the item. Always `shell\_call`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 15 > (property) type>)
created\_by: optional string
The ID of the entity that created this tool call.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 15 > (property) created_by>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 15>)
ShellCallOutput object { id, call\_id, max\_output\_length, 4 more }
The output of a shell tool call that was emitted.
id: string
The unique ID of the shell call output. Populated when this item is returned via API.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 16 > (property) id>)
call\_id: string
The unique ID of the shell tool call generated by the model.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 16 > (property) call_id>)
max\_output\_length: number
The maximum length of the shell command output. This is generated by the model and should be passed back with the raw output.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 16 > (property) max_output_length>)
output: array of object { outcome, stderr, stdout, created\_by }
An array of shell call output contents
outcome: object { type } or object { exit\_code, type }
Represents either an exit outcome (with an exit code) or a timeout outcome for a shell call output chunk.
One of the following:
Timeout object { type }
Indicates that the shell call exceeded its configured time limit.
type: "timeout"
The outcome type. Always `timeout`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 16 > (property) output > (items) > (property) outcome > (variant) 0 > (property) type>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 16 > (property) output > (items) > (property) outcome > (variant) 0>)
Exit object { exit\_code, type }
Indicates that the shell commands finished and returned an exit code.
exit\_code: number
Exit code from the shell process.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 16 > (property) output > (items) > (property) outcome > (variant) 1 > (property) exit_code>)
type: "exit"
The outcome type. Always `exit`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 16 > (property) output > (items) > (property) outcome > (variant) 1 > (property) type>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 16 > (property) output > (items) > (property) outcome > (variant) 1>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 16 > (property) output > (items) > (property) outcome>)
stderr: string
The standard error output that was captured.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 16 > (property) output > (items) > (property) stderr>)
stdout: string
The standard output that was captured.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 16 > (property) output > (items) > (property) stdout>)
created\_by: optional string
The identifier of the actor that created the item.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 16 > (property) output > (items) > (property) created_by>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 16 > (property) output>)
status: "in\_progress" or "completed" or "incomplete"
The status of the shell call output. One of `in\_progress`, `completed`, or `incomplete`.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 16 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 16 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 16 > (property) status > (member) 2>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 16 > (property) status>)
type: "shell\_call\_output"
The type of the shell call output. Always `shell\_call\_output`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 16 > (property) type>)
created\_by: optional string
The identifier of the actor that created the item.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 16 > (property) created_by>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 16>)
ApplyPatchCall object { id, call\_id, operation, 3 more }
A tool call that applies file diffs by creating, deleting, or updating files.
id: string
The unique ID of the apply patch tool call. Populated when this item is returned via API.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 17 > (property) id>)
call\_id: string
The unique ID of the apply patch tool call generated by the model.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 17 > (property) call_id>)
operation: object { diff, path, type } or object { path, type } or object { diff, path, type }
One of the create\_file, delete\_file, or update\_file operations applied via apply\_patch.
One of the following:
CreateFile object { diff, path, type }
Instruction describing how to create a file via the apply\_patch tool.
diff: string
Diff to apply.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 17 > (property) operation > (variant) 0 > (property) diff>)
path: string
Path of the file to create.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 17 > (property) operation > (variant) 0 > (property) path>)
type: "create\_file"
Create a new file with the provided diff.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 17 > (property) operation > (variant) 0 > (property) type>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 17 > (property) operation > (variant) 0>)
DeleteFile object { path, type }
Instruction describing how to delete a file via the apply\_patch tool.
path: string
Path of the file to delete.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 17 > (property) operation > (variant) 1 > (property) path>)
type: "delete\_file"
Delete the specified file.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 17 > (property) operation > (variant) 1 > (property) type>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 17 > (property) operation > (variant) 1>)
UpdateFile object { diff, path, type }
Instruction describing how to update a file via the apply\_patch tool.
diff: string
Diff to apply.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 17 > (property) operation > (variant) 2 > (property) diff>)
path: string
Path of the file to update.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 17 > (property) operation > (variant) 2 > (property) path>)
type: "update\_file"
Update an existing file with the provided diff.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 17 > (property) operation > (variant) 2 > (property) type>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 17 > (property) operation > (variant) 2>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 17 > (property) operation>)
status: "in\_progress" or "completed"
The status of the apply patch tool call. One of `in\_progress` or `completed`.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 17 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 17 > (property) status > (member) 1>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 17 > (property) status>)
type: "apply\_patch\_call"
The type of the item. Always `apply\_patch\_call`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 17 > (property) type>)
created\_by: optional string
The ID of the entity that created this tool call.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 17 > (property) created_by>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 17>)
ApplyPatchCallOutput object { id, call\_id, status, 3 more }
The output emitted by an apply patch tool call.
id: string
The unique ID of the apply patch tool call output. Populated when this item is returned via API.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 18 > (property) id>)
call\_id: string
The unique ID of the apply patch tool call generated by the model.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 18 > (property) call_id>)
status: "completed" or "failed"
The status of the apply patch tool call output. One of `completed` or `failed`.
One of the following:
"completed"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 18 > (property) status > (member) 0>)
"failed"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 18 > (property) status > (member) 1>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 18 > (property) status>)
type: "apply\_patch\_call\_output"
The type of the item. Always `apply\_patch\_call\_output`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 18 > (property) type>)
created\_by: optional string
The ID of the entity that created this tool call output.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 18 > (property) created_by>)
output: optional string
Optional textual output returned by the apply patch tool.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 18 > (property) output>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 18>)
McpListTools object { id, server\_label, tools, 2 more }
A list of tools available on an MCP server.
id: string
The unique ID of the list.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 19 > (property) id>)
server\_label: string
The label of the MCP server.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 19 > (property) server_label>)
tools: array of object { input\_schema, name, annotations, description }
The tools available on the server.
input\_schema: unknown
The JSON schema describing the tool’s input.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 19 > (property) tools > (items) > (property) input_schema>)
name: string
The name of the tool.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 19 > (property) tools > (items) > (property) name>)
annotations: optional unknown
Additional annotations about the tool.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 19 > (property) tools > (items) > (property) annotations>)
description: optional string
The description of the tool.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 19 > (property) tools > (items) > (property) description>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 19 > (property) tools>)
type: "mcp\_list\_tools"
The type of the item. Always `mcp\_list\_tools`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 19 > (property) type>)
error: optional string
Error message if the server could not list tools.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 19 > (property) error>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 19>)
McpApprovalRequest object { id, arguments, name, 2 more }
A request for human approval of a tool invocation.
id: string
The unique ID of the approval request.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 20 > (property) id>)
arguments: string
A JSON string of arguments for the tool.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 20 > (property) arguments>)
name: string
The name of the tool to run.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 20 > (property) name>)
server\_label: string
The label of the MCP server making the request.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 20 > (property) server_label>)
type: "mcp\_approval\_request"
The type of the item. Always `mcp\_approval\_request`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 20 > (property) type>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 20>)
McpApprovalResponse object { id, approval\_request\_id, approve, 2 more }
A response to an MCP approval request.
id: string
The unique ID of the approval response
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 21 > (property) id>)
approval\_request\_id: string
The ID of the approval request being answered.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 21 > (property) approval_request_id>)
approve: boolean
Whether the request was approved.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 21 > (property) approve>)
type: "mcp\_approval\_response"
The type of the item. Always `mcp\_approval\_response`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 21 > (property) type>)
reason: optional string
Optional reason for the decision.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 21 > (property) reason>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 21>)
McpCall object { id, arguments, name, 6 more }
An invocation of a tool on an MCP server.
id: string
The unique ID of the tool call.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 22 > (property) id>)
arguments: string
A JSON string of the arguments passed to the tool.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 22 > (property) arguments>)
name: string
The name of the tool that was run.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 22 > (property) name>)
server\_label: string
The label of the MCP server running the tool.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 22 > (property) server_label>)
type: "mcp\_call"
The type of the item. Always `mcp\_call`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 22 > (property) type>)
approval\_request\_id: optional string
Unique identifier for the MCP tool call approval request.
Include this value in a subsequent `mcp\_approval\_response` input to approve or reject the corresponding tool call.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 22 > (property) approval_request_id>)
error: optional string
The error from the tool call, if any.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 22 > (property) error>)
output: optional string
The output from the tool call.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 22 > (property) output>)
status: optional "in\_progress" or "completed" or "incomplete" or 2 more
The status of the tool call. One of `in\_progress`, `completed`, `incomplete`, `calling`, or `failed`.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 22 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 22 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 22 > (property) status > (member) 2>)
"calling"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 22 > (property) status > (member) 3>)
"failed"
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 22 > (property) status > (member) 4>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 22 > (property) status>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 22>)
CustomToolCall object { call\_id, input, name, 3 more }
A call to a custom tool created by the model.
call\_id: string
An identifier used to map this custom tool call to a tool call output.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 23 > (property) call_id>)
input: string
The input for the custom tool call generated by the model.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 23 > (property) input>)
name: string
The name of the custom tool being called.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 23 > (property) name>)
type: "custom\_tool\_call"
The type of the custom tool call. Always `custom\_tool\_call`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 23 > (property) type>)
id: optional string
The unique ID of the custom tool call in the OpenAI platform.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 23 > (property) id>)
namespace: optional string
The namespace of the custom tool being called.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 23 > (property) namespace>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 23>)
CustomToolCallOutput object { call\_id, output, type, id }
The output of a custom tool call from your code, being sent back to the model.
call\_id: string
The call ID, used to map this custom tool call output to a custom tool call.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 24 > (property) call_id>)
output: string or array of [ResponseInputText](</api/reference/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } or [ResponseInputImage](</api/reference/resources/responses#(resource) responses > (model) response_input_image > (schema)>) { detail, type, file\_id, image\_url } or [ResponseInputFile](</api/reference/resources/responses#(resource) responses > (model) response_input_file > (schema)>) { type, detail, file\_data, 3 more }
The output from the custom tool call generated by your code.
Can be a string or an list of output content.
One of the following:
StringOutput = string
A string of the output of the custom tool call.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 24 > (property) output > (variant) 0>)
OutputContentList = array of [ResponseInputText](</api/reference/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } or [ResponseInputImage](</api/reference/resources/responses#(resource) responses > (model) response_input_image > (schema)>) { detail, type, file\_id, image\_url } or [ResponseInputFile](</api/reference/resources/responses#(resource) responses > (model) response_input_file > (schema)>) { type, detail, file\_data, 3 more }
Text, image, or file output of the custom tool call.
One of the following:
ResponseInputText object { text, type }
A text input to the model.
text: string
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
type: "input\_text"
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
ResponseInputImage object { detail, type, file\_id, image\_url }
An image input to the model. Learn about [image inputs](/docs/guides/vision).
detail: "low" or "high" or "auto" or "original"
The detail level of the image to be sent to the model. One of `high`, `low`, `auto`, or `original`. Defaults to `auto`.
One of the following:
"low"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 0>)
"high"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 1>)
"auto"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 2>)
"original"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 3>)
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail>)
type: "input\_image"
The type of the input item. Always `input\_image`.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) type>)
file\_id: optional string
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) file_id>)
image\_url: optional string
The URL of the image to be sent to the model. A fully qualified URL or base64 encoded image in a data URL.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) image_url>)
[](<#(resource) responses > (model) response_input_image > (schema)>)
ResponseInputFile object { type, detail, file\_data, 3 more }
A file input to the model.
type: "input\_file"
The type of the input item. Always `input\_file`.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) type>)
detail: optional "low" or "high"
The detail level of the file to be sent to the model. Use `low` for the default rendering behavior, or `high` to render the file at higher quality. Defaults to `low`.
One of the following:
"low"
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 0>)
"high"
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 1>)
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail>)
file\_data: optional string
The content of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_data>)
file\_id: optional string
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_id>)
file\_url: optional string
The URL of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_url>)
filename: optional string
The name of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) filename>)
[](<#(resource) responses > (model) response_input_file > (schema)>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 24 > (property) output > (variant) 1>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 24 > (property) output>)
type: "custom\_tool\_call\_output"
The type of the custom tool call output. Always `custom\_tool\_call\_output`.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 24 > (property) type>)
id: optional string
The unique ID of the custom tool call output in the OpenAI platform.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 24 > (property) id>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output > (items) > (variant) 24>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) output>)
usage: [ResponseUsage](</api/reference/resources/responses#(resource) responses > (model) response_usage > (schema)>) { input\_tokens, input\_tokens\_details, output\_tokens, 2 more }
Token accounting for the compaction pass, including cached, reasoning, and total tokens.
input\_tokens: number
The number of input tokens.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) usage + (resource) responses > (model) response_usage > (schema) > (property) input_tokens>)
input\_tokens\_details: object { cached\_tokens }
A detailed breakdown of the input tokens.
cached\_tokens: number
The number of tokens that were retrieved from the cache.
[More on prompt caching](/docs/guides/prompt-caching).
[](<#(resource) responses > (model) compacted_response > (schema) > (property) usage + (resource) responses > (model) response_usage > (schema) > (property) input_tokens_details > (property) cached_tokens>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) usage + (resource) responses > (model) response_usage > (schema) > (property) input_tokens_details>)
output\_tokens: number
The number of output tokens.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) usage + (resource) responses > (model) response_usage > (schema) > (property) output_tokens>)
output\_tokens\_details: object { reasoning\_tokens }
A detailed breakdown of the output tokens.
reasoning\_tokens: number
The number of reasoning tokens.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) usage + (resource) responses > (model) response_usage > (schema) > (property) output_tokens_details > (property) reasoning_tokens>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) usage + (resource) responses > (model) response_usage > (schema) > (property) output_tokens_details>)
total\_tokens: number
The total number of tokens used.
[](<#(resource) responses > (model) compacted_response > (schema) > (property) usage + (resource) responses > (model) response_usage > (schema) > (property) total_tokens>)
[](<#(resource) responses > (model) compacted_response > (schema) > (property) usage>)
[](<#(resource) responses > (model) compacted_response > (schema)>)
### Compact a response
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
`curl -X POST https://api.openai.com/v1/responses/compact \\
-H "Content-Type: application/json" \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-d '{
"model": "gpt-5.1-codex-max",
"input": [
{
"role": "user",
"content": "Create a simple landing page for a dog petting café."
},
{
"id": "msg\_001",
"type": "message",
"status": "completed",
"content": [
{
"type": "output\_text",
"annotations": [],
"logprobs": [],
"text": "Below is a single file, ready-to-use landing page for a dog petting café:..."
}
],
"role": "assistant"
}
]
}'
`
```
```
`{
"id": "resp\_001",
"object": "response.compaction",
"created\_at": 1764967971,
"output": [
{
"id": "msg\_000",
"type": "message",
"status": "completed",
"content": [
{
"type": "input\_text",
"text": "Create a simple landing page for a dog petting cafe."
}
],
"role": "user"
},
{
"id": "cmp\_001",
"type": "compaction",
"encrypted\_content": "gAAAAABpM0Yj-...="
}
],
"usage": {
"input\_tokens": 139,
"input\_tokens\_details": {
"cached\_tokens": 0
},
"output\_tokens": 438,
"output\_tokens\_details": {
"reasoning\_tokens": 64
},
"total\_tokens": 577
}
}
`
```
##### Returns Examples
```
`{
"id": "resp\_001",
"object": "response.compaction",
"created\_at": 1764967971,
"output": [
{
"id": "msg\_000",
"type": "message",
"status": "completed",
"content": [
{
"type": "input\_text",
"text": "Create a simple landing page for a dog petting cafe."
}
],
"role": "user"
},
{
"id": "cmp\_001",
"type": "compaction",
"encrypted\_content": "gAAAAABpM0Yj-...="
}
],
"usage": {
"input\_tokens": 139,
"input\_tokens\_details": {
"cached\_tokens": 0
},
"output\_tokens": 438,
"output\_tokens\_details": {
"reasoning\_tokens": 64
},
"total\_tokens": 577
}
}
`
```