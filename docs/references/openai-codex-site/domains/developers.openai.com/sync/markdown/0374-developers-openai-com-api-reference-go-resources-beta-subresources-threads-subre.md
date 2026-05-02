Create run | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Beta](/api/reference/go/resources/beta)
[Threads](/api/reference/go/resources/beta/subresources/threads)
[Runs](/api/reference/go/resources/beta/subresources/threads/subresources/runs)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create run
Deprecated: The Assistants API is deprecated in favor of the Responses API
client.Beta.Threads.Runs.New(ctx, threadID, params) (\*[Run](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>), error)
POST/threads/{thread\_id}/runs
Create a run.
##### ParametersExpand Collapse
threadID string
[](<#(resource) beta.threads.runs > (method) create > (params) default.non_streaming > (param) thread_id > (schema)>)
params BetaThreadRunNewParams
AssistantID param.Field[string]
Body param: The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) to use to execute this run.
[](<#(resource) beta.threads.runs > (method) create > (params) default.non_streaming > (param) assistant_id>)
Include param.Field[[][RunStepInclude](</api/reference/go/resources/beta#(resource) beta.threads.runs.steps > (model) run_step_include > (schema)>)]Optional
Query param: A list of additional fields to include in the response. Currently the only supported value is `step\_details.tool\_calls[\*].file\_search.results[\*].content` to fetch the file search result content.
See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
const RunStepIncludeStepDetailsToolCallsFileSearchResultsContent [RunStepInclude](</api/reference/go/resources/beta#(resource) beta.threads.runs.steps > (model) run_step_include > (schema)>) = "step\_details.tool\_calls[\*].file\_search.results[\*].content"
[](<#(resource) beta.threads.runs.steps > (model) run_step_include > (schema) > (member) 0>)
[](<#(resource) beta.threads.runs > (method) create > (params) default.non_streaming > (param) include>)
AdditionalInstructions param.Field[string]Optional
Body param: Appends additional instructions at the end of the instructions for the run. This is useful for modifying the behavior on a per-run basis without overriding other instructions.
[](<#(resource) beta.threads.runs > (method) create > (params) default.non_streaming > (param) additional_instructions>)
AdditionalMessages param.Field[[]BetaThreadRunNewParamsAdditionalMessage]Optional
Body param: Adds additional messages to the thread before creating the run.
Content BetaThreadRunNewParamsAdditionalMessageContentUnion
The text contents of the message.
One of the following:
string
[](<#(resource) beta.threads.runs > (method) create > (params) default.non_streaming > (param) additional_messages > (schema) > (items) > (property) content > (variant) 0>)
[][MessageContentPartParamUnion](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) message_content_part_param > (schema)>)
One of the following:
type ImageFileContentBlock struct{…}
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
ImageFile [ImageFile](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) image_file > (schema)>)
FileID string
The [File](https://platform.openai.com/docs/api-reference/files) ID of the image in the message content. Set `purpose="vision"` when uploading the File if you need to later display the file content.
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) file_id>)
Detail ImageFileDetailOptional
Specifies the detail level of the image if specified by the user. `low` uses fewer tokens, you can opt in to high resolution using `high`.
One of the following:
const ImageFileDetailAuto ImageFileDetail = "auto"
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 0>)
const ImageFileDetailLow ImageFileDetail = "low"
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 1>)
const ImageFileDetailHigh ImageFileDetail = "high"
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) detail>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file>)
Type ImageFile
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema)>)
type ImageURLContentBlock struct{…}
References an image URL in the content of a message.
ImageURL [ImageURL](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) image_url > (schema)>)
URL string
The external URL of the image, must be a supported image types: jpeg, jpg, png, gif, webp.
formaturi
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) url>)
Detail ImageURLDetailOptional
Specifies the detail level of the image. `low` uses fewer tokens, you can opt in to high resolution using `high`. Default value is `auto`
One of the following:
const ImageURLDetailAuto ImageURLDetail = "auto"
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 0>)
const ImageURLDetailLow ImageURLDetail = "low"
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 1>)
const ImageURLDetailHigh ImageURLDetail = "high"
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) detail>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url>)
Type ImageURL
The type of the content part.
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema)>)
type TextContentBlockParam struct{…}
The text content that is part of a message.
Text string
Text content to be sent to the model
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema) > (property) text>)
Type Text
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema)>)
[](<#(resource) beta.threads.runs > (method) create > (params) default.non_streaming > (param) additional_messages > (schema) > (items) > (property) content > (variant) 1>)
[](<#(resource) beta.threads.runs > (method) create > (params) default.non_streaming > (param) additional_messages > (schema) > (items) > (property) content>)
Role string
The role of the entity that is creating the message. Allowed values include:
* `user`: Indicates the message is sent by an actual user and should be used in most cases to represent user-generated messages.
* `assistant`: Indicates the message is generated by the assistant. Use this value to insert messages from the assistant into the conversation.
One of the following:
const BetaThreadRunNewParamsAdditionalMessageRoleUser BetaThreadRunNewParamsAdditionalMessageRole = "user"
[](<#(resource) beta.threads.runs > (method) create > (params) default.non_streaming > (param) additional_messages > (schema) > (items) > (property) role > (member) 0>)
const BetaThreadRunNewParamsAdditionalMessageRoleAssistant BetaThreadRunNewParamsAdditionalMessageRole = "assistant"
[](<#(resource) beta.threads.runs > (method) create > (params) default.non_streaming > (param) additional_messages > (schema) > (items) > (property) role > (member) 1>)
[](<#(resource) beta.threads.runs > (method) create > (params) default.non_streaming > (param) additional_messages > (schema) > (items) > (property) role>)
Attachments []BetaThreadRunNewParamsAdditionalMessageAttachmentOptional
A list of files attached to the message, and the tools they should be added to.
FileID stringOptional
The ID of the file to attach to the message.
[](<#(resource) beta.threads.runs > (method) create > (params) default.non_streaming > (param) additional_messages > (schema) > (items) > (property) attachments > (items) > (property) file_id>)
Tools []BetaThreadRunNewParamsAdditionalMessageAttachmentToolUnionOptional
The tools to add this file to.
One of the following:
type CodeInterpreterTool struct{…}
Type CodeInterpreter
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
BetaThreadRunNewParamsAdditionalMessageAttachmentToolFileSearch
Type FileSearch
The type of tool being defined: `file\_search`
[](<#(resource) beta.threads.runs > (method) create > (params) default.non_streaming > (param) additional_messages > (schema) > (items) > (property) attachments > (items) > (property) tools > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.threads.runs > (method) create > (params) default.non_streaming > (param) additional_messages > (schema) > (items) > (property) attachments > (items) > (property) tools > (items) > (variant) 1>)
[](<#(resource) beta.threads.runs > (method) create > (params) default.non_streaming > (param) additional_messages > (schema) > (items) > (property) attachments > (items) > (property) tools>)
[](<#(resource) beta.threads.runs > (method) create > (params) default.non_streaming > (param) additional_messages > (schema) > (items) > (property) attachments>)
Metadata [Metadata](</api/reference/go/resources/$shared#(resource) $shared > (model) metadata > (schema)>)Optional
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.threads.runs > (method) create > (params) default.non_streaming > (param) additional_messages > (schema) > (items) > (property) metadata>)
[](<#(resource) beta.threads.runs > (method) create > (params) default.non_streaming > (param) additional_messages>)
Instructions param.Field[string]Optional
Body param: Overrides the [instructions](https://platform.openai.com/docs/api-reference/assistants/createAssistant) of the assistant. This is useful for modifying the behavior on a per-run basis.
[](<#(resource) beta.threads.runs > (method) create > (params) default.non_streaming > (param) instructions>)
MaxCompletionTokens param.Field[int64]Optional
Body param: The maximum number of completion tokens that may be used over the course of the run. The run will make a best effort to use only the number of completion tokens specified, across multiple turns of the run. If the run exceeds the number of completion tokens specified, the run will end with status `incomplete`. See `incomplete\_details` for more info.
minimum256
[](<#(resource) beta.threads.runs > (method) create > (params) default.non_streaming > (param) max_completion_tokens>)
MaxPromptTokens param.Field[int64]Optional
Body param: The maximum number of prompt tokens that may be used over the course of the run. The run will make a best effort to use only the number of prompt tokens specified, across multiple turns of the run. If the run exceeds the number of prompt tokens specified, the run will end with status `incomplete`. See `incomplete\_details` for more info.
minimum256
[](<#(resource) beta.threads.runs > (method) create > (params) default.non_streaming > (param) max_prompt_tokens>)
Metadata param.Field[[Metadata](</api/reference/go/resources/$shared#(resource) $shared > (model) metadata > (schema)>)]Optional
Body param: Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.threads.runs > (method) create > (params) default.non_streaming > (param) metadata>)
Model param.Field[[ChatModel](</api/reference/go/resources/$shared#(resource) $shared > (model) chat_model > (schema)>)]Optional
Body param: The ID of the [Model](https://platform.openai.com/docs/api-reference/models) to be used to execute this run. If a value is provided here, it will override the model associated with the assistant. If not, the model associated with the assistant will be used.
string
[](<#(resource) beta.threads.runs > (method) create > (params) default.non_streaming > (param) model > (schema) > (variant) 0>)
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
[](<#(resource) beta.threads.runs > (method) create > (params) default.non_streaming > (param) model>)
ParallelToolCalls param.Field[bool]Optional
Body param: Whether to enable [parallel function calling](https://platform.openai.com/docs/guides/function-calling#configuring-parallel-function-calling) during tool use.
[](<#(resource) beta.threads.runs > (method) create > (params) default.non_streaming > (param) parallel_tool_calls>)
ReasoningEffort param.Field[[ReasoningEffort](</api/reference/go/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>)]Optional
Body param: Constrains effort on reasoning for
[reasoning models](https://platform.openai.com/docs/guides/reasoning).
Currently supported values are `none`, `minimal`, `low`, `medium`, `high`, and `xhigh`. Reducing
reasoning effort can result in faster responses and fewer tokens used
on reasoning in a response.
* `gpt-5.1` defaults to `none`, which does not perform reasoning. The supported reasoning values for `gpt-5.1` are `none`, `low`, `medium`, and `high`. Tool calls are supported for all reasoning values in gpt-5.1.
* All models before `gpt-5.1` default to `medium` reasoning effort, and do not support `none`.
* The `gpt-5-pro` model defaults to (and only supports) `high` reasoning effort.
* `xhigh` is supported for all models after `gpt-5.1-codex-max`.
[](<#(resource) beta.threads.runs > (method) create > (params) default.non_streaming > (param) reasoning_effort>)
ResponseFormat param.Field[[AssistantResponseFormatOptionUnion](</api/reference/go/resources/beta#(resource) beta.threads > (model) assistant_response_format_option > (schema)>)]Optional
Body param: Specifies the format that the model must output. Compatible with [GPT-4o](https://platform.openai.com/docs/models#gpt-4o), [GPT-4 Turbo](https://platform.openai.com/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly “stuck” request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
[](<#(resource) beta.threads.runs > (method) create > (params) default.non_streaming > (param) response_format>)
Temperature param.Field[float64]Optional
Body param: What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
minimum0
maximum2
[](<#(resource) beta.threads.runs > (method) create > (params) default.non_streaming > (param) temperature>)
ToolChoice param.Field[[AssistantToolChoiceOptionUnion](</api/reference/go/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_option > (schema)>)]Optional
Body param: Controls which (if any) tool is called by the model.
`none` means the model will not call any tools and instead generates a message.
`auto` is the default value and means the model can pick between generating a message or calling one or more tools.
`required` means the model must call one or more tools before responding to the user.
Specifying a particular tool like `{"type": "file\_search"}` or `{"type": "function", "function": {"name": "my\_function"}}` forces the model to call that tool.
[](<#(resource) beta.threads.runs > (method) create > (params) default.non_streaming > (param) tool_choice>)
Tools param.Field[[][AssistantToolUnion](</api/reference/go/resources/beta#(resource) beta.assistants > (model) assistant_tool > (schema)>)]Optional
Body param: Override the tools the assistant can use for this run. This is useful for modifying the behavior on a per-run basis.
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
[](<#(resource) beta.threads.runs > (method) create > (params) default.non_streaming > (param) tools>)
TopP param.Field[float64]Optional
Body param: An alternative to sampling with temperature, called nucleus sampling, where the model considers the results of the tokens with top\_p probability mass. So 0.1 means only the tokens comprising the top 10% probability mass are considered.
We generally recommend altering this or temperature but not both.
minimum0
maximum1
[](<#(resource) beta.threads.runs > (method) create > (params) default.non_streaming > (param) top_p>)
TruncationStrategy param.Field[[BetaThreadRunNewParamsTruncationStrategy](</api/reference/go/resources/beta/subresources/threads/subresources/runs/methods/create#(resource) beta.threads.runs > (method) create > (params) default.non_streaming > (param) truncation_strategy > (schema)>)]Optional
Body param: Controls for how a thread will be truncated prior to the run. Use this to control the initial context window of the run.
Type string
The truncation strategy to use for the thread. The default is `auto`. If set to `last\_messages`, the thread will be truncated to the n most recent messages in the thread. When set to `auto`, messages in the middle of the thread will be dropped to fit the context length of the model, `max\_prompt\_tokens`.
One of the following:
const BetaThreadRunNewParamsTruncationStrategyTypeAuto BetaThreadRunNewParamsTruncationStrategyType = "auto"
[](<#(resource) beta.threads.runs > (method) create > (params) default.non_streaming > (param) truncation_strategy > (schema) > (property) type > (member) 0>)
const BetaThreadRunNewParamsTruncationStrategyTypeLastMessages BetaThreadRunNewParamsTruncationStrategyType = "last\_messages"
[](<#(resource) beta.threads.runs > (method) create > (params) default.non_streaming > (param) truncation_strategy > (schema) > (property) type > (member) 1>)
[](<#(resource) beta.threads.runs > (method) create > (params) default.non_streaming > (param) truncation_strategy > (schema) > (property) type>)
LastMessages int64Optional
The number of most recent messages from the thread when constructing the context for the run.
minimum1
[](<#(resource) beta.threads.runs > (method) create > (params) default.non_streaming > (param) truncation_strategy > (schema) > (property) last_messages>)
[](<#(resource) beta.threads.runs > (method) create > (params) default.non_streaming > (param) truncation_strategy>)
[](<#(resource) beta.threads.runs > (method) create > (params) default.non_streaming>)
##### ReturnsExpand Collapse
type Run struct{…}
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
ID string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) id>)
AssistantID string
The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for execution of this run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) assistant_id>)
CancelledAt int64
The Unix timestamp (in seconds) for when the run was cancelled.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) cancelled_at>)
CompletedAt int64
The Unix timestamp (in seconds) for when the run was completed.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) completed_at>)
CreatedAt int64
The Unix timestamp (in seconds) for when the run was created.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) created_at>)
ExpiresAt int64
The Unix timestamp (in seconds) for when the run will expire.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) expires_at>)
FailedAt int64
The Unix timestamp (in seconds) for when the run failed.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) failed_at>)
IncompleteDetails RunIncompleteDetails
Details on why the run is incomplete. Will be `null` if the run is not incomplete.
Reason stringOptional
The reason why the run is incomplete. This will point to which specific token limit was reached over the course of the run.
One of the following:
const RunIncompleteDetailsReasonMaxCompletionTokens RunIncompleteDetailsReason = "max\_completion\_tokens"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
const RunIncompleteDetailsReasonMaxPromptTokens RunIncompleteDetailsReason = "max\_prompt\_tokens"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details>)
Instructions string
The instructions that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) instructions>)
LastError RunLastError
The last error associated with this run. Will be `null` if there are no errors.
Code string
One of `server\_error`, `rate\_limit\_exceeded`, or `invalid\_prompt`.
One of the following:
const RunLastErrorCodeServerError RunLastErrorCode = "server\_error"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 0>)
const RunLastErrorCodeRateLimitExceeded RunLastErrorCode = "rate\_limit\_exceeded"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 1>)
const RunLastErrorCodeInvalidPrompt RunLastErrorCode = "invalid\_prompt"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code>)
Message string
A human-readable description of the error.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) message>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) last_error>)
MaxCompletionTokens int64
The maximum number of completion tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) max_completion_tokens>)
MaxPromptTokens int64
The maximum number of prompt tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) max_prompt_tokens>)
Metadata [Metadata](</api/reference/go/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) metadata>)
Model string
The model that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) model>)
Object ThreadRun
The object type, which is always `thread.run`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) object>)
ParallelToolCalls bool
Whether to enable [parallel function calling](https://platform.openai.com/docs/guides/function-calling#configuring-parallel-function-calling) during tool use.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) parallel_tool_calls>)
RequiredAction RunRequiredAction
Details on the action required to continue the run. Will be `null` if no action is required.
SubmitToolOutputs RunRequiredActionSubmitToolOutputs
Details on the tool outputs needed for this run to continue.
ToolCalls [][RequiredActionFunctionToolCall](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema)>)
A list of the relevant tool calls.
ID string
The ID of the tool call. This ID must be referenced when you submit the tool outputs in using the [Submit tool outputs to run](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) endpoint.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) id>)
Function RequiredActionFunctionToolCallFunction
The function definition.
Arguments string
The arguments that the model expects you to pass to the function.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) arguments>)
Name string
The name of the function.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function>)
Type Function
The type of tool call the output is required for. For now, this is always `function`.
[](<#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs > (property) tool_calls>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs>)
Type SubmitToolOutputs
For now, this is always `submit\_tool\_outputs`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) required_action>)
ResponseFormat [AssistantResponseFormatOptionUnion](</api/reference/go/resources/beta#(resource) beta.threads > (model) assistant_response_format_option > (schema)>)
Specifies the format that the model must output. Compatible with [GPT-4o](https://platform.openai.com/docs/models#gpt-4o), [GPT-4 Turbo](https://platform.openai.com/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly “stuck” request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
One of the following:
type Auto string
`auto` is the default value
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0>)
type ResponseFormatText struct{…}
Default response format. Used to generate text responses.
Type Text
The type of response format being defined. Always `text`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema)>)
type ResponseFormatJSONObject struct{…}
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
Type JSONObject
The type of response format being defined. Always `json\_object`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema)>)
type ResponseFormatJSONSchema struct{…}
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](https://platform.openai.com/docs/guides/structured-outputs).
JSONSchema ResponseFormatJSONSchemaJSONSchema
Structured Outputs configuration options, including a JSON Schema.
Name string
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
Description stringOptional
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
Schema map[string, any]Optional
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
Strict boolOptional
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
Type JSONSchema
The type of response format being defined. Always `json\_schema`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema)>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format>)
StartedAt int64
The Unix timestamp (in seconds) for when the run was started.
formatunixtime
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) started_at>)
Status [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>)
The status of the run, which can be either `queued`, `in\_progress`, `requires\_action`, `cancelling`, `cancelled`, `failed`, `completed`, `incomplete`, or `expired`.
One of the following:
const RunStatusQueued [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "queued"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 0>)
const RunStatusInProgress [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "in\_progress"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 1>)
const RunStatusRequiresAction [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "requires\_action"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 2>)
const RunStatusCancelling [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "cancelling"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 3>)
const RunStatusCancelled [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "cancelled"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 4>)
const RunStatusFailed [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "failed"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 5>)
const RunStatusCompleted [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "completed"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 6>)
const RunStatusIncomplete [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "incomplete"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 7>)
const RunStatusExpired [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "expired"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 8>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status>)
ThreadID string
The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) that was executed on as a part of this run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) thread_id>)
ToolChoice [AssistantToolChoiceOptionUnion](</api/reference/go/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_option > (schema)>)
Controls which (if any) tool is called by the model.
`none` means the model will not call any tools and instead generates a message.
`auto` is the default value and means the model can pick between generating a message or calling one or more tools.
`required` means the model must call one or more tools before responding to the user.
Specifying a particular tool like `{"type": "file\_search"}` or `{"type": "function", "function": {"name": "my\_function"}}` forces the model to call that tool.
One of the following:
type AssistantToolChoiceOptionAuto string
`none` means the model will not call any tools and instead generates a message. `auto` means the model can pick between generating a message or calling one or more tools. `required` means the model must call one or more tools before responding to the user.
One of the following:
const AssistantToolChoiceOptionAutoNone AssistantToolChoiceOptionAuto = "none"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 0>)
const AssistantToolChoiceOptionAutoAuto AssistantToolChoiceOptionAuto = "auto"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 1>)
const AssistantToolChoiceOptionAutoRequired AssistantToolChoiceOptionAuto = "required"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0>)
type AssistantToolChoice struct{…}
Specifies a tool the model should use. Use to force the model to call a specific tool.
Type AssistantToolChoiceType
The type of the tool. If type is `function`, the function name must be set
One of the following:
const AssistantToolChoiceTypeFunction AssistantToolChoiceType = "function"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 0>)
const AssistantToolChoiceTypeCodeInterpreter AssistantToolChoiceType = "code\_interpreter"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 1>)
const AssistantToolChoiceTypeFileSearch AssistantToolChoiceType = "file\_search"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type>)
Function [AssistantToolChoiceFunction](</api/reference/go/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_function > (schema)>)Optional
Name string
The name of the function to call.
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function + (resource) beta.threads > (model) assistant_tool_choice_function > (schema) > (property) name>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema)>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice>)
Tools [][AssistantToolUnion](</api/reference/go/resources/beta#(resource) beta.assistants > (model) assistant_tool > (schema)>)
The list of tools that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
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
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tools>)
TruncationStrategy RunTruncationStrategy
Controls for how a thread will be truncated prior to the run. Use this to control the initial context window of the run.
Type string
The truncation strategy to use for the thread. The default is `auto`. If set to `last\_messages`, the thread will be truncated to the n most recent messages in the thread. When set to `auto`, messages in the middle of the thread will be dropped to fit the context length of the model, `max\_prompt\_tokens`.
One of the following:
const RunTruncationStrategyTypeAuto RunTruncationStrategyType = "auto"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 0>)
const RunTruncationStrategyTypeLastMessages RunTruncationStrategyType = "last\_messages"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 1>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type>)
LastMessages int64Optional
The number of most recent messages from the thread when constructing the context for the run.
minimum1
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) last_messages>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy>)
Usage RunUsage
Usage statistics related to the run. This value will be `null` if the run is not in a terminal state (i.e. `in\_progress`, `queued`, etc.).
CompletionTokens int64
Number of completion tokens used over the course of the run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) completion_tokens>)
PromptTokens int64
Number of prompt tokens used over the course of the run.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) prompt_tokens>)
TotalTokens int64
Total number of tokens used (prompt + completion).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) total_tokens>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) usage>)
Temperature float64Optional
The sampling temperature used for this run. If not set, defaults to 1.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) temperature>)
TopP float64Optional
The nucleus sampling value used for this run. If not set, defaults to 1.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) top_p>)
[](<#(resource) beta.threads.runs > (model) run > (schema)>)
type AssistantStreamEventUnion interface{…}
Represents an event emitted when streaming a Run.
Each event in a server-sent events stream has an `event` and `data` property:
```
`event: thread.created
data: {"id": "thread\_123", "object": "thread", ...}`
```
We emit events whenever a new object is created, transitions to a new state, or is being
streamed in parts (deltas). For example, we emit `thread.run.created` when a new run
is created, `thread.run.completed` when a run completes, and so on. When an Assistant chooses
to create a message during a run, we emit a `thread.message.created event`, a
`thread.message.in\_progress` event, many `thread.message.delta` events, and finally a
`thread.message.completed` event.
We may add additional events over time, so we recommend handling unknown events gracefully
in your code. See the [Assistants API quickstart](https://platform.openai.com/docs/assistants/overview) to learn how to
integrate the Assistants API with streaming.
One of the following:
type AssistantStreamEventThreadCreated struct{…}
Occurs when a new [thread](https://platform.openai.com/docs/api-reference/threads/object) is created.
Data [Thread](</api/reference/go/resources/beta#(resource) beta.threads > (model) thread > (schema)>)
Represents a thread that contains [messages](https://platform.openai.com/docs/api-reference/messages).
ID string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0 > (property) data + (resource) beta.threads > (model) thread > (schema) > (property) id>)
CreatedAt int64
The Unix timestamp (in seconds) for when the thread was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0 > (property) data + (resource) beta.threads > (model) thread > (schema) > (property) created_at>)
Metadata [Metadata](</api/reference/go/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0 > (property) data + (resource) beta.threads > (model) thread > (schema) > (property) metadata>)
Object Thread
The object type, which is always `thread`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0 > (property) data + (resource) beta.threads > (model) thread > (schema) > (property) object>)
ToolResources ThreadToolResources
A set of resources that are made available to the assistant’s tools in this thread. The resources are specific to the type of tool. For example, the `code\_interpreter` tool requires a list of file IDs, while the `file\_search` tool requires a list of vector store IDs.
CodeInterpreter ThreadToolResourcesCodeInterpreterOptional
FileIDs []stringOptional
A list of [file](https://platform.openai.com/docs/api-reference/files) IDs made available to the `code\_interpreter` tool. There can be a maximum of 20 files associated with the tool.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0 > (property) data + (resource) beta.threads > (model) thread > (schema) > (property) tool_resources > (property) code_interpreter > (property) file_ids>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0 > (property) data + (resource) beta.threads > (model) thread > (schema) > (property) tool_resources > (property) code_interpreter>)
FileSearch ThreadToolResourcesFileSearchOptional
VectorStoreIDs []stringOptional
The [vector store](https://platform.openai.com/docs/api-reference/vector-stores/object) attached to this thread. There can be a maximum of 1 vector store attached to the thread.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0 > (property) data + (resource) beta.threads > (model) thread > (schema) > (property) tool_resources > (property) file_search > (property) vector_store_ids>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0 > (property) data + (resource) beta.threads > (model) thread > (schema) > (property) tool_resources > (property) file_search>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0 > (property) data + (resource) beta.threads > (model) thread > (schema) > (property) tool_resources>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0 > (property) data>)
Event ThreadCreated
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0 > (property) event>)
Enabled boolOptional
Whether to enable input audio transcription.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0 > (property) enabled>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 0>)
type AssistantStreamEventThreadRunCreated struct{…}
Occurs when a new [run](https://platform.openai.com/docs/api-reference/runs/object) is created.
Data [Run](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
ID string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) id>)
AssistantID string
The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for execution of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) assistant_id>)
CancelledAt int64
The Unix timestamp (in seconds) for when the run was cancelled.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) cancelled_at>)
CompletedAt int64
The Unix timestamp (in seconds) for when the run was completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) completed_at>)
CreatedAt int64
The Unix timestamp (in seconds) for when the run was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) created_at>)
ExpiresAt int64
The Unix timestamp (in seconds) for when the run will expire.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) expires_at>)
FailedAt int64
The Unix timestamp (in seconds) for when the run failed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) failed_at>)
IncompleteDetails RunIncompleteDetails
Details on why the run is incomplete. Will be `null` if the run is not incomplete.
Reason stringOptional
The reason why the run is incomplete. This will point to which specific token limit was reached over the course of the run.
One of the following:
const RunIncompleteDetailsReasonMaxCompletionTokens RunIncompleteDetailsReason = "max\_completion\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
const RunIncompleteDetailsReasonMaxPromptTokens RunIncompleteDetailsReason = "max\_prompt\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details>)
Instructions string
The instructions that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) instructions>)
LastError RunLastError
The last error associated with this run. Will be `null` if there are no errors.
Code string
One of `server\_error`, `rate\_limit\_exceeded`, or `invalid\_prompt`.
One of the following:
const RunLastErrorCodeServerError RunLastErrorCode = "server\_error"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 0>)
const RunLastErrorCodeRateLimitExceeded RunLastErrorCode = "rate\_limit\_exceeded"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 1>)
const RunLastErrorCodeInvalidPrompt RunLastErrorCode = "invalid\_prompt"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 2>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code>)
Message string
A human-readable description of the error.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) message>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error>)
MaxCompletionTokens int64
The maximum number of completion tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_completion_tokens>)
MaxPromptTokens int64
The maximum number of prompt tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_prompt_tokens>)
Metadata [Metadata](</api/reference/go/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) metadata>)
Model string
The model that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) model>)
Object ThreadRun
The object type, which is always `thread.run`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) object>)
ParallelToolCalls bool
Whether to enable [parallel function calling](https://platform.openai.com/docs/guides/function-calling#configuring-parallel-function-calling) during tool use.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) parallel_tool_calls>)
RequiredAction RunRequiredAction
Details on the action required to continue the run. Will be `null` if no action is required.
SubmitToolOutputs RunRequiredActionSubmitToolOutputs
Details on the tool outputs needed for this run to continue.
ToolCalls [][RequiredActionFunctionToolCall](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema)>)
A list of the relevant tool calls.
ID string
The ID of the tool call. This ID must be referenced when you submit the tool outputs in using the [Submit tool outputs to run](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) endpoint.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) id>)
Function RequiredActionFunctionToolCallFunction
The function definition.
Arguments string
The arguments that the model expects you to pass to the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) arguments>)
Name string
The name of the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function>)
Type Function
The type of tool call the output is required for. For now, this is always `function`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs > (property) tool_calls>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs>)
Type SubmitToolOutputs
For now, this is always `submit\_tool\_outputs`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action>)
ResponseFormat [AssistantResponseFormatOptionUnion](</api/reference/go/resources/beta#(resource) beta.threads > (model) assistant_response_format_option > (schema)>)
Specifies the format that the model must output. Compatible with [GPT-4o](https://platform.openai.com/docs/models#gpt-4o), [GPT-4 Turbo](https://platform.openai.com/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly “stuck” request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
One of the following:
type Auto string
`auto` is the default value
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0>)
type ResponseFormatText struct{…}
Default response format. Used to generate text responses.
Type Text
The type of response format being defined. Always `text`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema)>)
type ResponseFormatJSONObject struct{…}
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
Type JSONObject
The type of response format being defined. Always `json\_object`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema)>)
type ResponseFormatJSONSchema struct{…}
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](https://platform.openai.com/docs/guides/structured-outputs).
JSONSchema ResponseFormatJSONSchemaJSONSchema
Structured Outputs configuration options, including a JSON Schema.
Name string
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
Description stringOptional
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
Schema map[string, any]Optional
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
Strict boolOptional
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
Type JSONSchema
The type of response format being defined. Always `json\_schema`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) response_format>)
StartedAt int64
The Unix timestamp (in seconds) for when the run was started.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) started_at>)
Status [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>)
The status of the run, which can be either `queued`, `in\_progress`, `requires\_action`, `cancelling`, `cancelled`, `failed`, `completed`, `incomplete`, or `expired`.
One of the following:
const RunStatusQueued [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "queued"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 0>)
const RunStatusInProgress [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "in\_progress"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 1>)
const RunStatusRequiresAction [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "requires\_action"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 2>)
const RunStatusCancelling [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "cancelling"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 3>)
const RunStatusCancelled [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "cancelled"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 4>)
const RunStatusFailed [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "failed"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 5>)
const RunStatusCompleted [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "completed"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 6>)
const RunStatusIncomplete [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "incomplete"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 7>)
const RunStatusExpired [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "expired"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 8>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status>)
ThreadID string
The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) that was executed on as a part of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) thread_id>)
ToolChoice [AssistantToolChoiceOptionUnion](</api/reference/go/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_option > (schema)>)
Controls which (if any) tool is called by the model.
`none` means the model will not call any tools and instead generates a message.
`auto` is the default value and means the model can pick between generating a message or calling one or more tools.
`required` means the model must call one or more tools before responding to the user.
Specifying a particular tool like `{"type": "file\_search"}` or `{"type": "function", "function": {"name": "my\_function"}}` forces the model to call that tool.
One of the following:
type AssistantToolChoiceOptionAuto string
`none` means the model will not call any tools and instead generates a message. `auto` means the model can pick between generating a message or calling one or more tools. `required` means the model must call one or more tools before responding to the user.
One of the following:
const AssistantToolChoiceOptionAutoNone AssistantToolChoiceOptionAuto = "none"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 0>)
const AssistantToolChoiceOptionAutoAuto AssistantToolChoiceOptionAuto = "auto"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 1>)
const AssistantToolChoiceOptionAutoRequired AssistantToolChoiceOptionAuto = "required"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0>)
type AssistantToolChoice struct{…}
Specifies a tool the model should use. Use to force the model to call a specific tool.
Type AssistantToolChoiceType
The type of the tool. If type is `function`, the function name must be set
One of the following:
const AssistantToolChoiceTypeFunction AssistantToolChoiceType = "function"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 0>)
const AssistantToolChoiceTypeCodeInterpreter AssistantToolChoiceType = "code\_interpreter"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 1>)
const AssistantToolChoiceTypeFileSearch AssistantToolChoiceType = "file\_search"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type>)
Function [AssistantToolChoiceFunction](</api/reference/go/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_function > (schema)>)Optional
Name string
The name of the function to call.
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function + (resource) beta.threads > (model) assistant_tool_choice_function > (schema) > (property) name>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice>)
Tools [][AssistantToolUnion](</api/reference/go/resources/beta#(resource) beta.assistants > (model) assistant_tool > (schema)>)
The list of tools that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
One of the following:
type CodeInterpreterTool struct{…}
Type CodeInterpreter
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
type FileSearchTool struct{…}
Type FileSearch
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
FileSearch FileSearchToolFileSearchOptional
Overrides for the file search tool.
MaxNumResults int64Optional
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
RankingOptions FileSearchToolFileSearchRankingOptionsOptional
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
ScoreThreshold float64
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
Ranker stringOptional
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
const FileSearchToolFileSearchRankingOptionsRankerAuto FileSearchToolFileSearchRankingOptionsRanker = "auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
const FileSearchToolFileSearchRankingOptionsRankerDefault2024\_08\_21 FileSearchToolFileSearchRankingOptionsRanker = "default\_2024\_08\_21"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema)>)
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
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
Type Function
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tools>)
TruncationStrategy RunTruncationStrategy
Controls for how a thread will be truncated prior to the run. Use this to control the initial context window of the run.
Type string
The truncation strategy to use for the thread. The default is `auto`. If set to `last\_messages`, the thread will be truncated to the n most recent messages in the thread. When set to `auto`, messages in the middle of the thread will be dropped to fit the context length of the model, `max\_prompt\_tokens`.
One of the following:
const RunTruncationStrategyTypeAuto RunTruncationStrategyType = "auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 0>)
const RunTruncationStrategyTypeLastMessages RunTruncationStrategyType = "last\_messages"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type>)
LastMessages int64Optional
The number of most recent messages from the thread when constructing the context for the run.
minimum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) last_messages>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy>)
Usage RunUsage
Usage statistics related to the run. This value will be `null` if the run is not in a terminal state (i.e. `in\_progress`, `queued`, etc.).
CompletionTokens int64
Number of completion tokens used over the course of the run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) completion_tokens>)
PromptTokens int64
Number of prompt tokens used over the course of the run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) prompt_tokens>)
TotalTokens int64
Total number of tokens used (prompt + completion).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) total_tokens>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage>)
Temperature float64Optional
The sampling temperature used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) temperature>)
TopP float64Optional
The nucleus sampling value used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) top_p>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) data>)
Event ThreadRunCreated
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 1>)
type AssistantStreamEventThreadRunQueued struct{…}
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) moves to a `queued` status.
Data [Run](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
ID string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) id>)
AssistantID string
The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for execution of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) assistant_id>)
CancelledAt int64
The Unix timestamp (in seconds) for when the run was cancelled.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) cancelled_at>)
CompletedAt int64
The Unix timestamp (in seconds) for when the run was completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) completed_at>)
CreatedAt int64
The Unix timestamp (in seconds) for when the run was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) created_at>)
ExpiresAt int64
The Unix timestamp (in seconds) for when the run will expire.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) expires_at>)
FailedAt int64
The Unix timestamp (in seconds) for when the run failed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) failed_at>)
IncompleteDetails RunIncompleteDetails
Details on why the run is incomplete. Will be `null` if the run is not incomplete.
Reason stringOptional
The reason why the run is incomplete. This will point to which specific token limit was reached over the course of the run.
One of the following:
const RunIncompleteDetailsReasonMaxCompletionTokens RunIncompleteDetailsReason = "max\_completion\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
const RunIncompleteDetailsReasonMaxPromptTokens RunIncompleteDetailsReason = "max\_prompt\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details>)
Instructions string
The instructions that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) instructions>)
LastError RunLastError
The last error associated with this run. Will be `null` if there are no errors.
Code string
One of `server\_error`, `rate\_limit\_exceeded`, or `invalid\_prompt`.
One of the following:
const RunLastErrorCodeServerError RunLastErrorCode = "server\_error"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 0>)
const RunLastErrorCodeRateLimitExceeded RunLastErrorCode = "rate\_limit\_exceeded"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 1>)
const RunLastErrorCodeInvalidPrompt RunLastErrorCode = "invalid\_prompt"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 2>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code>)
Message string
A human-readable description of the error.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) message>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error>)
MaxCompletionTokens int64
The maximum number of completion tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_completion_tokens>)
MaxPromptTokens int64
The maximum number of prompt tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_prompt_tokens>)
Metadata [Metadata](</api/reference/go/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) metadata>)
Model string
The model that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) model>)
Object ThreadRun
The object type, which is always `thread.run`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) object>)
ParallelToolCalls bool
Whether to enable [parallel function calling](https://platform.openai.com/docs/guides/function-calling#configuring-parallel-function-calling) during tool use.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) parallel_tool_calls>)
RequiredAction RunRequiredAction
Details on the action required to continue the run. Will be `null` if no action is required.
SubmitToolOutputs RunRequiredActionSubmitToolOutputs
Details on the tool outputs needed for this run to continue.
ToolCalls [][RequiredActionFunctionToolCall](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema)>)
A list of the relevant tool calls.
ID string
The ID of the tool call. This ID must be referenced when you submit the tool outputs in using the [Submit tool outputs to run](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) endpoint.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) id>)
Function RequiredActionFunctionToolCallFunction
The function definition.
Arguments string
The arguments that the model expects you to pass to the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) arguments>)
Name string
The name of the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function>)
Type Function
The type of tool call the output is required for. For now, this is always `function`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs > (property) tool_calls>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs>)
Type SubmitToolOutputs
For now, this is always `submit\_tool\_outputs`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action>)
ResponseFormat [AssistantResponseFormatOptionUnion](</api/reference/go/resources/beta#(resource) beta.threads > (model) assistant_response_format_option > (schema)>)
Specifies the format that the model must output. Compatible with [GPT-4o](https://platform.openai.com/docs/models#gpt-4o), [GPT-4 Turbo](https://platform.openai.com/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly “stuck” request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
One of the following:
type Auto string
`auto` is the default value
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0>)
type ResponseFormatText struct{…}
Default response format. Used to generate text responses.
Type Text
The type of response format being defined. Always `text`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema)>)
type ResponseFormatJSONObject struct{…}
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
Type JSONObject
The type of response format being defined. Always `json\_object`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema)>)
type ResponseFormatJSONSchema struct{…}
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](https://platform.openai.com/docs/guides/structured-outputs).
JSONSchema ResponseFormatJSONSchemaJSONSchema
Structured Outputs configuration options, including a JSON Schema.
Name string
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
Description stringOptional
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
Schema map[string, any]Optional
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
Strict boolOptional
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
Type JSONSchema
The type of response format being defined. Always `json\_schema`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) response_format>)
StartedAt int64
The Unix timestamp (in seconds) for when the run was started.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) started_at>)
Status [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>)
The status of the run, which can be either `queued`, `in\_progress`, `requires\_action`, `cancelling`, `cancelled`, `failed`, `completed`, `incomplete`, or `expired`.
One of the following:
const RunStatusQueued [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "queued"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 0>)
const RunStatusInProgress [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "in\_progress"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 1>)
const RunStatusRequiresAction [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "requires\_action"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 2>)
const RunStatusCancelling [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "cancelling"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 3>)
const RunStatusCancelled [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "cancelled"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 4>)
const RunStatusFailed [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "failed"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 5>)
const RunStatusCompleted [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "completed"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 6>)
const RunStatusIncomplete [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "incomplete"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 7>)
const RunStatusExpired [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "expired"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 8>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status>)
ThreadID string
The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) that was executed on as a part of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) thread_id>)
ToolChoice [AssistantToolChoiceOptionUnion](</api/reference/go/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_option > (schema)>)
Controls which (if any) tool is called by the model.
`none` means the model will not call any tools and instead generates a message.
`auto` is the default value and means the model can pick between generating a message or calling one or more tools.
`required` means the model must call one or more tools before responding to the user.
Specifying a particular tool like `{"type": "file\_search"}` or `{"type": "function", "function": {"name": "my\_function"}}` forces the model to call that tool.
One of the following:
type AssistantToolChoiceOptionAuto string
`none` means the model will not call any tools and instead generates a message. `auto` means the model can pick between generating a message or calling one or more tools. `required` means the model must call one or more tools before responding to the user.
One of the following:
const AssistantToolChoiceOptionAutoNone AssistantToolChoiceOptionAuto = "none"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 0>)
const AssistantToolChoiceOptionAutoAuto AssistantToolChoiceOptionAuto = "auto"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 1>)
const AssistantToolChoiceOptionAutoRequired AssistantToolChoiceOptionAuto = "required"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0>)
type AssistantToolChoice struct{…}
Specifies a tool the model should use. Use to force the model to call a specific tool.
Type AssistantToolChoiceType
The type of the tool. If type is `function`, the function name must be set
One of the following:
const AssistantToolChoiceTypeFunction AssistantToolChoiceType = "function"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 0>)
const AssistantToolChoiceTypeCodeInterpreter AssistantToolChoiceType = "code\_interpreter"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 1>)
const AssistantToolChoiceTypeFileSearch AssistantToolChoiceType = "file\_search"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type>)
Function [AssistantToolChoiceFunction](</api/reference/go/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_function > (schema)>)Optional
Name string
The name of the function to call.
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function + (resource) beta.threads > (model) assistant_tool_choice_function > (schema) > (property) name>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice>)
Tools [][AssistantToolUnion](</api/reference/go/resources/beta#(resource) beta.assistants > (model) assistant_tool > (schema)>)
The list of tools that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
One of the following:
type CodeInterpreterTool struct{…}
Type CodeInterpreter
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
type FileSearchTool struct{…}
Type FileSearch
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
FileSearch FileSearchToolFileSearchOptional
Overrides for the file search tool.
MaxNumResults int64Optional
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
RankingOptions FileSearchToolFileSearchRankingOptionsOptional
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
ScoreThreshold float64
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
Ranker stringOptional
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
const FileSearchToolFileSearchRankingOptionsRankerAuto FileSearchToolFileSearchRankingOptionsRanker = "auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
const FileSearchToolFileSearchRankingOptionsRankerDefault2024\_08\_21 FileSearchToolFileSearchRankingOptionsRanker = "default\_2024\_08\_21"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema)>)
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
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
Type Function
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tools>)
TruncationStrategy RunTruncationStrategy
Controls for how a thread will be truncated prior to the run. Use this to control the initial context window of the run.
Type string
The truncation strategy to use for the thread. The default is `auto`. If set to `last\_messages`, the thread will be truncated to the n most recent messages in the thread. When set to `auto`, messages in the middle of the thread will be dropped to fit the context length of the model, `max\_prompt\_tokens`.
One of the following:
const RunTruncationStrategyTypeAuto RunTruncationStrategyType = "auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 0>)
const RunTruncationStrategyTypeLastMessages RunTruncationStrategyType = "last\_messages"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type>)
LastMessages int64Optional
The number of most recent messages from the thread when constructing the context for the run.
minimum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) last_messages>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy>)
Usage RunUsage
Usage statistics related to the run. This value will be `null` if the run is not in a terminal state (i.e. `in\_progress`, `queued`, etc.).
CompletionTokens int64
Number of completion tokens used over the course of the run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) completion_tokens>)
PromptTokens int64
Number of prompt tokens used over the course of the run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) prompt_tokens>)
TotalTokens int64
Total number of tokens used (prompt + completion).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) total_tokens>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage>)
Temperature float64Optional
The sampling temperature used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) temperature>)
TopP float64Optional
The nucleus sampling value used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) top_p>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) data>)
Event ThreadRunQueued
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 2>)
type AssistantStreamEventThreadRunInProgress struct{…}
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) moves to an `in\_progress` status.
Data [Run](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
ID string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) id>)
AssistantID string
The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for execution of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) assistant_id>)
CancelledAt int64
The Unix timestamp (in seconds) for when the run was cancelled.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) cancelled_at>)
CompletedAt int64
The Unix timestamp (in seconds) for when the run was completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) completed_at>)
CreatedAt int64
The Unix timestamp (in seconds) for when the run was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) created_at>)
ExpiresAt int64
The Unix timestamp (in seconds) for when the run will expire.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) expires_at>)
FailedAt int64
The Unix timestamp (in seconds) for when the run failed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) failed_at>)
IncompleteDetails RunIncompleteDetails
Details on why the run is incomplete. Will be `null` if the run is not incomplete.
Reason stringOptional
The reason why the run is incomplete. This will point to which specific token limit was reached over the course of the run.
One of the following:
const RunIncompleteDetailsReasonMaxCompletionTokens RunIncompleteDetailsReason = "max\_completion\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
const RunIncompleteDetailsReasonMaxPromptTokens RunIncompleteDetailsReason = "max\_prompt\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details>)
Instructions string
The instructions that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) instructions>)
LastError RunLastError
The last error associated with this run. Will be `null` if there are no errors.
Code string
One of `server\_error`, `rate\_limit\_exceeded`, or `invalid\_prompt`.
One of the following:
const RunLastErrorCodeServerError RunLastErrorCode = "server\_error"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 0>)
const RunLastErrorCodeRateLimitExceeded RunLastErrorCode = "rate\_limit\_exceeded"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 1>)
const RunLastErrorCodeInvalidPrompt RunLastErrorCode = "invalid\_prompt"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 2>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code>)
Message string
A human-readable description of the error.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) message>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error>)
MaxCompletionTokens int64
The maximum number of completion tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_completion_tokens>)
MaxPromptTokens int64
The maximum number of prompt tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_prompt_tokens>)
Metadata [Metadata](</api/reference/go/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) metadata>)
Model string
The model that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) model>)
Object ThreadRun
The object type, which is always `thread.run`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) object>)
ParallelToolCalls bool
Whether to enable [parallel function calling](https://platform.openai.com/docs/guides/function-calling#configuring-parallel-function-calling) during tool use.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) parallel_tool_calls>)
RequiredAction RunRequiredAction
Details on the action required to continue the run. Will be `null` if no action is required.
SubmitToolOutputs RunRequiredActionSubmitToolOutputs
Details on the tool outputs needed for this run to continue.
ToolCalls [][RequiredActionFunctionToolCall](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema)>)
A list of the relevant tool calls.
ID string
The ID of the tool call. This ID must be referenced when you submit the tool outputs in using the [Submit tool outputs to run](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) endpoint.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) id>)
Function RequiredActionFunctionToolCallFunction
The function definition.
Arguments string
The arguments that the model expects you to pass to the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) arguments>)
Name string
The name of the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function>)
Type Function
The type of tool call the output is required for. For now, this is always `function`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs > (property) tool_calls>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs>)
Type SubmitToolOutputs
For now, this is always `submit\_tool\_outputs`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action>)
ResponseFormat [AssistantResponseFormatOptionUnion](</api/reference/go/resources/beta#(resource) beta.threads > (model) assistant_response_format_option > (schema)>)
Specifies the format that the model must output. Compatible with [GPT-4o](https://platform.openai.com/docs/models#gpt-4o), [GPT-4 Turbo](https://platform.openai.com/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly “stuck” request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
One of the following:
type Auto string
`auto` is the default value
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0>)
type ResponseFormatText struct{…}
Default response format. Used to generate text responses.
Type Text
The type of response format being defined. Always `text`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema)>)
type ResponseFormatJSONObject struct{…}
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
Type JSONObject
The type of response format being defined. Always `json\_object`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema)>)
type ResponseFormatJSONSchema struct{…}
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](https://platform.openai.com/docs/guides/structured-outputs).
JSONSchema ResponseFormatJSONSchemaJSONSchema
Structured Outputs configuration options, including a JSON Schema.
Name string
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
Description stringOptional
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
Schema map[string, any]Optional
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
Strict boolOptional
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
Type JSONSchema
The type of response format being defined. Always `json\_schema`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) response_format>)
StartedAt int64
The Unix timestamp (in seconds) for when the run was started.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) started_at>)
Status [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>)
The status of the run, which can be either `queued`, `in\_progress`, `requires\_action`, `cancelling`, `cancelled`, `failed`, `completed`, `incomplete`, or `expired`.
One of the following:
const RunStatusQueued [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "queued"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 0>)
const RunStatusInProgress [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "in\_progress"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 1>)
const RunStatusRequiresAction [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "requires\_action"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 2>)
const RunStatusCancelling [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "cancelling"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 3>)
const RunStatusCancelled [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "cancelled"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 4>)
const RunStatusFailed [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "failed"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 5>)
const RunStatusCompleted [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "completed"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 6>)
const RunStatusIncomplete [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "incomplete"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 7>)
const RunStatusExpired [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "expired"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 8>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status>)
ThreadID string
The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) that was executed on as a part of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) thread_id>)
ToolChoice [AssistantToolChoiceOptionUnion](</api/reference/go/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_option > (schema)>)
Controls which (if any) tool is called by the model.
`none` means the model will not call any tools and instead generates a message.
`auto` is the default value and means the model can pick between generating a message or calling one or more tools.
`required` means the model must call one or more tools before responding to the user.
Specifying a particular tool like `{"type": "file\_search"}` or `{"type": "function", "function": {"name": "my\_function"}}` forces the model to call that tool.
One of the following:
type AssistantToolChoiceOptionAuto string
`none` means the model will not call any tools and instead generates a message. `auto` means the model can pick between generating a message or calling one or more tools. `required` means the model must call one or more tools before responding to the user.
One of the following:
const AssistantToolChoiceOptionAutoNone AssistantToolChoiceOptionAuto = "none"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 0>)
const AssistantToolChoiceOptionAutoAuto AssistantToolChoiceOptionAuto = "auto"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 1>)
const AssistantToolChoiceOptionAutoRequired AssistantToolChoiceOptionAuto = "required"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0>)
type AssistantToolChoice struct{…}
Specifies a tool the model should use. Use to force the model to call a specific tool.
Type AssistantToolChoiceType
The type of the tool. If type is `function`, the function name must be set
One of the following:
const AssistantToolChoiceTypeFunction AssistantToolChoiceType = "function"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 0>)
const AssistantToolChoiceTypeCodeInterpreter AssistantToolChoiceType = "code\_interpreter"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 1>)
const AssistantToolChoiceTypeFileSearch AssistantToolChoiceType = "file\_search"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type>)
Function [AssistantToolChoiceFunction](</api/reference/go/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_function > (schema)>)Optional
Name string
The name of the function to call.
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function + (resource) beta.threads > (model) assistant_tool_choice_function > (schema) > (property) name>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice>)
Tools [][AssistantToolUnion](</api/reference/go/resources/beta#(resource) beta.assistants > (model) assistant_tool > (schema)>)
The list of tools that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
One of the following:
type CodeInterpreterTool struct{…}
Type CodeInterpreter
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
type FileSearchTool struct{…}
Type FileSearch
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
FileSearch FileSearchToolFileSearchOptional
Overrides for the file search tool.
MaxNumResults int64Optional
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
RankingOptions FileSearchToolFileSearchRankingOptionsOptional
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
ScoreThreshold float64
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
Ranker stringOptional
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
const FileSearchToolFileSearchRankingOptionsRankerAuto FileSearchToolFileSearchRankingOptionsRanker = "auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
const FileSearchToolFileSearchRankingOptionsRankerDefault2024\_08\_21 FileSearchToolFileSearchRankingOptionsRanker = "default\_2024\_08\_21"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema)>)
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
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
Type Function
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tools>)
TruncationStrategy RunTruncationStrategy
Controls for how a thread will be truncated prior to the run. Use this to control the initial context window of the run.
Type string
The truncation strategy to use for the thread. The default is `auto`. If set to `last\_messages`, the thread will be truncated to the n most recent messages in the thread. When set to `auto`, messages in the middle of the thread will be dropped to fit the context length of the model, `max\_prompt\_tokens`.
One of the following:
const RunTruncationStrategyTypeAuto RunTruncationStrategyType = "auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 0>)
const RunTruncationStrategyTypeLastMessages RunTruncationStrategyType = "last\_messages"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type>)
LastMessages int64Optional
The number of most recent messages from the thread when constructing the context for the run.
minimum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) last_messages>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy>)
Usage RunUsage
Usage statistics related to the run. This value will be `null` if the run is not in a terminal state (i.e. `in\_progress`, `queued`, etc.).
CompletionTokens int64
Number of completion tokens used over the course of the run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) completion_tokens>)
PromptTokens int64
Number of prompt tokens used over the course of the run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) prompt_tokens>)
TotalTokens int64
Total number of tokens used (prompt + completion).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) total_tokens>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage>)
Temperature float64Optional
The sampling temperature used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) temperature>)
TopP float64Optional
The nucleus sampling value used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) top_p>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) data>)
Event ThreadRunInProgress
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 3>)
type AssistantStreamEventThreadRunRequiresAction struct{…}
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) moves to a `requires\_action` status.
Data [Run](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
ID string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) id>)
AssistantID string
The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for execution of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) assistant_id>)
CancelledAt int64
The Unix timestamp (in seconds) for when the run was cancelled.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) cancelled_at>)
CompletedAt int64
The Unix timestamp (in seconds) for when the run was completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) completed_at>)
CreatedAt int64
The Unix timestamp (in seconds) for when the run was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) created_at>)
ExpiresAt int64
The Unix timestamp (in seconds) for when the run will expire.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) expires_at>)
FailedAt int64
The Unix timestamp (in seconds) for when the run failed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) failed_at>)
IncompleteDetails RunIncompleteDetails
Details on why the run is incomplete. Will be `null` if the run is not incomplete.
Reason stringOptional
The reason why the run is incomplete. This will point to which specific token limit was reached over the course of the run.
One of the following:
const RunIncompleteDetailsReasonMaxCompletionTokens RunIncompleteDetailsReason = "max\_completion\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
const RunIncompleteDetailsReasonMaxPromptTokens RunIncompleteDetailsReason = "max\_prompt\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details>)
Instructions string
The instructions that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) instructions>)
LastError RunLastError
The last error associated with this run. Will be `null` if there are no errors.
Code string
One of `server\_error`, `rate\_limit\_exceeded`, or `invalid\_prompt`.
One of the following:
const RunLastErrorCodeServerError RunLastErrorCode = "server\_error"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 0>)
const RunLastErrorCodeRateLimitExceeded RunLastErrorCode = "rate\_limit\_exceeded"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 1>)
const RunLastErrorCodeInvalidPrompt RunLastErrorCode = "invalid\_prompt"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 2>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code>)
Message string
A human-readable description of the error.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) message>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error>)
MaxCompletionTokens int64
The maximum number of completion tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_completion_tokens>)
MaxPromptTokens int64
The maximum number of prompt tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_prompt_tokens>)
Metadata [Metadata](</api/reference/go/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) metadata>)
Model string
The model that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) model>)
Object ThreadRun
The object type, which is always `thread.run`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) object>)
ParallelToolCalls bool
Whether to enable [parallel function calling](https://platform.openai.com/docs/guides/function-calling#configuring-parallel-function-calling) during tool use.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) parallel_tool_calls>)
RequiredAction RunRequiredAction
Details on the action required to continue the run. Will be `null` if no action is required.
SubmitToolOutputs RunRequiredActionSubmitToolOutputs
Details on the tool outputs needed for this run to continue.
ToolCalls [][RequiredActionFunctionToolCall](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema)>)
A list of the relevant tool calls.
ID string
The ID of the tool call. This ID must be referenced when you submit the tool outputs in using the [Submit tool outputs to run](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) endpoint.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) id>)
Function RequiredActionFunctionToolCallFunction
The function definition.
Arguments string
The arguments that the model expects you to pass to the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) arguments>)
Name string
The name of the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function>)
Type Function
The type of tool call the output is required for. For now, this is always `function`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs > (property) tool_calls>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs>)
Type SubmitToolOutputs
For now, this is always `submit\_tool\_outputs`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action>)
ResponseFormat [AssistantResponseFormatOptionUnion](</api/reference/go/resources/beta#(resource) beta.threads > (model) assistant_response_format_option > (schema)>)
Specifies the format that the model must output. Compatible with [GPT-4o](https://platform.openai.com/docs/models#gpt-4o), [GPT-4 Turbo](https://platform.openai.com/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly “stuck” request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
One of the following:
type Auto string
`auto` is the default value
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0>)
type ResponseFormatText struct{…}
Default response format. Used to generate text responses.
Type Text
The type of response format being defined. Always `text`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema)>)
type ResponseFormatJSONObject struct{…}
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
Type JSONObject
The type of response format being defined. Always `json\_object`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema)>)
type ResponseFormatJSONSchema struct{…}
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](https://platform.openai.com/docs/guides/structured-outputs).
JSONSchema ResponseFormatJSONSchemaJSONSchema
Structured Outputs configuration options, including a JSON Schema.
Name string
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
Description stringOptional
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
Schema map[string, any]Optional
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
Strict boolOptional
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
Type JSONSchema
The type of response format being defined. Always `json\_schema`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) response_format>)
StartedAt int64
The Unix timestamp (in seconds) for when the run was started.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) started_at>)
Status [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>)
The status of the run, which can be either `queued`, `in\_progress`, `requires\_action`, `cancelling`, `cancelled`, `failed`, `completed`, `incomplete`, or `expired`.
One of the following:
const RunStatusQueued [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "queued"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 0>)
const RunStatusInProgress [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "in\_progress"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 1>)
const RunStatusRequiresAction [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "requires\_action"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 2>)
const RunStatusCancelling [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "cancelling"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 3>)
const RunStatusCancelled [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "cancelled"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 4>)
const RunStatusFailed [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "failed"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 5>)
const RunStatusCompleted [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "completed"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 6>)
const RunStatusIncomplete [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "incomplete"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 7>)
const RunStatusExpired [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "expired"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 8>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status>)
ThreadID string
The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) that was executed on as a part of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) thread_id>)
ToolChoice [AssistantToolChoiceOptionUnion](</api/reference/go/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_option > (schema)>)
Controls which (if any) tool is called by the model.
`none` means the model will not call any tools and instead generates a message.
`auto` is the default value and means the model can pick between generating a message or calling one or more tools.
`required` means the model must call one or more tools before responding to the user.
Specifying a particular tool like `{"type": "file\_search"}` or `{"type": "function", "function": {"name": "my\_function"}}` forces the model to call that tool.
One of the following:
type AssistantToolChoiceOptionAuto string
`none` means the model will not call any tools and instead generates a message. `auto` means the model can pick between generating a message or calling one or more tools. `required` means the model must call one or more tools before responding to the user.
One of the following:
const AssistantToolChoiceOptionAutoNone AssistantToolChoiceOptionAuto = "none"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 0>)
const AssistantToolChoiceOptionAutoAuto AssistantToolChoiceOptionAuto = "auto"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 1>)
const AssistantToolChoiceOptionAutoRequired AssistantToolChoiceOptionAuto = "required"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0>)
type AssistantToolChoice struct{…}
Specifies a tool the model should use. Use to force the model to call a specific tool.
Type AssistantToolChoiceType
The type of the tool. If type is `function`, the function name must be set
One of the following:
const AssistantToolChoiceTypeFunction AssistantToolChoiceType = "function"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 0>)
const AssistantToolChoiceTypeCodeInterpreter AssistantToolChoiceType = "code\_interpreter"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 1>)
const AssistantToolChoiceTypeFileSearch AssistantToolChoiceType = "file\_search"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type>)
Function [AssistantToolChoiceFunction](</api/reference/go/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_function > (schema)>)Optional
Name string
The name of the function to call.
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function + (resource) beta.threads > (model) assistant_tool_choice_function > (schema) > (property) name>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice>)
Tools [][AssistantToolUnion](</api/reference/go/resources/beta#(resource) beta.assistants > (model) assistant_tool > (schema)>)
The list of tools that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
One of the following:
type CodeInterpreterTool struct{…}
Type CodeInterpreter
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
type FileSearchTool struct{…}
Type FileSearch
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
FileSearch FileSearchToolFileSearchOptional
Overrides for the file search tool.
MaxNumResults int64Optional
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
RankingOptions FileSearchToolFileSearchRankingOptionsOptional
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
ScoreThreshold float64
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
Ranker stringOptional
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
const FileSearchToolFileSearchRankingOptionsRankerAuto FileSearchToolFileSearchRankingOptionsRanker = "auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
const FileSearchToolFileSearchRankingOptionsRankerDefault2024\_08\_21 FileSearchToolFileSearchRankingOptionsRanker = "default\_2024\_08\_21"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema)>)
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
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
Type Function
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tools>)
TruncationStrategy RunTruncationStrategy
Controls for how a thread will be truncated prior to the run. Use this to control the initial context window of the run.
Type string
The truncation strategy to use for the thread. The default is `auto`. If set to `last\_messages`, the thread will be truncated to the n most recent messages in the thread. When set to `auto`, messages in the middle of the thread will be dropped to fit the context length of the model, `max\_prompt\_tokens`.
One of the following:
const RunTruncationStrategyTypeAuto RunTruncationStrategyType = "auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 0>)
const RunTruncationStrategyTypeLastMessages RunTruncationStrategyType = "last\_messages"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type>)
LastMessages int64Optional
The number of most recent messages from the thread when constructing the context for the run.
minimum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) last_messages>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy>)
Usage RunUsage
Usage statistics related to the run. This value will be `null` if the run is not in a terminal state (i.e. `in\_progress`, `queued`, etc.).
CompletionTokens int64
Number of completion tokens used over the course of the run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) completion_tokens>)
PromptTokens int64
Number of prompt tokens used over the course of the run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) prompt_tokens>)
TotalTokens int64
Total number of tokens used (prompt + completion).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) total_tokens>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage>)
Temperature float64Optional
The sampling temperature used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) temperature>)
TopP float64Optional
The nucleus sampling value used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) top_p>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) data>)
Event ThreadRunRequiresAction
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 4>)
type AssistantStreamEventThreadRunCompleted struct{…}
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) is completed.
Data [Run](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
ID string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) id>)
AssistantID string
The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for execution of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) assistant_id>)
CancelledAt int64
The Unix timestamp (in seconds) for when the run was cancelled.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) cancelled_at>)
CompletedAt int64
The Unix timestamp (in seconds) for when the run was completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) completed_at>)
CreatedAt int64
The Unix timestamp (in seconds) for when the run was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) created_at>)
ExpiresAt int64
The Unix timestamp (in seconds) for when the run will expire.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) expires_at>)
FailedAt int64
The Unix timestamp (in seconds) for when the run failed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) failed_at>)
IncompleteDetails RunIncompleteDetails
Details on why the run is incomplete. Will be `null` if the run is not incomplete.
Reason stringOptional
The reason why the run is incomplete. This will point to which specific token limit was reached over the course of the run.
One of the following:
const RunIncompleteDetailsReasonMaxCompletionTokens RunIncompleteDetailsReason = "max\_completion\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
const RunIncompleteDetailsReasonMaxPromptTokens RunIncompleteDetailsReason = "max\_prompt\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details>)
Instructions string
The instructions that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) instructions>)
LastError RunLastError
The last error associated with this run. Will be `null` if there are no errors.
Code string
One of `server\_error`, `rate\_limit\_exceeded`, or `invalid\_prompt`.
One of the following:
const RunLastErrorCodeServerError RunLastErrorCode = "server\_error"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 0>)
const RunLastErrorCodeRateLimitExceeded RunLastErrorCode = "rate\_limit\_exceeded"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 1>)
const RunLastErrorCodeInvalidPrompt RunLastErrorCode = "invalid\_prompt"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 2>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code>)
Message string
A human-readable description of the error.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) message>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error>)
MaxCompletionTokens int64
The maximum number of completion tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_completion_tokens>)
MaxPromptTokens int64
The maximum number of prompt tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_prompt_tokens>)
Metadata [Metadata](</api/reference/go/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) metadata>)
Model string
The model that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) model>)
Object ThreadRun
The object type, which is always `thread.run`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) object>)
ParallelToolCalls bool
Whether to enable [parallel function calling](https://platform.openai.com/docs/guides/function-calling#configuring-parallel-function-calling) during tool use.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) parallel_tool_calls>)
RequiredAction RunRequiredAction
Details on the action required to continue the run. Will be `null` if no action is required.
SubmitToolOutputs RunRequiredActionSubmitToolOutputs
Details on the tool outputs needed for this run to continue.
ToolCalls [][RequiredActionFunctionToolCall](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema)>)
A list of the relevant tool calls.
ID string
The ID of the tool call. This ID must be referenced when you submit the tool outputs in using the [Submit tool outputs to run](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) endpoint.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) id>)
Function RequiredActionFunctionToolCallFunction
The function definition.
Arguments string
The arguments that the model expects you to pass to the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) arguments>)
Name string
The name of the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function>)
Type Function
The type of tool call the output is required for. For now, this is always `function`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs > (property) tool_calls>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs>)
Type SubmitToolOutputs
For now, this is always `submit\_tool\_outputs`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action>)
ResponseFormat [AssistantResponseFormatOptionUnion](</api/reference/go/resources/beta#(resource) beta.threads > (model) assistant_response_format_option > (schema)>)
Specifies the format that the model must output. Compatible with [GPT-4o](https://platform.openai.com/docs/models#gpt-4o), [GPT-4 Turbo](https://platform.openai.com/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly “stuck” request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
One of the following:
type Auto string
`auto` is the default value
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0>)
type ResponseFormatText struct{…}
Default response format. Used to generate text responses.
Type Text
The type of response format being defined. Always `text`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema)>)
type ResponseFormatJSONObject struct{…}
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
Type JSONObject
The type of response format being defined. Always `json\_object`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema)>)
type ResponseFormatJSONSchema struct{…}
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](https://platform.openai.com/docs/guides/structured-outputs).
JSONSchema ResponseFormatJSONSchemaJSONSchema
Structured Outputs configuration options, including a JSON Schema.
Name string
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
Description stringOptional
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
Schema map[string, any]Optional
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
Strict boolOptional
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
Type JSONSchema
The type of response format being defined. Always `json\_schema`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) response_format>)
StartedAt int64
The Unix timestamp (in seconds) for when the run was started.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) started_at>)
Status [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>)
The status of the run, which can be either `queued`, `in\_progress`, `requires\_action`, `cancelling`, `cancelled`, `failed`, `completed`, `incomplete`, or `expired`.
One of the following:
const RunStatusQueued [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "queued"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 0>)
const RunStatusInProgress [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "in\_progress"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 1>)
const RunStatusRequiresAction [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "requires\_action"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 2>)
const RunStatusCancelling [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "cancelling"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 3>)
const RunStatusCancelled [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "cancelled"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 4>)
const RunStatusFailed [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "failed"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 5>)
const RunStatusCompleted [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "completed"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 6>)
const RunStatusIncomplete [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "incomplete"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 7>)
const RunStatusExpired [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "expired"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 8>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status>)
ThreadID string
The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) that was executed on as a part of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) thread_id>)
ToolChoice [AssistantToolChoiceOptionUnion](</api/reference/go/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_option > (schema)>)
Controls which (if any) tool is called by the model.
`none` means the model will not call any tools and instead generates a message.
`auto` is the default value and means the model can pick between generating a message or calling one or more tools.
`required` means the model must call one or more tools before responding to the user.
Specifying a particular tool like `{"type": "file\_search"}` or `{"type": "function", "function": {"name": "my\_function"}}` forces the model to call that tool.
One of the following:
type AssistantToolChoiceOptionAuto string
`none` means the model will not call any tools and instead generates a message. `auto` means the model can pick between generating a message or calling one or more tools. `required` means the model must call one or more tools before responding to the user.
One of the following:
const AssistantToolChoiceOptionAutoNone AssistantToolChoiceOptionAuto = "none"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 0>)
const AssistantToolChoiceOptionAutoAuto AssistantToolChoiceOptionAuto = "auto"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 1>)
const AssistantToolChoiceOptionAutoRequired AssistantToolChoiceOptionAuto = "required"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0>)
type AssistantToolChoice struct{…}
Specifies a tool the model should use. Use to force the model to call a specific tool.
Type AssistantToolChoiceType
The type of the tool. If type is `function`, the function name must be set
One of the following:
const AssistantToolChoiceTypeFunction AssistantToolChoiceType = "function"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 0>)
const AssistantToolChoiceTypeCodeInterpreter AssistantToolChoiceType = "code\_interpreter"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 1>)
const AssistantToolChoiceTypeFileSearch AssistantToolChoiceType = "file\_search"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type>)
Function [AssistantToolChoiceFunction](</api/reference/go/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_function > (schema)>)Optional
Name string
The name of the function to call.
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function + (resource) beta.threads > (model) assistant_tool_choice_function > (schema) > (property) name>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice>)
Tools [][AssistantToolUnion](</api/reference/go/resources/beta#(resource) beta.assistants > (model) assistant_tool > (schema)>)
The list of tools that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
One of the following:
type CodeInterpreterTool struct{…}
Type CodeInterpreter
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
type FileSearchTool struct{…}
Type FileSearch
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
FileSearch FileSearchToolFileSearchOptional
Overrides for the file search tool.
MaxNumResults int64Optional
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
RankingOptions FileSearchToolFileSearchRankingOptionsOptional
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
ScoreThreshold float64
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
Ranker stringOptional
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
const FileSearchToolFileSearchRankingOptionsRankerAuto FileSearchToolFileSearchRankingOptionsRanker = "auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
const FileSearchToolFileSearchRankingOptionsRankerDefault2024\_08\_21 FileSearchToolFileSearchRankingOptionsRanker = "default\_2024\_08\_21"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema)>)
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
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
Type Function
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tools>)
TruncationStrategy RunTruncationStrategy
Controls for how a thread will be truncated prior to the run. Use this to control the initial context window of the run.
Type string
The truncation strategy to use for the thread. The default is `auto`. If set to `last\_messages`, the thread will be truncated to the n most recent messages in the thread. When set to `auto`, messages in the middle of the thread will be dropped to fit the context length of the model, `max\_prompt\_tokens`.
One of the following:
const RunTruncationStrategyTypeAuto RunTruncationStrategyType = "auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 0>)
const RunTruncationStrategyTypeLastMessages RunTruncationStrategyType = "last\_messages"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type>)
LastMessages int64Optional
The number of most recent messages from the thread when constructing the context for the run.
minimum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) last_messages>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy>)
Usage RunUsage
Usage statistics related to the run. This value will be `null` if the run is not in a terminal state (i.e. `in\_progress`, `queued`, etc.).
CompletionTokens int64
Number of completion tokens used over the course of the run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) completion_tokens>)
PromptTokens int64
Number of prompt tokens used over the course of the run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) prompt_tokens>)
TotalTokens int64
Total number of tokens used (prompt + completion).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) total_tokens>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage>)
Temperature float64Optional
The sampling temperature used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) temperature>)
TopP float64Optional
The nucleus sampling value used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) top_p>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) data>)
Event ThreadRunCompleted
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 5>)
type AssistantStreamEventThreadRunIncomplete struct{…}
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) ends with status `incomplete`.
Data [Run](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
ID string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) id>)
AssistantID string
The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for execution of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) assistant_id>)
CancelledAt int64
The Unix timestamp (in seconds) for when the run was cancelled.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) cancelled_at>)
CompletedAt int64
The Unix timestamp (in seconds) for when the run was completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) completed_at>)
CreatedAt int64
The Unix timestamp (in seconds) for when the run was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) created_at>)
ExpiresAt int64
The Unix timestamp (in seconds) for when the run will expire.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) expires_at>)
FailedAt int64
The Unix timestamp (in seconds) for when the run failed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) failed_at>)
IncompleteDetails RunIncompleteDetails
Details on why the run is incomplete. Will be `null` if the run is not incomplete.
Reason stringOptional
The reason why the run is incomplete. This will point to which specific token limit was reached over the course of the run.
One of the following:
const RunIncompleteDetailsReasonMaxCompletionTokens RunIncompleteDetailsReason = "max\_completion\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
const RunIncompleteDetailsReasonMaxPromptTokens RunIncompleteDetailsReason = "max\_prompt\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details>)
Instructions string
The instructions that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) instructions>)
LastError RunLastError
The last error associated with this run. Will be `null` if there are no errors.
Code string
One of `server\_error`, `rate\_limit\_exceeded`, or `invalid\_prompt`.
One of the following:
const RunLastErrorCodeServerError RunLastErrorCode = "server\_error"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 0>)
const RunLastErrorCodeRateLimitExceeded RunLastErrorCode = "rate\_limit\_exceeded"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 1>)
const RunLastErrorCodeInvalidPrompt RunLastErrorCode = "invalid\_prompt"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 2>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code>)
Message string
A human-readable description of the error.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) message>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error>)
MaxCompletionTokens int64
The maximum number of completion tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_completion_tokens>)
MaxPromptTokens int64
The maximum number of prompt tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_prompt_tokens>)
Metadata [Metadata](</api/reference/go/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) metadata>)
Model string
The model that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) model>)
Object ThreadRun
The object type, which is always `thread.run`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) object>)
ParallelToolCalls bool
Whether to enable [parallel function calling](https://platform.openai.com/docs/guides/function-calling#configuring-parallel-function-calling) during tool use.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) parallel_tool_calls>)
RequiredAction RunRequiredAction
Details on the action required to continue the run. Will be `null` if no action is required.
SubmitToolOutputs RunRequiredActionSubmitToolOutputs
Details on the tool outputs needed for this run to continue.
ToolCalls [][RequiredActionFunctionToolCall](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema)>)
A list of the relevant tool calls.
ID string
The ID of the tool call. This ID must be referenced when you submit the tool outputs in using the [Submit tool outputs to run](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) endpoint.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) id>)
Function RequiredActionFunctionToolCallFunction
The function definition.
Arguments string
The arguments that the model expects you to pass to the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) arguments>)
Name string
The name of the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function>)
Type Function
The type of tool call the output is required for. For now, this is always `function`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs > (property) tool_calls>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs>)
Type SubmitToolOutputs
For now, this is always `submit\_tool\_outputs`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action>)
ResponseFormat [AssistantResponseFormatOptionUnion](</api/reference/go/resources/beta#(resource) beta.threads > (model) assistant_response_format_option > (schema)>)
Specifies the format that the model must output. Compatible with [GPT-4o](https://platform.openai.com/docs/models#gpt-4o), [GPT-4 Turbo](https://platform.openai.com/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly “stuck” request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
One of the following:
type Auto string
`auto` is the default value
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0>)
type ResponseFormatText struct{…}
Default response format. Used to generate text responses.
Type Text
The type of response format being defined. Always `text`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema)>)
type ResponseFormatJSONObject struct{…}
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
Type JSONObject
The type of response format being defined. Always `json\_object`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema)>)
type ResponseFormatJSONSchema struct{…}
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](https://platform.openai.com/docs/guides/structured-outputs).
JSONSchema ResponseFormatJSONSchemaJSONSchema
Structured Outputs configuration options, including a JSON Schema.
Name string
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
Description stringOptional
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
Schema map[string, any]Optional
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
Strict boolOptional
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
Type JSONSchema
The type of response format being defined. Always `json\_schema`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) response_format>)
StartedAt int64
The Unix timestamp (in seconds) for when the run was started.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) started_at>)
Status [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>)
The status of the run, which can be either `queued`, `in\_progress`, `requires\_action`, `cancelling`, `cancelled`, `failed`, `completed`, `incomplete`, or `expired`.
One of the following:
const RunStatusQueued [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "queued"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 0>)
const RunStatusInProgress [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "in\_progress"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 1>)
const RunStatusRequiresAction [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "requires\_action"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 2>)
const RunStatusCancelling [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "cancelling"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 3>)
const RunStatusCancelled [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "cancelled"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 4>)
const RunStatusFailed [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "failed"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 5>)
const RunStatusCompleted [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "completed"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 6>)
const RunStatusIncomplete [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "incomplete"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 7>)
const RunStatusExpired [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "expired"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 8>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status>)
ThreadID string
The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) that was executed on as a part of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) thread_id>)
ToolChoice [AssistantToolChoiceOptionUnion](</api/reference/go/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_option > (schema)>)
Controls which (if any) tool is called by the model.
`none` means the model will not call any tools and instead generates a message.
`auto` is the default value and means the model can pick between generating a message or calling one or more tools.
`required` means the model must call one or more tools before responding to the user.
Specifying a particular tool like `{"type": "file\_search"}` or `{"type": "function", "function": {"name": "my\_function"}}` forces the model to call that tool.
One of the following:
type AssistantToolChoiceOptionAuto string
`none` means the model will not call any tools and instead generates a message. `auto` means the model can pick between generating a message or calling one or more tools. `required` means the model must call one or more tools before responding to the user.
One of the following:
const AssistantToolChoiceOptionAutoNone AssistantToolChoiceOptionAuto = "none"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 0>)
const AssistantToolChoiceOptionAutoAuto AssistantToolChoiceOptionAuto = "auto"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 1>)
const AssistantToolChoiceOptionAutoRequired AssistantToolChoiceOptionAuto = "required"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0>)
type AssistantToolChoice struct{…}
Specifies a tool the model should use. Use to force the model to call a specific tool.
Type AssistantToolChoiceType
The type of the tool. If type is `function`, the function name must be set
One of the following:
const AssistantToolChoiceTypeFunction AssistantToolChoiceType = "function"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 0>)
const AssistantToolChoiceTypeCodeInterpreter AssistantToolChoiceType = "code\_interpreter"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 1>)
const AssistantToolChoiceTypeFileSearch AssistantToolChoiceType = "file\_search"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type>)
Function [AssistantToolChoiceFunction](</api/reference/go/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_function > (schema)>)Optional
Name string
The name of the function to call.
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function + (resource) beta.threads > (model) assistant_tool_choice_function > (schema) > (property) name>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice>)
Tools [][AssistantToolUnion](</api/reference/go/resources/beta#(resource) beta.assistants > (model) assistant_tool > (schema)>)
The list of tools that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
One of the following:
type CodeInterpreterTool struct{…}
Type CodeInterpreter
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
type FileSearchTool struct{…}
Type FileSearch
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
FileSearch FileSearchToolFileSearchOptional
Overrides for the file search tool.
MaxNumResults int64Optional
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
RankingOptions FileSearchToolFileSearchRankingOptionsOptional
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
ScoreThreshold float64
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
Ranker stringOptional
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
const FileSearchToolFileSearchRankingOptionsRankerAuto FileSearchToolFileSearchRankingOptionsRanker = "auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
const FileSearchToolFileSearchRankingOptionsRankerDefault2024\_08\_21 FileSearchToolFileSearchRankingOptionsRanker = "default\_2024\_08\_21"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema)>)
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
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
Type Function
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tools>)
TruncationStrategy RunTruncationStrategy
Controls for how a thread will be truncated prior to the run. Use this to control the initial context window of the run.
Type string
The truncation strategy to use for the thread. The default is `auto`. If set to `last\_messages`, the thread will be truncated to the n most recent messages in the thread. When set to `auto`, messages in the middle of the thread will be dropped to fit the context length of the model, `max\_prompt\_tokens`.
One of the following:
const RunTruncationStrategyTypeAuto RunTruncationStrategyType = "auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 0>)
const RunTruncationStrategyTypeLastMessages RunTruncationStrategyType = "last\_messages"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type>)
LastMessages int64Optional
The number of most recent messages from the thread when constructing the context for the run.
minimum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) last_messages>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy>)
Usage RunUsage
Usage statistics related to the run. This value will be `null` if the run is not in a terminal state (i.e. `in\_progress`, `queued`, etc.).
CompletionTokens int64
Number of completion tokens used over the course of the run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) completion_tokens>)
PromptTokens int64
Number of prompt tokens used over the course of the run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) prompt_tokens>)
TotalTokens int64
Total number of tokens used (prompt + completion).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) total_tokens>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage>)
Temperature float64Optional
The sampling temperature used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) temperature>)
TopP float64Optional
The nucleus sampling value used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) top_p>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) data>)
Event ThreadRunIncomplete
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 6>)
type AssistantStreamEventThreadRunFailed struct{…}
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) fails.
Data [Run](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
ID string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) id>)
AssistantID string
The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for execution of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) assistant_id>)
CancelledAt int64
The Unix timestamp (in seconds) for when the run was cancelled.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) cancelled_at>)
CompletedAt int64
The Unix timestamp (in seconds) for when the run was completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) completed_at>)
CreatedAt int64
The Unix timestamp (in seconds) for when the run was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) created_at>)
ExpiresAt int64
The Unix timestamp (in seconds) for when the run will expire.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) expires_at>)
FailedAt int64
The Unix timestamp (in seconds) for when the run failed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) failed_at>)
IncompleteDetails RunIncompleteDetails
Details on why the run is incomplete. Will be `null` if the run is not incomplete.
Reason stringOptional
The reason why the run is incomplete. This will point to which specific token limit was reached over the course of the run.
One of the following:
const RunIncompleteDetailsReasonMaxCompletionTokens RunIncompleteDetailsReason = "max\_completion\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
const RunIncompleteDetailsReasonMaxPromptTokens RunIncompleteDetailsReason = "max\_prompt\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details>)
Instructions string
The instructions that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) instructions>)
LastError RunLastError
The last error associated with this run. Will be `null` if there are no errors.
Code string
One of `server\_error`, `rate\_limit\_exceeded`, or `invalid\_prompt`.
One of the following:
const RunLastErrorCodeServerError RunLastErrorCode = "server\_error"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 0>)
const RunLastErrorCodeRateLimitExceeded RunLastErrorCode = "rate\_limit\_exceeded"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 1>)
const RunLastErrorCodeInvalidPrompt RunLastErrorCode = "invalid\_prompt"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 2>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code>)
Message string
A human-readable description of the error.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) message>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error>)
MaxCompletionTokens int64
The maximum number of completion tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_completion_tokens>)
MaxPromptTokens int64
The maximum number of prompt tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_prompt_tokens>)
Metadata [Metadata](</api/reference/go/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) metadata>)
Model string
The model that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) model>)
Object ThreadRun
The object type, which is always `thread.run`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) object>)
ParallelToolCalls bool
Whether to enable [parallel function calling](https://platform.openai.com/docs/guides/function-calling#configuring-parallel-function-calling) during tool use.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) parallel_tool_calls>)
RequiredAction RunRequiredAction
Details on the action required to continue the run. Will be `null` if no action is required.
SubmitToolOutputs RunRequiredActionSubmitToolOutputs
Details on the tool outputs needed for this run to continue.
ToolCalls [][RequiredActionFunctionToolCall](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema)>)
A list of the relevant tool calls.
ID string
The ID of the tool call. This ID must be referenced when you submit the tool outputs in using the [Submit tool outputs to run](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) endpoint.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) id>)
Function RequiredActionFunctionToolCallFunction
The function definition.
Arguments string
The arguments that the model expects you to pass to the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) arguments>)
Name string
The name of the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function>)
Type Function
The type of tool call the output is required for. For now, this is always `function`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs > (property) tool_calls>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs>)
Type SubmitToolOutputs
For now, this is always `submit\_tool\_outputs`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action>)
ResponseFormat [AssistantResponseFormatOptionUnion](</api/reference/go/resources/beta#(resource) beta.threads > (model) assistant_response_format_option > (schema)>)
Specifies the format that the model must output. Compatible with [GPT-4o](https://platform.openai.com/docs/models#gpt-4o), [GPT-4 Turbo](https://platform.openai.com/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly “stuck” request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
One of the following:
type Auto string
`auto` is the default value
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0>)
type ResponseFormatText struct{…}
Default response format. Used to generate text responses.
Type Text
The type of response format being defined. Always `text`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema)>)
type ResponseFormatJSONObject struct{…}
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
Type JSONObject
The type of response format being defined. Always `json\_object`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema)>)
type ResponseFormatJSONSchema struct{…}
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](https://platform.openai.com/docs/guides/structured-outputs).
JSONSchema ResponseFormatJSONSchemaJSONSchema
Structured Outputs configuration options, including a JSON Schema.
Name string
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
Description stringOptional
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
Schema map[string, any]Optional
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
Strict boolOptional
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
Type JSONSchema
The type of response format being defined. Always `json\_schema`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) response_format>)
StartedAt int64
The Unix timestamp (in seconds) for when the run was started.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) started_at>)
Status [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>)
The status of the run, which can be either `queued`, `in\_progress`, `requires\_action`, `cancelling`, `cancelled`, `failed`, `completed`, `incomplete`, or `expired`.
One of the following:
const RunStatusQueued [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "queued"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 0>)
const RunStatusInProgress [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "in\_progress"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 1>)
const RunStatusRequiresAction [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "requires\_action"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 2>)
const RunStatusCancelling [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "cancelling"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 3>)
const RunStatusCancelled [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "cancelled"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 4>)
const RunStatusFailed [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "failed"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 5>)
const RunStatusCompleted [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "completed"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 6>)
const RunStatusIncomplete [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "incomplete"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 7>)
const RunStatusExpired [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "expired"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 8>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status>)
ThreadID string
The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) that was executed on as a part of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) thread_id>)
ToolChoice [AssistantToolChoiceOptionUnion](</api/reference/go/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_option > (schema)>)
Controls which (if any) tool is called by the model.
`none` means the model will not call any tools and instead generates a message.
`auto` is the default value and means the model can pick between generating a message or calling one or more tools.
`required` means the model must call one or more tools before responding to the user.
Specifying a particular tool like `{"type": "file\_search"}` or `{"type": "function", "function": {"name": "my\_function"}}` forces the model to call that tool.
One of the following:
type AssistantToolChoiceOptionAuto string
`none` means the model will not call any tools and instead generates a message. `auto` means the model can pick between generating a message or calling one or more tools. `required` means the model must call one or more tools before responding to the user.
One of the following:
const AssistantToolChoiceOptionAutoNone AssistantToolChoiceOptionAuto = "none"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 0>)
const AssistantToolChoiceOptionAutoAuto AssistantToolChoiceOptionAuto = "auto"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 1>)
const AssistantToolChoiceOptionAutoRequired AssistantToolChoiceOptionAuto = "required"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0>)
type AssistantToolChoice struct{…}
Specifies a tool the model should use. Use to force the model to call a specific tool.
Type AssistantToolChoiceType
The type of the tool. If type is `function`, the function name must be set
One of the following:
const AssistantToolChoiceTypeFunction AssistantToolChoiceType = "function"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 0>)
const AssistantToolChoiceTypeCodeInterpreter AssistantToolChoiceType = "code\_interpreter"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 1>)
const AssistantToolChoiceTypeFileSearch AssistantToolChoiceType = "file\_search"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type>)
Function [AssistantToolChoiceFunction](</api/reference/go/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_function > (schema)>)Optional
Name string
The name of the function to call.
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function + (resource) beta.threads > (model) assistant_tool_choice_function > (schema) > (property) name>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice>)
Tools [][AssistantToolUnion](</api/reference/go/resources/beta#(resource) beta.assistants > (model) assistant_tool > (schema)>)
The list of tools that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
One of the following:
type CodeInterpreterTool struct{…}
Type CodeInterpreter
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
type FileSearchTool struct{…}
Type FileSearch
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
FileSearch FileSearchToolFileSearchOptional
Overrides for the file search tool.
MaxNumResults int64Optional
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
RankingOptions FileSearchToolFileSearchRankingOptionsOptional
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
ScoreThreshold float64
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
Ranker stringOptional
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
const FileSearchToolFileSearchRankingOptionsRankerAuto FileSearchToolFileSearchRankingOptionsRanker = "auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
const FileSearchToolFileSearchRankingOptionsRankerDefault2024\_08\_21 FileSearchToolFileSearchRankingOptionsRanker = "default\_2024\_08\_21"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema)>)
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
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
Type Function
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tools>)
TruncationStrategy RunTruncationStrategy
Controls for how a thread will be truncated prior to the run. Use this to control the initial context window of the run.
Type string
The truncation strategy to use for the thread. The default is `auto`. If set to `last\_messages`, the thread will be truncated to the n most recent messages in the thread. When set to `auto`, messages in the middle of the thread will be dropped to fit the context length of the model, `max\_prompt\_tokens`.
One of the following:
const RunTruncationStrategyTypeAuto RunTruncationStrategyType = "auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 0>)
const RunTruncationStrategyTypeLastMessages RunTruncationStrategyType = "last\_messages"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type>)
LastMessages int64Optional
The number of most recent messages from the thread when constructing the context for the run.
minimum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) last_messages>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy>)
Usage RunUsage
Usage statistics related to the run. This value will be `null` if the run is not in a terminal state (i.e. `in\_progress`, `queued`, etc.).
CompletionTokens int64
Number of completion tokens used over the course of the run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) completion_tokens>)
PromptTokens int64
Number of prompt tokens used over the course of the run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) prompt_tokens>)
TotalTokens int64
Total number of tokens used (prompt + completion).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) total_tokens>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage>)
Temperature float64Optional
The sampling temperature used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) temperature>)
TopP float64Optional
The nucleus sampling value used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) top_p>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) data>)
Event ThreadRunFailed
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 7>)
type AssistantStreamEventThreadRunCancelling struct{…}
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) moves to a `cancelling` status.
Data [Run](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
ID string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) id>)
AssistantID string
The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for execution of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) assistant_id>)
CancelledAt int64
The Unix timestamp (in seconds) for when the run was cancelled.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) cancelled_at>)
CompletedAt int64
The Unix timestamp (in seconds) for when the run was completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) completed_at>)
CreatedAt int64
The Unix timestamp (in seconds) for when the run was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) created_at>)
ExpiresAt int64
The Unix timestamp (in seconds) for when the run will expire.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) expires_at>)
FailedAt int64
The Unix timestamp (in seconds) for when the run failed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) failed_at>)
IncompleteDetails RunIncompleteDetails
Details on why the run is incomplete. Will be `null` if the run is not incomplete.
Reason stringOptional
The reason why the run is incomplete. This will point to which specific token limit was reached over the course of the run.
One of the following:
const RunIncompleteDetailsReasonMaxCompletionTokens RunIncompleteDetailsReason = "max\_completion\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
const RunIncompleteDetailsReasonMaxPromptTokens RunIncompleteDetailsReason = "max\_prompt\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details>)
Instructions string
The instructions that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) instructions>)
LastError RunLastError
The last error associated with this run. Will be `null` if there are no errors.
Code string
One of `server\_error`, `rate\_limit\_exceeded`, or `invalid\_prompt`.
One of the following:
const RunLastErrorCodeServerError RunLastErrorCode = "server\_error"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 0>)
const RunLastErrorCodeRateLimitExceeded RunLastErrorCode = "rate\_limit\_exceeded"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 1>)
const RunLastErrorCodeInvalidPrompt RunLastErrorCode = "invalid\_prompt"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 2>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code>)
Message string
A human-readable description of the error.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) message>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error>)
MaxCompletionTokens int64
The maximum number of completion tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_completion_tokens>)
MaxPromptTokens int64
The maximum number of prompt tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_prompt_tokens>)
Metadata [Metadata](</api/reference/go/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) metadata>)
Model string
The model that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) model>)
Object ThreadRun
The object type, which is always `thread.run`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) object>)
ParallelToolCalls bool
Whether to enable [parallel function calling](https://platform.openai.com/docs/guides/function-calling#configuring-parallel-function-calling) during tool use.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) parallel_tool_calls>)
RequiredAction RunRequiredAction
Details on the action required to continue the run. Will be `null` if no action is required.
SubmitToolOutputs RunRequiredActionSubmitToolOutputs
Details on the tool outputs needed for this run to continue.
ToolCalls [][RequiredActionFunctionToolCall](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema)>)
A list of the relevant tool calls.
ID string
The ID of the tool call. This ID must be referenced when you submit the tool outputs in using the [Submit tool outputs to run](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) endpoint.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) id>)
Function RequiredActionFunctionToolCallFunction
The function definition.
Arguments string
The arguments that the model expects you to pass to the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) arguments>)
Name string
The name of the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function>)
Type Function
The type of tool call the output is required for. For now, this is always `function`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs > (property) tool_calls>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs>)
Type SubmitToolOutputs
For now, this is always `submit\_tool\_outputs`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action>)
ResponseFormat [AssistantResponseFormatOptionUnion](</api/reference/go/resources/beta#(resource) beta.threads > (model) assistant_response_format_option > (schema)>)
Specifies the format that the model must output. Compatible with [GPT-4o](https://platform.openai.com/docs/models#gpt-4o), [GPT-4 Turbo](https://platform.openai.com/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly “stuck” request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
One of the following:
type Auto string
`auto` is the default value
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0>)
type ResponseFormatText struct{…}
Default response format. Used to generate text responses.
Type Text
The type of response format being defined. Always `text`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema)>)
type ResponseFormatJSONObject struct{…}
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
Type JSONObject
The type of response format being defined. Always `json\_object`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema)>)
type ResponseFormatJSONSchema struct{…}
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](https://platform.openai.com/docs/guides/structured-outputs).
JSONSchema ResponseFormatJSONSchemaJSONSchema
Structured Outputs configuration options, including a JSON Schema.
Name string
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
Description stringOptional
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
Schema map[string, any]Optional
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
Strict boolOptional
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
Type JSONSchema
The type of response format being defined. Always `json\_schema`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) response_format>)
StartedAt int64
The Unix timestamp (in seconds) for when the run was started.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) started_at>)
Status [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>)
The status of the run, which can be either `queued`, `in\_progress`, `requires\_action`, `cancelling`, `cancelled`, `failed`, `completed`, `incomplete`, or `expired`.
One of the following:
const RunStatusQueued [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "queued"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 0>)
const RunStatusInProgress [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "in\_progress"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 1>)
const RunStatusRequiresAction [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "requires\_action"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 2>)
const RunStatusCancelling [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "cancelling"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 3>)
const RunStatusCancelled [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "cancelled"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 4>)
const RunStatusFailed [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "failed"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 5>)
const RunStatusCompleted [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "completed"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 6>)
const RunStatusIncomplete [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "incomplete"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 7>)
const RunStatusExpired [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "expired"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 8>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status>)
ThreadID string
The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) that was executed on as a part of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) thread_id>)
ToolChoice [AssistantToolChoiceOptionUnion](</api/reference/go/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_option > (schema)>)
Controls which (if any) tool is called by the model.
`none` means the model will not call any tools and instead generates a message.
`auto` is the default value and means the model can pick between generating a message or calling one or more tools.
`required` means the model must call one or more tools before responding to the user.
Specifying a particular tool like `{"type": "file\_search"}` or `{"type": "function", "function": {"name": "my\_function"}}` forces the model to call that tool.
One of the following:
type AssistantToolChoiceOptionAuto string
`none` means the model will not call any tools and instead generates a message. `auto` means the model can pick between generating a message or calling one or more tools. `required` means the model must call one or more tools before responding to the user.
One of the following:
const AssistantToolChoiceOptionAutoNone AssistantToolChoiceOptionAuto = "none"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 0>)
const AssistantToolChoiceOptionAutoAuto AssistantToolChoiceOptionAuto = "auto"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 1>)
const AssistantToolChoiceOptionAutoRequired AssistantToolChoiceOptionAuto = "required"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0>)
type AssistantToolChoice struct{…}
Specifies a tool the model should use. Use to force the model to call a specific tool.
Type AssistantToolChoiceType
The type of the tool. If type is `function`, the function name must be set
One of the following:
const AssistantToolChoiceTypeFunction AssistantToolChoiceType = "function"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 0>)
const AssistantToolChoiceTypeCodeInterpreter AssistantToolChoiceType = "code\_interpreter"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 1>)
const AssistantToolChoiceTypeFileSearch AssistantToolChoiceType = "file\_search"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type>)
Function [AssistantToolChoiceFunction](</api/reference/go/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_function > (schema)>)Optional
Name string
The name of the function to call.
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function + (resource) beta.threads > (model) assistant_tool_choice_function > (schema) > (property) name>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice>)
Tools [][AssistantToolUnion](</api/reference/go/resources/beta#(resource) beta.assistants > (model) assistant_tool > (schema)>)
The list of tools that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
One of the following:
type CodeInterpreterTool struct{…}
Type CodeInterpreter
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
type FileSearchTool struct{…}
Type FileSearch
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
FileSearch FileSearchToolFileSearchOptional
Overrides for the file search tool.
MaxNumResults int64Optional
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
RankingOptions FileSearchToolFileSearchRankingOptionsOptional
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
ScoreThreshold float64
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
Ranker stringOptional
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
const FileSearchToolFileSearchRankingOptionsRankerAuto FileSearchToolFileSearchRankingOptionsRanker = "auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
const FileSearchToolFileSearchRankingOptionsRankerDefault2024\_08\_21 FileSearchToolFileSearchRankingOptionsRanker = "default\_2024\_08\_21"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema)>)
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
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
Type Function
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tools>)
TruncationStrategy RunTruncationStrategy
Controls for how a thread will be truncated prior to the run. Use this to control the initial context window of the run.
Type string
The truncation strategy to use for the thread. The default is `auto`. If set to `last\_messages`, the thread will be truncated to the n most recent messages in the thread. When set to `auto`, messages in the middle of the thread will be dropped to fit the context length of the model, `max\_prompt\_tokens`.
One of the following:
const RunTruncationStrategyTypeAuto RunTruncationStrategyType = "auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 0>)
const RunTruncationStrategyTypeLastMessages RunTruncationStrategyType = "last\_messages"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type>)
LastMessages int64Optional
The number of most recent messages from the thread when constructing the context for the run.
minimum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) last_messages>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy>)
Usage RunUsage
Usage statistics related to the run. This value will be `null` if the run is not in a terminal state (i.e. `in\_progress`, `queued`, etc.).
CompletionTokens int64
Number of completion tokens used over the course of the run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) completion_tokens>)
PromptTokens int64
Number of prompt tokens used over the course of the run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) prompt_tokens>)
TotalTokens int64
Total number of tokens used (prompt + completion).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) total_tokens>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage>)
Temperature float64Optional
The sampling temperature used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) temperature>)
TopP float64Optional
The nucleus sampling value used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) top_p>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) data>)
Event ThreadRunCancelling
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 8>)
type AssistantStreamEventThreadRunCancelled struct{…}
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) is cancelled.
Data [Run](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
ID string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) id>)
AssistantID string
The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for execution of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) assistant_id>)
CancelledAt int64
The Unix timestamp (in seconds) for when the run was cancelled.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) cancelled_at>)
CompletedAt int64
The Unix timestamp (in seconds) for when the run was completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) completed_at>)
CreatedAt int64
The Unix timestamp (in seconds) for when the run was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) created_at>)
ExpiresAt int64
The Unix timestamp (in seconds) for when the run will expire.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) expires_at>)
FailedAt int64
The Unix timestamp (in seconds) for when the run failed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) failed_at>)
IncompleteDetails RunIncompleteDetails
Details on why the run is incomplete. Will be `null` if the run is not incomplete.
Reason stringOptional
The reason why the run is incomplete. This will point to which specific token limit was reached over the course of the run.
One of the following:
const RunIncompleteDetailsReasonMaxCompletionTokens RunIncompleteDetailsReason = "max\_completion\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
const RunIncompleteDetailsReasonMaxPromptTokens RunIncompleteDetailsReason = "max\_prompt\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details>)
Instructions string
The instructions that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) instructions>)
LastError RunLastError
The last error associated with this run. Will be `null` if there are no errors.
Code string
One of `server\_error`, `rate\_limit\_exceeded`, or `invalid\_prompt`.
One of the following:
const RunLastErrorCodeServerError RunLastErrorCode = "server\_error"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 0>)
const RunLastErrorCodeRateLimitExceeded RunLastErrorCode = "rate\_limit\_exceeded"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 1>)
const RunLastErrorCodeInvalidPrompt RunLastErrorCode = "invalid\_prompt"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 2>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code>)
Message string
A human-readable description of the error.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) message>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error>)
MaxCompletionTokens int64
The maximum number of completion tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_completion_tokens>)
MaxPromptTokens int64
The maximum number of prompt tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_prompt_tokens>)
Metadata [Metadata](</api/reference/go/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) metadata>)
Model string
The model that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) model>)
Object ThreadRun
The object type, which is always `thread.run`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) object>)
ParallelToolCalls bool
Whether to enable [parallel function calling](https://platform.openai.com/docs/guides/function-calling#configuring-parallel-function-calling) during tool use.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) parallel_tool_calls>)
RequiredAction RunRequiredAction
Details on the action required to continue the run. Will be `null` if no action is required.
SubmitToolOutputs RunRequiredActionSubmitToolOutputs
Details on the tool outputs needed for this run to continue.
ToolCalls [][RequiredActionFunctionToolCall](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema)>)
A list of the relevant tool calls.
ID string
The ID of the tool call. This ID must be referenced when you submit the tool outputs in using the [Submit tool outputs to run](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) endpoint.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) id>)
Function RequiredActionFunctionToolCallFunction
The function definition.
Arguments string
The arguments that the model expects you to pass to the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) arguments>)
Name string
The name of the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function>)
Type Function
The type of tool call the output is required for. For now, this is always `function`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs > (property) tool_calls>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs>)
Type SubmitToolOutputs
For now, this is always `submit\_tool\_outputs`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action>)
ResponseFormat [AssistantResponseFormatOptionUnion](</api/reference/go/resources/beta#(resource) beta.threads > (model) assistant_response_format_option > (schema)>)
Specifies the format that the model must output. Compatible with [GPT-4o](https://platform.openai.com/docs/models#gpt-4o), [GPT-4 Turbo](https://platform.openai.com/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly “stuck” request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
One of the following:
type Auto string
`auto` is the default value
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0>)
type ResponseFormatText struct{…}
Default response format. Used to generate text responses.
Type Text
The type of response format being defined. Always `text`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema)>)
type ResponseFormatJSONObject struct{…}
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
Type JSONObject
The type of response format being defined. Always `json\_object`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema)>)
type ResponseFormatJSONSchema struct{…}
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](https://platform.openai.com/docs/guides/structured-outputs).
JSONSchema ResponseFormatJSONSchemaJSONSchema
Structured Outputs configuration options, including a JSON Schema.
Name string
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
Description stringOptional
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
Schema map[string, any]Optional
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
Strict boolOptional
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
Type JSONSchema
The type of response format being defined. Always `json\_schema`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) response_format>)
StartedAt int64
The Unix timestamp (in seconds) for when the run was started.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) started_at>)
Status [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>)
The status of the run, which can be either `queued`, `in\_progress`, `requires\_action`, `cancelling`, `cancelled`, `failed`, `completed`, `incomplete`, or `expired`.
One of the following:
const RunStatusQueued [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "queued"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 0>)
const RunStatusInProgress [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "in\_progress"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 1>)
const RunStatusRequiresAction [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "requires\_action"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 2>)
const RunStatusCancelling [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "cancelling"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 3>)
const RunStatusCancelled [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "cancelled"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 4>)
const RunStatusFailed [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "failed"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 5>)
const RunStatusCompleted [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "completed"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 6>)
const RunStatusIncomplete [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "incomplete"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 7>)
const RunStatusExpired [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "expired"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 8>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status>)
ThreadID string
The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) that was executed on as a part of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) thread_id>)
ToolChoice [AssistantToolChoiceOptionUnion](</api/reference/go/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_option > (schema)>)
Controls which (if any) tool is called by the model.
`none` means the model will not call any tools and instead generates a message.
`auto` is the default value and means the model can pick between generating a message or calling one or more tools.
`required` means the model must call one or more tools before responding to the user.
Specifying a particular tool like `{"type": "file\_search"}` or `{"type": "function", "function": {"name": "my\_function"}}` forces the model to call that tool.
One of the following:
type AssistantToolChoiceOptionAuto string
`none` means the model will not call any tools and instead generates a message. `auto` means the model can pick between generating a message or calling one or more tools. `required` means the model must call one or more tools before responding to the user.
One of the following:
const AssistantToolChoiceOptionAutoNone AssistantToolChoiceOptionAuto = "none"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 0>)
const AssistantToolChoiceOptionAutoAuto AssistantToolChoiceOptionAuto = "auto"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 1>)
const AssistantToolChoiceOptionAutoRequired AssistantToolChoiceOptionAuto = "required"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0>)
type AssistantToolChoice struct{…}
Specifies a tool the model should use. Use to force the model to call a specific tool.
Type AssistantToolChoiceType
The type of the tool. If type is `function`, the function name must be set
One of the following:
const AssistantToolChoiceTypeFunction AssistantToolChoiceType = "function"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 0>)
const AssistantToolChoiceTypeCodeInterpreter AssistantToolChoiceType = "code\_interpreter"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 1>)
const AssistantToolChoiceTypeFileSearch AssistantToolChoiceType = "file\_search"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type>)
Function [AssistantToolChoiceFunction](</api/reference/go/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_function > (schema)>)Optional
Name string
The name of the function to call.
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function + (resource) beta.threads > (model) assistant_tool_choice_function > (schema) > (property) name>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice>)
Tools [][AssistantToolUnion](</api/reference/go/resources/beta#(resource) beta.assistants > (model) assistant_tool > (schema)>)
The list of tools that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
One of the following:
type CodeInterpreterTool struct{…}
Type CodeInterpreter
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
type FileSearchTool struct{…}
Type FileSearch
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
FileSearch FileSearchToolFileSearchOptional
Overrides for the file search tool.
MaxNumResults int64Optional
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
RankingOptions FileSearchToolFileSearchRankingOptionsOptional
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
ScoreThreshold float64
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
Ranker stringOptional
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
const FileSearchToolFileSearchRankingOptionsRankerAuto FileSearchToolFileSearchRankingOptionsRanker = "auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
const FileSearchToolFileSearchRankingOptionsRankerDefault2024\_08\_21 FileSearchToolFileSearchRankingOptionsRanker = "default\_2024\_08\_21"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema)>)
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
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
Type Function
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tools>)
TruncationStrategy RunTruncationStrategy
Controls for how a thread will be truncated prior to the run. Use this to control the initial context window of the run.
Type string
The truncation strategy to use for the thread. The default is `auto`. If set to `last\_messages`, the thread will be truncated to the n most recent messages in the thread. When set to `auto`, messages in the middle of the thread will be dropped to fit the context length of the model, `max\_prompt\_tokens`.
One of the following:
const RunTruncationStrategyTypeAuto RunTruncationStrategyType = "auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 0>)
const RunTruncationStrategyTypeLastMessages RunTruncationStrategyType = "last\_messages"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type>)
LastMessages int64Optional
The number of most recent messages from the thread when constructing the context for the run.
minimum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) last_messages>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy>)
Usage RunUsage
Usage statistics related to the run. This value will be `null` if the run is not in a terminal state (i.e. `in\_progress`, `queued`, etc.).
CompletionTokens int64
Number of completion tokens used over the course of the run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) completion_tokens>)
PromptTokens int64
Number of prompt tokens used over the course of the run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) prompt_tokens>)
TotalTokens int64
Total number of tokens used (prompt + completion).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) total_tokens>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage>)
Temperature float64Optional
The sampling temperature used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) temperature>)
TopP float64Optional
The nucleus sampling value used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) top_p>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) data>)
Event ThreadRunCancelled
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 9>)
type AssistantStreamEventThreadRunExpired struct{…}
Occurs when a [run](https://platform.openai.com/docs/api-reference/runs/object) expires.
Data [Run](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run > (schema)>)
Represents an execution run on a [thread](https://platform.openai.com/docs/api-reference/threads).
ID string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) id>)
AssistantID string
The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for execution of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) assistant_id>)
CancelledAt int64
The Unix timestamp (in seconds) for when the run was cancelled.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) cancelled_at>)
CompletedAt int64
The Unix timestamp (in seconds) for when the run was completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) completed_at>)
CreatedAt int64
The Unix timestamp (in seconds) for when the run was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) created_at>)
ExpiresAt int64
The Unix timestamp (in seconds) for when the run will expire.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) expires_at>)
FailedAt int64
The Unix timestamp (in seconds) for when the run failed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) failed_at>)
IncompleteDetails RunIncompleteDetails
Details on why the run is incomplete. Will be `null` if the run is not incomplete.
Reason stringOptional
The reason why the run is incomplete. This will point to which specific token limit was reached over the course of the run.
One of the following:
const RunIncompleteDetailsReasonMaxCompletionTokens RunIncompleteDetailsReason = "max\_completion\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
const RunIncompleteDetailsReasonMaxPromptTokens RunIncompleteDetailsReason = "max\_prompt\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) incomplete_details>)
Instructions string
The instructions that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) instructions>)
LastError RunLastError
The last error associated with this run. Will be `null` if there are no errors.
Code string
One of `server\_error`, `rate\_limit\_exceeded`, or `invalid\_prompt`.
One of the following:
const RunLastErrorCodeServerError RunLastErrorCode = "server\_error"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 0>)
const RunLastErrorCodeRateLimitExceeded RunLastErrorCode = "rate\_limit\_exceeded"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 1>)
const RunLastErrorCodeInvalidPrompt RunLastErrorCode = "invalid\_prompt"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code > (member) 2>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) code>)
Message string
A human-readable description of the error.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error > (property) message>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) last_error>)
MaxCompletionTokens int64
The maximum number of completion tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_completion_tokens>)
MaxPromptTokens int64
The maximum number of prompt tokens specified to have been used over the course of the run.
minimum256
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) max_prompt_tokens>)
Metadata [Metadata](</api/reference/go/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) metadata>)
Model string
The model that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) model>)
Object ThreadRun
The object type, which is always `thread.run`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) object>)
ParallelToolCalls bool
Whether to enable [parallel function calling](https://platform.openai.com/docs/guides/function-calling#configuring-parallel-function-calling) during tool use.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) parallel_tool_calls>)
RequiredAction RunRequiredAction
Details on the action required to continue the run. Will be `null` if no action is required.
SubmitToolOutputs RunRequiredActionSubmitToolOutputs
Details on the tool outputs needed for this run to continue.
ToolCalls [][RequiredActionFunctionToolCall](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) required_action_function_tool_call > (schema)>)
A list of the relevant tool calls.
ID string
The ID of the tool call. This ID must be referenced when you submit the tool outputs in using the [Submit tool outputs to run](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) endpoint.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) id>)
Function RequiredActionFunctionToolCallFunction
The function definition.
Arguments string
The arguments that the model expects you to pass to the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) arguments>)
Name string
The name of the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function > (property) name>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) function>)
Type Function
The type of tool call the output is required for. For now, this is always `function`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) required_action_function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs > (property) tool_calls>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) submit_tool_outputs>)
Type SubmitToolOutputs
For now, this is always `submit\_tool\_outputs`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) required_action>)
ResponseFormat [AssistantResponseFormatOptionUnion](</api/reference/go/resources/beta#(resource) beta.threads > (model) assistant_response_format_option > (schema)>)
Specifies the format that the model must output. Compatible with [GPT-4o](https://platform.openai.com/docs/models#gpt-4o), [GPT-4 Turbo](https://platform.openai.com/docs/models#gpt-4-turbo-and-gpt-4), and all GPT-3.5 Turbo models since `gpt-3.5-turbo-1106`.
Setting to `{ "type": "json\_schema", "json\_schema": {...} }` enables Structured Outputs which ensures the model will match your supplied JSON schema. Learn more in the [Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
Setting to `{ "type": "json\_object" }` enables JSON mode, which ensures the message the model generates is valid JSON.
**Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system or user message. Without this, the model may generate an unending stream of whitespace until the generation reaches the token limit, resulting in a long-running and seemingly “stuck” request. Also note that the message content may be partially cut off if `finish\_reason="length"`, which indicates the generation exceeded `max\_tokens` or the conversation exceeded the max context length.
One of the following:
type Auto string
`auto` is the default value
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) beta.threads > (model) assistant_response_format_option > (schema) > (variant) 0>)
type ResponseFormatText struct{…}
Default response format. Used to generate text responses.
Type Text
The type of response format being defined. Always `text`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_text > (schema)>)
type ResponseFormatJSONObject struct{…}
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
Type JSONObject
The type of response format being defined. Always `json\_object`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_object > (schema)>)
type ResponseFormatJSONSchema struct{…}
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](https://platform.openai.com/docs/guides/structured-outputs).
JSONSchema ResponseFormatJSONSchemaJSONSchema
Structured Outputs configuration options, including a JSON Schema.
Name string
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) name>)
Description stringOptional
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) description>)
Schema map[string, any]Optional
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) schema>)
Strict boolOptional
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema > (property) strict>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) json_schema>)
Type JSONSchema
The type of response format being defined. Always `json\_schema`.
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema) > (property) type>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) response_format + (resource) $shared > (model) response_format_json_schema > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) response_format>)
StartedAt int64
The Unix timestamp (in seconds) for when the run was started.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) started_at>)
Status [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>)
The status of the run, which can be either `queued`, `in\_progress`, `requires\_action`, `cancelling`, `cancelled`, `failed`, `completed`, `incomplete`, or `expired`.
One of the following:
const RunStatusQueued [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "queued"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 0>)
const RunStatusInProgress [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "in\_progress"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 1>)
const RunStatusRequiresAction [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "requires\_action"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 2>)
const RunStatusCancelling [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "cancelling"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 3>)
const RunStatusCancelled [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "cancelled"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 4>)
const RunStatusFailed [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "failed"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 5>)
const RunStatusCompleted [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "completed"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 6>)
const RunStatusIncomplete [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "incomplete"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 7>)
const RunStatusExpired [RunStatus](</api/reference/go/resources/beta#(resource) beta.threads.runs > (model) run_status > (schema)>) = "expired"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) status + (resource) beta.threads.runs > (model) run_status > (schema) > (member) 8>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) status>)
ThreadID string
The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) that was executed on as a part of this run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) thread_id>)
ToolChoice [AssistantToolChoiceOptionUnion](</api/reference/go/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_option > (schema)>)
Controls which (if any) tool is called by the model.
`none` means the model will not call any tools and instead generates a message.
`auto` is the default value and means the model can pick between generating a message or calling one or more tools.
`required` means the model must call one or more tools before responding to the user.
Specifying a particular tool like `{"type": "file\_search"}` or `{"type": "function", "function": {"name": "my\_function"}}` forces the model to call that tool.
One of the following:
type AssistantToolChoiceOptionAuto string
`none` means the model will not call any tools and instead generates a message. `auto` means the model can pick between generating a message or calling one or more tools. `required` means the model must call one or more tools before responding to the user.
One of the following:
const AssistantToolChoiceOptionAutoNone AssistantToolChoiceOptionAuto = "none"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 0>)
const AssistantToolChoiceOptionAutoAuto AssistantToolChoiceOptionAuto = "auto"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 1>)
const AssistantToolChoiceOptionAutoRequired AssistantToolChoiceOptionAuto = "required"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0 > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice_option > (schema) > (variant) 0>)
type AssistantToolChoice struct{…}
Specifies a tool the model should use. Use to force the model to call a specific tool.
Type AssistantToolChoiceType
The type of the tool. If type is `function`, the function name must be set
One of the following:
const AssistantToolChoiceTypeFunction AssistantToolChoiceType = "function"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 0>)
const AssistantToolChoiceTypeCodeInterpreter AssistantToolChoiceType = "code\_interpreter"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 1>)
const AssistantToolChoiceTypeFileSearch AssistantToolChoiceType = "file\_search"
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type > (member) 2>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) type>)
Function [AssistantToolChoiceFunction](</api/reference/go/resources/beta#(resource) beta.threads > (model) assistant_tool_choice_function > (schema)>)Optional
Name string
The name of the function to call.
[](<#(resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function + (resource) beta.threads > (model) assistant_tool_choice_function > (schema) > (property) name>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema) > (property) function>)
[](<#(resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice + (resource) beta.threads > (model) assistant_tool_choice > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tool_choice>)
Tools [][AssistantToolUnion](</api/reference/go/resources/beta#(resource) beta.assistants > (model) assistant_tool > (schema)>)
The list of tools that the [assistant](https://platform.openai.com/docs/api-reference/assistants) used for this run.
One of the following:
type CodeInterpreterTool struct{…}
Type CodeInterpreter
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
type FileSearchTool struct{…}
Type FileSearch
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) type>)
FileSearch FileSearchToolFileSearchOptional
Overrides for the file search tool.
MaxNumResults int64Optional
The maximum number of results the file search tool should output. The default is 20 for `gpt-4\*` models and 5 for `gpt-3.5-turbo`. This number should be between 1 and 50 inclusive.
Note that the file search tool may output fewer than `max\_num\_results` results. See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
minimum1
maximum50
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) max_num_results>)
RankingOptions FileSearchToolFileSearchRankingOptionsOptional
The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score\_threshold of 0.
See the [file search tool documentation](https://platform.openai.com/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
ScoreThreshold float64
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
Ranker stringOptional
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
const FileSearchToolFileSearchRankingOptionsRankerAuto FileSearchToolFileSearchRankingOptionsRanker = "auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
const FileSearchToolFileSearchRankingOptionsRankerDefault2024\_08\_21 FileSearchToolFileSearchRankingOptionsRanker = "default\_2024\_08\_21"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search > (property) ranking_options>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema) > (property) file_search>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.assistants > (model) file_search_tool > (schema)>)
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
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) function>)
Type Function
The type of tool being defined: `function`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.assistants > (model) function_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.assistants > (model) function_tool > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) tools>)
TruncationStrategy RunTruncationStrategy
Controls for how a thread will be truncated prior to the run. Use this to control the initial context window of the run.
Type string
The truncation strategy to use for the thread. The default is `auto`. If set to `last\_messages`, the thread will be truncated to the n most recent messages in the thread. When set to `auto`, messages in the middle of the thread will be dropped to fit the context length of the model, `max\_prompt\_tokens`.
One of the following:
const RunTruncationStrategyTypeAuto RunTruncationStrategyType = "auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 0>)
const RunTruncationStrategyTypeLastMessages RunTruncationStrategyType = "last\_messages"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) type>)
LastMessages int64Optional
The number of most recent messages from the thread when constructing the context for the run.
minimum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy > (property) last_messages>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) truncation_strategy>)
Usage RunUsage
Usage statistics related to the run. This value will be `null` if the run is not in a terminal state (i.e. `in\_progress`, `queued`, etc.).
CompletionTokens int64
Number of completion tokens used over the course of the run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) completion_tokens>)
PromptTokens int64
Number of prompt tokens used over the course of the run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) prompt_tokens>)
TotalTokens int64
Total number of tokens used (prompt + completion).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage > (property) total_tokens>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) usage>)
Temperature float64Optional
The sampling temperature used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) temperature>)
TopP float64Optional
The nucleus sampling value used for this run. If not set, defaults to 1.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data + (resource) beta.threads.runs > (model) run > (schema) > (property) top_p>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) data>)
Event ThreadRunExpired
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 10>)
type AssistantStreamEventThreadRunStepCreated struct{…}
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) is created.
Data [RunStep](</api/reference/go/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>)
Represents a step in execution of a run.
ID string
The identifier of the run step, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) id>)
AssistantID string
The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) associated with the run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) assistant_id>)
CancelledAt int64
The Unix timestamp (in seconds) for when the run step was cancelled.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) cancelled_at>)
CompletedAt int64
The Unix timestamp (in seconds) for when the run step completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) completed_at>)
CreatedAt int64
The Unix timestamp (in seconds) for when the run step was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) created_at>)
ExpiredAt int64
The Unix timestamp (in seconds) for when the run step expired. A step is considered expired if the parent run is expired.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) expired_at>)
FailedAt int64
The Unix timestamp (in seconds) for when the run step failed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) failed_at>)
LastError RunStepLastError
The last error associated with this run step. Will be `null` if there are no errors.
Code string
One of `server\_error` or `rate\_limit\_exceeded`.
One of the following:
const RunStepLastErrorCodeServerError RunStepLastErrorCode = "server\_error"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code > (member) 0>)
const RunStepLastErrorCodeRateLimitExceeded RunStepLastErrorCode = "rate\_limit\_exceeded"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code>)
Message string
A human-readable description of the error.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) message>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error>)
Metadata [Metadata](</api/reference/go/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) metadata>)
Object ThreadRunStep
The object type, which is always `thread.run.step`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) object>)
RunID string
The ID of the [run](https://platform.openai.com/docs/api-reference/runs) that this run step is a part of.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) run_id>)
Status RunStepStatus
The status of the run step, which can be either `in\_progress`, `cancelled`, `failed`, `completed`, or `expired`.
One of the following:
const RunStepStatusInProgress RunStepStatus = "in\_progress"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 0>)
const RunStepStatusCancelled RunStepStatus = "cancelled"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 1>)
const RunStepStatusFailed RunStepStatus = "failed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 2>)
const RunStepStatusCompleted RunStepStatus = "completed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 3>)
const RunStepStatusExpired RunStepStatus = "expired"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 4>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status>)
StepDetails RunStepStepDetailsUnion
The details of the run step.
One of the following:
type MessageCreationStepDetails struct{…}
Details of the message creation by the run step.
MessageCreation MessageCreationStepDetailsMessageCreation
MessageID string
The ID of the message that was created by this run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation > (property) message_id>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation>)
Type MessageCreation
Always `message\_creation`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema)>)
type ToolCallsStepDetails struct{…}
Details of the tool call.
ToolCalls [][ToolCallUnion](</api/reference/go/resources/beta#(resource) beta.threads.runs.steps > (model) tool_call > (schema)>)
An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code\_interpreter`, `file\_search`, or `function`.
One of the following:
type CodeInterpreterToolCall struct{…}
Details of the Code Interpreter tool call the run step was involved in.
ID string
The ID of the tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) id>)
CodeInterpreter CodeInterpreterToolCallCodeInterpreter
The Code Interpreter tool call definition.
Input string
The input to the Code Interpreter tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) input>)
Outputs []CodeInterpreterToolCallCodeInterpreterOutputUnion
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
type CodeInterpreterToolCallCodeInterpreterOutputLogs struct{…}
Text output from the Code Interpreter tool call as part of a run step.
Logs string
The text output from the Code Interpreter tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) logs>)
Type Logs
Always `logs`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0>)
type CodeInterpreterToolCallCodeInterpreterOutputImage struct{…}
Image CodeInterpreterToolCallCodeInterpreterOutputImageImage
FileID string
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image > (property) file_id>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image>)
Type Image
Always `image`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter>)
Type CodeInterpreter
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema)>)
type FileSearchToolCall struct{…}
ID string
The ID of the tool call object.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) id>)
FileSearch FileSearchToolCallFileSearch
For now, this is always going to be an empty object.
RankingOptions FileSearchToolCallFileSearchRankingOptionsOptional
The ranking options for the file search.
Ranker string
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
const FileSearchToolCallFileSearchRankingOptionsRankerAuto FileSearchToolCallFileSearchRankingOptionsRanker = "auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
const FileSearchToolCallFileSearchRankingOptionsRankerDefault2024\_08\_21 FileSearchToolCallFileSearchRankingOptionsRanker = "default\_2024\_08\_21"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
ScoreThreshold float64
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options>)
Results []FileSearchToolCallFileSearchResultOptional
The results of the file search.
FileID string
The ID of the file that result was found in.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_id>)
FileName string
The name of the file that result was found in.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_name>)
Score float64
The score of the result. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) score>)
Content []FileSearchToolCallFileSearchResultContentOptional
The content of the result that was found. The content is only included if requested via the include query parameter.
Text stringOptional
The text content of the file.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) text>)
Type stringOptional
The type of the content.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search>)
Type FileSearch
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>)
type FunctionToolCall struct{…}
ID string
The ID of the tool call object.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) id>)
Function FunctionToolCallFunction
The definition of the function that was called.
Arguments string
The arguments passed to the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) arguments>)
Name string
The name of the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) name>)
Output string
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) output>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function>)
Type Function
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema) > (property) tool_calls>)
Type ToolCalls
Always `tool\_calls`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) step_details>)
ThreadID string
The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) that was run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) thread_id>)
Type RunStepType
The type of run step, which can be either `message\_creation` or `tool\_calls`.
One of the following:
const RunStepTypeMessageCreation RunStepType = "message\_creation"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type > (member) 0>)
const RunStepTypeToolCalls RunStepType = "tool\_calls"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type>)
Usage RunStepUsage
Usage statistics related to the run step. This value will be `null` while the run step’s status is `in\_progress`.
CompletionTokens int64
Number of completion tokens used over the course of the run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) completion_tokens>)
PromptTokens int64
Number of prompt tokens used over the course of the run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) prompt_tokens>)
TotalTokens int64
Total number of tokens used (prompt + completion).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) total_tokens>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) data>)
Event ThreadRunStepCreated
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 11>)
type AssistantStreamEventThreadRunStepInProgress struct{…}
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) moves to an `in\_progress` state.
Data [RunStep](</api/reference/go/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>)
Represents a step in execution of a run.
ID string
The identifier of the run step, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) id>)
AssistantID string
The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) associated with the run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) assistant_id>)
CancelledAt int64
The Unix timestamp (in seconds) for when the run step was cancelled.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) cancelled_at>)
CompletedAt int64
The Unix timestamp (in seconds) for when the run step completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) completed_at>)
CreatedAt int64
The Unix timestamp (in seconds) for when the run step was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) created_at>)
ExpiredAt int64
The Unix timestamp (in seconds) for when the run step expired. A step is considered expired if the parent run is expired.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) expired_at>)
FailedAt int64
The Unix timestamp (in seconds) for when the run step failed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) failed_at>)
LastError RunStepLastError
The last error associated with this run step. Will be `null` if there are no errors.
Code string
One of `server\_error` or `rate\_limit\_exceeded`.
One of the following:
const RunStepLastErrorCodeServerError RunStepLastErrorCode = "server\_error"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code > (member) 0>)
const RunStepLastErrorCodeRateLimitExceeded RunStepLastErrorCode = "rate\_limit\_exceeded"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code>)
Message string
A human-readable description of the error.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) message>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error>)
Metadata [Metadata](</api/reference/go/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) metadata>)
Object ThreadRunStep
The object type, which is always `thread.run.step`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) object>)
RunID string
The ID of the [run](https://platform.openai.com/docs/api-reference/runs) that this run step is a part of.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) run_id>)
Status RunStepStatus
The status of the run step, which can be either `in\_progress`, `cancelled`, `failed`, `completed`, or `expired`.
One of the following:
const RunStepStatusInProgress RunStepStatus = "in\_progress"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 0>)
const RunStepStatusCancelled RunStepStatus = "cancelled"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 1>)
const RunStepStatusFailed RunStepStatus = "failed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 2>)
const RunStepStatusCompleted RunStepStatus = "completed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 3>)
const RunStepStatusExpired RunStepStatus = "expired"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 4>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status>)
StepDetails RunStepStepDetailsUnion
The details of the run step.
One of the following:
type MessageCreationStepDetails struct{…}
Details of the message creation by the run step.
MessageCreation MessageCreationStepDetailsMessageCreation
MessageID string
The ID of the message that was created by this run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation > (property) message_id>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation>)
Type MessageCreation
Always `message\_creation`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema)>)
type ToolCallsStepDetails struct{…}
Details of the tool call.
ToolCalls [][ToolCallUnion](</api/reference/go/resources/beta#(resource) beta.threads.runs.steps > (model) tool_call > (schema)>)
An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code\_interpreter`, `file\_search`, or `function`.
One of the following:
type CodeInterpreterToolCall struct{…}
Details of the Code Interpreter tool call the run step was involved in.
ID string
The ID of the tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) id>)
CodeInterpreter CodeInterpreterToolCallCodeInterpreter
The Code Interpreter tool call definition.
Input string
The input to the Code Interpreter tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) input>)
Outputs []CodeInterpreterToolCallCodeInterpreterOutputUnion
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
type CodeInterpreterToolCallCodeInterpreterOutputLogs struct{…}
Text output from the Code Interpreter tool call as part of a run step.
Logs string
The text output from the Code Interpreter tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) logs>)
Type Logs
Always `logs`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0>)
type CodeInterpreterToolCallCodeInterpreterOutputImage struct{…}
Image CodeInterpreterToolCallCodeInterpreterOutputImageImage
FileID string
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image > (property) file_id>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image>)
Type Image
Always `image`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter>)
Type CodeInterpreter
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema)>)
type FileSearchToolCall struct{…}
ID string
The ID of the tool call object.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) id>)
FileSearch FileSearchToolCallFileSearch
For now, this is always going to be an empty object.
RankingOptions FileSearchToolCallFileSearchRankingOptionsOptional
The ranking options for the file search.
Ranker string
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
const FileSearchToolCallFileSearchRankingOptionsRankerAuto FileSearchToolCallFileSearchRankingOptionsRanker = "auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
const FileSearchToolCallFileSearchRankingOptionsRankerDefault2024\_08\_21 FileSearchToolCallFileSearchRankingOptionsRanker = "default\_2024\_08\_21"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
ScoreThreshold float64
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options>)
Results []FileSearchToolCallFileSearchResultOptional
The results of the file search.
FileID string
The ID of the file that result was found in.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_id>)
FileName string
The name of the file that result was found in.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_name>)
Score float64
The score of the result. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) score>)
Content []FileSearchToolCallFileSearchResultContentOptional
The content of the result that was found. The content is only included if requested via the include query parameter.
Text stringOptional
The text content of the file.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) text>)
Type stringOptional
The type of the content.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search>)
Type FileSearch
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>)
type FunctionToolCall struct{…}
ID string
The ID of the tool call object.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) id>)
Function FunctionToolCallFunction
The definition of the function that was called.
Arguments string
The arguments passed to the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) arguments>)
Name string
The name of the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) name>)
Output string
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) output>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function>)
Type Function
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema) > (property) tool_calls>)
Type ToolCalls
Always `tool\_calls`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) step_details>)
ThreadID string
The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) that was run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) thread_id>)
Type RunStepType
The type of run step, which can be either `message\_creation` or `tool\_calls`.
One of the following:
const RunStepTypeMessageCreation RunStepType = "message\_creation"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type > (member) 0>)
const RunStepTypeToolCalls RunStepType = "tool\_calls"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type>)
Usage RunStepUsage
Usage statistics related to the run step. This value will be `null` while the run step’s status is `in\_progress`.
CompletionTokens int64
Number of completion tokens used over the course of the run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) completion_tokens>)
PromptTokens int64
Number of prompt tokens used over the course of the run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) prompt_tokens>)
TotalTokens int64
Total number of tokens used (prompt + completion).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) total_tokens>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) data>)
Event ThreadRunStepInProgress
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 12>)
type AssistantStreamEventThreadRunStepDelta struct{…}
Occurs when parts of a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) are being streamed.
Data [RunStepDeltaEvent](</api/reference/go/resources/beta#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema)>)
Represents a run step delta i.e. any changed fields on a run step during streaming.
ID string
The identifier of the run step, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) data + (resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) id>)
Delta [RunStepDelta](</api/reference/go/resources/beta#(resource) beta.threads.runs.steps > (model) run_step_delta > (schema)>)
The delta containing the fields that have changed on the run step.
StepDetails RunStepDeltaStepDetailsUnionOptional
The details of the run step.
One of the following:
type RunStepDeltaMessageDelta struct{…}
Details of the message creation by the run step.
Type MessageCreation
Always `message\_creation`.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) type>)
MessageCreation RunStepDeltaMessageDeltaMessageCreationOptional
MessageID stringOptional
The ID of the message that was created by this run step.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) message_creation > (property) message_id>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema) > (property) message_creation>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) run_step_delta_message_delta > (schema)>)
type ToolCallDeltaObject struct{…}
Details of the tool call.
Type ToolCalls
Always `tool\_calls`.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema) > (property) type>)
ToolCalls [][ToolCallDeltaUnion](</api/reference/go/resources/beta#(resource) beta.threads.runs.steps > (model) tool_call_delta > (schema)>)Optional
An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code\_interpreter`, `file\_search`, or `function`.
One of the following:
type CodeInterpreterToolCallDelta struct{…}
Details of the Code Interpreter tool call the run step was involved in.
Index int64
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) index>)
Type CodeInterpreter
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) type>)
ID stringOptional
The ID of the tool call.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) id>)
CodeInterpreter CodeInterpreterToolCallDeltaCodeInterpreterOptional
The Code Interpreter tool call definition.
Input stringOptional
The input to the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) input>)
Outputs []CodeInterpreterToolCallDeltaCodeInterpreterOutputUnionOptional
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
type CodeInterpreterLogs struct{…}
Text output from the Code Interpreter tool call as part of a run step.
Index int64
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) index>)
Type Logs
Always `logs`.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) type>)
Logs stringOptional
The text output from the Code Interpreter tool call.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema) > (property) logs>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) code_interpreter_logs > (schema)>)
type CodeInterpreterOutputImage struct{…}
Index int64
The index of the output in the outputs array.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) index>)
Type Image
Always `image`.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) type>)
Image CodeInterpreterOutputImageImageOptional
FileID stringOptional
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image > (property) file_id>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema) > (property) image>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) code_interpreter_output_image > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema) > (property) code_interpreter>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call_delta > (schema)>)
type FileSearchToolCallDelta struct{…}
FileSearch any
For now, this is always going to be an empty object.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) file_search>)
Index int64
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) index>)
Type FileSearch
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) type>)
ID stringOptional
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema) > (property) id>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) file_search_tool_call_delta > (schema)>)
type FunctionToolCallDelta struct{…}
Index int64
The index of the tool call in the tool calls array.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) index>)
Type Function
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) type>)
ID stringOptional
The ID of the tool call object.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) id>)
Function FunctionToolCallDeltaFunctionOptional
The definition of the function that was called.
Arguments stringOptional
The arguments passed to the function.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) arguments>)
Name stringOptional
The name of the function.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) name>)
Output stringOptional
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function > (property) output>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema) > (property) function>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) function_tool_call_delta > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema) > (property) tool_calls>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) tool_call_delta_object > (schema)>)
[](<#(resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta + (resource) beta.threads.runs.steps > (model) run_step_delta > (schema) > (property) step_details>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) data + (resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) delta>)
Object ThreadRunStepDelta
The object type, which is always `thread.run.step.delta`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) data + (resource) beta.threads.runs.steps > (model) run_step_delta_event > (schema) > (property) object>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) data>)
Event ThreadRunStepDelta
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 13>)
type AssistantStreamEventThreadRunStepCompleted struct{…}
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) is completed.
Data [RunStep](</api/reference/go/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>)
Represents a step in execution of a run.
ID string
The identifier of the run step, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) id>)
AssistantID string
The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) associated with the run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) assistant_id>)
CancelledAt int64
The Unix timestamp (in seconds) for when the run step was cancelled.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) cancelled_at>)
CompletedAt int64
The Unix timestamp (in seconds) for when the run step completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) completed_at>)
CreatedAt int64
The Unix timestamp (in seconds) for when the run step was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) created_at>)
ExpiredAt int64
The Unix timestamp (in seconds) for when the run step expired. A step is considered expired if the parent run is expired.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) expired_at>)
FailedAt int64
The Unix timestamp (in seconds) for when the run step failed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) failed_at>)
LastError RunStepLastError
The last error associated with this run step. Will be `null` if there are no errors.
Code string
One of `server\_error` or `rate\_limit\_exceeded`.
One of the following:
const RunStepLastErrorCodeServerError RunStepLastErrorCode = "server\_error"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code > (member) 0>)
const RunStepLastErrorCodeRateLimitExceeded RunStepLastErrorCode = "rate\_limit\_exceeded"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code>)
Message string
A human-readable description of the error.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) message>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error>)
Metadata [Metadata](</api/reference/go/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) metadata>)
Object ThreadRunStep
The object type, which is always `thread.run.step`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) object>)
RunID string
The ID of the [run](https://platform.openai.com/docs/api-reference/runs) that this run step is a part of.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) run_id>)
Status RunStepStatus
The status of the run step, which can be either `in\_progress`, `cancelled`, `failed`, `completed`, or `expired`.
One of the following:
const RunStepStatusInProgress RunStepStatus = "in\_progress"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 0>)
const RunStepStatusCancelled RunStepStatus = "cancelled"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 1>)
const RunStepStatusFailed RunStepStatus = "failed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 2>)
const RunStepStatusCompleted RunStepStatus = "completed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 3>)
const RunStepStatusExpired RunStepStatus = "expired"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 4>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status>)
StepDetails RunStepStepDetailsUnion
The details of the run step.
One of the following:
type MessageCreationStepDetails struct{…}
Details of the message creation by the run step.
MessageCreation MessageCreationStepDetailsMessageCreation
MessageID string
The ID of the message that was created by this run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation > (property) message_id>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation>)
Type MessageCreation
Always `message\_creation`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema)>)
type ToolCallsStepDetails struct{…}
Details of the tool call.
ToolCalls [][ToolCallUnion](</api/reference/go/resources/beta#(resource) beta.threads.runs.steps > (model) tool_call > (schema)>)
An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code\_interpreter`, `file\_search`, or `function`.
One of the following:
type CodeInterpreterToolCall struct{…}
Details of the Code Interpreter tool call the run step was involved in.
ID string
The ID of the tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) id>)
CodeInterpreter CodeInterpreterToolCallCodeInterpreter
The Code Interpreter tool call definition.
Input string
The input to the Code Interpreter tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) input>)
Outputs []CodeInterpreterToolCallCodeInterpreterOutputUnion
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
type CodeInterpreterToolCallCodeInterpreterOutputLogs struct{…}
Text output from the Code Interpreter tool call as part of a run step.
Logs string
The text output from the Code Interpreter tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) logs>)
Type Logs
Always `logs`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0>)
type CodeInterpreterToolCallCodeInterpreterOutputImage struct{…}
Image CodeInterpreterToolCallCodeInterpreterOutputImageImage
FileID string
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image > (property) file_id>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image>)
Type Image
Always `image`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter>)
Type CodeInterpreter
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema)>)
type FileSearchToolCall struct{…}
ID string
The ID of the tool call object.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) id>)
FileSearch FileSearchToolCallFileSearch
For now, this is always going to be an empty object.
RankingOptions FileSearchToolCallFileSearchRankingOptionsOptional
The ranking options for the file search.
Ranker string
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
const FileSearchToolCallFileSearchRankingOptionsRankerAuto FileSearchToolCallFileSearchRankingOptionsRanker = "auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
const FileSearchToolCallFileSearchRankingOptionsRankerDefault2024\_08\_21 FileSearchToolCallFileSearchRankingOptionsRanker = "default\_2024\_08\_21"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
ScoreThreshold float64
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options>)
Results []FileSearchToolCallFileSearchResultOptional
The results of the file search.
FileID string
The ID of the file that result was found in.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_id>)
FileName string
The name of the file that result was found in.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_name>)
Score float64
The score of the result. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) score>)
Content []FileSearchToolCallFileSearchResultContentOptional
The content of the result that was found. The content is only included if requested via the include query parameter.
Text stringOptional
The text content of the file.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) text>)
Type stringOptional
The type of the content.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search>)
Type FileSearch
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>)
type FunctionToolCall struct{…}
ID string
The ID of the tool call object.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) id>)
Function FunctionToolCallFunction
The definition of the function that was called.
Arguments string
The arguments passed to the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) arguments>)
Name string
The name of the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) name>)
Output string
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) output>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function>)
Type Function
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema) > (property) tool_calls>)
Type ToolCalls
Always `tool\_calls`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) step_details>)
ThreadID string
The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) that was run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) thread_id>)
Type RunStepType
The type of run step, which can be either `message\_creation` or `tool\_calls`.
One of the following:
const RunStepTypeMessageCreation RunStepType = "message\_creation"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type > (member) 0>)
const RunStepTypeToolCalls RunStepType = "tool\_calls"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type>)
Usage RunStepUsage
Usage statistics related to the run step. This value will be `null` while the run step’s status is `in\_progress`.
CompletionTokens int64
Number of completion tokens used over the course of the run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) completion_tokens>)
PromptTokens int64
Number of prompt tokens used over the course of the run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) prompt_tokens>)
TotalTokens int64
Total number of tokens used (prompt + completion).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) total_tokens>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) data>)
Event ThreadRunStepCompleted
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 14>)
type AssistantStreamEventThreadRunStepFailed struct{…}
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) fails.
Data [RunStep](</api/reference/go/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>)
Represents a step in execution of a run.
ID string
The identifier of the run step, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) id>)
AssistantID string
The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) associated with the run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) assistant_id>)
CancelledAt int64
The Unix timestamp (in seconds) for when the run step was cancelled.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) cancelled_at>)
CompletedAt int64
The Unix timestamp (in seconds) for when the run step completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) completed_at>)
CreatedAt int64
The Unix timestamp (in seconds) for when the run step was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) created_at>)
ExpiredAt int64
The Unix timestamp (in seconds) for when the run step expired. A step is considered expired if the parent run is expired.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) expired_at>)
FailedAt int64
The Unix timestamp (in seconds) for when the run step failed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) failed_at>)
LastError RunStepLastError
The last error associated with this run step. Will be `null` if there are no errors.
Code string
One of `server\_error` or `rate\_limit\_exceeded`.
One of the following:
const RunStepLastErrorCodeServerError RunStepLastErrorCode = "server\_error"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code > (member) 0>)
const RunStepLastErrorCodeRateLimitExceeded RunStepLastErrorCode = "rate\_limit\_exceeded"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code>)
Message string
A human-readable description of the error.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) message>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error>)
Metadata [Metadata](</api/reference/go/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) metadata>)
Object ThreadRunStep
The object type, which is always `thread.run.step`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) object>)
RunID string
The ID of the [run](https://platform.openai.com/docs/api-reference/runs) that this run step is a part of.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) run_id>)
Status RunStepStatus
The status of the run step, which can be either `in\_progress`, `cancelled`, `failed`, `completed`, or `expired`.
One of the following:
const RunStepStatusInProgress RunStepStatus = "in\_progress"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 0>)
const RunStepStatusCancelled RunStepStatus = "cancelled"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 1>)
const RunStepStatusFailed RunStepStatus = "failed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 2>)
const RunStepStatusCompleted RunStepStatus = "completed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 3>)
const RunStepStatusExpired RunStepStatus = "expired"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 4>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status>)
StepDetails RunStepStepDetailsUnion
The details of the run step.
One of the following:
type MessageCreationStepDetails struct{…}
Details of the message creation by the run step.
MessageCreation MessageCreationStepDetailsMessageCreation
MessageID string
The ID of the message that was created by this run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation > (property) message_id>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation>)
Type MessageCreation
Always `message\_creation`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema)>)
type ToolCallsStepDetails struct{…}
Details of the tool call.
ToolCalls [][ToolCallUnion](</api/reference/go/resources/beta#(resource) beta.threads.runs.steps > (model) tool_call > (schema)>)
An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code\_interpreter`, `file\_search`, or `function`.
One of the following:
type CodeInterpreterToolCall struct{…}
Details of the Code Interpreter tool call the run step was involved in.
ID string
The ID of the tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) id>)
CodeInterpreter CodeInterpreterToolCallCodeInterpreter
The Code Interpreter tool call definition.
Input string
The input to the Code Interpreter tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) input>)
Outputs []CodeInterpreterToolCallCodeInterpreterOutputUnion
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
type CodeInterpreterToolCallCodeInterpreterOutputLogs struct{…}
Text output from the Code Interpreter tool call as part of a run step.
Logs string
The text output from the Code Interpreter tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) logs>)
Type Logs
Always `logs`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0>)
type CodeInterpreterToolCallCodeInterpreterOutputImage struct{…}
Image CodeInterpreterToolCallCodeInterpreterOutputImageImage
FileID string
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image > (property) file_id>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image>)
Type Image
Always `image`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter>)
Type CodeInterpreter
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema)>)
type FileSearchToolCall struct{…}
ID string
The ID of the tool call object.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) id>)
FileSearch FileSearchToolCallFileSearch
For now, this is always going to be an empty object.
RankingOptions FileSearchToolCallFileSearchRankingOptionsOptional
The ranking options for the file search.
Ranker string
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
const FileSearchToolCallFileSearchRankingOptionsRankerAuto FileSearchToolCallFileSearchRankingOptionsRanker = "auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
const FileSearchToolCallFileSearchRankingOptionsRankerDefault2024\_08\_21 FileSearchToolCallFileSearchRankingOptionsRanker = "default\_2024\_08\_21"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
ScoreThreshold float64
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options>)
Results []FileSearchToolCallFileSearchResultOptional
The results of the file search.
FileID string
The ID of the file that result was found in.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_id>)
FileName string
The name of the file that result was found in.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_name>)
Score float64
The score of the result. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) score>)
Content []FileSearchToolCallFileSearchResultContentOptional
The content of the result that was found. The content is only included if requested via the include query parameter.
Text stringOptional
The text content of the file.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) text>)
Type stringOptional
The type of the content.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search>)
Type FileSearch
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>)
type FunctionToolCall struct{…}
ID string
The ID of the tool call object.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) id>)
Function FunctionToolCallFunction
The definition of the function that was called.
Arguments string
The arguments passed to the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) arguments>)
Name string
The name of the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) name>)
Output string
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) output>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function>)
Type Function
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema) > (property) tool_calls>)
Type ToolCalls
Always `tool\_calls`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) step_details>)
ThreadID string
The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) that was run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) thread_id>)
Type RunStepType
The type of run step, which can be either `message\_creation` or `tool\_calls`.
One of the following:
const RunStepTypeMessageCreation RunStepType = "message\_creation"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type > (member) 0>)
const RunStepTypeToolCalls RunStepType = "tool\_calls"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type>)
Usage RunStepUsage
Usage statistics related to the run step. This value will be `null` while the run step’s status is `in\_progress`.
CompletionTokens int64
Number of completion tokens used over the course of the run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) completion_tokens>)
PromptTokens int64
Number of prompt tokens used over the course of the run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) prompt_tokens>)
TotalTokens int64
Total number of tokens used (prompt + completion).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) total_tokens>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) data>)
Event ThreadRunStepFailed
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 15>)
type AssistantStreamEventThreadRunStepCancelled struct{…}
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) is cancelled.
Data [RunStep](</api/reference/go/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>)
Represents a step in execution of a run.
ID string
The identifier of the run step, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) id>)
AssistantID string
The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) associated with the run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) assistant_id>)
CancelledAt int64
The Unix timestamp (in seconds) for when the run step was cancelled.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) cancelled_at>)
CompletedAt int64
The Unix timestamp (in seconds) for when the run step completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) completed_at>)
CreatedAt int64
The Unix timestamp (in seconds) for when the run step was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) created_at>)
ExpiredAt int64
The Unix timestamp (in seconds) for when the run step expired. A step is considered expired if the parent run is expired.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) expired_at>)
FailedAt int64
The Unix timestamp (in seconds) for when the run step failed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) failed_at>)
LastError RunStepLastError
The last error associated with this run step. Will be `null` if there are no errors.
Code string
One of `server\_error` or `rate\_limit\_exceeded`.
One of the following:
const RunStepLastErrorCodeServerError RunStepLastErrorCode = "server\_error"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code > (member) 0>)
const RunStepLastErrorCodeRateLimitExceeded RunStepLastErrorCode = "rate\_limit\_exceeded"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code>)
Message string
A human-readable description of the error.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) message>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error>)
Metadata [Metadata](</api/reference/go/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) metadata>)
Object ThreadRunStep
The object type, which is always `thread.run.step`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) object>)
RunID string
The ID of the [run](https://platform.openai.com/docs/api-reference/runs) that this run step is a part of.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) run_id>)
Status RunStepStatus
The status of the run step, which can be either `in\_progress`, `cancelled`, `failed`, `completed`, or `expired`.
One of the following:
const RunStepStatusInProgress RunStepStatus = "in\_progress"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 0>)
const RunStepStatusCancelled RunStepStatus = "cancelled"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 1>)
const RunStepStatusFailed RunStepStatus = "failed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 2>)
const RunStepStatusCompleted RunStepStatus = "completed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 3>)
const RunStepStatusExpired RunStepStatus = "expired"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 4>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status>)
StepDetails RunStepStepDetailsUnion
The details of the run step.
One of the following:
type MessageCreationStepDetails struct{…}
Details of the message creation by the run step.
MessageCreation MessageCreationStepDetailsMessageCreation
MessageID string
The ID of the message that was created by this run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation > (property) message_id>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation>)
Type MessageCreation
Always `message\_creation`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema)>)
type ToolCallsStepDetails struct{…}
Details of the tool call.
ToolCalls [][ToolCallUnion](</api/reference/go/resources/beta#(resource) beta.threads.runs.steps > (model) tool_call > (schema)>)
An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code\_interpreter`, `file\_search`, or `function`.
One of the following:
type CodeInterpreterToolCall struct{…}
Details of the Code Interpreter tool call the run step was involved in.
ID string
The ID of the tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) id>)
CodeInterpreter CodeInterpreterToolCallCodeInterpreter
The Code Interpreter tool call definition.
Input string
The input to the Code Interpreter tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) input>)
Outputs []CodeInterpreterToolCallCodeInterpreterOutputUnion
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
type CodeInterpreterToolCallCodeInterpreterOutputLogs struct{…}
Text output from the Code Interpreter tool call as part of a run step.
Logs string
The text output from the Code Interpreter tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) logs>)
Type Logs
Always `logs`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0>)
type CodeInterpreterToolCallCodeInterpreterOutputImage struct{…}
Image CodeInterpreterToolCallCodeInterpreterOutputImageImage
FileID string
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image > (property) file_id>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image>)
Type Image
Always `image`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter>)
Type CodeInterpreter
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema)>)
type FileSearchToolCall struct{…}
ID string
The ID of the tool call object.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) id>)
FileSearch FileSearchToolCallFileSearch
For now, this is always going to be an empty object.
RankingOptions FileSearchToolCallFileSearchRankingOptionsOptional
The ranking options for the file search.
Ranker string
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
const FileSearchToolCallFileSearchRankingOptionsRankerAuto FileSearchToolCallFileSearchRankingOptionsRanker = "auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
const FileSearchToolCallFileSearchRankingOptionsRankerDefault2024\_08\_21 FileSearchToolCallFileSearchRankingOptionsRanker = "default\_2024\_08\_21"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
ScoreThreshold float64
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options>)
Results []FileSearchToolCallFileSearchResultOptional
The results of the file search.
FileID string
The ID of the file that result was found in.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_id>)
FileName string
The name of the file that result was found in.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_name>)
Score float64
The score of the result. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) score>)
Content []FileSearchToolCallFileSearchResultContentOptional
The content of the result that was found. The content is only included if requested via the include query parameter.
Text stringOptional
The text content of the file.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) text>)
Type stringOptional
The type of the content.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search>)
Type FileSearch
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>)
type FunctionToolCall struct{…}
ID string
The ID of the tool call object.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) id>)
Function FunctionToolCallFunction
The definition of the function that was called.
Arguments string
The arguments passed to the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) arguments>)
Name string
The name of the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) name>)
Output string
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) output>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function>)
Type Function
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema) > (property) tool_calls>)
Type ToolCalls
Always `tool\_calls`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) step_details>)
ThreadID string
The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) that was run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) thread_id>)
Type RunStepType
The type of run step, which can be either `message\_creation` or `tool\_calls`.
One of the following:
const RunStepTypeMessageCreation RunStepType = "message\_creation"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type > (member) 0>)
const RunStepTypeToolCalls RunStepType = "tool\_calls"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type>)
Usage RunStepUsage
Usage statistics related to the run step. This value will be `null` while the run step’s status is `in\_progress`.
CompletionTokens int64
Number of completion tokens used over the course of the run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) completion_tokens>)
PromptTokens int64
Number of prompt tokens used over the course of the run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) prompt_tokens>)
TotalTokens int64
Total number of tokens used (prompt + completion).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) total_tokens>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) data>)
Event ThreadRunStepCancelled
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 16>)
type AssistantStreamEventThreadRunStepExpired struct{…}
Occurs when a [run step](https://platform.openai.com/docs/api-reference/run-steps/step-object) expires.
Data [RunStep](</api/reference/go/resources/beta#(resource) beta.threads.runs.steps > (model) run_step > (schema)>)
Represents a step in execution of a run.
ID string
The identifier of the run step, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) id>)
AssistantID string
The ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) associated with the run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) assistant_id>)
CancelledAt int64
The Unix timestamp (in seconds) for when the run step was cancelled.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) cancelled_at>)
CompletedAt int64
The Unix timestamp (in seconds) for when the run step completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) completed_at>)
CreatedAt int64
The Unix timestamp (in seconds) for when the run step was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) created_at>)
ExpiredAt int64
The Unix timestamp (in seconds) for when the run step expired. A step is considered expired if the parent run is expired.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) expired_at>)
FailedAt int64
The Unix timestamp (in seconds) for when the run step failed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) failed_at>)
LastError RunStepLastError
The last error associated with this run step. Will be `null` if there are no errors.
Code string
One of `server\_error` or `rate\_limit\_exceeded`.
One of the following:
const RunStepLastErrorCodeServerError RunStepLastErrorCode = "server\_error"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code > (member) 0>)
const RunStepLastErrorCodeRateLimitExceeded RunStepLastErrorCode = "rate\_limit\_exceeded"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) code>)
Message string
A human-readable description of the error.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error > (property) message>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) last_error>)
Metadata [Metadata](</api/reference/go/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) metadata>)
Object ThreadRunStep
The object type, which is always `thread.run.step`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) object>)
RunID string
The ID of the [run](https://platform.openai.com/docs/api-reference/runs) that this run step is a part of.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) run_id>)
Status RunStepStatus
The status of the run step, which can be either `in\_progress`, `cancelled`, `failed`, `completed`, or `expired`.
One of the following:
const RunStepStatusInProgress RunStepStatus = "in\_progress"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 0>)
const RunStepStatusCancelled RunStepStatus = "cancelled"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 1>)
const RunStepStatusFailed RunStepStatus = "failed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 2>)
const RunStepStatusCompleted RunStepStatus = "completed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 3>)
const RunStepStatusExpired RunStepStatus = "expired"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status > (member) 4>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) status>)
StepDetails RunStepStepDetailsUnion
The details of the run step.
One of the following:
type MessageCreationStepDetails struct{…}
Details of the message creation by the run step.
MessageCreation MessageCreationStepDetailsMessageCreation
MessageID string
The ID of the message that was created by this run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation > (property) message_id>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) message_creation>)
Type MessageCreation
Always `message\_creation`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) message_creation_step_details > (schema)>)
type ToolCallsStepDetails struct{…}
Details of the tool call.
ToolCalls [][ToolCallUnion](</api/reference/go/resources/beta#(resource) beta.threads.runs.steps > (model) tool_call > (schema)>)
An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code\_interpreter`, `file\_search`, or `function`.
One of the following:
type CodeInterpreterToolCall struct{…}
Details of the Code Interpreter tool call the run step was involved in.
ID string
The ID of the tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) id>)
CodeInterpreter CodeInterpreterToolCallCodeInterpreter
The Code Interpreter tool call definition.
Input string
The input to the Code Interpreter tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) input>)
Outputs []CodeInterpreterToolCallCodeInterpreterOutputUnion
The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
One of the following:
type CodeInterpreterToolCallCodeInterpreterOutputLogs struct{…}
Text output from the Code Interpreter tool call as part of a run step.
Logs string
The text output from the Code Interpreter tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) logs>)
Type Logs
Always `logs`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0 > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 0>)
type CodeInterpreterToolCallCodeInterpreterOutputImage struct{…}
Image CodeInterpreterToolCallCodeInterpreterOutputImageImage
FileID string
The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image > (property) file_id>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) image>)
Type Image
Always `image`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs > (items) > (variant) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter > (property) outputs>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) code_interpreter>)
Type CodeInterpreter
The type of tool call. This is always going to be `code\_interpreter` for this type of tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) code_interpreter_tool_call > (schema)>)
type FileSearchToolCall struct{…}
ID string
The ID of the tool call object.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) id>)
FileSearch FileSearchToolCallFileSearch
For now, this is always going to be an empty object.
RankingOptions FileSearchToolCallFileSearchRankingOptionsOptional
The ranking options for the file search.
Ranker string
The ranker to use for the file search. If not specified will use the `auto` ranker.
One of the following:
const FileSearchToolCallFileSearchRankingOptionsRankerAuto FileSearchToolCallFileSearchRankingOptionsRanker = "auto"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 0>)
const FileSearchToolCallFileSearchRankingOptionsRankerDefault2024\_08\_21 FileSearchToolCallFileSearchRankingOptionsRanker = "default\_2024\_08\_21"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) ranker>)
ScoreThreshold float64
The score threshold for the file search. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options > (property) score_threshold>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) ranking_options>)
Results []FileSearchToolCallFileSearchResultOptional
The results of the file search.
FileID string
The ID of the file that result was found in.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_id>)
FileName string
The name of the file that result was found in.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) file_name>)
Score float64
The score of the result. All values must be a floating point number between 0 and 1.
minimum0
maximum1
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) score>)
Content []FileSearchToolCallFileSearchResultContentOptional
The content of the result that was found. The content is only included if requested via the include query parameter.
Text stringOptional
The text content of the file.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) text>)
Type stringOptional
The type of the content.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content > (items) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results > (items) > (property) content>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search > (property) results>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) file_search>)
Type FileSearch
The type of tool call. This is always going to be `file\_search` for this type of tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) file_search_tool_call > (schema)>)
type FunctionToolCall struct{…}
ID string
The ID of the tool call object.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) id>)
Function FunctionToolCallFunction
The definition of the function that was called.
Arguments string
The arguments passed to the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) arguments>)
Name string
The name of the function.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) name>)
Output string
The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function > (property) output>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) function>)
Type Function
The type of tool call. This is always going to be `function` for this type of tool call.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) function_tool_call > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema) > (property) tool_calls>)
Type ToolCalls
Always `tool\_calls`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) tool_calls_step_details > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) step_details>)
ThreadID string
The ID of the [thread](https://platform.openai.com/docs/api-reference/threads) that was run.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) thread_id>)
Type RunStepType
The type of run step, which can be either `message\_creation` or `tool\_calls`.
One of the following:
const RunStepTypeMessageCreation RunStepType = "message\_creation"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type > (member) 0>)
const RunStepTypeToolCalls RunStepType = "tool\_calls"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) type>)
Usage RunStepUsage
Usage statistics related to the run step. This value will be `null` while the run step’s status is `in\_progress`.
CompletionTokens int64
Number of completion tokens used over the course of the run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) completion_tokens>)
PromptTokens int64
Number of prompt tokens used over the course of the run step.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) prompt_tokens>)
TotalTokens int64
Total number of tokens used (prompt + completion).
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage > (property) total_tokens>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data + (resource) beta.threads.runs.steps > (model) run_step > (schema) > (property) usage>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) data>)
Event ThreadRunStepExpired
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 17>)
type AssistantStreamEventThreadMessageCreated struct{…}
Occurs when a [message](https://platform.openai.com/docs/api-reference/messages/object) is created.
Data [Message](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>)
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
ID string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) id>)
AssistantID string
If applicable, the ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) that authored this message.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) assistant_id>)
Attachments []MessageAttachment
A list of files attached to the message, and the tools they were added to.
FileID stringOptional
The ID of the file to attach to the message.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) file_id>)
Tools []MessageAttachmentToolUnionOptional
The tools to add this file to.
One of the following:
type CodeInterpreterTool struct{…}
Type CodeInterpreter
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
type MessageAttachmentToolAssistantToolsFileSearchTypeOnly struct{…}
Type FileSearch
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools > (items) > (variant) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments>)
CompletedAt int64
The Unix timestamp (in seconds) for when the message was completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) completed_at>)
Content [][MessageContentUnion](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) message_content > (schema)>)
The content of the message in array of text and/or images.
One of the following:
type ImageFileContentBlock struct{…}
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
ImageFile [ImageFile](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) image_file > (schema)>)
FileID string
The [File](https://platform.openai.com/docs/api-reference/files) ID of the image in the message content. Set `purpose="vision"` when uploading the File if you need to later display the file content.
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) file_id>)
Detail ImageFileDetailOptional
Specifies the detail level of the image if specified by the user. `low` uses fewer tokens, you can opt in to high resolution using `high`.
One of the following:
const ImageFileDetailAuto ImageFileDetail = "auto"
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 0>)
const ImageFileDetailLow ImageFileDetail = "low"
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 1>)
const ImageFileDetailHigh ImageFileDetail = "high"
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) detail>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file>)
Type ImageFile
Always `image\_file`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) image_file_content_block > (schema)>)
type ImageURLContentBlock struct{…}
References an image URL in the content of a message.
ImageURL [ImageURL](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) image_url > (schema)>)
URL string
The external URL of the image, must be a supported image types: jpeg, jpg, png, gif, webp.
formaturi
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) url>)
Detail ImageURLDetailOptional
Specifies the detail level of the image. `low` uses fewer tokens, you can opt in to high resolution using `high`. Default value is `auto`
One of the following:
const ImageURLDetailAuto ImageURLDetail = "auto"
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 0>)
const ImageURLDetailLow ImageURLDetail = "low"
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 1>)
const ImageURLDetailHigh ImageURLDetail = "high"
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) detail>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url>)
Type ImageURL
The type of the content part.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) image_url_content_block > (schema)>)
type TextContentBlock struct{…}
The text content that is part of a message.
Text [Text](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) text > (schema)>)
Annotations [][AnnotationUnion](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) annotation > (schema)>)
One of the following:
type FileCitationAnnotation struct{…}
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
EndIndex int64
minimum0
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) end_index>)
FileCitation FileCitationAnnotationFileCitation
FileID string
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation>)
StartIndex int64
minimum0
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) start_index>)
Text string
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) text>)
Type FileCitation
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema)>)
type FilePathAnnotation struct{…}
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
EndIndex int64
minimum0
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) end_index>)
FilePath FilePathAnnotationFilePath
FileID string
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path>)
StartIndex int64
minimum0
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) start_index>)
Text string
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) text>)
Type FilePath
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema)>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) text > (schema) > (property) annotations>)
Value string
The data that makes up the text.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) text > (schema) > (property) value>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text>)
Type Text
Always `text`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) text_content_block > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) text_content_block > (schema)>)
type RefusalContentBlock struct{…}
The refusal content generated by the assistant.
Refusal string
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) refusal>)
Type Refusal
Always `refusal`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) refusal_content_block > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) content>)
CreatedAt int64
The Unix timestamp (in seconds) for when the message was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) created_at>)
IncompleteAt int64
The Unix timestamp (in seconds) for when the message was marked as incomplete.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_at>)
IncompleteDetails MessageIncompleteDetails
On an incomplete message, details about why the message is incomplete.
Reason string
The reason the message is incomplete.
One of the following:
const MessageIncompleteDetailsReasonContentFilter MessageIncompleteDetailsReason = "content\_filter"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
const MessageIncompleteDetailsReasonMaxTokens MessageIncompleteDetailsReason = "max\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
const MessageIncompleteDetailsReasonRunCancelled MessageIncompleteDetailsReason = "run\_cancelled"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 2>)
const MessageIncompleteDetailsReasonRunExpired MessageIncompleteDetailsReason = "run\_expired"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 3>)
const MessageIncompleteDetailsReasonRunFailed MessageIncompleteDetailsReason = "run\_failed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 4>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details>)
Metadata [Metadata](</api/reference/go/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) metadata>)
Object ThreadMessage
The object type, which is always `thread.message`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) object>)
Role MessageRole
The entity that produced the message. One of `user` or `assistant`.
One of the following:
const MessageRoleUser MessageRole = "user"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) role > (member) 0>)
const MessageRoleAssistant MessageRole = "assistant"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) role > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) role>)
RunID string
The ID of the [run](https://platform.openai.com/docs/api-reference/runs) associated with the creation of this message. Value is `null` when messages are created manually using the create message or create thread endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) run_id>)
Status MessageStatus
The status of the message, which can be either `in\_progress`, `incomplete`, or `completed`.
One of the following:
const MessageStatusInProgress MessageStatus = "in\_progress"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) status > (member) 0>)
const MessageStatusIncomplete MessageStatus = "incomplete"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) status > (member) 1>)
const MessageStatusCompleted MessageStatus = "completed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) status > (member) 2>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) status>)
ThreadID string
The [thread](https://platform.openai.com/docs/api-reference/threads) ID that this message belongs to.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) thread_id>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) data>)
Event ThreadMessageCreated
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 18>)
type AssistantStreamEventThreadMessageInProgress struct{…}
Occurs when a [message](https://platform.openai.com/docs/api-reference/messages/object) moves to an `in\_progress` state.
Data [Message](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>)
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
ID string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) id>)
AssistantID string
If applicable, the ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) that authored this message.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) assistant_id>)
Attachments []MessageAttachment
A list of files attached to the message, and the tools they were added to.
FileID stringOptional
The ID of the file to attach to the message.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) file_id>)
Tools []MessageAttachmentToolUnionOptional
The tools to add this file to.
One of the following:
type CodeInterpreterTool struct{…}
Type CodeInterpreter
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
type MessageAttachmentToolAssistantToolsFileSearchTypeOnly struct{…}
Type FileSearch
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools > (items) > (variant) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments>)
CompletedAt int64
The Unix timestamp (in seconds) for when the message was completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) completed_at>)
Content [][MessageContentUnion](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) message_content > (schema)>)
The content of the message in array of text and/or images.
One of the following:
type ImageFileContentBlock struct{…}
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
ImageFile [ImageFile](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) image_file > (schema)>)
FileID string
The [File](https://platform.openai.com/docs/api-reference/files) ID of the image in the message content. Set `purpose="vision"` when uploading the File if you need to later display the file content.
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) file_id>)
Detail ImageFileDetailOptional
Specifies the detail level of the image if specified by the user. `low` uses fewer tokens, you can opt in to high resolution using `high`.
One of the following:
const ImageFileDetailAuto ImageFileDetail = "auto"
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 0>)
const ImageFileDetailLow ImageFileDetail = "low"
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 1>)
const ImageFileDetailHigh ImageFileDetail = "high"
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) detail>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file>)
Type ImageFile
Always `image\_file`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) image_file_content_block > (schema)>)
type ImageURLContentBlock struct{…}
References an image URL in the content of a message.
ImageURL [ImageURL](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) image_url > (schema)>)
URL string
The external URL of the image, must be a supported image types: jpeg, jpg, png, gif, webp.
formaturi
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) url>)
Detail ImageURLDetailOptional
Specifies the detail level of the image. `low` uses fewer tokens, you can opt in to high resolution using `high`. Default value is `auto`
One of the following:
const ImageURLDetailAuto ImageURLDetail = "auto"
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 0>)
const ImageURLDetailLow ImageURLDetail = "low"
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 1>)
const ImageURLDetailHigh ImageURLDetail = "high"
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) detail>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url>)
Type ImageURL
The type of the content part.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) image_url_content_block > (schema)>)
type TextContentBlock struct{…}
The text content that is part of a message.
Text [Text](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) text > (schema)>)
Annotations [][AnnotationUnion](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) annotation > (schema)>)
One of the following:
type FileCitationAnnotation struct{…}
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
EndIndex int64
minimum0
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) end_index>)
FileCitation FileCitationAnnotationFileCitation
FileID string
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation>)
StartIndex int64
minimum0
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) start_index>)
Text string
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) text>)
Type FileCitation
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema)>)
type FilePathAnnotation struct{…}
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
EndIndex int64
minimum0
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) end_index>)
FilePath FilePathAnnotationFilePath
FileID string
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path>)
StartIndex int64
minimum0
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) start_index>)
Text string
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) text>)
Type FilePath
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema)>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) text > (schema) > (property) annotations>)
Value string
The data that makes up the text.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) text > (schema) > (property) value>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text>)
Type Text
Always `text`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) text_content_block > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) text_content_block > (schema)>)
type RefusalContentBlock struct{…}
The refusal content generated by the assistant.
Refusal string
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) refusal>)
Type Refusal
Always `refusal`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) refusal_content_block > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) content>)
CreatedAt int64
The Unix timestamp (in seconds) for when the message was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) created_at>)
IncompleteAt int64
The Unix timestamp (in seconds) for when the message was marked as incomplete.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_at>)
IncompleteDetails MessageIncompleteDetails
On an incomplete message, details about why the message is incomplete.
Reason string
The reason the message is incomplete.
One of the following:
const MessageIncompleteDetailsReasonContentFilter MessageIncompleteDetailsReason = "content\_filter"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
const MessageIncompleteDetailsReasonMaxTokens MessageIncompleteDetailsReason = "max\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
const MessageIncompleteDetailsReasonRunCancelled MessageIncompleteDetailsReason = "run\_cancelled"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 2>)
const MessageIncompleteDetailsReasonRunExpired MessageIncompleteDetailsReason = "run\_expired"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 3>)
const MessageIncompleteDetailsReasonRunFailed MessageIncompleteDetailsReason = "run\_failed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 4>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details>)
Metadata [Metadata](</api/reference/go/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) metadata>)
Object ThreadMessage
The object type, which is always `thread.message`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) object>)
Role MessageRole
The entity that produced the message. One of `user` or `assistant`.
One of the following:
const MessageRoleUser MessageRole = "user"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) role > (member) 0>)
const MessageRoleAssistant MessageRole = "assistant"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) role > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) role>)
RunID string
The ID of the [run](https://platform.openai.com/docs/api-reference/runs) associated with the creation of this message. Value is `null` when messages are created manually using the create message or create thread endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) run_id>)
Status MessageStatus
The status of the message, which can be either `in\_progress`, `incomplete`, or `completed`.
One of the following:
const MessageStatusInProgress MessageStatus = "in\_progress"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) status > (member) 0>)
const MessageStatusIncomplete MessageStatus = "incomplete"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) status > (member) 1>)
const MessageStatusCompleted MessageStatus = "completed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) status > (member) 2>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) status>)
ThreadID string
The [thread](https://platform.openai.com/docs/api-reference/threads) ID that this message belongs to.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) thread_id>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) data>)
Event ThreadMessageInProgress
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 19>)
type AssistantStreamEventThreadMessageDelta struct{…}
Occurs when parts of a [Message](https://platform.openai.com/docs/api-reference/messages/object) are being streamed.
Data [MessageDeltaEvent](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) message_delta_event > (schema)>)
Represents a message delta i.e. any changed fields on a message during streaming.
ID string
The identifier of the message, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 20 > (property) data + (resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) id>)
Delta [MessageDelta](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) message_delta > (schema)>)
The delta containing the fields that have changed on the Message.
Content [][MessageContentDeltaUnion](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) message_content_delta > (schema)>)Optional
The content of the message in array of text and/or images.
One of the following:
type ImageFileDeltaBlock struct{…}
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
Index int64
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) index>)
Type ImageFile
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) type>)
ImageFile [ImageFileDelta](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) image_file_delta > (schema)>)Optional
Detail ImageFileDeltaDetailOptional
Specifies the detail level of the image if specified by the user. `low` uses fewer tokens, you can opt in to high resolution using `high`.
One of the following:
const ImageFileDeltaDetailAuto ImageFileDeltaDetail = "auto"
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) detail > (member) 0>)
const ImageFileDeltaDetailLow ImageFileDeltaDetail = "low"
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) detail > (member) 1>)
const ImageFileDeltaDetailHigh ImageFileDeltaDetail = "high"
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) detail>)
FileID stringOptional
The [File](https://platform.openai.com/docs/api-reference/files) ID of the image in the message content. Set `purpose="vision"` when uploading the File if you need to later display the file content.
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) image_file>)
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) image_file_delta_block > (schema)>)
type TextDeltaBlock struct{…}
The text content that is part of a message.
Index int64
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) index>)
Type Text
Always `text`.
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) type>)
Text [TextDelta](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) text_delta > (schema)>)Optional
Annotations [][AnnotationDeltaUnion](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) annotation_delta > (schema)>)Optional
One of the following:
type FileCitationDeltaAnnotation struct{…}
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
Index int64
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) index>)
Type FileCitation
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) type>)
EndIndex int64Optional
minimum0
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) end_index>)
FileCitation FileCitationDeltaAnnotationFileCitationOptional
FileID stringOptional
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) file_id>)
Quote stringOptional
The specific quote in the file.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) quote>)
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation>)
StartIndex int64Optional
minimum0
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) start_index>)
Text stringOptional
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema)>)
type FilePathDeltaAnnotation struct{…}
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
Index int64
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) index>)
Type FilePath
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) type>)
EndIndex int64Optional
minimum0
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) end_index>)
FilePath FilePathDeltaAnnotationFilePathOptional
FileID stringOptional
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path>)
StartIndex int64Optional
minimum0
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) start_index>)
Text stringOptional
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_delta_annotation > (schema)>)
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) text_delta > (schema) > (property) annotations>)
Value stringOptional
The data that makes up the text.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text + (resource) beta.threads.messages > (model) text_delta > (schema) > (property) value>)
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) text_delta_block > (schema)>)
type RefusalDeltaBlock struct{…}
The refusal content that is part of a message.
Index int64
The index of the refusal part in the message.
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) index>)
Type Refusal
Always `refusal`.
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) type>)
Refusal stringOptional
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) refusal>)
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) refusal_delta_block > (schema)>)
type ImageURLDeltaBlock struct{…}
References an image URL in the content of a message.
Index int64
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) index>)
Type ImageURL
Always `image\_url`.
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) type>)
ImageURL [ImageURLDelta](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) image_url_delta > (schema)>)Optional
Detail ImageURLDeltaDetailOptional
Specifies the detail level of the image. `low` uses fewer tokens, you can opt in to high resolution using `high`.
One of the following:
const ImageURLDeltaDetailAuto ImageURLDeltaDetail = "auto"
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) detail > (member) 0>)
const ImageURLDeltaDetailLow ImageURLDeltaDetail = "low"
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) detail > (member) 1>)
const ImageURLDeltaDetailHigh ImageURLDeltaDetail = "high"
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) detail>)
URL stringOptional
The URL of the image, must be a supported image types: jpeg, jpg, png, gif, webp.
formaturi
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) url>)
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) image_url>)
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) image_url_delta_block > (schema)>)
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) message_delta > (schema) > (property) content>)
Role MessageDeltaRoleOptional
The entity that produced the message. One of `user` or `assistant`.
One of the following:
const MessageDeltaRoleUser MessageDeltaRole = "user"
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) message_delta > (schema) > (property) role > (member) 0>)
const MessageDeltaRoleAssistant MessageDeltaRole = "assistant"
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) message_delta > (schema) > (property) role > (member) 1>)
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta + (resource) beta.threads.messages > (model) message_delta > (schema) > (property) role>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 20 > (property) data + (resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta>)
Object ThreadMessageDelta
The object type, which is always `thread.message.delta`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 20 > (property) data + (resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) object>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 20 > (property) data>)
Event ThreadMessageDelta
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 20 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 20>)
type AssistantStreamEventThreadMessageCompleted struct{…}
Occurs when a [message](https://platform.openai.com/docs/api-reference/messages/object) is completed.
Data [Message](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>)
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
ID string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) id>)
AssistantID string
If applicable, the ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) that authored this message.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) assistant_id>)
Attachments []MessageAttachment
A list of files attached to the message, and the tools they were added to.
FileID stringOptional
The ID of the file to attach to the message.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) file_id>)
Tools []MessageAttachmentToolUnionOptional
The tools to add this file to.
One of the following:
type CodeInterpreterTool struct{…}
Type CodeInterpreter
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
type MessageAttachmentToolAssistantToolsFileSearchTypeOnly struct{…}
Type FileSearch
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools > (items) > (variant) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments>)
CompletedAt int64
The Unix timestamp (in seconds) for when the message was completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) completed_at>)
Content [][MessageContentUnion](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) message_content > (schema)>)
The content of the message in array of text and/or images.
One of the following:
type ImageFileContentBlock struct{…}
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
ImageFile [ImageFile](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) image_file > (schema)>)
FileID string
The [File](https://platform.openai.com/docs/api-reference/files) ID of the image in the message content. Set `purpose="vision"` when uploading the File if you need to later display the file content.
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) file_id>)
Detail ImageFileDetailOptional
Specifies the detail level of the image if specified by the user. `low` uses fewer tokens, you can opt in to high resolution using `high`.
One of the following:
const ImageFileDetailAuto ImageFileDetail = "auto"
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 0>)
const ImageFileDetailLow ImageFileDetail = "low"
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 1>)
const ImageFileDetailHigh ImageFileDetail = "high"
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) detail>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file>)
Type ImageFile
Always `image\_file`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) image_file_content_block > (schema)>)
type ImageURLContentBlock struct{…}
References an image URL in the content of a message.
ImageURL [ImageURL](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) image_url > (schema)>)
URL string
The external URL of the image, must be a supported image types: jpeg, jpg, png, gif, webp.
formaturi
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) url>)
Detail ImageURLDetailOptional
Specifies the detail level of the image. `low` uses fewer tokens, you can opt in to high resolution using `high`. Default value is `auto`
One of the following:
const ImageURLDetailAuto ImageURLDetail = "auto"
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 0>)
const ImageURLDetailLow ImageURLDetail = "low"
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 1>)
const ImageURLDetailHigh ImageURLDetail = "high"
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) detail>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url>)
Type ImageURL
The type of the content part.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) image_url_content_block > (schema)>)
type TextContentBlock struct{…}
The text content that is part of a message.
Text [Text](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) text > (schema)>)
Annotations [][AnnotationUnion](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) annotation > (schema)>)
One of the following:
type FileCitationAnnotation struct{…}
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
EndIndex int64
minimum0
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) end_index>)
FileCitation FileCitationAnnotationFileCitation
FileID string
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation>)
StartIndex int64
minimum0
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) start_index>)
Text string
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) text>)
Type FileCitation
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema)>)
type FilePathAnnotation struct{…}
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
EndIndex int64
minimum0
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) end_index>)
FilePath FilePathAnnotationFilePath
FileID string
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path>)
StartIndex int64
minimum0
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) start_index>)
Text string
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) text>)
Type FilePath
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema)>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) text > (schema) > (property) annotations>)
Value string
The data that makes up the text.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) text > (schema) > (property) value>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text>)
Type Text
Always `text`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) text_content_block > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) text_content_block > (schema)>)
type RefusalContentBlock struct{…}
The refusal content generated by the assistant.
Refusal string
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) refusal>)
Type Refusal
Always `refusal`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) refusal_content_block > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) content>)
CreatedAt int64
The Unix timestamp (in seconds) for when the message was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) created_at>)
IncompleteAt int64
The Unix timestamp (in seconds) for when the message was marked as incomplete.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_at>)
IncompleteDetails MessageIncompleteDetails
On an incomplete message, details about why the message is incomplete.
Reason string
The reason the message is incomplete.
One of the following:
const MessageIncompleteDetailsReasonContentFilter MessageIncompleteDetailsReason = "content\_filter"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
const MessageIncompleteDetailsReasonMaxTokens MessageIncompleteDetailsReason = "max\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
const MessageIncompleteDetailsReasonRunCancelled MessageIncompleteDetailsReason = "run\_cancelled"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 2>)
const MessageIncompleteDetailsReasonRunExpired MessageIncompleteDetailsReason = "run\_expired"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 3>)
const MessageIncompleteDetailsReasonRunFailed MessageIncompleteDetailsReason = "run\_failed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 4>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details>)
Metadata [Metadata](</api/reference/go/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) metadata>)
Object ThreadMessage
The object type, which is always `thread.message`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) object>)
Role MessageRole
The entity that produced the message. One of `user` or `assistant`.
One of the following:
const MessageRoleUser MessageRole = "user"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) role > (member) 0>)
const MessageRoleAssistant MessageRole = "assistant"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) role > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) role>)
RunID string
The ID of the [run](https://platform.openai.com/docs/api-reference/runs) associated with the creation of this message. Value is `null` when messages are created manually using the create message or create thread endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) run_id>)
Status MessageStatus
The status of the message, which can be either `in\_progress`, `incomplete`, or `completed`.
One of the following:
const MessageStatusInProgress MessageStatus = "in\_progress"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) status > (member) 0>)
const MessageStatusIncomplete MessageStatus = "incomplete"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) status > (member) 1>)
const MessageStatusCompleted MessageStatus = "completed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) status > (member) 2>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) status>)
ThreadID string
The [thread](https://platform.openai.com/docs/api-reference/threads) ID that this message belongs to.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) thread_id>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) data>)
Event ThreadMessageCompleted
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 21>)
type AssistantStreamEventThreadMessageIncomplete struct{…}
Occurs when a [message](https://platform.openai.com/docs/api-reference/messages/object) ends before it is completed.
Data [Message](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>)
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
ID string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) id>)
AssistantID string
If applicable, the ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) that authored this message.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) assistant_id>)
Attachments []MessageAttachment
A list of files attached to the message, and the tools they were added to.
FileID stringOptional
The ID of the file to attach to the message.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) file_id>)
Tools []MessageAttachmentToolUnionOptional
The tools to add this file to.
One of the following:
type CodeInterpreterTool struct{…}
Type CodeInterpreter
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
type MessageAttachmentToolAssistantToolsFileSearchTypeOnly struct{…}
Type FileSearch
The type of tool being defined: `file\_search`
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools > (items) > (variant) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) attachments>)
CompletedAt int64
The Unix timestamp (in seconds) for when the message was completed.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) completed_at>)
Content [][MessageContentUnion](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) message_content > (schema)>)
The content of the message in array of text and/or images.
One of the following:
type ImageFileContentBlock struct{…}
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
ImageFile [ImageFile](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) image_file > (schema)>)
FileID string
The [File](https://platform.openai.com/docs/api-reference/files) ID of the image in the message content. Set `purpose="vision"` when uploading the File if you need to later display the file content.
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) file_id>)
Detail ImageFileDetailOptional
Specifies the detail level of the image if specified by the user. `low` uses fewer tokens, you can opt in to high resolution using `high`.
One of the following:
const ImageFileDetailAuto ImageFileDetail = "auto"
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 0>)
const ImageFileDetailLow ImageFileDetail = "low"
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 1>)
const ImageFileDetailHigh ImageFileDetail = "high"
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) detail>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file>)
Type ImageFile
Always `image\_file`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) image_file_content_block > (schema)>)
type ImageURLContentBlock struct{…}
References an image URL in the content of a message.
ImageURL [ImageURL](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) image_url > (schema)>)
URL string
The external URL of the image, must be a supported image types: jpeg, jpg, png, gif, webp.
formaturi
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) url>)
Detail ImageURLDetailOptional
Specifies the detail level of the image. `low` uses fewer tokens, you can opt in to high resolution using `high`. Default value is `auto`
One of the following:
const ImageURLDetailAuto ImageURLDetail = "auto"
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 0>)
const ImageURLDetailLow ImageURLDetail = "low"
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 1>)
const ImageURLDetailHigh ImageURLDetail = "high"
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) detail>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url>)
Type ImageURL
The type of the content part.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) image_url_content_block > (schema)>)
type TextContentBlock struct{…}
The text content that is part of a message.
Text [Text](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) text > (schema)>)
Annotations [][AnnotationUnion](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) annotation > (schema)>)
One of the following:
type FileCitationAnnotation struct{…}
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
EndIndex int64
minimum0
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) end_index>)
FileCitation FileCitationAnnotationFileCitation
FileID string
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation>)
StartIndex int64
minimum0
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) start_index>)
Text string
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) text>)
Type FileCitation
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema)>)
type FilePathAnnotation struct{…}
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
EndIndex int64
minimum0
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) end_index>)
FilePath FilePathAnnotationFilePath
FileID string
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path>)
StartIndex int64
minimum0
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) start_index>)
Text string
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) text>)
Type FilePath
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema)>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) text > (schema) > (property) annotations>)
Value string
The data that makes up the text.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) text > (schema) > (property) value>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text>)
Type Text
Always `text`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) text_content_block > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) text_content_block > (schema)>)
type RefusalContentBlock struct{…}
The refusal content generated by the assistant.
Refusal string
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) refusal>)
Type Refusal
Always `refusal`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) refusal_content_block > (schema)>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) content>)
CreatedAt int64
The Unix timestamp (in seconds) for when the message was created.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) created_at>)
IncompleteAt int64
The Unix timestamp (in seconds) for when the message was marked as incomplete.
formatunixtime
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_at>)
IncompleteDetails MessageIncompleteDetails
On an incomplete message, details about why the message is incomplete.
Reason string
The reason the message is incomplete.
One of the following:
const MessageIncompleteDetailsReasonContentFilter MessageIncompleteDetailsReason = "content\_filter"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
const MessageIncompleteDetailsReasonMaxTokens MessageIncompleteDetailsReason = "max\_tokens"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
const MessageIncompleteDetailsReasonRunCancelled MessageIncompleteDetailsReason = "run\_cancelled"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 2>)
const MessageIncompleteDetailsReasonRunExpired MessageIncompleteDetailsReason = "run\_expired"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 3>)
const MessageIncompleteDetailsReasonRunFailed MessageIncompleteDetailsReason = "run\_failed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 4>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details>)
Metadata [Metadata](</api/reference/go/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) metadata>)
Object ThreadMessage
The object type, which is always `thread.message`.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) object>)
Role MessageRole
The entity that produced the message. One of `user` or `assistant`.
One of the following:
const MessageRoleUser MessageRole = "user"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) role > (member) 0>)
const MessageRoleAssistant MessageRole = "assistant"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) role > (member) 1>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) role>)
RunID string
The ID of the [run](https://platform.openai.com/docs/api-reference/runs) associated with the creation of this message. Value is `null` when messages are created manually using the create message or create thread endpoints.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) run_id>)
Status MessageStatus
The status of the message, which can be either `in\_progress`, `incomplete`, or `completed`.
One of the following:
const MessageStatusInProgress MessageStatus = "in\_progress"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) status > (member) 0>)
const MessageStatusIncomplete MessageStatus = "incomplete"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) status > (member) 1>)
const MessageStatusCompleted MessageStatus = "completed"
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) status > (member) 2>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) status>)
ThreadID string
The [thread](https://platform.openai.com/docs/api-reference/threads) ID that this message belongs to.
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data + (resource) beta.threads.messages > (model) message > (schema) > (property) thread_id>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) data>)
Event ThreadMessageIncomplete
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 22>)
type AssistantStreamEventErrorEvent struct{…}
Occurs when an [error](https://platform.openai.com/docs/guides/error-codes#api-errors) occurs. This can happen due to an internal server error or a timeout.
Data [ErrorObject](</api/reference/go/resources/$shared#(resource) $shared > (model) error_object > (schema)>)
Code string
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 23 > (property) data + (resource) $shared > (model) error_object > (schema) > (property) code>)
Message string
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 23 > (property) data + (resource) $shared > (model) error_object > (schema) > (property) message>)
Param string
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 23 > (property) data + (resource) $shared > (model) error_object > (schema) > (property) param>)
Type string
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 23 > (property) data + (resource) $shared > (model) error_object > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 23 > (property) data>)
Event Error
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 23 > (property) event>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema) > (variant) 23>)
[](<#(resource) beta.assistants > (model) assistant_stream_event > (schema)>)
### Create run
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
)
func main() {
client := openai.NewClient(
option.WithAPIKey("My API Key"),
)
run, err := client.Beta.Threads.Runs.New(
context.TODO(),
"thread\_id",
openai.BetaThreadRunNewParams{
AssistantID: "assistant\_id",
},
)
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", run.ID)
}
`
```
```
`{
"id": "run\_abc123",
"object": "thread.run",
"created\_at": 1699063290,
"assistant\_id": "asst\_abc123",
"thread\_id": "thread\_abc123",
"status": "queued",
"started\_at": 1699063290,
"expires\_at": null,
"cancelled\_at": null,
"failed\_at": null,
"completed\_at": 1699063291,
"last\_error": null,
"model": "gpt-4o",
"instructions": null,
"incomplete\_details": null,
"tools": [
{
"type": "code\_interpreter"
}
],
"metadata": {},
"usage": null,
"temperature": 1.0,
"top\_p": 1.0,
"max\_prompt\_tokens": 1000,
"max\_completion\_tokens": 1000,
"truncation\_strategy": {
"type": "auto",
"last\_messages": null
},
"response\_format": "auto",
"tool\_choice": "auto",
"parallel\_tool\_calls": true
}
`
```
##### Returns Examples
```
`{
"id": "run\_abc123",
"object": "thread.run",
"created\_at": 1699063290,
"assistant\_id": "asst\_abc123",
"thread\_id": "thread\_abc123",
"status": "queued",
"started\_at": 1699063290,
"expires\_at": null,
"cancelled\_at": null,
"failed\_at": null,
"completed\_at": 1699063291,
"last\_error": null,
"model": "gpt-4o",
"instructions": null,
"incomplete\_details": null,
"tools": [
{
"type": "code\_interpreter"
}
],
"metadata": {},
"usage": null,
"temperature": 1.0,
"top\_p": 1.0,
"max\_prompt\_tokens": 1000,
"max\_completion\_tokens": 1000,
"truncation\_strategy": {
"type": "auto",
"last\_messages": null
},
"response\_format": "auto",
"tool\_choice": "auto",
"parallel\_tool\_calls": true
}
`
```