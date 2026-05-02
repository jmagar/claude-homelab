Retrieve an item | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Conversations](/api/reference/go/resources/conversations)
[Items](/api/reference/go/resources/conversations/subresources/items)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Retrieve an item
client.Conversations.Items.Get(ctx, conversationID, itemID, query) (\*[ConversationItemUnion](</api/reference/go/resources/conversations#(resource) conversations.items > (model) conversation_item > (schema)>), error)
GET/conversations/{conversation\_id}/items/{item\_id}
Get a single item from a conversation with the given IDs.
##### ParametersExpand Collapse
conversationID string
[](<#(resource) conversations.items > (method) retrieve > (params) default > (param) conversation_id > (schema)>)
itemID string
[](<#(resource) conversations.items > (method) retrieve > (params) default > (param) item_id > (schema)>)
query ItemGetParams
Include param.Field[[][ResponseIncludable](</api/reference/go/resources/responses#(resource) responses > (model) response_includable > (schema)>)]Optional
Additional fields to include in the response. See the `include`
parameter for [listing Conversation items above](https://platform.openai.com/docs/api-reference/conversations/list-items#conversations_list_items-include) for more information.
const ResponseIncludableFileSearchCallResults [ResponseIncludable](</api/reference/go/resources/responses#(resource) responses > (model) response_includable > (schema)>) = "file\_search\_call.results"
[](<#(resource) responses > (model) response_includable > (schema) > (member) 0>)
const ResponseIncludableWebSearchCallResults [ResponseIncludable](</api/reference/go/resources/responses#(resource) responses > (model) response_includable > (schema)>) = "web\_search\_call.results"
[](<#(resource) responses > (model) response_includable > (schema) > (member) 1>)
const ResponseIncludableWebSearchCallActionSources [ResponseIncludable](</api/reference/go/resources/responses#(resource) responses > (model) response_includable > (schema)>) = "web\_search\_call.action.sources"
[](<#(resource) responses > (model) response_includable > (schema) > (member) 2>)
const ResponseIncludableMessageInputImageImageURL [ResponseIncludable](</api/reference/go/resources/responses#(resource) responses > (model) response_includable > (schema)>) = "message.input\_image.image\_url"
[](<#(resource) responses > (model) response_includable > (schema) > (member) 3>)
const ResponseIncludableComputerCallOutputOutputImageURL [ResponseIncludable](</api/reference/go/resources/responses#(resource) responses > (model) response_includable > (schema)>) = "computer\_call\_output.output.image\_url"
[](<#(resource) responses > (model) response_includable > (schema) > (member) 4>)
const ResponseIncludableCodeInterpreterCallOutputs [ResponseIncludable](</api/reference/go/resources/responses#(resource) responses > (model) response_includable > (schema)>) = "code\_interpreter\_call.outputs"
[](<#(resource) responses > (model) response_includable > (schema) > (member) 5>)
const ResponseIncludableReasoningEncryptedContent [ResponseIncludable](</api/reference/go/resources/responses#(resource) responses > (model) response_includable > (schema)>) = "reasoning.encrypted\_content"
[](<#(resource) responses > (model) response_includable > (schema) > (member) 6>)
const ResponseIncludableMessageOutputTextLogprobs [ResponseIncludable](</api/reference/go/resources/responses#(resource) responses > (model) response_includable > (schema)>) = "message.output\_text.logprobs"
[](<#(resource) responses > (model) response_includable > (schema) > (member) 7>)
[](<#(resource) conversations.items > (method) retrieve > (params) default > (param) include>)
[](<#(resource) conversations.items > (method) retrieve > (params) default>)
##### ReturnsExpand Collapse
type ConversationItemUnion interface{…}
A single item within a conversation. The set of possible types are the same as the `output` type of a [Response object](https://platform.openai.com/docs/api-reference/responses/object#responses/object-output).
One of the following:
type Message struct{…}
A message to or from the model.
ID string
The unique ID of the message.
[](<#(resource) conversations > (model) message > (schema) > (property) id>)
Content []MessageContentUnion
The content of the message
One of the following:
type ResponseInputText struct{…}
A text input to the model.
Text string
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
Type InputText
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
type ResponseOutputText struct{…}
A text output from the model.
Annotations []ResponseOutputTextAnnotationUnion
The annotations of the text output.
One of the following:
type ResponseOutputTextAnnotationFileCitation struct{…}
A citation to a file.
FileID string
The ID of the file.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) file_id>)
Filename string
The filename of the file cited.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) filename>)
Index int64
The index of the file in the list of files.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) index>)
Type FileCitation
The type of the file citation. Always `file\_citation`.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) type>)
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 0>)
type ResponseOutputTextAnnotationURLCitation struct{…}
A citation for a web resource used to generate a model response.
EndIndex int64
The index of the last character of the URL citation in the message.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) end_index>)
StartIndex int64
The index of the first character of the URL citation in the message.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) start_index>)
Title string
The title of the web resource.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) title>)
Type URLCitation
The type of the URL citation. Always `url\_citation`.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) type>)
URL string
The URL of the web resource.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) url>)
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 1>)
type ResponseOutputTextAnnotationContainerFileCitation struct{…}
A citation for a container file used to generate a model response.
ContainerID string
The ID of the container file.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 2 > (property) container_id>)
EndIndex int64
The index of the last character of the container file citation in the message.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 2 > (property) end_index>)
FileID string
The ID of the file.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 2 > (property) file_id>)
Filename string
The filename of the container file cited.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 2 > (property) filename>)
StartIndex int64
The index of the first character of the container file citation in the message.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 2 > (property) start_index>)
Type ContainerFileCitation
The type of the container file citation. Always `container\_file\_citation`.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 2 > (property) type>)
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 2>)
type ResponseOutputTextAnnotationFilePath struct{…}
A path to a file.
FileID string
The ID of the file.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 3 > (property) file_id>)
Index int64
The index of the file in the list of files.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 3 > (property) index>)
Type FilePath
The type of the file path. Always `file\_path`.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 3 > (property) type>)
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 3>)
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations>)
Text string
The text output from the model.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) text>)
Type OutputText
The type of the output text. Always `output\_text`.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) type>)
Logprobs []ResponseOutputTextLogprobOptional
Token string
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) token>)
Bytes []int64
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) bytes>)
Logprob float64
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) logprob>)
TopLogprobs []ResponseOutputTextLogprobTopLogprob
Token string
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) top_logprobs > (items) > (property) token>)
Bytes []int64
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) top_logprobs > (items) > (property) bytes>)
Logprob float64
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) top_logprobs > (items) > (property) logprob>)
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) top_logprobs>)
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs>)
[](<#(resource) responses > (model) response_output_text > (schema)>)
type TextContent struct{…}
A text content.
Text string
[](<#(resource) conversations > (model) text_content > (schema) > (property) text>)
Type Text
[](<#(resource) conversations > (model) text_content > (schema) > (property) type>)
[](<#(resource) conversations > (model) text_content > (schema)>)
type SummaryTextContent struct{…}
A summary text from the model.
Text string
A summary of the reasoning output from the model so far.
[](<#(resource) conversations > (model) summary_text_content > (schema) > (property) text>)
Type SummaryText
The type of the object. Always `summary\_text`.
[](<#(resource) conversations > (model) summary_text_content > (schema) > (property) type>)
[](<#(resource) conversations > (model) summary_text_content > (schema)>)
type MessageContentReasoningText struct{…}
Reasoning text from the model.
Text string
The reasoning text from the model.
[](<#(resource) conversations > (model) message > (schema) > (property) content > (items) > (variant) 4 > (property) text>)
Type ReasoningText
The type of the reasoning text. Always `reasoning\_text`.
[](<#(resource) conversations > (model) message > (schema) > (property) content > (items) > (variant) 4 > (property) type>)
[](<#(resource) conversations > (model) message > (schema) > (property) content > (items) > (variant) 4>)
type ResponseOutputRefusal struct{…}
A refusal from the model.
Refusal string
The refusal explanation from the model.
[](<#(resource) responses > (model) response_output_refusal > (schema) > (property) refusal>)
Type Refusal
The type of the refusal. Always `refusal`.
[](<#(resource) responses > (model) response_output_refusal > (schema) > (property) type>)
[](<#(resource) responses > (model) response_output_refusal > (schema)>)
type ResponseInputImage struct{…}
An image input to the model. Learn about [image inputs](https://platform.openai.com/docs/guides/vision).
Detail ResponseInputImageDetail
The detail level of the image to be sent to the model. One of `high`, `low`, `auto`, or `original`. Defaults to `auto`.
One of the following:
const ResponseInputImageDetailLow ResponseInputImageDetail = "low"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 0>)
const ResponseInputImageDetailHigh ResponseInputImageDetail = "high"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 1>)
const ResponseInputImageDetailAuto ResponseInputImageDetail = "auto"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 2>)
const ResponseInputImageDetailOriginal ResponseInputImageDetail = "original"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 3>)
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail>)
Type InputImage
The type of the input item. Always `input\_image`.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) type>)
FileID stringOptional
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) file_id>)
ImageURL stringOptional
The URL of the image to be sent to the model. A fully qualified URL or base64 encoded image in a data URL.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) image_url>)
[](<#(resource) responses > (model) response_input_image > (schema)>)
type ComputerScreenshotContent struct{…}
A screenshot of a computer.
Detail ComputerScreenshotContentDetail
The detail level of the screenshot image to be sent to the model. One of `high`, `low`, `auto`, or `original`. Defaults to `auto`.
One of the following:
const ComputerScreenshotContentDetailLow ComputerScreenshotContentDetail = "low"
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) detail > (member) 0>)
const ComputerScreenshotContentDetailHigh ComputerScreenshotContentDetail = "high"
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) detail > (member) 1>)
const ComputerScreenshotContentDetailAuto ComputerScreenshotContentDetail = "auto"
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) detail > (member) 2>)
const ComputerScreenshotContentDetailOriginal ComputerScreenshotContentDetail = "original"
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) detail > (member) 3>)
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) detail>)
FileID string
The identifier of an uploaded file that contains the screenshot.
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) file_id>)
ImageURL string
The URL of the screenshot image.
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) image_url>)
Type ComputerScreenshot
Specifies the event type. For a computer screenshot, this property is always set to `computer\_screenshot`.
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) type>)
[](<#(resource) conversations > (model) computer_screenshot_content > (schema)>)
type ResponseInputFile struct{…}
A file input to the model.
Type InputFile
The type of the input item. Always `input\_file`.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) type>)
Detail ResponseInputFileDetailOptional
The detail level of the file to be sent to the model. Use `low` for the default rendering behavior, or `high` to render the file at higher quality. Defaults to `low`.
One of the following:
const ResponseInputFileDetailLow ResponseInputFileDetail = "low"
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 0>)
const ResponseInputFileDetailHigh ResponseInputFileDetail = "high"
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 1>)
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail>)
FileData stringOptional
The content of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_data>)
FileID stringOptional
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_id>)
FileURL stringOptional
The URL of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_url>)
Filename stringOptional
The name of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) filename>)
[](<#(resource) responses > (model) response_input_file > (schema)>)
[](<#(resource) conversations > (model) message > (schema) > (property) content>)
Role MessageRole
The role of the message. One of `unknown`, `user`, `assistant`, `system`, `critic`, `discriminator`, `developer`, or `tool`.
One of the following:
const MessageRoleUnknown MessageRole = "unknown"
[](<#(resource) conversations > (model) message > (schema) > (property) role > (member) 0>)
const MessageRoleUser MessageRole = "user"
[](<#(resource) conversations > (model) message > (schema) > (property) role > (member) 1>)
const MessageRoleAssistant MessageRole = "assistant"
[](<#(resource) conversations > (model) message > (schema) > (property) role > (member) 2>)
const MessageRoleSystem MessageRole = "system"
[](<#(resource) conversations > (model) message > (schema) > (property) role > (member) 3>)
const MessageRoleCritic MessageRole = "critic"
[](<#(resource) conversations > (model) message > (schema) > (property) role > (member) 4>)
const MessageRoleDiscriminator MessageRole = "discriminator"
[](<#(resource) conversations > (model) message > (schema) > (property) role > (member) 5>)
const MessageRoleDeveloper MessageRole = "developer"
[](<#(resource) conversations > (model) message > (schema) > (property) role > (member) 6>)
const MessageRoleTool MessageRole = "tool"
[](<#(resource) conversations > (model) message > (schema) > (property) role > (member) 7>)
[](<#(resource) conversations > (model) message > (schema) > (property) role>)
Status MessageStatus
The status of item. One of `in\_progress`, `completed`, or `incomplete`. Populated when items are returned via API.
One of the following:
const MessageStatusInProgress MessageStatus = "in\_progress"
[](<#(resource) conversations > (model) message > (schema) > (property) status > (member) 0>)
const MessageStatusCompleted MessageStatus = "completed"
[](<#(resource) conversations > (model) message > (schema) > (property) status > (member) 1>)
const MessageStatusIncomplete MessageStatus = "incomplete"
[](<#(resource) conversations > (model) message > (schema) > (property) status > (member) 2>)
[](<#(resource) conversations > (model) message > (schema) > (property) status>)
Type Message
The type of the message. Always set to `message`.
[](<#(resource) conversations > (model) message > (schema) > (property) type>)
Phase MessagePhaseOptional
Labels an `assistant` message as intermediate commentary (`commentary`) or the final answer (`final\_answer`). For models like `gpt-5.3-codex` and beyond, when sending follow-up requests, preserve and resend phase on all assistant messages — dropping it can degrade performance. Not used for user messages.
One of the following:
const MessagePhaseCommentary MessagePhase = "commentary"
[](<#(resource) conversations > (model) message > (schema) > (property) phase > (member) 0>)
const MessagePhaseFinalAnswer MessagePhase = "final\_answer"
[](<#(resource) conversations > (model) message > (schema) > (property) phase > (member) 1>)
[](<#(resource) conversations > (model) message > (schema) > (property) phase>)
[](<#(resource) conversations > (model) message > (schema)>)
type ResponseFunctionToolCallItem struct{…}
A tool call to run a function. See the
[function calling guide](https://platform.openai.com/docs/guides/function-calling) for more information.
ID string
The unique ID of the function tool call.
[](<#(resource) responses > (model) response_function_tool_call_item > (schema) > (entry) 1 > (property) id>)
Status string
The status of the item. One of `in\_progress`, `completed`, or
`incomplete`. Populated when items are returned via API.
One of the following:
const ResponseFunctionToolCallItemStatusInProgress ResponseFunctionToolCallItemStatus = "in\_progress"
[](<#(resource) responses > (model) response_function_tool_call_item > (schema) > (entry) 1 > (property) status > (member) 0>)
const ResponseFunctionToolCallItemStatusCompleted ResponseFunctionToolCallItemStatus = "completed"
[](<#(resource) responses > (model) response_function_tool_call_item > (schema) > (entry) 1 > (property) status > (member) 1>)
const ResponseFunctionToolCallItemStatusIncomplete ResponseFunctionToolCallItemStatus = "incomplete"
[](<#(resource) responses > (model) response_function_tool_call_item > (schema) > (entry) 1 > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_function_tool_call_item > (schema) > (entry) 1 > (property) status>)
CreatedBy stringOptional
The identifier of the actor that created the item.
[](<#(resource) responses > (model) response_function_tool_call_item > (schema) > (entry) 1 > (property) created_by>)
[](<#(resource) responses > (model) response_function_tool_call_item > (schema)>)
type ResponseFunctionToolCallOutputItem struct{…}
ID string
The unique ID of the function call tool output.
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema) > (property) id>)
CallID string
The unique ID of the function tool call generated by the model.
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema) > (property) call_id>)
Output ResponseFunctionToolCallOutputItemOutputUnion
The output from the function call generated by your code.
Can be a string or an list of output content.
One of the following:
string
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema) > (property) output > (variant) 0>)
type ResponseFunctionToolCallOutputItemOutputOutputContentList []ResponseFunctionToolCallOutputItemOutputOutputContentListItemUnion
Text, image, or file output of the function call.
One of the following:
type ResponseInputText struct{…}
A text input to the model.
Text string
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
Type InputText
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
type ResponseInputImage struct{…}
An image input to the model. Learn about [image inputs](https://platform.openai.com/docs/guides/vision).
Detail ResponseInputImageDetail
The detail level of the image to be sent to the model. One of `high`, `low`, `auto`, or `original`. Defaults to `auto`.
One of the following:
const ResponseInputImageDetailLow ResponseInputImageDetail = "low"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 0>)
const ResponseInputImageDetailHigh ResponseInputImageDetail = "high"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 1>)
const ResponseInputImageDetailAuto ResponseInputImageDetail = "auto"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 2>)
const ResponseInputImageDetailOriginal ResponseInputImageDetail = "original"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 3>)
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail>)
Type InputImage
The type of the input item. Always `input\_image`.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) type>)
FileID stringOptional
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) file_id>)
ImageURL stringOptional
The URL of the image to be sent to the model. A fully qualified URL or base64 encoded image in a data URL.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) image_url>)
[](<#(resource) responses > (model) response_input_image > (schema)>)
type ResponseInputFile struct{…}
A file input to the model.
Type InputFile
The type of the input item. Always `input\_file`.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) type>)
Detail ResponseInputFileDetailOptional
The detail level of the file to be sent to the model. Use `low` for the default rendering behavior, or `high` to render the file at higher quality. Defaults to `low`.
One of the following:
const ResponseInputFileDetailLow ResponseInputFileDetail = "low"
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 0>)
const ResponseInputFileDetailHigh ResponseInputFileDetail = "high"
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 1>)
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail>)
FileData stringOptional
The content of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_data>)
FileID stringOptional
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_id>)
FileURL stringOptional
The URL of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_url>)
Filename stringOptional
The name of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) filename>)
[](<#(resource) responses > (model) response_input_file > (schema)>)
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema) > (property) output > (variant) 1>)
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema) > (property) output>)
Status ResponseFunctionToolCallOutputItemStatus
The status of the item. One of `in\_progress`, `completed`, or
`incomplete`. Populated when items are returned via API.
One of the following:
const ResponseFunctionToolCallOutputItemStatusInProgress ResponseFunctionToolCallOutputItemStatus = "in\_progress"
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema) > (property) status > (member) 0>)
const ResponseFunctionToolCallOutputItemStatusCompleted ResponseFunctionToolCallOutputItemStatus = "completed"
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema) > (property) status > (member) 1>)
const ResponseFunctionToolCallOutputItemStatusIncomplete ResponseFunctionToolCallOutputItemStatus = "incomplete"
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema) > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema) > (property) status>)
Type FunctionCallOutput
The type of the function tool call output. Always `function\_call\_output`.
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema) > (property) type>)
CreatedBy stringOptional
The identifier of the actor that created the item.
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema) > (property) created_by>)
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema)>)
type ResponseFileSearchToolCall struct{…}
The results of a file search tool call. See the
[file search guide](https://platform.openai.com/docs/guides/tools-file-search) for more information.
ID string
The unique ID of the file search tool call.
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) id>)
Queries []string
The queries used to search for files.
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) queries>)
Status ResponseFileSearchToolCallStatus
The status of the file search tool call. One of `in\_progress`,
`searching`, `incomplete` or `failed`,
One of the following:
const ResponseFileSearchToolCallStatusInProgress ResponseFileSearchToolCallStatus = "in\_progress"
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) status > (member) 0>)
const ResponseFileSearchToolCallStatusSearching ResponseFileSearchToolCallStatus = "searching"
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) status > (member) 1>)
const ResponseFileSearchToolCallStatusCompleted ResponseFileSearchToolCallStatus = "completed"
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) status > (member) 2>)
const ResponseFileSearchToolCallStatusIncomplete ResponseFileSearchToolCallStatus = "incomplete"
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) status > (member) 3>)
const ResponseFileSearchToolCallStatusFailed ResponseFileSearchToolCallStatus = "failed"
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) status > (member) 4>)
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) status>)
Type FileSearchCall
The type of the file search tool call. Always `file\_search\_call`.
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) type>)
Results []ResponseFileSearchToolCallResultOptional
The results of the file search tool call.
Attributes map[string, ResponseFileSearchToolCallResultAttributeUnion]Optional
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard. Keys are strings
with a maximum length of 64 characters. Values are strings with a maximum
length of 512 characters, booleans, or numbers.
One of the following:
string
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) results > (items) > (property) attributes > (items) > (variant) 0>)
float64
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) results > (items) > (property) attributes > (items) > (variant) 1>)
bool
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) results > (items) > (property) attributes > (items) > (variant) 2>)
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) results > (items) > (property) attributes>)
FileID stringOptional
The unique ID of the file.
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) results > (items) > (property) file_id>)
Filename stringOptional
The name of the file.
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) results > (items) > (property) filename>)
Score float64Optional
The relevance score of the file - a value between 0 and 1.
formatfloat
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) results > (items) > (property) score>)
Text stringOptional
The text that was retrieved from the file.
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) results > (items) > (property) text>)
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) results>)
[](<#(resource) responses > (model) response_file_search_tool_call > (schema)>)
type ResponseFunctionWebSearch struct{…}
The results of a web search tool call. See the
[web search guide](https://platform.openai.com/docs/guides/tools-web-search) for more information.
ID string
The unique ID of the web search tool call.
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) id>)
Action ResponseFunctionWebSearchActionUnion
An object describing the specific action taken in this web search call.
Includes details on how the model used the web (search, open\_page, find\_in\_page).
One of the following:
type ResponseFunctionWebSearchActionSearch struct{…}
Action type “search” - Performs a web search query.
Query string
[DEPRECATED] The search query.
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 0 > (property) query>)
Type Search
The action type.
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 0 > (property) type>)
Queries []stringOptional
The search queries.
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 0 > (property) queries>)
Sources []ResponseFunctionWebSearchActionSearchSourceOptional
The sources used in the search.
Type URL
The type of source. Always `url`.
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 0 > (property) sources > (items) > (property) type>)
URL string
The URL of the source.
formaturi
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 0 > (property) sources > (items) > (property) url>)
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 0 > (property) sources>)
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 0>)
type ResponseFunctionWebSearchActionOpenPage struct{…}
Action type “open\_page” - Opens a specific URL from search results.
Type OpenPage
The action type.
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 1 > (property) type>)
URL stringOptional
The URL opened by the model.
formaturi
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 1 > (property) url>)
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 1>)
type ResponseFunctionWebSearchActionFindInPage struct{…}
Action type “find\_in\_page”: Searches for a pattern within a loaded page.
Pattern string
The pattern or text to search for within the page.
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 2 > (property) pattern>)
Type FindInPage
The action type.
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 2 > (property) type>)
URL string
The URL of the page searched for the pattern.
formaturi
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 2 > (property) url>)
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 2>)
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action>)
Status ResponseFunctionWebSearchStatus
The status of the web search tool call.
One of the following:
const ResponseFunctionWebSearchStatusInProgress ResponseFunctionWebSearchStatus = "in\_progress"
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) status > (member) 0>)
const ResponseFunctionWebSearchStatusSearching ResponseFunctionWebSearchStatus = "searching"
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) status > (member) 1>)
const ResponseFunctionWebSearchStatusCompleted ResponseFunctionWebSearchStatus = "completed"
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) status > (member) 2>)
const ResponseFunctionWebSearchStatusFailed ResponseFunctionWebSearchStatus = "failed"
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) status > (member) 3>)
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) status>)
Type WebSearchCall
The type of the web search tool call. Always `web\_search\_call`.
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) type>)
[](<#(resource) responses > (model) response_function_web_search > (schema)>)
type ConversationItemImageGenerationCall struct{…}
An image generation request made by the model.
ID string
The unique ID of the image generation call.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 5 > (property) id>)
Result string
The generated image encoded in base64.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 5 > (property) result>)
Status string
The status of the image generation call.
One of the following:
const ConversationItemImageGenerationCallStatusInProgress ConversationItemImageGenerationCallStatus = "in\_progress"
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 5 > (property) status > (member) 0>)
const ConversationItemImageGenerationCallStatusCompleted ConversationItemImageGenerationCallStatus = "completed"
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 5 > (property) status > (member) 1>)
const ConversationItemImageGenerationCallStatusGenerating ConversationItemImageGenerationCallStatus = "generating"
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 5 > (property) status > (member) 2>)
const ConversationItemImageGenerationCallStatusFailed ConversationItemImageGenerationCallStatus = "failed"
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 5 > (property) status > (member) 3>)
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 5 > (property) status>)
Type ImageGenerationCall
The type of the image generation call. Always `image\_generation\_call`.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 5 > (property) type>)
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 5>)
type ResponseComputerToolCall struct{…}
A tool call to a computer use tool. See the
[computer use guide](https://platform.openai.com/docs/guides/tools-computer-use) for more information.
ID string
The unique ID of the computer call.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) id>)
CallID string
An identifier used when responding to the tool call with output.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) call_id>)
PendingSafetyChecks []ResponseComputerToolCallPendingSafetyCheck
The pending safety checks for the computer call.
ID string
The ID of the pending safety check.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) pending_safety_checks > (items) > (property) id>)
Code stringOptional
The type of the pending safety check.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) pending_safety_checks > (items) > (property) code>)
Message stringOptional
Details about the pending safety check.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) pending_safety_checks > (items) > (property) message>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) pending_safety_checks>)
Status ResponseComputerToolCallStatus
The status of the item. One of `in\_progress`, `completed`, or
`incomplete`. Populated when items are returned via API.
One of the following:
const ResponseComputerToolCallStatusInProgress ResponseComputerToolCallStatus = "in\_progress"
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) status > (member) 0>)
const ResponseComputerToolCallStatusCompleted ResponseComputerToolCallStatus = "completed"
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) status > (member) 1>)
const ResponseComputerToolCallStatusIncomplete ResponseComputerToolCallStatus = "incomplete"
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) status>)
Type ResponseComputerToolCallType
The type of the computer call. Always `computer\_call`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) type>)
Action ResponseComputerToolCallActionUnionOptional
A click action.
One of the following:
type ResponseComputerToolCallActionClick struct{…}
A click action.
Button string
Indicates which mouse button was pressed during the click. One of `left`, `right`, `wheel`, `back`, or `forward`.
One of the following:
const ResponseComputerToolCallActionClickButtonLeft ResponseComputerToolCallActionClickButton = "left"
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) button > (member) 0>)
const ResponseComputerToolCallActionClickButtonRight ResponseComputerToolCallActionClickButton = "right"
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) button > (member) 1>)
const ResponseComputerToolCallActionClickButtonWheel ResponseComputerToolCallActionClickButton = "wheel"
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) button > (member) 2>)
const ResponseComputerToolCallActionClickButtonBack ResponseComputerToolCallActionClickButton = "back"
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) button > (member) 3>)
const ResponseComputerToolCallActionClickButtonForward ResponseComputerToolCallActionClickButton = "forward"
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) button > (member) 4>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) button>)
Type Click
Specifies the event type. For a click action, this property is always `click`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) type>)
X int64
The x-coordinate where the click occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) x>)
Y int64
The y-coordinate where the click occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) y>)
Keys []stringOptional
The keys being held while clicking.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) keys>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0>)
type ResponseComputerToolCallActionDoubleClick struct{…}
A double click action.
Keys []string
The keys being held while double-clicking.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 1 > (property) keys>)
Type DoubleClick
Specifies the event type. For a double click action, this property is always set to `double\_click`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 1 > (property) type>)
X int64
The x-coordinate where the double click occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 1 > (property) x>)
Y int64
The y-coordinate where the double click occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 1 > (property) y>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 1>)
type ResponseComputerToolCallActionDrag struct{…}
A drag action.
Path []ResponseComputerToolCallActionDragPath
An array of coordinates representing the path of the drag action. Coordinates will appear as an array of objects, eg
```
`[
{ x: 100, y: 200 },
{ x: 200, y: 300 }
]`
```
X int64
The x-coordinate.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 2 > (property) path > (items) > (property) x>)
Y int64
The y-coordinate.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 2 > (property) path > (items) > (property) y>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 2 > (property) path>)
Type Drag
Specifies the event type. For a drag action, this property is always set to `drag`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 2 > (property) type>)
Keys []stringOptional
The keys being held while dragging the mouse.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 2 > (property) keys>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 2>)
type ResponseComputerToolCallActionKeypress struct{…}
A collection of keypresses the model would like to perform.
Keys []string
The combination of keys the model is requesting to be pressed. This is an array of strings, each representing a key.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 3 > (property) keys>)
Type Keypress
Specifies the event type. For a keypress action, this property is always set to `keypress`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 3 > (property) type>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 3>)
type ResponseComputerToolCallActionMove struct{…}
A mouse move action.
Type Move
Specifies the event type. For a move action, this property is always set to `move`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 4 > (property) type>)
X int64
The x-coordinate to move to.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 4 > (property) x>)
Y int64
The y-coordinate to move to.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 4 > (property) y>)
Keys []stringOptional
The keys being held while moving the mouse.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 4 > (property) keys>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 4>)
type ResponseComputerToolCallActionScreenshot struct{…}
A screenshot action.
Type Screenshot
Specifies the event type. For a screenshot action, this property is always set to `screenshot`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 5 > (property) type>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 5>)
type ResponseComputerToolCallActionScroll struct{…}
A scroll action.
ScrollX int64
The horizontal scroll distance.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 6 > (property) scroll_x>)
ScrollY int64
The vertical scroll distance.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 6 > (property) scroll_y>)
Type Scroll
Specifies the event type. For a scroll action, this property is always set to `scroll`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 6 > (property) type>)
X int64
The x-coordinate where the scroll occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 6 > (property) x>)
Y int64
The y-coordinate where the scroll occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 6 > (property) y>)
Keys []stringOptional
The keys being held while scrolling.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 6 > (property) keys>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 6>)
type ResponseComputerToolCallActionType struct{…}
An action to type in text.
Text string
The text to type.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 7 > (property) text>)
Type Type
Specifies the event type. For a type action, this property is always set to `type`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 7 > (property) type>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 7>)
type ResponseComputerToolCallActionWait struct{…}
A wait action.
Type Wait
Specifies the event type. For a wait action, this property is always set to `wait`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 8 > (property) type>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 8>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action>)
Actions [ComputerActionList](</api/reference/go/resources/responses#(resource) responses > (model) computer_action_list > (schema)>)Optional
Flattened batched actions for `computer\_use`. Each action includes an
`type` discriminator and action-specific fields.
One of the following:
type ComputerActionClick struct{…}
A click action.
Button string
Indicates which mouse button was pressed during the click. One of `left`, `right`, `wheel`, `back`, or `forward`.
One of the following:
const ComputerActionClickButtonLeft ComputerActionClickButton = "left"
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) button > (member) 0>)
const ComputerActionClickButtonRight ComputerActionClickButton = "right"
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) button > (member) 1>)
const ComputerActionClickButtonWheel ComputerActionClickButton = "wheel"
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) button > (member) 2>)
const ComputerActionClickButtonBack ComputerActionClickButton = "back"
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) button > (member) 3>)
const ComputerActionClickButtonForward ComputerActionClickButton = "forward"
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) button > (member) 4>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) button>)
Type Click
Specifies the event type. For a click action, this property is always `click`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) type>)
X int64
The x-coordinate where the click occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) x>)
Y int64
The y-coordinate where the click occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) y>)
Keys []stringOptional
The keys being held while clicking.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) keys>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0>)
type ComputerActionDoubleClick struct{…}
A double click action.
Keys []string
The keys being held while double-clicking.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 1 > (property) keys>)
Type DoubleClick
Specifies the event type. For a double click action, this property is always set to `double\_click`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 1 > (property) type>)
X int64
The x-coordinate where the double click occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 1 > (property) x>)
Y int64
The y-coordinate where the double click occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 1 > (property) y>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 1>)
type ComputerActionDrag struct{…}
A drag action.
Path []ComputerActionDragPath
An array of coordinates representing the path of the drag action. Coordinates will appear as an array of objects, eg
```
`[
{ x: 100, y: 200 },
{ x: 200, y: 300 }
]`
```
X int64
The x-coordinate.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 2 > (property) path > (items) > (property) x>)
Y int64
The y-coordinate.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 2 > (property) path > (items) > (property) y>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 2 > (property) path>)
Type Drag
Specifies the event type. For a drag action, this property is always set to `drag`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 2 > (property) type>)
Keys []stringOptional
The keys being held while dragging the mouse.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 2 > (property) keys>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 2>)
type ComputerActionKeypress struct{…}
A collection of keypresses the model would like to perform.
Keys []string
The combination of keys the model is requesting to be pressed. This is an array of strings, each representing a key.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 3 > (property) keys>)
Type Keypress
Specifies the event type. For a keypress action, this property is always set to `keypress`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 3 > (property) type>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 3>)
type ComputerActionMove struct{…}
A mouse move action.
Type Move
Specifies the event type. For a move action, this property is always set to `move`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 4 > (property) type>)
X int64
The x-coordinate to move to.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 4 > (property) x>)
Y int64
The y-coordinate to move to.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 4 > (property) y>)
Keys []stringOptional
The keys being held while moving the mouse.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 4 > (property) keys>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 4>)
type ComputerActionScreenshot struct{…}
A screenshot action.
Type Screenshot
Specifies the event type. For a screenshot action, this property is always set to `screenshot`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 5 > (property) type>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 5>)
type ComputerActionScroll struct{…}
A scroll action.
ScrollX int64
The horizontal scroll distance.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 6 > (property) scroll_x>)
ScrollY int64
The vertical scroll distance.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 6 > (property) scroll_y>)
Type Scroll
Specifies the event type. For a scroll action, this property is always set to `scroll`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 6 > (property) type>)
X int64
The x-coordinate where the scroll occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 6 > (property) x>)
Y int64
The y-coordinate where the scroll occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 6 > (property) y>)
Keys []stringOptional
The keys being held while scrolling.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 6 > (property) keys>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 6>)
type ComputerActionType struct{…}
An action to type in text.
Text string
The text to type.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 7 > (property) text>)
Type Type
Specifies the event type. For a type action, this property is always set to `type`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 7 > (property) type>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 7>)
type ComputerActionWait struct{…}
A wait action.
Type Wait
Specifies the event type. For a wait action, this property is always set to `wait`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 8 > (property) type>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 8>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema)>)
type ResponseComputerToolCallOutputItem struct{…}
ID string
The unique ID of the computer call tool output.
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) id>)
CallID string
The ID of the computer tool call that produced the output.
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) call_id>)
Output [ResponseComputerToolCallOutputScreenshot](</api/reference/go/resources/responses#(resource) responses > (model) response_computer_tool_call_output_screenshot > (schema)>)
A computer screenshot image used with the computer use tool.
Type ComputerScreenshot
Specifies the event type. For a computer screenshot, this property is
always set to `computer\_screenshot`.
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) output + (resource) responses > (model) response_computer_tool_call_output_screenshot > (schema) > (property) type>)
FileID stringOptional
The identifier of an uploaded file that contains the screenshot.
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) output + (resource) responses > (model) response_computer_tool_call_output_screenshot > (schema) > (property) file_id>)
ImageURL stringOptional
The URL of the screenshot image.
formaturi
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) output + (resource) responses > (model) response_computer_tool_call_output_screenshot > (schema) > (property) image_url>)
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) output>)
Status ResponseComputerToolCallOutputItemStatus
The status of the message input. One of `in\_progress`, `completed`, or
`incomplete`. Populated when input items are returned via API.
One of the following:
const ResponseComputerToolCallOutputItemStatusCompleted ResponseComputerToolCallOutputItemStatus = "completed"
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) status > (member) 0>)
const ResponseComputerToolCallOutputItemStatusIncomplete ResponseComputerToolCallOutputItemStatus = "incomplete"
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) status > (member) 1>)
const ResponseComputerToolCallOutputItemStatusFailed ResponseComputerToolCallOutputItemStatus = "failed"
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) status > (member) 2>)
const ResponseComputerToolCallOutputItemStatusInProgress ResponseComputerToolCallOutputItemStatus = "in\_progress"
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) status > (member) 3>)
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) status>)
Type ComputerCallOutput
The type of the computer tool call output. Always `computer\_call\_output`.
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) type>)
AcknowledgedSafetyChecks []ResponseComputerToolCallOutputItemAcknowledgedSafetyCheckOptional
The safety checks reported by the API that have been acknowledged by the
developer.
ID string
The ID of the pending safety check.
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) acknowledged_safety_checks > (items) > (property) id>)
Code stringOptional
The type of the pending safety check.
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) acknowledged_safety_checks > (items) > (property) code>)
Message stringOptional
Details about the pending safety check.
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) acknowledged_safety_checks > (items) > (property) message>)
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) acknowledged_safety_checks>)
CreatedBy stringOptional
The identifier of the actor that created the item.
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) created_by>)
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema)>)
type ResponseToolSearchCall struct{…}
ID string
The unique ID of the tool search call item.
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) id>)
Arguments any
Arguments used for the tool search call.
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) arguments>)
CallID string
The unique ID of the tool search call generated by the model.
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) call_id>)
Execution ResponseToolSearchCallExecution
Whether tool search was executed by the server or by the client.
One of the following:
const ResponseToolSearchCallExecutionServer ResponseToolSearchCallExecution = "server"
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) execution > (member) 0>)
const ResponseToolSearchCallExecutionClient ResponseToolSearchCallExecution = "client"
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) execution > (member) 1>)
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) execution>)
Status ResponseToolSearchCallStatus
The status of the tool search call item that was recorded.
One of the following:
const ResponseToolSearchCallStatusInProgress ResponseToolSearchCallStatus = "in\_progress"
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) status > (member) 0>)
const ResponseToolSearchCallStatusCompleted ResponseToolSearchCallStatus = "completed"
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) status > (member) 1>)
const ResponseToolSearchCallStatusIncomplete ResponseToolSearchCallStatus = "incomplete"
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) status>)
Type ToolSearchCall
The type of the item. Always `tool\_search\_call`.
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) type>)
CreatedBy stringOptional
The identifier of the actor that created the item.
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) created_by>)
[](<#(resource) responses > (model) response_tool_search_call > (schema)>)
type ResponseToolSearchOutputItem struct{…}
ID string
The unique ID of the tool search output item.
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) id>)
CallID string
The unique ID of the tool search call generated by the model.
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) call_id>)
Execution ResponseToolSearchOutputItemExecution
Whether tool search was executed by the server or by the client.
One of the following:
const ResponseToolSearchOutputItemExecutionServer ResponseToolSearchOutputItemExecution = "server"
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) execution > (member) 0>)
const ResponseToolSearchOutputItemExecutionClient ResponseToolSearchOutputItemExecution = "client"
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) execution > (member) 1>)
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) execution>)
Status ResponseToolSearchOutputItemStatus
The status of the tool search output item that was recorded.
One of the following:
const ResponseToolSearchOutputItemStatusInProgress ResponseToolSearchOutputItemStatus = "in\_progress"
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) status > (member) 0>)
const ResponseToolSearchOutputItemStatusCompleted ResponseToolSearchOutputItemStatus = "completed"
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) status > (member) 1>)
const ResponseToolSearchOutputItemStatusIncomplete ResponseToolSearchOutputItemStatus = "incomplete"
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) status>)
Tools [][ToolUnion](</api/reference/go/resources/responses#(resource) responses > (model) tool > (schema)>)
The loaded tool definitions returned by tool search.
One of the following:
type FunctionTool struct{…}
Defines a function in your own code the model can choose to call. Learn more about [function calling](https://platform.openai.com/docs/guides/function-calling).
Name string
The name of the function to call.
[](<#(resource) responses > (model) function_tool > (schema) > (property) name>)
Parameters map[string, any]
A JSON schema object describing the parameters of the function.
[](<#(resource) responses > (model) function_tool > (schema) > (property) parameters>)
Strict bool
Whether to enforce strict parameter validation. Default `true`.
[](<#(resource) responses > (model) function_tool > (schema) > (property) strict>)
Type Function
The type of the function tool. Always `function`.
[](<#(resource) responses > (model) function_tool > (schema) > (property) type>)
DeferLoading boolOptional
Whether this function is deferred and loaded via tool search.
[](<#(resource) responses > (model) function_tool > (schema) > (property) defer_loading>)
Description stringOptional
A description of the function. Used by the model to determine whether or not to call the function.
[](<#(resource) responses > (model) function_tool > (schema) > (property) description>)
[](<#(resource) responses > (model) function_tool > (schema)>)
type FileSearchTool struct{…}
A tool that searches for relevant content from uploaded files. Learn more about the [file search tool](https://platform.openai.com/docs/guides/tools-file-search).
Type FileSearch
The type of the file search tool. Always `file\_search`.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) type>)
VectorStoreIDs []string
The IDs of the vector stores to search.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) vector_store_ids>)
Filters FileSearchToolFiltersUnionOptional
A filter to apply.
One of the following:
type ComparisonFilter struct{…}
A filter used to compare a specified attribute key to a given value using a defined comparison operation.
Key string
The key to compare against the value.
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) key>)
Type ComparisonFilterType
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
const ComparisonFilterTypeEq ComparisonFilterType = "eq"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 0>)
const ComparisonFilterTypeNe ComparisonFilterType = "ne"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 1>)
const ComparisonFilterTypeGt ComparisonFilterType = "gt"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 2>)
const ComparisonFilterTypeGte ComparisonFilterType = "gte"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 3>)
const ComparisonFilterTypeLt ComparisonFilterType = "lt"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 4>)
const ComparisonFilterTypeLte ComparisonFilterType = "lte"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 5>)
const ComparisonFilterTypeIn ComparisonFilterType = "in"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 6>)
const ComparisonFilterTypeNin ComparisonFilterType = "nin"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 7>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type>)
Value ComparisonFilterValueUnion
The value to compare against the attribute key; supports string, number, or boolean types.
One of the following:
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 0>)
float64
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 1>)
bool
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 2>)
type ComparisonFilterValueArray []ComparisonFilterValueArrayItemUnion
One of the following:
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 0>)
float64
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 1>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value>)
[](<#(resource) $shared > (model) comparison_filter > (schema)>)
type CompoundFilter struct{…}
Combine multiple filters using `and` or `or`.
Filters [][ComparisonFilter](</api/reference/go/resources/$shared#(resource) $shared > (model) comparison_filter > (schema)>)
Array of filters to combine. Items can be `ComparisonFilter` or `CompoundFilter`.
One of the following:
type ComparisonFilter struct{…}
A filter used to compare a specified attribute key to a given value using a defined comparison operation.
Key string
The key to compare against the value.
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) key>)
Type ComparisonFilterType
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
const ComparisonFilterTypeEq ComparisonFilterType = "eq"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 0>)
const ComparisonFilterTypeNe ComparisonFilterType = "ne"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 1>)
const ComparisonFilterTypeGt ComparisonFilterType = "gt"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 2>)
const ComparisonFilterTypeGte ComparisonFilterType = "gte"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 3>)
const ComparisonFilterTypeLt ComparisonFilterType = "lt"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 4>)
const ComparisonFilterTypeLte ComparisonFilterType = "lte"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 5>)
const ComparisonFilterTypeIn ComparisonFilterType = "in"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 6>)
const ComparisonFilterTypeNin ComparisonFilterType = "nin"
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 7>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type>)
Value ComparisonFilterValueUnion
The value to compare against the attribute key; supports string, number, or boolean types.
One of the following:
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 0>)
float64
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 1>)
bool
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 2>)
type ComparisonFilterValueArray []ComparisonFilterValueArrayItemUnion
One of the following:
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 0>)
float64
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 1>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value>)
[](<#(resource) $shared > (model) comparison_filter > (schema)>)
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) filters>)
Type CompoundFilterType
Type of operation: `and` or `or`.
One of the following:
const CompoundFilterTypeAnd CompoundFilterType = "and"
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type > (member) 0>)
const CompoundFilterTypeOr CompoundFilterType = "or"
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type > (member) 1>)
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type>)
[](<#(resource) $shared > (model) compound_filter > (schema)>)
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) filters>)
MaxNumResults int64Optional
The maximum number of results to return. This number should be between 1 and 50 inclusive.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) max_num_results>)
RankingOptions FileSearchToolRankingOptionsOptional
Ranking options for search.
HybridSearch FileSearchToolRankingOptionsHybridSearchOptional
Weights that control how reciprocal rank fusion balances semantic embedding matches versus sparse keyword matches when hybrid search is enabled.
EmbeddingWeight float64
The weight of the embedding in the reciprocal ranking fusion.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) hybrid_search > (property) embedding_weight>)
TextWeight float64
The weight of the text in the reciprocal ranking fusion.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) hybrid_search > (property) text_weight>)
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) hybrid_search>)
Ranker stringOptional
The ranker to use for the file search.
One of the following:
const FileSearchToolRankingOptionsRankerAuto FileSearchToolRankingOptionsRanker = "auto"
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) ranker > (member) 0>)
const FileSearchToolRankingOptionsRankerDefault2024\_11\_15 FileSearchToolRankingOptionsRanker = "default-2024-11-15"
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) ranker>)
ScoreThreshold float64Optional
The score threshold for the file search, a number between 0 and 1. Numbers closer to 1 will attempt to return only the most relevant results, but may return fewer results.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) score_threshold>)
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options>)
[](<#(resource) responses > (model) file_search_tool > (schema)>)
type ComputerTool struct{…}
A tool that controls a virtual computer. Learn more about the [computer tool](https://platform.openai.com/docs/guides/tools-computer-use).
Type Computer
The type of the computer tool. Always `computer`.
[](<#(resource) responses > (model) computer_tool > (schema) > (property) type>)
[](<#(resource) responses > (model) computer_tool > (schema)>)
type ComputerUsePreviewTool struct{…}
A tool that controls a virtual computer. Learn more about the [computer tool](https://platform.openai.com/docs/guides/tools-computer-use).
DisplayHeight int64
The height of the computer display.
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) display_height>)
DisplayWidth int64
The width of the computer display.
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) display_width>)
Environment ComputerUsePreviewToolEnvironment
The type of computer environment to control.
One of the following:
const ComputerUsePreviewToolEnvironmentWindows ComputerUsePreviewToolEnvironment = "windows"
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment > (member) 0>)
const ComputerUsePreviewToolEnvironmentMac ComputerUsePreviewToolEnvironment = "mac"
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment > (member) 1>)
const ComputerUsePreviewToolEnvironmentLinux ComputerUsePreviewToolEnvironment = "linux"
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment > (member) 2>)
const ComputerUsePreviewToolEnvironmentUbuntu ComputerUsePreviewToolEnvironment = "ubuntu"
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment > (member) 3>)
const ComputerUsePreviewToolEnvironmentBrowser ComputerUsePreviewToolEnvironment = "browser"
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment > (member) 4>)
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment>)
Type ComputerUsePreview
The type of the computer use tool. Always `computer\_use\_preview`.
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) type>)
[](<#(resource) responses > (model) computer_use_preview_tool > (schema)>)
type WebSearchTool struct{…}
Search the Internet for sources related to the prompt. Learn more about the
[web search tool](https://platform.openai.com/docs/guides/tools-web-search).
Type WebSearchToolType
The type of the web search tool. One of `web\_search` or `web\_search\_2025\_08\_26`.
One of the following:
const WebSearchToolTypeWebSearch WebSearchToolType = "web\_search"
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) type > (member) 0>)
const WebSearchToolTypeWebSearch2025\_08\_26 WebSearchToolType = "web\_search\_2025\_08\_26"
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) type > (member) 1>)
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) type>)
Filters WebSearchToolFiltersOptional
Filters for the search.
AllowedDomains []stringOptional
Allowed domains for the search. If not provided, all domains are allowed.
Subdomains of the provided domains are allowed as well.
Example: `["pubmed.ncbi.nlm.nih.gov"]`
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) filters > (property) allowed_domains>)
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) filters>)
SearchContextSize WebSearchToolSearchContextSizeOptional
High level guidance for the amount of context window space to use for the search. One of `low`, `medium`, or `high`. `medium` is the default.
One of the following:
const WebSearchToolSearchContextSizeLow WebSearchToolSearchContextSize = "low"
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) search_context_size > (member) 0>)
const WebSearchToolSearchContextSizeMedium WebSearchToolSearchContextSize = "medium"
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) search_context_size > (member) 1>)
const WebSearchToolSearchContextSizeHigh WebSearchToolSearchContextSize = "high"
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) search_context_size > (member) 2>)
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) search_context_size>)
UserLocation WebSearchToolUserLocationOptional
The approximate location of the user.
City stringOptional
Free text input for the city of the user, e.g. `San Francisco`.
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location > (property) city>)
Country stringOptional
The two-letter [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1) of the user, e.g. `US`.
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location > (property) country>)
Region stringOptional
Free text input for the region of the user, e.g. `California`.
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location > (property) region>)
Timezone stringOptional
The [IANA timezone](https://timeapi.io/documentation/iana-timezones) of the user, e.g. `America/Los\_Angeles`.
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location > (property) timezone>)
Type stringOptional
The type of location approximation. Always `approximate`.
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location > (property) type>)
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location>)
[](<#(resource) responses > (model) web_search_tool > (schema)>)
type ToolMcp struct{…}
Give the model access to additional tools via remote Model Context Protocol
(MCP) servers. [Learn more about MCP](https://platform.openai.com/docs/guides/tools-remote-mcp).
ServerLabel string
A label for this MCP server, used to identify it in tool calls.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) server_label>)
Type Mcp
The type of the MCP tool. Always `mcp`.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) type>)
AllowedTools ToolMcpAllowedToolsUnionOptional
List of allowed tool names or a filter object.
One of the following:
type ToolMcpAllowedToolsMcpAllowedTools []string
A string array of allowed tool names
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) allowed_tools > (variant) 0>)
type ToolMcpAllowedToolsMcpToolFilter struct{…}
A filter object to specify which tools are allowed.
ReadOnly boolOptional
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) allowed_tools > (variant) 1 > (property) read_only>)
ToolNames []stringOptional
List of allowed tool names.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) allowed_tools > (variant) 1 > (property) tool_names>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) allowed_tools > (variant) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) allowed_tools>)
Authorization stringOptional
An OAuth access token that can be used with a remote MCP server, either
with a custom MCP server URL or a service connector. Your application
must handle the OAuth authorization flow and provide the token here.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) authorization>)
ConnectorID stringOptional
Identifier for service connectors, like those available in ChatGPT. One of
`server\_url` or `connector\_id` must be provided. Learn more about service
connectors [here](https://platform.openai.com/docs/guides/tools-remote-mcp#connectors).
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
const ToolMcpConnectorIDConnectorDropbox ToolMcpConnectorID = "connector\_dropbox"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 0>)
const ToolMcpConnectorIDConnectorGmail ToolMcpConnectorID = "connector\_gmail"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 1>)
const ToolMcpConnectorIDConnectorGooglecalendar ToolMcpConnectorID = "connector\_googlecalendar"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 2>)
const ToolMcpConnectorIDConnectorGoogledrive ToolMcpConnectorID = "connector\_googledrive"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 3>)
const ToolMcpConnectorIDConnectorMicrosoftteams ToolMcpConnectorID = "connector\_microsoftteams"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 4>)
const ToolMcpConnectorIDConnectorOutlookcalendar ToolMcpConnectorID = "connector\_outlookcalendar"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 5>)
const ToolMcpConnectorIDConnectorOutlookemail ToolMcpConnectorID = "connector\_outlookemail"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 6>)
const ToolMcpConnectorIDConnectorSharepoint ToolMcpConnectorID = "connector\_sharepoint"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 7>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id>)
DeferLoading boolOptional
Whether this MCP tool is deferred and discovered via tool search.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) defer_loading>)
Headers map[string, string]Optional
Optional HTTP headers to send to the MCP server. Use for authentication
or other purposes.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) headers>)
RequireApproval ToolMcpRequireApprovalUnionOptional
Specify which of the MCP server’s tools require approval.
One of the following:
type ToolMcpRequireApprovalMcpToolApprovalFilter struct{…}
Specify which of the MCP server’s tools require approval. Can be
`always`, `never`, or a filter object associated with tools
that require approval.
Always ToolMcpRequireApprovalMcpToolApprovalFilterAlwaysOptional
A filter object to specify which tools are allowed.
ReadOnly boolOptional
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) always > (property) read_only>)
ToolNames []stringOptional
List of allowed tool names.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) always > (property) tool_names>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) always>)
Never ToolMcpRequireApprovalMcpToolApprovalFilterNeverOptional
A filter object to specify which tools are allowed.
ReadOnly boolOptional
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) never > (property) read_only>)
ToolNames []stringOptional
List of allowed tool names.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) never > (property) tool_names>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) never>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0>)
type ToolMcpRequireApprovalMcpToolApprovalSetting string
Specify a single approval policy for all tools. One of `always` or
`never`. When set to `always`, all tools will require approval. When
set to `never`, all tools will not require approval.
One of the following:
const ToolMcpRequireApprovalMcpToolApprovalSettingAlways ToolMcpRequireApprovalMcpToolApprovalSetting = "always"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 1 > (member) 0>)
const ToolMcpRequireApprovalMcpToolApprovalSettingNever ToolMcpRequireApprovalMcpToolApprovalSetting = "never"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 1 > (member) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval>)
ServerDescription stringOptional
Optional description of the MCP server, used to provide more context.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) server_description>)
ServerURL stringOptional
The URL for the MCP server. One of `server\_url` or `connector\_id` must be
provided.
formaturi
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) server_url>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5>)
type ToolCodeInterpreter struct{…}
A tool that runs Python code to help generate a response to a prompt.
Container ToolCodeInterpreterContainerUnion
The code interpreter container. Can be a container ID or an object that
specifies uploaded file IDs to make available to your code, along with an
optional `memory\_limit` setting.
One of the following:
string
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 0>)
type ToolCodeInterpreterContainerCodeInterpreterContainerAuto struct{…}
Configuration for a code interpreter container. Optionally specify the IDs of the files to run the code on.
Type Auto
Always `auto`.
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) type>)
FileIDs []stringOptional
An optional list of uploaded files to make available to your code.
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) file_ids>)
MemoryLimit stringOptional
The memory limit for the code interpreter container.
One of the following:
const ToolCodeInterpreterContainerCodeInterpreterToolAutoMemoryLimit1g ToolCodeInterpreterContainerCodeInterpreterToolAutoMemoryLimit = "1g"
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 0>)
const ToolCodeInterpreterContainerCodeInterpreterToolAutoMemoryLimit4g ToolCodeInterpreterContainerCodeInterpreterToolAutoMemoryLimit = "4g"
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 1>)
const ToolCodeInterpreterContainerCodeInterpreterToolAutoMemoryLimit16g ToolCodeInterpreterContainerCodeInterpreterToolAutoMemoryLimit = "16g"
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 2>)
const ToolCodeInterpreterContainerCodeInterpreterToolAutoMemoryLimit64g ToolCodeInterpreterContainerCodeInterpreterToolAutoMemoryLimit = "64g"
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 3>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit>)
NetworkPolicy ToolCodeInterpreterContainerCodeInterpreterToolAutoNetworkPolicyUnionOptional
Network access policy for the container.
One of the following:
type ContainerNetworkPolicyDisabled struct{…}
Type Disabled
Disable outbound network access. Always `disabled`.
[](<#(resource) responses > (model) container_network_policy_disabled > (schema) > (property) type>)
[](<#(resource) responses > (model) container_network_policy_disabled > (schema)>)
type ContainerNetworkPolicyAllowlist struct{…}
AllowedDomains []string
A list of allowed domains when type is `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) allowed_domains>)
Type Allowlist
Allow outbound network access only to specified domains. Always `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) type>)
DomainSecrets [][ContainerNetworkPolicyDomainSecret](</api/reference/go/resources/responses#(resource) responses > (model) container_network_policy_domain_secret > (schema)>)Optional
Optional domain-scoped secrets for allowlisted domains.
Domain string
The domain associated with the secret.
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) domain>)
Name string
The name of the secret to inject for the domain.
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) name>)
Value string
The secret value to inject for the domain.
maxLength10485760
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) value>)
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) domain_secrets>)
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema)>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) network_policy>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container>)
Type CodeInterpreter
The type of the code interpreter tool. Always `code\_interpreter`.
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) type>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 6>)
type ToolImageGeneration struct{…}
A tool that generates images using the GPT image models.
Type ImageGeneration
The type of the image generation tool. Always `image\_generation`.
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) type>)
Action stringOptional
Whether to generate a new image or edit an existing image. Default: `auto`.
One of the following:
const ToolImageGenerationActionGenerate ToolImageGenerationAction = "generate"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) action > (member) 0>)
const ToolImageGenerationActionEdit ToolImageGenerationAction = "edit"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) action > (member) 1>)
const ToolImageGenerationActionAuto ToolImageGenerationAction = "auto"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) action > (member) 2>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) action>)
Background stringOptional
Background type for the generated image. One of `transparent`,
`opaque`, or `auto`. Default: `auto`.
One of the following:
const ToolImageGenerationBackgroundTransparent ToolImageGenerationBackground = "transparent"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) background > (member) 0>)
const ToolImageGenerationBackgroundOpaque ToolImageGenerationBackground = "opaque"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) background > (member) 1>)
const ToolImageGenerationBackgroundAuto ToolImageGenerationBackground = "auto"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) background > (member) 2>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) background>)
InputFidelity stringOptional
Control how much effort the model will exert to match the style and features, especially facial features, of input images. This parameter is only supported for `gpt-image-1` and `gpt-image-1.5` and later models, unsupported for `gpt-image-1-mini`. Supports `high` and `low`. Defaults to `low`.
One of the following:
const ToolImageGenerationInputFidelityHigh ToolImageGenerationInputFidelity = "high"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_fidelity > (member) 0>)
const ToolImageGenerationInputFidelityLow ToolImageGenerationInputFidelity = "low"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_fidelity > (member) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_fidelity>)
InputImageMask ToolImageGenerationInputImageMaskOptional
Optional mask for inpainting. Contains `image\_url`
(string, optional) and `file\_id` (string, optional).
FileID stringOptional
File ID for the mask image.
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_image_mask > (property) file_id>)
ImageURL stringOptional
Base64-encoded mask image.
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_image_mask > (property) image_url>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_image_mask>)
Model stringOptional
The image generation model to use. Default: `gpt-image-1`.
One of the following:
string
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) model > (variant) 0>)
string
One of the following:
const ToolImageGenerationModelGPTImage1 ToolImageGenerationModel = "gpt-image-1"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) model > (variant) 1 > (member) 0>)
const ToolImageGenerationModelGPTImage1Mini ToolImageGenerationModel = "gpt-image-1-mini"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) model > (variant) 1 > (member) 1>)
const ToolImageGenerationModelGPTImage1\_5 ToolImageGenerationModel = "gpt-image-1.5"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) model > (variant) 1 > (member) 2>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) model > (variant) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) model>)
Moderation stringOptional
Moderation level for the generated image. Default: `auto`.
One of the following:
const ToolImageGenerationModerationAuto ToolImageGenerationModeration = "auto"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) moderation > (member) 0>)
const ToolImageGenerationModerationLow ToolImageGenerationModeration = "low"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) moderation > (member) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) moderation>)
OutputCompression int64Optional
Compression level for the output image. Default: 100.
minimum0
maximum100
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) output_compression>)
OutputFormat stringOptional
The output format of the generated image. One of `png`, `webp`, or
`jpeg`. Default: `png`.
One of the following:
const ToolImageGenerationOutputFormatPNG ToolImageGenerationOutputFormat = "png"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) output_format > (member) 0>)
const ToolImageGenerationOutputFormatWebP ToolImageGenerationOutputFormat = "webp"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) output_format > (member) 1>)
const ToolImageGenerationOutputFormatJPEG ToolImageGenerationOutputFormat = "jpeg"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) output_format > (member) 2>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) output_format>)
PartialImages int64Optional
Number of partial images to generate in streaming mode, from 0 (default value) to 3.
minimum0
maximum3
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) partial_images>)
Quality stringOptional
The quality of the generated image. One of `low`, `medium`, `high`,
or `auto`. Default: `auto`.
One of the following:
const ToolImageGenerationQualityLow ToolImageGenerationQuality = "low"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) quality > (member) 0>)
const ToolImageGenerationQualityMedium ToolImageGenerationQuality = "medium"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) quality > (member) 1>)
const ToolImageGenerationQualityHigh ToolImageGenerationQuality = "high"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) quality > (member) 2>)
const ToolImageGenerationQualityAuto ToolImageGenerationQuality = "auto"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) quality > (member) 3>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) quality>)
Size stringOptional
The size of the generated image. One of `1024x1024`, `1024x1536`,
`1536x1024`, or `auto`. Default: `auto`.
One of the following:
const ToolImageGenerationSize1024x1024 ToolImageGenerationSize = "1024x1024"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) size > (member) 0>)
const ToolImageGenerationSize1024x1536 ToolImageGenerationSize = "1024x1536"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) size > (member) 1>)
const ToolImageGenerationSize1536x1024 ToolImageGenerationSize = "1536x1024"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) size > (member) 2>)
const ToolImageGenerationSizeAuto ToolImageGenerationSize = "auto"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) size > (member) 3>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) size>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7>)
type ToolLocalShell struct{…}
A tool that allows the model to execute shell commands in a local environment.
Type LocalShell
The type of the local shell tool. Always `local\_shell`.
[](<#(resource) responses > (model) tool > (schema) > (variant) 8 > (property) type>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 8>)
type FunctionShellTool struct{…}
A tool that allows the model to execute shell commands.
Type Shell
The type of the shell tool. Always `shell`.
[](<#(resource) responses > (model) function_shell_tool > (schema) > (property) type>)
Environment FunctionShellToolEnvironmentUnionOptional
One of the following:
type ContainerAuto struct{…}
Type ContainerAuto
Automatically creates a container for this request
[](<#(resource) responses > (model) container_auto > (schema) > (property) type>)
FileIDs []stringOptional
An optional list of uploaded files to make available to your code.
[](<#(resource) responses > (model) container_auto > (schema) > (property) file_ids>)
MemoryLimit ContainerAutoMemoryLimitOptional
The memory limit for the container.
One of the following:
const ContainerAutoMemoryLimit1g ContainerAutoMemoryLimit = "1g"
[](<#(resource) responses > (model) container_auto > (schema) > (property) memory_limit > (member) 0>)
const ContainerAutoMemoryLimit4g ContainerAutoMemoryLimit = "4g"
[](<#(resource) responses > (model) container_auto > (schema) > (property) memory_limit > (member) 1>)
const ContainerAutoMemoryLimit16g ContainerAutoMemoryLimit = "16g"
[](<#(resource) responses > (model) container_auto > (schema) > (property) memory_limit > (member) 2>)
const ContainerAutoMemoryLimit64g ContainerAutoMemoryLimit = "64g"
[](<#(resource) responses > (model) container_auto > (schema) > (property) memory_limit > (member) 3>)
[](<#(resource) responses > (model) container_auto > (schema) > (property) memory_limit>)
NetworkPolicy ContainerAutoNetworkPolicyUnionOptional
Network access policy for the container.
One of the following:
type ContainerNetworkPolicyDisabled struct{…}
Type Disabled
Disable outbound network access. Always `disabled`.
[](<#(resource) responses > (model) container_network_policy_disabled > (schema) > (property) type>)
[](<#(resource) responses > (model) container_network_policy_disabled > (schema)>)
type ContainerNetworkPolicyAllowlist struct{…}
AllowedDomains []string
A list of allowed domains when type is `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) allowed_domains>)
Type Allowlist
Allow outbound network access only to specified domains. Always `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) type>)
DomainSecrets [][ContainerNetworkPolicyDomainSecret](</api/reference/go/resources/responses#(resource) responses > (model) container_network_policy_domain_secret > (schema)>)Optional
Optional domain-scoped secrets for allowlisted domains.
Domain string
The domain associated with the secret.
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) domain>)
Name string
The name of the secret to inject for the domain.
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) name>)
Value string
The secret value to inject for the domain.
maxLength10485760
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) value>)
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) domain_secrets>)
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema)>)
[](<#(resource) responses > (model) container_auto > (schema) > (property) network_policy>)
Skills []ContainerAutoSkillUnionOptional
An optional list of skills referenced by id or inline data.
One of the following:
type SkillReference struct{…}
SkillID string
The ID of the referenced skill.
maxLength64
minLength1
[](<#(resource) responses > (model) skill_reference > (schema) > (property) skill_id>)
Type SkillReference
References a skill created with the /v1/skills endpoint.
[](<#(resource) responses > (model) skill_reference > (schema) > (property) type>)
Version stringOptional
Optional skill version. Use a positive integer or ‘latest’. Omit for default.
[](<#(resource) responses > (model) skill_reference > (schema) > (property) version>)
[](<#(resource) responses > (model) skill_reference > (schema)>)
type InlineSkill struct{…}
Description string
The description of the skill.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) description>)
Name string
The name of the skill.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) name>)
Source [InlineSkillSource](</api/reference/go/resources/responses#(resource) responses > (model) inline_skill_source > (schema)>)
Inline skill payload
Data string
Base64-encoded skill zip bundle.
maxLength70254592
minLength1
[](<#(resource) responses > (model) inline_skill > (schema) > (property) source + (resource) responses > (model) inline_skill_source > (schema) > (property) data>)
MediaType ApplicationZip
The media type of the inline skill payload. Must be `application/zip`.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) source + (resource) responses > (model) inline_skill_source > (schema) > (property) media_type>)
Type Base64
The type of the inline skill source. Must be `base64`.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) source + (resource) responses > (model) inline_skill_source > (schema) > (property) type>)
[](<#(resource) responses > (model) inline_skill > (schema) > (property) source>)
Type Inline
Defines an inline skill for this request.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) type>)
[](<#(resource) responses > (model) inline_skill > (schema)>)
[](<#(resource) responses > (model) container_auto > (schema) > (property) skills>)
[](<#(resource) responses > (model) container_auto > (schema)>)
type LocalEnvironment struct{…}
Type Local
Use a local computer environment.
[](<#(resource) responses > (model) local_environment > (schema) > (property) type>)
Skills [][LocalSkill](</api/reference/go/resources/responses#(resource) responses > (model) local_skill > (schema)>)Optional
An optional list of skills.
Description string
The description of the skill.
[](<#(resource) responses > (model) local_skill > (schema) > (property) description>)
Name string
The name of the skill.
[](<#(resource) responses > (model) local_skill > (schema) > (property) name>)
Path string
The path to the directory containing the skill.
[](<#(resource) responses > (model) local_skill > (schema) > (property) path>)
[](<#(resource) responses > (model) local_environment > (schema) > (property) skills>)
[](<#(resource) responses > (model) local_environment > (schema)>)
type ContainerReference struct{…}
ContainerID string
The ID of the referenced container.
[](<#(resource) responses > (model) container_reference > (schema) > (property) container_id>)
Type ContainerReference
References a container created with the /v1/containers endpoint
[](<#(resource) responses > (model) container_reference > (schema) > (property) type>)
[](<#(resource) responses > (model) container_reference > (schema)>)
[](<#(resource) responses > (model) function_shell_tool > (schema) > (property) environment>)
[](<#(resource) responses > (model) function_shell_tool > (schema)>)
type CustomTool struct{…}
A custom tool that processes input using a specified format. Learn more about [custom tools](https://platform.openai.com/docs/guides/function-calling#custom-tools)
Name string
The name of the custom tool, used to identify it in tool calls.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) name>)
Type Custom
The type of the custom tool. Always `custom`.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) type>)
DeferLoading boolOptional
Whether this tool should be deferred and discovered via tool search.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) defer_loading>)
Description stringOptional
Optional description of the custom tool, used to provide more context.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) description>)
Format [CustomToolInputFormatUnion](</api/reference/go/resources/$shared#(resource) $shared > (model) custom_tool_input_format > (schema)>)Optional
The input format for the custom tool. Default is unconstrained text.
One of the following:
type CustomToolInputFormatText struct{…}
Unconstrained free-form text.
Type Text
Unconstrained text format. Always `text`.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 0 > (property) type>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 0>)
type CustomToolInputFormatGrammar struct{…}
A grammar defined by the user.
Definition string
The grammar definition.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) definition>)
Syntax string
The syntax of the grammar definition. One of `lark` or `regex`.
One of the following:
const CustomToolInputFormatGrammarSyntaxLark CustomToolInputFormatGrammarSyntax = "lark"
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax > (member) 0>)
const CustomToolInputFormatGrammarSyntaxRegex CustomToolInputFormatGrammarSyntax = "regex"
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax > (member) 1>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax>)
Type Grammar
Grammar format. Always `grammar`.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) type>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format>)
[](<#(resource) responses > (model) custom_tool > (schema)>)
type NamespaceTool struct{…}
Groups function/custom tools under a shared namespace.
Description string
A description of the namespace shown to the model.
minLength1
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) description>)
Name string
The namespace name used in tool calls (for example, `crm`).
minLength1
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) name>)
Tools []NamespaceToolToolUnion
The function/custom tools available inside this namespace.
One of the following:
type NamespaceToolToolFunction struct{…}
Name string
maxLength128
minLength1
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) name>)
Type Function
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) type>)
DeferLoading boolOptional
Whether this function should be deferred and discovered via tool search.
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) defer_loading>)
Description stringOptional
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) description>)
Parameters anyOptional
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) parameters>)
Strict boolOptional
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) strict>)
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0>)
type CustomTool struct{…}
A custom tool that processes input using a specified format. Learn more about [custom tools](https://platform.openai.com/docs/guides/function-calling#custom-tools)
Name string
The name of the custom tool, used to identify it in tool calls.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) name>)
Type Custom
The type of the custom tool. Always `custom`.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) type>)
DeferLoading boolOptional
Whether this tool should be deferred and discovered via tool search.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) defer_loading>)
Description stringOptional
Optional description of the custom tool, used to provide more context.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) description>)
Format [CustomToolInputFormatUnion](</api/reference/go/resources/$shared#(resource) $shared > (model) custom_tool_input_format > (schema)>)Optional
The input format for the custom tool. Default is unconstrained text.
One of the following:
type CustomToolInputFormatText struct{…}
Unconstrained free-form text.
Type Text
Unconstrained text format. Always `text`.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 0 > (property) type>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 0>)
type CustomToolInputFormatGrammar struct{…}
A grammar defined by the user.
Definition string
The grammar definition.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) definition>)
Syntax string
The syntax of the grammar definition. One of `lark` or `regex`.
One of the following:
const CustomToolInputFormatGrammarSyntaxLark CustomToolInputFormatGrammarSyntax = "lark"
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax > (member) 0>)
const CustomToolInputFormatGrammarSyntaxRegex CustomToolInputFormatGrammarSyntax = "regex"
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax > (member) 1>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax>)
Type Grammar
Grammar format. Always `grammar`.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) type>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format>)
[](<#(resource) responses > (model) custom_tool > (schema)>)
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools>)
Type Namespace
The type of the tool. Always `namespace`.
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) type>)
[](<#(resource) responses > (model) namespace_tool > (schema)>)
type ToolSearchTool struct{…}
Hosted or BYOT tool search configuration for deferred tools.
Type ToolSearch
The type of the tool. Always `tool\_search`.
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) type>)
Description stringOptional
Description shown to the model for a client-executed tool search tool.
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) description>)
Execution ToolSearchToolExecutionOptional
Whether tool search is executed by the server or by the client.
One of the following:
const ToolSearchToolExecutionServer ToolSearchToolExecution = "server"
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) execution > (member) 0>)
const ToolSearchToolExecutionClient ToolSearchToolExecution = "client"
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) execution > (member) 1>)
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) execution>)
Parameters anyOptional
Parameter schema for a client-executed tool search tool.
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) parameters>)
[](<#(resource) responses > (model) tool_search_tool > (schema)>)
type WebSearchPreviewTool struct{…}
This tool searches the web for relevant results to use in a response. Learn more about the [web search tool](https://platform.openai.com/docs/guides/tools-web-search).
Type WebSearchPreviewToolType
The type of the web search tool. One of `web\_search\_preview` or `web\_search\_preview\_2025\_03\_11`.
One of the following:
const WebSearchPreviewToolTypeWebSearchPreview WebSearchPreviewToolType = "web\_search\_preview"
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) type > (member) 0>)
const WebSearchPreviewToolTypeWebSearchPreview2025\_03\_11 WebSearchPreviewToolType = "web\_search\_preview\_2025\_03\_11"
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) type > (member) 1>)
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) type>)
SearchContentTypes []stringOptional
One of the following:
const WebSearchPreviewToolSearchContentTypeText WebSearchPreviewToolSearchContentType = "text"
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_content_types > (items) > (member) 0>)
const WebSearchPreviewToolSearchContentTypeImage WebSearchPreviewToolSearchContentType = "image"
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_content_types > (items) > (member) 1>)
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_content_types>)
SearchContextSize WebSearchPreviewToolSearchContextSizeOptional
High level guidance for the amount of context window space to use for the search. One of `low`, `medium`, or `high`. `medium` is the default.
One of the following:
const WebSearchPreviewToolSearchContextSizeLow WebSearchPreviewToolSearchContextSize = "low"
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_context_size > (member) 0>)
const WebSearchPreviewToolSearchContextSizeMedium WebSearchPreviewToolSearchContextSize = "medium"
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_context_size > (member) 1>)
const WebSearchPreviewToolSearchContextSizeHigh WebSearchPreviewToolSearchContextSize = "high"
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_context_size > (member) 2>)
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_context_size>)
UserLocation WebSearchPreviewToolUserLocationOptional
The user’s location.
Type Approximate
The type of location approximation. Always `approximate`.
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location > (property) type>)
City stringOptional
Free text input for the city of the user, e.g. `San Francisco`.
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location > (property) city>)
Country stringOptional
The two-letter [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1) of the user, e.g. `US`.
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location > (property) country>)
Region stringOptional
Free text input for the region of the user, e.g. `California`.
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location > (property) region>)
Timezone stringOptional
The [IANA timezone](https://timeapi.io/documentation/iana-timezones) of the user, e.g. `America/Los\_Angeles`.
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location > (property) timezone>)
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location>)
[](<#(resource) responses > (model) web_search_preview_tool > (schema)>)
type ApplyPatchTool struct{…}
Allows the assistant to create, delete, or update files using unified diffs.
Type ApplyPatch
The type of the tool. Always `apply\_patch`.
[](<#(resource) responses > (model) apply_patch_tool > (schema) > (property) type>)
[](<#(resource) responses > (model) apply_patch_tool > (schema)>)
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) tools>)
Type ToolSearchOutput
The type of the item. Always `tool\_search\_output`.
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) type>)
CreatedBy stringOptional
The identifier of the actor that created the item.
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) created_by>)
[](<#(resource) responses > (model) response_tool_search_output_item > (schema)>)
type ResponseReasoningItem struct{…}
A description of the chain of thought used by a reasoning model while generating
a response. Be sure to include these items in your `input` to the Responses API
for subsequent turns of a conversation if you are manually
[managing context](https://platform.openai.com/docs/guides/conversation-state).
ID string
The unique identifier of the reasoning content.
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) id>)
Summary []ResponseReasoningItemSummary
Reasoning summary content.
Text string
A summary of the reasoning output from the model so far.
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) summary > (items) > (property) text>)
Type SummaryText
The type of the object. Always `summary\_text`.
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) summary > (items) > (property) type>)
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) summary>)
Type Reasoning
The type of the object. Always `reasoning`.
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) type>)
Content []ResponseReasoningItemContentOptional
Reasoning text content.
Text string
The reasoning text from the model.
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) content > (items) > (property) text>)
Type ReasoningText
The type of the reasoning text. Always `reasoning\_text`.
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) content > (items) > (property) type>)
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) content>)
EncryptedContent stringOptional
The encrypted content of the reasoning item - populated when a response is
generated with `reasoning.encrypted\_content` in the `include` parameter.
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) encrypted_content>)
Status ResponseReasoningItemStatusOptional
The status of the item. One of `in\_progress`, `completed`, or
`incomplete`. Populated when items are returned via API.
One of the following:
const ResponseReasoningItemStatusInProgress ResponseReasoningItemStatus = "in\_progress"
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) status > (member) 0>)
const ResponseReasoningItemStatusCompleted ResponseReasoningItemStatus = "completed"
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) status > (member) 1>)
const ResponseReasoningItemStatusIncomplete ResponseReasoningItemStatus = "incomplete"
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) status>)
[](<#(resource) responses > (model) response_reasoning_item > (schema)>)
type ResponseCompactionItem struct{…}
A compaction item generated by the [`v1/responses/compact` API](https://platform.openai.com/docs/api-reference/responses/compact).
ID string
The unique ID of the compaction item.
[](<#(resource) responses > (model) response_compaction_item > (schema) > (property) id>)
EncryptedContent string
The encrypted content that was produced by compaction.
[](<#(resource) responses > (model) response_compaction_item > (schema) > (property) encrypted_content>)
Type Compaction
The type of the item. Always `compaction`.
[](<#(resource) responses > (model) response_compaction_item > (schema) > (property) type>)
CreatedBy stringOptional
The identifier of the actor that created the item.
[](<#(resource) responses > (model) response_compaction_item > (schema) > (property) created_by>)
[](<#(resource) responses > (model) response_compaction_item > (schema)>)
type ResponseCodeInterpreterToolCall struct{…}
A tool call to run code.
ID string
The unique ID of the code interpreter tool call.
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) id>)
Code string
The code to run, or null if not available.
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) code>)
ContainerID string
The ID of the container used to run the code.
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) container_id>)
Outputs []ResponseCodeInterpreterToolCallOutputUnion
The outputs generated by the code interpreter, such as logs or images.
Can be null if no outputs are available.
One of the following:
type ResponseCodeInterpreterToolCallOutputLogs struct{…}
The logs output from the code interpreter.
Logs string
The logs output from the code interpreter.
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) outputs > (items) > (variant) 0 > (property) logs>)
Type Logs
The type of the output. Always `logs`.
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) outputs > (items) > (variant) 0 > (property) type>)
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) outputs > (items) > (variant) 0>)
type ResponseCodeInterpreterToolCallOutputImage struct{…}
The image output from the code interpreter.
Type Image
The type of the output. Always `image`.
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) outputs > (items) > (variant) 1 > (property) type>)
URL string
The URL of the image output from the code interpreter.
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) outputs > (items) > (variant) 1 > (property) url>)
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) outputs > (items) > (variant) 1>)
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) outputs>)
Status ResponseCodeInterpreterToolCallStatus
The status of the code interpreter tool call. Valid values are `in\_progress`, `completed`, `incomplete`, `interpreting`, and `failed`.
One of the following:
const ResponseCodeInterpreterToolCallStatusInProgress ResponseCodeInterpreterToolCallStatus = "in\_progress"
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) status > (member) 0>)
const ResponseCodeInterpreterToolCallStatusCompleted ResponseCodeInterpreterToolCallStatus = "completed"
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) status > (member) 1>)
const ResponseCodeInterpreterToolCallStatusIncomplete ResponseCodeInterpreterToolCallStatus = "incomplete"
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) status > (member) 2>)
const ResponseCodeInterpreterToolCallStatusInterpreting ResponseCodeInterpreterToolCallStatus = "interpreting"
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) status > (member) 3>)
const ResponseCodeInterpreterToolCallStatusFailed ResponseCodeInterpreterToolCallStatus = "failed"
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) status > (member) 4>)
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) status>)
Type CodeInterpreterCall
The type of the code interpreter tool call. Always `code\_interpreter\_call`.
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) type>)
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema)>)
type ConversationItemLocalShellCall struct{…}
A tool call to run a command on the local shell.
ID string
The unique ID of the local shell call.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) id>)
Action ConversationItemLocalShellCallAction
Execute a shell command on the server.
Command []string
The command to run.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) action > (property) command>)
Env map[string, string]
Environment variables to set for the command.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) action > (property) env>)
Type Exec
The type of the local shell action. Always `exec`.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) action > (property) type>)
TimeoutMs int64Optional
Optional timeout in milliseconds for the command.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) action > (property) timeout_ms>)
User stringOptional
Optional user to run the command as.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) action > (property) user>)
WorkingDirectory stringOptional
Optional working directory to run the command in.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) action > (property) working_directory>)
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) action>)
CallID string
The unique ID of the local shell tool call generated by the model.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) call_id>)
Status string
The status of the local shell call.
One of the following:
const ConversationItemLocalShellCallStatusInProgress ConversationItemLocalShellCallStatus = "in\_progress"
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) status > (member) 0>)
const ConversationItemLocalShellCallStatusCompleted ConversationItemLocalShellCallStatus = "completed"
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) status > (member) 1>)
const ConversationItemLocalShellCallStatusIncomplete ConversationItemLocalShellCallStatus = "incomplete"
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) status > (member) 2>)
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) status>)
Type LocalShellCall
The type of the local shell call. Always `local\_shell\_call`.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) type>)
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13>)
type ConversationItemLocalShellCallOutput struct{…}
The output of a local shell tool call.
ID string
The unique ID of the local shell tool call generated by the model.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 14 > (property) id>)
Output string
A JSON string of the output of the local shell tool call.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 14 > (property) output>)
Type LocalShellCallOutput
The type of the local shell tool call output. Always `local\_shell\_call\_output`.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 14 > (property) type>)
Status stringOptional
The status of the item. One of `in\_progress`, `completed`, or `incomplete`.
One of the following:
const ConversationItemLocalShellCallOutputStatusInProgress ConversationItemLocalShellCallOutputStatus = "in\_progress"
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 14 > (property) status > (member) 0>)
const ConversationItemLocalShellCallOutputStatusCompleted ConversationItemLocalShellCallOutputStatus = "completed"
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 14 > (property) status > (member) 1>)
const ConversationItemLocalShellCallOutputStatusIncomplete ConversationItemLocalShellCallOutputStatus = "incomplete"
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 14 > (property) status > (member) 2>)
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 14 > (property) status>)
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 14>)
type ResponseFunctionShellToolCall struct{…}
A tool call that executes one or more shell commands in a managed environment.
ID string
The unique ID of the shell tool call. Populated when this item is returned via API.
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) id>)
Action ResponseFunctionShellToolCallAction
The shell commands and limits that describe how to run the tool call.
Commands []string
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) action > (property) commands>)
MaxOutputLength int64
Optional maximum number of characters to return from each command.
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) action > (property) max_output_length>)
TimeoutMs int64
Optional timeout in milliseconds for the commands.
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) action > (property) timeout_ms>)
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) action>)
CallID string
The unique ID of the shell tool call generated by the model.
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) call_id>)
Environment ResponseFunctionShellToolCallEnvironmentUnion
Represents the use of a local environment to perform shell actions.
One of the following:
type ResponseLocalEnvironment struct{…}
Represents the use of a local environment to perform shell actions.
Type Local
The environment type. Always `local`.
[](<#(resource) responses > (model) response_local_environment > (schema) > (property) type>)
[](<#(resource) responses > (model) response_local_environment > (schema)>)
type ResponseContainerReference struct{…}
Represents a container created with /v1/containers.
ContainerID string
[](<#(resource) responses > (model) response_container_reference > (schema) > (property) container_id>)
Type ContainerReference
The environment type. Always `container\_reference`.
[](<#(resource) responses > (model) response_container_reference > (schema) > (property) type>)
[](<#(resource) responses > (model) response_container_reference > (schema)>)
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) environment>)
Status ResponseFunctionShellToolCallStatus
The status of the shell call. One of `in\_progress`, `completed`, or `incomplete`.
One of the following:
const ResponseFunctionShellToolCallStatusInProgress ResponseFunctionShellToolCallStatus = "in\_progress"
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) status > (member) 0>)
const ResponseFunctionShellToolCallStatusCompleted ResponseFunctionShellToolCallStatus = "completed"
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) status > (member) 1>)
const ResponseFunctionShellToolCallStatusIncomplete ResponseFunctionShellToolCallStatus = "incomplete"
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) status>)
Type ShellCall
The type of the item. Always `shell\_call`.
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) type>)
CreatedBy stringOptional
The ID of the entity that created this tool call.
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) created_by>)
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema)>)
type ResponseFunctionShellToolCallOutput struct{…}
The output of a shell tool call that was emitted.
ID string
The unique ID of the shell call output. Populated when this item is returned via API.
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) id>)
CallID string
The unique ID of the shell tool call generated by the model.
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) call_id>)
MaxOutputLength int64
The maximum length of the shell command output. This is generated by the model and should be passed back with the raw output.
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) max_output_length>)
Output []ResponseFunctionShellToolCallOutputOutput
An array of shell call output contents
Outcome ResponseFunctionShellToolCallOutputOutputOutcomeUnion
Represents either an exit outcome (with an exit code) or a timeout outcome for a shell call output chunk.
One of the following:
type ResponseFunctionShellToolCallOutputOutputOutcomeTimeout struct{…}
Indicates that the shell call exceeded its configured time limit.
Type Timeout
The outcome type. Always `timeout`.
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) output > (items) > (property) outcome > (variant) 0 > (property) type>)
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) output > (items) > (property) outcome > (variant) 0>)
type ResponseFunctionShellToolCallOutputOutputOutcomeExit struct{…}
Indicates that the shell commands finished and returned an exit code.
ExitCode int64
Exit code from the shell process.
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) output > (items) > (property) outcome > (variant) 1 > (property) exit_code>)
Type Exit
The outcome type. Always `exit`.
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) output > (items) > (property) outcome > (variant) 1 > (property) type>)
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) output > (items) > (property) outcome > (variant) 1>)
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) output > (items) > (property) outcome>)
Stderr string
The standard error output that was captured.
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) output > (items) > (property) stderr>)
Stdout string
The standard output that was captured.
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) output > (items) > (property) stdout>)
CreatedBy stringOptional
The identifier of the actor that created the item.
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) output > (items) > (property) created_by>)
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) output>)
Status ResponseFunctionShellToolCallOutputStatus
The status of the shell call output. One of `in\_progress`, `completed`, or `incomplete`.
One of the following:
const ResponseFunctionShellToolCallOutputStatusInProgress ResponseFunctionShellToolCallOutputStatus = "in\_progress"
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) status > (member) 0>)
const ResponseFunctionShellToolCallOutputStatusCompleted ResponseFunctionShellToolCallOutputStatus = "completed"
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) status > (member) 1>)
const ResponseFunctionShellToolCallOutputStatusIncomplete ResponseFunctionShellToolCallOutputStatus = "incomplete"
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) status>)
Type ShellCallOutput
The type of the shell call output. Always `shell\_call\_output`.
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) type>)
CreatedBy stringOptional
The identifier of the actor that created the item.
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) created_by>)
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema)>)
type ResponseApplyPatchToolCall struct{…}
A tool call that applies file diffs by creating, deleting, or updating files.
ID string
The unique ID of the apply patch tool call. Populated when this item is returned via API.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) id>)
CallID string
The unique ID of the apply patch tool call generated by the model.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) call_id>)
Operation ResponseApplyPatchToolCallOperationUnion
One of the create\_file, delete\_file, or update\_file operations applied via apply\_patch.
One of the following:
type ResponseApplyPatchToolCallOperationCreateFile struct{…}
Instruction describing how to create a file via the apply\_patch tool.
Diff string
Diff to apply.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation > (variant) 0 > (property) diff>)
Path string
Path of the file to create.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation > (variant) 0 > (property) path>)
Type CreateFile
Create a new file with the provided diff.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation > (variant) 0 > (property) type>)
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation > (variant) 0>)
type ResponseApplyPatchToolCallOperationDeleteFile struct{…}
Instruction describing how to delete a file via the apply\_patch tool.
Path string
Path of the file to delete.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation > (variant) 1 > (property) path>)
Type DeleteFile
Delete the specified file.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation > (variant) 1 > (property) type>)
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation > (variant) 1>)
type ResponseApplyPatchToolCallOperationUpdateFile struct{…}
Instruction describing how to update a file via the apply\_patch tool.
Diff string
Diff to apply.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation > (variant) 2 > (property) diff>)
Path string
Path of the file to update.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation > (variant) 2 > (property) path>)
Type UpdateFile
Update an existing file with the provided diff.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation > (variant) 2 > (property) type>)
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation > (variant) 2>)
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation>)
Status ResponseApplyPatchToolCallStatus
The status of the apply patch tool call. One of `in\_progress` or `completed`.
One of the following:
const ResponseApplyPatchToolCallStatusInProgress ResponseApplyPatchToolCallStatus = "in\_progress"
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) status > (member) 0>)
const ResponseApplyPatchToolCallStatusCompleted ResponseApplyPatchToolCallStatus = "completed"
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) status > (member) 1>)
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) status>)
Type ApplyPatchCall
The type of the item. Always `apply\_patch\_call`.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) type>)
CreatedBy stringOptional
The ID of the entity that created this tool call.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) created_by>)
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema)>)
type ResponseApplyPatchToolCallOutput struct{…}
The output emitted by an apply patch tool call.
ID string
The unique ID of the apply patch tool call output. Populated when this item is returned via API.
[](<#(resource) responses > (model) response_apply_patch_tool_call_output > (schema) > (property) id>)
CallID string
The unique ID of the apply patch tool call generated by the model.
[](<#(resource) responses > (model) response_apply_patch_tool_call_output > (schema) > (property) call_id>)
Status ResponseApplyPatchToolCallOutputStatus
The status of the apply patch tool call output. One of `completed` or `failed`.
One of the following:
const ResponseApplyPatchToolCallOutputStatusCompleted ResponseApplyPatchToolCallOutputStatus = "completed"
[](<#(resource) responses > (model) response_apply_patch_tool_call_output > (schema) > (property) status > (member) 0>)
const ResponseApplyPatchToolCallOutputStatusFailed ResponseApplyPatchToolCallOutputStatus = "failed"
[](<#(resource) responses > (model) response_apply_patch_tool_call_output > (schema) > (property) status > (member) 1>)
[](<#(resource) responses > (model) response_apply_patch_tool_call_output > (schema) > (property) status>)
Type ApplyPatchCallOutput
The type of the item. Always `apply\_patch\_call\_output`.
[](<#(resource) responses > (model) response_apply_patch_tool_call_output > (schema) > (property) type>)
CreatedBy stringOptional
The ID of the entity that created this tool call output.
[](<#(resource) responses > (model) response_apply_patch_tool_call_output > (schema) > (property) created_by>)
Output stringOptional
Optional textual output returned by the apply patch tool.
[](<#(resource) responses > (model) response_apply_patch_tool_call_output > (schema) > (property) output>)
[](<#(resource) responses > (model) response_apply_patch_tool_call_output > (schema)>)
type ConversationItemMcpListTools struct{…}
A list of tools available on an MCP server.
ID string
The unique ID of the list.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 19 > (property) id>)
ServerLabel string
The label of the MCP server.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 19 > (property) server_label>)
Tools []ConversationItemMcpListToolsTool
The tools available on the server.
InputSchema any
The JSON schema describing the tool’s input.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 19 > (property) tools > (items) > (property) input_schema>)
Name string
The name of the tool.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 19 > (property) tools > (items) > (property) name>)
Annotations anyOptional
Additional annotations about the tool.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 19 > (property) tools > (items) > (property) annotations>)
Description stringOptional
The description of the tool.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 19 > (property) tools > (items) > (property) description>)
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 19 > (property) tools>)
Type McpListTools
The type of the item. Always `mcp\_list\_tools`.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 19 > (property) type>)
Error stringOptional
Error message if the server could not list tools.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 19 > (property) error>)
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 19>)
type ConversationItemMcpApprovalRequest struct{…}
A request for human approval of a tool invocation.
ID string
The unique ID of the approval request.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 20 > (property) id>)
Arguments string
A JSON string of arguments for the tool.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 20 > (property) arguments>)
Name string
The name of the tool to run.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 20 > (property) name>)
ServerLabel string
The label of the MCP server making the request.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 20 > (property) server_label>)
Type McpApprovalRequest
The type of the item. Always `mcp\_approval\_request`.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 20 > (property) type>)
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 20>)
type ConversationItemMcpApprovalResponse struct{…}
A response to an MCP approval request.
ID string
The unique ID of the approval response
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 21 > (property) id>)
ApprovalRequestID string
The ID of the approval request being answered.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 21 > (property) approval_request_id>)
Approve bool
Whether the request was approved.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 21 > (property) approve>)
Type McpApprovalResponse
The type of the item. Always `mcp\_approval\_response`.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 21 > (property) type>)
Reason stringOptional
Optional reason for the decision.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 21 > (property) reason>)
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 21>)
type ConversationItemMcpCall struct{…}
An invocation of a tool on an MCP server.
ID string
The unique ID of the tool call.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) id>)
Arguments string
A JSON string of the arguments passed to the tool.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) arguments>)
Name string
The name of the tool that was run.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) name>)
ServerLabel string
The label of the MCP server running the tool.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) server_label>)
Type McpCall
The type of the item. Always `mcp\_call`.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) type>)
ApprovalRequestID stringOptional
Unique identifier for the MCP tool call approval request.
Include this value in a subsequent `mcp\_approval\_response` input to approve or reject the corresponding tool call.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) approval_request_id>)
Error stringOptional
The error from the tool call, if any.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) error>)
Output stringOptional
The output from the tool call.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) output>)
Status stringOptional
The status of the tool call. One of `in\_progress`, `completed`, `incomplete`, `calling`, or `failed`.
One of the following:
const ConversationItemMcpCallStatusInProgress ConversationItemMcpCallStatus = "in\_progress"
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) status > (member) 0>)
const ConversationItemMcpCallStatusCompleted ConversationItemMcpCallStatus = "completed"
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) status > (member) 1>)
const ConversationItemMcpCallStatusIncomplete ConversationItemMcpCallStatus = "incomplete"
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) status > (member) 2>)
const ConversationItemMcpCallStatusCalling ConversationItemMcpCallStatus = "calling"
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) status > (member) 3>)
const ConversationItemMcpCallStatusFailed ConversationItemMcpCallStatus = "failed"
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) status > (member) 4>)
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) status>)
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22>)
type ResponseCustomToolCall struct{…}
A call to a custom tool created by the model.
CallID string
An identifier used to map this custom tool call to a tool call output.
[](<#(resource) responses > (model) response_custom_tool_call > (schema) > (property) call_id>)
Input string
The input for the custom tool call generated by the model.
[](<#(resource) responses > (model) response_custom_tool_call > (schema) > (property) input>)
Name string
The name of the custom tool being called.
[](<#(resource) responses > (model) response_custom_tool_call > (schema) > (property) name>)
Type CustomToolCall
The type of the custom tool call. Always `custom\_tool\_call`.
[](<#(resource) responses > (model) response_custom_tool_call > (schema) > (property) type>)
ID stringOptional
The unique ID of the custom tool call in the OpenAI platform.
[](<#(resource) responses > (model) response_custom_tool_call > (schema) > (property) id>)
Namespace stringOptional
The namespace of the custom tool being called.
[](<#(resource) responses > (model) response_custom_tool_call > (schema) > (property) namespace>)
[](<#(resource) responses > (model) response_custom_tool_call > (schema)>)
type ResponseCustomToolCallOutput struct{…}
The output of a custom tool call from your code, being sent back to the model.
CallID string
The call ID, used to map this custom tool call output to a custom tool call.
[](<#(resource) responses > (model) response_custom_tool_call_output > (schema) > (property) call_id>)
Output ResponseCustomToolCallOutputOutputUnion
The output from the custom tool call generated by your code.
Can be a string or an list of output content.
One of the following:
string
[](<#(resource) responses > (model) response_custom_tool_call_output > (schema) > (property) output > (variant) 0>)
type ResponseCustomToolCallOutputOutputOutputContentList []ResponseCustomToolCallOutputOutputOutputContentListItemUnion
Text, image, or file output of the custom tool call.
One of the following:
type ResponseInputText struct{…}
A text input to the model.
Text string
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
Type InputText
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
type ResponseInputImage struct{…}
An image input to the model. Learn about [image inputs](https://platform.openai.com/docs/guides/vision).
Detail ResponseInputImageDetail
The detail level of the image to be sent to the model. One of `high`, `low`, `auto`, or `original`. Defaults to `auto`.
One of the following:
const ResponseInputImageDetailLow ResponseInputImageDetail = "low"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 0>)
const ResponseInputImageDetailHigh ResponseInputImageDetail = "high"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 1>)
const ResponseInputImageDetailAuto ResponseInputImageDetail = "auto"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 2>)
const ResponseInputImageDetailOriginal ResponseInputImageDetail = "original"
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 3>)
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail>)
Type InputImage
The type of the input item. Always `input\_image`.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) type>)
FileID stringOptional
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) file_id>)
ImageURL stringOptional
The URL of the image to be sent to the model. A fully qualified URL or base64 encoded image in a data URL.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) image_url>)
[](<#(resource) responses > (model) response_input_image > (schema)>)
type ResponseInputFile struct{…}
A file input to the model.
Type InputFile
The type of the input item. Always `input\_file`.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) type>)
Detail ResponseInputFileDetailOptional
The detail level of the file to be sent to the model. Use `low` for the default rendering behavior, or `high` to render the file at higher quality. Defaults to `low`.
One of the following:
const ResponseInputFileDetailLow ResponseInputFileDetail = "low"
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 0>)
const ResponseInputFileDetailHigh ResponseInputFileDetail = "high"
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 1>)
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail>)
FileData stringOptional
The content of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_data>)
FileID stringOptional
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_id>)
FileURL stringOptional
The URL of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_url>)
Filename stringOptional
The name of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) filename>)
[](<#(resource) responses > (model) response_input_file > (schema)>)
[](<#(resource) responses > (model) response_custom_tool_call_output > (schema) > (property) output > (variant) 1>)
[](<#(resource) responses > (model) response_custom_tool_call_output > (schema) > (property) output>)
Type CustomToolCallOutput
The type of the custom tool call output. Always `custom\_tool\_call\_output`.
[](<#(resource) responses > (model) response_custom_tool_call_output > (schema) > (property) type>)
ID stringOptional
The unique ID of the custom tool call output in the OpenAI platform.
[](<#(resource) responses > (model) response_custom_tool_call_output > (schema) > (property) id>)
[](<#(resource) responses > (model) response_custom_tool_call_output > (schema)>)
[](<#(resource) conversations.items > (model) conversation_item > (schema)>)
### Retrieve an item
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
"github.com/openai/openai-go/conversations"
"github.com/openai/openai-go/option"
)
func main() {
client := openai.NewClient(
option.WithAPIKey("My API Key"),
)
conversationItem, err := client.Conversations.Items.Get(
context.TODO(),
"conv\_123",
"msg\_abc",
conversations.ItemGetParams{
},
)
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", conversationItem)
}
`
```
```
`{
"type": "message",
"id": "msg\_abc",
"status": "completed",
"role": "user",
"content": [
{"type": "input\_text", "text": "Hello!"}
]
}
`
```
##### Returns Examples
```
`{
"type": "message",
"id": "msg\_abc",
"status": "completed",
"role": "user",
"content": [
{"type": "input\_text", "text": "Hello!"}
]
}
`
```