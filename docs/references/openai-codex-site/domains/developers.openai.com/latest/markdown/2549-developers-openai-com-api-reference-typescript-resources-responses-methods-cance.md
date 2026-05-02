Cancel a response | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Responses](/api/reference/typescript/resources/responses)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Cancel a response
client.responses.cancel(stringresponseID, RequestOptionsoptions?): [Response](</api/reference/typescript/resources/responses#(resource) responses > (model) response > (schema)>) { id, created\_at, error, 29 more }
POST/responses/{response\_id}/cancel
Cancels a model response with the given ID. Only responses created with
the `background` parameter set to `true` can be cancelled.
[Learn more](https://platform.openai.com/docs/guides/background).
##### ParametersExpand Collapse
responseID: string
[](<#(resource) responses > (method) cancel > (params) default > (param) response_id > (schema)>)
##### ReturnsExpand Collapse
Response { id, created\_at, error, 29 more }
id: string
Unique identifier for this Response.
[](<#(resource) responses > (model) response > (schema) > (property) id>)
created\_at: number
Unix timestamp (in seconds) of when this Response was created.
formatunixtime
[](<#(resource) responses > (model) response > (schema) > (property) created_at>)
error: [ResponseError](</api/reference/typescript/resources/responses#(resource) responses > (model) response_error > (schema)>) { code, message } | null
An error object returned when the model fails to generate a Response.
code: "server\_error" | "rate\_limit\_exceeded" | "invalid\_prompt" | 15 more
The error code for the response.
One of the following:
"server\_error"
[](<#(resource) responses > (model) response > (schema) > (property) error + (resource) responses > (model) response_error > (schema) > (property) code > (member) 0>)
"rate\_limit\_exceeded"
[](<#(resource) responses > (model) response > (schema) > (property) error + (resource) responses > (model) response_error > (schema) > (property) code > (member) 1>)
"invalid\_prompt"
[](<#(resource) responses > (model) response > (schema) > (property) error + (resource) responses > (model) response_error > (schema) > (property) code > (member) 2>)
"vector\_store\_timeout"
[](<#(resource) responses > (model) response > (schema) > (property) error + (resource) responses > (model) response_error > (schema) > (property) code > (member) 3>)
"invalid\_image"
[](<#(resource) responses > (model) response > (schema) > (property) error + (resource) responses > (model) response_error > (schema) > (property) code > (member) 4>)
"invalid\_image\_format"
[](<#(resource) responses > (model) response > (schema) > (property) error + (resource) responses > (model) response_error > (schema) > (property) code > (member) 5>)
"invalid\_base64\_image"
[](<#(resource) responses > (model) response > (schema) > (property) error + (resource) responses > (model) response_error > (schema) > (property) code > (member) 6>)
"invalid\_image\_url"
[](<#(resource) responses > (model) response > (schema) > (property) error + (resource) responses > (model) response_error > (schema) > (property) code > (member) 7>)
"image\_too\_large"
[](<#(resource) responses > (model) response > (schema) > (property) error + (resource) responses > (model) response_error > (schema) > (property) code > (member) 8>)
"image\_too\_small"
[](<#(resource) responses > (model) response > (schema) > (property) error + (resource) responses > (model) response_error > (schema) > (property) code > (member) 9>)
"image\_parse\_error"
[](<#(resource) responses > (model) response > (schema) > (property) error + (resource) responses > (model) response_error > (schema) > (property) code > (member) 10>)
"image\_content\_policy\_violation"
[](<#(resource) responses > (model) response > (schema) > (property) error + (resource) responses > (model) response_error > (schema) > (property) code > (member) 11>)
"invalid\_image\_mode"
[](<#(resource) responses > (model) response > (schema) > (property) error + (resource) responses > (model) response_error > (schema) > (property) code > (member) 12>)
"image\_file\_too\_large"
[](<#(resource) responses > (model) response > (schema) > (property) error + (resource) responses > (model) response_error > (schema) > (property) code > (member) 13>)
"unsupported\_image\_media\_type"
[](<#(resource) responses > (model) response > (schema) > (property) error + (resource) responses > (model) response_error > (schema) > (property) code > (member) 14>)
"empty\_image\_file"
[](<#(resource) responses > (model) response > (schema) > (property) error + (resource) responses > (model) response_error > (schema) > (property) code > (member) 15>)
"failed\_to\_download\_image"
[](<#(resource) responses > (model) response > (schema) > (property) error + (resource) responses > (model) response_error > (schema) > (property) code > (member) 16>)
"image\_file\_not\_found"
[](<#(resource) responses > (model) response > (schema) > (property) error + (resource) responses > (model) response_error > (schema) > (property) code > (member) 17>)
[](<#(resource) responses > (model) response > (schema) > (property) error + (resource) responses > (model) response_error > (schema) > (property) code>)
message: string
A human-readable description of the error.
[](<#(resource) responses > (model) response > (schema) > (property) error + (resource) responses > (model) response_error > (schema) > (property) message>)
[](<#(resource) responses > (model) response > (schema) > (property) error>)
incomplete\_details: IncompleteDetails | null
Details about why the response is incomplete.
reason?: "max\_output\_tokens" | "content\_filter"
The reason why the response is incomplete.
One of the following:
"max\_output\_tokens"
[](<#(resource) responses > (model) response > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
"content\_filter"
[](<#(resource) responses > (model) response > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
[](<#(resource) responses > (model) response > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) responses > (model) response > (schema) > (property) incomplete_details>)
instructions: string | Array\<[ResponseInputItem](</api/reference/typescript/resources/responses#(resource) responses > (model) response_input_item > (schema)>)\> | null
A system (or developer) message inserted into the model’s context.
When using along with `previous\_response\_id`, the instructions from a previous
response will not be carried over to the next response. This makes it simple
to swap out system (or developer) messages in new responses.
One of the following:
string
[](<#(resource) responses > (model) response > (schema) > (property) instructions > (variant) 0>)
Array\<[ResponseInputItem](</api/reference/typescript/resources/responses#(resource) responses > (model) response_input_item > (schema)>)\>
EasyInputMessage { content, role, phase, type }
A message input to the model with a role indicating instruction following
hierarchy. Instructions given with the `developer` or `system` role take
precedence over instructions given with the `user` role. Messages with the
`assistant` role are presumed to have been generated by the model in previous
interactions.
content: string | [ResponseInputMessageContentList](</api/reference/typescript/resources/responses#(resource) responses > (model) response_input_message_content_list > (schema)>) { , , }
Text, image, or audio input to the model, used to generate a response.
Can also contain previous assistant responses.
One of the following:
string
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) content > (variant) 0>)
ResponseInputMessageContentList = Array\<[ResponseInputContent](</api/reference/typescript/resources/responses#(resource) responses > (model) response_input_content > (schema)>)\>
A list of one or many input items to the model, containing different content
types.
One of the following:
ResponseInputText { text, type }
A text input to the model.
text: string
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
type: "input\_text"
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
ResponseInputImage { detail, type, file\_id, image\_url }
An image input to the model. Learn about [image inputs](https://platform.openai.com/docs/guides/vision).
detail: "low" | "high" | "auto" | "original"
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
file\_id?: string | null
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) file_id>)
image\_url?: string | null
The URL of the image to be sent to the model. A fully qualified URL or base64 encoded image in a data URL.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) image_url>)
[](<#(resource) responses > (model) response_input_image > (schema)>)
ResponseInputFile { type, detail, file\_data, 3 more }
A file input to the model.
type: "input\_file"
The type of the input item. Always `input\_file`.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) type>)
detail?: "low" | "high"
The detail level of the file to be sent to the model. Use `low` for the default rendering behavior, or `high` to render the file at higher quality. Defaults to `low`.
One of the following:
"low"
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 0>)
"high"
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 1>)
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail>)
file\_data?: string
The content of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_data>)
file\_id?: string | null
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_id>)
file\_url?: string
The URL of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_url>)
filename?: string
The name of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) filename>)
[](<#(resource) responses > (model) response_input_file > (schema)>)
[](<#(resource) responses > (model) response_input_message_content_list > (schema)>)
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) content>)
role: "user" | "assistant" | "system" | "developer"
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
phase?: "commentary" | "final\_answer" | null
Labels an `assistant` message as intermediate commentary (`commentary`) or the final answer (`final\_answer`).
For models like `gpt-5.3-codex` and beyond, when sending follow-up requests, preserve and resend
phase on all assistant messages — dropping it can degrade performance. Not used for user messages.
One of the following:
"commentary"
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) phase > (member) 0>)
"final\_answer"
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) phase > (member) 1>)
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) phase>)
type?: "message"
The type of the message input. Always `message`.
[](<#(resource) responses > (model) easy_input_message > (schema) > (property) type>)
[](<#(resource) responses > (model) easy_input_message > (schema)>)
Message { content, role, status, type }
A message input to the model with a role indicating instruction following
hierarchy. Instructions given with the `developer` or `system` role take
precedence over instructions given with the `user` role.
content: [ResponseInputMessageContentList](</api/reference/typescript/resources/responses#(resource) responses > (model) response_input_message_content_list > (schema)>) { , , }
A list of one or many input items to the model, containing different content
types.
One of the following:
ResponseInputText { text, type }
A text input to the model.
text: string
The text input to the model.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 1 > (property) content + (resource) responses > (model) response_input_text > (schema) > (property) text>)
type: "input\_text"
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 1 > (property) content + (resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 1 > (property) content + (resource) responses > (model) response_input_text > (schema)>)
ResponseInputImage { detail, type, file\_id, image\_url }
An image input to the model. Learn about [image inputs](https://platform.openai.com/docs/guides/vision).
detail: "low" | "high" | "auto" | "original"
The detail level of the image to be sent to the model. One of `high`, `low`, `auto`, or `original`. Defaults to `auto`.
One of the following:
"low"
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 1 > (property) content + (resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 0>)
"high"
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 1 > (property) content + (resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 1>)
"auto"
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 1 > (property) content + (resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 2>)
"original"
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 1 > (property) content + (resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 3>)
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 1 > (property) content + (resource) responses > (model) response_input_image > (schema) > (property) detail>)
type: "input\_image"
The type of the input item. Always `input\_image`.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 1 > (property) content + (resource) responses > (model) response_input_image > (schema) > (property) type>)
file\_id?: string | null
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 1 > (property) content + (resource) responses > (model) response_input_image > (schema) > (property) file_id>)
image\_url?: string | null
The URL of the image to be sent to the model. A fully qualified URL or base64 encoded image in a data URL.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 1 > (property) content + (resource) responses > (model) response_input_image > (schema) > (property) image_url>)
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 1 > (property) content + (resource) responses > (model) response_input_image > (schema)>)
ResponseInputFile { type, detail, file\_data, 3 more }
A file input to the model.
type: "input\_file"
The type of the input item. Always `input\_file`.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 1 > (property) content + (resource) responses > (model) response_input_file > (schema) > (property) type>)
detail?: "low" | "high"
The detail level of the file to be sent to the model. Use `low` for the default rendering behavior, or `high` to render the file at higher quality. Defaults to `low`.
One of the following:
"low"
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 1 > (property) content + (resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 0>)
"high"
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 1 > (property) content + (resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 1>)
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 1 > (property) content + (resource) responses > (model) response_input_file > (schema) > (property) detail>)
file\_data?: string
The content of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 1 > (property) content + (resource) responses > (model) response_input_file > (schema) > (property) file_data>)
file\_id?: string | null
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 1 > (property) content + (resource) responses > (model) response_input_file > (schema) > (property) file_id>)
file\_url?: string
The URL of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 1 > (property) content + (resource) responses > (model) response_input_file > (schema) > (property) file_url>)
filename?: string
The name of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 1 > (property) content + (resource) responses > (model) response_input_file > (schema) > (property) filename>)
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 1 > (property) content + (resource) responses > (model) response_input_file > (schema)>)
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 1 > (property) content>)
role: "user" | "system" | "developer"
The role of the message input. One of `user`, `system`, or `developer`.
One of the following:
"user"
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 1 > (property) role > (member) 0>)
"system"
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 1 > (property) role > (member) 1>)
"developer"
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 1 > (property) role > (member) 2>)
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 1 > (property) role>)
status?: "in\_progress" | "completed" | "incomplete"
The status of item. One of `in\_progress`, `completed`, or
`incomplete`. Populated when items are returned via API.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 1 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 1 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 1 > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 1 > (property) status>)
type?: "message"
The type of the message input. Always set to `message`.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 1 > (property) type>)
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 1>)
ResponseOutputMessage { id, content, role, 3 more }
An output message from the model.
id: string
The unique ID of the output message.
[](<#(resource) responses > (model) response_output_message > (schema) > (property) id>)
content: Array\<[ResponseOutputText](</api/reference/typescript/resources/responses#(resource) responses > (model) response_output_text > (schema)>) { annotations, text, type, logprobs } | [ResponseOutputRefusal](</api/reference/typescript/resources/responses#(resource) responses > (model) response_output_refusal > (schema)>) { refusal, type } \>
The content of the output message.
One of the following:
ResponseOutputText { annotations, text, type, logprobs }
A text output from the model.
annotations: Array\<FileCitation { file\_id, filename, index, type } | URLCitation { end\_index, start\_index, title, 2 more } | ContainerFileCitation { container\_id, end\_index, file\_id, 3 more } | FilePath { file\_id, index, type } \>
The annotations of the text output.
One of the following:
FileCitation { file\_id, filename, index, type }
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
URLCitation { end\_index, start\_index, title, 2 more }
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
ContainerFileCitation { container\_id, end\_index, file\_id, 3 more }
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
FilePath { file\_id, index, type }
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
text: string
The text output from the model.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) text>)
type: "output\_text"
The type of the output text. Always `output\_text`.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) type>)
logprobs?: Array\<Logprob\>
token: string
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) token>)
bytes: Array\<number\>
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) bytes>)
logprob: number
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) logprob>)
top\_logprobs: Array\<TopLogprob\>
token: string
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) top_logprobs > (items) > (property) token>)
bytes: Array\<number\>
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) top_logprobs > (items) > (property) bytes>)
logprob: number
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) top_logprobs > (items) > (property) logprob>)
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) top_logprobs>)
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs>)
[](<#(resource) responses > (model) response_output_text > (schema)>)
ResponseOutputRefusal { refusal, type }
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
status: "in\_progress" | "completed" | "incomplete"
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
phase?: "commentary" | "final\_answer" | null
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
ResponseFileSearchToolCall { id, queries, status, 2 more }
The results of a file search tool call. See the
[file search guide](https://platform.openai.com/docs/guides/tools-file-search) for more information.
id: string
The unique ID of the file search tool call.
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) id>)
queries: Array\<string\>
The queries used to search for files.
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) queries>)
status: "in\_progress" | "searching" | "completed" | 2 more
The status of the file search tool call. One of `in\_progress`,
`searching`, `incomplete` or `failed`,
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) status > (member) 0>)
"searching"
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) status > (member) 1>)
"completed"
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) status > (member) 2>)
"incomplete"
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) status > (member) 3>)
"failed"
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) status > (member) 4>)
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) status>)
type: "file\_search\_call"
The type of the file search tool call. Always `file\_search\_call`.
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) type>)
results?: Array\<Result\> | null
The results of the file search tool call.
attributes?: Record\<string, string | number | boolean\> | null
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard. Keys are strings
with a maximum length of 64 characters. Values are strings with a maximum
length of 512 characters, booleans, or numbers.
One of the following:
string
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) results > (items) > (property) attributes > (items) > (variant) 0>)
number
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) results > (items) > (property) attributes > (items) > (variant) 1>)
boolean
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) results > (items) > (property) attributes > (items) > (variant) 2>)
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) results > (items) > (property) attributes>)
file\_id?: string
The unique ID of the file.
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) results > (items) > (property) file_id>)
filename?: string
The name of the file.
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) results > (items) > (property) filename>)
score?: number
The relevance score of the file - a value between 0 and 1.
formatfloat
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) results > (items) > (property) score>)
text?: string
The text that was retrieved from the file.
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) results > (items) > (property) text>)
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) results>)
[](<#(resource) responses > (model) response_file_search_tool_call > (schema)>)
ResponseComputerToolCall { id, call\_id, pending\_safety\_checks, 4 more }
A tool call to a computer use tool. See the
[computer use guide](https://platform.openai.com/docs/guides/tools-computer-use) for more information.
id: string
The unique ID of the computer call.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) id>)
call\_id: string
An identifier used when responding to the tool call with output.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) call_id>)
pending\_safety\_checks: Array\<PendingSafetyCheck\>
The pending safety checks for the computer call.
id: string
The ID of the pending safety check.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) pending_safety_checks > (items) > (property) id>)
code?: string | null
The type of the pending safety check.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) pending_safety_checks > (items) > (property) code>)
message?: string | null
Details about the pending safety check.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) pending_safety_checks > (items) > (property) message>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) pending_safety_checks>)
status: "in\_progress" | "completed" | "incomplete"
The status of the item. One of `in\_progress`, `completed`, or
`incomplete`. Populated when items are returned via API.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) status>)
type: "computer\_call"
The type of the computer call. Always `computer\_call`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) type>)
action?: Click { button, type, x, 2 more } | DoubleClick { keys, type, x, y } | Drag { path, type, keys } | 6 more
A click action.
One of the following:
Click { button, type, x, 2 more }
A click action.
button: "left" | "right" | "wheel" | 2 more
Indicates which mouse button was pressed during the click. One of `left`, `right`, `wheel`, `back`, or `forward`.
One of the following:
"left"
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) button > (member) 0>)
"right"
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) button > (member) 1>)
"wheel"
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) button > (member) 2>)
"back"
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) button > (member) 3>)
"forward"
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) button > (member) 4>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) button>)
type: "click"
Specifies the event type. For a click action, this property is always `click`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) type>)
x: number
The x-coordinate where the click occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) x>)
y: number
The y-coordinate where the click occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) y>)
keys?: Array\<string\> | null
The keys being held while clicking.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) keys>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0>)
DoubleClick { keys, type, x, y }
A double click action.
keys: Array\<string\> | null
The keys being held while double-clicking.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 1 > (property) keys>)
type: "double\_click"
Specifies the event type. For a double click action, this property is always set to `double\_click`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 1 > (property) type>)
x: number
The x-coordinate where the double click occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 1 > (property) x>)
y: number
The y-coordinate where the double click occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 1 > (property) y>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 1>)
Drag { path, type, keys }
A drag action.
path: Array\<Path\>
An array of coordinates representing the path of the drag action. Coordinates will appear as an array of objects, eg
```
`[
{ x: 100, y: 200 },
{ x: 200, y: 300 }
]`
```
x: number
The x-coordinate.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 2 > (property) path > (items) > (property) x>)
y: number
The y-coordinate.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 2 > (property) path > (items) > (property) y>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 2 > (property) path>)
type: "drag"
Specifies the event type. For a drag action, this property is always set to `drag`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 2 > (property) type>)
keys?: Array\<string\> | null
The keys being held while dragging the mouse.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 2 > (property) keys>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 2>)
Keypress { keys, type }
A collection of keypresses the model would like to perform.
keys: Array\<string\>
The combination of keys the model is requesting to be pressed. This is an array of strings, each representing a key.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 3 > (property) keys>)
type: "keypress"
Specifies the event type. For a keypress action, this property is always set to `keypress`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 3 > (property) type>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 3>)
Move { type, x, y, keys }
A mouse move action.
type: "move"
Specifies the event type. For a move action, this property is always set to `move`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 4 > (property) type>)
x: number
The x-coordinate to move to.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 4 > (property) x>)
y: number
The y-coordinate to move to.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 4 > (property) y>)
keys?: Array\<string\> | null
The keys being held while moving the mouse.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 4 > (property) keys>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 4>)
Screenshot { type }
A screenshot action.
type: "screenshot"
Specifies the event type. For a screenshot action, this property is always set to `screenshot`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 5 > (property) type>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 5>)
Scroll { scroll\_x, scroll\_y, type, 3 more }
A scroll action.
scroll\_x: number
The horizontal scroll distance.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 6 > (property) scroll_x>)
scroll\_y: number
The vertical scroll distance.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 6 > (property) scroll_y>)
type: "scroll"
Specifies the event type. For a scroll action, this property is always set to `scroll`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 6 > (property) type>)
x: number
The x-coordinate where the scroll occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 6 > (property) x>)
y: number
The y-coordinate where the scroll occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 6 > (property) y>)
keys?: Array\<string\> | null
The keys being held while scrolling.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 6 > (property) keys>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 6>)
Type { text, type }
An action to type in text.
text: string
The text to type.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 7 > (property) text>)
type: "type"
Specifies the event type. For a type action, this property is always set to `type`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 7 > (property) type>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 7>)
Wait { type }
A wait action.
type: "wait"
Specifies the event type. For a wait action, this property is always set to `wait`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 8 > (property) type>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 8>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action>)
actions?: [ComputerActionList](</api/reference/typescript/resources/responses#(resource) responses > (model) computer_action_list > (schema)>) { , , , 6 more }
Flattened batched actions for `computer\_use`. Each action includes an
`type` discriminator and action-specific fields.
One of the following:
Click { button, type, x, 2 more }
A click action.
button: "left" | "right" | "wheel" | 2 more
Indicates which mouse button was pressed during the click. One of `left`, `right`, `wheel`, `back`, or `forward`.
One of the following:
"left"
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) button > (member) 0>)
"right"
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) button > (member) 1>)
"wheel"
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) button > (member) 2>)
"back"
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) button > (member) 3>)
"forward"
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) button > (member) 4>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) button>)
type: "click"
Specifies the event type. For a click action, this property is always `click`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) type>)
x: number
The x-coordinate where the click occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) x>)
y: number
The y-coordinate where the click occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) y>)
keys?: Array\<string\> | null
The keys being held while clicking.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) keys>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0>)
DoubleClick { keys, type, x, y }
A double click action.
keys: Array\<string\> | null
The keys being held while double-clicking.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 1 > (property) keys>)
type: "double\_click"
Specifies the event type. For a double click action, this property is always set to `double\_click`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 1 > (property) type>)
x: number
The x-coordinate where the double click occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 1 > (property) x>)
y: number
The y-coordinate where the double click occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 1 > (property) y>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 1>)
Drag { path, type, keys }
A drag action.
path: Array\<Path\>
An array of coordinates representing the path of the drag action. Coordinates will appear as an array of objects, eg
```
`[
{ x: 100, y: 200 },
{ x: 200, y: 300 }
]`
```
x: number
The x-coordinate.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 2 > (property) path > (items) > (property) x>)
y: number
The y-coordinate.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 2 > (property) path > (items) > (property) y>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 2 > (property) path>)
type: "drag"
Specifies the event type. For a drag action, this property is always set to `drag`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 2 > (property) type>)
keys?: Array\<string\> | null
The keys being held while dragging the mouse.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 2 > (property) keys>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 2>)
Keypress { keys, type }
A collection of keypresses the model would like to perform.
keys: Array\<string\>
The combination of keys the model is requesting to be pressed. This is an array of strings, each representing a key.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 3 > (property) keys>)
type: "keypress"
Specifies the event type. For a keypress action, this property is always set to `keypress`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 3 > (property) type>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 3>)
Move { type, x, y, keys }
A mouse move action.
type: "move"
Specifies the event type. For a move action, this property is always set to `move`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 4 > (property) type>)
x: number
The x-coordinate to move to.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 4 > (property) x>)
y: number
The y-coordinate to move to.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 4 > (property) y>)
keys?: Array\<string\> | null
The keys being held while moving the mouse.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 4 > (property) keys>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 4>)
Screenshot { type }
A screenshot action.
type: "screenshot"
Specifies the event type. For a screenshot action, this property is always set to `screenshot`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 5 > (property) type>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 5>)
Scroll { scroll\_x, scroll\_y, type, 3 more }
A scroll action.
scroll\_x: number
The horizontal scroll distance.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 6 > (property) scroll_x>)
scroll\_y: number
The vertical scroll distance.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 6 > (property) scroll_y>)
type: "scroll"
Specifies the event type. For a scroll action, this property is always set to `scroll`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 6 > (property) type>)
x: number
The x-coordinate where the scroll occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 6 > (property) x>)
y: number
The y-coordinate where the scroll occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 6 > (property) y>)
keys?: Array\<string\> | null
The keys being held while scrolling.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 6 > (property) keys>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 6>)
Type { text, type }
An action to type in text.
text: string
The text to type.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 7 > (property) text>)
type: "type"
Specifies the event type. For a type action, this property is always set to `type`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 7 > (property) type>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 7>)
Wait { type }
A wait action.
type: "wait"
Specifies the event type. For a wait action, this property is always set to `wait`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 8 > (property) type>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 8>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema)>)
ComputerCallOutput { call\_id, output, type, 3 more }
The output of a computer tool call.
call\_id: string
The ID of the computer tool call that produced the output.
maxLength64
minLength1
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 5 > (property) call_id>)
output: [ResponseComputerToolCallOutputScreenshot](</api/reference/typescript/resources/responses#(resource) responses > (model) response_computer_tool_call_output_screenshot > (schema)>) { type, file\_id, image\_url }
A computer screenshot image used with the computer use tool.
type: "computer\_screenshot"
Specifies the event type. For a computer screenshot, this property is
always set to `computer\_screenshot`.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 5 > (property) output + (resource) responses > (model) response_computer_tool_call_output_screenshot > (schema) > (property) type>)
file\_id?: string
The identifier of an uploaded file that contains the screenshot.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 5 > (property) output + (resource) responses > (model) response_computer_tool_call_output_screenshot > (schema) > (property) file_id>)
image\_url?: string
The URL of the screenshot image.
formaturi
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 5 > (property) output + (resource) responses > (model) response_computer_tool_call_output_screenshot > (schema) > (property) image_url>)
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 5 > (property) output>)
type: "computer\_call\_output"
The type of the computer tool call output. Always `computer\_call\_output`.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 5 > (property) type>)
id?: string | null
The ID of the computer tool call output.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 5 > (property) id>)
acknowledged\_safety\_checks?: Array\<AcknowledgedSafetyCheck\> | null
The safety checks reported by the API that have been acknowledged by the developer.
id: string
The ID of the pending safety check.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 5 > (property) acknowledged_safety_checks > (items) > (property) id>)
code?: string | null
The type of the pending safety check.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 5 > (property) acknowledged_safety_checks > (items) > (property) code>)
message?: string | null
Details about the pending safety check.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 5 > (property) acknowledged_safety_checks > (items) > (property) message>)
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 5 > (property) acknowledged_safety_checks>)
status?: "in\_progress" | "completed" | "incomplete" | null
The status of the message input. One of `in\_progress`, `completed`, or `incomplete`. Populated when input items are returned via API.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 5 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 5 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 5 > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 5 > (property) status>)
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 5>)
ResponseFunctionWebSearch { id, action, status, type }
The results of a web search tool call. See the
[web search guide](https://platform.openai.com/docs/guides/tools-web-search) for more information.
id: string
The unique ID of the web search tool call.
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) id>)
action: Search { query, type, queries, sources } | OpenPage { type, url } | FindInPage { pattern, type, url }
An object describing the specific action taken in this web search call.
Includes details on how the model used the web (search, open\_page, find\_in\_page).
One of the following:
Search { query, type, queries, sources }
Action type “search” - Performs a web search query.
query: string
[DEPRECATED] The search query.
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 0 > (property) query>)
type: "search"
The action type.
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 0 > (property) type>)
queries?: Array\<string\>
The search queries.
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 0 > (property) queries>)
sources?: Array\<Source\>
The sources used in the search.
type: "url"
The type of source. Always `url`.
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 0 > (property) sources > (items) > (property) type>)
url: string
The URL of the source.
formaturi
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 0 > (property) sources > (items) > (property) url>)
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 0 > (property) sources>)
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 0>)
OpenPage { type, url }
Action type “open\_page” - Opens a specific URL from search results.
type: "open\_page"
The action type.
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 1 > (property) type>)
url?: string | null
The URL opened by the model.
formaturi
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 1 > (property) url>)
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 1>)
FindInPage { pattern, type, url }
Action type “find\_in\_page”: Searches for a pattern within a loaded page.
pattern: string
The pattern or text to search for within the page.
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 2 > (property) pattern>)
type: "find\_in\_page"
The action type.
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 2 > (property) type>)
url: string
The URL of the page searched for the pattern.
formaturi
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 2 > (property) url>)
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 2>)
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action>)
status: "in\_progress" | "searching" | "completed" | "failed"
The status of the web search tool call.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) status > (member) 0>)
"searching"
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) status > (member) 1>)
"completed"
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) status > (member) 2>)
"failed"
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) status > (member) 3>)
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) status>)
type: "web\_search\_call"
The type of the web search tool call. Always `web\_search\_call`.
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) type>)
[](<#(resource) responses > (model) response_function_web_search > (schema)>)
ResponseFunctionToolCall { arguments, call\_id, name, 4 more }
A tool call to run a function. See the
[function calling guide](https://platform.openai.com/docs/guides/function-calling) for more information.
arguments: string
A JSON string of the arguments to pass to the function.
[](<#(resource) responses > (model) response_function_tool_call > (schema) > (property) arguments>)
call\_id: string
The unique ID of the function tool call generated by the model.
[](<#(resource) responses > (model) response_function_tool_call > (schema) > (property) call_id>)
name: string
The name of the function to run.
[](<#(resource) responses > (model) response_function_tool_call > (schema) > (property) name>)
type: "function\_call"
The type of the function tool call. Always `function\_call`.
[](<#(resource) responses > (model) response_function_tool_call > (schema) > (property) type>)
id?: string
The unique ID of the function tool call.
[](<#(resource) responses > (model) response_function_tool_call > (schema) > (property) id>)
namespace?: string
The namespace of the function to run.
[](<#(resource) responses > (model) response_function_tool_call > (schema) > (property) namespace>)
status?: "in\_progress" | "completed" | "incomplete"
The status of the item. One of `in\_progress`, `completed`, or
`incomplete`. Populated when items are returned via API.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_function_tool_call > (schema) > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) response_function_tool_call > (schema) > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) response_function_tool_call > (schema) > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_function_tool_call > (schema) > (property) status>)
[](<#(resource) responses > (model) response_function_tool_call > (schema)>)
FunctionCallOutput { call\_id, output, type, 2 more }
The output of a function tool call.
call\_id: string
The unique ID of the function tool call generated by the model.
maxLength64
minLength1
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 8 > (property) call_id>)
output: string | [ResponseFunctionCallOutputItemList](</api/reference/typescript/resources/responses#(resource) responses > (model) response_function_call_output_item_list > (schema)>) { , , }
Text, image, or file output of the function tool call.
One of the following:
string
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 8 > (property) output > (variant) 0>)
ResponseFunctionCallOutputItemList = Array\<[ResponseFunctionCallOutputItem](</api/reference/typescript/resources/responses#(resource) responses > (model) response_function_call_output_item > (schema)>)\>
An array of content outputs (text, image, file) for the function tool call.
One of the following:
ResponseInputTextContent { text, type }
A text input to the model.
text: string
The text input to the model.
maxLength10485760
[](<#(resource) responses > (model) response_input_text_content > (schema) > (property) text>)
type: "input\_text"
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text_content > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text_content > (schema)>)
ResponseInputImageContent { type, detail, file\_id, image\_url }
An image input to the model. Learn about [image inputs](https://platform.openai.com/docs/guides/vision)
type: "input\_image"
The type of the input item. Always `input\_image`.
[](<#(resource) responses > (model) response_input_image_content > (schema) > (property) type>)
detail?: "low" | "high" | "auto" | "original" | null
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
file\_id?: string | null
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_image_content > (schema) > (property) file_id>)
image\_url?: string | null
The URL of the image to be sent to the model. A fully qualified URL or base64 encoded image in a data URL.
maxLength20971520
[](<#(resource) responses > (model) response_input_image_content > (schema) > (property) image_url>)
[](<#(resource) responses > (model) response_input_image_content > (schema)>)
ResponseInputFileContent { type, detail, file\_data, 3 more }
A file input to the model.
type: "input\_file"
The type of the input item. Always `input\_file`.
[](<#(resource) responses > (model) response_input_file_content > (schema) > (property) type>)
detail?: "low" | "high"
The detail level of the file to be sent to the model. Use `low` for the default rendering behavior, or `high` to render the file at higher quality. Defaults to `low`.
One of the following:
"low"
[](<#(resource) responses > (model) response_input_file_content > (schema) > (property) detail > (member) 0>)
"high"
[](<#(resource) responses > (model) response_input_file_content > (schema) > (property) detail > (member) 1>)
[](<#(resource) responses > (model) response_input_file_content > (schema) > (property) detail>)
file\_data?: string | null
The base64-encoded data of the file to be sent to the model.
maxLength73400320
[](<#(resource) responses > (model) response_input_file_content > (schema) > (property) file_data>)
file\_id?: string | null
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file_content > (schema) > (property) file_id>)
file\_url?: string | null
The URL of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file_content > (schema) > (property) file_url>)
filename?: string | null
The name of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file_content > (schema) > (property) filename>)
[](<#(resource) responses > (model) response_input_file_content > (schema)>)
[](<#(resource) responses > (model) response_function_call_output_item_list > (schema)>)
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 8 > (property) output>)
type: "function\_call\_output"
The type of the function tool call output. Always `function\_call\_output`.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 8 > (property) type>)
id?: string | null
The unique ID of the function tool call output. Populated when this item is returned via API.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 8 > (property) id>)
status?: "in\_progress" | "completed" | "incomplete" | null
The status of the item. One of `in\_progress`, `completed`, or `incomplete`. Populated when items are returned via API.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 8 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 8 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 8 > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 8 > (property) status>)
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 8>)
ToolSearchCall { arguments, type, id, 3 more }
arguments: unknown
The arguments supplied to the tool search call.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 9 > (property) arguments>)
type: "tool\_search\_call"
The item type. Always `tool\_search\_call`.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 9 > (property) type>)
id?: string | null
The unique ID of this tool search call.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 9 > (property) id>)
call\_id?: string | null
The unique ID of the tool search call generated by the model.
maxLength64
minLength1
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 9 > (property) call_id>)
execution?: "server" | "client"
Whether tool search was executed by the server or by the client.
One of the following:
"server"
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 9 > (property) execution > (member) 0>)
"client"
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 9 > (property) execution > (member) 1>)
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 9 > (property) execution>)
status?: "in\_progress" | "completed" | "incomplete" | null
The status of the tool search call.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 9 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 9 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 9 > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 9 > (property) status>)
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 9>)
ResponseToolSearchOutputItemParam { tools, type, id, 3 more }
tools: Array\<[Tool](</api/reference/typescript/resources/responses#(resource) responses > (model) tool > (schema)>)\>
The loaded tool definitions returned by the tool search output.
One of the following:
FunctionTool { name, parameters, strict, 3 more }
Defines a function in your own code the model can choose to call. Learn more about [function calling](https://platform.openai.com/docs/guides/function-calling).
name: string
The name of the function to call.
[](<#(resource) responses > (model) function_tool > (schema) > (property) name>)
parameters: Record\<string, unknown\> | null
A JSON schema object describing the parameters of the function.
[](<#(resource) responses > (model) function_tool > (schema) > (property) parameters>)
strict: boolean | null
Whether to enforce strict parameter validation. Default `true`.
[](<#(resource) responses > (model) function_tool > (schema) > (property) strict>)
type: "function"
The type of the function tool. Always `function`.
[](<#(resource) responses > (model) function_tool > (schema) > (property) type>)
defer\_loading?: boolean
Whether this function is deferred and loaded via tool search.
[](<#(resource) responses > (model) function_tool > (schema) > (property) defer_loading>)
description?: string | null
A description of the function. Used by the model to determine whether or not to call the function.
[](<#(resource) responses > (model) function_tool > (schema) > (property) description>)
[](<#(resource) responses > (model) function_tool > (schema)>)
FileSearchTool { type, vector\_store\_ids, filters, 2 more }
A tool that searches for relevant content from uploaded files. Learn more about the [file search tool](https://platform.openai.com/docs/guides/tools-file-search).
type: "file\_search"
The type of the file search tool. Always `file\_search`.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) type>)
vector\_store\_ids: Array\<string\>
The IDs of the vector stores to search.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) vector_store_ids>)
filters?: [ComparisonFilter](</api/reference/typescript/resources/$shared#(resource) $shared > (model) comparison_filter > (schema)>) { key, type, value } | [CompoundFilter](</api/reference/typescript/resources/$shared#(resource) $shared > (model) compound_filter > (schema)>) { filters, type } | null
A filter to apply.
One of the following:
ComparisonFilter { key, type, value }
A filter used to compare a specified attribute key to a given value using a defined comparison operation.
key: string
The key to compare against the value.
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) key>)
type: "eq" | "ne" | "gt" | 5 more
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
value: string | number | boolean | Array\<string | number\>
The value to compare against the attribute key; supports string, number, or boolean types.
One of the following:
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 0>)
number
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 1>)
boolean
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 2>)
Array\<string | number\>
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 0>)
number
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 1>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value>)
[](<#(resource) $shared > (model) comparison_filter > (schema)>)
CompoundFilter { filters, type }
Combine multiple filters using `and` or `or`.
filters: Array\<[ComparisonFilter](</api/reference/typescript/resources/$shared#(resource) $shared > (model) comparison_filter > (schema)>) { key, type, value } | unknown\>
Array of filters to combine. Items can be `ComparisonFilter` or `CompoundFilter`.
One of the following:
ComparisonFilter { key, type, value }
A filter used to compare a specified attribute key to a given value using a defined comparison operation.
key: string
The key to compare against the value.
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) key>)
type: "eq" | "ne" | "gt" | 5 more
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
value: string | number | boolean | Array\<string | number\>
The value to compare against the attribute key; supports string, number, or boolean types.
One of the following:
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 0>)
number
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 1>)
boolean
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 2>)
Array\<string | number\>
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
type: "and" | "or"
Type of operation: `and` or `or`.
One of the following:
"and"
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type > (member) 0>)
"or"
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type > (member) 1>)
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type>)
[](<#(resource) $shared > (model) compound_filter > (schema)>)
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) filters>)
max\_num\_results?: number
The maximum number of results to return. This number should be between 1 and 50 inclusive.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) max_num_results>)
ranking\_options?: RankingOptions { hybrid\_search, ranker, score\_threshold }
Ranking options for search.
hybrid\_search?: HybridSearch { embedding\_weight, text\_weight }
Weights that control how reciprocal rank fusion balances semantic embedding matches versus sparse keyword matches when hybrid search is enabled.
embedding\_weight: number
The weight of the embedding in the reciprocal ranking fusion.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) hybrid_search > (property) embedding_weight>)
text\_weight: number
The weight of the text in the reciprocal ranking fusion.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) hybrid_search > (property) text_weight>)
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) hybrid_search>)
ranker?: "auto" | "default-2024-11-15"
The ranker to use for the file search.
One of the following:
"auto"
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) ranker > (member) 0>)
"default-2024-11-15"
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) ranker>)
score\_threshold?: number
The score threshold for the file search, a number between 0 and 1. Numbers closer to 1 will attempt to return only the most relevant results, but may return fewer results.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) score_threshold>)
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options>)
[](<#(resource) responses > (model) file_search_tool > (schema)>)
ComputerTool { type }
A tool that controls a virtual computer. Learn more about the [computer tool](https://platform.openai.com/docs/guides/tools-computer-use).
type: "computer"
The type of the computer tool. Always `computer`.
[](<#(resource) responses > (model) computer_tool > (schema) > (property) type>)
[](<#(resource) responses > (model) computer_tool > (schema)>)
ComputerUsePreviewTool { display\_height, display\_width, environment, type }
A tool that controls a virtual computer. Learn more about the [computer tool](https://platform.openai.com/docs/guides/tools-computer-use).
display\_height: number
The height of the computer display.
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) display_height>)
display\_width: number
The width of the computer display.
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) display_width>)
environment: "windows" | "mac" | "linux" | 2 more
The type of computer environment to control.
One of the following:
"windows"
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment > (member) 0>)
"mac"
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment > (member) 1>)
"linux"
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment > (member) 2>)
"ubuntu"
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment > (member) 3>)
"browser"
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment > (member) 4>)
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment>)
type: "computer\_use\_preview"
The type of the computer use tool. Always `computer\_use\_preview`.
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) type>)
[](<#(resource) responses > (model) computer_use_preview_tool > (schema)>)
WebSearchTool { type, filters, search\_context\_size, user\_location }
Search the Internet for sources related to the prompt. Learn more about the
[web search tool](https://platform.openai.com/docs/guides/tools-web-search).
type: "web\_search" | "web\_search\_2025\_08\_26"
The type of the web search tool. One of `web\_search` or `web\_search\_2025\_08\_26`.
One of the following:
"web\_search"
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) type > (member) 0>)
"web\_search\_2025\_08\_26"
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) type > (member) 1>)
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) type>)
filters?: Filters | null
Filters for the search.
allowed\_domains?: Array\<string\> | null
Allowed domains for the search. If not provided, all domains are allowed.
Subdomains of the provided domains are allowed as well.
Example: `["pubmed.ncbi.nlm.nih.gov"]`
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) filters > (property) allowed_domains>)
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) filters>)
search\_context\_size?: "low" | "medium" | "high"
High level guidance for the amount of context window space to use for the search. One of `low`, `medium`, or `high`. `medium` is the default.
One of the following:
"low"
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) search_context_size > (member) 0>)
"medium"
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) search_context_size > (member) 1>)
"high"
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) search_context_size > (member) 2>)
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) search_context_size>)
user\_location?: UserLocation | null
The approximate location of the user.
city?: string | null
Free text input for the city of the user, e.g. `San Francisco`.
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location > (property) city>)
country?: string | null
The two-letter [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1) of the user, e.g. `US`.
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location > (property) country>)
region?: string | null
Free text input for the region of the user, e.g. `California`.
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location > (property) region>)
timezone?: string | null
The [IANA timezone](https://timeapi.io/documentation/iana-timezones) of the user, e.g. `America/Los\_Angeles`.
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location > (property) timezone>)
type?: "approximate"
The type of location approximation. Always `approximate`.
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location > (property) type>)
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location>)
[](<#(resource) responses > (model) web_search_tool > (schema)>)
Mcp { server\_label, type, allowed\_tools, 7 more }
Give the model access to additional tools via remote Model Context Protocol
(MCP) servers. [Learn more about MCP](https://platform.openai.com/docs/guides/tools-remote-mcp).
server\_label: string
A label for this MCP server, used to identify it in tool calls.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) server_label>)
type: "mcp"
The type of the MCP tool. Always `mcp`.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) type>)
allowed\_tools?: Array\<string\> | McpToolFilter { read\_only, tool\_names } | null
List of allowed tool names or a filter object.
One of the following:
Array\<string\>
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) allowed_tools > (variant) 0>)
McpToolFilter { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only?: boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) allowed_tools > (variant) 1 > (property) read_only>)
tool\_names?: Array\<string\>
List of allowed tool names.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) allowed_tools > (variant) 1 > (property) tool_names>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) allowed_tools > (variant) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) allowed_tools>)
authorization?: string
An OAuth access token that can be used with a remote MCP server, either
with a custom MCP server URL or a service connector. Your application
must handle the OAuth authorization flow and provide the token here.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) authorization>)
connector\_id?: "connector\_dropbox" | "connector\_gmail" | "connector\_googlecalendar" | 5 more
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
"connector\_dropbox"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 0>)
"connector\_gmail"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 1>)
"connector\_googlecalendar"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 2>)
"connector\_googledrive"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 3>)
"connector\_microsoftteams"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 4>)
"connector\_outlookcalendar"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 5>)
"connector\_outlookemail"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 6>)
"connector\_sharepoint"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 7>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id>)
defer\_loading?: boolean
Whether this MCP tool is deferred and discovered via tool search.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) defer_loading>)
headers?: Record\<string, string\> | null
Optional HTTP headers to send to the MCP server. Use for authentication
or other purposes.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) headers>)
require\_approval?: McpToolApprovalFilter { always, never } | "always" | "never" | null
Specify which of the MCP server’s tools require approval.
One of the following:
McpToolApprovalFilter { always, never }
Specify which of the MCP server’s tools require approval. Can be
`always`, `never`, or a filter object associated with tools
that require approval.
always?: Always { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only?: boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) always > (property) read_only>)
tool\_names?: Array\<string\>
List of allowed tool names.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) always > (property) tool_names>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) always>)
never?: Never { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only?: boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) never > (property) read_only>)
tool\_names?: Array\<string\>
List of allowed tool names.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) never > (property) tool_names>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) never>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0>)
"always" | "never"
"always"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 1 > (member) 0>)
"never"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 1 > (member) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval>)
server\_description?: string
Optional description of the MCP server, used to provide more context.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) server_description>)
server\_url?: string
The URL for the MCP server. One of `server\_url` or `connector\_id` must be
provided.
formaturi
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) server_url>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5>)
CodeInterpreter { container, type }
A tool that runs Python code to help generate a response to a prompt.
container: string | CodeInterpreterToolAuto { type, file\_ids, memory\_limit, network\_policy }
The code interpreter container. Can be a container ID or an object that
specifies uploaded file IDs to make available to your code, along with an
optional `memory\_limit` setting.
One of the following:
string
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 0>)
CodeInterpreterToolAuto { type, file\_ids, memory\_limit, network\_policy }
Configuration for a code interpreter container. Optionally specify the IDs of the files to run the code on.
type: "auto"
Always `auto`.
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) type>)
file\_ids?: Array\<string\>
An optional list of uploaded files to make available to your code.
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) file_ids>)
memory\_limit?: "1g" | "4g" | "16g" | "64g" | null
The memory limit for the code interpreter container.
One of the following:
"1g"
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 0>)
"4g"
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 1>)
"16g"
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 2>)
"64g"
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 3>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit>)
network\_policy?: [ContainerNetworkPolicyDisabled](</api/reference/typescript/resources/responses#(resource) responses > (model) container_network_policy_disabled > (schema)>) { type } | [ContainerNetworkPolicyAllowlist](</api/reference/typescript/resources/responses#(resource) responses > (model) container_network_policy_allowlist > (schema)>) { allowed\_domains, type, domain\_secrets }
Network access policy for the container.
One of the following:
ContainerNetworkPolicyDisabled { type }
type: "disabled"
Disable outbound network access. Always `disabled`.
[](<#(resource) responses > (model) container_network_policy_disabled > (schema) > (property) type>)
[](<#(resource) responses > (model) container_network_policy_disabled > (schema)>)
ContainerNetworkPolicyAllowlist { allowed\_domains, type, domain\_secrets }
allowed\_domains: Array\<string\>
A list of allowed domains when type is `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) allowed_domains>)
type: "allowlist"
Allow outbound network access only to specified domains. Always `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) type>)
domain\_secrets?: Array\<[ContainerNetworkPolicyDomainSecret](</api/reference/typescript/resources/responses#(resource) responses > (model) container_network_policy_domain_secret > (schema)>) { domain, name, value } \>
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
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) network_policy>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container>)
type: "code\_interpreter"
The type of the code interpreter tool. Always `code\_interpreter`.
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) type>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 6>)
ImageGeneration { type, action, background, 9 more }
A tool that generates images using the GPT image models.
type: "image\_generation"
The type of the image generation tool. Always `image\_generation`.
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) type>)
action?: "generate" | "edit" | "auto"
Whether to generate a new image or edit an existing image. Default: `auto`.
One of the following:
"generate"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) action > (member) 0>)
"edit"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) action > (member) 1>)
"auto"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) action > (member) 2>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) action>)
background?: "transparent" | "opaque" | "auto"
Background type for the generated image. One of `transparent`,
`opaque`, or `auto`. Default: `auto`.
One of the following:
"transparent"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) background > (member) 0>)
"opaque"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) background > (member) 1>)
"auto"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) background > (member) 2>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) background>)
input\_fidelity?: "high" | "low" | null
Control how much effort the model will exert to match the style and features, especially facial features, of input images. This parameter is only supported for `gpt-image-1` and `gpt-image-1.5` and later models, unsupported for `gpt-image-1-mini`. Supports `high` and `low`. Defaults to `low`.
One of the following:
"high"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_fidelity > (member) 0>)
"low"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_fidelity > (member) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_fidelity>)
input\_image\_mask?: InputImageMask { file\_id, image\_url }
Optional mask for inpainting. Contains `image\_url`
(string, optional) and `file\_id` (string, optional).
file\_id?: string
File ID for the mask image.
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_image_mask > (property) file_id>)
image\_url?: string
Base64-encoded mask image.
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_image_mask > (property) image_url>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_image_mask>)
model?: (string & {}) | "gpt-image-1" | "gpt-image-1-mini" | "gpt-image-1.5"
The image generation model to use. Default: `gpt-image-1`.
One of the following:
(string & {})
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) model > (variant) 0>)
"gpt-image-1" | "gpt-image-1-mini" | "gpt-image-1.5"
"gpt-image-1"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) model > (variant) 1 > (member) 0>)
"gpt-image-1-mini"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) model > (variant) 1 > (member) 1>)
"gpt-image-1.5"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) model > (variant) 1 > (member) 2>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) model > (variant) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) model>)
moderation?: "auto" | "low"
Moderation level for the generated image. Default: `auto`.
One of the following:
"auto"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) moderation > (member) 0>)
"low"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) moderation > (member) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) moderation>)
output\_compression?: number
Compression level for the output image. Default: 100.
minimum0
maximum100
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) output_compression>)
output\_format?: "png" | "webp" | "jpeg"
The output format of the generated image. One of `png`, `webp`, or
`jpeg`. Default: `png`.
One of the following:
"png"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) output_format > (member) 0>)
"webp"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) output_format > (member) 1>)
"jpeg"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) output_format > (member) 2>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) output_format>)
partial\_images?: number
Number of partial images to generate in streaming mode, from 0 (default value) to 3.
minimum0
maximum3
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) partial_images>)
quality?: "low" | "medium" | "high" | "auto"
The quality of the generated image. One of `low`, `medium`, `high`,
or `auto`. Default: `auto`.
One of the following:
"low"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) quality > (member) 0>)
"medium"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) quality > (member) 1>)
"high"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) quality > (member) 2>)
"auto"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) quality > (member) 3>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) quality>)
size?: "1024x1024" | "1024x1536" | "1536x1024" | "auto"
The size of the generated image. One of `1024x1024`, `1024x1536`,
`1536x1024`, or `auto`. Default: `auto`.
One of the following:
"1024x1024"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) size > (member) 0>)
"1024x1536"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) size > (member) 1>)
"1536x1024"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) size > (member) 2>)
"auto"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) size > (member) 3>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) size>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7>)
LocalShell { type }
A tool that allows the model to execute shell commands in a local environment.
type: "local\_shell"
The type of the local shell tool. Always `local\_shell`.
[](<#(resource) responses > (model) tool > (schema) > (variant) 8 > (property) type>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 8>)
FunctionShellTool { type, environment }
A tool that allows the model to execute shell commands.
type: "shell"
The type of the shell tool. Always `shell`.
[](<#(resource) responses > (model) function_shell_tool > (schema) > (property) type>)
environment?: [ContainerAuto](</api/reference/typescript/resources/responses#(resource) responses > (model) container_auto > (schema)>) { type, file\_ids, memory\_limit, 2 more } | [LocalEnvironment](</api/reference/typescript/resources/responses#(resource) responses > (model) local_environment > (schema)>) { type, skills } | [ContainerReference](</api/reference/typescript/resources/responses#(resource) responses > (model) container_reference > (schema)>) { container\_id, type } | null
One of the following:
ContainerAuto { type, file\_ids, memory\_limit, 2 more }
type: "container\_auto"
Automatically creates a container for this request
[](<#(resource) responses > (model) container_auto > (schema) > (property) type>)
file\_ids?: Array\<string\>
An optional list of uploaded files to make available to your code.
[](<#(resource) responses > (model) container_auto > (schema) > (property) file_ids>)
memory\_limit?: "1g" | "4g" | "16g" | "64g" | null
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
network\_policy?: [ContainerNetworkPolicyDisabled](</api/reference/typescript/resources/responses#(resource) responses > (model) container_network_policy_disabled > (schema)>) { type } | [ContainerNetworkPolicyAllowlist](</api/reference/typescript/resources/responses#(resource) responses > (model) container_network_policy_allowlist > (schema)>) { allowed\_domains, type, domain\_secrets }
Network access policy for the container.
One of the following:
ContainerNetworkPolicyDisabled { type }
type: "disabled"
Disable outbound network access. Always `disabled`.
[](<#(resource) responses > (model) container_network_policy_disabled > (schema) > (property) type>)
[](<#(resource) responses > (model) container_network_policy_disabled > (schema)>)
ContainerNetworkPolicyAllowlist { allowed\_domains, type, domain\_secrets }
allowed\_domains: Array\<string\>
A list of allowed domains when type is `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) allowed_domains>)
type: "allowlist"
Allow outbound network access only to specified domains. Always `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) type>)
domain\_secrets?: Array\<[ContainerNetworkPolicyDomainSecret](</api/reference/typescript/resources/responses#(resource) responses > (model) container_network_policy_domain_secret > (schema)>) { domain, name, value } \>
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
skills?: Array\<[SkillReference](</api/reference/typescript/resources/responses#(resource) responses > (model) skill_reference > (schema)>) { skill\_id, type, version } | [InlineSkill](</api/reference/typescript/resources/responses#(resource) responses > (model) inline_skill > (schema)>) { description, name, source, type } \>
An optional list of skills referenced by id or inline data.
One of the following:
SkillReference { skill\_id, type, version }
skill\_id: string
The ID of the referenced skill.
maxLength64
minLength1
[](<#(resource) responses > (model) skill_reference > (schema) > (property) skill_id>)
type: "skill\_reference"
References a skill created with the /v1/skills endpoint.
[](<#(resource) responses > (model) skill_reference > (schema) > (property) type>)
version?: string
Optional skill version. Use a positive integer or ‘latest’. Omit for default.
[](<#(resource) responses > (model) skill_reference > (schema) > (property) version>)
[](<#(resource) responses > (model) skill_reference > (schema)>)
InlineSkill { description, name, source, type }
description: string
The description of the skill.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) description>)
name: string
The name of the skill.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) name>)
source: [InlineSkillSource](</api/reference/typescript/resources/responses#(resource) responses > (model) inline_skill_source > (schema)>) { data, media\_type, type }
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
LocalEnvironment { type, skills }
type: "local"
Use a local computer environment.
[](<#(resource) responses > (model) local_environment > (schema) > (property) type>)
skills?: Array\<[LocalSkill](</api/reference/typescript/resources/responses#(resource) responses > (model) local_skill > (schema)>) { description, name, path } \>
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
ContainerReference { container\_id, type }
container\_id: string
The ID of the referenced container.
[](<#(resource) responses > (model) container_reference > (schema) > (property) container_id>)
type: "container\_reference"
References a container created with the /v1/containers endpoint
[](<#(resource) responses > (model) container_reference > (schema) > (property) type>)
[](<#(resource) responses > (model) container_reference > (schema)>)
[](<#(resource) responses > (model) function_shell_tool > (schema) > (property) environment>)
[](<#(resource) responses > (model) function_shell_tool > (schema)>)
CustomTool { name, type, defer\_loading, 2 more }
A custom tool that processes input using a specified format. Learn more about [custom tools](https://platform.openai.com/docs/guides/function-calling#custom-tools)
name: string
The name of the custom tool, used to identify it in tool calls.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) name>)
type: "custom"
The type of the custom tool. Always `custom`.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) type>)
defer\_loading?: boolean
Whether this tool should be deferred and discovered via tool search.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) defer_loading>)
description?: string
Optional description of the custom tool, used to provide more context.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) description>)
format?: [CustomToolInputFormat](</api/reference/typescript/resources/$shared#(resource) $shared > (model) custom_tool_input_format > (schema)>)
The input format for the custom tool. Default is unconstrained text.
One of the following:
Text { type }
Unconstrained free-form text.
type: "text"
Unconstrained text format. Always `text`.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 0 > (property) type>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 0>)
Grammar { definition, syntax, type }
A grammar defined by the user.
definition: string
The grammar definition.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) definition>)
syntax: "lark" | "regex"
The syntax of the grammar definition. One of `lark` or `regex`.
One of the following:
"lark"
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax > (member) 0>)
"regex"
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax > (member) 1>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax>)
type: "grammar"
Grammar format. Always `grammar`.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) type>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format>)
[](<#(resource) responses > (model) custom_tool > (schema)>)
NamespaceTool { description, name, tools, type }
Groups function/custom tools under a shared namespace.
description: string
A description of the namespace shown to the model.
minLength1
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) description>)
name: string
The namespace name used in tool calls (for example, `crm`).
minLength1
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) name>)
tools: Array\<Function { name, type, defer\_loading, 3 more } | [CustomTool](</api/reference/typescript/resources/responses#(resource) responses > (model) custom_tool > (schema)>) { name, type, defer\_loading, 2 more } \>
The function/custom tools available inside this namespace.
One of the following:
Function { name, type, defer\_loading, 3 more }
name: string
maxLength128
minLength1
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) name>)
type: "function"
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) type>)
defer\_loading?: boolean
Whether this function should be deferred and discovered via tool search.
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) defer_loading>)
description?: string | null
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) description>)
parameters?: unknown
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) parameters>)
strict?: boolean | null
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) strict>)
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0>)
CustomTool { name, type, defer\_loading, 2 more }
A custom tool that processes input using a specified format. Learn more about [custom tools](https://platform.openai.com/docs/guides/function-calling#custom-tools)
name: string
The name of the custom tool, used to identify it in tool calls.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) name>)
type: "custom"
The type of the custom tool. Always `custom`.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) type>)
defer\_loading?: boolean
Whether this tool should be deferred and discovered via tool search.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) defer_loading>)
description?: string
Optional description of the custom tool, used to provide more context.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) description>)
format?: [CustomToolInputFormat](</api/reference/typescript/resources/$shared#(resource) $shared > (model) custom_tool_input_format > (schema)>)
The input format for the custom tool. Default is unconstrained text.
One of the following:
Text { type }
Unconstrained free-form text.
type: "text"
Unconstrained text format. Always `text`.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 0 > (property) type>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 0>)
Grammar { definition, syntax, type }
A grammar defined by the user.
definition: string
The grammar definition.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) definition>)
syntax: "lark" | "regex"
The syntax of the grammar definition. One of `lark` or `regex`.
One of the following:
"lark"
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax > (member) 0>)
"regex"
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax > (member) 1>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax>)
type: "grammar"
Grammar format. Always `grammar`.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) type>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format>)
[](<#(resource) responses > (model) custom_tool > (schema)>)
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools>)
type: "namespace"
The type of the tool. Always `namespace`.
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) type>)
[](<#(resource) responses > (model) namespace_tool > (schema)>)
ToolSearchTool { type, description, execution, parameters }
Hosted or BYOT tool search configuration for deferred tools.
type: "tool\_search"
The type of the tool. Always `tool\_search`.
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) type>)
description?: string | null
Description shown to the model for a client-executed tool search tool.
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) description>)
execution?: "server" | "client"
Whether tool search is executed by the server or by the client.
One of the following:
"server"
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) execution > (member) 0>)
"client"
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) execution > (member) 1>)
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) execution>)
parameters?: unknown
Parameter schema for a client-executed tool search tool.
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) parameters>)
[](<#(resource) responses > (model) tool_search_tool > (schema)>)
WebSearchPreviewTool { type, search\_content\_types, search\_context\_size, user\_location }
This tool searches the web for relevant results to use in a response. Learn more about the [web search tool](https://platform.openai.com/docs/guides/tools-web-search).
type: "web\_search\_preview" | "web\_search\_preview\_2025\_03\_11"
The type of the web search tool. One of `web\_search\_preview` or `web\_search\_preview\_2025\_03\_11`.
One of the following:
"web\_search\_preview"
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) type > (member) 0>)
"web\_search\_preview\_2025\_03\_11"
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) type > (member) 1>)
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) type>)
search\_content\_types?: Array\<"text" | "image"\>
One of the following:
"text"
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_content_types > (items) > (member) 0>)
"image"
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_content_types > (items) > (member) 1>)
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_content_types>)
search\_context\_size?: "low" | "medium" | "high"
High level guidance for the amount of context window space to use for the search. One of `low`, `medium`, or `high`. `medium` is the default.
One of the following:
"low"
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_context_size > (member) 0>)
"medium"
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_context_size > (member) 1>)
"high"
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_context_size > (member) 2>)
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_context_size>)
user\_location?: UserLocation | null
The user’s location.
type: "approximate"
The type of location approximation. Always `approximate`.
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location > (property) type>)
city?: string | null
Free text input for the city of the user, e.g. `San Francisco`.
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location > (property) city>)
country?: string | null
The two-letter [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1) of the user, e.g. `US`.
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location > (property) country>)
region?: string | null
Free text input for the region of the user, e.g. `California`.
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location > (property) region>)
timezone?: string | null
The [IANA timezone](https://timeapi.io/documentation/iana-timezones) of the user, e.g. `America/Los\_Angeles`.
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location > (property) timezone>)
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location>)
[](<#(resource) responses > (model) web_search_preview_tool > (schema)>)
ApplyPatchTool { type }
Allows the assistant to create, delete, or update files using unified diffs.
type: "apply\_patch"
The type of the tool. Always `apply\_patch`.
[](<#(resource) responses > (model) apply_patch_tool > (schema) > (property) type>)
[](<#(resource) responses > (model) apply_patch_tool > (schema)>)
[](<#(resource) responses > (model) response_tool_search_output_item_param > (schema) > (property) tools>)
type: "tool\_search\_output"
The item type. Always `tool\_search\_output`.
[](<#(resource) responses > (model) response_tool_search_output_item_param > (schema) > (property) type>)
id?: string | null
The unique ID of this tool search output.
[](<#(resource) responses > (model) response_tool_search_output_item_param > (schema) > (property) id>)
call\_id?: string | null
The unique ID of the tool search call generated by the model.
maxLength64
minLength1
[](<#(resource) responses > (model) response_tool_search_output_item_param > (schema) > (property) call_id>)
execution?: "server" | "client"
Whether tool search was executed by the server or by the client.
One of the following:
"server"
[](<#(resource) responses > (model) response_tool_search_output_item_param > (schema) > (property) execution > (member) 0>)
"client"
[](<#(resource) responses > (model) response_tool_search_output_item_param > (schema) > (property) execution > (member) 1>)
[](<#(resource) responses > (model) response_tool_search_output_item_param > (schema) > (property) execution>)
status?: "in\_progress" | "completed" | "incomplete" | null
The status of the tool search output.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_tool_search_output_item_param > (schema) > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) response_tool_search_output_item_param > (schema) > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) response_tool_search_output_item_param > (schema) > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_tool_search_output_item_param > (schema) > (property) status>)
[](<#(resource) responses > (model) response_tool_search_output_item_param > (schema)>)
ResponseReasoningItem { id, summary, type, 3 more }
A description of the chain of thought used by a reasoning model while generating
a response. Be sure to include these items in your `input` to the Responses API
for subsequent turns of a conversation if you are manually
[managing context](https://platform.openai.com/docs/guides/conversation-state).
id: string
The unique identifier of the reasoning content.
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) id>)
summary: Array\<Summary\>
Reasoning summary content.
text: string
A summary of the reasoning output from the model so far.
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) summary > (items) > (property) text>)
type: "summary\_text"
The type of the object. Always `summary\_text`.
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) summary > (items) > (property) type>)
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) summary>)
type: "reasoning"
The type of the object. Always `reasoning`.
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) type>)
content?: Array\<Content\>
Reasoning text content.
text: string
The reasoning text from the model.
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) content > (items) > (property) text>)
type: "reasoning\_text"
The type of the reasoning text. Always `reasoning\_text`.
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) content > (items) > (property) type>)
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) content>)
encrypted\_content?: string | null
The encrypted content of the reasoning item - populated when a response is
generated with `reasoning.encrypted\_content` in the `include` parameter.
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) encrypted_content>)
status?: "in\_progress" | "completed" | "incomplete"
The status of the item. One of `in\_progress`, `completed`, or
`incomplete`. Populated when items are returned via API.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) status>)
[](<#(resource) responses > (model) response_reasoning_item > (schema)>)
ResponseCompactionItemParam { encrypted\_content, type, id }
A compaction item generated by the [`v1/responses/compact` API](https://platform.openai.com/docs/api-reference/responses/compact).
encrypted\_content: string
The encrypted content of the compaction summary.
maxLength10485760
[](<#(resource) responses > (model) response_compaction_item_param > (schema) > (property) encrypted_content>)
type: "compaction"
The type of the item. Always `compaction`.
[](<#(resource) responses > (model) response_compaction_item_param > (schema) > (property) type>)
id?: string | null
The ID of the compaction item.
[](<#(resource) responses > (model) response_compaction_item_param > (schema) > (property) id>)
[](<#(resource) responses > (model) response_compaction_item_param > (schema)>)
ImageGenerationCall { id, result, status, type }
An image generation request made by the model.
id: string
The unique ID of the image generation call.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 13 > (property) id>)
result: string | null
The generated image encoded in base64.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 13 > (property) result>)
status: "in\_progress" | "completed" | "generating" | "failed"
The status of the image generation call.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 13 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 13 > (property) status > (member) 1>)
"generating"
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 13 > (property) status > (member) 2>)
"failed"
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 13 > (property) status > (member) 3>)
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 13 > (property) status>)
type: "image\_generation\_call"
The type of the image generation call. Always `image\_generation\_call`.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 13 > (property) type>)
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 13>)
ResponseCodeInterpreterToolCall { id, code, container\_id, 3 more }
A tool call to run code.
id: string
The unique ID of the code interpreter tool call.
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) id>)
code: string | null
The code to run, or null if not available.
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) code>)
container\_id: string
The ID of the container used to run the code.
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) container_id>)
outputs: Array\<Logs { logs, type } | Image { type, url } \> | null
The outputs generated by the code interpreter, such as logs or images.
Can be null if no outputs are available.
One of the following:
Logs { logs, type }
The logs output from the code interpreter.
logs: string
The logs output from the code interpreter.
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) outputs > (items) > (variant) 0 > (property) logs>)
type: "logs"
The type of the output. Always `logs`.
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) outputs > (items) > (variant) 0 > (property) type>)
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) outputs > (items) > (variant) 0>)
Image { type, url }
The image output from the code interpreter.
type: "image"
The type of the output. Always `image`.
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) outputs > (items) > (variant) 1 > (property) type>)
url: string
The URL of the image output from the code interpreter.
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) outputs > (items) > (variant) 1 > (property) url>)
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) outputs > (items) > (variant) 1>)
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) outputs>)
status: "in\_progress" | "completed" | "incomplete" | 2 more
The status of the code interpreter tool call. Valid values are `in\_progress`, `completed`, `incomplete`, `interpreting`, and `failed`.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) status > (member) 2>)
"interpreting"
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) status > (member) 3>)
"failed"
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) status > (member) 4>)
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) status>)
type: "code\_interpreter\_call"
The type of the code interpreter tool call. Always `code\_interpreter\_call`.
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) type>)
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema)>)
LocalShellCall { id, action, call\_id, 2 more }
A tool call to run a command on the local shell.
id: string
The unique ID of the local shell call.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 15 > (property) id>)
action: Action { command, env, type, 3 more }
Execute a shell command on the server.
command: Array\<string\>
The command to run.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 15 > (property) action > (property) command>)
env: Record\<string, string\>
Environment variables to set for the command.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 15 > (property) action > (property) env>)
type: "exec"
The type of the local shell action. Always `exec`.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 15 > (property) action > (property) type>)
timeout\_ms?: number | null
Optional timeout in milliseconds for the command.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 15 > (property) action > (property) timeout_ms>)
user?: string | null
Optional user to run the command as.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 15 > (property) action > (property) user>)
working\_directory?: string | null
Optional working directory to run the command in.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 15 > (property) action > (property) working_directory>)
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 15 > (property) action>)
call\_id: string
The unique ID of the local shell tool call generated by the model.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 15 > (property) call_id>)
status: "in\_progress" | "completed" | "incomplete"
The status of the local shell call.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 15 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 15 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 15 > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 15 > (property) status>)
type: "local\_shell\_call"
The type of the local shell call. Always `local\_shell\_call`.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 15 > (property) type>)
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 15>)
LocalShellCallOutput { id, output, type, status }
The output of a local shell tool call.
id: string
The unique ID of the local shell tool call generated by the model.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 16 > (property) id>)
output: string
A JSON string of the output of the local shell tool call.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 16 > (property) output>)
type: "local\_shell\_call\_output"
The type of the local shell tool call output. Always `local\_shell\_call\_output`.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 16 > (property) type>)
status?: "in\_progress" | "completed" | "incomplete" | null
The status of the item. One of `in\_progress`, `completed`, or `incomplete`.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 16 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 16 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 16 > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 16 > (property) status>)
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 16>)
ShellCall { action, call\_id, type, 3 more }
A tool representing a request to execute one or more shell commands.
action: Action { commands, max\_output\_length, timeout\_ms }
The shell commands and limits that describe how to run the tool call.
commands: Array\<string\>
Ordered shell commands for the execution environment to run.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 17 > (property) action > (property) commands>)
max\_output\_length?: number | null
Maximum number of UTF-8 characters to capture from combined stdout and stderr output.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 17 > (property) action > (property) max_output_length>)
timeout\_ms?: number | null
Maximum wall-clock time in milliseconds to allow the shell commands to run.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 17 > (property) action > (property) timeout_ms>)
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 17 > (property) action>)
call\_id: string
The unique ID of the shell tool call generated by the model.
maxLength64
minLength1
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 17 > (property) call_id>)
type: "shell\_call"
The type of the item. Always `shell\_call`.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 17 > (property) type>)
id?: string | null
The unique ID of the shell tool call. Populated when this item is returned via API.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 17 > (property) id>)
environment?: [LocalEnvironment](</api/reference/typescript/resources/responses#(resource) responses > (model) local_environment > (schema)>) { type, skills } | [ContainerReference](</api/reference/typescript/resources/responses#(resource) responses > (model) container_reference > (schema)>) { container\_id, type } | null
The environment to execute the shell commands in.
One of the following:
LocalEnvironment { type, skills }
type: "local"
Use a local computer environment.
[](<#(resource) responses > (model) local_environment > (schema) > (property) type>)
skills?: Array\<[LocalSkill](</api/reference/typescript/resources/responses#(resource) responses > (model) local_skill > (schema)>) { description, name, path } \>
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
ContainerReference { container\_id, type }
container\_id: string
The ID of the referenced container.
[](<#(resource) responses > (model) container_reference > (schema) > (property) container_id>)
type: "container\_reference"
References a container created with the /v1/containers endpoint
[](<#(resource) responses > (model) container_reference > (schema) > (property) type>)
[](<#(resource) responses > (model) container_reference > (schema)>)
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 17 > (property) environment>)
status?: "in\_progress" | "completed" | "incomplete" | null
The status of the shell call. One of `in\_progress`, `completed`, or `incomplete`.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 17 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 17 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 17 > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 17 > (property) status>)
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 17>)
ShellCallOutput { call\_id, output, type, 3 more }
The streamed output items emitted by a shell tool call.
call\_id: string
The unique ID of the shell tool call generated by the model.
maxLength64
minLength1
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 18 > (property) call_id>)
output: Array\<[ResponseFunctionShellCallOutputContent](</api/reference/typescript/resources/responses#(resource) responses > (model) response_function_shell_call_output_content > (schema)>) { outcome, stderr, stdout } \>
Captured chunks of stdout and stderr output, along with their associated outcomes.
outcome: Timeout { type } | Exit { exit\_code, type }
The exit or timeout outcome associated with this shell call.
One of the following:
Timeout { type }
Indicates that the shell call exceeded its configured time limit.
type: "timeout"
The outcome type. Always `timeout`.
[](<#(resource) responses > (model) response_function_shell_call_output_content > (schema) > (property) outcome > (variant) 0 > (property) type>)
[](<#(resource) responses > (model) response_function_shell_call_output_content > (schema) > (property) outcome > (variant) 0>)
Exit { exit\_code, type }
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
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 18 > (property) output>)
type: "shell\_call\_output"
The type of the item. Always `shell\_call\_output`.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 18 > (property) type>)
id?: string | null
The unique ID of the shell tool call output. Populated when this item is returned via API.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 18 > (property) id>)
max\_output\_length?: number | null
The maximum number of UTF-8 characters captured for this shell call’s combined output.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 18 > (property) max_output_length>)
status?: "in\_progress" | "completed" | "incomplete" | null
The status of the shell call output.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 18 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 18 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 18 > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 18 > (property) status>)
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 18>)
ApplyPatchCall { call\_id, operation, status, 2 more }
A tool call representing a request to create, delete, or update files using diff patches.
call\_id: string
The unique ID of the apply patch tool call generated by the model.
maxLength64
minLength1
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 19 > (property) call_id>)
operation: CreateFile { diff, path, type } | DeleteFile { path, type } | UpdateFile { diff, path, type }
The specific create, delete, or update instruction for the apply\_patch tool call.
One of the following:
CreateFile { diff, path, type }
Instruction for creating a new file via the apply\_patch tool.
diff: string
Unified diff content to apply when creating the file.
maxLength10485760
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 19 > (property) operation > (variant) 0 > (property) diff>)
path: string
Path of the file to create relative to the workspace root.
minLength1
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 19 > (property) operation > (variant) 0 > (property) path>)
type: "create\_file"
The operation type. Always `create\_file`.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 19 > (property) operation > (variant) 0 > (property) type>)
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 19 > (property) operation > (variant) 0>)
DeleteFile { path, type }
Instruction for deleting an existing file via the apply\_patch tool.
path: string
Path of the file to delete relative to the workspace root.
minLength1
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 19 > (property) operation > (variant) 1 > (property) path>)
type: "delete\_file"
The operation type. Always `delete\_file`.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 19 > (property) operation > (variant) 1 > (property) type>)
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 19 > (property) operation > (variant) 1>)
UpdateFile { diff, path, type }
Instruction for updating an existing file via the apply\_patch tool.
diff: string
Unified diff content to apply to the existing file.
maxLength10485760
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 19 > (property) operation > (variant) 2 > (property) diff>)
path: string
Path of the file to update relative to the workspace root.
minLength1
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 19 > (property) operation > (variant) 2 > (property) path>)
type: "update\_file"
The operation type. Always `update\_file`.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 19 > (property) operation > (variant) 2 > (property) type>)
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 19 > (property) operation > (variant) 2>)
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 19 > (property) operation>)
status: "in\_progress" | "completed"
The status of the apply patch tool call. One of `in\_progress` or `completed`.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 19 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 19 > (property) status > (member) 1>)
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 19 > (property) status>)
type: "apply\_patch\_call"
The type of the item. Always `apply\_patch\_call`.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 19 > (property) type>)
id?: string | null
The unique ID of the apply patch tool call. Populated when this item is returned via API.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 19 > (property) id>)
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 19>)
ApplyPatchCallOutput { call\_id, status, type, 2 more }
The streamed output emitted by an apply patch tool call.
call\_id: string
The unique ID of the apply patch tool call generated by the model.
maxLength64
minLength1
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 20 > (property) call_id>)
status: "completed" | "failed"
The status of the apply patch tool call output. One of `completed` or `failed`.
One of the following:
"completed"
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 20 > (property) status > (member) 0>)
"failed"
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 20 > (property) status > (member) 1>)
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 20 > (property) status>)
type: "apply\_patch\_call\_output"
The type of the item. Always `apply\_patch\_call\_output`.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 20 > (property) type>)
id?: string | null
The unique ID of the apply patch tool call output. Populated when this item is returned via API.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 20 > (property) id>)
output?: string | null
Optional human-readable log text from the apply patch tool (e.g., patch results or errors).
maxLength10485760
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 20 > (property) output>)
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 20>)
McpListTools { id, server\_label, tools, 2 more }
A list of tools available on an MCP server.
id: string
The unique ID of the list.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 21 > (property) id>)
server\_label: string
The label of the MCP server.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 21 > (property) server_label>)
tools: Array\<Tool\>
The tools available on the server.
input\_schema: unknown
The JSON schema describing the tool’s input.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 21 > (property) tools > (items) > (property) input_schema>)
name: string
The name of the tool.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 21 > (property) tools > (items) > (property) name>)
annotations?: unknown
Additional annotations about the tool.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 21 > (property) tools > (items) > (property) annotations>)
description?: string | null
The description of the tool.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 21 > (property) tools > (items) > (property) description>)
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 21 > (property) tools>)
type: "mcp\_list\_tools"
The type of the item. Always `mcp\_list\_tools`.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 21 > (property) type>)
error?: string | null
Error message if the server could not list tools.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 21 > (property) error>)
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 21>)
McpApprovalRequest { id, arguments, name, 2 more }
A request for human approval of a tool invocation.
id: string
The unique ID of the approval request.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 22 > (property) id>)
arguments: string
A JSON string of arguments for the tool.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 22 > (property) arguments>)
name: string
The name of the tool to run.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 22 > (property) name>)
server\_label: string
The label of the MCP server making the request.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 22 > (property) server_label>)
type: "mcp\_approval\_request"
The type of the item. Always `mcp\_approval\_request`.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 22 > (property) type>)
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 22>)
McpApprovalResponse { approval\_request\_id, approve, type, 2 more }
A response to an MCP approval request.
approval\_request\_id: string
The ID of the approval request being answered.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 23 > (property) approval_request_id>)
approve: boolean
Whether the request was approved.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 23 > (property) approve>)
type: "mcp\_approval\_response"
The type of the item. Always `mcp\_approval\_response`.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 23 > (property) type>)
id?: string | null
The unique ID of the approval response
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 23 > (property) id>)
reason?: string | null
Optional reason for the decision.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 23 > (property) reason>)
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 23>)
McpCall { id, arguments, name, 6 more }
An invocation of a tool on an MCP server.
id: string
The unique ID of the tool call.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 24 > (property) id>)
arguments: string
A JSON string of the arguments passed to the tool.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 24 > (property) arguments>)
name: string
The name of the tool that was run.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 24 > (property) name>)
server\_label: string
The label of the MCP server running the tool.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 24 > (property) server_label>)
type: "mcp\_call"
The type of the item. Always `mcp\_call`.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 24 > (property) type>)
approval\_request\_id?: string | null
Unique identifier for the MCP tool call approval request.
Include this value in a subsequent `mcp\_approval\_response` input to approve or reject the corresponding tool call.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 24 > (property) approval_request_id>)
error?: string | null
The error from the tool call, if any.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 24 > (property) error>)
output?: string | null
The output from the tool call.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 24 > (property) output>)
status?: "in\_progress" | "completed" | "incomplete" | 2 more
The status of the tool call. One of `in\_progress`, `completed`, `incomplete`, `calling`, or `failed`.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 24 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 24 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 24 > (property) status > (member) 2>)
"calling"
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 24 > (property) status > (member) 3>)
"failed"
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 24 > (property) status > (member) 4>)
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 24 > (property) status>)
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 24>)
ResponseCustomToolCallOutput { call\_id, output, type, id }
The output of a custom tool call from your code, being sent back to the model.
call\_id: string
The call ID, used to map this custom tool call output to a custom tool call.
[](<#(resource) responses > (model) response_custom_tool_call_output > (schema) > (property) call_id>)
output: string | Array\<[ResponseInputText](</api/reference/typescript/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } | [ResponseInputImage](</api/reference/typescript/resources/responses#(resource) responses > (model) response_input_image > (schema)>) { detail, type, file\_id, image\_url } | [ResponseInputFile](</api/reference/typescript/resources/responses#(resource) responses > (model) response_input_file > (schema)>) { type, detail, file\_data, 3 more } \>
The output from the custom tool call generated by your code.
Can be a string or an list of output content.
One of the following:
string
[](<#(resource) responses > (model) response_custom_tool_call_output > (schema) > (property) output > (variant) 0>)
Array\<[ResponseInputText](</api/reference/typescript/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } | [ResponseInputImage](</api/reference/typescript/resources/responses#(resource) responses > (model) response_input_image > (schema)>) { detail, type, file\_id, image\_url } | [ResponseInputFile](</api/reference/typescript/resources/responses#(resource) responses > (model) response_input_file > (schema)>) { type, detail, file\_data, 3 more } \>
ResponseInputText { text, type }
A text input to the model.
text: string
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
type: "input\_text"
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
ResponseInputImage { detail, type, file\_id, image\_url }
An image input to the model. Learn about [image inputs](https://platform.openai.com/docs/guides/vision).
detail: "low" | "high" | "auto" | "original"
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
file\_id?: string | null
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) file_id>)
image\_url?: string | null
The URL of the image to be sent to the model. A fully qualified URL or base64 encoded image in a data URL.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) image_url>)
[](<#(resource) responses > (model) response_input_image > (schema)>)
ResponseInputFile { type, detail, file\_data, 3 more }
A file input to the model.
type: "input\_file"
The type of the input item. Always `input\_file`.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) type>)
detail?: "low" | "high"
The detail level of the file to be sent to the model. Use `low` for the default rendering behavior, or `high` to render the file at higher quality. Defaults to `low`.
One of the following:
"low"
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 0>)
"high"
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 1>)
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail>)
file\_data?: string
The content of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_data>)
file\_id?: string | null
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_id>)
file\_url?: string
The URL of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_url>)
filename?: string
The name of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) filename>)
[](<#(resource) responses > (model) response_input_file > (schema)>)
[](<#(resource) responses > (model) response_custom_tool_call_output > (schema) > (property) output > (variant) 1>)
[](<#(resource) responses > (model) response_custom_tool_call_output > (schema) > (property) output>)
type: "custom\_tool\_call\_output"
The type of the custom tool call output. Always `custom\_tool\_call\_output`.
[](<#(resource) responses > (model) response_custom_tool_call_output > (schema) > (property) type>)
id?: string
The unique ID of the custom tool call output in the OpenAI platform.
[](<#(resource) responses > (model) response_custom_tool_call_output > (schema) > (property) id>)
[](<#(resource) responses > (model) response_custom_tool_call_output > (schema)>)
ResponseCustomToolCall { call\_id, input, name, 3 more }
A call to a custom tool created by the model.
call\_id: string
An identifier used to map this custom tool call to a tool call output.
[](<#(resource) responses > (model) response_custom_tool_call > (schema) > (property) call_id>)
input: string
The input for the custom tool call generated by the model.
[](<#(resource) responses > (model) response_custom_tool_call > (schema) > (property) input>)
name: string
The name of the custom tool being called.
[](<#(resource) responses > (model) response_custom_tool_call > (schema) > (property) name>)
type: "custom\_tool\_call"
The type of the custom tool call. Always `custom\_tool\_call`.
[](<#(resource) responses > (model) response_custom_tool_call > (schema) > (property) type>)
id?: string
The unique ID of the custom tool call in the OpenAI platform.
[](<#(resource) responses > (model) response_custom_tool_call > (schema) > (property) id>)
namespace?: string
The namespace of the custom tool being called.
[](<#(resource) responses > (model) response_custom_tool_call > (schema) > (property) namespace>)
[](<#(resource) responses > (model) response_custom_tool_call > (schema)>)
ItemReference { id, type }
An internal identifier for an item to reference.
id: string
The ID of the item to reference.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 27 > (property) id>)
type?: "item\_reference" | null
The type of item to reference. Always `item\_reference`.
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 27 > (property) type>)
[](<#(resource) responses > (model) response_input_item > (schema) > (variant) 27>)
[](<#(resource) responses > (model) response > (schema) > (property) instructions > (variant) 1>)
[](<#(resource) responses > (model) response > (schema) > (property) instructions>)
metadata: [Metadata](</api/reference/typescript/resources/$shared#(resource) $shared > (model) metadata > (schema)>) | null
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) responses > (model) response > (schema) > (property) metadata>)
model: [ResponsesModel](</api/reference/typescript/resources/$shared#(resource) $shared > (model) responses_model > (schema)>)
Model ID used to generate the response, like `gpt-4o` or `o3`. OpenAI
offers a wide range of models with different capabilities, performance
characteristics, and price points. Refer to the [model guide](https://platform.openai.com/docs/models)
to browse and compare available models.
One of the following:
(string & {})
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) responses_model > (schema) > (variant) 0>)
ChatModel = "gpt-5.4" | "gpt-5.4-mini" | "gpt-5.4-nano" | 75 more
One of the following:
"gpt-5.4"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 0>)
"gpt-5.4-mini"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 1>)
"gpt-5.4-nano"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 2>)
"gpt-5.4-mini-2026-03-17"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 3>)
"gpt-5.4-nano-2026-03-17"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 4>)
"gpt-5.3-chat-latest"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 5>)
"gpt-5.2"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 6>)
"gpt-5.2-2025-12-11"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 7>)
"gpt-5.2-chat-latest"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 8>)
"gpt-5.2-pro"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 9>)
"gpt-5.2-pro-2025-12-11"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 10>)
"gpt-5.1"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 11>)
"gpt-5.1-2025-11-13"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 12>)
"gpt-5.1-codex"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 13>)
"gpt-5.1-mini"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 14>)
"gpt-5.1-chat-latest"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 15>)
"gpt-5"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 16>)
"gpt-5-mini"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 17>)
"gpt-5-nano"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 18>)
"gpt-5-2025-08-07"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 19>)
"gpt-5-mini-2025-08-07"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 20>)
"gpt-5-nano-2025-08-07"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 21>)
"gpt-5-chat-latest"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 22>)
"gpt-4.1"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 23>)
"gpt-4.1-mini"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 24>)
"gpt-4.1-nano"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 25>)
"gpt-4.1-2025-04-14"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 26>)
"gpt-4.1-mini-2025-04-14"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 27>)
"gpt-4.1-nano-2025-04-14"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 28>)
"o4-mini"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 29>)
"o4-mini-2025-04-16"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 30>)
"o3"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 31>)
"o3-2025-04-16"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 32>)
"o3-mini"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 33>)
"o3-mini-2025-01-31"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 34>)
"o1"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 35>)
"o1-2024-12-17"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 36>)
"o1-preview"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 37>)
"o1-preview-2024-09-12"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 38>)
"o1-mini"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 39>)
"o1-mini-2024-09-12"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 40>)
"gpt-4o"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 41>)
"gpt-4o-2024-11-20"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 42>)
"gpt-4o-2024-08-06"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 43>)
"gpt-4o-2024-05-13"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 44>)
"gpt-4o-audio-preview"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 45>)
"gpt-4o-audio-preview-2024-10-01"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 46>)
"gpt-4o-audio-preview-2024-12-17"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 47>)
"gpt-4o-audio-preview-2025-06-03"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 48>)
"gpt-4o-mini-audio-preview"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 49>)
"gpt-4o-mini-audio-preview-2024-12-17"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 50>)
"gpt-4o-search-preview"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 51>)
"gpt-4o-mini-search-preview"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 52>)
"gpt-4o-search-preview-2025-03-11"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 53>)
"gpt-4o-mini-search-preview-2025-03-11"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 54>)
"chatgpt-4o-latest"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 55>)
"codex-mini-latest"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 56>)
"gpt-4o-mini"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 57>)
"gpt-4o-mini-2024-07-18"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 58>)
"gpt-4-turbo"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 59>)
"gpt-4-turbo-2024-04-09"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 60>)
"gpt-4-0125-preview"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 61>)
"gpt-4-turbo-preview"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 62>)
"gpt-4-1106-preview"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 63>)
"gpt-4-vision-preview"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 64>)
"gpt-4"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 65>)
"gpt-4-0314"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 66>)
"gpt-4-0613"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 67>)
"gpt-4-32k"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 68>)
"gpt-4-32k-0314"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 69>)
"gpt-4-32k-0613"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 70>)
"gpt-3.5-turbo"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 71>)
"gpt-3.5-turbo-16k"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 72>)
"gpt-3.5-turbo-0301"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 73>)
"gpt-3.5-turbo-0613"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 74>)
"gpt-3.5-turbo-1106"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 75>)
"gpt-3.5-turbo-0125"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 76>)
"gpt-3.5-turbo-16k-0613"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema) > (member) 77>)
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) chat_model > (schema)>)
"o1-pro" | "o1-pro-2025-03-19" | "o3-pro" | 11 more
"o1-pro"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) responses_model > (schema) > (variant) 2 > (member) 0>)
"o1-pro-2025-03-19"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) responses_model > (schema) > (variant) 2 > (member) 1>)
"o3-pro"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) responses_model > (schema) > (variant) 2 > (member) 2>)
"o3-pro-2025-06-10"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) responses_model > (schema) > (variant) 2 > (member) 3>)
"o3-deep-research"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) responses_model > (schema) > (variant) 2 > (member) 4>)
"o3-deep-research-2025-06-26"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) responses_model > (schema) > (variant) 2 > (member) 5>)
"o4-mini-deep-research"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) responses_model > (schema) > (variant) 2 > (member) 6>)
"o4-mini-deep-research-2025-06-26"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) responses_model > (schema) > (variant) 2 > (member) 7>)
"computer-use-preview"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) responses_model > (schema) > (variant) 2 > (member) 8>)
"computer-use-preview-2025-03-11"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) responses_model > (schema) > (variant) 2 > (member) 9>)
"gpt-5-codex"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) responses_model > (schema) > (variant) 2 > (member) 10>)
"gpt-5-pro"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) responses_model > (schema) > (variant) 2 > (member) 11>)
"gpt-5-pro-2025-10-06"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) responses_model > (schema) > (variant) 2 > (member) 12>)
"gpt-5.1-codex-max"
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) responses_model > (schema) > (variant) 2 > (member) 13>)
[](<#(resource) responses > (model) response > (schema) > (property) model + (resource) $shared > (model) responses_model > (schema) > (variant) 2>)
[](<#(resource) responses > (model) response > (schema) > (property) model>)
object: "response"
The object type of this resource - always set to `response`.
[](<#(resource) responses > (model) response > (schema) > (property) object>)
output: Array\<[ResponseOutputItem](</api/reference/typescript/resources/responses#(resource) responses > (model) response_output_item > (schema)>)\>
An array of content items generated by the model.
* The length and order of items in the `output` array is dependent
on the model’s response.
* Rather than accessing the first item in the `output` array and
assuming it’s an `assistant` message with the content generated by
the model, you might consider using the `output\_text` property where
supported in SDKs.
One of the following:
ResponseOutputMessage { id, content, role, 3 more }
An output message from the model.
id: string
The unique ID of the output message.
[](<#(resource) responses > (model) response_output_message > (schema) > (property) id>)
content: Array\<[ResponseOutputText](</api/reference/typescript/resources/responses#(resource) responses > (model) response_output_text > (schema)>) { annotations, text, type, logprobs } | [ResponseOutputRefusal](</api/reference/typescript/resources/responses#(resource) responses > (model) response_output_refusal > (schema)>) { refusal, type } \>
The content of the output message.
One of the following:
ResponseOutputText { annotations, text, type, logprobs }
A text output from the model.
annotations: Array\<FileCitation { file\_id, filename, index, type } | URLCitation { end\_index, start\_index, title, 2 more } | ContainerFileCitation { container\_id, end\_index, file\_id, 3 more } | FilePath { file\_id, index, type } \>
The annotations of the text output.
One of the following:
FileCitation { file\_id, filename, index, type }
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
URLCitation { end\_index, start\_index, title, 2 more }
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
ContainerFileCitation { container\_id, end\_index, file\_id, 3 more }
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
FilePath { file\_id, index, type }
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
text: string
The text output from the model.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) text>)
type: "output\_text"
The type of the output text. Always `output\_text`.
[](<#(resource) responses > (model) response_output_text > (schema) > (property) type>)
logprobs?: Array\<Logprob\>
token: string
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) token>)
bytes: Array\<number\>
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) bytes>)
logprob: number
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) logprob>)
top\_logprobs: Array\<TopLogprob\>
token: string
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) top_logprobs > (items) > (property) token>)
bytes: Array\<number\>
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) top_logprobs > (items) > (property) bytes>)
logprob: number
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) top_logprobs > (items) > (property) logprob>)
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs > (items) > (property) top_logprobs>)
[](<#(resource) responses > (model) response_output_text > (schema) > (property) logprobs>)
[](<#(resource) responses > (model) response_output_text > (schema)>)
ResponseOutputRefusal { refusal, type }
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
status: "in\_progress" | "completed" | "incomplete"
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
phase?: "commentary" | "final\_answer" | null
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
ResponseFileSearchToolCall { id, queries, status, 2 more }
The results of a file search tool call. See the
[file search guide](https://platform.openai.com/docs/guides/tools-file-search) for more information.
id: string
The unique ID of the file search tool call.
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) id>)
queries: Array\<string\>
The queries used to search for files.
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) queries>)
status: "in\_progress" | "searching" | "completed" | 2 more
The status of the file search tool call. One of `in\_progress`,
`searching`, `incomplete` or `failed`,
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) status > (member) 0>)
"searching"
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) status > (member) 1>)
"completed"
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) status > (member) 2>)
"incomplete"
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) status > (member) 3>)
"failed"
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) status > (member) 4>)
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) status>)
type: "file\_search\_call"
The type of the file search tool call. Always `file\_search\_call`.
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) type>)
results?: Array\<Result\> | null
The results of the file search tool call.
attributes?: Record\<string, string | number | boolean\> | null
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard. Keys are strings
with a maximum length of 64 characters. Values are strings with a maximum
length of 512 characters, booleans, or numbers.
One of the following:
string
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) results > (items) > (property) attributes > (items) > (variant) 0>)
number
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) results > (items) > (property) attributes > (items) > (variant) 1>)
boolean
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) results > (items) > (property) attributes > (items) > (variant) 2>)
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) results > (items) > (property) attributes>)
file\_id?: string
The unique ID of the file.
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) results > (items) > (property) file_id>)
filename?: string
The name of the file.
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) results > (items) > (property) filename>)
score?: number
The relevance score of the file - a value between 0 and 1.
formatfloat
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) results > (items) > (property) score>)
text?: string
The text that was retrieved from the file.
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) results > (items) > (property) text>)
[](<#(resource) responses > (model) response_file_search_tool_call > (schema) > (property) results>)
[](<#(resource) responses > (model) response_file_search_tool_call > (schema)>)
ResponseFunctionToolCall { arguments, call\_id, name, 4 more }
A tool call to run a function. See the
[function calling guide](https://platform.openai.com/docs/guides/function-calling) for more information.
arguments: string
A JSON string of the arguments to pass to the function.
[](<#(resource) responses > (model) response_function_tool_call > (schema) > (property) arguments>)
call\_id: string
The unique ID of the function tool call generated by the model.
[](<#(resource) responses > (model) response_function_tool_call > (schema) > (property) call_id>)
name: string
The name of the function to run.
[](<#(resource) responses > (model) response_function_tool_call > (schema) > (property) name>)
type: "function\_call"
The type of the function tool call. Always `function\_call`.
[](<#(resource) responses > (model) response_function_tool_call > (schema) > (property) type>)
id?: string
The unique ID of the function tool call.
[](<#(resource) responses > (model) response_function_tool_call > (schema) > (property) id>)
namespace?: string
The namespace of the function to run.
[](<#(resource) responses > (model) response_function_tool_call > (schema) > (property) namespace>)
status?: "in\_progress" | "completed" | "incomplete"
The status of the item. One of `in\_progress`, `completed`, or
`incomplete`. Populated when items are returned via API.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_function_tool_call > (schema) > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) response_function_tool_call > (schema) > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) response_function_tool_call > (schema) > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_function_tool_call > (schema) > (property) status>)
[](<#(resource) responses > (model) response_function_tool_call > (schema)>)
ResponseFunctionToolCallOutputItem { id, call\_id, output, 3 more }
id: string
The unique ID of the function call tool output.
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema) > (property) id>)
call\_id: string
The unique ID of the function tool call generated by the model.
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema) > (property) call_id>)
output: string | Array\<[ResponseInputText](</api/reference/typescript/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } | [ResponseInputImage](</api/reference/typescript/resources/responses#(resource) responses > (model) response_input_image > (schema)>) { detail, type, file\_id, image\_url } | [ResponseInputFile](</api/reference/typescript/resources/responses#(resource) responses > (model) response_input_file > (schema)>) { type, detail, file\_data, 3 more } \>
The output from the function call generated by your code.
Can be a string or an list of output content.
One of the following:
string
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema) > (property) output > (variant) 0>)
Array\<[ResponseInputText](</api/reference/typescript/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } | [ResponseInputImage](</api/reference/typescript/resources/responses#(resource) responses > (model) response_input_image > (schema)>) { detail, type, file\_id, image\_url } | [ResponseInputFile](</api/reference/typescript/resources/responses#(resource) responses > (model) response_input_file > (schema)>) { type, detail, file\_data, 3 more } \>
ResponseInputText { text, type }
A text input to the model.
text: string
The text input to the model.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) text>)
type: "input\_text"
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_input_text > (schema)>)
ResponseInputImage { detail, type, file\_id, image\_url }
An image input to the model. Learn about [image inputs](https://platform.openai.com/docs/guides/vision).
detail: "low" | "high" | "auto" | "original"
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
file\_id?: string | null
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) file_id>)
image\_url?: string | null
The URL of the image to be sent to the model. A fully qualified URL or base64 encoded image in a data URL.
[](<#(resource) responses > (model) response_input_image > (schema) > (property) image_url>)
[](<#(resource) responses > (model) response_input_image > (schema)>)
ResponseInputFile { type, detail, file\_data, 3 more }
A file input to the model.
type: "input\_file"
The type of the input item. Always `input\_file`.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) type>)
detail?: "low" | "high"
The detail level of the file to be sent to the model. Use `low` for the default rendering behavior, or `high` to render the file at higher quality. Defaults to `low`.
One of the following:
"low"
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 0>)
"high"
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 1>)
[](<#(resource) responses > (model) response_input_file > (schema) > (property) detail>)
file\_data?: string
The content of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_data>)
file\_id?: string | null
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_id>)
file\_url?: string
The URL of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) file_url>)
filename?: string
The name of the file to be sent to the model.
[](<#(resource) responses > (model) response_input_file > (schema) > (property) filename>)
[](<#(resource) responses > (model) response_input_file > (schema)>)
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema) > (property) output > (variant) 1>)
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema) > (property) output>)
status: "in\_progress" | "completed" | "incomplete"
The status of the item. One of `in\_progress`, `completed`, or
`incomplete`. Populated when items are returned via API.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema) > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema) > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema) > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema) > (property) status>)
type: "function\_call\_output"
The type of the function tool call output. Always `function\_call\_output`.
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema) > (property) type>)
created\_by?: string
The identifier of the actor that created the item.
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema) > (property) created_by>)
[](<#(resource) responses > (model) response_function_tool_call_output_item > (schema)>)
ResponseFunctionWebSearch { id, action, status, type }
The results of a web search tool call. See the
[web search guide](https://platform.openai.com/docs/guides/tools-web-search) for more information.
id: string
The unique ID of the web search tool call.
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) id>)
action: Search { query, type, queries, sources } | OpenPage { type, url } | FindInPage { pattern, type, url }
An object describing the specific action taken in this web search call.
Includes details on how the model used the web (search, open\_page, find\_in\_page).
One of the following:
Search { query, type, queries, sources }
Action type “search” - Performs a web search query.
query: string
[DEPRECATED] The search query.
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 0 > (property) query>)
type: "search"
The action type.
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 0 > (property) type>)
queries?: Array\<string\>
The search queries.
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 0 > (property) queries>)
sources?: Array\<Source\>
The sources used in the search.
type: "url"
The type of source. Always `url`.
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 0 > (property) sources > (items) > (property) type>)
url: string
The URL of the source.
formaturi
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 0 > (property) sources > (items) > (property) url>)
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 0 > (property) sources>)
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 0>)
OpenPage { type, url }
Action type “open\_page” - Opens a specific URL from search results.
type: "open\_page"
The action type.
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 1 > (property) type>)
url?: string | null
The URL opened by the model.
formaturi
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 1 > (property) url>)
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 1>)
FindInPage { pattern, type, url }
Action type “find\_in\_page”: Searches for a pattern within a loaded page.
pattern: string
The pattern or text to search for within the page.
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 2 > (property) pattern>)
type: "find\_in\_page"
The action type.
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 2 > (property) type>)
url: string
The URL of the page searched for the pattern.
formaturi
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 2 > (property) url>)
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action > (variant) 2>)
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) action>)
status: "in\_progress" | "searching" | "completed" | "failed"
The status of the web search tool call.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) status > (member) 0>)
"searching"
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) status > (member) 1>)
"completed"
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) status > (member) 2>)
"failed"
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) status > (member) 3>)
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) status>)
type: "web\_search\_call"
The type of the web search tool call. Always `web\_search\_call`.
[](<#(resource) responses > (model) response_function_web_search > (schema) > (property) type>)
[](<#(resource) responses > (model) response_function_web_search > (schema)>)
ResponseComputerToolCall { id, call\_id, pending\_safety\_checks, 4 more }
A tool call to a computer use tool. See the
[computer use guide](https://platform.openai.com/docs/guides/tools-computer-use) for more information.
id: string
The unique ID of the computer call.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) id>)
call\_id: string
An identifier used when responding to the tool call with output.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) call_id>)
pending\_safety\_checks: Array\<PendingSafetyCheck\>
The pending safety checks for the computer call.
id: string
The ID of the pending safety check.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) pending_safety_checks > (items) > (property) id>)
code?: string | null
The type of the pending safety check.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) pending_safety_checks > (items) > (property) code>)
message?: string | null
Details about the pending safety check.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) pending_safety_checks > (items) > (property) message>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) pending_safety_checks>)
status: "in\_progress" | "completed" | "incomplete"
The status of the item. One of `in\_progress`, `completed`, or
`incomplete`. Populated when items are returned via API.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) status>)
type: "computer\_call"
The type of the computer call. Always `computer\_call`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) type>)
action?: Click { button, type, x, 2 more } | DoubleClick { keys, type, x, y } | Drag { path, type, keys } | 6 more
A click action.
One of the following:
Click { button, type, x, 2 more }
A click action.
button: "left" | "right" | "wheel" | 2 more
Indicates which mouse button was pressed during the click. One of `left`, `right`, `wheel`, `back`, or `forward`.
One of the following:
"left"
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) button > (member) 0>)
"right"
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) button > (member) 1>)
"wheel"
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) button > (member) 2>)
"back"
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) button > (member) 3>)
"forward"
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) button > (member) 4>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) button>)
type: "click"
Specifies the event type. For a click action, this property is always `click`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) type>)
x: number
The x-coordinate where the click occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) x>)
y: number
The y-coordinate where the click occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) y>)
keys?: Array\<string\> | null
The keys being held while clicking.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0 > (property) keys>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 0>)
DoubleClick { keys, type, x, y }
A double click action.
keys: Array\<string\> | null
The keys being held while double-clicking.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 1 > (property) keys>)
type: "double\_click"
Specifies the event type. For a double click action, this property is always set to `double\_click`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 1 > (property) type>)
x: number
The x-coordinate where the double click occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 1 > (property) x>)
y: number
The y-coordinate where the double click occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 1 > (property) y>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 1>)
Drag { path, type, keys }
A drag action.
path: Array\<Path\>
An array of coordinates representing the path of the drag action. Coordinates will appear as an array of objects, eg
```
`[
{ x: 100, y: 200 },
{ x: 200, y: 300 }
]`
```
x: number
The x-coordinate.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 2 > (property) path > (items) > (property) x>)
y: number
The y-coordinate.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 2 > (property) path > (items) > (property) y>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 2 > (property) path>)
type: "drag"
Specifies the event type. For a drag action, this property is always set to `drag`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 2 > (property) type>)
keys?: Array\<string\> | null
The keys being held while dragging the mouse.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 2 > (property) keys>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 2>)
Keypress { keys, type }
A collection of keypresses the model would like to perform.
keys: Array\<string\>
The combination of keys the model is requesting to be pressed. This is an array of strings, each representing a key.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 3 > (property) keys>)
type: "keypress"
Specifies the event type. For a keypress action, this property is always set to `keypress`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 3 > (property) type>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 3>)
Move { type, x, y, keys }
A mouse move action.
type: "move"
Specifies the event type. For a move action, this property is always set to `move`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 4 > (property) type>)
x: number
The x-coordinate to move to.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 4 > (property) x>)
y: number
The y-coordinate to move to.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 4 > (property) y>)
keys?: Array\<string\> | null
The keys being held while moving the mouse.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 4 > (property) keys>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 4>)
Screenshot { type }
A screenshot action.
type: "screenshot"
Specifies the event type. For a screenshot action, this property is always set to `screenshot`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 5 > (property) type>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 5>)
Scroll { scroll\_x, scroll\_y, type, 3 more }
A scroll action.
scroll\_x: number
The horizontal scroll distance.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 6 > (property) scroll_x>)
scroll\_y: number
The vertical scroll distance.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 6 > (property) scroll_y>)
type: "scroll"
Specifies the event type. For a scroll action, this property is always set to `scroll`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 6 > (property) type>)
x: number
The x-coordinate where the scroll occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 6 > (property) x>)
y: number
The y-coordinate where the scroll occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 6 > (property) y>)
keys?: Array\<string\> | null
The keys being held while scrolling.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 6 > (property) keys>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 6>)
Type { text, type }
An action to type in text.
text: string
The text to type.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 7 > (property) text>)
type: "type"
Specifies the event type. For a type action, this property is always set to `type`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 7 > (property) type>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 7>)
Wait { type }
A wait action.
type: "wait"
Specifies the event type. For a wait action, this property is always set to `wait`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 8 > (property) type>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action > (variant) 8>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) action>)
actions?: [ComputerActionList](</api/reference/typescript/resources/responses#(resource) responses > (model) computer_action_list > (schema)>) { , , , 6 more }
Flattened batched actions for `computer\_use`. Each action includes an
`type` discriminator and action-specific fields.
One of the following:
Click { button, type, x, 2 more }
A click action.
button: "left" | "right" | "wheel" | 2 more
Indicates which mouse button was pressed during the click. One of `left`, `right`, `wheel`, `back`, or `forward`.
One of the following:
"left"
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) button > (member) 0>)
"right"
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) button > (member) 1>)
"wheel"
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) button > (member) 2>)
"back"
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) button > (member) 3>)
"forward"
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) button > (member) 4>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) button>)
type: "click"
Specifies the event type. For a click action, this property is always `click`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) type>)
x: number
The x-coordinate where the click occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) x>)
y: number
The y-coordinate where the click occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) y>)
keys?: Array\<string\> | null
The keys being held while clicking.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0 > (property) keys>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 0>)
DoubleClick { keys, type, x, y }
A double click action.
keys: Array\<string\> | null
The keys being held while double-clicking.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 1 > (property) keys>)
type: "double\_click"
Specifies the event type. For a double click action, this property is always set to `double\_click`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 1 > (property) type>)
x: number
The x-coordinate where the double click occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 1 > (property) x>)
y: number
The y-coordinate where the double click occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 1 > (property) y>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 1>)
Drag { path, type, keys }
A drag action.
path: Array\<Path\>
An array of coordinates representing the path of the drag action. Coordinates will appear as an array of objects, eg
```
`[
{ x: 100, y: 200 },
{ x: 200, y: 300 }
]`
```
x: number
The x-coordinate.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 2 > (property) path > (items) > (property) x>)
y: number
The y-coordinate.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 2 > (property) path > (items) > (property) y>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 2 > (property) path>)
type: "drag"
Specifies the event type. For a drag action, this property is always set to `drag`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 2 > (property) type>)
keys?: Array\<string\> | null
The keys being held while dragging the mouse.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 2 > (property) keys>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 2>)
Keypress { keys, type }
A collection of keypresses the model would like to perform.
keys: Array\<string\>
The combination of keys the model is requesting to be pressed. This is an array of strings, each representing a key.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 3 > (property) keys>)
type: "keypress"
Specifies the event type. For a keypress action, this property is always set to `keypress`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 3 > (property) type>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 3>)
Move { type, x, y, keys }
A mouse move action.
type: "move"
Specifies the event type. For a move action, this property is always set to `move`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 4 > (property) type>)
x: number
The x-coordinate to move to.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 4 > (property) x>)
y: number
The y-coordinate to move to.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 4 > (property) y>)
keys?: Array\<string\> | null
The keys being held while moving the mouse.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 4 > (property) keys>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 4>)
Screenshot { type }
A screenshot action.
type: "screenshot"
Specifies the event type. For a screenshot action, this property is always set to `screenshot`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 5 > (property) type>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 5>)
Scroll { scroll\_x, scroll\_y, type, 3 more }
A scroll action.
scroll\_x: number
The horizontal scroll distance.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 6 > (property) scroll_x>)
scroll\_y: number
The vertical scroll distance.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 6 > (property) scroll_y>)
type: "scroll"
Specifies the event type. For a scroll action, this property is always set to `scroll`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 6 > (property) type>)
x: number
The x-coordinate where the scroll occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 6 > (property) x>)
y: number
The y-coordinate where the scroll occurred.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 6 > (property) y>)
keys?: Array\<string\> | null
The keys being held while scrolling.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 6 > (property) keys>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 6>)
Type { text, type }
An action to type in text.
text: string
The text to type.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 7 > (property) text>)
type: "type"
Specifies the event type. For a type action, this property is always set to `type`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 7 > (property) type>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 7>)
Wait { type }
A wait action.
type: "wait"
Specifies the event type. For a wait action, this property is always set to `wait`.
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 8 > (property) type>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions + (resource) responses > (model) computer_action > (schema) > (variant) 8>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema) > (property) actions>)
[](<#(resource) responses > (model) response_computer_tool_call > (schema)>)
ResponseComputerToolCallOutputItem { id, call\_id, output, 4 more }
id: string
The unique ID of the computer call tool output.
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) id>)
call\_id: string
The ID of the computer tool call that produced the output.
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) call_id>)
output: [ResponseComputerToolCallOutputScreenshot](</api/reference/typescript/resources/responses#(resource) responses > (model) response_computer_tool_call_output_screenshot > (schema)>) { type, file\_id, image\_url }
A computer screenshot image used with the computer use tool.
type: "computer\_screenshot"
Specifies the event type. For a computer screenshot, this property is
always set to `computer\_screenshot`.
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) output + (resource) responses > (model) response_computer_tool_call_output_screenshot > (schema) > (property) type>)
file\_id?: string
The identifier of an uploaded file that contains the screenshot.
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) output + (resource) responses > (model) response_computer_tool_call_output_screenshot > (schema) > (property) file_id>)
image\_url?: string
The URL of the screenshot image.
formaturi
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) output + (resource) responses > (model) response_computer_tool_call_output_screenshot > (schema) > (property) image_url>)
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) output>)
status: "completed" | "incomplete" | "failed" | "in\_progress"
The status of the message input. One of `in\_progress`, `completed`, or
`incomplete`. Populated when input items are returned via API.
One of the following:
"completed"
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) status > (member) 0>)
"incomplete"
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) status > (member) 1>)
"failed"
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) status > (member) 2>)
"in\_progress"
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) status > (member) 3>)
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) status>)
type: "computer\_call\_output"
The type of the computer tool call output. Always `computer\_call\_output`.
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) type>)
acknowledged\_safety\_checks?: Array\<AcknowledgedSafetyCheck\>
The safety checks reported by the API that have been acknowledged by the
developer.
id: string
The ID of the pending safety check.
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) acknowledged_safety_checks > (items) > (property) id>)
code?: string | null
The type of the pending safety check.
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) acknowledged_safety_checks > (items) > (property) code>)
message?: string | null
Details about the pending safety check.
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) acknowledged_safety_checks > (items) > (property) message>)
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) acknowledged_safety_checks>)
created\_by?: string
The identifier of the actor that created the item.
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema) > (property) created_by>)
[](<#(resource) responses > (model) response_computer_tool_call_output_item > (schema)>)
ResponseReasoningItem { id, summary, type, 3 more }
A description of the chain of thought used by a reasoning model while generating
a response. Be sure to include these items in your `input` to the Responses API
for subsequent turns of a conversation if you are manually
[managing context](https://platform.openai.com/docs/guides/conversation-state).
id: string
The unique identifier of the reasoning content.
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) id>)
summary: Array\<Summary\>
Reasoning summary content.
text: string
A summary of the reasoning output from the model so far.
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) summary > (items) > (property) text>)
type: "summary\_text"
The type of the object. Always `summary\_text`.
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) summary > (items) > (property) type>)
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) summary>)
type: "reasoning"
The type of the object. Always `reasoning`.
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) type>)
content?: Array\<Content\>
Reasoning text content.
text: string
The reasoning text from the model.
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) content > (items) > (property) text>)
type: "reasoning\_text"
The type of the reasoning text. Always `reasoning\_text`.
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) content > (items) > (property) type>)
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) content>)
encrypted\_content?: string | null
The encrypted content of the reasoning item - populated when a response is
generated with `reasoning.encrypted\_content` in the `include` parameter.
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) encrypted_content>)
status?: "in\_progress" | "completed" | "incomplete"
The status of the item. One of `in\_progress`, `completed`, or
`incomplete`. Populated when items are returned via API.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_reasoning_item > (schema) > (property) status>)
[](<#(resource) responses > (model) response_reasoning_item > (schema)>)
ResponseToolSearchCall { id, arguments, call\_id, 4 more }
id: string
The unique ID of the tool search call item.
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) id>)
arguments: unknown
Arguments used for the tool search call.
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) arguments>)
call\_id: string | null
The unique ID of the tool search call generated by the model.
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) call_id>)
execution: "server" | "client"
Whether tool search was executed by the server or by the client.
One of the following:
"server"
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) execution > (member) 0>)
"client"
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) execution > (member) 1>)
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) execution>)
status: "in\_progress" | "completed" | "incomplete"
The status of the tool search call item that was recorded.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) status>)
type: "tool\_search\_call"
The type of the item. Always `tool\_search\_call`.
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) type>)
created\_by?: string
The identifier of the actor that created the item.
[](<#(resource) responses > (model) response_tool_search_call > (schema) > (property) created_by>)
[](<#(resource) responses > (model) response_tool_search_call > (schema)>)
ResponseToolSearchOutputItem { id, call\_id, execution, 4 more }
id: string
The unique ID of the tool search output item.
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) id>)
call\_id: string | null
The unique ID of the tool search call generated by the model.
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) call_id>)
execution: "server" | "client"
Whether tool search was executed by the server or by the client.
One of the following:
"server"
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) execution > (member) 0>)
"client"
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) execution > (member) 1>)
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) execution>)
status: "in\_progress" | "completed" | "incomplete"
The status of the tool search output item that was recorded.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) status>)
tools: Array\<[Tool](</api/reference/typescript/resources/responses#(resource) responses > (model) tool > (schema)>)\>
The loaded tool definitions returned by tool search.
One of the following:
FunctionTool { name, parameters, strict, 3 more }
Defines a function in your own code the model can choose to call. Learn more about [function calling](https://platform.openai.com/docs/guides/function-calling).
name: string
The name of the function to call.
[](<#(resource) responses > (model) function_tool > (schema) > (property) name>)
parameters: Record\<string, unknown\> | null
A JSON schema object describing the parameters of the function.
[](<#(resource) responses > (model) function_tool > (schema) > (property) parameters>)
strict: boolean | null
Whether to enforce strict parameter validation. Default `true`.
[](<#(resource) responses > (model) function_tool > (schema) > (property) strict>)
type: "function"
The type of the function tool. Always `function`.
[](<#(resource) responses > (model) function_tool > (schema) > (property) type>)
defer\_loading?: boolean
Whether this function is deferred and loaded via tool search.
[](<#(resource) responses > (model) function_tool > (schema) > (property) defer_loading>)
description?: string | null
A description of the function. Used by the model to determine whether or not to call the function.
[](<#(resource) responses > (model) function_tool > (schema) > (property) description>)
[](<#(resource) responses > (model) function_tool > (schema)>)
FileSearchTool { type, vector\_store\_ids, filters, 2 more }
A tool that searches for relevant content from uploaded files. Learn more about the [file search tool](https://platform.openai.com/docs/guides/tools-file-search).
type: "file\_search"
The type of the file search tool. Always `file\_search`.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) type>)
vector\_store\_ids: Array\<string\>
The IDs of the vector stores to search.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) vector_store_ids>)
filters?: [ComparisonFilter](</api/reference/typescript/resources/$shared#(resource) $shared > (model) comparison_filter > (schema)>) { key, type, value } | [CompoundFilter](</api/reference/typescript/resources/$shared#(resource) $shared > (model) compound_filter > (schema)>) { filters, type } | null
A filter to apply.
One of the following:
ComparisonFilter { key, type, value }
A filter used to compare a specified attribute key to a given value using a defined comparison operation.
key: string
The key to compare against the value.
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) key>)
type: "eq" | "ne" | "gt" | 5 more
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
value: string | number | boolean | Array\<string | number\>
The value to compare against the attribute key; supports string, number, or boolean types.
One of the following:
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 0>)
number
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 1>)
boolean
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 2>)
Array\<string | number\>
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 0>)
number
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 1>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value>)
[](<#(resource) $shared > (model) comparison_filter > (schema)>)
CompoundFilter { filters, type }
Combine multiple filters using `and` or `or`.
filters: Array\<[ComparisonFilter](</api/reference/typescript/resources/$shared#(resource) $shared > (model) comparison_filter > (schema)>) { key, type, value } | unknown\>
Array of filters to combine. Items can be `ComparisonFilter` or `CompoundFilter`.
One of the following:
ComparisonFilter { key, type, value }
A filter used to compare a specified attribute key to a given value using a defined comparison operation.
key: string
The key to compare against the value.
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) key>)
type: "eq" | "ne" | "gt" | 5 more
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
value: string | number | boolean | Array\<string | number\>
The value to compare against the attribute key; supports string, number, or boolean types.
One of the following:
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 0>)
number
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 1>)
boolean
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 2>)
Array\<string | number\>
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
type: "and" | "or"
Type of operation: `and` or `or`.
One of the following:
"and"
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type > (member) 0>)
"or"
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type > (member) 1>)
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type>)
[](<#(resource) $shared > (model) compound_filter > (schema)>)
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) filters>)
max\_num\_results?: number
The maximum number of results to return. This number should be between 1 and 50 inclusive.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) max_num_results>)
ranking\_options?: RankingOptions { hybrid\_search, ranker, score\_threshold }
Ranking options for search.
hybrid\_search?: HybridSearch { embedding\_weight, text\_weight }
Weights that control how reciprocal rank fusion balances semantic embedding matches versus sparse keyword matches when hybrid search is enabled.
embedding\_weight: number
The weight of the embedding in the reciprocal ranking fusion.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) hybrid_search > (property) embedding_weight>)
text\_weight: number
The weight of the text in the reciprocal ranking fusion.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) hybrid_search > (property) text_weight>)
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) hybrid_search>)
ranker?: "auto" | "default-2024-11-15"
The ranker to use for the file search.
One of the following:
"auto"
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) ranker > (member) 0>)
"default-2024-11-15"
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) ranker>)
score\_threshold?: number
The score threshold for the file search, a number between 0 and 1. Numbers closer to 1 will attempt to return only the most relevant results, but may return fewer results.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) score_threshold>)
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options>)
[](<#(resource) responses > (model) file_search_tool > (schema)>)
ComputerTool { type }
A tool that controls a virtual computer. Learn more about the [computer tool](https://platform.openai.com/docs/guides/tools-computer-use).
type: "computer"
The type of the computer tool. Always `computer`.
[](<#(resource) responses > (model) computer_tool > (schema) > (property) type>)
[](<#(resource) responses > (model) computer_tool > (schema)>)
ComputerUsePreviewTool { display\_height, display\_width, environment, type }
A tool that controls a virtual computer. Learn more about the [computer tool](https://platform.openai.com/docs/guides/tools-computer-use).
display\_height: number
The height of the computer display.
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) display_height>)
display\_width: number
The width of the computer display.
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) display_width>)
environment: "windows" | "mac" | "linux" | 2 more
The type of computer environment to control.
One of the following:
"windows"
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment > (member) 0>)
"mac"
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment > (member) 1>)
"linux"
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment > (member) 2>)
"ubuntu"
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment > (member) 3>)
"browser"
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment > (member) 4>)
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment>)
type: "computer\_use\_preview"
The type of the computer use tool. Always `computer\_use\_preview`.
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) type>)
[](<#(resource) responses > (model) computer_use_preview_tool > (schema)>)
WebSearchTool { type, filters, search\_context\_size, user\_location }
Search the Internet for sources related to the prompt. Learn more about the
[web search tool](https://platform.openai.com/docs/guides/tools-web-search).
type: "web\_search" | "web\_search\_2025\_08\_26"
The type of the web search tool. One of `web\_search` or `web\_search\_2025\_08\_26`.
One of the following:
"web\_search"
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) type > (member) 0>)
"web\_search\_2025\_08\_26"
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) type > (member) 1>)
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) type>)
filters?: Filters | null
Filters for the search.
allowed\_domains?: Array\<string\> | null
Allowed domains for the search. If not provided, all domains are allowed.
Subdomains of the provided domains are allowed as well.
Example: `["pubmed.ncbi.nlm.nih.gov"]`
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) filters > (property) allowed_domains>)
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) filters>)
search\_context\_size?: "low" | "medium" | "high"
High level guidance for the amount of context window space to use for the search. One of `low`, `medium`, or `high`. `medium` is the default.
One of the following:
"low"
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) search_context_size > (member) 0>)
"medium"
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) search_context_size > (member) 1>)
"high"
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) search_context_size > (member) 2>)
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) search_context_size>)
user\_location?: UserLocation | null
The approximate location of the user.
city?: string | null
Free text input for the city of the user, e.g. `San Francisco`.
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location > (property) city>)
country?: string | null
The two-letter [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1) of the user, e.g. `US`.
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location > (property) country>)
region?: string | null
Free text input for the region of the user, e.g. `California`.
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location > (property) region>)
timezone?: string | null
The [IANA timezone](https://timeapi.io/documentation/iana-timezones) of the user, e.g. `America/Los\_Angeles`.
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location > (property) timezone>)
type?: "approximate"
The type of location approximation. Always `approximate`.
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location > (property) type>)
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location>)
[](<#(resource) responses > (model) web_search_tool > (schema)>)
Mcp { server\_label, type, allowed\_tools, 7 more }
Give the model access to additional tools via remote Model Context Protocol
(MCP) servers. [Learn more about MCP](https://platform.openai.com/docs/guides/tools-remote-mcp).
server\_label: string
A label for this MCP server, used to identify it in tool calls.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) server_label>)
type: "mcp"
The type of the MCP tool. Always `mcp`.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) type>)
allowed\_tools?: Array\<string\> | McpToolFilter { read\_only, tool\_names } | null
List of allowed tool names or a filter object.
One of the following:
Array\<string\>
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) allowed_tools > (variant) 0>)
McpToolFilter { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only?: boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) allowed_tools > (variant) 1 > (property) read_only>)
tool\_names?: Array\<string\>
List of allowed tool names.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) allowed_tools > (variant) 1 > (property) tool_names>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) allowed_tools > (variant) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) allowed_tools>)
authorization?: string
An OAuth access token that can be used with a remote MCP server, either
with a custom MCP server URL or a service connector. Your application
must handle the OAuth authorization flow and provide the token here.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) authorization>)
connector\_id?: "connector\_dropbox" | "connector\_gmail" | "connector\_googlecalendar" | 5 more
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
"connector\_dropbox"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 0>)
"connector\_gmail"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 1>)
"connector\_googlecalendar"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 2>)
"connector\_googledrive"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 3>)
"connector\_microsoftteams"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 4>)
"connector\_outlookcalendar"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 5>)
"connector\_outlookemail"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 6>)
"connector\_sharepoint"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 7>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id>)
defer\_loading?: boolean
Whether this MCP tool is deferred and discovered via tool search.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) defer_loading>)
headers?: Record\<string, string\> | null
Optional HTTP headers to send to the MCP server. Use for authentication
or other purposes.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) headers>)
require\_approval?: McpToolApprovalFilter { always, never } | "always" | "never" | null
Specify which of the MCP server’s tools require approval.
One of the following:
McpToolApprovalFilter { always, never }
Specify which of the MCP server’s tools require approval. Can be
`always`, `never`, or a filter object associated with tools
that require approval.
always?: Always { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only?: boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) always > (property) read_only>)
tool\_names?: Array\<string\>
List of allowed tool names.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) always > (property) tool_names>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) always>)
never?: Never { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only?: boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) never > (property) read_only>)
tool\_names?: Array\<string\>
List of allowed tool names.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) never > (property) tool_names>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) never>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0>)
"always" | "never"
"always"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 1 > (member) 0>)
"never"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 1 > (member) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval>)
server\_description?: string
Optional description of the MCP server, used to provide more context.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) server_description>)
server\_url?: string
The URL for the MCP server. One of `server\_url` or `connector\_id` must be
provided.
formaturi
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) server_url>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5>)
CodeInterpreter { container, type }
A tool that runs Python code to help generate a response to a prompt.
container: string | CodeInterpreterToolAuto { type, file\_ids, memory\_limit, network\_policy }
The code interpreter container. Can be a container ID or an object that
specifies uploaded file IDs to make available to your code, along with an
optional `memory\_limit` setting.
One of the following:
string
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 0>)
CodeInterpreterToolAuto { type, file\_ids, memory\_limit, network\_policy }
Configuration for a code interpreter container. Optionally specify the IDs of the files to run the code on.
type: "auto"
Always `auto`.
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) type>)
file\_ids?: Array\<string\>
An optional list of uploaded files to make available to your code.
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) file_ids>)
memory\_limit?: "1g" | "4g" | "16g" | "64g" | null
The memory limit for the code interpreter container.
One of the following:
"1g"
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 0>)
"4g"
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 1>)
"16g"
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 2>)
"64g"
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 3>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit>)
network\_policy?: [ContainerNetworkPolicyDisabled](</api/reference/typescript/resources/responses#(resource) responses > (model) container_network_policy_disabled > (schema)>) { type } | [ContainerNetworkPolicyAllowlist](</api/reference/typescript/resources/responses#(resource) responses > (model) container_network_policy_allowlist > (schema)>) { allowed\_domains, type, domain\_secrets }
Network access policy for the container.
One of the following:
ContainerNetworkPolicyDisabled { type }
type: "disabled"
Disable outbound network access. Always `disabled`.
[](<#(resource) responses > (model) container_network_policy_disabled > (schema) > (property) type>)
[](<#(resource) responses > (model) container_network_policy_disabled > (schema)>)
ContainerNetworkPolicyAllowlist { allowed\_domains, type, domain\_secrets }
allowed\_domains: Array\<string\>
A list of allowed domains when type is `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) allowed_domains>)
type: "allowlist"
Allow outbound network access only to specified domains. Always `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) type>)
domain\_secrets?: Array\<[ContainerNetworkPolicyDomainSecret](</api/reference/typescript/resources/responses#(resource) responses > (model) container_network_policy_domain_secret > (schema)>) { domain, name, value } \>
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
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) network_policy>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container>)
type: "code\_interpreter"
The type of the code interpreter tool. Always `code\_interpreter`.
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) type>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 6>)
ImageGeneration { type, action, background, 9 more }
A tool that generates images using the GPT image models.
type: "image\_generation"
The type of the image generation tool. Always `image\_generation`.
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) type>)
action?: "generate" | "edit" | "auto"
Whether to generate a new image or edit an existing image. Default: `auto`.
One of the following:
"generate"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) action > (member) 0>)
"edit"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) action > (member) 1>)
"auto"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) action > (member) 2>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) action>)
background?: "transparent" | "opaque" | "auto"
Background type for the generated image. One of `transparent`,
`opaque`, or `auto`. Default: `auto`.
One of the following:
"transparent"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) background > (member) 0>)
"opaque"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) background > (member) 1>)
"auto"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) background > (member) 2>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) background>)
input\_fidelity?: "high" | "low" | null
Control how much effort the model will exert to match the style and features, especially facial features, of input images. This parameter is only supported for `gpt-image-1` and `gpt-image-1.5` and later models, unsupported for `gpt-image-1-mini`. Supports `high` and `low`. Defaults to `low`.
One of the following:
"high"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_fidelity > (member) 0>)
"low"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_fidelity > (member) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_fidelity>)
input\_image\_mask?: InputImageMask { file\_id, image\_url }
Optional mask for inpainting. Contains `image\_url`
(string, optional) and `file\_id` (string, optional).
file\_id?: string
File ID for the mask image.
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_image_mask > (property) file_id>)
image\_url?: string
Base64-encoded mask image.
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_image_mask > (property) image_url>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_image_mask>)
model?: (string & {}) | "gpt-image-1" | "gpt-image-1-mini" | "gpt-image-1.5"
The image generation model to use. Default: `gpt-image-1`.
One of the following:
(string & {})
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) model > (variant) 0>)
"gpt-image-1" | "gpt-image-1-mini" | "gpt-image-1.5"
"gpt-image-1"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) model > (variant) 1 > (member) 0>)
"gpt-image-1-mini"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) model > (variant) 1 > (member) 1>)
"gpt-image-1.5"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) model > (variant) 1 > (member) 2>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) model > (variant) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) model>)
moderation?: "auto" | "low"
Moderation level for the generated image. Default: `auto`.
One of the following:
"auto"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) moderation > (member) 0>)
"low"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) moderation > (member) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) moderation>)
output\_compression?: number
Compression level for the output image. Default: 100.
minimum0
maximum100
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) output_compression>)
output\_format?: "png" | "webp" | "jpeg"
The output format of the generated image. One of `png`, `webp`, or
`jpeg`. Default: `png`.
One of the following:
"png"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) output_format > (member) 0>)
"webp"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) output_format > (member) 1>)
"jpeg"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) output_format > (member) 2>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) output_format>)
partial\_images?: number
Number of partial images to generate in streaming mode, from 0 (default value) to 3.
minimum0
maximum3
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) partial_images>)
quality?: "low" | "medium" | "high" | "auto"
The quality of the generated image. One of `low`, `medium`, `high`,
or `auto`. Default: `auto`.
One of the following:
"low"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) quality > (member) 0>)
"medium"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) quality > (member) 1>)
"high"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) quality > (member) 2>)
"auto"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) quality > (member) 3>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) quality>)
size?: "1024x1024" | "1024x1536" | "1536x1024" | "auto"
The size of the generated image. One of `1024x1024`, `1024x1536`,
`1536x1024`, or `auto`. Default: `auto`.
One of the following:
"1024x1024"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) size > (member) 0>)
"1024x1536"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) size > (member) 1>)
"1536x1024"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) size > (member) 2>)
"auto"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) size > (member) 3>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) size>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7>)
LocalShell { type }
A tool that allows the model to execute shell commands in a local environment.
type: "local\_shell"
The type of the local shell tool. Always `local\_shell`.
[](<#(resource) responses > (model) tool > (schema) > (variant) 8 > (property) type>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 8>)
FunctionShellTool { type, environment }
A tool that allows the model to execute shell commands.
type: "shell"
The type of the shell tool. Always `shell`.
[](<#(resource) responses > (model) function_shell_tool > (schema) > (property) type>)
environment?: [ContainerAuto](</api/reference/typescript/resources/responses#(resource) responses > (model) container_auto > (schema)>) { type, file\_ids, memory\_limit, 2 more } | [LocalEnvironment](</api/reference/typescript/resources/responses#(resource) responses > (model) local_environment > (schema)>) { type, skills } | [ContainerReference](</api/reference/typescript/resources/responses#(resource) responses > (model) container_reference > (schema)>) { container\_id, type } | null
One of the following:
ContainerAuto { type, file\_ids, memory\_limit, 2 more }
type: "container\_auto"
Automatically creates a container for this request
[](<#(resource) responses > (model) container_auto > (schema) > (property) type>)
file\_ids?: Array\<string\>
An optional list of uploaded files to make available to your code.
[](<#(resource) responses > (model) container_auto > (schema) > (property) file_ids>)
memory\_limit?: "1g" | "4g" | "16g" | "64g" | null
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
network\_policy?: [ContainerNetworkPolicyDisabled](</api/reference/typescript/resources/responses#(resource) responses > (model) container_network_policy_disabled > (schema)>) { type } | [ContainerNetworkPolicyAllowlist](</api/reference/typescript/resources/responses#(resource) responses > (model) container_network_policy_allowlist > (schema)>) { allowed\_domains, type, domain\_secrets }
Network access policy for the container.
One of the following:
ContainerNetworkPolicyDisabled { type }
type: "disabled"
Disable outbound network access. Always `disabled`.
[](<#(resource) responses > (model) container_network_policy_disabled > (schema) > (property) type>)
[](<#(resource) responses > (model) container_network_policy_disabled > (schema)>)
ContainerNetworkPolicyAllowlist { allowed\_domains, type, domain\_secrets }
allowed\_domains: Array\<string\>
A list of allowed domains when type is `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) allowed_domains>)
type: "allowlist"
Allow outbound network access only to specified domains. Always `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) type>)
domain\_secrets?: Array\<[ContainerNetworkPolicyDomainSecret](</api/reference/typescript/resources/responses#(resource) responses > (model) container_network_policy_domain_secret > (schema)>) { domain, name, value } \>
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
skills?: Array\<[SkillReference](</api/reference/typescript/resources/responses#(resource) responses > (model) skill_reference > (schema)>) { skill\_id, type, version } | [InlineSkill](</api/reference/typescript/resources/responses#(resource) responses > (model) inline_skill > (schema)>) { description, name, source, type } \>
An optional list of skills referenced by id or inline data.
One of the following:
SkillReference { skill\_id, type, version }
skill\_id: string
The ID of the referenced skill.
maxLength64
minLength1
[](<#(resource) responses > (model) skill_reference > (schema) > (property) skill_id>)
type: "skill\_reference"
References a skill created with the /v1/skills endpoint.
[](<#(resource) responses > (model) skill_reference > (schema) > (property) type>)
version?: string
Optional skill version. Use a positive integer or ‘latest’. Omit for default.
[](<#(resource) responses > (model) skill_reference > (schema) > (property) version>)
[](<#(resource) responses > (model) skill_reference > (schema)>)
InlineSkill { description, name, source, type }
description: string
The description of the skill.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) description>)
name: string
The name of the skill.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) name>)
source: [InlineSkillSource](</api/reference/typescript/resources/responses#(resource) responses > (model) inline_skill_source > (schema)>) { data, media\_type, type }
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
LocalEnvironment { type, skills }
type: "local"
Use a local computer environment.
[](<#(resource) responses > (model) local_environment > (schema) > (property) type>)
skills?: Array\<[LocalSkill](</api/reference/typescript/resources/responses#(resource) responses > (model) local_skill > (schema)>) { description, name, path } \>
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
ContainerReference { container\_id, type }
container\_id: string
The ID of the referenced container.
[](<#(resource) responses > (model) container_reference > (schema) > (property) container_id>)
type: "container\_reference"
References a container created with the /v1/containers endpoint
[](<#(resource) responses > (model) container_reference > (schema) > (property) type>)
[](<#(resource) responses > (model) container_reference > (schema)>)
[](<#(resource) responses > (model) function_shell_tool > (schema) > (property) environment>)
[](<#(resource) responses > (model) function_shell_tool > (schema)>)
CustomTool { name, type, defer\_loading, 2 more }
A custom tool that processes input using a specified format. Learn more about [custom tools](https://platform.openai.com/docs/guides/function-calling#custom-tools)
name: string
The name of the custom tool, used to identify it in tool calls.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) name>)
type: "custom"
The type of the custom tool. Always `custom`.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) type>)
defer\_loading?: boolean
Whether this tool should be deferred and discovered via tool search.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) defer_loading>)
description?: string
Optional description of the custom tool, used to provide more context.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) description>)
format?: [CustomToolInputFormat](</api/reference/typescript/resources/$shared#(resource) $shared > (model) custom_tool_input_format > (schema)>)
The input format for the custom tool. Default is unconstrained text.
One of the following:
Text { type }
Unconstrained free-form text.
type: "text"
Unconstrained text format. Always `text`.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 0 > (property) type>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 0>)
Grammar { definition, syntax, type }
A grammar defined by the user.
definition: string
The grammar definition.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) definition>)
syntax: "lark" | "regex"
The syntax of the grammar definition. One of `lark` or `regex`.
One of the following:
"lark"
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax > (member) 0>)
"regex"
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax > (member) 1>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax>)
type: "grammar"
Grammar format. Always `grammar`.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) type>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format>)
[](<#(resource) responses > (model) custom_tool > (schema)>)
NamespaceTool { description, name, tools, type }
Groups function/custom tools under a shared namespace.
description: string
A description of the namespace shown to the model.
minLength1
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) description>)
name: string
The namespace name used in tool calls (for example, `crm`).
minLength1
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) name>)
tools: Array\<Function { name, type, defer\_loading, 3 more } | [CustomTool](</api/reference/typescript/resources/responses#(resource) responses > (model) custom_tool > (schema)>) { name, type, defer\_loading, 2 more } \>
The function/custom tools available inside this namespace.
One of the following:
Function { name, type, defer\_loading, 3 more }
name: string
maxLength128
minLength1
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) name>)
type: "function"
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) type>)
defer\_loading?: boolean
Whether this function should be deferred and discovered via tool search.
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) defer_loading>)
description?: string | null
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) description>)
parameters?: unknown
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) parameters>)
strict?: boolean | null
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) strict>)
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0>)
CustomTool { name, type, defer\_loading, 2 more }
A custom tool that processes input using a specified format. Learn more about [custom tools](https://platform.openai.com/docs/guides/function-calling#custom-tools)
name: string
The name of the custom tool, used to identify it in tool calls.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) name>)
type: "custom"
The type of the custom tool. Always `custom`.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) type>)
defer\_loading?: boolean
Whether this tool should be deferred and discovered via tool search.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) defer_loading>)
description?: string
Optional description of the custom tool, used to provide more context.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) description>)
format?: [CustomToolInputFormat](</api/reference/typescript/resources/$shared#(resource) $shared > (model) custom_tool_input_format > (schema)>)
The input format for the custom tool. Default is unconstrained text.
One of the following:
Text { type }
Unconstrained free-form text.
type: "text"
Unconstrained text format. Always `text`.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 0 > (property) type>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 0>)
Grammar { definition, syntax, type }
A grammar defined by the user.
definition: string
The grammar definition.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) definition>)
syntax: "lark" | "regex"
The syntax of the grammar definition. One of `lark` or `regex`.
One of the following:
"lark"
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax > (member) 0>)
"regex"
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax > (member) 1>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax>)
type: "grammar"
Grammar format. Always `grammar`.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) type>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format>)
[](<#(resource) responses > (model) custom_tool > (schema)>)
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools>)
type: "namespace"
The type of the tool. Always `namespace`.
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) type>)
[](<#(resource) responses > (model) namespace_tool > (schema)>)
ToolSearchTool { type, description, execution, parameters }
Hosted or BYOT tool search configuration for deferred tools.
type: "tool\_search"
The type of the tool. Always `tool\_search`.
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) type>)
description?: string | null
Description shown to the model for a client-executed tool search tool.
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) description>)
execution?: "server" | "client"
Whether tool search is executed by the server or by the client.
One of the following:
"server"
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) execution > (member) 0>)
"client"
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) execution > (member) 1>)
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) execution>)
parameters?: unknown
Parameter schema for a client-executed tool search tool.
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) parameters>)
[](<#(resource) responses > (model) tool_search_tool > (schema)>)
WebSearchPreviewTool { type, search\_content\_types, search\_context\_size, user\_location }
This tool searches the web for relevant results to use in a response. Learn more about the [web search tool](https://platform.openai.com/docs/guides/tools-web-search).
type: "web\_search\_preview" | "web\_search\_preview\_2025\_03\_11"
The type of the web search tool. One of `web\_search\_preview` or `web\_search\_preview\_2025\_03\_11`.
One of the following:
"web\_search\_preview"
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) type > (member) 0>)
"web\_search\_preview\_2025\_03\_11"
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) type > (member) 1>)
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) type>)
search\_content\_types?: Array\<"text" | "image"\>
One of the following:
"text"
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_content_types > (items) > (member) 0>)
"image"
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_content_types > (items) > (member) 1>)
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_content_types>)
search\_context\_size?: "low" | "medium" | "high"
High level guidance for the amount of context window space to use for the search. One of `low`, `medium`, or `high`. `medium` is the default.
One of the following:
"low"
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_context_size > (member) 0>)
"medium"
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_context_size > (member) 1>)
"high"
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_context_size > (member) 2>)
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_context_size>)
user\_location?: UserLocation | null
The user’s location.
type: "approximate"
The type of location approximation. Always `approximate`.
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location > (property) type>)
city?: string | null
Free text input for the city of the user, e.g. `San Francisco`.
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location > (property) city>)
country?: string | null
The two-letter [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1) of the user, e.g. `US`.
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location > (property) country>)
region?: string | null
Free text input for the region of the user, e.g. `California`.
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location > (property) region>)
timezone?: string | null
The [IANA timezone](https://timeapi.io/documentation/iana-timezones) of the user, e.g. `America/Los\_Angeles`.
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location > (property) timezone>)
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location>)
[](<#(resource) responses > (model) web_search_preview_tool > (schema)>)
ApplyPatchTool { type }
Allows the assistant to create, delete, or update files using unified diffs.
type: "apply\_patch"
The type of the tool. Always `apply\_patch`.
[](<#(resource) responses > (model) apply_patch_tool > (schema) > (property) type>)
[](<#(resource) responses > (model) apply_patch_tool > (schema)>)
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) tools>)
type: "tool\_search\_output"
The type of the item. Always `tool\_search\_output`.
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) type>)
created\_by?: string
The identifier of the actor that created the item.
[](<#(resource) responses > (model) response_tool_search_output_item > (schema) > (property) created_by>)
[](<#(resource) responses > (model) response_tool_search_output_item > (schema)>)
ResponseCompactionItem { id, encrypted\_content, type, created\_by }
A compaction item generated by the [`v1/responses/compact` API](https://platform.openai.com/docs/api-reference/responses/compact).
id: string
The unique ID of the compaction item.
[](<#(resource) responses > (model) response_compaction_item > (schema) > (property) id>)
encrypted\_content: string
The encrypted content that was produced by compaction.
[](<#(resource) responses > (model) response_compaction_item > (schema) > (property) encrypted_content>)
type: "compaction"
The type of the item. Always `compaction`.
[](<#(resource) responses > (model) response_compaction_item > (schema) > (property) type>)
created\_by?: string
The identifier of the actor that created the item.
[](<#(resource) responses > (model) response_compaction_item > (schema) > (property) created_by>)
[](<#(resource) responses > (model) response_compaction_item > (schema)>)
ImageGenerationCall { id, result, status, type }
An image generation request made by the model.
id: string
The unique ID of the image generation call.
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 11 > (property) id>)
result: string | null
The generated image encoded in base64.
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 11 > (property) result>)
status: "in\_progress" | "completed" | "generating" | "failed"
The status of the image generation call.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 11 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 11 > (property) status > (member) 1>)
"generating"
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 11 > (property) status > (member) 2>)
"failed"
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 11 > (property) status > (member) 3>)
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 11 > (property) status>)
type: "image\_generation\_call"
The type of the image generation call. Always `image\_generation\_call`.
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 11 > (property) type>)
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 11>)
ResponseCodeInterpreterToolCall { id, code, container\_id, 3 more }
A tool call to run code.
id: string
The unique ID of the code interpreter tool call.
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) id>)
code: string | null
The code to run, or null if not available.
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) code>)
container\_id: string
The ID of the container used to run the code.
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) container_id>)
outputs: Array\<Logs { logs, type } | Image { type, url } \> | null
The outputs generated by the code interpreter, such as logs or images.
Can be null if no outputs are available.
One of the following:
Logs { logs, type }
The logs output from the code interpreter.
logs: string
The logs output from the code interpreter.
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) outputs > (items) > (variant) 0 > (property) logs>)
type: "logs"
The type of the output. Always `logs`.
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) outputs > (items) > (variant) 0 > (property) type>)
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) outputs > (items) > (variant) 0>)
Image { type, url }
The image output from the code interpreter.
type: "image"
The type of the output. Always `image`.
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) outputs > (items) > (variant) 1 > (property) type>)
url: string
The URL of the image output from the code interpreter.
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) outputs > (items) > (variant) 1 > (property) url>)
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) outputs > (items) > (variant) 1>)
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) outputs>)
status: "in\_progress" | "completed" | "incomplete" | 2 more
The status of the code interpreter tool call. Valid values are `in\_progress`, `completed`, `incomplete`, `interpreting`, and `failed`.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) status > (member) 2>)
"interpreting"
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) status > (member) 3>)
"failed"
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) status > (member) 4>)
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) status>)
type: "code\_interpreter\_call"
The type of the code interpreter tool call. Always `code\_interpreter\_call`.
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema) > (property) type>)
[](<#(resource) responses > (model) response_code_interpreter_tool_call > (schema)>)
LocalShellCall { id, action, call\_id, 2 more }
A tool call to run a command on the local shell.
id: string
The unique ID of the local shell call.
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 13 > (property) id>)
action: Action { command, env, type, 3 more }
Execute a shell command on the server.
command: Array\<string\>
The command to run.
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 13 > (property) action > (property) command>)
env: Record\<string, string\>
Environment variables to set for the command.
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 13 > (property) action > (property) env>)
type: "exec"
The type of the local shell action. Always `exec`.
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 13 > (property) action > (property) type>)
timeout\_ms?: number | null
Optional timeout in milliseconds for the command.
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 13 > (property) action > (property) timeout_ms>)
user?: string | null
Optional user to run the command as.
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 13 > (property) action > (property) user>)
working\_directory?: string | null
Optional working directory to run the command in.
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 13 > (property) action > (property) working_directory>)
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 13 > (property) action>)
call\_id: string
The unique ID of the local shell tool call generated by the model.
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 13 > (property) call_id>)
status: "in\_progress" | "completed" | "incomplete"
The status of the local shell call.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 13 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 13 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 13 > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 13 > (property) status>)
type: "local\_shell\_call"
The type of the local shell call. Always `local\_shell\_call`.
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 13 > (property) type>)
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 13>)
LocalShellCallOutput { id, output, type, status }
The output of a local shell tool call.
id: string
The unique ID of the local shell tool call generated by the model.
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 14 > (property) id>)
output: string
A JSON string of the output of the local shell tool call.
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 14 > (property) output>)
type: "local\_shell\_call\_output"
The type of the local shell tool call output. Always `local\_shell\_call\_output`.
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 14 > (property) type>)
status?: "in\_progress" | "completed" | "incomplete" | null
The status of the item. One of `in\_progress`, `completed`, or `incomplete`.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 14 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 14 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 14 > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 14 > (property) status>)
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 14>)
ResponseFunctionShellToolCall { id, action, call\_id, 4 more }
A tool call that executes one or more shell commands in a managed environment.
id: string
The unique ID of the shell tool call. Populated when this item is returned via API.
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) id>)
action: Action { commands, max\_output\_length, timeout\_ms }
The shell commands and limits that describe how to run the tool call.
commands: Array\<string\>
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) action > (property) commands>)
max\_output\_length: number | null
Optional maximum number of characters to return from each command.
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) action > (property) max_output_length>)
timeout\_ms: number | null
Optional timeout in milliseconds for the commands.
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) action > (property) timeout_ms>)
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) action>)
call\_id: string
The unique ID of the shell tool call generated by the model.
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) call_id>)
environment: [ResponseLocalEnvironment](</api/reference/typescript/resources/responses#(resource) responses > (model) response_local_environment > (schema)>) { type } | [ResponseContainerReference](</api/reference/typescript/resources/responses#(resource) responses > (model) response_container_reference > (schema)>) { container\_id, type } | null
Represents the use of a local environment to perform shell actions.
One of the following:
ResponseLocalEnvironment { type }
Represents the use of a local environment to perform shell actions.
type: "local"
The environment type. Always `local`.
[](<#(resource) responses > (model) response_local_environment > (schema) > (property) type>)
[](<#(resource) responses > (model) response_local_environment > (schema)>)
ResponseContainerReference { container\_id, type }
Represents a container created with /v1/containers.
container\_id: string
[](<#(resource) responses > (model) response_container_reference > (schema) > (property) container_id>)
type: "container\_reference"
The environment type. Always `container\_reference`.
[](<#(resource) responses > (model) response_container_reference > (schema) > (property) type>)
[](<#(resource) responses > (model) response_container_reference > (schema)>)
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) environment>)
status: "in\_progress" | "completed" | "incomplete"
The status of the shell call. One of `in\_progress`, `completed`, or `incomplete`.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) status>)
type: "shell\_call"
The type of the item. Always `shell\_call`.
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) type>)
created\_by?: string
The ID of the entity that created this tool call.
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema) > (property) created_by>)
[](<#(resource) responses > (model) response_function_shell_tool_call > (schema)>)
ResponseFunctionShellToolCallOutput { id, call\_id, max\_output\_length, 4 more }
The output of a shell tool call that was emitted.
id: string
The unique ID of the shell call output. Populated when this item is returned via API.
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) id>)
call\_id: string
The unique ID of the shell tool call generated by the model.
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) call_id>)
max\_output\_length: number | null
The maximum length of the shell command output. This is generated by the model and should be passed back with the raw output.
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) max_output_length>)
output: Array\<Output\>
An array of shell call output contents
outcome: Timeout { type } | Exit { exit\_code, type }
Represents either an exit outcome (with an exit code) or a timeout outcome for a shell call output chunk.
One of the following:
Timeout { type }
Indicates that the shell call exceeded its configured time limit.
type: "timeout"
The outcome type. Always `timeout`.
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) output > (items) > (property) outcome > (variant) 0 > (property) type>)
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) output > (items) > (property) outcome > (variant) 0>)
Exit { exit\_code, type }
Indicates that the shell commands finished and returned an exit code.
exit\_code: number
Exit code from the shell process.
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) output > (items) > (property) outcome > (variant) 1 > (property) exit_code>)
type: "exit"
The outcome type. Always `exit`.
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) output > (items) > (property) outcome > (variant) 1 > (property) type>)
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) output > (items) > (property) outcome > (variant) 1>)
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) output > (items) > (property) outcome>)
stderr: string
The standard error output that was captured.
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) output > (items) > (property) stderr>)
stdout: string
The standard output that was captured.
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) output > (items) > (property) stdout>)
created\_by?: string
The identifier of the actor that created the item.
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) output > (items) > (property) created_by>)
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) output>)
status: "in\_progress" | "completed" | "incomplete"
The status of the shell call output. One of `in\_progress`, `completed`, or `incomplete`.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) status>)
type: "shell\_call\_output"
The type of the shell call output. Always `shell\_call\_output`.
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) type>)
created\_by?: string
The identifier of the actor that created the item.
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema) > (property) created_by>)
[](<#(resource) responses > (model) response_function_shell_tool_call_output > (schema)>)
ResponseApplyPatchToolCall { id, call\_id, operation, 3 more }
A tool call that applies file diffs by creating, deleting, or updating files.
id: string
The unique ID of the apply patch tool call. Populated when this item is returned via API.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) id>)
call\_id: string
The unique ID of the apply patch tool call generated by the model.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) call_id>)
operation: CreateFile { diff, path, type } | DeleteFile { path, type } | UpdateFile { diff, path, type }
One of the create\_file, delete\_file, or update\_file operations applied via apply\_patch.
One of the following:
CreateFile { diff, path, type }
Instruction describing how to create a file via the apply\_patch tool.
diff: string
Diff to apply.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation > (variant) 0 > (property) diff>)
path: string
Path of the file to create.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation > (variant) 0 > (property) path>)
type: "create\_file"
Create a new file with the provided diff.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation > (variant) 0 > (property) type>)
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation > (variant) 0>)
DeleteFile { path, type }
Instruction describing how to delete a file via the apply\_patch tool.
path: string
Path of the file to delete.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation > (variant) 1 > (property) path>)
type: "delete\_file"
Delete the specified file.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation > (variant) 1 > (property) type>)
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation > (variant) 1>)
UpdateFile { diff, path, type }
Instruction describing how to update a file via the apply\_patch tool.
diff: string
Diff to apply.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation > (variant) 2 > (property) diff>)
path: string
Path of the file to update.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation > (variant) 2 > (property) path>)
type: "update\_file"
Update an existing file with the provided diff.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation > (variant) 2 > (property) type>)
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation > (variant) 2>)
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) operation>)
status: "in\_progress" | "completed"
The status of the apply patch tool call. One of `in\_progress` or `completed`.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) status > (member) 1>)
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) status>)
type: "apply\_patch\_call"
The type of the item. Always `apply\_patch\_call`.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) type>)
created\_by?: string
The ID of the entity that created this tool call.
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema) > (property) created_by>)
[](<#(resource) responses > (model) response_apply_patch_tool_call > (schema)>)
ResponseApplyPatchToolCallOutput { id, call\_id, status, 3 more }
The output emitted by an apply patch tool call.
id: string
The unique ID of the apply patch tool call output. Populated when this item is returned via API.
[](<#(resource) responses > (model) response_apply_patch_tool_call_output > (schema) > (property) id>)
call\_id: string
The unique ID of the apply patch tool call generated by the model.
[](<#(resource) responses > (model) response_apply_patch_tool_call_output > (schema) > (property) call_id>)
status: "completed" | "failed"
The status of the apply patch tool call output. One of `completed` or `failed`.
One of the following:
"completed"
[](<#(resource) responses > (model) response_apply_patch_tool_call_output > (schema) > (property) status > (member) 0>)
"failed"
[](<#(resource) responses > (model) response_apply_patch_tool_call_output > (schema) > (property) status > (member) 1>)
[](<#(resource) responses > (model) response_apply_patch_tool_call_output > (schema) > (property) status>)
type: "apply\_patch\_call\_output"
The type of the item. Always `apply\_patch\_call\_output`.
[](<#(resource) responses > (model) response_apply_patch_tool_call_output > (schema) > (property) type>)
created\_by?: string
The ID of the entity that created this tool call output.
[](<#(resource) responses > (model) response_apply_patch_tool_call_output > (schema) > (property) created_by>)
output?: string | null
Optional textual output returned by the apply patch tool.
[](<#(resource) responses > (model) response_apply_patch_tool_call_output > (schema) > (property) output>)
[](<#(resource) responses > (model) response_apply_patch_tool_call_output > (schema)>)
McpCall { id, arguments, name, 6 more }
An invocation of a tool on an MCP server.
id: string
The unique ID of the tool call.
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 19 > (property) id>)
arguments: string
A JSON string of the arguments passed to the tool.
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 19 > (property) arguments>)
name: string
The name of the tool that was run.
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 19 > (property) name>)
server\_label: string
The label of the MCP server running the tool.
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 19 > (property) server_label>)
type: "mcp\_call"
The type of the item. Always `mcp\_call`.
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 19 > (property) type>)
approval\_request\_id?: string | null
Unique identifier for the MCP tool call approval request.
Include this value in a subsequent `mcp\_approval\_response` input to approve or reject the corresponding tool call.
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 19 > (property) approval_request_id>)
error?: string | null
The error from the tool call, if any.
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 19 > (property) error>)
output?: string | null
The output from the tool call.
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 19 > (property) output>)
status?: "in\_progress" | "completed" | "incomplete" | 2 more
The status of the tool call. One of `in\_progress`, `completed`, `incomplete`, `calling`, or `failed`.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 19 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 19 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 19 > (property) status > (member) 2>)
"calling"
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 19 > (property) status > (member) 3>)
"failed"
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 19 > (property) status > (member) 4>)
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 19 > (property) status>)
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 19>)
McpListTools { id, server\_label, tools, 2 more }
A list of tools available on an MCP server.
id: string
The unique ID of the list.
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 20 > (property) id>)
server\_label: string
The label of the MCP server.
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 20 > (property) server_label>)
tools: Array\<Tool\>
The tools available on the server.
input\_schema: unknown
The JSON schema describing the tool’s input.
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 20 > (property) tools > (items) > (property) input_schema>)
name: string
The name of the tool.
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 20 > (property) tools > (items) > (property) name>)
annotations?: unknown
Additional annotations about the tool.
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 20 > (property) tools > (items) > (property) annotations>)
description?: string | null
The description of the tool.
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 20 > (property) tools > (items) > (property) description>)
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 20 > (property) tools>)
type: "mcp\_list\_tools"
The type of the item. Always `mcp\_list\_tools`.
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 20 > (property) type>)
error?: string | null
Error message if the server could not list tools.
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 20 > (property) error>)
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 20>)
McpApprovalRequest { id, arguments, name, 2 more }
A request for human approval of a tool invocation.
id: string
The unique ID of the approval request.
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 21 > (property) id>)
arguments: string
A JSON string of arguments for the tool.
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 21 > (property) arguments>)
name: string
The name of the tool to run.
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 21 > (property) name>)
server\_label: string
The label of the MCP server making the request.
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 21 > (property) server_label>)
type: "mcp\_approval\_request"
The type of the item. Always `mcp\_approval\_request`.
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 21 > (property) type>)
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 21>)
McpApprovalResponse { id, approval\_request\_id, approve, 2 more }
A response to an MCP approval request.
id: string
The unique ID of the approval response
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 22 > (property) id>)
approval\_request\_id: string
The ID of the approval request being answered.
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 22 > (property) approval_request_id>)
approve: boolean
Whether the request was approved.
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 22 > (property) approve>)
type: "mcp\_approval\_response"
The type of the item. Always `mcp\_approval\_response`.
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 22 > (property) type>)
reason?: string | null
Optional reason for the decision.
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 22 > (property) reason>)
[](<#(resource) responses > (model) response_output_item > (schema) > (variant) 22>)
ResponseCustomToolCall { call\_id, input, name, 3 more }
A call to a custom tool created by the model.
call\_id: string
An identifier used to map this custom tool call to a tool call output.
[](<#(resource) responses > (model) response_custom_tool_call > (schema) > (property) call_id>)
input: string
The input for the custom tool call generated by the model.
[](<#(resource) responses > (model) response_custom_tool_call > (schema) > (property) input>)
name: string
The name of the custom tool being called.
[](<#(resource) responses > (model) response_custom_tool_call > (schema) > (property) name>)
type: "custom\_tool\_call"
The type of the custom tool call. Always `custom\_tool\_call`.
[](<#(resource) responses > (model) response_custom_tool_call > (schema) > (property) type>)
id?: string
The unique ID of the custom tool call in the OpenAI platform.
[](<#(resource) responses > (model) response_custom_tool_call > (schema) > (property) id>)
namespace?: string
The namespace of the custom tool being called.
[](<#(resource) responses > (model) response_custom_tool_call > (schema) > (property) namespace>)
[](<#(resource) responses > (model) response_custom_tool_call > (schema)>)
ResponseCustomToolCallOutputItem extends [ResponseCustomToolCallOutput](</api/reference/typescript/resources/responses#(resource) responses > (model) response_custom_tool_call_output > (schema)>) { call\_id, output, type, id } { id, status, created\_by }
The output of a custom tool call from your code, being sent back to the model.
id: string
The unique ID of the custom tool call output item.
[](<#(resource) responses > (model) response_custom_tool_call_output_item > (schema) > (entry) 1 > (property) id>)
status: "in\_progress" | "completed" | "incomplete"
The status of the item. One of `in\_progress`, `completed`, or
`incomplete`. Populated when items are returned via API.
One of the following:
"in\_progress"
[](<#(resource) responses > (model) response_custom_tool_call_output_item > (schema) > (entry) 1 > (property) status > (member) 0>)
"completed"
[](<#(resource) responses > (model) response_custom_tool_call_output_item > (schema) > (entry) 1 > (property) status > (member) 1>)
"incomplete"
[](<#(resource) responses > (model) response_custom_tool_call_output_item > (schema) > (entry) 1 > (property) status > (member) 2>)
[](<#(resource) responses > (model) response_custom_tool_call_output_item > (schema) > (entry) 1 > (property) status>)
created\_by?: string
The identifier of the actor that created the item.
[](<#(resource) responses > (model) response_custom_tool_call_output_item > (schema) > (entry) 1 > (property) created_by>)
[](<#(resource) responses > (model) response_custom_tool_call_output_item > (schema)>)
[](<#(resource) responses > (model) response > (schema) > (property) output>)
parallel\_tool\_calls: boolean
Whether to allow the model to run tool calls in parallel.
[](<#(resource) responses > (model) response > (schema) > (property) parallel_tool_calls>)
temperature: number | null
What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
We generally recommend altering this or `top\_p` but not both.
minimum0
maximum2
[](<#(resource) responses > (model) response > (schema) > (property) temperature>)
tool\_choice: [ToolChoiceOptions](</api/reference/typescript/resources/responses#(resource) responses > (model) tool_choice_options > (schema)>) | [ToolChoiceAllowed](</api/reference/typescript/resources/responses#(resource) responses > (model) tool_choice_allowed > (schema)>) { mode, tools, type } | [ToolChoiceTypes](</api/reference/typescript/resources/responses#(resource) responses > (model) tool_choice_types > (schema)>) { type } | 5 more
How the model should select which tool (or tools) to use when generating
a response. See the `tools` parameter to see how to specify which tools
the model can call.
One of the following:
ToolChoiceOptions = "none" | "auto" | "required"
Controls which (if any) tool is called by the model.
`none` means the model will not call any tool and instead generates a message.
`auto` means the model can pick between generating a message or calling one or
more tools.
`required` means the model must call one or more tools.
One of the following:
"none"
[](<#(resource) responses > (model) tool_choice_options > (schema) > (member) 0>)
"auto"
[](<#(resource) responses > (model) tool_choice_options > (schema) > (member) 1>)
"required"
[](<#(resource) responses > (model) tool_choice_options > (schema) > (member) 2>)
[](<#(resource) responses > (model) tool_choice_options > (schema)>)
ToolChoiceAllowed { mode, tools, type }
Constrains the tools available to the model to a pre-defined set.
mode: "auto" | "required"
Constrains the tools available to the model to a pre-defined set.
`auto` allows the model to pick from among the allowed tools and generate a
message.
`required` requires the model to call one or more of the allowed tools.
One of the following:
"auto"
[](<#(resource) responses > (model) tool_choice_allowed > (schema) > (property) mode > (member) 0>)
"required"
[](<#(resource) responses > (model) tool_choice_allowed > (schema) > (property) mode > (member) 1>)
[](<#(resource) responses > (model) tool_choice_allowed > (schema) > (property) mode>)
tools: Array\<Record\<string, unknown\>\>
A list of tool definitions that the model should be allowed to call.
For the Responses API, the list of tool definitions might look like:
```
`[
{ "type": "function", "name": "get\_weather" },
{ "type": "mcp", "server\_label": "deepwiki" },
{ "type": "image\_generation" }
]`
```
[](<#(resource) responses > (model) tool_choice_allowed > (schema) > (property) tools>)
type: "allowed\_tools"
Allowed tool configuration type. Always `allowed\_tools`.
[](<#(resource) responses > (model) tool_choice_allowed > (schema) > (property) type>)
[](<#(resource) responses > (model) tool_choice_allowed > (schema)>)
ToolChoiceTypes { type }
Indicates that the model should use a built-in tool to generate a response.
[Learn more about built-in tools](https://platform.openai.com/docs/guides/tools).
type: "file\_search" | "web\_search\_preview" | "computer" | 5 more
The type of hosted tool the model should to use. Learn more about
[built-in tools](https://platform.openai.com/docs/guides/tools).
Allowed values are:
* `file\_search`
* `web\_search\_preview`
* `computer`
* `computer\_use\_preview`
* `computer\_use`
* `code\_interpreter`
* `image\_generation`
One of the following:
"file\_search"
[](<#(resource) responses > (model) tool_choice_types > (schema) > (property) type > (member) 0>)
"web\_search\_preview"
[](<#(resource) responses > (model) tool_choice_types > (schema) > (property) type > (member) 1>)
"computer"
[](<#(resource) responses > (model) tool_choice_types > (schema) > (property) type > (member) 2>)
"computer\_use\_preview"
[](<#(resource) responses > (model) tool_choice_types > (schema) > (property) type > (member) 3>)
"computer\_use"
[](<#(resource) responses > (model) tool_choice_types > (schema) > (property) type > (member) 4>)
"web\_search\_preview\_2025\_03\_11"
[](<#(resource) responses > (model) tool_choice_types > (schema) > (property) type > (member) 5>)
"image\_generation"
[](<#(resource) responses > (model) tool_choice_types > (schema) > (property) type > (member) 6>)
"code\_interpreter"
[](<#(resource) responses > (model) tool_choice_types > (schema) > (property) type > (member) 7>)
[](<#(resource) responses > (model) tool_choice_types > (schema) > (property) type>)
[](<#(resource) responses > (model) tool_choice_types > (schema)>)
ToolChoiceFunction { name, type }
Use this option to force the model to call a specific function.
name: string
The name of the function to call.
[](<#(resource) responses > (model) tool_choice_function > (schema) > (property) name>)
type: "function"
For function calling, the type is always `function`.
[](<#(resource) responses > (model) tool_choice_function > (schema) > (property) type>)
[](<#(resource) responses > (model) tool_choice_function > (schema)>)
ToolChoiceMcp { server\_label, type, name }
Use this option to force the model to call a specific tool on a remote MCP server.
server\_label: string
The label of the MCP server to use.
[](<#(resource) responses > (model) tool_choice_mcp > (schema) > (property) server_label>)
type: "mcp"
For MCP tools, the type is always `mcp`.
[](<#(resource) responses > (model) tool_choice_mcp > (schema) > (property) type>)
name?: string | null
The name of the tool to call on the server.
[](<#(resource) responses > (model) tool_choice_mcp > (schema) > (property) name>)
[](<#(resource) responses > (model) tool_choice_mcp > (schema)>)
ToolChoiceCustom { name, type }
Use this option to force the model to call a specific custom tool.
name: string
The name of the custom tool to call.
[](<#(resource) responses > (model) tool_choice_custom > (schema) > (property) name>)
type: "custom"
For custom tool calling, the type is always `custom`.
[](<#(resource) responses > (model) tool_choice_custom > (schema) > (property) type>)
[](<#(resource) responses > (model) tool_choice_custom > (schema)>)
ToolChoiceApplyPatch { type }
Forces the model to call the apply\_patch tool when executing a tool call.
type: "apply\_patch"
The tool to call. Always `apply\_patch`.
[](<#(resource) responses > (model) tool_choice_apply_patch > (schema) > (property) type>)
[](<#(resource) responses > (model) tool_choice_apply_patch > (schema)>)
ToolChoiceShell { type }
Forces the model to call the shell tool when a tool call is required.
type: "shell"
The tool to call. Always `shell`.
[](<#(resource) responses > (model) tool_choice_shell > (schema) > (property) type>)
[](<#(resource) responses > (model) tool_choice_shell > (schema)>)
[](<#(resource) responses > (model) response > (schema) > (property) tool_choice>)
tools: Array\<[Tool](</api/reference/typescript/resources/responses#(resource) responses > (model) tool > (schema)>)\>
An array of tools the model may call while generating a response. You
can specify which tool to use by setting the `tool\_choice` parameter.
We support the following categories of tools:
* **Built-in tools**: Tools that are provided by OpenAI that extend the
model’s capabilities, like [web search](https://platform.openai.com/docs/guides/tools-web-search)
or [file search](https://platform.openai.com/docs/guides/tools-file-search). Learn more about
[built-in tools](https://platform.openai.com/docs/guides/tools).
* **MCP Tools**: Integrations with third-party systems via custom MCP servers
or predefined connectors such as Google Drive and SharePoint. Learn more about
[MCP Tools](https://platform.openai.com/docs/guides/tools-connectors-mcp).
* **Function calls (custom tools)**: Functions that are defined by you,
enabling the model to call your own code with strongly typed arguments
and outputs. Learn more about
[function calling](https://platform.openai.com/docs/guides/function-calling). You can also use
custom tools to call your own code.
One of the following:
FunctionTool { name, parameters, strict, 3 more }
Defines a function in your own code the model can choose to call. Learn more about [function calling](https://platform.openai.com/docs/guides/function-calling).
name: string
The name of the function to call.
[](<#(resource) responses > (model) function_tool > (schema) > (property) name>)
parameters: Record\<string, unknown\> | null
A JSON schema object describing the parameters of the function.
[](<#(resource) responses > (model) function_tool > (schema) > (property) parameters>)
strict: boolean | null
Whether to enforce strict parameter validation. Default `true`.
[](<#(resource) responses > (model) function_tool > (schema) > (property) strict>)
type: "function"
The type of the function tool. Always `function`.
[](<#(resource) responses > (model) function_tool > (schema) > (property) type>)
defer\_loading?: boolean
Whether this function is deferred and loaded via tool search.
[](<#(resource) responses > (model) function_tool > (schema) > (property) defer_loading>)
description?: string | null
A description of the function. Used by the model to determine whether or not to call the function.
[](<#(resource) responses > (model) function_tool > (schema) > (property) description>)
[](<#(resource) responses > (model) function_tool > (schema)>)
FileSearchTool { type, vector\_store\_ids, filters, 2 more }
A tool that searches for relevant content from uploaded files. Learn more about the [file search tool](https://platform.openai.com/docs/guides/tools-file-search).
type: "file\_search"
The type of the file search tool. Always `file\_search`.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) type>)
vector\_store\_ids: Array\<string\>
The IDs of the vector stores to search.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) vector_store_ids>)
filters?: [ComparisonFilter](</api/reference/typescript/resources/$shared#(resource) $shared > (model) comparison_filter > (schema)>) { key, type, value } | [CompoundFilter](</api/reference/typescript/resources/$shared#(resource) $shared > (model) compound_filter > (schema)>) { filters, type } | null
A filter to apply.
One of the following:
ComparisonFilter { key, type, value }
A filter used to compare a specified attribute key to a given value using a defined comparison operation.
key: string
The key to compare against the value.
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) key>)
type: "eq" | "ne" | "gt" | 5 more
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
value: string | number | boolean | Array\<string | number\>
The value to compare against the attribute key; supports string, number, or boolean types.
One of the following:
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 0>)
number
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 1>)
boolean
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 2>)
Array\<string | number\>
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 0>)
number
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3 > (items) > (variant) 1>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 3>)
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value>)
[](<#(resource) $shared > (model) comparison_filter > (schema)>)
CompoundFilter { filters, type }
Combine multiple filters using `and` or `or`.
filters: Array\<[ComparisonFilter](</api/reference/typescript/resources/$shared#(resource) $shared > (model) comparison_filter > (schema)>) { key, type, value } | unknown\>
Array of filters to combine. Items can be `ComparisonFilter` or `CompoundFilter`.
One of the following:
ComparisonFilter { key, type, value }
A filter used to compare a specified attribute key to a given value using a defined comparison operation.
key: string
The key to compare against the value.
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) key>)
type: "eq" | "ne" | "gt" | 5 more
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
value: string | number | boolean | Array\<string | number\>
The value to compare against the attribute key; supports string, number, or boolean types.
One of the following:
string
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 0>)
number
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 1>)
boolean
[](<#(resource) $shared > (model) comparison_filter > (schema) > (property) value > (variant) 2>)
Array\<string | number\>
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
type: "and" | "or"
Type of operation: `and` or `or`.
One of the following:
"and"
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type > (member) 0>)
"or"
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type > (member) 1>)
[](<#(resource) $shared > (model) compound_filter > (schema) > (property) type>)
[](<#(resource) $shared > (model) compound_filter > (schema)>)
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) filters>)
max\_num\_results?: number
The maximum number of results to return. This number should be between 1 and 50 inclusive.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) max_num_results>)
ranking\_options?: RankingOptions { hybrid\_search, ranker, score\_threshold }
Ranking options for search.
hybrid\_search?: HybridSearch { embedding\_weight, text\_weight }
Weights that control how reciprocal rank fusion balances semantic embedding matches versus sparse keyword matches when hybrid search is enabled.
embedding\_weight: number
The weight of the embedding in the reciprocal ranking fusion.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) hybrid_search > (property) embedding_weight>)
text\_weight: number
The weight of the text in the reciprocal ranking fusion.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) hybrid_search > (property) text_weight>)
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) hybrid_search>)
ranker?: "auto" | "default-2024-11-15"
The ranker to use for the file search.
One of the following:
"auto"
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) ranker > (member) 0>)
"default-2024-11-15"
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) ranker > (member) 1>)
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) ranker>)
score\_threshold?: number
The score threshold for the file search, a number between 0 and 1. Numbers closer to 1 will attempt to return only the most relevant results, but may return fewer results.
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options > (property) score_threshold>)
[](<#(resource) responses > (model) file_search_tool > (schema) > (property) ranking_options>)
[](<#(resource) responses > (model) file_search_tool > (schema)>)
ComputerTool { type }
A tool that controls a virtual computer. Learn more about the [computer tool](https://platform.openai.com/docs/guides/tools-computer-use).
type: "computer"
The type of the computer tool. Always `computer`.
[](<#(resource) responses > (model) computer_tool > (schema) > (property) type>)
[](<#(resource) responses > (model) computer_tool > (schema)>)
ComputerUsePreviewTool { display\_height, display\_width, environment, type }
A tool that controls a virtual computer. Learn more about the [computer tool](https://platform.openai.com/docs/guides/tools-computer-use).
display\_height: number
The height of the computer display.
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) display_height>)
display\_width: number
The width of the computer display.
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) display_width>)
environment: "windows" | "mac" | "linux" | 2 more
The type of computer environment to control.
One of the following:
"windows"
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment > (member) 0>)
"mac"
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment > (member) 1>)
"linux"
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment > (member) 2>)
"ubuntu"
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment > (member) 3>)
"browser"
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment > (member) 4>)
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) environment>)
type: "computer\_use\_preview"
The type of the computer use tool. Always `computer\_use\_preview`.
[](<#(resource) responses > (model) computer_use_preview_tool > (schema) > (property) type>)
[](<#(resource) responses > (model) computer_use_preview_tool > (schema)>)
WebSearchTool { type, filters, search\_context\_size, user\_location }
Search the Internet for sources related to the prompt. Learn more about the
[web search tool](https://platform.openai.com/docs/guides/tools-web-search).
type: "web\_search" | "web\_search\_2025\_08\_26"
The type of the web search tool. One of `web\_search` or `web\_search\_2025\_08\_26`.
One of the following:
"web\_search"
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) type > (member) 0>)
"web\_search\_2025\_08\_26"
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) type > (member) 1>)
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) type>)
filters?: Filters | null
Filters for the search.
allowed\_domains?: Array\<string\> | null
Allowed domains for the search. If not provided, all domains are allowed.
Subdomains of the provided domains are allowed as well.
Example: `["pubmed.ncbi.nlm.nih.gov"]`
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) filters > (property) allowed_domains>)
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) filters>)
search\_context\_size?: "low" | "medium" | "high"
High level guidance for the amount of context window space to use for the search. One of `low`, `medium`, or `high`. `medium` is the default.
One of the following:
"low"
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) search_context_size > (member) 0>)
"medium"
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) search_context_size > (member) 1>)
"high"
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) search_context_size > (member) 2>)
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) search_context_size>)
user\_location?: UserLocation | null
The approximate location of the user.
city?: string | null
Free text input for the city of the user, e.g. `San Francisco`.
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location > (property) city>)
country?: string | null
The two-letter [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1) of the user, e.g. `US`.
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location > (property) country>)
region?: string | null
Free text input for the region of the user, e.g. `California`.
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location > (property) region>)
timezone?: string | null
The [IANA timezone](https://timeapi.io/documentation/iana-timezones) of the user, e.g. `America/Los\_Angeles`.
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location > (property) timezone>)
type?: "approximate"
The type of location approximation. Always `approximate`.
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location > (property) type>)
[](<#(resource) responses > (model) web_search_tool > (schema) > (property) user_location>)
[](<#(resource) responses > (model) web_search_tool > (schema)>)
Mcp { server\_label, type, allowed\_tools, 7 more }
Give the model access to additional tools via remote Model Context Protocol
(MCP) servers. [Learn more about MCP](https://platform.openai.com/docs/guides/tools-remote-mcp).
server\_label: string
A label for this MCP server, used to identify it in tool calls.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) server_label>)
type: "mcp"
The type of the MCP tool. Always `mcp`.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) type>)
allowed\_tools?: Array\<string\> | McpToolFilter { read\_only, tool\_names } | null
List of allowed tool names or a filter object.
One of the following:
Array\<string\>
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) allowed_tools > (variant) 0>)
McpToolFilter { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only?: boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) allowed_tools > (variant) 1 > (property) read_only>)
tool\_names?: Array\<string\>
List of allowed tool names.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) allowed_tools > (variant) 1 > (property) tool_names>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) allowed_tools > (variant) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) allowed_tools>)
authorization?: string
An OAuth access token that can be used with a remote MCP server, either
with a custom MCP server URL or a service connector. Your application
must handle the OAuth authorization flow and provide the token here.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) authorization>)
connector\_id?: "connector\_dropbox" | "connector\_gmail" | "connector\_googlecalendar" | 5 more
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
"connector\_dropbox"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 0>)
"connector\_gmail"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 1>)
"connector\_googlecalendar"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 2>)
"connector\_googledrive"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 3>)
"connector\_microsoftteams"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 4>)
"connector\_outlookcalendar"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 5>)
"connector\_outlookemail"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 6>)
"connector\_sharepoint"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id > (member) 7>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) connector_id>)
defer\_loading?: boolean
Whether this MCP tool is deferred and discovered via tool search.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) defer_loading>)
headers?: Record\<string, string\> | null
Optional HTTP headers to send to the MCP server. Use for authentication
or other purposes.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) headers>)
require\_approval?: McpToolApprovalFilter { always, never } | "always" | "never" | null
Specify which of the MCP server’s tools require approval.
One of the following:
McpToolApprovalFilter { always, never }
Specify which of the MCP server’s tools require approval. Can be
`always`, `never`, or a filter object associated with tools
that require approval.
always?: Always { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only?: boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) always > (property) read_only>)
tool\_names?: Array\<string\>
List of allowed tool names.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) always > (property) tool_names>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) always>)
never?: Never { read\_only, tool\_names }
A filter object to specify which tools are allowed.
read\_only?: boolean
Indicates whether or not a tool modifies data or is read-only. If an
MCP server is [annotated with `readOnlyHint`](https://modelcontextprotocol.io/specification/2025-06-18/schema#toolannotations-readonlyhint),
it will match this filter.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) never > (property) read_only>)
tool\_names?: Array\<string\>
List of allowed tool names.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) never > (property) tool_names>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0 > (property) never>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 0>)
"always" | "never"
"always"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 1 > (member) 0>)
"never"
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 1 > (member) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval > (variant) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) require_approval>)
server\_description?: string
Optional description of the MCP server, used to provide more context.
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) server_description>)
server\_url?: string
The URL for the MCP server. One of `server\_url` or `connector\_id` must be
provided.
formaturi
[](<#(resource) responses > (model) tool > (schema) > (variant) 5 > (property) server_url>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 5>)
CodeInterpreter { container, type }
A tool that runs Python code to help generate a response to a prompt.
container: string | CodeInterpreterToolAuto { type, file\_ids, memory\_limit, network\_policy }
The code interpreter container. Can be a container ID or an object that
specifies uploaded file IDs to make available to your code, along with an
optional `memory\_limit` setting.
One of the following:
string
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 0>)
CodeInterpreterToolAuto { type, file\_ids, memory\_limit, network\_policy }
Configuration for a code interpreter container. Optionally specify the IDs of the files to run the code on.
type: "auto"
Always `auto`.
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) type>)
file\_ids?: Array\<string\>
An optional list of uploaded files to make available to your code.
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) file_ids>)
memory\_limit?: "1g" | "4g" | "16g" | "64g" | null
The memory limit for the code interpreter container.
One of the following:
"1g"
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 0>)
"4g"
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 1>)
"16g"
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 2>)
"64g"
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit > (member) 3>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) memory_limit>)
network\_policy?: [ContainerNetworkPolicyDisabled](</api/reference/typescript/resources/responses#(resource) responses > (model) container_network_policy_disabled > (schema)>) { type } | [ContainerNetworkPolicyAllowlist](</api/reference/typescript/resources/responses#(resource) responses > (model) container_network_policy_allowlist > (schema)>) { allowed\_domains, type, domain\_secrets }
Network access policy for the container.
One of the following:
ContainerNetworkPolicyDisabled { type }
type: "disabled"
Disable outbound network access. Always `disabled`.
[](<#(resource) responses > (model) container_network_policy_disabled > (schema) > (property) type>)
[](<#(resource) responses > (model) container_network_policy_disabled > (schema)>)
ContainerNetworkPolicyAllowlist { allowed\_domains, type, domain\_secrets }
allowed\_domains: Array\<string\>
A list of allowed domains when type is `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) allowed_domains>)
type: "allowlist"
Allow outbound network access only to specified domains. Always `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) type>)
domain\_secrets?: Array\<[ContainerNetworkPolicyDomainSecret](</api/reference/typescript/resources/responses#(resource) responses > (model) container_network_policy_domain_secret > (schema)>) { domain, name, value } \>
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
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1 > (property) network_policy>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container > (variant) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) container>)
type: "code\_interpreter"
The type of the code interpreter tool. Always `code\_interpreter`.
[](<#(resource) responses > (model) tool > (schema) > (variant) 6 > (property) type>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 6>)
ImageGeneration { type, action, background, 9 more }
A tool that generates images using the GPT image models.
type: "image\_generation"
The type of the image generation tool. Always `image\_generation`.
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) type>)
action?: "generate" | "edit" | "auto"
Whether to generate a new image or edit an existing image. Default: `auto`.
One of the following:
"generate"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) action > (member) 0>)
"edit"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) action > (member) 1>)
"auto"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) action > (member) 2>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) action>)
background?: "transparent" | "opaque" | "auto"
Background type for the generated image. One of `transparent`,
`opaque`, or `auto`. Default: `auto`.
One of the following:
"transparent"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) background > (member) 0>)
"opaque"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) background > (member) 1>)
"auto"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) background > (member) 2>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) background>)
input\_fidelity?: "high" | "low" | null
Control how much effort the model will exert to match the style and features, especially facial features, of input images. This parameter is only supported for `gpt-image-1` and `gpt-image-1.5` and later models, unsupported for `gpt-image-1-mini`. Supports `high` and `low`. Defaults to `low`.
One of the following:
"high"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_fidelity > (member) 0>)
"low"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_fidelity > (member) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_fidelity>)
input\_image\_mask?: InputImageMask { file\_id, image\_url }
Optional mask for inpainting. Contains `image\_url`
(string, optional) and `file\_id` (string, optional).
file\_id?: string
File ID for the mask image.
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_image_mask > (property) file_id>)
image\_url?: string
Base64-encoded mask image.
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_image_mask > (property) image_url>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) input_image_mask>)
model?: (string & {}) | "gpt-image-1" | "gpt-image-1-mini" | "gpt-image-1.5"
The image generation model to use. Default: `gpt-image-1`.
One of the following:
(string & {})
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) model > (variant) 0>)
"gpt-image-1" | "gpt-image-1-mini" | "gpt-image-1.5"
"gpt-image-1"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) model > (variant) 1 > (member) 0>)
"gpt-image-1-mini"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) model > (variant) 1 > (member) 1>)
"gpt-image-1.5"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) model > (variant) 1 > (member) 2>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) model > (variant) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) model>)
moderation?: "auto" | "low"
Moderation level for the generated image. Default: `auto`.
One of the following:
"auto"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) moderation > (member) 0>)
"low"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) moderation > (member) 1>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) moderation>)
output\_compression?: number
Compression level for the output image. Default: 100.
minimum0
maximum100
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) output_compression>)
output\_format?: "png" | "webp" | "jpeg"
The output format of the generated image. One of `png`, `webp`, or
`jpeg`. Default: `png`.
One of the following:
"png"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) output_format > (member) 0>)
"webp"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) output_format > (member) 1>)
"jpeg"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) output_format > (member) 2>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) output_format>)
partial\_images?: number
Number of partial images to generate in streaming mode, from 0 (default value) to 3.
minimum0
maximum3
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) partial_images>)
quality?: "low" | "medium" | "high" | "auto"
The quality of the generated image. One of `low`, `medium`, `high`,
or `auto`. Default: `auto`.
One of the following:
"low"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) quality > (member) 0>)
"medium"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) quality > (member) 1>)
"high"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) quality > (member) 2>)
"auto"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) quality > (member) 3>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) quality>)
size?: "1024x1024" | "1024x1536" | "1536x1024" | "auto"
The size of the generated image. One of `1024x1024`, `1024x1536`,
`1536x1024`, or `auto`. Default: `auto`.
One of the following:
"1024x1024"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) size > (member) 0>)
"1024x1536"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) size > (member) 1>)
"1536x1024"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) size > (member) 2>)
"auto"
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) size > (member) 3>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7 > (property) size>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 7>)
LocalShell { type }
A tool that allows the model to execute shell commands in a local environment.
type: "local\_shell"
The type of the local shell tool. Always `local\_shell`.
[](<#(resource) responses > (model) tool > (schema) > (variant) 8 > (property) type>)
[](<#(resource) responses > (model) tool > (schema) > (variant) 8>)
FunctionShellTool { type, environment }
A tool that allows the model to execute shell commands.
type: "shell"
The type of the shell tool. Always `shell`.
[](<#(resource) responses > (model) function_shell_tool > (schema) > (property) type>)
environment?: [ContainerAuto](</api/reference/typescript/resources/responses#(resource) responses > (model) container_auto > (schema)>) { type, file\_ids, memory\_limit, 2 more } | [LocalEnvironment](</api/reference/typescript/resources/responses#(resource) responses > (model) local_environment > (schema)>) { type, skills } | [ContainerReference](</api/reference/typescript/resources/responses#(resource) responses > (model) container_reference > (schema)>) { container\_id, type } | null
One of the following:
ContainerAuto { type, file\_ids, memory\_limit, 2 more }
type: "container\_auto"
Automatically creates a container for this request
[](<#(resource) responses > (model) container_auto > (schema) > (property) type>)
file\_ids?: Array\<string\>
An optional list of uploaded files to make available to your code.
[](<#(resource) responses > (model) container_auto > (schema) > (property) file_ids>)
memory\_limit?: "1g" | "4g" | "16g" | "64g" | null
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
network\_policy?: [ContainerNetworkPolicyDisabled](</api/reference/typescript/resources/responses#(resource) responses > (model) container_network_policy_disabled > (schema)>) { type } | [ContainerNetworkPolicyAllowlist](</api/reference/typescript/resources/responses#(resource) responses > (model) container_network_policy_allowlist > (schema)>) { allowed\_domains, type, domain\_secrets }
Network access policy for the container.
One of the following:
ContainerNetworkPolicyDisabled { type }
type: "disabled"
Disable outbound network access. Always `disabled`.
[](<#(resource) responses > (model) container_network_policy_disabled > (schema) > (property) type>)
[](<#(resource) responses > (model) container_network_policy_disabled > (schema)>)
ContainerNetworkPolicyAllowlist { allowed\_domains, type, domain\_secrets }
allowed\_domains: Array\<string\>
A list of allowed domains when type is `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) allowed_domains>)
type: "allowlist"
Allow outbound network access only to specified domains. Always `allowlist`.
[](<#(resource) responses > (model) container_network_policy_allowlist > (schema) > (property) type>)
domain\_secrets?: Array\<[ContainerNetworkPolicyDomainSecret](</api/reference/typescript/resources/responses#(resource) responses > (model) container_network_policy_domain_secret > (schema)>) { domain, name, value } \>
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
skills?: Array\<[SkillReference](</api/reference/typescript/resources/responses#(resource) responses > (model) skill_reference > (schema)>) { skill\_id, type, version } | [InlineSkill](</api/reference/typescript/resources/responses#(resource) responses > (model) inline_skill > (schema)>) { description, name, source, type } \>
An optional list of skills referenced by id or inline data.
One of the following:
SkillReference { skill\_id, type, version }
skill\_id: string
The ID of the referenced skill.
maxLength64
minLength1
[](<#(resource) responses > (model) skill_reference > (schema) > (property) skill_id>)
type: "skill\_reference"
References a skill created with the /v1/skills endpoint.
[](<#(resource) responses > (model) skill_reference > (schema) > (property) type>)
version?: string
Optional skill version. Use a positive integer or ‘latest’. Omit for default.
[](<#(resource) responses > (model) skill_reference > (schema) > (property) version>)
[](<#(resource) responses > (model) skill_reference > (schema)>)
InlineSkill { description, name, source, type }
description: string
The description of the skill.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) description>)
name: string
The name of the skill.
[](<#(resource) responses > (model) inline_skill > (schema) > (property) name>)
source: [InlineSkillSource](</api/reference/typescript/resources/responses#(resource) responses > (model) inline_skill_source > (schema)>) { data, media\_type, type }
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
LocalEnvironment { type, skills }
type: "local"
Use a local computer environment.
[](<#(resource) responses > (model) local_environment > (schema) > (property) type>)
skills?: Array\<[LocalSkill](</api/reference/typescript/resources/responses#(resource) responses > (model) local_skill > (schema)>) { description, name, path } \>
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
ContainerReference { container\_id, type }
container\_id: string
The ID of the referenced container.
[](<#(resource) responses > (model) container_reference > (schema) > (property) container_id>)
type: "container\_reference"
References a container created with the /v1/containers endpoint
[](<#(resource) responses > (model) container_reference > (schema) > (property) type>)
[](<#(resource) responses > (model) container_reference > (schema)>)
[](<#(resource) responses > (model) function_shell_tool > (schema) > (property) environment>)
[](<#(resource) responses > (model) function_shell_tool > (schema)>)
CustomTool { name, type, defer\_loading, 2 more }
A custom tool that processes input using a specified format. Learn more about [custom tools](https://platform.openai.com/docs/guides/function-calling#custom-tools)
name: string
The name of the custom tool, used to identify it in tool calls.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) name>)
type: "custom"
The type of the custom tool. Always `custom`.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) type>)
defer\_loading?: boolean
Whether this tool should be deferred and discovered via tool search.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) defer_loading>)
description?: string
Optional description of the custom tool, used to provide more context.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) description>)
format?: [CustomToolInputFormat](</api/reference/typescript/resources/$shared#(resource) $shared > (model) custom_tool_input_format > (schema)>)
The input format for the custom tool. Default is unconstrained text.
One of the following:
Text { type }
Unconstrained free-form text.
type: "text"
Unconstrained text format. Always `text`.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 0 > (property) type>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 0>)
Grammar { definition, syntax, type }
A grammar defined by the user.
definition: string
The grammar definition.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) definition>)
syntax: "lark" | "regex"
The syntax of the grammar definition. One of `lark` or `regex`.
One of the following:
"lark"
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax > (member) 0>)
"regex"
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax > (member) 1>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax>)
type: "grammar"
Grammar format. Always `grammar`.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) type>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format>)
[](<#(resource) responses > (model) custom_tool > (schema)>)
NamespaceTool { description, name, tools, type }
Groups function/custom tools under a shared namespace.
description: string
A description of the namespace shown to the model.
minLength1
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) description>)
name: string
The namespace name used in tool calls (for example, `crm`).
minLength1
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) name>)
tools: Array\<Function { name, type, defer\_loading, 3 more } | [CustomTool](</api/reference/typescript/resources/responses#(resource) responses > (model) custom_tool > (schema)>) { name, type, defer\_loading, 2 more } \>
The function/custom tools available inside this namespace.
One of the following:
Function { name, type, defer\_loading, 3 more }
name: string
maxLength128
minLength1
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) name>)
type: "function"
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) type>)
defer\_loading?: boolean
Whether this function should be deferred and discovered via tool search.
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) defer_loading>)
description?: string | null
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) description>)
parameters?: unknown
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) parameters>)
strict?: boolean | null
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0 > (property) strict>)
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools > (items) > (variant) 0>)
CustomTool { name, type, defer\_loading, 2 more }
A custom tool that processes input using a specified format. Learn more about [custom tools](https://platform.openai.com/docs/guides/function-calling#custom-tools)
name: string
The name of the custom tool, used to identify it in tool calls.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) name>)
type: "custom"
The type of the custom tool. Always `custom`.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) type>)
defer\_loading?: boolean
Whether this tool should be deferred and discovered via tool search.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) defer_loading>)
description?: string
Optional description of the custom tool, used to provide more context.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) description>)
format?: [CustomToolInputFormat](</api/reference/typescript/resources/$shared#(resource) $shared > (model) custom_tool_input_format > (schema)>)
The input format for the custom tool. Default is unconstrained text.
One of the following:
Text { type }
Unconstrained free-form text.
type: "text"
Unconstrained text format. Always `text`.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 0 > (property) type>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 0>)
Grammar { definition, syntax, type }
A grammar defined by the user.
definition: string
The grammar definition.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) definition>)
syntax: "lark" | "regex"
The syntax of the grammar definition. One of `lark` or `regex`.
One of the following:
"lark"
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax > (member) 0>)
"regex"
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax > (member) 1>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) syntax>)
type: "grammar"
Grammar format. Always `grammar`.
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1 > (property) type>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format + (resource) $shared > (model) custom_tool_input_format > (schema) > (variant) 1>)
[](<#(resource) responses > (model) custom_tool > (schema) > (property) format>)
[](<#(resource) responses > (model) custom_tool > (schema)>)
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) tools>)
type: "namespace"
The type of the tool. Always `namespace`.
[](<#(resource) responses > (model) namespace_tool > (schema) > (property) type>)
[](<#(resource) responses > (model) namespace_tool > (schema)>)
ToolSearchTool { type, description, execution, parameters }
Hosted or BYOT tool search configuration for deferred tools.
type: "tool\_search"
The type of the tool. Always `tool\_search`.
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) type>)
description?: string | null
Description shown to the model for a client-executed tool search tool.
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) description>)
execution?: "server" | "client"
Whether tool search is executed by the server or by the client.
One of the following:
"server"
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) execution > (member) 0>)
"client"
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) execution > (member) 1>)
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) execution>)
parameters?: unknown
Parameter schema for a client-executed tool search tool.
[](<#(resource) responses > (model) tool_search_tool > (schema) > (property) parameters>)
[](<#(resource) responses > (model) tool_search_tool > (schema)>)
WebSearchPreviewTool { type, search\_content\_types, search\_context\_size, user\_location }
This tool searches the web for relevant results to use in a response. Learn more about the [web search tool](https://platform.openai.com/docs/guides/tools-web-search).
type: "web\_search\_preview" | "web\_search\_preview\_2025\_03\_11"
The type of the web search tool. One of `web\_search\_preview` or `web\_search\_preview\_2025\_03\_11`.
One of the following:
"web\_search\_preview"
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) type > (member) 0>)
"web\_search\_preview\_2025\_03\_11"
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) type > (member) 1>)
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) type>)
search\_content\_types?: Array\<"text" | "image"\>
One of the following:
"text"
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_content_types > (items) > (member) 0>)
"image"
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_content_types > (items) > (member) 1>)
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_content_types>)
search\_context\_size?: "low" | "medium" | "high"
High level guidance for the amount of context window space to use for the search. One of `low`, `medium`, or `high`. `medium` is the default.
One of the following:
"low"
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_context_size > (member) 0>)
"medium"
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_context_size > (member) 1>)
"high"
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_context_size > (member) 2>)
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) search_context_size>)
user\_location?: UserLocation | null
The user’s location.
type: "approximate"
The type of location approximation. Always `approximate`.
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location > (property) type>)
city?: string | null
Free text input for the city of the user, e.g. `San Francisco`.
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location > (property) city>)
country?: string | null
The two-letter [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1) of the user, e.g. `US`.
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location > (property) country>)
region?: string | null
Free text input for the region of the user, e.g. `California`.
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location > (property) region>)
timezone?: string | null
The [IANA timezone](https://timeapi.io/documentation/iana-timezones) of the user, e.g. `America/Los\_Angeles`.
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location > (property) timezone>)
[](<#(resource) responses > (model) web_search_preview_tool > (schema) > (property) user_location>)
[](<#(resource) responses > (model) web_search_preview_tool > (schema)>)
ApplyPatchTool { type }
Allows the assistant to create, delete, or update files using unified diffs.
type: "apply\_patch"
The type of the tool. Always `apply\_patch`.
[](<#(resource) responses > (model) apply_patch_tool > (schema) > (property) type>)
[](<#(resource) responses > (model) apply_patch_tool > (schema)>)
[](<#(resource) responses > (model) response > (schema) > (property) tools>)
top\_p: number | null
An alternative to sampling with temperature, called nucleus sampling,
where the model considers the results of the tokens with top\_p probability
mass. So 0.1 means only the tokens comprising the top 10% probability mass
are considered.
We generally recommend altering this or `temperature` but not both.
minimum0
maximum1
[](<#(resource) responses > (model) response > (schema) > (property) top_p>)
background?: boolean | null
Whether to run the model response in the background.
[Learn more](https://platform.openai.com/docs/guides/background).
[](<#(resource) responses > (model) response > (schema) > (property) background>)
completed\_at?: number | null
Unix timestamp (in seconds) of when this Response was completed.
Only present when the status is `completed`.
formatunixtime
[](<#(resource) responses > (model) response > (schema) > (property) completed_at>)
conversation?: Conversation | null
The conversation that this response belonged to. Input items and output items from this response were automatically added to this conversation.
id: string
The unique ID of the conversation that this response was associated with.
[](<#(resource) responses > (model) response > (schema) > (property) conversation > (property) id>)
[](<#(resource) responses > (model) response > (schema) > (property) conversation>)
max\_output\_tokens?: number | null
An upper bound for the number of tokens that can be generated for a response, including visible output tokens and [reasoning tokens](https://platform.openai.com/docs/guides/reasoning).
[](<#(resource) responses > (model) response > (schema) > (property) max_output_tokens>)
max\_tool\_calls?: number | null
The maximum number of total calls to built-in tools that can be processed in a response. This maximum number applies across all built-in tool calls, not per individual tool. Any further attempts to call a tool by the model will be ignored.
[](<#(resource) responses > (model) response > (schema) > (property) max_tool_calls>)
previous\_response\_id?: string | null
The unique ID of the previous response to the model. Use this to
create multi-turn conversations. Learn more about
[conversation state](https://platform.openai.com/docs/guides/conversation-state). Cannot be used in conjunction with `conversation`.
[](<#(resource) responses > (model) response > (schema) > (property) previous_response_id>)
prompt?: [ResponsePrompt](</api/reference/typescript/resources/responses#(resource) responses > (model) response_prompt > (schema)>) { id, variables, version } | null
Reference to a prompt template and its variables.
[Learn more](https://platform.openai.com/docs/guides/text?api-mode=responses#reusable-prompts).
id: string
The unique identifier of the prompt template to use.
[](<#(resource) responses > (model) response > (schema) > (property) prompt + (resource) responses > (model) response_prompt > (schema) > (property) id>)
variables?: Record\<string, string | [ResponseInputText](</api/reference/typescript/resources/responses#(resource) responses > (model) response_input_text > (schema)>) { text, type } | [ResponseInputImage](</api/reference/typescript/resources/responses#(resource) responses > (model) response_input_image > (schema)>) { detail, type, file\_id, image\_url } | [ResponseInputFile](</api/reference/typescript/resources/responses#(resource) responses > (model) response_input_file > (schema)>) { type, detail, file\_data, 3 more } \> | null
Optional map of values to substitute in for variables in your
prompt. The substitution values can either be strings, or other
Response input types like images or files.
One of the following:
string
[](<#(resource) responses > (model) response > (schema) > (property) prompt + (resource) responses > (model) response_prompt > (schema) > (property) variables > (items) > (variant) 0>)
ResponseInputText { text, type }
A text input to the model.
text: string
The text input to the model.
[](<#(resource) responses > (model) response > (schema) > (property) prompt + (resource) responses > (model) response_input_text > (schema) > (property) text>)
type: "input\_text"
The type of the input item. Always `input\_text`.
[](<#(resource) responses > (model) response > (schema) > (property) prompt + (resource) responses > (model) response_input_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response > (schema) > (property) prompt + (resource) responses > (model) response_input_text > (schema)>)
ResponseInputImage { detail, type, file\_id, image\_url }
An image input to the model. Learn about [image inputs](https://platform.openai.com/docs/guides/vision).
detail: "low" | "high" | "auto" | "original"
The detail level of the image to be sent to the model. One of `high`, `low`, `auto`, or `original`. Defaults to `auto`.
One of the following:
"low"
[](<#(resource) responses > (model) response > (schema) > (property) prompt + (resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 0>)
"high"
[](<#(resource) responses > (model) response > (schema) > (property) prompt + (resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 1>)
"auto"
[](<#(resource) responses > (model) response > (schema) > (property) prompt + (resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 2>)
"original"
[](<#(resource) responses > (model) response > (schema) > (property) prompt + (resource) responses > (model) response_input_image > (schema) > (property) detail > (member) 3>)
[](<#(resource) responses > (model) response > (schema) > (property) prompt + (resource) responses > (model) response_input_image > (schema) > (property) detail>)
type: "input\_image"
The type of the input item. Always `input\_image`.
[](<#(resource) responses > (model) response > (schema) > (property) prompt + (resource) responses > (model) response_input_image > (schema) > (property) type>)
file\_id?: string | null
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response > (schema) > (property) prompt + (resource) responses > (model) response_input_image > (schema) > (property) file_id>)
image\_url?: string | null
The URL of the image to be sent to the model. A fully qualified URL or base64 encoded image in a data URL.
[](<#(resource) responses > (model) response > (schema) > (property) prompt + (resource) responses > (model) response_input_image > (schema) > (property) image_url>)
[](<#(resource) responses > (model) response > (schema) > (property) prompt + (resource) responses > (model) response_input_image > (schema)>)
ResponseInputFile { type, detail, file\_data, 3 more }
A file input to the model.
type: "input\_file"
The type of the input item. Always `input\_file`.
[](<#(resource) responses > (model) response > (schema) > (property) prompt + (resource) responses > (model) response_input_file > (schema) > (property) type>)
detail?: "low" | "high"
The detail level of the file to be sent to the model. Use `low` for the default rendering behavior, or `high` to render the file at higher quality. Defaults to `low`.
One of the following:
"low"
[](<#(resource) responses > (model) response > (schema) > (property) prompt + (resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 0>)
"high"
[](<#(resource) responses > (model) response > (schema) > (property) prompt + (resource) responses > (model) response_input_file > (schema) > (property) detail > (member) 1>)
[](<#(resource) responses > (model) response > (schema) > (property) prompt + (resource) responses > (model) response_input_file > (schema) > (property) detail>)
file\_data?: string
The content of the file to be sent to the model.
[](<#(resource) responses > (model) response > (schema) > (property) prompt + (resource) responses > (model) response_input_file > (schema) > (property) file_data>)
file\_id?: string | null
The ID of the file to be sent to the model.
[](<#(resource) responses > (model) response > (schema) > (property) prompt + (resource) responses > (model) response_input_file > (schema) > (property) file_id>)
file\_url?: string
The URL of the file to be sent to the model.
[](<#(resource) responses > (model) response > (schema) > (property) prompt + (resource) responses > (model) response_input_file > (schema) > (property) file_url>)
filename?: string
The name of the file to be sent to the model.
[](<#(resource) responses > (model) response > (schema) > (property) prompt + (resource) responses > (model) response_input_file > (schema) > (property) filename>)
[](<#(resource) responses > (model) response > (schema) > (property) prompt + (resource) responses > (model) response_input_file > (schema)>)
[](<#(resource) responses > (model) response > (schema) > (property) prompt + (resource) responses > (model) response_prompt > (schema) > (property) variables>)
version?: string | null
Optional version of the prompt template.
[](<#(resource) responses > (model) response > (schema) > (property) prompt + (resource) responses > (model) response_prompt > (schema) > (property) version>)
[](<#(resource) responses > (model) response > (schema) > (property) prompt>)
prompt\_cache\_key?: string
Used by OpenAI to cache responses for similar requests to optimize your cache hit rates. Replaces the `user` field. [Learn more](https://platform.openai.com/docs/guides/prompt-caching).
[](<#(resource) responses > (model) response > (schema) > (property) prompt_cache_key>)
prompt\_cache\_retention?: "in\_memory" | "24h" | null
The retention policy for the prompt cache. Set to `24h` to enable extended prompt caching, which keeps cached prefixes active for longer, up to a maximum of 24 hours. [Learn more](https://platform.openai.com/docs/guides/prompt-caching#prompt-cache-retention).
One of the following:
"in\_memory"
[](<#(resource) responses > (model) response > (schema) > (property) prompt_cache_retention > (member) 0>)
"24h"
[](<#(resource) responses > (model) response > (schema) > (property) prompt_cache_retention > (member) 1>)
[](<#(resource) responses > (model) response > (schema) > (property) prompt_cache_retention>)
reasoning?: [Reasoning](</api/reference/typescript/resources/$shared#(resource) $shared > (model) reasoning > (schema)>) { effort, generate\_summary, summary } | null
**gpt-5 and o-series models only**
Configuration options for
[reasoning models](https://platform.openai.com/docs/guides/reasoning).
effort?: [ReasoningEffort](</api/reference/typescript/resources/$shared#(resource) $shared > (model) reasoning_effort > (schema)>) | null
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
[](<#(resource) $shared > (model) reasoning > (schema) > (property) effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 0>)
"minimal"
[](<#(resource) $shared > (model) reasoning > (schema) > (property) effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 1>)
"low"
[](<#(resource) $shared > (model) reasoning > (schema) > (property) effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 2>)
"medium"
[](<#(resource) $shared > (model) reasoning > (schema) > (property) effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 3>)
"high"
[](<#(resource) $shared > (model) reasoning > (schema) > (property) effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 4>)
"xhigh"
[](<#(resource) $shared > (model) reasoning > (schema) > (property) effort + (resource) $shared > (model) reasoning_effort > (schema) > (member) 5>)
[](<#(resource) responses > (model) response > (schema) > (property) reasoning + (resource) $shared > (model) reasoning > (schema) > (property) effort>)
Deprecatedgenerate\_summary?: "auto" | "concise" | "detailed" | null
**Deprecated:** use `summary` instead.
A summary of the reasoning performed by the model. This can be
useful for debugging and understanding the model’s reasoning process.
One of `auto`, `concise`, or `detailed`.
One of the following:
"auto"
[](<#(resource) responses > (model) response > (schema) > (property) reasoning + (resource) $shared > (model) reasoning > (schema) > (property) generate_summary > (member) 0>)
"concise"
[](<#(resource) responses > (model) response > (schema) > (property) reasoning + (resource) $shared > (model) reasoning > (schema) > (property) generate_summary > (member) 1>)
"detailed"
[](<#(resource) responses > (model) response > (schema) > (property) reasoning + (resource) $shared > (model) reasoning > (schema) > (property) generate_summary > (member) 2>)
[](<#(resource) responses > (model) response > (schema) > (property) reasoning + (resource) $shared > (model) reasoning > (schema) > (property) generate_summary>)
summary?: "auto" | "concise" | "detailed" | null
A summary of the reasoning performed by the model. This can be
useful for debugging and understanding the model’s reasoning process.
One of `auto`, `concise`, or `detailed`.
`concise` is supported for `computer-use-preview` models and all reasoning models after `gpt-5`.
One of the following:
"auto"
[](<#(resource) responses > (model) response > (schema) > (property) reasoning + (resource) $shared > (model) reasoning > (schema) > (property) summary > (member) 0>)
"concise"
[](<#(resource) responses > (model) response > (schema) > (property) reasoning + (resource) $shared > (model) reasoning > (schema) > (property) summary > (member) 1>)
"detailed"
[](<#(resource) responses > (model) response > (schema) > (property) reasoning + (resource) $shared > (model) reasoning > (schema) > (property) summary > (member) 2>)
[](<#(resource) responses > (model) response > (schema) > (property) reasoning + (resource) $shared > (model) reasoning > (schema) > (property) summary>)
[](<#(resource) responses > (model) response > (schema) > (property) reasoning>)
safety\_identifier?: string
A stable identifier used to help detect users of your application that may be violating OpenAI’s usage policies.
The IDs should be a string that uniquely identifies each user, with a maximum length of 64 characters. We recommend hashing their username or email address, in order to avoid sending us any identifying information. [Learn more](https://platform.openai.com/docs/guides/safety-best-practices#safety-identifiers).
maxLength64
[](<#(resource) responses > (model) response > (schema) > (property) safety_identifier>)
service\_tier?: "auto" | "default" | "flex" | 2 more | null
Specifies the processing type used for serving the request.
* If set to ‘auto’, then the request will be processed with the service tier configured in the Project settings. Unless otherwise configured, the Project will use ‘default’.
* If set to ‘default’, then the request will be processed with the standard pricing and performance for the selected model.
* If set to ‘[flex](https://platform.openai.com/docs/guides/flex-processing)’ or ‘[priority](https://openai.com/api-priority-processing/)’, then the request will be processed with the corresponding service tier.
* When not set, the default behavior is ‘auto’.
When the `service\_tier` parameter is set, the response body will include the `service\_tier` value based on the processing mode actually used to serve the request. This response value may be different from the value set in the parameter.
One of the following:
"auto"
[](<#(resource) responses > (model) response > (schema) > (property) service_tier > (member) 0>)
"default"
[](<#(resource) responses > (model) response > (schema) > (property) service_tier > (member) 1>)
"flex"
[](<#(resource) responses > (model) response > (schema) > (property) service_tier > (member) 2>)
"scale"
[](<#(resource) responses > (model) response > (schema) > (property) service_tier > (member) 3>)
"priority"
[](<#(resource) responses > (model) response > (schema) > (property) service_tier > (member) 4>)
[](<#(resource) responses > (model) response > (schema) > (property) service_tier>)
status?: [ResponseStatus](</api/reference/typescript/resources/responses#(resource) responses > (model) response_status > (schema)>)
The status of the response generation. One of `completed`, `failed`,
`in\_progress`, `cancelled`, `queued`, or `incomplete`.
One of the following:
"completed"
[](<#(resource) responses > (model) response > (schema) > (property) status + (resource) responses > (model) response_status > (schema) > (member) 0>)
"failed"
[](<#(resource) responses > (model) response > (schema) > (property) status + (resource) responses > (model) response_status > (schema) > (member) 1>)
"in\_progress"
[](<#(resource) responses > (model) response > (schema) > (property) status + (resource) responses > (model) response_status > (schema) > (member) 2>)
"cancelled"
[](<#(resource) responses > (model) response > (schema) > (property) status + (resource) responses > (model) response_status > (schema) > (member) 3>)
"queued"
[](<#(resource) responses > (model) response > (schema) > (property) status + (resource) responses > (model) response_status > (schema) > (member) 4>)
"incomplete"
[](<#(resource) responses > (model) response > (schema) > (property) status + (resource) responses > (model) response_status > (schema) > (member) 5>)
[](<#(resource) responses > (model) response > (schema) > (property) status>)
text?: [ResponseTextConfig](</api/reference/typescript/resources/responses#(resource) responses > (model) response_text_config > (schema)>) { format, verbosity }
Configuration options for a text response from the model. Can be plain
text or structured JSON data. Learn more:
* [Text inputs and outputs](https://platform.openai.com/docs/guides/text)
* [Structured Outputs](https://platform.openai.com/docs/guides/structured-outputs)
format?: [ResponseFormatTextConfig](</api/reference/typescript/resources/responses#(resource) responses > (model) response_format_text_config > (schema)>)
An object specifying the format that the model must output.
Configuring `{ "type": "json\_schema" }` enables Structured Outputs,
which ensures the model will match your supplied JSON schema. Learn more in the
[Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
The default format is `{ "type": "text" }` with no additional options.
**Not recommended for gpt-4o and newer models:**
Setting to `{ "type": "json\_object" }` enables the older JSON mode, which
ensures the message the model generates is valid JSON. Using `json\_schema`
is preferred for models that support it.
One of the following:
ResponseFormatText { type }
Default response format. Used to generate text responses.
type: "text"
The type of response format being defined. Always `text`.
[](<#(resource) responses > (model) response_text_config > (schema) > (property) format + (resource) $shared > (model) response_format_text > (schema) > (property) type>)
[](<#(resource) responses > (model) response_text_config > (schema) > (property) format + (resource) $shared > (model) response_format_text > (schema)>)
ResponseFormatTextJSONSchemaConfig { name, schema, type, 2 more }
JSON Schema response format. Used to generate structured JSON responses.
Learn more about [Structured Outputs](https://platform.openai.com/docs/guides/structured-outputs).
name: string
The name of the response format. Must be a-z, A-Z, 0-9, or contain
underscores and dashes, with a maximum length of 64.
[](<#(resource) responses > (model) response_text_config > (schema) > (property) format + (resource) responses > (model) response_format_text_json_schema_config > (schema) > (property) name>)
schema: Record\<string, unknown\>
The schema for the response format, described as a JSON Schema object.
Learn how to build JSON schemas [here](https://json-schema.org/).
[](<#(resource) responses > (model) response_text_config > (schema) > (property) format + (resource) responses > (model) response_format_text_json_schema_config > (schema) > (property) schema>)
type: "json\_schema"
The type of response format being defined. Always `json\_schema`.
[](<#(resource) responses > (model) response_text_config > (schema) > (property) format + (resource) responses > (model) response_format_text_json_schema_config > (schema) > (property) type>)
description?: string
A description of what the response format is for, used by the model to
determine how to respond in the format.
[](<#(resource) responses > (model) response_text_config > (schema) > (property) format + (resource) responses > (model) response_format_text_json_schema_config > (schema) > (property) description>)
strict?: boolean | null
Whether to enable strict schema adherence when generating the output.
If set to true, the model will always follow the exact schema defined
in the `schema` field. Only a subset of JSON Schema is supported when
`strict` is `true`. To learn more, read the [Structured Outputs
guide](https://platform.openai.com/docs/guides/structured-outputs).
[](<#(resource) responses > (model) response_text_config > (schema) > (property) format + (resource) responses > (model) response_format_text_json_schema_config > (schema) > (property) strict>)
[](<#(resource) responses > (model) response_text_config > (schema) > (property) format + (resource) responses > (model) response_format_text_json_schema_config > (schema)>)
ResponseFormatJSONObject { type }
JSON object response format. An older method of generating JSON responses.
Using `json\_schema` is recommended for models that support it. Note that the
model will not generate JSON without a system or user message instructing it
to do so.
type: "json\_object"
The type of response format being defined. Always `json\_object`.
[](<#(resource) responses > (model) response_text_config > (schema) > (property) format + (resource) $shared > (model) response_format_json_object > (schema) > (property) type>)
[](<#(resource) responses > (model) response_text_config > (schema) > (property) format + (resource) $shared > (model) response_format_json_object > (schema)>)
[](<#(resource) responses > (model) response > (schema) > (property) text + (resource) responses > (model) response_text_config > (schema) > (property) format>)
verbosity?: "low" | "medium" | "high" | null
Constrains the verbosity of the model’s response. Lower values will result in
more concise responses, while higher values will result in more verbose responses.
Currently supported values are `low`, `medium`, and `high`.
One of the following:
"low"
[](<#(resource) responses > (model) response > (schema) > (property) text + (resource) responses > (model) response_text_config > (schema) > (property) verbosity > (member) 0>)
"medium"
[](<#(resource) responses > (model) response > (schema) > (property) text + (resource) responses > (model) response_text_config > (schema) > (property) verbosity > (member) 1>)
"high"
[](<#(resource) responses > (model) response > (schema) > (property) text + (resource) responses > (model) response_text_config > (schema) > (property) verbosity > (member) 2>)
[](<#(resource) responses > (model) response > (schema) > (property) text + (resource) responses > (model) response_text_config > (schema) > (property) verbosity>)
[](<#(resource) responses > (model) response > (schema) > (property) text>)
top\_logprobs?: number | null
An integer between 0 and 20 specifying the number of most likely tokens to
return at each token position, each with an associated log probability.
minimum0
maximum20
[](<#(resource) responses > (model) response > (schema) > (property) top_logprobs>)
truncation?: "auto" | "disabled" | null
The truncation strategy to use for the model response.
* `auto`: If the input to this Response exceeds
the model’s context window size, the model will truncate the
response to fit the context window by dropping items from the beginning of the conversation.
* `disabled` (default): If the input size will exceed the context window
size for a model, the request will fail with a 400 error.
One of the following:
"auto"
[](<#(resource) responses > (model) response > (schema) > (property) truncation > (member) 0>)
"disabled"
[](<#(resource) responses > (model) response > (schema) > (property) truncation > (member) 1>)
[](<#(resource) responses > (model) response > (schema) > (property) truncation>)
usage?: [ResponseUsage](</api/reference/typescript/resources/responses#(resource) responses > (model) response_usage > (schema)>) { input\_tokens, input\_tokens\_details, output\_tokens, 2 more }
Represents token usage details including input tokens, output tokens,
a breakdown of output tokens, and the total tokens used.
input\_tokens: number
The number of input tokens.
[](<#(resource) responses > (model) response > (schema) > (property) usage + (resource) responses > (model) response_usage > (schema) > (property) input_tokens>)
input\_tokens\_details: InputTokensDetails { cached\_tokens }
A detailed breakdown of the input tokens.
cached\_tokens: number
The number of tokens that were retrieved from the cache.
[More on prompt caching](https://platform.openai.com/docs/guides/prompt-caching).
[](<#(resource) responses > (model) response > (schema) > (property) usage + (resource) responses > (model) response_usage > (schema) > (property) input_tokens_details > (property) cached_tokens>)
[](<#(resource) responses > (model) response > (schema) > (property) usage + (resource) responses > (model) response_usage > (schema) > (property) input_tokens_details>)
output\_tokens: number
The number of output tokens.
[](<#(resource) responses > (model) response > (schema) > (property) usage + (resource) responses > (model) response_usage > (schema) > (property) output_tokens>)
output\_tokens\_details: OutputTokensDetails { reasoning\_tokens }
A detailed breakdown of the output tokens.
reasoning\_tokens: number
The number of reasoning tokens.
[](<#(resource) responses > (model) response > (schema) > (property) usage + (resource) responses > (model) response_usage > (schema) > (property) output_tokens_details > (property) reasoning_tokens>)
[](<#(resource) responses > (model) response > (schema) > (property) usage + (resource) responses > (model) response_usage > (schema) > (property) output_tokens_details>)
total\_tokens: number
The total number of tokens used.
[](<#(resource) responses > (model) response > (schema) > (property) usage + (resource) responses > (model) response_usage > (schema) > (property) total_tokens>)
[](<#(resource) responses > (model) response > (schema) > (property) usage>)
Deprecateduser?: string
This field is being replaced by `safety\_identifier` and `prompt\_cache\_key`. Use `prompt\_cache\_key` instead to maintain caching optimizations.
A stable identifier for your end-users.
Used to boost cache hit rates by better bucketing similar requests and to help OpenAI detect and prevent abuse. [Learn more](https://platform.openai.com/docs/guides/safety-best-practices#safety-identifiers).
[](<#(resource) responses > (model) response > (schema) > (property) user>)
[](<#(resource) responses > (model) response > (schema)>)
### Cancel a response
TypeScript
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
`import OpenAI from "openai";
const client = new OpenAI();
const response = await client.responses.cancel("resp\_123");
console.log(response);
`
```
```
`{
"id": "resp\_67cb71b351908190a308f3859487620d06981a8637e6bc44",
"object": "response",
"created\_at": 1741386163,
"status": "cancelled",
"background": true,
"completed\_at": null,
"error": null,
"incomplete\_details": null,
"instructions": null,
"max\_output\_tokens": null,
"model": "gpt-4o-2024-08-06",
"output": [
{
"type": "message",
"id": "msg\_67cb71b3c2b0819084d481baaaf148f206981a8637e6bc44",
"status": "in\_progress",
"role": "assistant",
"content": [
{
"type": "output\_text",
"text": "Silent circuits hum, \\nThoughts emerge in data streams— \\nDigital dawn breaks.",
"annotations": []
}
]
}
],
"parallel\_tool\_calls": true,
"previous\_response\_id": null,
"reasoning": {
"effort": null,
"summary": null
},
"store": true,
"temperature": 1.0,
"text": {
"format": {
"type": "text"
}
},
"tool\_choice": "auto",
"tools": [],
"top\_p": 1.0,
"truncation": "disabled",
"usage": null,
"user": null,
"metadata": {}
}
`
```
##### Returns Examples
```
`{
"id": "resp\_67cb71b351908190a308f3859487620d06981a8637e6bc44",
"object": "response",
"created\_at": 1741386163,
"status": "cancelled",
"background": true,
"completed\_at": null,
"error": null,
"incomplete\_details": null,
"instructions": null,
"max\_output\_tokens": null,
"model": "gpt-4o-2024-08-06",
"output": [
{
"type": "message",
"id": "msg\_67cb71b3c2b0819084d481baaaf148f206981a8637e6bc44",
"status": "in\_progress",
"role": "assistant",
"content": [
{
"type": "output\_text",
"text": "Silent circuits hum, \\nThoughts emerge in data streams— \\nDigital dawn breaks.",
"annotations": []
}
]
}
],
"parallel\_tool\_calls": true,
"previous\_response\_id": null,
"reasoning": {
"effort": null,
"summary": null
},
"store": true,
"temperature": 1.0,
"text": {
"format": {
"type": "text"
}
},
"tool\_choice": "auto",
"tools": [],
"top\_p": 1.0,
"truncation": "disabled",
"usage": null,
"user": null,
"metadata": {}
}
`
```