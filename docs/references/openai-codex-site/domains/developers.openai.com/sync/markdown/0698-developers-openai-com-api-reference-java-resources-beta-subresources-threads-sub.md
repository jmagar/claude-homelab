Messages | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Beta](/api/reference/java/resources/beta)
[Threads](/api/reference/java/resources/beta/subresources/threads)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Messages
Build Assistants that can call models and use tools.
##### [List messages](/api/reference/java/resources/beta/subresources/threads/subresources/messages/methods/list)
Deprecated
MessageListPage beta().threads().messages().list(MessageListParamsparams = MessageListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/threads/{thread\_id}/messages
##### [Create message](/api/reference/java/resources/beta/subresources/threads/subresources/messages/methods/create)
Deprecated
[Message](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>) beta().threads().messages().create(MessageCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/threads/{thread\_id}/messages
##### [Modify message](/api/reference/java/resources/beta/subresources/threads/subresources/messages/methods/update)
Deprecated
[Message](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>) beta().threads().messages().update(MessageUpdateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/threads/{thread\_id}/messages/{message\_id}
##### [Retrieve message](/api/reference/java/resources/beta/subresources/threads/subresources/messages/methods/retrieve)
Deprecated
[Message](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>) beta().threads().messages().retrieve(MessageRetrieveParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/threads/{thread\_id}/messages/{message\_id}
##### [Delete message](/api/reference/java/resources/beta/subresources/threads/subresources/messages/methods/delete)
Deprecated
[MessageDeleted](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) message_deleted > (schema)>) beta().threads().messages().delete(MessageDeleteParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
DELETE/threads/{thread\_id}/messages/{message\_id}
##### ModelsExpand Collapse
class Annotation: A class that can be one of several variants.union
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
class FileCitationAnnotation:
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
long endIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) end_index>)
FileCitation fileCitation
String fileId
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation>)
long startIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) start_index>)
String text
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) text>)
JsonValue; type "file\_citation"constant"file\_citation"constant
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema)>)
class FilePathAnnotation:
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
long endIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) end_index>)
FilePath filePath
String fileId
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path>)
long startIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) start_index>)
String text
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) text>)
JsonValue; type "file\_path"constant"file\_path"constant
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema)>)
[](<#(resource) beta.threads.messages > (model) annotation > (schema)>)
class AnnotationDelta: A class that can be one of several variants.union
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
class FileCitationDeltaAnnotation:
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
long index
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) index>)
JsonValue; type "file\_citation"constant"file\_citation"constant
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) type>)
Optional\<Long\> endIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) end_index>)
Optional\<FileCitation\> fileCitation
Optional\<String\> fileId
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) file_id>)
Optional\<String\> quote
The specific quote in the file.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) quote>)
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation>)
Optional\<Long\> startIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) start_index>)
Optional\<String\> text
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema)>)
class FilePathDeltaAnnotation:
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
long index
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) index>)
JsonValue; type "file\_path"constant"file\_path"constant
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) type>)
Optional\<Long\> endIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) end_index>)
Optional\<FilePath\> filePath
Optional\<String\> fileId
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path>)
Optional\<Long\> startIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) start_index>)
Optional\<String\> text
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema)>)
[](<#(resource) beta.threads.messages > (model) annotation_delta > (schema)>)
class FileCitationAnnotation:
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
long endIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) end_index>)
FileCitation fileCitation
String fileId
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation>)
long startIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) start_index>)
String text
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) text>)
JsonValue; type "file\_citation"constant"file\_citation"constant
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema)>)
class FileCitationDeltaAnnotation:
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
long index
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) index>)
JsonValue; type "file\_citation"constant"file\_citation"constant
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) type>)
Optional\<Long\> endIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) end_index>)
Optional\<FileCitation\> fileCitation
Optional\<String\> fileId
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) file_id>)
Optional\<String\> quote
The specific quote in the file.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) quote>)
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation>)
Optional\<Long\> startIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) start_index>)
Optional\<String\> text
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema)>)
class FilePathAnnotation:
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
long endIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) end_index>)
FilePath filePath
String fileId
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path>)
long startIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) start_index>)
String text
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) text>)
JsonValue; type "file\_path"constant"file\_path"constant
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema)>)
class FilePathDeltaAnnotation:
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
long index
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) index>)
JsonValue; type "file\_path"constant"file\_path"constant
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) type>)
Optional\<Long\> endIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) end_index>)
Optional\<FilePath\> filePath
Optional\<String\> fileId
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path>)
Optional\<Long\> startIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) start_index>)
Optional\<String\> text
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema)>)
class ImageFile:
String fileId
The [File](https://platform.openai.com/docs/api-reference/files) ID of the image in the message content. Set `purpose="vision"` when uploading the File if you need to later display the file content.
[](<#(resource) beta.threads.messages > (model) image_file > (schema) > (property) file_id>)
Optional\<Detail\> detail
Specifies the detail level of the image if specified by the user. `low` uses fewer tokens, you can opt in to high resolution using `high`.
One of the following:
AUTO("auto")
[](<#(resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 0>)
LOW("low")
[](<#(resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 1>)
HIGH("high")
[](<#(resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_file > (schema) > (property) detail>)
[](<#(resource) beta.threads.messages > (model) image_file > (schema)>)
class ImageFileContentBlock:
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
[ImageFile](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) image_file > (schema)>) imageFile
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file>)
JsonValue; type "image\_file"constant"image\_file"constant
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema)>)
class ImageFileDelta:
Optional\<Detail\> detail
Specifies the detail level of the image if specified by the user. `low` uses fewer tokens, you can opt in to high resolution using `high`.
One of the following:
AUTO("auto")
[](<#(resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) detail > (member) 0>)
LOW("low")
[](<#(resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) detail > (member) 1>)
HIGH("high")
[](<#(resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) detail>)
Optional\<String\> fileId
The [File](https://platform.openai.com/docs/api-reference/files) ID of the image in the message content. Set `purpose="vision"` when uploading the File if you need to later display the file content.
[](<#(resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) image_file_delta > (schema)>)
class ImageFileDeltaBlock:
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
long index
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) index>)
JsonValue; type "image\_file"constant"image\_file"constant
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) type>)
Optional\<[ImageFileDelta](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) image_file_delta > (schema)>)\> imageFile
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) image_file>)
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema)>)
class ImageUrl:
String url
The external URL of the image, must be a supported image types: jpeg, jpg, png, gif, webp.
formaturi
[](<#(resource) beta.threads.messages > (model) image_url > (schema) > (property) url>)
Optional\<Detail\> detail
Specifies the detail level of the image. `low` uses fewer tokens, you can opt in to high resolution using `high`. Default value is `auto`
One of the following:
AUTO("auto")
[](<#(resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 0>)
LOW("low")
[](<#(resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 1>)
HIGH("high")
[](<#(resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_url > (schema) > (property) detail>)
[](<#(resource) beta.threads.messages > (model) image_url > (schema)>)
class ImageUrlContentBlock:
References an image URL in the content of a message.
[ImageUrl](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) image_url > (schema)>) imageUrl
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url>)
JsonValue; type "image\_url"constant"image\_url"constant
The type of the content part.
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema)>)
class ImageUrlDelta:
Optional\<Detail\> detail
Specifies the detail level of the image. `low` uses fewer tokens, you can opt in to high resolution using `high`.
One of the following:
AUTO("auto")
[](<#(resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) detail > (member) 0>)
LOW("low")
[](<#(resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) detail > (member) 1>)
HIGH("high")
[](<#(resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) detail>)
Optional\<String\> url
The URL of the image, must be a supported image types: jpeg, jpg, png, gif, webp.
formaturi
[](<#(resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) url>)
[](<#(resource) beta.threads.messages > (model) image_url_delta > (schema)>)
class ImageUrlDeltaBlock:
References an image URL in the content of a message.
long index
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) index>)
JsonValue; type "image\_url"constant"image\_url"constant
Always `image\_url`.
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) type>)
Optional\<[ImageUrlDelta](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) image_url_delta > (schema)>)\> imageUrl
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) image_url>)
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema)>)
class Message:
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
String id
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) id>)
Optional\<String\> assistantId
If applicable, the ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) that authored this message.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) assistant_id>)
Optional\<List\<Attachment\>\> attachments
A list of files attached to the message, and the tools they were added to.
Optional\<String\> fileId
The ID of the file to attach to the message.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) file_id>)
Optional\<List\<Tool\>\> tools
The tools to add this file to.
One of the following:
class CodeInterpreterTool:
JsonValue; type "code\_interpreter"constant"code\_interpreter"constant
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
JsonValue;
JsonValue; type "file\_search"constant"file\_search"constant
The type of tool being defined: `file\_search`
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools > (items) > (variant) 1>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) attachments>)
Optional\<Long\> completedAt
The Unix timestamp (in seconds) for when the message was completed.
formatunixtime
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) completed_at>)
List\<[MessageContent](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) message_content > (schema)>)\> content
The content of the message in array of text and/or images.
One of the following:
class ImageFileContentBlock:
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
[ImageFile](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) image_file > (schema)>) imageFile
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file>)
JsonValue; type "image\_file"constant"image\_file"constant
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema)>)
class ImageUrlContentBlock:
References an image URL in the content of a message.
[ImageUrl](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) image_url > (schema)>) imageUrl
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url>)
JsonValue; type "image\_url"constant"image\_url"constant
The type of the content part.
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema)>)
class TextContentBlock:
The text content that is part of a message.
[Text](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) text > (schema)>) text
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text>)
JsonValue; type "text"constant"text"constant
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema)>)
class RefusalContentBlock:
The refusal content generated by the assistant.
String refusal
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) refusal>)
JsonValue; type "refusal"constant"refusal"constant
Always `refusal`.
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema)>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) content>)
long createdAt
The Unix timestamp (in seconds) for when the message was created.
formatunixtime
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) created_at>)
Optional\<Long\> incompleteAt
The Unix timestamp (in seconds) for when the message was marked as incomplete.
formatunixtime
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_at>)
Optional\<IncompleteDetails\> incompleteDetails
On an incomplete message, details about why the message is incomplete.
Reason reason
The reason the message is incomplete.
One of the following:
CONTENT\_FILTER("content\_filter")
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
MAX\_TOKENS("max\_tokens")
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
RUN\_CANCELLED("run\_cancelled")
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 2>)
RUN\_EXPIRED("run\_expired")
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 3>)
RUN\_FAILED("run\_failed")
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 4>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details>)
Optional\<Metadata\> metadata
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) metadata>)
JsonValue; object\_ "thread.message"constant"thread.message"constant
The object type, which is always `thread.message`.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) object>)
Role role
The entity that produced the message. One of `user` or `assistant`.
One of the following:
USER("user")
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) role > (member) 0>)
ASSISTANT("assistant")
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) role > (member) 1>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) role>)
Optional\<String\> runId
The ID of the [run](https://platform.openai.com/docs/api-reference/runs) associated with the creation of this message. Value is `null` when messages are created manually using the create message or create thread endpoints.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) run_id>)
Status status
The status of the message, which can be either `in\_progress`, `incomplete`, or `completed`.
One of the following:
IN\_PROGRESS("in\_progress")
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) status > (member) 0>)
INCOMPLETE("incomplete")
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) status > (member) 1>)
COMPLETED("completed")
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) status > (member) 2>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) status>)
String threadId
The [thread](https://platform.openai.com/docs/api-reference/threads) ID that this message belongs to.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) thread_id>)
[](<#(resource) beta.threads.messages > (model) message > (schema)>)
class MessageContent: A class that can be one of several variants.union
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
class ImageFileContentBlock:
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
[ImageFile](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) image_file > (schema)>) imageFile
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file>)
JsonValue; type "image\_file"constant"image\_file"constant
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema)>)
class ImageUrlContentBlock:
References an image URL in the content of a message.
[ImageUrl](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) image_url > (schema)>) imageUrl
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url>)
JsonValue; type "image\_url"constant"image\_url"constant
The type of the content part.
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema)>)
class TextContentBlock:
The text content that is part of a message.
[Text](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) text > (schema)>) text
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text>)
JsonValue; type "text"constant"text"constant
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema)>)
class RefusalContentBlock:
The refusal content generated by the assistant.
String refusal
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) refusal>)
JsonValue; type "refusal"constant"refusal"constant
Always `refusal`.
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema)>)
[](<#(resource) beta.threads.messages > (model) message_content > (schema)>)
class MessageContentDelta: A class that can be one of several variants.union
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
class ImageFileDeltaBlock:
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
long index
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) index>)
JsonValue; type "image\_file"constant"image\_file"constant
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) type>)
Optional\<[ImageFileDelta](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) image_file_delta > (schema)>)\> imageFile
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) image_file>)
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema)>)
class TextDeltaBlock:
The text content that is part of a message.
long index
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) index>)
JsonValue; type "text"constant"text"constant
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) type>)
Optional\<[TextDelta](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) text_delta > (schema)>)\> text
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema)>)
class RefusalDeltaBlock:
The refusal content that is part of a message.
long index
The index of the refusal part in the message.
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) index>)
JsonValue; type "refusal"constant"refusal"constant
Always `refusal`.
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) type>)
Optional\<String\> refusal
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) refusal>)
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema)>)
class ImageUrlDeltaBlock:
References an image URL in the content of a message.
long index
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) index>)
JsonValue; type "image\_url"constant"image\_url"constant
Always `image\_url`.
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) type>)
Optional\<[ImageUrlDelta](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) image_url_delta > (schema)>)\> imageUrl
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) image_url>)
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema)>)
[](<#(resource) beta.threads.messages > (model) message_content_delta > (schema)>)
class MessageContentPartParam: A class that can be one of several variants.union
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
class ImageFileContentBlock:
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
[ImageFile](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) image_file > (schema)>) imageFile
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file>)
JsonValue; type "image\_file"constant"image\_file"constant
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema)>)
class ImageUrlContentBlock:
References an image URL in the content of a message.
[ImageUrl](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) image_url > (schema)>) imageUrl
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url>)
JsonValue; type "image\_url"constant"image\_url"constant
The type of the content part.
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema)>)
class TextContentBlockParam:
The text content that is part of a message.
String text
Text content to be sent to the model
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema) > (property) text>)
JsonValue; type "text"constant"text"constant
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema)>)
[](<#(resource) beta.threads.messages > (model) message_content_part_param > (schema)>)
class MessageDeleted:
String id
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema) > (property) id>)
boolean deleted
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema) > (property) deleted>)
JsonValue; object\_ "thread.message.deleted"constant"thread.message.deleted"constant
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema) > (property) object>)
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema)>)
class MessageDelta:
The delta containing the fields that have changed on the Message.
Optional\<List\<[MessageContentDelta](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) message_content_delta > (schema)>)\>\> content
The content of the message in array of text and/or images.
One of the following:
class ImageFileDeltaBlock:
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
long index
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) index>)
JsonValue; type "image\_file"constant"image\_file"constant
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) type>)
Optional\<[ImageFileDelta](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) image_file_delta > (schema)>)\> imageFile
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) image_file>)
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema)>)
class TextDeltaBlock:
The text content that is part of a message.
long index
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) index>)
JsonValue; type "text"constant"text"constant
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) type>)
Optional\<[TextDelta](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) text_delta > (schema)>)\> text
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema)>)
class RefusalDeltaBlock:
The refusal content that is part of a message.
long index
The index of the refusal part in the message.
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) index>)
JsonValue; type "refusal"constant"refusal"constant
Always `refusal`.
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) type>)
Optional\<String\> refusal
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) refusal>)
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema)>)
class ImageUrlDeltaBlock:
References an image URL in the content of a message.
long index
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) index>)
JsonValue; type "image\_url"constant"image\_url"constant
Always `image\_url`.
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) type>)
Optional\<[ImageUrlDelta](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) image_url_delta > (schema)>)\> imageUrl
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) image_url>)
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema)>)
[](<#(resource) beta.threads.messages > (model) message_delta > (schema) > (property) content>)
Optional\<Role\> role
The entity that produced the message. One of `user` or `assistant`.
One of the following:
USER("user")
[](<#(resource) beta.threads.messages > (model) message_delta > (schema) > (property) role > (member) 0>)
ASSISTANT("assistant")
[](<#(resource) beta.threads.messages > (model) message_delta > (schema) > (property) role > (member) 1>)
[](<#(resource) beta.threads.messages > (model) message_delta > (schema) > (property) role>)
[](<#(resource) beta.threads.messages > (model) message_delta > (schema)>)
class MessageDeltaEvent:
Represents a message delta i.e. any changed fields on a message during streaming.
String id
The identifier of the message, which can be referenced in API endpoints.
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) id>)
[MessageDelta](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) message_delta > (schema)>) delta
The delta containing the fields that have changed on the Message.
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta>)
JsonValue; object\_ "thread.message.delta"constant"thread.message.delta"constant
The object type, which is always `thread.message.delta`.
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) object>)
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema)>)
class RefusalContentBlock:
The refusal content generated by the assistant.
String refusal
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) refusal>)
JsonValue; type "refusal"constant"refusal"constant
Always `refusal`.
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema)>)
class RefusalDeltaBlock:
The refusal content that is part of a message.
long index
The index of the refusal part in the message.
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) index>)
JsonValue; type "refusal"constant"refusal"constant
Always `refusal`.
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) type>)
Optional\<String\> refusal
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) refusal>)
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema)>)
class Text:
List\<[Annotation](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) annotation > (schema)>)\> annotations
One of the following:
class FileCitationAnnotation:
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
long endIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) end_index>)
FileCitation fileCitation
String fileId
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation>)
long startIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) start_index>)
String text
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) text>)
JsonValue; type "file\_citation"constant"file\_citation"constant
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema)>)
class FilePathAnnotation:
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
long endIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) end_index>)
FilePath filePath
String fileId
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path>)
long startIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) start_index>)
String text
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) text>)
JsonValue; type "file\_path"constant"file\_path"constant
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema)>)
[](<#(resource) beta.threads.messages > (model) text > (schema) > (property) annotations>)
String value
The data that makes up the text.
[](<#(resource) beta.threads.messages > (model) text > (schema) > (property) value>)
[](<#(resource) beta.threads.messages > (model) text > (schema)>)
class TextContentBlock:
The text content that is part of a message.
[Text](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) text > (schema)>) text
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text>)
JsonValue; type "text"constant"text"constant
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema)>)
class TextContentBlockParam:
The text content that is part of a message.
String text
Text content to be sent to the model
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema) > (property) text>)
JsonValue; type "text"constant"text"constant
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema)>)
class TextDelta:
Optional\<List\<[AnnotationDelta](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) annotation_delta > (schema)>)\>\> annotations
One of the following:
class FileCitationDeltaAnnotation:
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
long index
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) index>)
JsonValue; type "file\_citation"constant"file\_citation"constant
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) type>)
Optional\<Long\> endIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) end_index>)
Optional\<FileCitation\> fileCitation
Optional\<String\> fileId
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) file_id>)
Optional\<String\> quote
The specific quote in the file.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) quote>)
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation>)
Optional\<Long\> startIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) start_index>)
Optional\<String\> text
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema)>)
class FilePathDeltaAnnotation:
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
long index
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) index>)
JsonValue; type "file\_path"constant"file\_path"constant
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) type>)
Optional\<Long\> endIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) end_index>)
Optional\<FilePath\> filePath
Optional\<String\> fileId
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path>)
Optional\<Long\> startIndex
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) start_index>)
Optional\<String\> text
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema)>)
[](<#(resource) beta.threads.messages > (model) text_delta > (schema) > (property) annotations>)
Optional\<String\> value
The data that makes up the text.
[](<#(resource) beta.threads.messages > (model) text_delta > (schema) > (property) value>)
[](<#(resource) beta.threads.messages > (model) text_delta > (schema)>)
class TextDeltaBlock:
The text content that is part of a message.
long index
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) index>)
JsonValue; type "text"constant"text"constant
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) type>)
Optional\<[TextDelta](</api/reference/java/resources/beta#(resource) beta.threads.messages > (model) text_delta > (schema)>)\> text
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema)>)