Create thread | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Beta](/api/reference/python/resources/beta)
[Threads](/api/reference/python/resources/beta/subresources/threads)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create thread
Deprecated: The Assistants API is deprecated in favor of the Responses API
beta.threads.create(ThreadCreateParams\*\*kwargs) -\> [Thread](</api/reference/python/resources/beta#(resource) beta.threads > (model) thread > (schema)>)
POST/threads
Create a thread.
##### ParametersExpand Collapse
messages: Optional[Iterable[Message]]
A list of [messages](https://platform.openai.com/docs/api-reference/messages) to start the thread with.
content: Union[str, Iterable[[MessageContentPartParam](</api/reference/python/resources/beta#(resource) beta.threads.messages > (model) message_content_part_param > (schema)>)]]
The text contents of the message.
One of the following:
str
The text contents of the message.
[](<#(resource) beta.threads > (method) create > (params) default > (param) messages > (schema) > (items) > (property) content > (variant) 0>)
Iterable[[MessageContentPartParam](</api/reference/python/resources/beta#(resource) beta.threads.messages > (model) message_content_part_param > (schema)>)]
An array of content parts with a defined type, each can be of type `text` or images can be passed with `image\_url` or `image\_file`. Image types are only supported on [Vision-compatible models](https://platform.openai.com/docs/models).
One of the following:
class ImageFileContentBlock: …
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
image\_file: [ImageFile](</api/reference/python/resources/beta#(resource) beta.threads.messages > (model) image_file > (schema)>)
file\_id: str
The [File](https://platform.openai.com/docs/api-reference/files) ID of the image in the message content. Set `purpose="vision"` when uploading the File if you need to later display the file content.
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file + (resource) beta.threads.messages > (model) image_file > (schema) > (property) file_id>)
detail: Optional[Literal["auto", "low", "high"]]
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
type: Literal["image\_file"]
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema)>)
class ImageURLContentBlock: …
References an image URL in the content of a message.
image\_url: [ImageURL](</api/reference/python/resources/beta#(resource) beta.threads.messages > (model) image_url > (schema)>)
url: str
The external URL of the image, must be a supported image types: jpeg, jpg, png, gif, webp.
formaturi
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url + (resource) beta.threads.messages > (model) image_url > (schema) > (property) url>)
detail: Optional[Literal["auto", "low", "high"]]
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
type: Literal["image\_url"]
The type of the content part.
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema)>)
class TextContentBlockParam: …
The text content that is part of a message.
text: str
Text content to be sent to the model
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema) > (property) text>)
type: Literal["text"]
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema)>)
[](<#(resource) beta.threads > (method) create > (params) default > (param) messages > (schema) > (items) > (property) content > (variant) 1>)
[](<#(resource) beta.threads > (method) create > (params) default > (param) messages > (schema) > (items) > (property) content>)
role: Literal["user", "assistant"]
The role of the entity that is creating the message. Allowed values include:
* `user`: Indicates the message is sent by an actual user and should be used in most cases to represent user-generated messages.
* `assistant`: Indicates the message is generated by the assistant. Use this value to insert messages from the assistant into the conversation.
One of the following:
"user"
[](<#(resource) beta.threads > (method) create > (params) default > (param) messages > (schema) > (items) > (property) role > (member) 0>)
"assistant"
[](<#(resource) beta.threads > (method) create > (params) default > (param) messages > (schema) > (items) > (property) role > (member) 1>)
[](<#(resource) beta.threads > (method) create > (params) default > (param) messages > (schema) > (items) > (property) role>)
attachments: Optional[Iterable[MessageAttachment]]
A list of files attached to the message, and the tools they should be added to.
file\_id: Optional[str]
The ID of the file to attach to the message.
[](<#(resource) beta.threads > (method) create > (params) default > (param) messages > (schema) > (items) > (property) attachments > (items) > (property) file_id>)
tools: Optional[Iterable[MessageAttachmentTool]]
The tools to add this file to.
One of the following:
class CodeInterpreterTool: …
type: Literal["code\_interpreter"]
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
class MessageAttachmentToolFileSearch: …
type: Literal["file\_search"]
The type of tool being defined: `file\_search`
[](<#(resource) beta.threads > (method) create > (params) default > (param) messages > (schema) > (items) > (property) attachments > (items) > (property) tools > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.threads > (method) create > (params) default > (param) messages > (schema) > (items) > (property) attachments > (items) > (property) tools > (items) > (variant) 1>)
[](<#(resource) beta.threads > (method) create > (params) default > (param) messages > (schema) > (items) > (property) attachments > (items) > (property) tools>)
[](<#(resource) beta.threads > (method) create > (params) default > (param) messages > (schema) > (items) > (property) attachments>)
metadata: Optional[Metadata]
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.threads > (method) create > (params) default > (param) messages > (schema) > (items) > (property) metadata>)
[](<#(resource) beta.threads > (method) create > (params) default > (param) messages > (schema)>)
metadata: Optional[Metadata]
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.threads > (method) create > (params) default > (param) metadata > (schema)>)
tool\_resources: Optional[[ToolResources](</api/reference/python/resources/beta/subresources/threads/methods/create#(resource) beta.threads > (method) create > (params) default > (param) tool_resources > (schema)>)]
A set of resources that are made available to the assistant’s tools in this thread. The resources are specific to the type of tool. For example, the `code\_interpreter` tool requires a list of file IDs, while the `file\_search` tool requires a list of vector store IDs.
code\_interpreter: Optional[ToolResourcesCodeInterpreter]
file\_ids: Optional[Sequence[str]]
A list of [file](https://platform.openai.com/docs/api-reference/files) IDs made available to the `code\_interpreter` tool. There can be a maximum of 20 files associated with the tool.
[](<#(resource) beta.threads > (method) create > (params) default > (param) tool_resources > (schema) > (property) code_interpreter > (property) file_ids>)
[](<#(resource) beta.threads > (method) create > (params) default > (param) tool_resources > (schema) > (property) code_interpreter>)
file\_search: Optional[ToolResourcesFileSearch]
vector\_store\_ids: Optional[Sequence[str]]
The [vector store](https://platform.openai.com/docs/api-reference/vector-stores/object) attached to this thread. There can be a maximum of 1 vector store attached to the thread.
[](<#(resource) beta.threads > (method) create > (params) default > (param) tool_resources > (schema) > (property) file_search > (property) vector_store_ids>)
vector\_stores: Optional[Iterable[ToolResourcesFileSearchVectorStore]]
A helper to create a [vector store](https://platform.openai.com/docs/api-reference/vector-stores/object) with file\_ids and attach it to this thread. There can be a maximum of 1 vector store attached to the thread.
chunking\_strategy: Optional[ToolResourcesFileSearchVectorStoreChunkingStrategy]
The chunking strategy used to chunk the file(s). If not set, will use the `auto` strategy.
One of the following:
class ToolResourcesFileSearchVectorStoreChunkingStrategyAuto: …
The default strategy. This strategy currently uses a `max\_chunk\_size\_tokens` of `800` and `chunk\_overlap\_tokens` of `400`.
type: Literal["auto"]
Always `auto`.
[](<#(resource) beta.threads > (method) create > (params) default > (param) tool_resources > (schema) > (property) file_search > (property) vector_stores > (items) > (property) chunking_strategy > (variant) 0 > (property) type>)
[](<#(resource) beta.threads > (method) create > (params) default > (param) tool_resources > (schema) > (property) file_search > (property) vector_stores > (items) > (property) chunking_strategy > (variant) 0>)
class ToolResourcesFileSearchVectorStoreChunkingStrategyStatic: …
static: ToolResourcesFileSearchVectorStoreChunkingStrategyStaticStatic
chunk\_overlap\_tokens: int
The number of tokens that overlap between chunks. The default value is `400`.
Note that the overlap must not exceed half of `max\_chunk\_size\_tokens`.
[](<#(resource) beta.threads > (method) create > (params) default > (param) tool_resources > (schema) > (property) file_search > (property) vector_stores > (items) > (property) chunking_strategy > (variant) 1 > (property) static > (property) chunk_overlap_tokens>)
max\_chunk\_size\_tokens: int
The maximum number of tokens in each chunk. The default value is `800`. The minimum value is `100` and the maximum value is `4096`.
minimum100
maximum4096
[](<#(resource) beta.threads > (method) create > (params) default > (param) tool_resources > (schema) > (property) file_search > (property) vector_stores > (items) > (property) chunking_strategy > (variant) 1 > (property) static > (property) max_chunk_size_tokens>)
[](<#(resource) beta.threads > (method) create > (params) default > (param) tool_resources > (schema) > (property) file_search > (property) vector_stores > (items) > (property) chunking_strategy > (variant) 1 > (property) static>)
type: Literal["static"]
Always `static`.
[](<#(resource) beta.threads > (method) create > (params) default > (param) tool_resources > (schema) > (property) file_search > (property) vector_stores > (items) > (property) chunking_strategy > (variant) 1 > (property) type>)
[](<#(resource) beta.threads > (method) create > (params) default > (param) tool_resources > (schema) > (property) file_search > (property) vector_stores > (items) > (property) chunking_strategy > (variant) 1>)
[](<#(resource) beta.threads > (method) create > (params) default > (param) tool_resources > (schema) > (property) file_search > (property) vector_stores > (items) > (property) chunking_strategy>)
file\_ids: Optional[Sequence[str]]
A list of [file](https://platform.openai.com/docs/api-reference/files) IDs to add to the vector store. For vector stores created before Nov 2025, there can be a maximum of 10,000 files in a vector store. For vector stores created starting in Nov 2025, the limit is 100,000,000 files.
[](<#(resource) beta.threads > (method) create > (params) default > (param) tool_resources > (schema) > (property) file_search > (property) vector_stores > (items) > (property) file_ids>)
metadata: Optional[Metadata]
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.threads > (method) create > (params) default > (param) tool_resources > (schema) > (property) file_search > (property) vector_stores > (items) > (property) metadata>)
[](<#(resource) beta.threads > (method) create > (params) default > (param) tool_resources > (schema) > (property) file_search > (property) vector_stores>)
[](<#(resource) beta.threads > (method) create > (params) default > (param) tool_resources > (schema) > (property) file_search>)
[](<#(resource) beta.threads > (method) create > (params) default > (param) tool_resources > (schema)>)
##### ReturnsExpand Collapse
class Thread: …
Represents a thread that contains [messages](https://platform.openai.com/docs/api-reference/messages).
id: str
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.threads > (model) thread > (schema) > (property) id>)
created\_at: int
The Unix timestamp (in seconds) for when the thread was created.
formatunixtime
[](<#(resource) beta.threads > (model) thread > (schema) > (property) created_at>)
metadata: Optional[Metadata]
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.threads > (model) thread > (schema) > (property) metadata>)
object: Literal["thread"]
The object type, which is always `thread`.
[](<#(resource) beta.threads > (model) thread > (schema) > (property) object>)
tool\_resources: Optional[ToolResources]
A set of resources that are made available to the assistant’s tools in this thread. The resources are specific to the type of tool. For example, the `code\_interpreter` tool requires a list of file IDs, while the `file\_search` tool requires a list of vector store IDs.
code\_interpreter: Optional[ToolResourcesCodeInterpreter]
file\_ids: Optional[List[str]]
A list of [file](https://platform.openai.com/docs/api-reference/files) IDs made available to the `code\_interpreter` tool. There can be a maximum of 20 files associated with the tool.
[](<#(resource) beta.threads > (model) thread > (schema) > (property) tool_resources > (property) code_interpreter > (property) file_ids>)
[](<#(resource) beta.threads > (model) thread > (schema) > (property) tool_resources > (property) code_interpreter>)
file\_search: Optional[ToolResourcesFileSearch]
vector\_store\_ids: Optional[List[str]]
The [vector store](https://platform.openai.com/docs/api-reference/vector-stores/object) attached to this thread. There can be a maximum of 1 vector store attached to the thread.
[](<#(resource) beta.threads > (model) thread > (schema) > (property) tool_resources > (property) file_search > (property) vector_store_ids>)
[](<#(resource) beta.threads > (model) thread > (schema) > (property) tool_resources > (property) file_search>)
[](<#(resource) beta.threads > (model) thread > (schema) > (property) tool_resources>)
[](<#(resource) beta.threads > (model) thread > (schema)>)
EmptyMessages
### Create thread
Python
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
`from openai import OpenAI
client = OpenAI()
empty\_thread = client.beta.threads.create()
print(empty\_thread)
`
```
```
`{
"id": "thread\_abc123",
"object": "thread",
"created\_at": 1699012949,
"metadata": {},
"tool\_resources": {}
}
`
```
### Create thread
Python
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
`from openai import OpenAI
client = OpenAI()
message\_thread = client.beta.threads.create(
messages=[
{
"role": "user",
"content": "Hello, what is AI?"
},
{
"role": "user",
"content": "How does AI work? Explain it in simple terms."
},
]
)
print(message\_thread)
`
```
```
`{
"id": "thread\_abc123",
"object": "thread",
"created\_at": 1699014083,
"metadata": {},
"tool\_resources": {}
}
`
```
##### Returns Examples
200 example
```
`{
"id": "id",
"created\_at": 0,
"metadata": {
"foo": "string"
},
"object": "thread",
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
}
}`
```