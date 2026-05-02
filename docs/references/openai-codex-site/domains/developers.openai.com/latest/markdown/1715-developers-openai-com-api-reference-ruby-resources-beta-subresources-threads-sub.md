Messages | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Beta](/api/reference/ruby/resources/beta)
[Threads](/api/reference/ruby/resources/beta/subresources/threads)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Messages
Build Assistants that can call models and use tools.
##### [List messages](/api/reference/ruby/resources/beta/subresources/threads/subresources/messages/methods/list)
Deprecated
beta.threads.messages.list(thread\_id, \*\*kwargs) -\> CursorPage\<[Message](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>) { id, assistant\_id, attachments, 11 more } \>
GET/threads/{thread\_id}/messages
##### [Create message](/api/reference/ruby/resources/beta/subresources/threads/subresources/messages/methods/create)
Deprecated
beta.threads.messages.create(thread\_id, \*\*kwargs) -\> [Message](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>) { id, assistant\_id, attachments, 11 more }
POST/threads/{thread\_id}/messages
##### [Modify message](/api/reference/ruby/resources/beta/subresources/threads/subresources/messages/methods/update)
Deprecated
beta.threads.messages.update(message\_id, \*\*kwargs) -\> [Message](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>) { id, assistant\_id, attachments, 11 more }
POST/threads/{thread\_id}/messages/{message\_id}
##### [Retrieve message](/api/reference/ruby/resources/beta/subresources/threads/subresources/messages/methods/retrieve)
Deprecated
beta.threads.messages.retrieve(message\_id, \*\*kwargs) -\> [Message](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>) { id, assistant\_id, attachments, 11 more }
GET/threads/{thread\_id}/messages/{message\_id}
##### [Delete message](/api/reference/ruby/resources/beta/subresources/threads/subresources/messages/methods/delete)
Deprecated
beta.threads.messages.delete(message\_id, \*\*kwargs) -\> [MessageDeleted](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) message_deleted > (schema)>) { id, deleted, object }
DELETE/threads/{thread\_id}/messages/{message\_id}
##### ModelsExpand Collapse
Annotation = [FileCitationAnnotation](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) file_citation_annotation > (schema)>) { end\_index, file\_citation, start\_index, 2 more } | [FilePathAnnotation](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) file_path_annotation > (schema)>) { end\_index, file\_path, start\_index, 2 more }
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
One of the following:
class FileCitationAnnotation { end\_index, file\_citation, start\_index, 2 more }
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
end\_index: Integer
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) end_index>)
file\_citation: FileCitation{ file\_id}
file\_id: String
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation>)
start\_index: Integer
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) start_index>)
text: String
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) text>)
type: :file\_citation
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema)>)
class FilePathAnnotation { end\_index, file\_path, start\_index, 2 more }
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
end\_index: Integer
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) end_index>)
file\_path: FilePath{ file\_id}
file\_id: String
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path>)
start\_index: Integer
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) start_index>)
text: String
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) text>)
type: :file\_path
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema)>)
[](<#(resource) beta.threads.messages > (model) annotation > (schema)>)
AnnotationDelta = [FileCitationDeltaAnnotation](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema)>) { index, type, end\_index, 3 more } | [FilePathDeltaAnnotation](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema)>) { index, type, end\_index, 3 more }
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
One of the following:
class FileCitationDeltaAnnotation { index, type, end\_index, 3 more }
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
index: Integer
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) index>)
type: :file\_citation
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) type>)
end\_index: Integer
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) end_index>)
file\_citation: FileCitation{ file\_id, quote}
file\_id: String
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) file_id>)
quote: String
The specific quote in the file.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) quote>)
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation>)
start\_index: Integer
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) start_index>)
text: String
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema)>)
class FilePathDeltaAnnotation { index, type, end\_index, 3 more }
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
index: Integer
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) index>)
type: :file\_path
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) type>)
end\_index: Integer
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) end_index>)
file\_path: FilePath{ file\_id}
file\_id: String
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path>)
start\_index: Integer
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) start_index>)
text: String
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema)>)
[](<#(resource) beta.threads.messages > (model) annotation_delta > (schema)>)
class FileCitationAnnotation { end\_index, file\_citation, start\_index, 2 more }
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
end\_index: Integer
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) end_index>)
file\_citation: FileCitation{ file\_id}
file\_id: String
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation>)
start\_index: Integer
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) start_index>)
text: String
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) text>)
type: :file\_citation
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema)>)
class FileCitationDeltaAnnotation { index, type, end\_index, 3 more }
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
index: Integer
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) index>)
type: :file\_citation
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) type>)
end\_index: Integer
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) end_index>)
file\_citation: FileCitation{ file\_id, quote}
file\_id: String
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) file_id>)
quote: String
The specific quote in the file.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) quote>)
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation>)
start\_index: Integer
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) start_index>)
text: String
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema)>)
class FilePathAnnotation { end\_index, file\_path, start\_index, 2 more }
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
end\_index: Integer
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) end_index>)
file\_path: FilePath{ file\_id}
file\_id: String
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path>)
start\_index: Integer
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) start_index>)
text: String
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) text>)
type: :file\_path
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema)>)
class FilePathDeltaAnnotation { index, type, end\_index, 3 more }
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
index: Integer
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) index>)
type: :file\_path
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) type>)
end\_index: Integer
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) end_index>)
file\_path: FilePath{ file\_id}
file\_id: String
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path>)
start\_index: Integer
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) start_index>)
text: String
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema)>)
class ImageFile { file\_id, detail }
file\_id: String
The [File](https://platform.openai.com/docs/api-reference/files) ID of the image in the message content. Set `purpose="vision"` when uploading the File if you need to later display the file content.
[](<#(resource) beta.threads.messages > (model) image_file > (schema) > (property) file_id>)
detail: :auto | :low | :high
Specifies the detail level of the image if specified by the user. `low` uses fewer tokens, you can opt in to high resolution using `high`.
One of the following:
:auto
[](<#(resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 0>)
:low
[](<#(resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 1>)
:high
[](<#(resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_file > (schema) > (property) detail>)
[](<#(resource) beta.threads.messages > (model) image_file > (schema)>)
class ImageFileContentBlock { image\_file, type }
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
image\_file: [ImageFile](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) image_file > (schema)>) { file\_id, detail }
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file>)
type: :image\_file
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema)>)
class ImageFileDelta { detail, file\_id }
detail: :auto | :low | :high
Specifies the detail level of the image if specified by the user. `low` uses fewer tokens, you can opt in to high resolution using `high`.
One of the following:
:auto
[](<#(resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) detail > (member) 0>)
:low
[](<#(resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) detail > (member) 1>)
:high
[](<#(resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) detail>)
file\_id: String
The [File](https://platform.openai.com/docs/api-reference/files) ID of the image in the message content. Set `purpose="vision"` when uploading the File if you need to later display the file content.
[](<#(resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) image_file_delta > (schema)>)
class ImageFileDeltaBlock { index, type, image\_file }
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
index: Integer
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) index>)
type: :image\_file
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) type>)
image\_file: [ImageFileDelta](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) image_file_delta > (schema)>) { detail, file\_id }
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) image_file>)
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema)>)
class ImageURL { url, detail }
url: String
The external URL of the image, must be a supported image types: jpeg, jpg, png, gif, webp.
formaturi
[](<#(resource) beta.threads.messages > (model) image_url > (schema) > (property) url>)
detail: :auto | :low | :high
Specifies the detail level of the image. `low` uses fewer tokens, you can opt in to high resolution using `high`. Default value is `auto`
One of the following:
:auto
[](<#(resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 0>)
:low
[](<#(resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 1>)
:high
[](<#(resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_url > (schema) > (property) detail>)
[](<#(resource) beta.threads.messages > (model) image_url > (schema)>)
class ImageURLContentBlock { image\_url, type }
References an image URL in the content of a message.
image\_url: [ImageURL](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) image_url > (schema)>) { url, detail }
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url>)
type: :image\_url
The type of the content part.
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema)>)
class ImageURLDelta { detail, url }
detail: :auto | :low | :high
Specifies the detail level of the image. `low` uses fewer tokens, you can opt in to high resolution using `high`.
One of the following:
:auto
[](<#(resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) detail > (member) 0>)
:low
[](<#(resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) detail > (member) 1>)
:high
[](<#(resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) detail>)
url: String
The URL of the image, must be a supported image types: jpeg, jpg, png, gif, webp.
formaturi
[](<#(resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) url>)
[](<#(resource) beta.threads.messages > (model) image_url_delta > (schema)>)
class ImageURLDeltaBlock { index, type, image\_url }
References an image URL in the content of a message.
index: Integer
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) index>)
type: :image\_url
Always `image\_url`.
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) type>)
image\_url: [ImageURLDelta](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) image_url_delta > (schema)>) { detail, url }
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) image_url>)
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema)>)
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
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file>)
type: :image\_file
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema)>)
class ImageURLContentBlock { image\_url, type }
References an image URL in the content of a message.
image\_url: [ImageURL](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) image_url > (schema)>) { url, detail }
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url>)
type: :image\_url
The type of the content part.
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema)>)
class TextContentBlock { text, type }
The text content that is part of a message.
text: [Text](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) text > (schema)>) { annotations, value }
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
MessageContent = [ImageFileContentBlock](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) image_file_content_block > (schema)>) { image\_file, type } | [ImageURLContentBlock](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) image_url_content_block > (schema)>) { image\_url, type } | [TextContentBlock](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) text_content_block > (schema)>) { text, type } | [RefusalContentBlock](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) refusal_content_block > (schema)>) { refusal, type }
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
One of the following:
class ImageFileContentBlock { image\_file, type }
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
image\_file: [ImageFile](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) image_file > (schema)>) { file\_id, detail }
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file>)
type: :image\_file
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema)>)
class ImageURLContentBlock { image\_url, type }
References an image URL in the content of a message.
image\_url: [ImageURL](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) image_url > (schema)>) { url, detail }
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url>)
type: :image\_url
The type of the content part.
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema)>)
class TextContentBlock { text, type }
The text content that is part of a message.
text: [Text](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) text > (schema)>) { annotations, value }
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
[](<#(resource) beta.threads.messages > (model) message_content > (schema)>)
MessageContentDelta = [ImageFileDeltaBlock](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) image_file_delta_block > (schema)>) { index, type, image\_file } | [TextDeltaBlock](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) text_delta_block > (schema)>) { index, type, text } | [RefusalDeltaBlock](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) refusal_delta_block > (schema)>) { index, type, refusal } | [ImageURLDeltaBlock](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) image_url_delta_block > (schema)>) { index, type, image\_url }
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
One of the following:
class ImageFileDeltaBlock { index, type, image\_file }
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
index: Integer
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) index>)
type: :image\_file
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) type>)
image\_file: [ImageFileDelta](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) image_file_delta > (schema)>) { detail, file\_id }
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) image_file>)
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema)>)
class TextDeltaBlock { index, type, text }
The text content that is part of a message.
index: Integer
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) index>)
type: :text
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) type>)
text: [TextDelta](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) text_delta > (schema)>) { annotations, value }
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema)>)
class RefusalDeltaBlock { index, type, refusal }
The refusal content that is part of a message.
index: Integer
The index of the refusal part in the message.
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) index>)
type: :refusal
Always `refusal`.
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) type>)
refusal: String
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) refusal>)
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema)>)
class ImageURLDeltaBlock { index, type, image\_url }
References an image URL in the content of a message.
index: Integer
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) index>)
type: :image\_url
Always `image\_url`.
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) type>)
image\_url: [ImageURLDelta](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) image_url_delta > (schema)>) { detail, url }
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) image_url>)
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema)>)
[](<#(resource) beta.threads.messages > (model) message_content_delta > (schema)>)
MessageContentPartParam = [ImageFileContentBlock](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) image_file_content_block > (schema)>) { image\_file, type } | [ImageURLContentBlock](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) image_url_content_block > (schema)>) { image\_url, type } | [TextContentBlockParam](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) text_content_block_param > (schema)>) { text, type }
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
One of the following:
class ImageFileContentBlock { image\_file, type }
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
image\_file: [ImageFile](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) image_file > (schema)>) { file\_id, detail }
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file>)
type: :image\_file
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema)>)
class ImageURLContentBlock { image\_url, type }
References an image URL in the content of a message.
image\_url: [ImageURL](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) image_url > (schema)>) { url, detail }
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url>)
type: :image\_url
The type of the content part.
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema)>)
class TextContentBlockParam { text, type }
The text content that is part of a message.
text: String
Text content to be sent to the model
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema) > (property) text>)
type: :text
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema)>)
[](<#(resource) beta.threads.messages > (model) message_content_part_param > (schema)>)
class MessageDeleted { id, deleted, object }
id: String
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema) > (property) id>)
deleted: bool
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema) > (property) deleted>)
object: :"thread.message.deleted"
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema) > (property) object>)
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema)>)
class MessageDelta { content, role }
The delta containing the fields that have changed on the Message.
content: Array[[MessageContentDelta](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) message_content_delta > (schema)>)]
The content of the message in array of text and/or images.
One of the following:
class ImageFileDeltaBlock { index, type, image\_file }
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
index: Integer
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) index>)
type: :image\_file
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) type>)
image\_file: [ImageFileDelta](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) image_file_delta > (schema)>) { detail, file\_id }
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) image_file>)
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema)>)
class TextDeltaBlock { index, type, text }
The text content that is part of a message.
index: Integer
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) index>)
type: :text
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) type>)
text: [TextDelta](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) text_delta > (schema)>) { annotations, value }
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema)>)
class RefusalDeltaBlock { index, type, refusal }
The refusal content that is part of a message.
index: Integer
The index of the refusal part in the message.
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) index>)
type: :refusal
Always `refusal`.
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) type>)
refusal: String
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) refusal>)
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema)>)
class ImageURLDeltaBlock { index, type, image\_url }
References an image URL in the content of a message.
index: Integer
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) index>)
type: :image\_url
Always `image\_url`.
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) type>)
image\_url: [ImageURLDelta](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) image_url_delta > (schema)>) { detail, url }
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) image_url>)
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema)>)
[](<#(resource) beta.threads.messages > (model) message_delta > (schema) > (property) content>)
role: :user | :assistant
The entity that produced the message. One of `user` or `assistant`.
One of the following:
:user
[](<#(resource) beta.threads.messages > (model) message_delta > (schema) > (property) role > (member) 0>)
:assistant
[](<#(resource) beta.threads.messages > (model) message_delta > (schema) > (property) role > (member) 1>)
[](<#(resource) beta.threads.messages > (model) message_delta > (schema) > (property) role>)
[](<#(resource) beta.threads.messages > (model) message_delta > (schema)>)
class MessageDeltaEvent { id, delta, object }
Represents a message delta i.e. any changed fields on a message during streaming.
id: String
The identifier of the message, which can be referenced in API endpoints.
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) id>)
delta: [MessageDelta](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) message_delta > (schema)>) { content, role }
The delta containing the fields that have changed on the Message.
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta>)
object: :"thread.message.delta"
The object type, which is always `thread.message.delta`.
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) object>)
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema)>)
class RefusalContentBlock { refusal, type }
The refusal content generated by the assistant.
refusal: String
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) refusal>)
type: :refusal
Always `refusal`.
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema)>)
class RefusalDeltaBlock { index, type, refusal }
The refusal content that is part of a message.
index: Integer
The index of the refusal part in the message.
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) index>)
type: :refusal
Always `refusal`.
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) type>)
refusal: String
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) refusal>)
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema)>)
class Text { annotations, value }
annotations: Array[[Annotation](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) annotation > (schema)>)]
One of the following:
class FileCitationAnnotation { end\_index, file\_citation, start\_index, 2 more }
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
end\_index: Integer
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) end_index>)
file\_citation: FileCitation{ file\_id}
file\_id: String
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation>)
start\_index: Integer
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) start_index>)
text: String
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) text>)
type: :file\_citation
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema)>)
class FilePathAnnotation { end\_index, file\_path, start\_index, 2 more }
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
end\_index: Integer
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) end_index>)
file\_path: FilePath{ file\_id}
file\_id: String
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path>)
start\_index: Integer
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) start_index>)
text: String
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) text>)
type: :file\_path
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema)>)
[](<#(resource) beta.threads.messages > (model) text > (schema) > (property) annotations>)
value: String
The data that makes up the text.
[](<#(resource) beta.threads.messages > (model) text > (schema) > (property) value>)
[](<#(resource) beta.threads.messages > (model) text > (schema)>)
class TextContentBlock { text, type }
The text content that is part of a message.
text: [Text](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) text > (schema)>) { annotations, value }
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text>)
type: :text
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema)>)
class TextContentBlockParam { text, type }
The text content that is part of a message.
text: String
Text content to be sent to the model
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema) > (property) text>)
type: :text
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema)>)
class TextDelta { annotations, value }
annotations: Array[[AnnotationDelta](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) annotation_delta > (schema)>)]
One of the following:
class FileCitationDeltaAnnotation { index, type, end\_index, 3 more }
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
index: Integer
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) index>)
type: :file\_citation
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) type>)
end\_index: Integer
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) end_index>)
file\_citation: FileCitation{ file\_id, quote}
file\_id: String
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) file_id>)
quote: String
The specific quote in the file.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) quote>)
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation>)
start\_index: Integer
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) start_index>)
text: String
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema)>)
class FilePathDeltaAnnotation { index, type, end\_index, 3 more }
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
index: Integer
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) index>)
type: :file\_path
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) type>)
end\_index: Integer
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) end_index>)
file\_path: FilePath{ file\_id}
file\_id: String
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path>)
start\_index: Integer
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) start_index>)
text: String
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema)>)
[](<#(resource) beta.threads.messages > (model) text_delta > (schema) > (property) annotations>)
value: String
The data that makes up the text.
[](<#(resource) beta.threads.messages > (model) text_delta > (schema) > (property) value>)
[](<#(resource) beta.threads.messages > (model) text_delta > (schema)>)
class TextDeltaBlock { index, type, text }
The text content that is part of a message.
index: Integer
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) index>)
type: :text
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) type>)
text: [TextDelta](</api/reference/ruby/resources/beta#(resource) beta.threads.messages > (model) text_delta > (schema)>) { annotations, value }
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema)>)