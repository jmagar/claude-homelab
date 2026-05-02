Retrieve an item | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Conversations](/api/reference/java/resources/conversations)
[Items](/api/reference/java/resources/conversations/subresources/items)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Retrieve an item
[ConversationItem](</api/reference/java/resources/conversations#(resource) conversations.items > (model) conversation_item > (schema)>) conversations().items().retrieve(ItemRetrieveParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/conversations/{conversation\_id}/items/{item\_id}
Get a single item from a conversation with the given IDs.
##### ParametersExpand Collapse
ItemRetrieveParams params
String conversationId
[](<#(resource) conversations.items > (method) retrieve > (params) default > (param) conversation_id > (schema)>)
Optional\<String\> itemId
[](<#(resource) conversations.items > (method) retrieve > (params) default > (param) item_id > (schema)>)
Optional\<List\<[ResponseIncludable](</api/reference/java/resources/responses#(resource) responses > (model) response_includable > (schema)>)\>\> include
Additional fields to include in the response. See the `include`
parameter for [listing Conversation items above](https://platform.openai.com/docs/api-reference/conversations/list-items#conversations_list_items-include) for more information.
FILE\_SEARCH\_CALL\_RESULTS("file\_search\_call.results")
[](<#(resource) responses > (model) response_includable > (schema) > (member) 0>)
WEB\_SEARCH\_CALL\_RESULTS("web\_search\_call.results")
[](<#(resource) responses > (model) response_includable > (schema) > (member) 1>)
WEB\_SEARCH\_CALL\_ACTION\_SOURCES("web\_search\_call.action.sources")
[](<#(resource) responses > (model) response_includable > (schema) > (member) 2>)
MESSAGE\_INPUT\_IMAGE\_IMAGE\_URL("message.input\_image.image\_url")
[](<#(resource) responses > (model) response_includable > (schema) > (member) 3>)
COMPUTER\_CALL\_OUTPUT\_OUTPUT\_IMAGE\_URL("computer\_call\_output.output.image\_url")
[](<#(resource) responses > (model) response_includable > (schema) > (member) 4>)
CODE\_INTERPRETER\_CALL\_OUTPUTS("code\_interpreter\_call.outputs")
[](<#(resource) responses > (model) response_includable > (schema) > (member) 5>)
REASONING\_ENCRYPTED\_CONTENT("reasoning.encrypted\_content")
[](<#(resource) responses > (model) response_includable > (schema) > (member) 6>)
MESSAGE\_OUTPUT\_TEXT\_LOGPROBS("message.output\_text.logprobs")
[](<#(resource) responses > (model) response_includable > (schema) > (member) 7>)
[](<#(resource) conversations.items > (method) retrieve > (params) default > (param) include > (schema)>)
[](<#(resource) conversations.items > (method) retrieve > (params) default>)
##### ReturnsExpand Collapse
class ConversationItem: A class that can be one of several variants.union
A single item within a conversation. The set of possible types are the same as the `output` type of a [Response object](https://platform.openai.com/docs/api-reference/responses/object#responses/object-output).
class Message:
A message to or from the model.
String id
The unique ID of the message.
[](<#(resource) conversations > (model) message > (schema) > (property) id>)
List\<Content\> content
The content of the message
One of the following:
class ResponseInputText:
A text input to the model.
String text
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
JsonValue; type "input\_text"constant"input\_text"constant
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
class ResponseOutputText:
A text output from the model.
List\<Annotation\> annotations
The annotations of the text output.
One of the following:
class FileCitation:
A citation to a file.
String fileId
The ID of the file.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) file_id>)
String filename
The filename of the file cited.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) filename>)
long index
The index of the file in the list of files.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) index>)
JsonValue; type "file\_citation"constant"file\_citation"constant
The type of the file citation. Always `file\_citation`.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 0 > (property) type>)
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 0>)
class UrlCitation:
A citation for a web resource used to generate a model response.
long endIndex
The index of the last character of the URL citation in the message.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) end_index>)
long startIndex
The index of the first character of the URL citation in the message.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) start_index>)
String title
The title of the web resource.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) title>)
JsonValue; type "url\_citation"constant"url\_citation"constant
The type of the URL citation. Always `url\_citation`.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) type>)
String url
The URL of the web resource.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 1 > (property) url>)
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 1>)
class ContainerFileCitation:
A citation for a container file used to generate a model response.
String containerId
The ID of the container file.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 2 > (property) container_id>)
long endIndex
The index of the last character of the container file citation in the message.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 2 > (property) end_index>)
String fileId
The ID of the file.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 2 > (property) file_id>)
String filename
The filename of the container file cited.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 2 > (property) filename>)
long startIndex
The index of the first character of the container file citation in the message.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 2 > (property) start_index>)
JsonValue; type "container\_file\_citation"constant"container\_file\_citation"constant
The type of the container file citation. Always `container\_file\_citation`.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 2 > (property) type>)
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 2>)
class FilePath:
A path to a file.
String fileId
The ID of the file.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 3 > (property) file_id>)
long index
The index of the file in the list of files.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 3 > (property) index>)
JsonValue; type "file\_path"constant"file\_path"constant
The type of the file path. Always `file\_path`.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 3 > (property) type>)
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations > (items) > (variant) 3>)
[](<#(resource) responses > (model) response_output_text > (schema) > (property) annotations>)
String text
The text output from the model.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) text>)
JsonValue; type "output\_text"constant"output\_text"constant
The type of the output text. Always `output\_text`.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) type>)
Optional\<List\<Logprob\>\> logprobs
String token
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) token>)
List\<long\> bytes
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) bytes>)
double logprob
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) logprob>)
List\<TopLogprob\> topLogprobs
String token
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) top_logprobs > (items) > (property) token>)
List\<long\> bytes
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) top_logprobs > (items) > (property) bytes>)
double logprob
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) top_logprobs > (items) > (property) logprob>)
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) top_logprobs>)
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs>)
[](<#(resource) responses > (model) response_output_text > (schema)>)
class TextContent:
A text content.
String text
[](<#(resource) conversations > (model) text_content > (schema) > (property) text>)
JsonValue; type "text"constant"text"constant
[](<#(resource) conversations > (model) text_content > (schema) > (property) type>)
[](<#(resource) conversations > (model) text_content > (schema)>)
class SummaryTextContent:
A summary text from the model.
String text
A summary of the reasoning output from the model so far.
[](<#(resource) conversations > (model) summary_text_content > (schema) > (property) text>)
JsonValue; type "summary\_text"constant"summary\_text"constant
The type of the object. Always `summary\_text`.
[](<#(resource) conversations > (model) summary_text_content > (schema) > (property) type>)
[](<#(resource) conversations > (model) summary_text_content > (schema)>)
class ReasoningText:
Reasoning text from the model.
String text
The reasoning text from the model.
[](<#(resource) conversations > (model) message > (schema) > (property) content > (items) > (variant) 4 > (property) text>)
JsonValue; type "reasoning\_text"constant"reasoning\_text"constant
The type of the reasoning text. Always `reasoning\_text`.
[](<#(resource) conversations > (model) message > (schema) > (property) content > (items) > (variant) 4 > (property) type>)
[](<#(resource) conversations > (model) message > (schema) > (property) content > (items) > (variant) 4>)
class ResponseOutputRefusal:
A refusal from the model.
String refusal
The refusal explanation from the model.
[](<#(resource) responses > (model) response_output_refusal > (schema) > (property) refusal>)
JsonValue; type "refusal"constant"refusal"constant
The type of the refusal. Always `refusal`.
[](<#(resource) responses > (model) response_output_refusal > (schema) > (property) type>)
[](<#(resource) responses > (model) response_output_refusal > (schema)>)
class ResponseInputImage:
An image input to the model. Learn about [image inputs](https://platform.openai.com/docs/guides/vision).
Detail detail
The detail level of the image to be sent to the model. One of `high`, `low`, `auto`, or `original`. Defaults to `auto`.
One of the following:
LOW("low")
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 0>)
HIGH("high")
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 1>)
AUTO("auto")
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 2>)
ORIGINAL("original")
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 3>)
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail>)
JsonValue; type "input\_image"constant"input\_image"constant
The type of the input item. Always `input\_image`.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) type>)
Optional\<String\> fileId
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) file_id>)
Optional\<String\> imageUrl
The URL of the image to be sent to the model. A fully qualified URL or base64 encoded image in a data URL.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) image_url>)
[](<#(resource) responses > (model) response_input_image > (schema)>)
class ComputerScreenshotContent:
A screenshot of a computer.
Detail detail
The detail level of the screenshot image to be sent to the model. One of `high`, `low`, `auto`, or `original`. Defaults to `auto`.
One of the following:
LOW("low")
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) detail > (member) 0>)
HIGH("high")
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) detail > (member) 1>)
AUTO("auto")
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) detail > (member) 2>)
ORIGINAL("original")
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) detail > (member) 3>)
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) detail>)
Optional\<String\> fileId
The identifier of an uploaded file that contains the screenshot.
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) file_id>)
Optional\<String\> imageUrl
The URL of the screenshot image.
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) image_url>)
JsonValue; type "computer\_screenshot"constant"computer\_screenshot"constant
Specifies the event type. For a computer screenshot, this property is always set to `computer\_screenshot`.
[](<#(resource) conversations > (model) computer_screenshot_content > (schema) > (property) type>)
[](<#(resource) conversations > (model) computer_screenshot_content > (schema)>)
class ResponseInputFile:
A file input to the model.
JsonValue; type "input\_file"constant"input\_file"constant
The type of the input item. Always `input\_file`.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) type>)
Optional\<Detail\> detail
The detail level of the file to be sent to the model. Use `low` for the default rendering behavior, or `high` to render the file at higher quality. Defaults to `low`.
One of the following:
LOW("low")
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 0>)
HIGH("high")
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 1>)
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail>)
Optional\<String\> fileData
The content of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_data>)
Optional\<String\> fileId
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_id>)
Optional\<String\> fileUrl
The URL of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_url>)
Optional\<String\> filename
The name of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) filename>)
[](<#(resource) responses > (model) response_input_file > (schema)>)
[](<#(resource) conversations > (model) message > (schema) > (property) content>)
Role role
The role of the message. One of `unknown`, `user`, `assistant`, `system`, `critic`, `discriminator`, `developer`, or `tool`.
One of the following:
UNKNOWN("unknown")
[](<#(resource) conversations > (model) message > (schema) > (property) role > (member) 0>)
USER("user")
[](<#(resource) conversations > (model) message > (schema) > (property) role > (member) 1>)
ASSISTANT("assistant")
[](<#(resource) conversations > (model) message > (schema) > (property) role > (member) 2>)
SYSTEM("system")
[](<#(resource) conversations > (model) message > (schema) > (property) role > (member) 3>)
CRITIC("critic")
[](<#(resource) conversations > (model) message > (schema) > (property) role > (member) 4>)
DISCRIMINATOR("discriminator")
[](<#(resource) conversations > (model) message > (schema) > (property) role > (member) 5>)
DEVELOPER("developer")
[](<#(resource) conversations > (model) message > (schema) > (property) role > (member) 6>)
TOOL("tool")
[](<#(resource) conversations > (model) message > (schema) > (property) role > (member) 7>)
[](<#(resource) conversations > (model) message > (schema) > (property) role>)
Status status
The status of item. One of `in\_progress`, `completed`, or `incomplete`. Populated when items are returned via API.
One of the following:
IN\_PROGRESS("in\_progress")
[](<#(resource) conversations > (model) message > (schema) > (property) status > (member) 0>)
COMPLETED("completed")
[](<#(resource) conversations > (model) message > (schema) > (property) status > (member) 1>)
INCOMPLETE("incomplete")
[](<#(resource) conversations > (model) message > (schema) > (property) status > (member) 2>)
[](<#(resource) conversations > (model) message > (schema) > (property) status>)
JsonValue; type "message"constant"message"constant
The type of the message. Always set to `message`.
[](<#(resource) conversations > (model) message > (schema) > (property) type>)
Optional\<Phase\> phase
Labels an `assistant` message as intermediate commentary (`commentary`) or the final answer (`final\_answer`). For models like `gpt-5.3-codex` and beyond, when sending follow-up requests, preserve and resend phase on all assistant messages — dropping it can degrade performance. Not used for user messages.
One of the following:
COMMENTARY("commentary")
[](<#(resource) conversations > (model) message > (schema) > (property) phase > (member) 0>)
FINAL\_ANSWER("final\_answer")
[](<#(resource) conversations > (model) message > (schema) > (property) phase > (member) 1>)
[](<#(resource) conversations > (model) message > (schema) > (property) phase>)
[](<#(resource) conversations > (model) message > (schema)>)
class ResponseFunctionToolCallItem:
A tool call to run a function. See the
[function calling guide](https://platform.openai.com/docs/guides/function-calling) for more information.
String id
The unique ID of the function tool call.
[](<#(resource) responses > (model) response_function_tool_call_item > (schema) > (entry) 1 > (property) id>)
Status status
The status of the item. One of `in\_progress`, `completed`, or
`incomplete`. Populated when items are returned via API.
One of the following:
IN\_PROGRESS("in\_progress")
[](<#(resource) responses > (model) response_function_tool_call_item > (schema) > (entry) 1 > (property) status > (member) 0>)
COMPLETED("completed")
[](<#(resource) responses > (model) response_function_tool_call_item > (schema) > (entry) 1 > (property) status > (member) 1>)
INCOMPLETE("incomplete")
[](<#(resource) responses > (model) response_function_tool_call_item > (schema) > (entry) 1 > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_function_tool_call_item > (schema) > (entry) 1 > (property) status>)
Optional\<String\> createdBy
The identifier of the actor that created the item.
[](<#(resource) responses > (model) response_function_tool_call_item > (schema) > (entry) 1 > (property) created_by>)
[](<#(resource) responses > (model) response_function_tool_call_item > (schema)>)
class ResponseFunctionToolCallOutputItem:
String id
The unique ID of the function call tool output.
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema) > (property) id>)
String callId
The unique ID of the function tool call generated by the model.
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema) > (property) call_id>)
Output output
The output from the function call generated by your code.
Can be a string or an list of output content.
One of the following:
String
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema) > (property) output > (variant) 0>)
List\<FunctionAndCustomToolCallOutput\>
One of the following:
class ResponseInputText:
A text input to the model.
String text
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
JsonValue; type "input\_text"constant"input\_text"constant
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
class ResponseInputImage:
An image input to the model. Learn about [image inputs](https://platform.openai.com/docs/guides/vision).
Detail detail
The detail level of the image to be sent to the model. One of `high`, `low`, `auto`, or `original`. Defaults to `auto`.
One of the following:
LOW("low")
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 0>)
HIGH("high")
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 1>)
AUTO("auto")
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 2>)
ORIGINAL("original")
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 3>)
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail>)
JsonValue; type "input\_image"constant"input\_image"constant
The type of the input item. Always `input\_image`.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) type>)
Optional\<String\> fileId
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) file_id>)
Optional\<String\> imageUrl
The URL of the image to be sent to the model. A fully qualified URL or base64 encoded image in a data URL.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) image_url>)
[](<#(resource) responses > (model) response_input_image > (schema)>)
class ResponseInputFile:
A file input to the model.
JsonValue; type "input\_file"constant"input\_file"constant
The type of the input item. Always `input\_file`.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) type>)
Optional\<Detail\> detail
The detail level of the file to be sent to the model. Use `low` for the default rendering behavior, or `high` to render the file at higher quality. Defaults to `low`.
One of the following:
LOW("low")
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 0>)
HIGH("high")
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 1>)
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail>)
Optional\<String\> fileData
The content of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_data>)
Optional\<String\> fileId
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_id>)
Optional\<String\> fileUrl
The URL of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_url>)
Optional\<String\> filename
The name of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) filename>)
[](<#(resource) responses > (model) response_input_file > (schema)>)
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema) > (property) output > (variant) 1>)
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema) > (property) output>)
Status status
The status of the item. One of `in\_progress`, `completed`, or
`incomplete`. Populated when items are returned via API.
One of the following:
IN\_PROGRESS("in\_progress")
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema) > (property) status > (member) 0>)
COMPLETED("completed")
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema) > (property) status > (member) 1>)
INCOMPLETE("incomplete")
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema) > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema) > (property) status>)
JsonValue; type "function\_call\_output"constant"function\_call\_output"constant
The type of the function tool call output. Always `function\_call\_output`.
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema) > (property) type>)
Optional\<String\> createdBy
The identifier of the actor that created the item.
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema) > (property) created_by>)
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema)>)
class ResponseFileSearchToolCall:
The results of a file search tool call. See the
[file search guide](https://platform.openai.com/docs/guides/tools-file-search) for more information.
String id
The unique ID of the file search tool call.
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) id>)
List\<String\> queries
The queries used to search for files.
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) queries>)
Status status
The status of the file search tool call. One of `in\_progress`,
`searching`, `incomplete` or `failed`,
One of the following:
IN\_PROGRESS("in\_progress")
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) status > (member) 0>)
SEARCHING("searching")
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) status > (member) 1>)
COMPLETED("completed")
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) status > (member) 2>)
INCOMPLETE("incomplete")
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) status > (member) 3>)
FAILED("failed")
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) status > (member) 4>)
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) status>)
JsonValue; type "file\_search\_call"constant"file\_search\_call"constant
The type of the file search tool call. Always `file\_search\_call`.
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) type>)
Optional\<List\<Result\>\> results
The results of the file search tool call.
Optional\<Attributes\> attributes
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard. Keys are strings
with a maximum length of 64 characters. Values are strings with a maximum
length of 512 characters, booleans, or numbers.
One of the following:
String
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) results > (items) > (property) attributes > (items) > (variant) 0>)
double
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) results > (items) > (property) attributes > (items) > (variant) 1>)
boolean
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) results > (items) > (property) attributes > (items) > (variant) 2>)
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) results > (items) > (property) attributes>)
Optional\<String\> fileId
The unique ID of the file.
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) results > (items) > (property) file_id>)
Optional\<String\> filename
The name of the file.
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) results > (items) > (property) filename>)
Optional\<Double\> score
The relevance score of the file - a value between 0 and 1.
formatfloat
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) results > (items) > (property) score>)
Optional\<String\> text
The text that was retrieved from the file.
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) results > (items) > (property) text>)
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) results>)
[](<#(resource) responses > (model) response_file_search_tool_call > (schema)>)
class ResponseFunctionWebSearch:
The results of a web search tool call. See the
[web search guide](https://platform.openai.com/docs/guides/tools-web-search) for more information.
String id
The unique ID of the web search tool call.
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) id>)
Action action
An object describing the specific action taken in this web search call.
Includes details on how the model used the web (search, open\_page, find\_in\_page).
One of the following:
class Search:
Action type “search” - Performs a web search query.
String query
[DEPRECATED] The search query.
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 0 > (property) query>)
JsonValue; type "search"constant"search"constant
The action type.
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 0 > (property) type>)
Optional\<List\<String\>\> queries
The search queries.
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 0 > (property) queries>)
Optional\<List\<Source\>\> sources
The sources used in the search.
JsonValue; type "url"constant"url"constant
The type of source. Always `url`.
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 0 > (property) sources > (items) > (property) type>)
String url
The URL of the source.
formaturi
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 0 > (property) sources > (items) > (property) url>)
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 0 > (property) sources>)
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 0>)
class OpenPage:
Action type “open\_page” - Opens a specific URL from search results.
JsonValue; type "open\_page"constant"open\_page"constant
The action type.
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 1 > (property) type>)
Optional\<String\> url
The URL opened by the model.
formaturi
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 1 > (property) url>)
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 1>)
class FindInPage:
Action type “find\_in\_page”: Searches for a pattern within a loaded page.
String pattern
The pattern or text to search for within the page.
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 2 > (property) pattern>)
JsonValue; type "find\_in\_page"constant"find\_in\_page"constant
The action type.
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 2 > (property) type>)
String url
The URL of the page searched for the pattern.
formaturi
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 2 > (property) url>)
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 2>)
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action>)
Status status
The status of the web search tool call.
One of the following:
IN\_PROGRESS("in\_progress")
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) status > (member) 0>)
SEARCHING("searching")
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) status > (member) 1>)
COMPLETED("completed")
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) status > (member) 2>)
FAILED("failed")
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) status > (member) 3>)
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) status>)
JsonValue; type "web\_search\_call"constant"web\_search\_call"constant
The type of the web search tool call. Always `web\_search\_call`.
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) type>)
[](<#(resource) responses > (model) response_function_web_search > (schema)>)
ImageGenerationCall
String id
The unique ID of the image generation call.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 5 > (property) id>)
Optional\<String\> result
The generated image encoded in base64.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 5 > (property) result>)
Status status
The status of the image generation call.
One of the following:
IN\_PROGRESS("in\_progress")
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 5 > (property) status > (member) 0>)
COMPLETED("completed")
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 5 > (property) status > (member) 1>)
GENERATING("generating")
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 5 > (property) status > (member) 2>)
FAILED("failed")
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 5 > (property) status > (member) 3>)
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 5 > (property) status>)
JsonValue; type "image\_generation\_call"constant"image\_generation\_call"constant
The type of the image generation call. Always `image\_generation\_call`.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 5 > (property) type>)
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 5>)
class ResponseComputerToolCall:
A tool call to a computer use tool. See the
[computer use guide](https://platform.openai.com/docs/guides/tools-computer-use) for more information.
String id
The unique ID of the computer call.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) id>)
String callId
An identifier used when responding to the tool call with output.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) call_id>)
List\<PendingSafetyCheck\> pendingSafetyChecks
The pending safety checks for the computer call.
String id
The ID of the pending safety check.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) pending_safety_checks > (items) > (property) id>)
Optional\<String\> code
The type of the pending safety check.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) pending_safety_checks > (items) > (property) code>)
Optional\<String\> message
Details about the pending safety check.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) pending_safety_checks > (items) > (property) message>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) pending_safety_checks>)
Status status
The status of the item. One of `in\_progress`, `completed`, or
`incomplete`. Populated when items are returned via API.
One of the following:
IN\_PROGRESS("in\_progress")
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) status > (member) 0>)
COMPLETED("completed")
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) status > (member) 1>)
INCOMPLETE("incomplete")
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) status>)
Type type
The type of the computer call. Always `computer\_call`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) type>)
Optional\<Action\> action
A click action.
One of the following:
class Click:
A click action.
Button button
Indicates which mouse button was pressed during the click. One of `left`, `right`, `wheel`, `back`, or `forward`.
One of the following:
LEFT("left")
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) button > (member) 0>)
RIGHT("right")
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) button > (member) 1>)
WHEEL("wheel")
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) button > (member) 2>)
BACK("back")
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) button > (member) 3>)
FORWARD("forward")
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) button > (member) 4>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) button>)
JsonValue; type "click"constant"click"constant
Specifies the event type. For a click action, this property is always `click`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) type>)
long x
The x-coordinate where the click occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) x>)
long y
The y-coordinate where the click occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) y>)
Optional\<List\<String\>\> keys
The keys being held while clicking.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) keys>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0>)
class DoubleClick:
A double click action.
Optional\<List\<String\>\> keys
The keys being held while double-clicking.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 1 > (property) keys>)
JsonValue; type "double\_click"constant"double\_click"constant
Specifies the event type. For a double click action, this property is always set to `double\_click`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 1 > (property) type>)
long x
The x-coordinate where the double click occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 1 > (property) x>)
long y
The y-coordinate where the double click occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 1 > (property) y>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 1>)
class Drag:
A drag action.
List\<Path\> path
An array of coordinates representing the path of the drag action. Coordinates will appear as an array of objects, eg
```
`[
{ x: 100, y: 200 },
{ x: 200, y: 300 }
]`
```
long x
The x-coordinate.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 2 > (property) path > (items) > (property) x>)
long y
The y-coordinate.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 2 > (property) path > (items) > (property) y>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 2 > (property) path>)
JsonValue; type "drag"constant"drag"constant
Specifies the event type. For a drag action, this property is always set to `drag`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 2 > (property) type>)
Optional\<List\<String\>\> keys
The keys being held while dragging the mouse.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 2 > (property) keys>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 2>)
class Keypress:
A collection of keypresses the model would like to perform.
List\<String\> keys
The combination of keys the model is requesting to be pressed. This is an array of strings, each representing a key.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 3 > (property) keys>)
JsonValue; type "keypress"constant"keypress"constant
Specifies the event type. For a keypress action, this property is always set to `keypress`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 3 > (property) type>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 3>)
class Move:
A mouse move action.
JsonValue; type "move"constant"move"constant
Specifies the event type. For a move action, this property is always set to `move`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 4 > (property) type>)
long x
The x-coordinate to move to.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 4 > (property) x>)
long y
The y-coordinate to move to.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 4 > (property) y>)
Optional\<List\<String\>\> keys
The keys being held while moving the mouse.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 4 > (property) keys>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 4>)
JsonValue;
JsonValue; type "screenshot"constant"screenshot"constant
Specifies the event type. For a screenshot action, this property is always set to `screenshot`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 5 > (property) type>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 5>)
class Scroll:
A scroll action.
long scrollX
The horizontal scroll distance.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 6 > (property) scroll_x>)
long scrollY
The vertical scroll distance.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 6 > (property) scroll_y>)
JsonValue; type "scroll"constant"scroll"constant
Specifies the event type. For a scroll action, this property is always set to `scroll`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 6 > (property) type>)
long x
The x-coordinate where the scroll occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 6 > (property) x>)
long y
The y-coordinate where the scroll occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 6 > (property) y>)
Optional\<List\<String\>\> keys
The keys being held while scrolling.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 6 > (property) keys>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 6>)
class Type:
An action to type in text.
String text
The text to type.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 7 > (property) text>)
JsonValue; type "type"constant"type"constant
Specifies the event type. For a type action, this property is always set to `type`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 7 > (property) type>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 7>)
JsonValue;
JsonValue; type "wait"constant"wait"constant
Specifies the event type. For a wait action, this property is always set to `wait`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 8 > (property) type>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 8>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action>)
Optional\<List\<[ComputerAction](</api/reference/java/resources/responses#(resource) responses > (model) computer_action > (schema)>)\>\> actions
Flattened batched actions for `computer\_use`. Each action includes an
`type` discriminator and action-specific fields.
One of the following:
Click
Button button
Indicates which mouse button was pressed during the click. One of `left`, `right`, `wheel`, `back`, or `forward`.
One of the following:
LEFT("left")
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) button > (member) 0>)
RIGHT("right")
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) button > (member) 1>)
WHEEL("wheel")
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) button > (member) 2>)
BACK("back")
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) button > (member) 3>)
FORWARD("forward")
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) button > (member) 4>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) button>)
JsonValue; type "click"constant"click"constant
Specifies the event type. For a click action, this property is always `click`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) type>)
long x
The x-coordinate where the click occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) x>)
long y
The y-coordinate where the click occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) y>)
Optional\<List\<String\>\> keys
The keys being held while clicking.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) keys>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0>)
DoubleClick
Optional\<List\<String\>\> keys
The keys being held while double-clicking.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 1 > (property) keys>)
JsonValue; type "double\_click"constant"double\_click"constant
Specifies the event type. For a double click action, this property is always set to `double\_click`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 1 > (property) type>)
long x
The x-coordinate where the double click occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 1 > (property) x>)
long y
The y-coordinate where the double click occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 1 > (property) y>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 1>)
Drag
List\<Path\> path
An array of coordinates representing the path of the drag action. Coordinates will appear as an array of objects, eg
```
`[
{ x: 100, y: 200 },
{ x: 200, y: 300 }
]`
```
long x
The x-coordinate.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 2 > (property) path > (items) > (property) x>)
long y
The y-coordinate.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 2 > (property) path > (items) > (property) y>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 2 > (property) path>)
JsonValue; type "drag"constant"drag"constant
Specifies the event type. For a drag action, this property is always set to `drag`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 2 > (property) type>)
Optional\<List\<String\>\> keys
The keys being held while dragging the mouse.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 2 > (property) keys>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 2>)
Keypress
List\<String\> keys
The combination of keys the model is requesting to be pressed. This is an array of strings, each representing a key.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 3 > (property) keys>)
JsonValue; type "keypress"constant"keypress"constant
Specifies the event type. For a keypress action, this property is always set to `keypress`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 3 > (property) type>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 3>)
Move
JsonValue; type "move"constant"move"constant
Specifies the event type. For a move action, this property is always set to `move`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 4 > (property) type>)
long x
The x-coordinate to move to.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 4 > (property) x>)
long y
The y-coordinate to move to.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 4 > (property) y>)
Optional\<List\<String\>\> keys
The keys being held while moving the mouse.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 4 > (property) keys>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 4>)
JsonValue;
JsonValue; type "screenshot"constant"screenshot"constant
Specifies the event type. For a screenshot action, this property is always set to `screenshot`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 5 > (property) type>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 5>)
Scroll
long scrollX
The horizontal scroll distance.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 6 > (property) scroll_x>)
long scrollY
The vertical scroll distance.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 6 > (property) scroll_y>)
JsonValue; type "scroll"constant"scroll"constant
Specifies the event type. For a scroll action, this property is always set to `scroll`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 6 > (property) type>)
long x
The x-coordinate where the scroll occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 6 > (property) x>)
long y
The y-coordinate where the scroll occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 6 > (property) y>)
Optional\<List\<String\>\> keys
The keys being held while scrolling.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 6 > (property) keys>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 6>)
Type
String text
The text to type.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 7 > (property) text>)
JsonValue; type "type"constant"type"constant
Specifies the event type. For a type action, this property is always set to `type`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 7 > (property) type>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 7>)
JsonValue;
JsonValue; type "wait"constant"wait"constant
Specifies the event type. For a wait action, this property is always set to `wait`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 8 > (property) type>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 8>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema)>)
class ResponseComputerToolCallOutputItem:
String id
The unique ID of the computer call tool output.
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) id>)
String callId
The ID of the computer tool call that produced the output.
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) call_id>)
[ResponseComputerToolCallOutputScreenshot](</api/reference/java/resources/responses#(resource) responses > (model) response_computer_tool_call_output_screenshot > (schema)>) output
A computer screenshot image used with the computer use tool.
JsonValue; type "computer\_screenshot"constant"computer\_screenshot"constant
Specifies the event type. For a computer screenshot, this property is
always set to `computer\_screenshot`.
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) output + (resource) responses > (model) response_computer_tool_call_output_screenshot > (schema) > (property) type>)
Optional\<String\> fileId
The identifier of an uploaded file that contains the screenshot.
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) output + (resource) responses > (model) response_computer_tool_call_output_screenshot > (schema) > (property) file_id>)
Optional\<String\> imageUrl
The URL of the screenshot image.
formaturi
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) output + (resource) responses > (model) response_computer_tool_call_output_screenshot > (schema) > (property) image_url>)
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) output>)
Status status
The status of the message input. One of `in\_progress`, `completed`, or
`incomplete`. Populated when input items are returned via API.
One of the following:
COMPLETED("completed")
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) status > (member) 0>)
INCOMPLETE("incomplete")
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) status > (member) 1>)
FAILED("failed")
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) status > (member) 2>)
IN\_PROGRESS("in\_progress")
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) status > (member) 3>)
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) status>)
JsonValue; type "computer\_call\_output"constant"computer\_call\_output"constant
The type of the computer tool call output. Always `computer\_call\_output`.
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) type>)
Optional\<List\<AcknowledgedSafetyCheck\>\> acknowledgedSafetyChecks
The safety checks reported by the API that have been acknowledged by the
developer.
String id
The ID of the pending safety check.
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) acknowledged_safety_checks > (items) > (property) id>)
Optional\<String\> code
The type of the pending safety check.
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) acknowledged_safety_checks > (items) > (property) code>)
Optional\<String\> message
Details about the pending safety check.
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) acknowledged_safety_checks > (items) > (property) message>)
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) acknowledged_safety_checks>)
Optional\<String\> createdBy
The identifier of the actor that created the item.
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) created_by>)
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema)>)
class ResponseToolSearchCall:
String id
The unique ID of the tool search call item.
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) id>)
JsonValue arguments
Arguments used for the tool search call.
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) arguments>)
Optional\<String\> callId
The unique ID of the tool search call generated by the model.
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) call_id>)
Execution execution
Whether tool search was executed by the server or by the client.
One of the following:
SERVER("server")
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) execution > (member) 0>)
CLIENT("client")
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) execution > (member) 1>)
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) execution>)
Status status
The status of the tool search call item that was recorded.
One of the following:
IN\_PROGRESS("in\_progress")
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) status > (member) 0>)
COMPLETED("completed")
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) status > (member) 1>)
INCOMPLETE("incomplete")
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) status>)
JsonValue; type "tool\_search\_call"constant"tool\_search\_call"constant
The type of the item. Always `tool\_search\_call`.
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) type>)
Optional\<String\> createdBy
The identifier of the actor that created the item.
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) created_by>)
[](<#(resource) responses > (model) response_tool_search_call > (schema)>)
class ResponseToolSearchOutputItem:
String id
The unique ID of the tool search output item.
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) id>)
Optional\<String\> callId
The unique ID of the tool search call generated by the model.
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) call_id>)
Execution execution
Whether tool search was executed by the server or by the client.
One of the following:
SERVER("server")
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) execution > (member) 0>)
CLIENT("client")
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) execution > (member) 1>)
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) execution>)
Status status
The status of the tool search output item that was recorded.
One of the following:
IN\_PROGRESS("in\_progress")
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) status > (member) 0>)
COMPLETED("completed")
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) status > (member) 1>)
INCOMPLETE("incomplete")
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) status>)
List\<[Tool](</api/reference/java/resources/responses#(resource) responses > (model) tool > (schema)>)\> tools
The loaded tool definitions returned by tool search.
One of the following:
class FunctionTool:
Defines a function in your own code the model can choose to call. Learn more about [function calling](https://platform.openai.com/docs/guides/function-calling).
String name
The name of the function to call.
[](<#(resource) responses > (model) function_tool > (schema) > (property) name>)
Optional\<Parameters\> parameters
A JSON schema object describing the parameters of the function.
[](<#(resource) responses > (model) function_tool > (schema) > (property) parameters>)
Optional\<Boolean\> strict
Whether to enforce strict parameter validation. Default `true`.
[](<#(resource) responses > (model) function_tool > (schema) > (property) strict>)
JsonValue; type "function"constant"function"constant
The type of the function tool. Always `function`.
[](<#(resource) responses > (model) function_tool > (schema) > (property) type>)
Optional\<Boolean\> deferLoading
Whether this function is deferred and loaded via tool search.
[](<#(resource) responses > (model) function_tool > (schema) > (property) defer_loading>)
Optional\<String\> description
A description of the function. Used by the model to determine whether or not to call the function.
[](<#(resource) responses > (model) function_tool > (schema) > (property) description>)
[](<#(resource) responses > (model) function_tool > (schema)>)
class FileSearchTool:
A tool that searches for relevant content from uploaded files. Learn more about the [file search tool](https://platform.openai.com/docs/guides/tools-file-search).
JsonValue; type "file\_search"constant"file\_search"constant
The type of the file search tool. Always `file\_search`.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) type>)
List\<String\> vectorStoreIds
The IDs of the vector stores to search.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) vector_store_ids>)
Optional\<Filters\> filters
A filter to apply.
One of the following:
class ComparisonFilter:
A filter used to compare a specified attribute key to a given value using a defined comparison operation.
String key
The key to compare against the value.
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) key>)
Type type
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
EQ("eq")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 0>)
NE("ne")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 1>)
GT("gt")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 2>)
GTE("gte")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 3>)
LT("lt")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 4>)
LTE("lte")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 5>)
IN("in")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 6>)
NIN("nin")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 7>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type>)
Value value
The value to compare against the attribute key; supports string, number, or boolean types.
One of the following:
String
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 0>)
double
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 1>)
boolean
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 2>)
List\<ComparisonFilterValueItem\>
One of the following:
String
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 0>)
double
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 1>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value>)
[](<#(resource) $shared > (model) comparison_filter > (schema)>)
class CompoundFilter:
Combine multiple filters using `and` or `or`.
List\<Filter\> filters
Array of filters to combine. Items can be `ComparisonFilter` or `CompoundFilter`.
One of the following:
class ComparisonFilter:
A filter used to compare a specified attribute key to a given value using a defined comparison operation.
String key
The key to compare against the value.
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) key>)
Type type
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
EQ("eq")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 0>)
NE("ne")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 1>)
GT("gt")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 2>)
GTE("gte")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 3>)
LT("lt")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 4>)
LTE("lte")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 5>)
IN("in")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 6>)
NIN("nin")
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type > (member) 7>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) type>)
Value value
The value to compare against the attribute key; supports string, number, or boolean types.
One of the following:
String
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 0>)
double
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 1>)
boolean
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 2>)
List\<ComparisonFilterValueItem\>
One of the following:
String
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 0>)
double
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 1>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value>)
[](<#(resource) $shared > (model) comparison_filter > (schema)>)
JsonValue
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) filters > (items) > (variant) 1>)
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) filters>)
Type type
Type of operation: `and` or `or`.
One of the following:
AND("and")
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type > (member) 0>)
OR("or")
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type > (member) 1>)
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type>)
[](<#(resource) $shared > (model) compound_filter > (schema)>)
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) filters>)
Optional\<Long\> maxNumResults
The maximum number of results to return. This number should be between 1 and 50 inclusive.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) max_num_results>)
Optional\<RankingOptions\> rankingOptions
Ranking options for search.
Optional\<HybridSearch\> hybridSearch
Weights that control how reciprocal rank fusion balances semantic embedding matches versus sparse keyword matches when hybrid search is enabled.
double embeddingWeight
The weight of the embedding in the reciprocal ranking fusion.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) hybrid_search > (property) embedding_weight>)
double textWeight
The weight of the text in the reciprocal ranking fusion.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) hybrid_search > (property) text_weight>)
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) hybrid_search>)
Optional\<Ranker\> ranker
The ranker to use for the file search.
One of the following:
AUTO("auto")
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) ranker > (member) 0>)
DEFAULT\_2024\_11\_15("default-2024-11-15")
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) ranker>)
Optional\<Double\> scoreThreshold
The score threshold for the file search, a number between 0 and 1. Numbers closer to 1 will attempt to return only the most relevant results, but may return fewer results.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) score_threshold>)
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options>)
[](<#(resource) responses > (model) file_search_tool > (schema)>)
class ComputerTool:
A tool that controls a virtual computer. Learn more about the [computer tool](https://platform.openai.com/docs/guides/tools-computer-use).
JsonValue; type "computer"constant"computer"constant
The type of the computer tool. Always `computer`.
[](<#(resource) responses > (model) computer_tool > (schema) > (property) type>)
[](<#(resource) responses > (model) computer_tool > (schema)>)
class ComputerUsePreviewTool:
A tool that controls a virtual computer. Learn more about the [computer tool](https://platform.openai.com/docs/guides/tools-computer-use).
long displayHeight
The height of the computer display.
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) display_height>)
long displayWidth
The width of the computer display.
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) display_width>)
Environment environment
The type of computer environment to control.
One of the following:
WINDOWS("windows")
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment > (member) 0>)
MAC("mac")
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment > (member) 1>)
LINUX("linux")
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment > (member) 2>)
UBUNTU("ubuntu")
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment > (member) 3>)
BROWSER("browser")
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment > (member) 4>)
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment>)
JsonValue; type "computer\_use\_preview"constant"computer\_use\_preview"constant
The type of the computer use tool. Always `computer\_use\_preview`.
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) type>)
[](<#(resource) responses > (model) computer_use_preview_tool > (schema)>)
class WebSearchTool:
Search the Internet for sources related to the prompt. Learn more about the
[web search tool](https://platform.openai.com/docs/guides/tools-web-search).
Type type
The type of the web search tool. One of `web\_search` or `web\_search\_2025\_08\_26`.
One of the following:
WEB\_SEARCH("web\_search")
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) type > (member) 0>)
WEB\_SEARCH\_2025\_08\_26("web\_search\_2025\_08\_26")
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) type > (member) 1>)
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) type>)
Optional\<Filters\> filters
Filters for the search.
Optional\<List\<String\>\> allowedDomains
Allowed domains for the search. If not provided, all domains are allowed.
Subdomains of the provided domains are allowed as well.
Example: `["pubmed.ncbi.nlm.nih.gov"]`
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) filters > (property) allowed_domains>)
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) filters>)
Optional\<SearchContextSize\> searchContextSize
High level guidance for the amount of context window space to use for the search. One of `low`, `medium`, or `high`. `medium` is the default.
One of the following:
LOW("low")
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) search_context_size > (member) 0>)
MEDIUM("medium")
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) search_context_size > (member) 1>)
HIGH("high")
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) search_context_size > (member) 2>)
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) search_context_size>)
Optional\<UserLocation\> userLocation
The approximate location of the user.
Optional\<String\> city
Free text input for the city of the user, e.g. `San Francisco`.
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location > (property) city>)
Optional\<String\> country
The two-letter [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1) of the user, e.g. `US`.
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location > (property) country>)
Optional\<String\> region
Free text input for the region of the user, e.g. `California`.
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location > (property) region>)
Optional\<String\> timezone
The [IANA timezone](https://timeapi.io/documentation/iana-timezones) of the user, e.g. `America/Los\_Angeles`.
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location > (property) timezone>)
Optional\<Type\> type
The type of location approximation. Always `approximate`.
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location > (property) type>)
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location>)
[](<#(resource) responses > (model) web_search_tool > (schema)>)
Mcp
String serverLabel
A label for this MCP server, used to identify it in tool calls.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) server_label>)
JsonValue; type "mcp"constant"mcp"constant
The type of the MCP tool. Always `mcp`.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) type>)
Optional\<AllowedTools\> allowedTools
List of allowed tool names or a filter object.
One of the following:
List\<String\>
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) allowed_tools > (variant) 0>)
class McpToolFilter:
A filter object to specify which tools are allowed.
Optional\<Boolean\> readOnly
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) allowed_tools > (variant) 1 > (property) read_only>)
Optional\<List\<String\>\> toolNames
List of allowed tool names.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) allowed_tools > (variant) 1 > (property) tool_names>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) allowed_tools > (variant) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) allowed_tools>)
Optional\<String\> authorization
An OAuth access token that can be used with a remote MCP server, either
with a custom MCP server URL or a service connector. Your application
must handle the OAuth authorization flow and provide the token here.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) authorization>)
Optional\<ConnectorId\> connectorId
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
CONNECTOR\_DROPBOX("connector\_dropbox")
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 0>)
CONNECTOR\_GMAIL("connector\_gmail")
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 1>)
CONNECTOR\_GOOGLECALENDAR("connector\_googlecalendar")
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 2>)
CONNECTOR\_GOOGLEDRIVE("connector\_googledrive")
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 3>)
CONNECTOR\_MICROSOFTTEAMS("connector\_microsoftteams")
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 4>)
CONNECTOR\_OUTLOOKCALENDAR("connector\_outlookcalendar")
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 5>)
CONNECTOR\_OUTLOOKEMAIL("connector\_outlookemail")
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 6>)
CONNECTOR\_SHAREPOINT("connector\_sharepoint")
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 7>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id>)
Optional\<Boolean\> deferLoading
Whether this MCP tool is deferred and discovered via tool search.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) defer_loading>)
Optional\<Headers\> headers
Optional HTTP headers to send to the MCP server. Use for authentication
or other purposes.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) headers>)
Optional\<RequireApproval\> requireApproval
Specify which of the MCP server’s tools require approval.
One of the following:
class McpToolApprovalFilter:
Specify which of the MCP server’s tools require approval. Can be
`always`, `never`, or a filter object associated with tools
that require approval.
Optional\<Always\> always
A filter object to specify which tools are allowed.
Optional\<Boolean\> readOnly
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) always > (property) read_only>)
Optional\<List\<String\>\> toolNames
List of allowed tool names.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) always > (property) tool_names>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) always>)
Optional\<Never\> never
A filter object to specify which tools are allowed.
Optional\<Boolean\> readOnly
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) never > (property) read_only>)
Optional\<List\<String\>\> toolNames
List of allowed tool names.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) never > (property) tool_names>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) never>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0>)
enum McpToolApprovalSetting:
Specify a single approval policy for all tools. One of `always` or
`never`. When set to `always`, all tools will require approval. When
set to `never`, all tools will not require approval.
ALWAYS("always")
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 1 > (member) 0>)
NEVER("never")
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 1 > (member) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval>)
Optional\<String\> serverDescription
Optional description of the MCP server, used to provide more context.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) server_description>)
Optional\<String\> serverUrl
The URL for the MCP server. One of `server\_url` or `connector\_id` must be
provided.
formaturi
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) server_url>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5>)
CodeInterpreter
Container container
The code interpreter container. Can be a container ID or an object that
specifies uploaded file IDs to make available to your code, along with an
optional `memory\_limit` setting.
One of the following:
String
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 0>)
class CodeInterpreterToolAuto:
Configuration for a code interpreter container. Optionally specify the IDs of the files to run the code on.
JsonValue; type "auto"constant"auto"constant
Always `auto`.
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) type>)
Optional\<List\<String\>\> fileIds
An optional list of uploaded files to make available to your code.
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) file_ids>)
Optional\<MemoryLimit\> memoryLimit
The memory limit for the code interpreter container.
One of the following:
\_1G("1g")
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 0>)
\_4G("4g")
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 1>)
\_16G("16g")
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 2>)
\_64G("64g")
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 3>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit>)
Optional\<NetworkPolicy\> networkPolicy
Network access policy for the container.
One of the following:
class ContainerNetworkPolicyDisabled:
JsonValue; type "disabled"constant"disabled"constant
Disable outbound network access. Always `disabled`.
[](<#(resource) responses > (model) container_network_policy_disabled > (schema) > (property) type>)
[](<#(resource) responses > (model) container_network_policy_disabled > (schema)>)
class ContainerNetworkPolicyAllowlist:
List\<String\> allowedDomains
A list of allowed domains when type is `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) allowed_domains>)
JsonValue; type "allowlist"constant"allowlist"constant
Allow outbound network access only to specified domains. Always `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) type>)
Optional\<List\<[ContainerNetworkPolicyDomainSecret](</api/reference/java/resources/responses#(resource) responses > (model) container_network_policy_domain_secret > (schema)>)\>\> domainSecrets
Optional domain-scoped secrets for allowlisted domains.
String domain
The domain associated with the secret.
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) domain>)
String name
The name of the secret to inject for the domain.
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) name>)
String value
The secret value to inject for the domain.
maxLength10485760
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) value>)
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) domain_secrets>)
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema)>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) network_policy>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container>)
JsonValue; type "code\_interpreter"constant"code\_interpreter"constant
The type of the code interpreter tool. Always `code\_interpreter`.
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) type>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 6>)
ImageGeneration
JsonValue; type "image\_generation"constant"image\_generation"constant
The type of the image generation tool. Always `image\_generation`.
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) type>)
Optional\<Action\> action
Whether to generate a new image or edit an existing image. Default: `auto`.
One of the following:
GENERATE("generate")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) action > (member) 0>)
EDIT("edit")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) action > (member) 1>)
AUTO("auto")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) action > (member) 2>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) action>)
Optional\<Background\> background
Background type for the generated image. One of `transparent`,
`opaque`, or `auto`. Default: `auto`.
One of the following:
TRANSPARENT("transparent")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) background > (member) 0>)
OPAQUE("opaque")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) background > (member) 1>)
AUTO("auto")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) background > (member) 2>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) background>)
Optional\<InputFidelity\> inputFidelity
Control how much effort the model will exert to match the style and features, especially facial features, of input images. This parameter is only supported for `gpt-image-1` and `gpt-image-1.5` and later models, unsupported for `gpt-image-1-mini`. Supports `high` and `low`. Defaults to `low`.
One of the following:
HIGH("high")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_fidelity > (member) 0>)
LOW("low")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_fidelity > (member) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_fidelity>)
Optional\<InputImageMask\> inputImageMask
Optional mask for inpainting. Contains `image\_url`
(string, optional) and `file\_id` (string, optional).
Optional\<String\> fileId
File ID for the mask image.
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_image_mask > (property) file_id>)
Optional\<String\> imageUrl
Base64-encoded mask image.
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_image_mask > (property) image_url>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_image_mask>)
Optional\<Model\> model
The image generation model to use. Default: `gpt-image-1`.
One of the following:
GPT\_IMAGE\_1("gpt-image-1")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) model > (variant) 1 > (member) 0>)
GPT\_IMAGE\_1\_MINI("gpt-image-1-mini")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) model > (variant) 1 > (member) 1>)
GPT\_IMAGE\_1\_5("gpt-image-1.5")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) model > (variant) 1 > (member) 2>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) model>)
Optional\<Moderation\> moderation
Moderation level for the generated image. Default: `auto`.
One of the following:
AUTO("auto")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) moderation > (member) 0>)
LOW("low")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) moderation > (member) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) moderation>)
Optional\<Long\> outputCompression
Compression level for the output image. Default: 100.
minimum0
maximum100
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) output_compression>)
Optional\<OutputFormat\> outputFormat
The output format of the generated image. One of `png`, `webp`, or
`jpeg`. Default: `png`.
One of the following:
PNG("png")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) output_format > (member) 0>)
WEBP("webp")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) output_format > (member) 1>)
JPEG("jpeg")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) output_format > (member) 2>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) output_format>)
Optional\<Long\> partialImages
Number of partial images to generate in streaming mode, from 0 (default value) to 3.
minimum0
maximum3
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) partial_images>)
Optional\<Quality\> quality
The quality of the generated image. One of `low`, `medium`, `high`,
or `auto`. Default: `auto`.
One of the following:
LOW("low")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) quality > (member) 0>)
MEDIUM("medium")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) quality > (member) 1>)
HIGH("high")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) quality > (member) 2>)
AUTO("auto")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) quality > (member) 3>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) quality>)
Optional\<Size\> size
The size of the generated image. One of `1024x1024`, `1024x1536`,
`1536x1024`, or `auto`. Default: `auto`.
One of the following:
\_1024X1024("1024x1024")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) size > (member) 0>)
\_1024X1536("1024x1536")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) size > (member) 1>)
\_1536X1024("1536x1024")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) size > (member) 2>)
AUTO("auto")
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) size > (member) 3>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) size>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7>)
JsonValue;
JsonValue; type "local\_shell"constant"local\_shell"constant
The type of the local shell tool. Always `local\_shell`.
[](<#(resource) responses > (model) tool > (schema) > (variant) 8 > (property) type>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 8>)
class FunctionShellTool:
A tool that allows the model to execute shell commands.
JsonValue; type "shell"constant"shell"constant
The type of the shell tool. Always `shell`.
[](<#(resource) responses > (model) function_shell_tool > (schema) > (property) type>)
Optional\<Environment\> environment
One of the following:
class ContainerAuto:
JsonValue; type "container\_auto"constant"container\_auto"constant
Automatically creates a container for this request
[](<#(resource) responses > (model) container_auto > (schema) > (property) type>)
Optional\<List\<String\>\> fileIds
An optional list of uploaded files to make available to your code.
[](<#(resource) responses > (model) container_auto > (schema) > (property) file_ids>)
Optional\<MemoryLimit\> memoryLimit
The memory limit for the container.
One of the following:
\_1G("1g")
[](<#(resource) responses > (model) container_auto > (schema) > (property) memory_limit > (member) 0>)
\_4G("4g")
[](<#(resource) responses > (model) container_auto > (schema) > (property) memory_limit > (member) 1>)
\_16G("16g")
[](<#(resource) responses > (model) container_auto > (schema) > (property) memory_limit > (member) 2>)
\_64G("64g")
[](<#(resource) responses > (model) container_auto > (schema) > (property) memory_limit > (member) 3>)
[](<#(resource) responses > (model) container_auto > (schema) > (property) memory_limit>)
Optional\<NetworkPolicy\> networkPolicy
Network access policy for the container.
One of the following:
class ContainerNetworkPolicyDisabled:
JsonValue; type "disabled"constant"disabled"constant
Disable outbound network access. Always `disabled`.
[](<#(resource) responses > (model) container_network_policy_disabled > (schema) > (property) type>)
[](<#(resource) responses > (model) container_network_policy_disabled > (schema)>)
class ContainerNetworkPolicyAllowlist:
List\<String\> allowedDomains
A list of allowed domains when type is `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) allowed_domains>)
JsonValue; type "allowlist"constant"allowlist"constant
Allow outbound network access only to specified domains. Always `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) type>)
Optional\<List\<[ContainerNetworkPolicyDomainSecret](</api/reference/java/resources/responses#(resource) responses > (model) container_network_policy_domain_secret > (schema)>)\>\> domainSecrets
Optional domain-scoped secrets for allowlisted domains.
String domain
The domain associated with the secret.
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) domain>)
String name
The name of the secret to inject for the domain.
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) name>)
String value
The secret value to inject for the domain.
maxLength10485760
minLength1
[](<#(resource) responses > (model) container_network_policy_domain_secret > (schema) > (property) value>)
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) domain_secrets>)
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema)>)
[](<#(resource) responses > (model) container_auto > (schema) > (property) network_policy>)
Optional\<List\<Skill\>\> skills
An optional list of skills referenced by id or inline data.
One of the following:
class SkillReference:
String skillId
The ID of the referenced skill.
maxLength64
minLength1
[](<#(resource) responses > (model) skill_reference > (schema) > (property) skill_id>)
JsonValue; type "skill\_reference"constant"skill\_reference"constant
References a skill created with the /v1/skills endpoint.
[](<#(resource) responses > (model) skill_reference > (schema) > (property) type>)
Optional\<String\> version
Optional skill version. Use a positive integer or ‘latest’. Omit for default.
[](<#(resource) responses > (model) skill_reference > (schema) > (property) version>)
[](<#(resource) responses > (model) skill_reference > (schema)>)
class InlineSkill:
String description
The description of the skill.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) description>)
String name
The name of the skill.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) name>)
[InlineSkillSource](</api/reference/java/resources/responses#(resource) responses > (model) inline_skill_source > (schema)>) source
Inline skill payload
String data
Base64-encoded skill zip bundle.
maxLength70254592
minLength1
[](<#(resource) responses > (model) inline_skill > (schema) > (property) source + (resource) responses > (model) inline_skill_source > (schema) > (property) data>)
JsonValue; mediaType "application/zip"constant"application/zip"constant
The media type of the inline skill payload. Must be `application/zip`.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) source + (resource) responses > (model) inline_skill_source > (schema) > (property) media_type>)
JsonValue; type "base64"constant"base64"constant
The type of the inline skill source. Must be `base64`.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) source + (resource) responses > (model) inline_skill_source > (schema) > (property) type>)
[](<#(resource) responses > (model) inline_skill > (schema) > (property) source>)
JsonValue; type "inline"constant"inline"constant
Defines an inline skill for this request.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) type>)
[](<#(resource) responses > (model) inline_skill > (schema)>)
[](<#(resource) responses > (model) container_auto > (schema) > (property) skills>)
[](<#(resource) responses > (model) container_auto > (schema)>)
class LocalEnvironment:
JsonValue; type "local"constant"local"constant
Use a local computer environment.
[](<#(resource) responses > (model) local_environment > (schema) > (property) type>)
Optional\<List\<[LocalSkill](</api/reference/java/resources/responses#(resource) responses > (model) local_skill > (schema)>)\>\> skills
An optional list of skills.
String description
The description of the skill.
[](<#(resource) responses > (model) local_skill > (schema) > (property) description>)
String name
The name of the skill.
[](<#(resource) responses > (model) local_skill > (schema) > (property) name>)
String path
The path to the directory containing the skill.
[](<#(resource) responses > (model) local_skill > (schema) > (property) path>)
[](<#(resource) responses > (model) local_environment > (schema) > (property) skills>)
[](<#(resource) responses > (model) local_environment > (schema)>)
class ContainerReference:
String containerId
The ID of the referenced container.
[](<#(resource) responses > (model) container_reference > (schema) > (property) container_id>)
JsonValue; type "container\_reference"constant"container\_reference"constant
References a container created with the /v1/containers endpoint
[](<#(resource) responses > (model) container_reference > (schema) > (property) type>)
[](<#(resource) responses > (model) container_reference > (schema)>)
[](<#(resource) responses > (model) function_shell_tool > (schema) > (property) environment>)
[](<#(resource) responses > (model) function_shell_tool > (schema)>)
class CustomTool:
A custom tool that processes input using a specified format. Learn more about [custom tools](https://platform.openai.com/docs/guides/function-calling#custom-tools)
String name
The name of the custom tool, used to identify it in tool calls.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) name>)
JsonValue; type "custom"constant"custom"constant
The type of the custom tool. Always `custom`.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) type>)
Optional\<Boolean\> deferLoading
Whether this tool should be deferred and discovered via tool search.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) defer_loading>)
Optional\<String\> description
Optional description of the custom tool, used to provide more context.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) description>)
Optional\<[CustomToolInputFormat](</api/reference/java/resources/$shared#(resource) $shared > (model) custom_tool_input_format > (schema)>)\> format
The input format for the custom tool. Default is unconstrained text.
One of the following:
JsonValue;
JsonValue; type "text"constant"text"constant
Unconstrained text format. Always `text`.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 0 > (property) type>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 0>)
Grammar
String definition
The grammar definition.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) definition>)
Syntax syntax
The syntax of the grammar definition. One of `lark` or `regex`.
One of the following:
LARK("lark")
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax > (member) 0>)
REGEX("regex")
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax > (member) 1>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax>)
JsonValue; type "grammar"constant"grammar"constant
Grammar format. Always `grammar`.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) type>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format>)
[](<#(resource) responses > (model) custom_tool > (schema)>)
class NamespaceTool:
Groups function/custom tools under a shared namespace.
String description
A description of the namespace shown to the model.
minLength1
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) description>)
String name
The namespace name used in tool calls (for example, `crm`).
minLength1
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) name>)
List\<Tool\> tools
The function/custom tools available inside this namespace.
One of the following:
class Function:
String name
maxLength128
minLength1
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) name>)
JsonValue; type "function"constant"function"constant
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) type>)
Optional\<Boolean\> deferLoading
Whether this function should be deferred and discovered via tool search.
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) defer_loading>)
Optional\<String\> description
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) description>)
Optional\<JsonValue\> parameters
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) parameters>)
Optional\<Boolean\> strict
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) strict>)
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0>)
class CustomTool:
A custom tool that processes input using a specified format. Learn more about [custom tools](https://platform.openai.com/docs/guides/function-calling#custom-tools)
String name
The name of the custom tool, used to identify it in tool calls.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) name>)
JsonValue; type "custom"constant"custom"constant
The type of the custom tool. Always `custom`.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) type>)
Optional\<Boolean\> deferLoading
Whether this tool should be deferred and discovered via tool search.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) defer_loading>)
Optional\<String\> description
Optional description of the custom tool, used to provide more context.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) description>)
Optional\<[CustomToolInputFormat](</api/reference/java/resources/$shared#(resource) $shared > (model) custom_tool_input_format > (schema)>)\> format
The input format for the custom tool. Default is unconstrained text.
One of the following:
JsonValue;
JsonValue; type "text"constant"text"constant
Unconstrained text format. Always `text`.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 0 > (property) type>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 0>)
Grammar
String definition
The grammar definition.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) definition>)
Syntax syntax
The syntax of the grammar definition. One of `lark` or `regex`.
One of the following:
LARK("lark")
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax > (member) 0>)
REGEX("regex")
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax > (member) 1>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax>)
JsonValue; type "grammar"constant"grammar"constant
Grammar format. Always `grammar`.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) type>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format>)
[](<#(resource) responses > (model) custom_tool > (schema)>)
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools>)
JsonValue; type "namespace"constant"namespace"constant
The type of the tool. Always `namespace`.
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) type>)
[](<#(resource) responses > (model) namespace_tool > (schema)>)
class ToolSearchTool:
Hosted or BYOT tool search configuration for deferred tools.
JsonValue; type "tool\_search"constant"tool\_search"constant
The type of the tool. Always `tool\_search`.
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) type>)
Optional\<String\> description
Description shown to the model for a client-executed tool search tool.
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) description>)
Optional\<Execution\> execution
Whether tool search is executed by the server or by the client.
One of the following:
SERVER("server")
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) execution > (member) 0>)
CLIENT("client")
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) execution > (member) 1>)
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) execution>)
Optional\<JsonValue\> parameters
Parameter schema for a client-executed tool search tool.
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) parameters>)
[](<#(resource) responses > (model) tool_search_tool > (schema)>)
class WebSearchPreviewTool:
This tool searches the web for relevant results to use in a response. Learn more about the [web search tool](https://platform.openai.com/docs/guides/tools-web-search).
Type type
The type of the web search tool. One of `web\_search\_preview` or `web\_search\_preview\_2025\_03\_11`.
One of the following:
WEB\_SEARCH\_PREVIEW("web\_search\_preview")
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) type > (member) 0>)
WEB\_SEARCH\_PREVIEW\_2025\_03\_11("web\_search\_preview\_2025\_03\_11")
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) type > (member) 1>)
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) type>)
Optional\<List\<SearchContentType\>\> searchContentTypes
One of the following:
TEXT("text")
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_content_types > (items) > (member) 0>)
IMAGE("image")
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_content_types > (items) > (member) 1>)
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_content_types>)
Optional\<SearchContextSize\> searchContextSize
High level guidance for the amount of context window space to use for the search. One of `low`, `medium`, or `high`. `medium` is the default.
One of the following:
LOW("low")
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_context_size > (member) 0>)
MEDIUM("medium")
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_context_size > (member) 1>)
HIGH("high")
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_context_size > (member) 2>)
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_context_size>)
Optional\<UserLocation\> userLocation
The user’s location.
JsonValue; type "approximate"constant"approximate"constant
The type of location approximation. Always `approximate`.
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location > (property) type>)
Optional\<String\> city
Free text input for the city of the user, e.g. `San Francisco`.
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location > (property) city>)
Optional\<String\> country
The two-letter [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1) of the user, e.g. `US`.
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location > (property) country>)
Optional\<String\> region
Free text input for the region of the user, e.g. `California`.
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location > (property) region>)
Optional\<String\> timezone
The [IANA timezone](https://timeapi.io/documentation/iana-timezones) of the user, e.g. `America/Los\_Angeles`.
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location > (property) timezone>)
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location>)
[](<#(resource) responses > (model) web_search_preview_tool > (schema)>)
class ApplyPatchTool:
Allows the assistant to create, delete, or update files using unified diffs.
JsonValue; type "apply\_patch"constant"apply\_patch"constant
The type of the tool. Always `apply\_patch`.
[](<#(resource) responses > (model) apply_patch_tool > (schema) > (property) type>)
[](<#(resource) responses > (model) apply_patch_tool > (schema)>)
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) tools>)
JsonValue; type "tool\_search\_output"constant"tool\_search\_output"constant
The type of the item. Always `tool\_search\_output`.
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) type>)
Optional\<String\> createdBy
The identifier of the actor that created the item.
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) created_by>)
[](<#(resource) responses > (model) response_tool_search_output_item > (schema)>)
class ResponseReasoningItem:
A description of the chain of thought used by a reasoning model while generating
a response. Be sure to include these items in your `input` to the Responses API
for subsequent turns of a conversation if you are manually
[managing context](https://platform.openai.com/docs/guides/conversation-state).
String id
The unique identifier of the reasoning content.
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) id>)
List\<Summary\> summary
Reasoning summary content.
String text
A summary of the reasoning output from the model so far.
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) summary > (items) > (property) text>)
JsonValue; type "summary\_text"constant"summary\_text"constant
The type of the object. Always `summary\_text`.
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) summary > (items) > (property) type>)
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) summary>)
JsonValue; type "reasoning"constant"reasoning"constant
The type of the object. Always `reasoning`.
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) type>)
Optional\<List\<Content\>\> content
Reasoning text content.
String text
The reasoning text from the model.
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) content > (items) > (property) text>)
JsonValue; type "reasoning\_text"constant"reasoning\_text"constant
The type of the reasoning text. Always `reasoning\_text`.
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) content > (items) > (property) type>)
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) content>)
Optional\<String\> encryptedContent
The encrypted content of the reasoning item - populated when a response is
generated with `reasoning.encrypted\_content` in the `include` parameter.
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) encrypted_content>)
Optional\<Status\> status
The status of the item. One of `in\_progress`, `completed`, or
`incomplete`. Populated when items are returned via API.
One of the following:
IN\_PROGRESS("in\_progress")
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) status > (member) 0>)
COMPLETED("completed")
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) status > (member) 1>)
INCOMPLETE("incomplete")
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) status>)
[](<#(resource) responses > (model) response_reasoning_item > (schema)>)
class ResponseCompactionItem:
A compaction item generated by the [`v1/responses/compact` API](https://platform.openai.com/docs/api-reference/responses/compact).
String id
The unique ID of the compaction item.
[](<#(resource) responses > (model) response_compaction_item > (schema) > (property) id>)
String encryptedContent
The encrypted content that was produced by compaction.
[](<#(resource) responses > (model) response_compaction_item > (schema) > (property) encrypted_content>)
JsonValue; type "compaction"constant"compaction"constant
The type of the item. Always `compaction`.
[](<#(resource) responses > (model) response_compaction_item > (schema) > (property) type>)
Optional\<String\> createdBy
The identifier of the actor that created the item.
[](<#(resource) responses > (model) response_compaction_item > (schema) > (property) created_by>)
[](<#(resource) responses > (model) response_compaction_item > (schema)>)
class ResponseCodeInterpreterToolCall:
A tool call to run code.
String id
The unique ID of the code interpreter tool call.
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) id>)
Optional\<String\> code
The code to run, or null if not available.
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) code>)
String containerId
The ID of the container used to run the code.
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) container_id>)
Optional\<List\<Output\>\> outputs
The outputs generated by the code interpreter, such as logs or images.
Can be null if no outputs are available.
One of the following:
class Logs:
The logs output from the code interpreter.
String logs
The logs output from the code interpreter.
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) outputs > (items) > (variant) 0 > (property) logs>)
JsonValue; type "logs"constant"logs"constant
The type of the output. Always `logs`.
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) outputs > (items) > (variant) 0 > (property) type>)
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) outputs > (items) > (variant) 0>)
class Image:
The image output from the code interpreter.
JsonValue; type "image"constant"image"constant
The type of the output. Always `image`.
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) outputs > (items) > (variant) 1 > (property) type>)
String url
The URL of the image output from the code interpreter.
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) outputs > (items) > (variant) 1 > (property) url>)
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) outputs > (items) > (variant) 1>)
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) outputs>)
Status status
The status of the code interpreter tool call. Valid values are `in\_progress`, `completed`, `incomplete`, `interpreting`, and `failed`.
One of the following:
IN\_PROGRESS("in\_progress")
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) status > (member) 0>)
COMPLETED("completed")
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) status > (member) 1>)
INCOMPLETE("incomplete")
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) status > (member) 2>)
INTERPRETING("interpreting")
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) status > (member) 3>)
FAILED("failed")
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) status > (member) 4>)
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) status>)
JsonValue; type "code\_interpreter\_call"constant"code\_interpreter\_call"constant
The type of the code interpreter tool call. Always `code\_interpreter\_call`.
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) type>)
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema)>)
LocalShellCall
String id
The unique ID of the local shell call.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) id>)
Action action
Execute a shell command on the server.
List\<String\> command
The command to run.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) action > (property) command>)
Env env
Environment variables to set for the command.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) action > (property) env>)
JsonValue; type "exec"constant"exec"constant
The type of the local shell action. Always `exec`.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) action > (property) type>)
Optional\<Long\> timeoutMs
Optional timeout in milliseconds for the command.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) action > (property) timeout_ms>)
Optional\<String\> user
Optional user to run the command as.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) action > (property) user>)
Optional\<String\> workingDirectory
Optional working directory to run the command in.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) action > (property) working_directory>)
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) action>)
String callId
The unique ID of the local shell tool call generated by the model.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) call_id>)
Status status
The status of the local shell call.
One of the following:
IN\_PROGRESS("in\_progress")
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) status > (member) 0>)
COMPLETED("completed")
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) status > (member) 1>)
INCOMPLETE("incomplete")
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) status > (member) 2>)
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) status>)
JsonValue; type "local\_shell\_call"constant"local\_shell\_call"constant
The type of the local shell call. Always `local\_shell\_call`.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13 > (property) type>)
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 13>)
LocalShellCallOutput
String id
The unique ID of the local shell tool call generated by the model.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 14 > (property) id>)
String output
A JSON string of the output of the local shell tool call.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 14 > (property) output>)
JsonValue; type "local\_shell\_call\_output"constant"local\_shell\_call\_output"constant
The type of the local shell tool call output. Always `local\_shell\_call\_output`.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 14 > (property) type>)
Optional\<Status\> status
The status of the item. One of `in\_progress`, `completed`, or `incomplete`.
One of the following:
IN\_PROGRESS("in\_progress")
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 14 > (property) status > (member) 0>)
COMPLETED("completed")
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 14 > (property) status > (member) 1>)
INCOMPLETE("incomplete")
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 14 > (property) status > (member) 2>)
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 14 > (property) status>)
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 14>)
class ResponseFunctionShellToolCall:
A tool call that executes one or more shell commands in a managed environment.
String id
The unique ID of the shell tool call. Populated when this item is returned via API.
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) id>)
Action action
The shell commands and limits that describe how to run the tool call.
List\<String\> commands
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) action > (property) commands>)
Optional\<Long\> maxOutputLength
Optional maximum number of characters to return from each command.
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) action > (property) max_output_length>)
Optional\<Long\> timeoutMs
Optional timeout in milliseconds for the commands.
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) action > (property) timeout_ms>)
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) action>)
String callId
The unique ID of the shell tool call generated by the model.
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) call_id>)
Optional\<Environment\> environment
Represents the use of a local environment to perform shell actions.
One of the following:
class ResponseLocalEnvironment:
Represents the use of a local environment to perform shell actions.
JsonValue; type "local"constant"local"constant
The environment type. Always `local`.
[](<#(resource) responses > (model) response_local_environment > (schema) > (property) type>)
[](<#(resource) responses > (model) response_local_environment > (schema)>)
class ResponseContainerReference:
Represents a container created with /v1/containers.
String containerId
[](<#(resource) responses > (model) response_container_reference > (schema) > (property) container_id>)
JsonValue; type "container\_reference"constant"container\_reference"constant
The environment type. Always `container\_reference`.
[](<#(resource) responses > (model) response_container_reference > (schema) > (property) type>)
[](<#(resource) responses > (model) response_container_reference > (schema)>)
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) environment>)
Status status
The status of the shell call. One of `in\_progress`, `completed`, or `incomplete`.
One of the following:
IN\_PROGRESS("in\_progress")
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) status > (member) 0>)
COMPLETED("completed")
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) status > (member) 1>)
INCOMPLETE("incomplete")
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) status>)
JsonValue; type "shell\_call"constant"shell\_call"constant
The type of the item. Always `shell\_call`.
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) type>)
Optional\<String\> createdBy
The ID of the entity that created this tool call.
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) created_by>)
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema)>)
class ResponseFunctionShellToolCallOutput:
The output of a shell tool call that was emitted.
String id
The unique ID of the shell call output. Populated when this item is returned via API.
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) id>)
String callId
The unique ID of the shell tool call generated by the model.
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) call_id>)
Optional\<Long\> maxOutputLength
The maximum length of the shell command output. This is generated by the model and should be passed back with the raw output.
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) max_output_length>)
List\<Output\> output
An array of shell call output contents
Outcome outcome
Represents either an exit outcome (with an exit code) or a timeout outcome for a shell call output chunk.
One of the following:
JsonValue;
JsonValue; type "timeout"constant"timeout"constant
The outcome type. Always `timeout`.
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) output > (items) > (property) outcome > (variant) 0 > (property) type>)
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) output > (items) > (property) outcome > (variant) 0>)
class Exit:
Indicates that the shell commands finished and returned an exit code.
long exitCode
Exit code from the shell process.
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) output > (items) > (property) outcome > (variant) 1 > (property) exit_code>)
JsonValue; type "exit"constant"exit"constant
The outcome type. Always `exit`.
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) output > (items) > (property) outcome > (variant) 1 > (property) type>)
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) output > (items) > (property) outcome > (variant) 1>)
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) output > (items) > (property) outcome>)
String stderr
The standard error output that was captured.
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) output > (items) > (property) stderr>)
String stdout
The standard output that was captured.
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) output > (items) > (property) stdout>)
Optional\<String\> createdBy
The identifier of the actor that created the item.
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) output > (items) > (property) created_by>)
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) output>)
Status status
The status of the shell call output. One of `in\_progress`, `completed`, or `incomplete`.
One of the following:
IN\_PROGRESS("in\_progress")
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) status > (member) 0>)
COMPLETED("completed")
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) status > (member) 1>)
INCOMPLETE("incomplete")
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) status>)
JsonValue; type "shell\_call\_output"constant"shell\_call\_output"constant
The type of the shell call output. Always `shell\_call\_output`.
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) type>)
Optional\<String\> createdBy
The identifier of the actor that created the item.
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) created_by>)
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema)>)
class ResponseApplyPatchToolCall:
A tool call that applies file diffs by creating, deleting, or updating files.
String id
The unique ID of the apply patch tool call. Populated when this item is returned via API.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) id>)
String callId
The unique ID of the apply patch tool call generated by the model.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) call_id>)
Operation operation
One of the create\_file, delete\_file, or update\_file operations applied via apply\_patch.
One of the following:
class CreateFile:
Instruction describing how to create a file via the apply\_patch tool.
String diff
Diff to apply.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation > (variant) 0 > (property) diff>)
String path
Path of the file to create.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation > (variant) 0 > (property) path>)
JsonValue; type "create\_file"constant"create\_file"constant
Create a new file with the provided diff.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation > (variant) 0 > (property) type>)
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation > (variant) 0>)
class DeleteFile:
Instruction describing how to delete a file via the apply\_patch tool.
String path
Path of the file to delete.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation > (variant) 1 > (property) path>)
JsonValue; type "delete\_file"constant"delete\_file"constant
Delete the specified file.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation > (variant) 1 > (property) type>)
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation > (variant) 1>)
class UpdateFile:
Instruction describing how to update a file via the apply\_patch tool.
String diff
Diff to apply.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation > (variant) 2 > (property) diff>)
String path
Path of the file to update.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation > (variant) 2 > (property) path>)
JsonValue; type "update\_file"constant"update\_file"constant
Update an existing file with the provided diff.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation > (variant) 2 > (property) type>)
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation > (variant) 2>)
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation>)
Status status
The status of the apply patch tool call. One of `in\_progress` or `completed`.
One of the following:
IN\_PROGRESS("in\_progress")
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) status > (member) 0>)
COMPLETED("completed")
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) status > (member) 1>)
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) status>)
JsonValue; type "apply\_patch\_call"constant"apply\_patch\_call"constant
The type of the item. Always `apply\_patch\_call`.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) type>)
Optional\<String\> createdBy
The ID of the entity that created this tool call.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) created_by>)
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema)>)
class ResponseApplyPatchToolCallOutput:
The output emitted by an apply patch tool call.
String id
The unique ID of the apply patch tool call output. Populated when this item is returned via API.
[](<#(resource) responses > (model) response_apply_patch_tool_call_output > (schema) > (property) id>)
String callId
The unique ID of the apply patch tool call generated by the model.
[](<#(resource) responses > (model) response_apply_patch_tool_call_output > (schema) > (property) call_id>)
Status status
The status of the apply patch tool call output. One of `completed` or `failed`.
One of the following:
COMPLETED("completed")
[](<#(resource) responses > (model) response_apply_patch_tool_call_output > (schema) > (property) status > (member) 0>)
FAILED("failed")
[](<#(resource) responses > (model) response_apply_patch_tool_call_output > (schema) > (property) status > (member) 1>)
[](<#(resource) responses > (model) response_apply_patch_tool_call_output > (schema) > (property) status>)
JsonValue; type "apply\_patch\_call\_output"constant"apply\_patch\_call\_output"constant
The type of the item. Always `apply\_patch\_call\_output`.
[](<#(resource) responses > (model) response_apply_patch_tool_call_output > (schema) > (property) type>)
Optional\<String\> createdBy
The ID of the entity that created this tool call output.
[](<#(resource) responses > (model) response_apply_patch_tool_call_output > (schema) > (property) created_by>)
Optional\<String\> output
Optional textual output returned by the apply patch tool.
[](<#(resource) responses > (model) response_apply_patch_tool_call_output > (schema) > (property) output>)
[](<#(resource) responses > (model) response_apply_patch_tool_call_output > (schema)>)
McpListTools
String id
The unique ID of the list.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 19 > (property) id>)
String serverLabel
The label of the MCP server.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 19 > (property) server_label>)
List\<Tool\> tools
The tools available on the server.
JsonValue inputSchema
The JSON schema describing the tool’s input.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 19 > (property) tools > (items) > (property) input_schema>)
String name
The name of the tool.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 19 > (property) tools > (items) > (property) name>)
Optional\<JsonValue\> annotations
Additional annotations about the tool.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 19 > (property) tools > (items) > (property) annotations>)
Optional\<String\> description
The description of the tool.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 19 > (property) tools > (items) > (property) description>)
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 19 > (property) tools>)
JsonValue; type "mcp\_list\_tools"constant"mcp\_list\_tools"constant
The type of the item. Always `mcp\_list\_tools`.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 19 > (property) type>)
Optional\<String\> error
Error message if the server could not list tools.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 19 > (property) error>)
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 19>)
McpApprovalRequest
String id
The unique ID of the approval request.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 20 > (property) id>)
String arguments
A JSON string of arguments for the tool.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 20 > (property) arguments>)
String name
The name of the tool to run.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 20 > (property) name>)
String serverLabel
The label of the MCP server making the request.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 20 > (property) server_label>)
JsonValue; type "mcp\_approval\_request"constant"mcp\_approval\_request"constant
The type of the item. Always `mcp\_approval\_request`.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 20 > (property) type>)
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 20>)
McpApprovalResponse
String id
The unique ID of the approval response
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 21 > (property) id>)
String approvalRequestId
The ID of the approval request being answered.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 21 > (property) approval_request_id>)
boolean approve
Whether the request was approved.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 21 > (property) approve>)
JsonValue; type "mcp\_approval\_response"constant"mcp\_approval\_response"constant
The type of the item. Always `mcp\_approval\_response`.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 21 > (property) type>)
Optional\<String\> reason
Optional reason for the decision.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 21 > (property) reason>)
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 21>)
McpCall
String id
The unique ID of the tool call.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) id>)
String arguments
A JSON string of the arguments passed to the tool.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) arguments>)
String name
The name of the tool that was run.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) name>)
String serverLabel
The label of the MCP server running the tool.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) server_label>)
JsonValue; type "mcp\_call"constant"mcp\_call"constant
The type of the item. Always `mcp\_call`.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) type>)
Optional\<String\> approvalRequestId
Unique identifier for the MCP tool call approval request.
Include this value in a subsequent `mcp\_approval\_response` input to approve or reject the corresponding tool call.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) approval_request_id>)
Optional\<String\> error
The error from the tool call, if any.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) error>)
Optional\<String\> output
The output from the tool call.
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) output>)
Optional\<Status\> status
The status of the tool call. One of `in\_progress`, `completed`, `incomplete`, `calling`, or `failed`.
One of the following:
IN\_PROGRESS("in\_progress")
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) status > (member) 0>)
COMPLETED("completed")
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) status > (member) 1>)
INCOMPLETE("incomplete")
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) status > (member) 2>)
CALLING("calling")
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) status > (member) 3>)
FAILED("failed")
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) status > (member) 4>)
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22 > (property) status>)
[](<#(resource) conversations.items > (model) conversation_item > (schema) > (variant) 22>)
class ResponseCustomToolCall:
A call to a custom tool created by the model.
String callId
An identifier used to map this custom tool call to a tool call output.
[](<#(resource) responses > (model) response_custom_tool_call > (schema) > (property) call_id>)
String input
The input for the custom tool call generated by the model.
[](<#(resource) responses > (model) response_custom_tool_call > (schema) > (property) input>)
String name
The name of the custom tool being called.
[](<#(resource) responses > (model) response_custom_tool_call > (schema) > (property) name>)
JsonValue; type "custom\_tool\_call"constant"custom\_tool\_call"constant
The type of the custom tool call. Always `custom\_tool\_call`.
[](<#(resource) responses > (model) response_custom_tool_call > (schema) > (property) type>)
Optional\<String\> id
The unique ID of the custom tool call in the OpenAI platform.
[](<#(resource) responses > (model) response_custom_tool_call > (schema) > (property) id>)
Optional\<String\> namespace
The namespace of the custom tool being called.
[](<#(resource) responses > (model) response_custom_tool_call > (schema) > (property) namespace>)
[](<#(resource) responses > (model) response_custom_tool_call > (schema)>)
class ResponseCustomToolCallOutput:
The output of a custom tool call from your code, being sent back to the model.
String callId
The call ID, used to map this custom tool call output to a custom tool call.
[](<#(resource) responses > (model) response_custom_tool_call_output > (schema) > (property) call_id>)
Output output
The output from the custom tool call generated by your code.
Can be a string or an list of output content.
One of the following:
String
[](<#(resource) responses > (model) response_custom_tool_call_output > (schema) > (property) output > (variant) 0>)
List\<FunctionAndCustomToolCallOutput\>
One of the following:
class ResponseInputText:
A text input to the model.
String text
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
JsonValue; type "input\_text"constant"input\_text"constant
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
class ResponseInputImage:
An image input to the model. Learn about [image inputs](https://platform.openai.com/docs/guides/vision).
Detail detail
The detail level of the image to be sent to the model. One of `high`, `low`, `auto`, or `original`. Defaults to `auto`.
One of the following:
LOW("low")
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 0>)
HIGH("high")
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 1>)
AUTO("auto")
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 2>)
ORIGINAL("original")
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 3>)
[](<#(resource) responses > (model) response_input_image > (schema) > (property) detail>)
JsonValue; type "input\_image"constant"input\_image"constant
The type of the input item. Always `input\_image`.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) type>)
Optional\<String\> fileId
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) file_id>)
Optional\<String\> imageUrl
The URL of the image to be sent to the model. A fully qualified URL or base64 encoded image in a data URL.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) image_url>)
[](<#(resource) responses > (model) response_input_image > (schema)>)
class ResponseInputFile:
A file input to the model.
JsonValue; type "input\_file"constant"input\_file"constant
The type of the input item. Always `input\_file`.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) type>)
Optional\<Detail\> detail
The detail level of the file to be sent to the model. Use `low` for the default rendering behavior, or `high` to render the file at higher quality. Defaults to `low`.
One of the following:
LOW("low")
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 0>)
HIGH("high")
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 1>)
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail>)
Optional\<String\> fileData
The content of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_data>)
Optional\<String\> fileId
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_id>)
Optional\<String\> fileUrl
The URL of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_url>)
Optional\<String\> filename
The name of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) filename>)
[](<#(resource) responses > (model) response_input_file > (schema)>)
[](<#(resource) responses > (model) response_custom_tool_call_output > (schema) > (property) output > (variant) 1>)
[](<#(resource) responses > (model) response_custom_tool_call_output > (schema) > (property) output>)
JsonValue; type "custom\_tool\_call\_output"constant"custom\_tool\_call\_output"constant
The type of the custom tool call output. Always `custom\_tool\_call\_output`.
[](<#(resource) responses > (model) response_custom_tool_call_output > (schema) > (property) type>)
Optional\<String\> id
The unique ID of the custom tool call output in the OpenAI platform.
[](<#(resource) responses > (model) response_custom_tool_call_output > (schema) > (property) id>)
[](<#(resource) responses > (model) response_custom_tool_call_output > (schema)>)
[](<#(resource) conversations.items > (model) conversation_item > (schema)>)
### Retrieve an item
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
import com.openai.models.conversations.items.ConversationItem;
import com.openai.models.conversations.items.ItemRetrieveParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
ItemRetrieveParams params = ItemRetrieveParams.builder()
.conversationId("conv\_123")
.itemId("msg\_abc")
.build();
ConversationItem conversationItem = client.conversations().items().retrieve(params);
}
}`
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