Create thread and run | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Beta](/api/reference/resources/beta)
[Threads](/api/reference/resources/beta/subresources/threads)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create thread and run
Deprecated: The Assistants API is deprecated in favor of the Responses API
POST/threads/runs
Create a thread and run it in one request.
##### Body ParametersJSONExpand Collapse
assistant\_id: string
The ID of the [assistant](/docs/api-reference/assistants) to use to execute this run.
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) assistant_id > (schema)>)
instructions: optional string
Override the default system message of the assistant. This is useful for modifying the behavior on a per-run basis.
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) instructions > (schema)>)
max\_completion\_tokens: optional number
The maximum number of completion tokens that may be used over the course of the run. The run will make a best effort to use only the number of completion tokens specified, across multiple turns of the run. If the run exceeds the number of completion tokens specified, the run will end with status `incomplete`. See `incomplete\_details` for more info.
minimum256
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) max_completion_tokens > (schema)>)
max\_prompt\_tokens: optional number
The maximum number of prompt tokens that may be used over the course of the run. The run will make a best effort to use only the number of prompt tokens specified, across multiple turns of the run. If the run exceeds the number of prompt tokens specified, the run will end with status `incomplete`. See `incomplete\_details` for more info.
minimum256
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) max_prompt_tokens > (schema)>)
metadata: optional [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) metadata > (schema)>)
model: optional string or "gpt-5" or "gpt-5-mini" or "gpt-5-nano" or 35 more
The ID of the [Model](/docs/api-reference/models) to be used to execute this run. If a value is provided here, it will override the model associated with the assistant. If not, the model associated with the assistant will be used.
One of the following:
string
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) model > (schema) > (variant) 0>)
"gpt-5" or "gpt-5-mini" or "gpt-5-nano" or 35 more
The ID of the [Model](/docs/api-reference/models) to be used to execute this run. If a value is provided here, it will override the model associated with the assistant. If not, the model associated with the assistant will be used.
One of the following:
"gpt-5"
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 0>)
"gpt-5-mini"
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 1>)
"gpt-5-nano"
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 2>)
"gpt-5-2025-08-07"
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 3>)
"gpt-5-mini-2025-08-07"
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 4>)
"gpt-5-nano-2025-08-07"
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 5>)
"gpt-4.1"
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 6>)
"gpt-4.1-mini"
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 7>)
"gpt-4.1-nano"
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 8>)
"gpt-4.1-2025-04-14"
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 9>)
"gpt-4.1-mini-2025-04-14"
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 10>)
"gpt-4.1-nano-2025-04-14"
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 11>)
"gpt-4o"
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 12>)
"gpt-4o-2024-11-20"
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 13>)
"gpt-4o-2024-08-06"
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 14>)
"gpt-4o-2024-05-13"
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 15>)
"gpt-4o-mini"
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 16>)
"gpt-4o-mini-2024-07-18"
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 17>)
"gpt-4.5-preview"
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 18>)
"gpt-4.5-preview-2025-02-27"
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 19>)
"gpt-4-turbo"
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 20>)
"gpt-4-turbo-2024-04-09"
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 21>)
"gpt-4-0125-preview"
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 22>)
"gpt-4-turbo-preview"
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 23>)
"gpt-4-1106-preview"
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 24>)
"gpt-4-vision-preview"
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 25>)
"gpt-4"
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 26>)
"gpt-4-0314"
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 27>)
"gpt-4-0613"
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 28>)
"gpt-4-32k"
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 29>)
"gpt-4-32k-0314"
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 30>)
"gpt-4-32k-0613"
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 31>)
"gpt-3.5-turbo"
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 32>)
"gpt-3.5-turbo-16k"
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 33>)
"gpt-3.5-turbo-0613"
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 34>)
"gpt-3.5-turbo-1106"
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 35>)
"gpt-3.5-turbo-0125"
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 36>)
"gpt-3.5-turbo-16k-0613"
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) model > (schema) > (variant) 1 > (member) 37>)
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) model > (schema) > (variant) 1>)
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) model > (schema)>)
parallel\_tool\_calls: optional boolean
Whether to enable [parallel function calling](/docs/guides/function-calling#configuring-parallel-function-calling) during tool use.
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) parallel_tool_calls > (schema)>)
response\_format: optional [AssistantResponseFormatOption](</api/reference/resources/beta#(resource) beta.threads > (model) assistant_response_format_option > (schema)>)
Specifies the format that the model must output. Compatible with [GPT-4o](/docs/models#gpt-4o), [GPT-4 Turbo](/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly “stuck” request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
One of the following:
"auto"
`auto` is the default value
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) response_format > (schema) + (resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0>)
ResponseFormatText object { type }
Default response format. Used to generate text responses.
type: "text"
The type of response format being defined. Always `text`.
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) response_format > (schema) + (resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) response_format > (schema) + (resource) $shared > (model) response_format_text > (schema)>)
ResponseFormatJSONObject object { type }
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
type: "json\_object"
The type of response format being defined. Always `json\_object`.
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) response_format > (schema) + (resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) response_format > (schema) + (resource) $shared > (model) response_format_json_object > (schema)>)
ResponseFormatJSONSchema object { json\_schema, type }
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](/docs/guides/structured-outputs).
json\_schema: object { name, description, schema, strict }
Structured Outputs configuration options, including a JSON Schema.
name: string
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) response_format > (schema) + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
description: optional string
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) response_format > (schema) + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
schema: optional map[unknown]
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) response_format > (schema) + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
strict: optional boolean
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](/docs/guides/structured-outputs).
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) response_format > (schema) + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) response_format > (schema) + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
type: "json\_schema"
The type of response format being defined. Always `json\_schema`.
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) response_format > (schema) + (resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) response_format > (schema) + (resource) $shared > (model) response_format_json_schema > (schema)>)
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) response_format > (schema)>)
stream: optional boolean
If `true`, returns a stream of events that happen during the Run as server-sent events, terminating when the Run enters a terminal state with a `data: [DONE]` message.
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) stream > (schema)>)
temperature: optional number
What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
minimum0
maximum2
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) temperature > (schema)>)
thread: optional object { messages, metadata, tool\_resources }
Options to create a new thread. If no thread is provided when running a
request, an empty thread will be created.
messages: optional array of object { content, role, attachments, metadata }
A list of [messages](/docs/api-reference/messages) to start the thread with.
content: string or array of [ImageFileContentBlock](</api/reference/resources/beta#(resource) beta.threads.messages > (model) image_file_content_block > (schema)>) { image\_file, type } or [ImageURLContentBlock](</api/reference/resources/beta#(resource) beta.threads.messages > (model) image_url_content_block > (schema)>) { image\_url, type } or [TextContentBlockParam](</api/reference/resources/beta#(resource) beta.threads.messages > (model) text_content_block_param > (schema)>) { text, type }
The text contents of the message.
One of the following:
TextContent = string
The text contents of the message.
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) thread > (schema) > (property) messages > (items) > (property) content > (variant) 0>)
ArrayOfContentParts = array of [ImageFileContentBlock](</api/reference/resources/beta#(resource) beta.threads.messages > (model) image_file_content_block > (schema)>) { image\_file, type } or [ImageURLContentBlock](</api/reference/resources/beta#(resource) beta.threads.messages > (model) image_url_content_block > (schema)>) { image\_url, type } or [TextContentBlockParam](</api/reference/resources/beta#(resource) beta.threads.messages > (model) text_content_block_param > (schema)>) { text, type }
An array of content parts with a defined type, each can be of type `text` or images can be passed with `image\_url` or `image\_file`. Image types are only supported on [Vision-compatible models](/docs/models).
One of the following:
ImageFileContentBlock object { image\_file, type }
References an image [File](/docs/api-reference/files) in the content of a message.
image\_file: [ImageFile](</api/reference/resources/beta#(resource) beta.threads.messages > (model) image_file > (schema)>) { file\_id, detail }
file\_id: string
The [File](/docs/api-reference/files) ID of the image in the message content. Set `purpose="vision"` when uploading the File if you need to later display the file content.
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) file_id>)
detail: optional "auto" or "low" or "high"
Specifies the detail level of the image if specified by the user. `low` uses fewer tokens, you can opt in to high resolution using `high`.
One of the following:
"auto"
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 0>)
"low"
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 1>)
"high"
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) detail>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file>)
type: "image\_file"
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema)>)
ImageURLContentBlock object { image\_url, type }
References an image URL in the content of a message.
image\_url: [ImageURL](</api/reference/resources/beta#(resource) beta.threads.messages > (model) image_url > (schema)>) { url, detail }
url: string
The external URL of the image, must be a supported image types: jpeg, jpg, png, gif, webp.
formaturi
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) url>)
detail: optional "auto" or "low" or "high"
Specifies the detail level of the image. `low` uses fewer tokens, you can opt in to high resolution using `high`. Default value is `auto`
One of the following:
"auto"
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 0>)
"low"
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 1>)
"high"
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) detail>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url>)
type: "image\_url"
The type of the content part.
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema)>)
TextContentBlockParam object { text, type }
The text content that is part of a message.
text: string
Text content to be sent to the model
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema) > (property) text>)
type: "text"
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema)>)
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) thread > (schema) > (property) messages > (items) > (property) content > (variant) 1>)
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) thread > (schema) > (property) messages > (items) > (property) content>)
role: "user" or "assistant"
The role of the entity that is creating the message. Allowed values include:
* `user`: Indicates the message is sent by an actual user and should be used in most cases to represent user-generated messages.
* `assistant`: Indicates the message is generated by the assistant. Use this value to insert messages from the assistant into the conversation.
One of the following:
"user"
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) thread > (schema) > (property) messages > (items) > (property) role > (member) 0>)
"assistant"
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) thread > (schema) > (property) messages > (items) > (property) role > (member) 1>)
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) thread > (schema) > (property) messages > (items) > (property) role>)
attachments: optional array of object { file\_id, tools }
A list of files attached to the message, and the tools they should be added to.
file\_id: optional string
The ID of the file to attach to the message.
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) thread > (schema) > (property) messages > (items) > (property) attachments > (items) > (property) file_id>)
tools: optional array of [CodeInterpreterTool](</api/reference/resources/beta#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>) { type } or object { type }
The tools to add this file to.
One of the following:
CodeInterpreterTool object { type }
type: "code\_interpreter"
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
FileSearchTool object { type }
type: "file\_search"
The type of tool being defined: `file\_search`
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) thread > (schema) > (property) messages > (items) > (property) attachments > (items) > (property) tools > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) thread > (schema) > (property) messages > (items) > (property) attachments > (items) > (property) tools > (items) > (variant) 1>)
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) thread > (schema) > (property) messages > (items) > (property) attachments > (items) > (property) tools>)
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) thread > (schema) > (property) messages > (items) > (property) attachments>)
metadata: optional [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) thread > (schema) > (property) messages > (items) > (property) metadata>)
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) thread > (schema) > (property) messages>)
metadata: optional [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) thread > (schema) > (property) metadata>)
tool\_resources: optional object { code\_interpreter, file\_search }
A set of resources that are made available to the assistant’s tools in this thread. The resources are specific to the type of tool. For example, the `code\_interpreter` tool requires a list of file IDs, while the `file\_search` tool requires a list of vector store IDs.
code\_interpreter: optional object { file\_ids }
file\_ids: optional array of string
A list of [file](/docs/api-reference/files) IDs made available to the `code\_interpreter` tool. There can be a maximum of 20 files associated with the tool.
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) thread > (schema) > (property) tool_resources > (property) code_interpreter > (property) file_ids>)
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) thread > (schema) > (property) tool_resources > (property) code_interpreter>)
file\_search: optional object { vector\_store\_ids, vector\_stores }
vector\_store\_ids: optional array of string
The [vector store](/docs/api-reference/vector-stores/object) attached to this thread. There can be a maximum of 1 vector store attached to the thread.
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) thread > (schema) > (property) tool_resources > (property) file_search > (property) vector_store_ids>)
vector\_stores: optional array of object { chunking\_strategy, file\_ids, metadata }
A helper to create a [vector store](/docs/api-reference/vector-stores/object) with file\_ids and attach it to this thread. There can be a maximum of 1 vector store attached to the thread.
chunking\_strategy: optional object { type } or object { static, type }
The chunking strategy used to chunk the file(s). If not set, will use the `auto` strategy.
One of the following:
AutoChunkingStrategy object { type }
The default strategy. This strategy currently uses a `max\_chunk\_size\_tokens` of `800` and `chunk\_overlap\_tokens` of `400`.
type: "auto"
Always `auto`.
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) thread > (schema) > (property) tool_resources > (property) file_search > (property) vector_stores > (items) > (property) chunking_strategy > (variant) 0 > (property) type>)
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) thread > (schema) > (property) tool_resources > (property) file_search > (property) vector_stores > (items) > (property) chunking_strategy > (variant) 0>)
StaticChunkingStrategy object { static, type }
static: object { chunk\_overlap\_tokens, max\_chunk\_size\_tokens }
chunk\_overlap\_tokens: number
The number of tokens that overlap between chunks. The default value is `400`.
Note that the overlap must not exceed half of `max\_chunk\_size\_tokens`.
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) thread > (schema) > (property) tool_resources > (property) file_search > (property) vector_stores > (items) > (property) chunking_strategy > (variant) 1 > (property) static > (property) chunk_overlap_tokens>)
max\_chunk\_size\_tokens: number
The maximum number of tokens in each chunk. The default value is `800`. The minimum value is `100` and the maximum value is `4096`.
minimum100
maximum4096
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) thread > (schema) > (property) tool_resources > (property) file_search > (property) vector_stores > (items) > (property) chunking_strategy > (variant) 1 > (property) static > (property) max_chunk_size_tokens>)
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) thread > (schema) > (property) tool_resources > (property) file_search > (property) vector_stores > (items) > (property) chunking_strategy > (variant) 1 > (property) static>)
type: "static"
Always `static`.
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) thread > (schema) > (property) tool_resources > (property) file_search > (property) vector_stores > (items) > (property) chunking_strategy > (variant) 1 > (property) type>)
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) thread > (schema) > (property) tool_resources > (property) file_search > (property) vector_stores > (items) > (property) chunking_strategy > (variant) 1>)
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) thread > (schema) > (property) tool_resources > (property) file_search > (property) vector_stores > (items) > (property) chunking_strategy>)
file\_ids: optional array of string
A list of [file](/docs/api-reference/files) IDs to add to the vector store. For vector stores created before Nov 2025, there can be a maximum of 10,000 files in a vector store. For vector stores created starting in Nov 2025, the limit is 100,000,000 files.
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) thread > (schema) > (property) tool_resources > (property) file_search > (property) vector_stores > (items) > (property) file_ids>)
metadata: optional [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) thread > (schema) > (property) tool_resources > (property) file_search > (property) vector_stores > (items) > (property) metadata>)
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) thread > (schema) > (property) tool_resources > (property) file_search > (property) vector_stores>)
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) thread > (schema) > (property) tool_resources > (property) file_search>)
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) thread > (schema) > (property) tool_resources>)
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) thread > (schema)>)
tool\_choice: optional [AssistantToolChoiceOption](</api/reference/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_option > (schema)>)
Controls which (if any) tool is called by the model.
`none` means the model will not call any tools and instead generates a message.
`auto` is the default value and means the model can pick between generating a message or calling one or more tools.
`required` means the model must call one or more tools before responding to the user.
Specifying a particular tool like `{"type": "file\_search"}` or `{"type": "function", "function": {"name": "my\_function"}}` forces the model to call that tool.
One of the following:
"none" or "auto" or "required"
`none` means the model will not call any tools and instead generates a message. `auto` means the model can pick between generating a message or calling one or more tools. `required` means the model must call one or more tools before responding to the user.
One of the following:
"none"
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) tool_choice > (schema) + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 0>)
"auto"
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) tool_choice > (schema) + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 1>)
"required"
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) tool_choice > (schema) + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 2>)
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) tool_choice > (schema) + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0>)
AssistantToolChoice object { type, function }
Specifies a tool the model should use. Use to force the model to call a specific tool.
type: "function" or "code\_interpreter" or "file\_search"
The type of the tool. If type is `function`, the function name must be set
One of the following:
"function"
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) tool_choice > (schema) + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 0>)
"code\_interpreter"
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) tool_choice > (schema) + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 1>)
"file\_search"
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) tool_choice > (schema) + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 2>)
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) tool_choice > (schema) + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type>)
function: optional [AssistantToolChoiceFunction](</api/reference/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_function > (schema)>) { name }
name: string
The name of the function to call.
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function + (resource) beta.threads > (model) assistant_tool_choice_function > (schema) > (property) name>)
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) tool_choice > (schema) + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function>)
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) tool_choice > (schema) + (resource) beta.threads > (model) assistant_tool_choice > (schema)>)
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) tool_choice > (schema)>)
tool\_resources: optional object { code\_interpreter, file\_search }
A set of resources that are used by the assistant’s tools. The resources are specific to the type of tool. For example, the `code\_interpreter` tool requires a list of file IDs, while the `file\_search` tool requires a list of vector store IDs.
code\_interpreter: optional object { file\_ids }
file\_ids: optional array of string
A list of [file](/docs/api-reference/files) IDs made available to the `code\_interpreter` tool. There can be a maximum of 20 files associated with the tool.
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) tool_resources > (schema) > (property) code_interpreter > (property) file_ids>)
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) tool_resources > (schema) > (property) code_interpreter>)
file\_search: optional object { vector\_store\_ids }
vector\_store\_ids: optional array of string
The ID of the [vector store](/docs/api-reference/vector-stores/object) attached to this assistant. There can be a maximum of 1 vector store attached to the assistant.
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) tool_resources > (schema) > (property) file_search > (property) vector_store_ids>)
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) tool_resources > (schema) > (property) file_search>)
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) tool_resources > (schema)>)
tools: optional array of [CodeInterpreterTool](</api/reference/resources/beta#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>) { type } or [FileSearchTool](</api/reference/resources/beta#(resource) beta.assistants > (model) file_search_tool > (schema)>) { type, file\_search } or [FunctionTool](</api/reference/resources/beta#(resource) beta.assistants > (model) function_tool > (schema)>) { function, type }
Override the tools the assistant can use for this run. This is useful for modifying the behavior on a per-run basis.
One of the following:
CodeInterpreterTool object { type }
type: "code\_interpreter"
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
FileSearchTool object { type, file\_search }
type: "file\_search"
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
file\_search: optional object { max\_num\_results, ranking\_options }
Overrides for the file search tool.
max\_num\_results: optional number
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
ranking\_options: optional object { score\_threshold, ranker }
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
score\_threshold: number
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
ranker: optional "auto" or "default\_2024\_08\_21"
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
"auto"
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
"default\_2024\_08\_21"
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema)>)
FunctionTool object { function, type }
function: [FunctionDefinition](</api/reference/resources/$shared#(resource) $shared > (model) function_definition > (schema)>) { name, description, parameters, strict }
name: string
The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) name>)
description: optional string
A description of what the function does, used by the model to choose when and how to call the function.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) description>)
parameters: optional [FunctionParameters](</api/reference/resources/$shared#(resource) $shared > (model) function_parameters > (schema)>)
The parameters the functions accepts, described as a JSON Schema object. See the [guide](/docs/guides/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format.
Omitting `parameters` defines a function with an empty parameter list.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) parameters>)
strict: optional boolean
Whether to enable strict schema adherence when generating the function call. If set to true, the model will follow the exact schema defined in the `parameters` field. Only a subset of JSON Schema is supported when `strict` is `true`. Learn more about Structured Outputs in the [function calling guide](/docs/guides/function-calling).
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) strict>)
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
type: "function"
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) tools > (schema)>)
top\_p: optional number
An alternative to sampling with temperature, called nucleus sampling, where the model considers the results of the tokens with top\_p probability mass. So 0.1 means only the tokens comprising the top 10% probability mass are considered.
We generally recommend altering this or temperature but not both.
minimum0
maximum1
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) top_p > (schema)>)
truncation\_strategy: optional object { type, last\_messages }
Controls for how a thread will be truncated prior to the run. Use this to control the initial context window of the run.
type: "auto" or "last\_messages"
The truncation strategy to use for the thread. The default is `auto`. If set to `last\_messages`, the thread will be truncated to the n most recent messages in the thread. When set to `auto`, messages in the middle of the thread will be dropped to fit the context length of the model, `max\_prompt\_tokens`.
One of the following:
"auto"
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) truncation_strategy > (schema) > (property) type > (member) 0>)
"last\_messages"
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) truncation_strategy > (schema) > (property) type > (member) 1>)
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) truncation_strategy > (schema) > (property) type>)
last\_messages: optional number
The number of most recent messages from the thread when constructing the context for the run.
minimum1
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) truncation_strategy > (schema) > (property) last_messages>)
[](<#(resource) beta.threads > (method) create_and_run > (params) 0.non_streaming > (param) truncation_strategy > (schema)>)
##### ReturnsExpand Collapse
Run object { id, assistant\_id, cancelled\_at, 24 more }
Represents an execution run on a [thread](/docs/api-reference/threads).
id: string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) id>)
assistant\_id: string
The ID of the [assistant](/docs/api-reference/assistants) used for execution of this run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) assistant_id>)
cancelled\_at: number
The Unix timestamp (in seconds) for when the run was cancelled.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) cancelled_at>)
completed\_at: number
The Unix timestamp (in seconds) for when the run was completed.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) completed_at>)
created\_at: number
The Unix timestamp (in seconds) for when the run was created.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) created_at>)
expires\_at: number
The Unix timestamp (in seconds) for when the run will expire.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) expires_at>)
failed\_at: number
The Unix timestamp (in seconds) for when the run failed.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) failed_at>)
incomplete\_details: object { reason }
Details on why the run is incomplete. Will be `null` if the run is not incomplete.
reason: optional "max\_completion\_tokens" or "max\_prompt\_tokens"
The reason why the run is incomplete. This will point to which specific token limit was reached over the course of the run.
One of the following:
"max\_completion\_tokens"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
"max\_prompt\_tokens"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details>)
instructions: string
The instructions that the [assistant](/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) instructions>)
last\_error: object { code, message }
The last error associated with this run. Will be `null` if there are no errors.
code: "server\_error" or "rate\_limit\_exceeded" or "invalid\_prompt"
One of `server\_error`, `rate\_limit\_exceeded`, or `invalid\_prompt`.
One of the following:
"server\_error"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 0>)
"rate\_limit\_exceeded"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 1>)
"invalid\_prompt"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code>)
message: string
A human-readable description of the error.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) message>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error>)
max\_completion\_tokens: number
The maximum number of completion tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) max_completion_tokens>)
max\_prompt\_tokens: number
The maximum number of prompt tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) max_prompt_tokens>)
metadata: [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) metadata>)
model: string
The model that the [assistant](/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) model>)
object: "thread.run"
The object type, which is always `thread.run`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) object>)
parallel\_tool\_calls: boolean
Whether to enable [parallel function calling](/docs/guides/function-calling#configuring-parallel-function-calling) during tool use.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) parallel_tool_calls>)
required\_action: object { submit\_tool\_outputs, type }
Details on the action required to continue the run. Will be `null` if no action is required.
submit\_tool\_outputs: object { tool\_calls }
Details on the tool outputs needed for this run to continue.
tool\_calls: array of [RequiredActionFunctionToolCall](</api/reference/resources/beta#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema)>) { id, function, type }
A list of the relevant tool calls.
id: string
The ID of the tool call. This ID must be referenced when you submit the tool outputs in using the [Submit tool outputs to run](/docs/api-reference/runs/submitToolOutputs) endpoint.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) id>)
function: object { arguments, name }
The function definition.
arguments: string
The arguments that the model expects you to pass to the function.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) arguments>)
name: string
The name of the function.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function>)
type: "function"
The type of tool call the output is required for. For now, this is always `function`.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs > (property) tool_calls>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs>)
type: "submit\_tool\_outputs"
For now, this is always `submit\_tool\_outputs`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) required_action>)
response\_format: [AssistantResponseFormatOption](</api/reference/resources/beta#(resource) beta.threads > (model) assistant_response_format_option > (schema)>)
Specifies the format that the model must output. Compatible with [GPT-4o](/docs/models#gpt-4o), [GPT-4 Turbo](/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly “stuck” request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
One of the following:
"auto"
`auto` is the default value
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0>)
ResponseFormatText object { type }
Default response format. Used to generate text responses.
type: "text"
The type of response format being defined. Always `text`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema)>)
ResponseFormatJSONObject object { type }
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
type: "json\_object"
The type of response format being defined. Always `json\_object`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema)>)
ResponseFormatJSONSchema object { json\_schema, type }
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](/docs/guides/structured-outputs).
json\_schema: object { name, description, schema, strict }
Structured Outputs configuration options, including a JSON Schema.
name: string
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
description: optional string
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
schema: optional map[unknown]
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
strict: optional boolean
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](/docs/guides/structured-outputs).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
type: "json\_schema"
The type of response format being defined. Always `json\_schema`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema)>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format>)
started\_at: number
The Unix timestamp (in seconds) for when the run was started.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) started_at>)
status: "queued" or "in\_progress" or "requires\_action" or 6 more
The status of the run, which can be either `queued`, `in\_progress`, `requires\_action`, `cancelling`, `cancelled`, `failed`, `completed`, `incomplete`, or `expired`.
One of the following:
"queued"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 0>)
"in\_progress"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 1>)
"requires\_action"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 2>)
"cancelling"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 3>)
"cancelled"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 4>)
"failed"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 5>)
"completed"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 6>)
"incomplete"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 7>)
"expired"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status > (member) 8>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status>)
thread\_id: string
The ID of the [thread](/docs/api-reference/threads) that was executed on as a part of this run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) thread_id>)
tool\_choice: [AssistantToolChoiceOption](</api/reference/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_option > (schema)>)
Controls which (if any) tool is called by the model.
`none` means the model will not call any tools and instead generates a message.
`auto` is the default value and means the model can pick between generating a message or calling one or more tools.
`required` means the model must call one or more tools before responding to the user.
Specifying a particular tool like `{"type": "file\_search"}` or `{"type": "function", "function": {"name": "my\_function"}}` forces the model to call that tool.
One of the following:
"none" or "auto" or "required"
`none` means the model will not call any tools and instead generates a message. `auto` means the model can pick between generating a message or calling one or more tools. `required` means the model must call one or more tools before responding to the user.
One of the following:
"none"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 0>)
"auto"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 1>)
"required"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0>)
AssistantToolChoice object { type, function }
Specifies a tool the model should use. Use to force the model to call a specific tool.
type: "function" or "code\_interpreter" or "file\_search"
The type of the tool. If type is `function`, the function name must be set
One of the following:
"function"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 0>)
"code\_interpreter"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 1>)
"file\_search"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type>)
function: optional [AssistantToolChoiceFunction](</api/reference/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_function > (schema)>) { name }
name: string
The name of the function to call.
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function + (resource) beta.threads > (model) assistant_tool_choice_function > (schema) > (property) name>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema)>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice>)
tools: array of [CodeInterpreterTool](</api/reference/resources/beta#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>) { type } or [FileSearchTool](</api/reference/resources/beta#(resource) beta.assistants > (model) file_search_tool > (schema)>) { type, file\_search } or [FunctionTool](</api/reference/resources/beta#(resource) beta.assistants > (model) function_tool > (schema)>) { function, type }
The list of tools that the [assistant](/docs/api-reference/assistants) used for this run.
One of the following:
CodeInterpreterTool object { type }
type: "code\_interpreter"
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
FileSearchTool object { type, file\_search }
type: "file\_search"
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
file\_search: optional object { max\_num\_results, ranking\_options }
Overrides for the file search tool.
max\_num\_results: optional number
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
ranking\_options: optional object { score\_threshold, ranker }
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
score\_threshold: number
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
ranker: optional "auto" or "default\_2024\_08\_21"
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
"auto"
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
"default\_2024\_08\_21"
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search>)
[](<#(resource) beta.assistants > (model) file_search_tool > (schema)>)
FunctionTool object { function, type }
function: [FunctionDefinition](</api/reference/resources/$shared#(resource) $shared > (model) function_definition > (schema)>) { name, description, parameters, strict }
name: string
The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) name>)
description: optional string
A description of what the function does, used by the model to choose when and how to call the function.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) description>)
parameters: optional [FunctionParameters](</api/reference/resources/$shared#(resource) $shared > (model) function_parameters > (schema)>)
The parameters the functions accepts, described as a JSON Schema object. See the [guide](/docs/guides/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for documentation about the format.
Omitting `parameters` defines a function with an empty parameter list.
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) parameters>)
strict: optional boolean
Whether to enable strict schema adherence when generating the function call. If set to true, the model will follow the exact schema defined in the `parameters` field. Only a subset of JSON Schema is supported when `strict` is `true`. Learn more about Structured Outputs in the [function calling guide](/docs/guides/function-calling).
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function + (resource) $shared > (model) function_definition > (schema) > (property) strict>)
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
type: "function"
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tools>)
truncation\_strategy: object { type, last\_messages }
Controls for how a thread will be truncated prior to the run. Use this to control the initial context window of the run.
type: "auto" or "last\_messages"
The truncation strategy to use for the thread. The default is `auto`. If set to `last\_messages`, the thread will be truncated to the n most recent messages in the thread. When set to `auto`, messages in the middle of the thread will be dropped to fit the context length of the model, `max\_prompt\_tokens`.
One of the following:
"auto"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 0>)
"last\_messages"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 1>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type>)
last\_messages: optional number
The number of most recent messages from the thread when constructing the context for the run.
minimum1
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) last_messages>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy>)
usage: object { completion\_tokens, prompt\_tokens, total\_tokens }
Usage statistics related to the run. This value will be `null` if the run is not in a terminal state (i.e. `in\_progress`, `queued`, etc.).
completion\_tokens: number
Number of completion tokens used over the course of the run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) completion_tokens>)
prompt\_tokens: number
Number of prompt tokens used over the course of the run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) prompt_tokens>)
total\_tokens: number
Total number of tokens used (prompt + completion).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) total_tokens>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) usage>)
temperature: optional number
The sampling temperature used for this run. If not set, defaults to 1.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) temperature>)
top\_p: optional number
The nucleus sampling value used for this run. If not set, defaults to 1.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) top_p>)
[](<#(resource) beta.threads.runs > (model) run > (schema)>)
DefaultStreamingStreaming with Functions
### Create thread and run
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
`curl https://api.openai.com/v1/threads/runs \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-H "Content-Type: application/json" \\
-H "OpenAI-Beta: assistants=v2" \\
-d '{
"assistant\_id": "asst\_abc123",
"thread": {
"messages": [
{"role": "user", "content": "Explain deep learning to a 5 year old."}
]
}
}'
`
```
```
`{
"id": "run\_abc123",
"object": "thread.run",
"created\_at": 1699076792,
"assistant\_id": "asst\_abc123",
"thread\_id": "thread\_abc123",
"status": "queued",
"started\_at": null,
"expires\_at": 1699077392,
"cancelled\_at": null,
"failed\_at": null,
"completed\_at": null,
"required\_action": null,
"last\_error": null,
"model": "gpt-4o",
"instructions": "You are a helpful assistant.",
"tools": [],
"tool\_resources": {},
"metadata": {},
"temperature": 1.0,
"top\_p": 1.0,
"max\_completion\_tokens": null,
"max\_prompt\_tokens": null,
"truncation\_strategy": {
"type": "auto",
"last\_messages": null
},
"incomplete\_details": null,
"usage": null,
"response\_format": "auto",
"tool\_choice": "auto",
"parallel\_tool\_calls": true
}
`
```
### Create thread and run
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
`curl https://api.openai.com/v1/threads/runs \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-H "Content-Type: application/json" \\
-H "OpenAI-Beta: assistants=v2" \\
-d '{
"assistant\_id": "asst\_123",
"thread": {
"messages": [
{"role": "user", "content": "Hello"}
]
},
"stream": true
}'
`
```
```
`event: thread.created
data: {"id":"thread\_123","object":"thread","created\_at":1710348075,"metadata":{}}
event: thread.run.created
data: {"id":"run\_123","object":"thread.run","created\_at":1710348075,"assistant\_id":"asst\_123","thread\_id":"thread\_123","status":"queued","started\_at":null,"expires\_at":1710348675,"cancelled\_at":null,"failed\_at":null,"completed\_at":null,"required\_action":null,"last\_error":null,"model":"gpt-4o","instructions":null,"tools":[],"tool\_resources":{},"metadata":{},"temperature":1.0,"top\_p":1.0,"max\_completion\_tokens":null,"max\_prompt\_tokens":null,"truncation\_strategy":{"type":"auto","last\_messages":null},"incomplete\_details":null,"usage":null,"response\_format":"auto","tool\_choice":"auto","parallel\_tool\_calls":true}
event: thread.run.queued
data: {"id":"run\_123","object":"thread.run","created\_at":1710348075,"assistant\_id":"asst\_123","thread\_id":"thread\_123","status":"queued","started\_at":null,"expires\_at":1710348675,"cancelled\_at":null,"failed\_at":null,"completed\_at":null,"required\_action":null,"last\_error":null,"model":"gpt-4o","instructions":null,"tools":[],"tool\_resources":{},"metadata":{},"temperature":1.0,"top\_p":1.0,"max\_completion\_tokens":null,"max\_prompt\_tokens":null,"truncation\_strategy":{"type":"auto","last\_messages":null},"incomplete\_details":null,"usage":null,"response\_format":"auto","tool\_choice":"auto","parallel\_tool\_calls":true}
event: thread.run.in\_progress
data: {"id":"run\_123","object":"thread.run","created\_at":1710348075,"assistant\_id":"asst\_123","thread\_id":"thread\_123","status":"in\_progress","started\_at":null,"expires\_at":1710348675,"cancelled\_at":null,"failed\_at":null,"completed\_at":null,"required\_action":null,"last\_error":null,"model":"gpt-4o","instructions":null,"tools":[],"tool\_resources":{},"metadata":{},"temperature":1.0,"top\_p":1.0,"max\_completion\_tokens":null,"max\_prompt\_tokens":null,"truncation\_strategy":{"type":"auto","last\_messages":null},"incomplete\_details":null,"usage":null,"response\_format":"auto","tool\_choice":"auto","parallel\_tool\_calls":true}
event: thread.run.step.created
data: {"id":"step\_001","object":"thread.run.step","created\_at":1710348076,"run\_id":"run\_123","assistant\_id":"asst\_123","thread\_id":"thread\_123","type":"message\_creation","status":"in\_progress","cancelled\_at":null,"completed\_at":null,"expires\_at":1710348675,"failed\_at":null,"last\_error":null,"step\_details":{"type":"message\_creation","message\_creation":{"message\_id":"msg\_001"}},"usage":null}
event: thread.run.step.in\_progress
data: {"id":"step\_001","object":"thread.run.step","created\_at":1710348076,"run\_id":"run\_123","assistant\_id":"asst\_123","thread\_id":"thread\_123","type":"message\_creation","status":"in\_progress","cancelled\_at":null,"completed\_at":null,"expires\_at":1710348675,"failed\_at":null,"last\_error":null,"step\_details":{"type":"message\_creation","message\_creation":{"message\_id":"msg\_001"}},"usage":null}
event: thread.message.created
data: {"id":"msg\_001","object":"thread.message","created\_at":1710348076,"assistant\_id":"asst\_123","thread\_id":"thread\_123","run\_id":"run\_123","status":"in\_progress","incomplete\_details":null,"incomplete\_at":null,"completed\_at":null,"role":"assistant","content":[], "metadata":{}}
event: thread.message.in\_progress
data: {"id":"msg\_001","object":"thread.message","created\_at":1710348076,"assistant\_id":"asst\_123","thread\_id":"thread\_123","run\_id":"run\_123","status":"in\_progress","incomplete\_details":null,"incomplete\_at":null,"completed\_at":null,"role":"assistant","content":[], "metadata":{}}
event: thread.message.delta
data: {"id":"msg\_001","object":"thread.message.delta","delta":{"content":[{"index":0,"type":"text","text":{"value":"Hello","annotations":[]}}]}}
...
event: thread.message.delta
data: {"id":"msg\_001","object":"thread.message.delta","delta":{"content":[{"index":0,"type":"text","text":{"value":" today"}}]}}
event: thread.message.delta
data: {"id":"msg\_001","object":"thread.message.delta","delta":{"content":[{"index":0,"type":"text","text":{"value":"?"}}]}}
event: thread.message.completed
data: {"id":"msg\_001","object":"thread.message","created\_at":1710348076,"assistant\_id":"asst\_123","thread\_id":"thread\_123","run\_id":"run\_123","status":"completed","incomplete\_details":null,"incomplete\_at":null,"completed\_at":1710348077,"role":"assistant","content":[{"type":"text","text":{"value":"Hello! How can I assist you today?","annotations":[]}}], "metadata":{}}
event: thread.run.step.completed
data: {"id":"step\_001","object":"thread.run.step","created\_at":1710348076,"run\_id":"run\_123","assistant\_id":"asst\_123","thread\_id":"thread\_123","type":"message\_creation","status":"completed","cancelled\_at":null,"completed\_at":1710348077,"expires\_at":1710348675,"failed\_at":null,"last\_error":null,"step\_details":{"type":"message\_creation","message\_creation":{"message\_id":"msg\_001"}},"usage":{"prompt\_tokens":20,"completion\_tokens":11,"total\_tokens":31}}
event: thread.run.completed
{"id":"run\_123","object":"thread.run","created\_at":1710348076,"assistant\_id":"asst\_123","thread\_id":"thread\_123","status":"completed","started\_at":1713226836,"expires\_at":null,"cancelled\_at":null,"failed\_at":null,"completed\_at":1713226837,"required\_action":null,"last\_error":null,"model":"gpt-4o","instructions":null,"tools":[],"metadata":{},"temperature":1.0,"top\_p":1.0,"max\_completion\_tokens":null,"max\_prompt\_tokens":null,"truncation\_strategy":{"type":"auto","last\_messages":null},"incomplete\_details":null,"usage":{"prompt\_tokens":345,"completion\_tokens":11,"total\_tokens":356},"response\_format":"auto","tool\_choice":"auto","parallel\_tool\_calls":true}
event: done
data: [DONE]
`
```
### Create thread and run
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
`curl https://api.openai.com/v1/threads/runs \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-H "Content-Type: application/json" \\
-H "OpenAI-Beta: assistants=v2" \\
-d '{
"assistant\_id": "asst\_abc123",
"thread": {
"messages": [
{"role": "user", "content": "What is the weather like in San Francisco?"}
]
},
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
"stream": true
}'
`
```
```
`event: thread.created
data: {"id":"thread\_123","object":"thread","created\_at":1710351818,"metadata":{}}
event: thread.run.created
data: {"id":"run\_123","object":"thread.run","created\_at":1710351818,"assistant\_id":"asst\_123","thread\_id":"thread\_123","status":"queued","started\_at":null,"expires\_at":1710352418,"cancelled\_at":null,"failed\_at":null,"completed\_at":null,"required\_action":null,"last\_error":null,"model":"gpt-4o","instructions":null,"tools":[{"type":"function","function":{"name":"get\_current\_weather","description":"Get the current weather in a given location","parameters":{"type":"object","properties":{"location":{"type":"string","description":"The city and state, e.g. San Francisco, CA"},"unit":{"type":"string","enum":["celsius","fahrenheit"]}},"required":["location"]}}}],"metadata":{},"temperature":1.0,"top\_p":1.0,"max\_completion\_tokens":null,"max\_prompt\_tokens":null,"truncation\_strategy":{"type":"auto","last\_messages":null},"incomplete\_details":null,"usage":null,"response\_format":"auto","tool\_choice":"auto","parallel\_tool\_calls":true}}
event: thread.run.queued
data: {"id":"run\_123","object":"thread.run","created\_at":1710351818,"assistant\_id":"asst\_123","thread\_id":"thread\_123","status":"queued","started\_at":null,"expires\_at":1710352418,"cancelled\_at":null,"failed\_at":null,"completed\_at":null,"required\_action":null,"last\_error":null,"model":"gpt-4o","instructions":null,"tools":[{"type":"function","function":{"name":"get\_current\_weather","description":"Get the current weather in a given location","parameters":{"type":"object","properties":{"location":{"type":"string","description":"The city and state, e.g. San Francisco, CA"},"unit":{"type":"string","enum":["celsius","fahrenheit"]}},"required":["location"]}}}],"metadata":{},"temperature":1.0,"top\_p":1.0,"max\_completion\_tokens":null,"max\_prompt\_tokens":null,"truncation\_strategy":{"type":"auto","last\_messages":null},"incomplete\_details":null,"usage":null,"response\_format":"auto","tool\_choice":"auto","parallel\_tool\_calls":true}}
event: thread.run.in\_progress
data: {"id":"run\_123","object":"thread.run","created\_at":1710351818,"assistant\_id":"asst\_123","thread\_id":"thread\_123","status":"in\_progress","started\_at":1710351818,"expires\_at":1710352418,"cancelled\_at":null,"failed\_at":null,"completed\_at":null,"required\_action":null,"last\_error":null,"model":"gpt-4o","instructions":null,"tools":[{"type":"function","function":{"name":"get\_current\_weather","description":"Get the current weather in a given location","parameters":{"type":"object","properties":{"location":{"type":"string","description":"The city and state, e.g. San Francisco, CA"},"unit":{"type":"string","enum":["celsius","fahrenheit"]}},"required":["location"]}}}],"metadata":{},"temperature":1.0,"top\_p":1.0,"max\_completion\_tokens":null,"max\_prompt\_tokens":null,"truncation\_strategy":{"type":"auto","last\_messages":null},"incomplete\_details":null,"usage":null,"response\_format":"auto","tool\_choice":"auto","parallel\_tool\_calls":true}}
event: thread.run.step.created
data: {"id":"step\_001","object":"thread.run.step","created\_at":1710351819,"run\_id":"run\_123","assistant\_id":"asst\_123","thread\_id":"thread\_123","type":"tool\_calls","status":"in\_progress","cancelled\_at":null,"completed\_at":null,"expires\_at":1710352418,"failed\_at":null,"last\_error":null,"step\_details":{"type":"tool\_calls","tool\_calls":[]},"usage":null}
event: thread.run.step.in\_progress
data: {"id":"step\_001","object":"thread.run.step","created\_at":1710351819,"run\_id":"run\_123","assistant\_id":"asst\_123","thread\_id":"thread\_123","type":"tool\_calls","status":"in\_progress","cancelled\_at":null,"completed\_at":null,"expires\_at":1710352418,"failed\_at":null,"last\_error":null,"step\_details":{"type":"tool\_calls","tool\_calls":[]},"usage":null}
event: thread.run.step.delta
data: {"id":"step\_001","object":"thread.run.step.delta","delta":{"step\_details":{"type":"tool\_calls","tool\_calls":[{"index":0,"id":"call\_XXNp8YGaFrjrSjgqxtC8JJ1B","type":"function","function":{"name":"get\_current\_weather","arguments":"","output":null}}]}}}
event: thread.run.step.delta
data: {"id":"step\_001","object":"thread.run.step.delta","delta":{"step\_details":{"type":"tool\_calls","tool\_calls":[{"index":0,"type":"function","function":{"arguments":"{\\""}}]}}}
event: thread.run.step.delta
data: {"id":"step\_001","object":"thread.run.step.delta","delta":{"step\_details":{"type":"tool\_calls","tool\_calls":[{"index":0,"type":"function","function":{"arguments":"location"}}]}}}
...
event: thread.run.step.delta
data: {"id":"step\_001","object":"thread.run.step.delta","delta":{"step\_details":{"type":"tool\_calls","tool\_calls":[{"index":0,"type":"function","function":{"arguments":"ahrenheit"}}]}}}
event: thread.run.step.delta
data: {"id":"step\_001","object":"thread.run.step.delta","delta":{"step\_details":{"type":"tool\_calls","tool\_calls":[{"index":0,"type":"function","function":{"arguments":"\\"}"}}]}}}
event: thread.run.requires\_action
data: {"id":"run\_123","object":"thread.run","created\_at":1710351818,"assistant\_id":"asst\_123","thread\_id":"thread\_123","status":"requires\_action","started\_at":1710351818,"expires\_at":1710352418,"cancelled\_at":null,"failed\_at":null,"completed\_at":null,"required\_action":{"type":"submit\_tool\_outputs","submit\_tool\_outputs":{"tool\_calls":[{"id":"call\_XXNp8YGaFrjrSjgqxtC8JJ1B","type":"function","function":{"name":"get\_current\_weather","arguments":"{\\"location\\":\\"San Francisco, CA\\",\\"unit\\":\\"fahrenheit\\"}"}}]}},"last\_error":null,"model":"gpt-4o","instructions":null,"tools":[{"type":"function","function":{"name":"get\_current\_weather","description":"Get the current weather in a given location","parameters":{"type":"object","properties":{"location":{"type":"string","description":"The city and state, e.g. San Francisco, CA"},"unit":{"type":"string","enum":["celsius","fahrenheit"]}},"required":["location"]}}}],"metadata":{},"temperature":1.0,"top\_p":1.0,"max\_completion\_tokens":null,"max\_prompt\_tokens":null,"truncation\_strategy":{"type":"auto","last\_messages":null},"incomplete\_details":null,"usage":{"prompt\_tokens":345,"completion\_tokens":11,"total\_tokens":356},"response\_format":"auto","tool\_choice":"auto","parallel\_tool\_calls":true}}
event: done
data: [DONE]
`
```
##### Returns Examples
```
`{
"id": "run\_abc123",
"object": "thread.run",
"created\_at": 1699076792,
"assistant\_id": "asst\_abc123",
"thread\_id": "thread\_abc123",
"status": "queued",
"started\_at": null,
"expires\_at": 1699077392,
"cancelled\_at": null,
"failed\_at": null,
"completed\_at": null,
"required\_action": null,
"last\_error": null,
"model": "gpt-4o",
"instructions": "You are a helpful assistant.",
"tools": [],
"tool\_resources": {},
"metadata": {},
"temperature": 1.0,
"top\_p": 1.0,
"max\_completion\_tokens": null,
"max\_prompt\_tokens": null,
"truncation\_strategy": {
"type": "auto",
"last\_messages": null
},
"incomplete\_details": null,
"usage": null,
"response\_format": "auto",
"tool\_choice": "auto",
"parallel\_tool\_calls": true
}
`
```