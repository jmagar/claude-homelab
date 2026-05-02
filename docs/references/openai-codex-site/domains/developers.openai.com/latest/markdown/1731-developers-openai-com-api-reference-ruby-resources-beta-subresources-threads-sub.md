Retrieve message | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Beta](/api/reference/ruby/resources/beta)
[Threads](/api/reference/ruby/resources/beta/subresources/threads)
[Messages](/api/reference/ruby/resources/beta/subresources/threads/subresources/messages)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Retrieve message
Deprecated: The Assistants API is deprecated in favor of the Responses API
beta.threads.messages.retrieve(message\_id, \*\*kwargs) -\> [Message](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>) { id, assistant\_id, attachments, 11 more }
GET/threads/{thread\_id}/messages/{message\_id}
Retrieve a message.
##### ParametersExpand Collapse
thread\_id: String
[](<#(resource) beta.threads.messages > (method) retrieve > (params) default > (param) thread_id > (schema)>)
message\_id: String
[](<#(resource) beta.threads.messages > (method) retrieve > (params) default > (param) message_id > (schema)>)
##### ReturnsExpand Collapse
class Message { id, assistant\_id, attachments, 11 more }
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
id: String
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) id>)
assistant\_id: String
If applicable, the ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) that authored this message.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) assistant_id>)
attachments: Array[Attachment{ file\_id, tools}]
A list of files attached to the message, and the tools they were added to.
file\_id: String
The ID of the file to attach to the message.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) file_id>)
tools: Array[[CodeInterpreterTool](</api/reference/ruby/resources/beta#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>) { type } | AssistantToolsFileSearchTypeOnly{ type}]
The tools to add this file to.
One of the following:
class CodeInterpreterTool { type }
type: :code\_interpreter
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
class AssistantToolsFileSearchTypeOnly { type }
type: :file\_search
The type of tool being defined: `file\_search`
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools > (items) > (variant) 1>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) attachments>)
completed\_at: Integer
The Unix timestamp (in seconds) for when the message was completed.
formatunixtime
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) completed_at>)
content: Array[[MessageContent](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) message_content > (schema)>)]
The content of the message in array of text and/or images.
One of the following:
class ImageFileContentBlock { image\_file, type }
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
image\_file: [ImageFile](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) image_file > (schema)>) { file\_id, detail }
file\_id: String
The [File](https://platform.openai.com/docs/api-reference/files) ID of the image in the message content. Set `purpose="vision"` when uploading the File if you need to later display the file content.
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) file_id>)
detail: :auto | :low | :high
Specifies the detail level of the image if specified by the user. `low` uses fewer tokens, you can opt in to high resolution using `high`.
One of the following:
:auto
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 0>)
:low
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 1>)
:high
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) detail>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file>)
type: :image\_file
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema)>)
class ImageURLContentBlock { image\_url, type }
References an image URL in the content of a message.
image\_url: [ImageURL](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) image_url > (schema)>) { url, detail }
url: String
The external URL of the image, must be a supported image types: jpeg, jpg, png, gif, webp.
formaturi
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) url>)
detail: :auto | :low | :high
Specifies the detail level of the image. `low` uses fewer tokens, you can opt in to high resolution using `high`. Default value is `auto`
One of the following:
:auto
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 0>)
:low
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 1>)
:high
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) detail>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url>)
type: :image\_url
The type of the content part.
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema)>)
class TextContentBlock { text, type }
The text content that is part of a message.
text: [Text](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) text > (schema)>) { annotations, value }
annotations: Array[[Annotation](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) annotation > (schema)>)]
One of the following:
class FileCitationAnnotation { end\_index, file\_citation, start\_index, 2 more }
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
end\_index: Integer
minimum0
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) end_index>)
file\_citation: FileCitation{ file\_id}
file\_id: String
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation>)
start\_index: Integer
minimum0
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) start_index>)
text: String
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) text>)
type: :file\_citation
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_citation_annotation > (schema)>)
class FilePathAnnotation { end\_index, file\_path, start\_index, 2 more }
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
end\_index: Integer
minimum0
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) end_index>)
file\_path: FilePath{ file\_id}
file\_id: String
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path>)
start\_index: Integer
minimum0
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) start_index>)
text: String
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) text>)
type: :file\_path
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) file_path_annotation > (schema)>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) text > (schema) > (property) annotations>)
value: String
The data that makes up the text.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text + (resource) beta.threads.messages > (model) text > (schema) > (property) value>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text>)
type: :text
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema)>)
class RefusalContentBlock { refusal, type }
The refusal content generated by the assistant.
refusal: String
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) refusal>)
type: :refusal
Always `refusal`.
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema)>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) content>)
created\_at: Integer
The Unix timestamp (in seconds) for when the message was created.
formatunixtime
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) created_at>)
incomplete\_at: Integer
The Unix timestamp (in seconds) for when the message was marked as incomplete.
formatunixtime
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_at>)
incomplete\_details: IncompleteDetails{ reason}
On an incomplete message, details about why the message is incomplete.
reason: :content\_filter | :max\_tokens | :run\_cancelled | 2 more
The reason the message is incomplete.
One of the following:
:content\_filter
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
:max\_tokens
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
:run\_cancelled
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 2>)
:run\_expired
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 3>)
:run\_failed
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 4>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details>)
metadata: [Metadata](</api/reference/ruby/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) metadata>)
object: :"thread.message"
The object type, which is always `thread.message`.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) object>)
role: :user | :assistant
The entity that produced the message. One of `user` or `assistant`.
One of the following:
:user
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) role > (member) 0>)
:assistant
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) role > (member) 1>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) role>)
run\_id: String
The ID of the [run](https://platform.openai.com/docs/api-reference/runs) associated with the creation of this message. Value is `null` when messages are created manually using the create message or create thread endpoints.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) run_id>)
status: :in\_progress | :incomplete | :completed
The status of the message, which can be either `in\_progress`, `incomplete`, or `completed`.
One of the following:
:in\_progress
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) status > (member) 0>)
:incomplete
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) status > (member) 1>)
:completed
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) status > (member) 2>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) status>)
thread\_id: String
The [thread](https://platform.openai.com/docs/api-reference/threads) ID that this message belongs to.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) thread_id>)
[](<#(resource) beta.threads.messages > (model) message > (schema)>)
### Retrieve message
Ruby
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
`require "openai"
openai = OpenAI::Client.new(api\_key: "My API Key")
message = openai.beta.threads.messages.retrieve("message\_id", thread\_id: "thread\_id")
puts(message)`
```
```
`{
"id": "msg\_abc123",
"object": "thread.message",
"created\_at": 1699017614,
"assistant\_id": null,
"thread\_id": "thread\_abc123",
"run\_id": null,
"role": "user",
"content": [
{
"type": "text",
"text": {
"value": "How does AI work? Explain it in simple terms.",
"annotations": []
}
}
],
"attachments": [],
"metadata": {}
}
`
```
##### Returns Examples
```
`{
"id": "msg\_abc123",
"object": "thread.message",
"created\_at": 1699017614,
"assistant\_id": null,
"thread\_id": "thread\_abc123",
"run\_id": null,
"role": "user",
"content": [
{
"type": "text",
"text": {
"value": "How does AI work? Explain it in simple terms.",
"annotations": []
}
}
],
"attachments": [],
"metadata": {}
}
`
```