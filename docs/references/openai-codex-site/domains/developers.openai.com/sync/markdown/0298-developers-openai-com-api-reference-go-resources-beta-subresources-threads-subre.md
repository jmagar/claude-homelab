Messages | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Beta](/api/reference/go/resources/beta)
[Threads](/api/reference/go/resources/beta/subresources/threads)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Messages
Build Assistants that can call models and use tools.
##### [List messages](/api/reference/go/resources/beta/subresources/threads/subresources/messages/methods/list)
Deprecated
client.Beta.Threads.Messages.List(ctx, threadID, query) (\*CursorPage[[Message](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>)], error)
GET/threads/{thread\_id}/messages
##### [Create message](/api/reference/go/resources/beta/subresources/threads/subresources/messages/methods/create)
Deprecated
client.Beta.Threads.Messages.New(ctx, threadID, body) (\*[Message](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>), error)
POST/threads/{thread\_id}/messages
##### [Modify message](/api/reference/go/resources/beta/subresources/threads/subresources/messages/methods/update)
Deprecated
client.Beta.Threads.Messages.Update(ctx, threadID, messageID, body) (\*[Message](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>), error)
POST/threads/{thread\_id}/messages/{message\_id}
##### [Retrieve message](/api/reference/go/resources/beta/subresources/threads/subresources/messages/methods/retrieve)
Deprecated
client.Beta.Threads.Messages.Get(ctx, threadID, messageID) (\*[Message](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) message > (schema)>), error)
GET/threads/{thread\_id}/messages/{message\_id}
##### [Delete message](/api/reference/go/resources/beta/subresources/threads/subresources/messages/methods/delete)
Deprecated
client.Beta.Threads.Messages.Delete(ctx, threadID, messageID) (\*[MessageDeleted](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) message_deleted > (schema)>), error)
DELETE/threads/{thread\_id}/messages/{message\_id}
##### ModelsExpand Collapse
type AnnotationUnion interface{…}
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
One of the following:
type FileCitationAnnotation struct{…}
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
EndIndex int64
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) end_index>)
FileCitation FileCitationAnnotationFileCitation
FileID string
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation>)
StartIndex int64
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) start_index>)
Text string
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) text>)
Type FileCitation
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema)>)
type FilePathAnnotation struct{…}
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
EndIndex int64
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) end_index>)
FilePath FilePathAnnotationFilePath
FileID string
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path>)
StartIndex int64
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) start_index>)
Text string
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) text>)
Type FilePath
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema)>)
[](<#(resource) beta.threads.messages > (model) annotation > (schema)>)
type AnnotationDeltaUnion interface{…}
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
One of the following:
type FileCitationDeltaAnnotation struct{…}
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
Index int64
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) index>)
Type FileCitation
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) type>)
EndIndex int64Optional
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) end_index>)
FileCitation FileCitationDeltaAnnotationFileCitationOptional
FileID stringOptional
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) file_id>)
Quote stringOptional
The specific quote in the file.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) quote>)
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation>)
StartIndex int64Optional
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) start_index>)
Text stringOptional
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema)>)
type FilePathDeltaAnnotation struct{…}
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
Index int64
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) index>)
Type FilePath
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) type>)
EndIndex int64Optional
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) end_index>)
FilePath FilePathDeltaAnnotationFilePathOptional
FileID stringOptional
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path>)
StartIndex int64Optional
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) start_index>)
Text stringOptional
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema)>)
[](<#(resource) beta.threads.messages > (model) annotation_delta > (schema)>)
type FileCitationAnnotation struct{…}
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
EndIndex int64
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) end_index>)
FileCitation FileCitationAnnotationFileCitation
FileID string
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation>)
StartIndex int64
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) start_index>)
Text string
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) text>)
Type FileCitation
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema)>)
type FileCitationDeltaAnnotation struct{…}
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
Index int64
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) index>)
Type FileCitation
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) type>)
EndIndex int64Optional
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) end_index>)
FileCitation FileCitationDeltaAnnotationFileCitationOptional
FileID stringOptional
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) file_id>)
Quote stringOptional
The specific quote in the file.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) quote>)
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation>)
StartIndex int64Optional
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) start_index>)
Text stringOptional
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema)>)
type FilePathAnnotation struct{…}
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
EndIndex int64
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) end_index>)
FilePath FilePathAnnotationFilePath
FileID string
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path>)
StartIndex int64
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) start_index>)
Text string
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) text>)
Type FilePath
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema)>)
type FilePathDeltaAnnotation struct{…}
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
Index int64
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) index>)
Type FilePath
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) type>)
EndIndex int64Optional
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) end_index>)
FilePath FilePathDeltaAnnotationFilePathOptional
FileID stringOptional
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path>)
StartIndex int64Optional
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) start_index>)
Text stringOptional
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema)>)
type ImageFile struct{…}
FileID string
The [File](https://platform.openai.com/docs/api-reference/files) ID of the image in the message content. Set `purpose="vision"` when uploading the File if you need to later display the file content.
[](<#(resource) beta.threads.messages > (model) image_file > (schema) > (property) file_id>)
Detail ImageFileDetailOptional
Specifies the detail level of the image if specified by the user. `low` uses fewer tokens, you can opt in to high resolution using `high`.
One of the following:
const ImageFileDetailAuto ImageFileDetail = "auto"
[](<#(resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 0>)
const ImageFileDetailLow ImageFileDetail = "low"
[](<#(resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 1>)
const ImageFileDetailHigh ImageFileDetail = "high"
[](<#(resource) beta.threads.messages > (model) image_file > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_file > (schema) > (property) detail>)
[](<#(resource) beta.threads.messages > (model) image_file > (schema)>)
type ImageFileContentBlock struct{…}
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
ImageFile [ImageFile](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) image_file > (schema)>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file>)
Type ImageFile
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema)>)
type ImageFileDelta struct{…}
Detail ImageFileDeltaDetailOptional
Specifies the detail level of the image if specified by the user. `low` uses fewer tokens, you can opt in to high resolution using `high`.
One of the following:
const ImageFileDeltaDetailAuto ImageFileDeltaDetail = "auto"
[](<#(resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) detail > (member) 0>)
const ImageFileDeltaDetailLow ImageFileDeltaDetail = "low"
[](<#(resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) detail > (member) 1>)
const ImageFileDeltaDetailHigh ImageFileDeltaDetail = "high"
[](<#(resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) detail>)
FileID stringOptional
The [File](https://platform.openai.com/docs/api-reference/files) ID of the image in the message content. Set `purpose="vision"` when uploading the File if you need to later display the file content.
[](<#(resource) beta.threads.messages > (model) image_file_delta > (schema) > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) image_file_delta > (schema)>)
type ImageFileDeltaBlock struct{…}
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
Index int64
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) index>)
Type ImageFile
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) type>)
ImageFile [ImageFileDelta](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) image_file_delta > (schema)>)Optional
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) image_file>)
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema)>)
type ImageURL struct{…}
URL string
The external URL of the image, must be a supported image types: jpeg, jpg, png, gif, webp.
formaturi
[](<#(resource) beta.threads.messages > (model) image_url > (schema) > (property) url>)
Detail ImageURLDetailOptional
Specifies the detail level of the image. `low` uses fewer tokens, you can opt in to high resolution using `high`. Default value is `auto`
One of the following:
const ImageURLDetailAuto ImageURLDetail = "auto"
[](<#(resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 0>)
const ImageURLDetailLow ImageURLDetail = "low"
[](<#(resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 1>)
const ImageURLDetailHigh ImageURLDetail = "high"
[](<#(resource) beta.threads.messages > (model) image_url > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_url > (schema) > (property) detail>)
[](<#(resource) beta.threads.messages > (model) image_url > (schema)>)
type ImageURLContentBlock struct{…}
References an image URL in the content of a message.
ImageURL [ImageURL](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) image_url > (schema)>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url>)
Type ImageURL
The type of the content part.
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema)>)
type ImageURLDelta struct{…}
Detail ImageURLDeltaDetailOptional
Specifies the detail level of the image. `low` uses fewer tokens, you can opt in to high resolution using `high`.
One of the following:
const ImageURLDeltaDetailAuto ImageURLDeltaDetail = "auto"
[](<#(resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) detail > (member) 0>)
const ImageURLDeltaDetailLow ImageURLDeltaDetail = "low"
[](<#(resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) detail > (member) 1>)
const ImageURLDeltaDetailHigh ImageURLDeltaDetail = "high"
[](<#(resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) detail > (member) 2>)
[](<#(resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) detail>)
URL stringOptional
The URL of the image, must be a supported image types: jpeg, jpg, png, gif, webp.
formaturi
[](<#(resource) beta.threads.messages > (model) image_url_delta > (schema) > (property) url>)
[](<#(resource) beta.threads.messages > (model) image_url_delta > (schema)>)
type ImageURLDeltaBlock struct{…}
References an image URL in the content of a message.
Index int64
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) index>)
Type ImageURL
Always `image\_url`.
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) type>)
ImageURL [ImageURLDelta](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) image_url_delta > (schema)>)Optional
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) image_url>)
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema)>)
type Message struct{…}
Represents a message within a [thread](https://platform.openai.com/docs/api-reference/threads).
ID string
The identifier, which can be referenced in API endpoints.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) id>)
AssistantID string
If applicable, the ID of the [assistant](https://platform.openai.com/docs/api-reference/assistants) that authored this message.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) assistant_id>)
Attachments []MessageAttachment
A list of files attached to the message, and the tools they were added to.
FileID stringOptional
The ID of the file to attach to the message.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) file_id>)
Tools []MessageAttachmentToolUnionOptional
The tools to add this file to.
One of the following:
type CodeInterpreterTool struct{…}
Type CodeInterpreter
The type of tool being defined: `code\_interpreter`
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema) > (property) type>)
[](<#(resource) beta.assistants > (model) code_interpreter_tool > (schema)>)
type MessageAttachmentToolAssistantToolsFileSearchTypeOnly struct{…}
Type FileSearch
The type of tool being defined: `file\_search`
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools > (items) > (variant) 1 > (property) type>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools > (items) > (variant) 1>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) attachments > (items) > (property) tools>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) attachments>)
CompletedAt int64
The Unix timestamp (in seconds) for when the message was completed.
formatunixtime
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) completed_at>)
Content [][MessageContentUnion](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) message_content > (schema)>)
The content of the message in array of text and/or images.
One of the following:
type ImageFileContentBlock struct{…}
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
ImageFile [ImageFile](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) image_file > (schema)>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file>)
Type ImageFile
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema)>)
type ImageURLContentBlock struct{…}
References an image URL in the content of a message.
ImageURL [ImageURL](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) image_url > (schema)>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url>)
Type ImageURL
The type of the content part.
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema)>)
type TextContentBlock struct{…}
The text content that is part of a message.
Text [Text](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) text > (schema)>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text>)
Type Text
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema)>)
type RefusalContentBlock struct{…}
The refusal content generated by the assistant.
Refusal string
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) refusal>)
Type Refusal
Always `refusal`.
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema)>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) content>)
CreatedAt int64
The Unix timestamp (in seconds) for when the message was created.
formatunixtime
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) created_at>)
IncompleteAt int64
The Unix timestamp (in seconds) for when the message was marked as incomplete.
formatunixtime
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_at>)
IncompleteDetails MessageIncompleteDetails
On an incomplete message, details about why the message is incomplete.
Reason string
The reason the message is incomplete.
One of the following:
const MessageIncompleteDetailsReasonContentFilter MessageIncompleteDetailsReason = "content\_filter"
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 0>)
const MessageIncompleteDetailsReasonMaxTokens MessageIncompleteDetailsReason = "max\_tokens"
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 1>)
const MessageIncompleteDetailsReasonRunCancelled MessageIncompleteDetailsReason = "run\_cancelled"
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 2>)
const MessageIncompleteDetailsReasonRunExpired MessageIncompleteDetailsReason = "run\_expired"
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 3>)
const MessageIncompleteDetailsReasonRunFailed MessageIncompleteDetailsReason = "run\_failed"
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason > (member) 4>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details > (property) reason>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) incomplete_details>)
Metadata [Metadata](</api/reference/go/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) metadata>)
Object ThreadMessage
The object type, which is always `thread.message`.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) object>)
Role MessageRole
The entity that produced the message. One of `user` or `assistant`.
One of the following:
const MessageRoleUser MessageRole = "user"
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) role > (member) 0>)
const MessageRoleAssistant MessageRole = "assistant"
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) role > (member) 1>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) role>)
RunID string
The ID of the [run](https://platform.openai.com/docs/api-reference/runs) associated with the creation of this message. Value is `null` when messages are created manually using the create message or create thread endpoints.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) run_id>)
Status MessageStatus
The status of the message, which can be either `in\_progress`, `incomplete`, or `completed`.
One of the following:
const MessageStatusInProgress MessageStatus = "in\_progress"
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) status > (member) 0>)
const MessageStatusIncomplete MessageStatus = "incomplete"
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) status > (member) 1>)
const MessageStatusCompleted MessageStatus = "completed"
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) status > (member) 2>)
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) status>)
ThreadID string
The [thread](https://platform.openai.com/docs/api-reference/threads) ID that this message belongs to.
[](<#(resource) beta.threads.messages > (model) message > (schema) > (property) thread_id>)
[](<#(resource) beta.threads.messages > (model) message > (schema)>)
type MessageContentUnion interface{…}
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
One of the following:
type ImageFileContentBlock struct{…}
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
ImageFile [ImageFile](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) image_file > (schema)>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file>)
Type ImageFile
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema)>)
type ImageURLContentBlock struct{…}
References an image URL in the content of a message.
ImageURL [ImageURL](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) image_url > (schema)>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) image_url>)
Type ImageURL
The type of the content part.
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_url_content_block > (schema)>)
type TextContentBlock struct{…}
The text content that is part of a message.
Text [Text](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) text > (schema)>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text>)
Type Text
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema)>)
type RefusalContentBlock struct{…}
The refusal content generated by the assistant.
Refusal string
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) refusal>)
Type Refusal
Always `refusal`.
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema)>)
[](<#(resource) beta.threads.messages > (model) message_content > (schema)>)
type MessageContentDeltaUnion interface{…}
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
One of the following:
type ImageFileDeltaBlock struct{…}
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
Index int64
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) index>)
Type ImageFile
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) type>)
ImageFile [ImageFileDelta](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) image_file_delta > (schema)>)Optional
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) image_file>)
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema)>)
type TextDeltaBlock struct{…}
The text content that is part of a message.
Index int64
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) index>)
Type Text
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) type>)
Text [TextDelta](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) text_delta > (schema)>)Optional
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema)>)
type RefusalDeltaBlock struct{…}
The refusal content that is part of a message.
Index int64
The index of the refusal part in the message.
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) index>)
Type Refusal
Always `refusal`.
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) type>)
Refusal stringOptional
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) refusal>)
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema)>)
type ImageURLDeltaBlock struct{…}
References an image URL in the content of a message.
Index int64
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) index>)
Type ImageURL
Always `image\_url`.
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) type>)
ImageURL [ImageURLDelta](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) image_url_delta > (schema)>)Optional
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) image_url>)
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema)>)
[](<#(resource) beta.threads.messages > (model) message_content_delta > (schema)>)
type MessageContentPartParamUnionResp interface{…}
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
One of the following:
type ImageFileContentBlock struct{…}
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
ImageFile [ImageFile](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) image_file > (schema)>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) image_file>)
Type ImageFile
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) image_file_content_block > (schema)>)
type ImageURLContentBlock struct{…}
References an image URL in the content of a message.
ImageURL [ImageURL](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) image_url > (schema)>)
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
[](<#(resource) beta.threads.messages > (model) message_content_part_param > (schema)>)
type MessageDeleted struct{…}
ID string
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema) > (property) id>)
Deleted bool
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema) > (property) deleted>)
Object ThreadMessageDeleted
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema) > (property) object>)
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema)>)
type MessageDelta struct{…}
The delta containing the fields that have changed on the Message.
Content [][MessageContentDeltaUnion](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) message_content_delta > (schema)>)Optional
The content of the message in array of text and/or images.
One of the following:
type ImageFileDeltaBlock struct{…}
References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
Index int64
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) index>)
Type ImageFile
Always `image\_file`.
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) type>)
ImageFile [ImageFileDelta](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) image_file_delta > (schema)>)Optional
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema) > (property) image_file>)
[](<#(resource) beta.threads.messages > (model) image_file_delta_block > (schema)>)
type TextDeltaBlock struct{…}
The text content that is part of a message.
Index int64
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) index>)
Type Text
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) type>)
Text [TextDelta](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) text_delta > (schema)>)Optional
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema)>)
type RefusalDeltaBlock struct{…}
The refusal content that is part of a message.
Index int64
The index of the refusal part in the message.
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) index>)
Type Refusal
Always `refusal`.
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) type>)
Refusal stringOptional
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) refusal>)
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema)>)
type ImageURLDeltaBlock struct{…}
References an image URL in the content of a message.
Index int64
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) index>)
Type ImageURL
Always `image\_url`.
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) type>)
ImageURL [ImageURLDelta](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) image_url_delta > (schema)>)Optional
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema) > (property) image_url>)
[](<#(resource) beta.threads.messages > (model) image_url_delta_block > (schema)>)
[](<#(resource) beta.threads.messages > (model) message_delta > (schema) > (property) content>)
Role MessageDeltaRoleOptional
The entity that produced the message. One of `user` or `assistant`.
One of the following:
const MessageDeltaRoleUser MessageDeltaRole = "user"
[](<#(resource) beta.threads.messages > (model) message_delta > (schema) > (property) role > (member) 0>)
const MessageDeltaRoleAssistant MessageDeltaRole = "assistant"
[](<#(resource) beta.threads.messages > (model) message_delta > (schema) > (property) role > (member) 1>)
[](<#(resource) beta.threads.messages > (model) message_delta > (schema) > (property) role>)
[](<#(resource) beta.threads.messages > (model) message_delta > (schema)>)
type MessageDeltaEvent struct{…}
Represents a message delta i.e. any changed fields on a message during streaming.
ID string
The identifier of the message, which can be referenced in API endpoints.
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) id>)
Delta [MessageDelta](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) message_delta > (schema)>)
The delta containing the fields that have changed on the Message.
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) delta>)
Object ThreadMessageDelta
The object type, which is always `thread.message.delta`.
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema) > (property) object>)
[](<#(resource) beta.threads.messages > (model) message_delta_event > (schema)>)
type RefusalContentBlock struct{…}
The refusal content generated by the assistant.
Refusal string
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) refusal>)
Type Refusal
Always `refusal`.
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) refusal_content_block > (schema)>)
type RefusalDeltaBlock struct{…}
The refusal content that is part of a message.
Index int64
The index of the refusal part in the message.
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) index>)
Type Refusal
Always `refusal`.
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) type>)
Refusal stringOptional
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema) > (property) refusal>)
[](<#(resource) beta.threads.messages > (model) refusal_delta_block > (schema)>)
type Text struct{…}
Annotations [][AnnotationUnion](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) annotation > (schema)>)
One of the following:
type FileCitationAnnotation struct{…}
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
EndIndex int64
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) end_index>)
FileCitation FileCitationAnnotationFileCitation
FileID string
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) file_citation>)
StartIndex int64
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) start_index>)
Text string
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) text>)
Type FileCitation
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) file_citation_annotation > (schema)>)
type FilePathAnnotation struct{…}
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
EndIndex int64
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) end_index>)
FilePath FilePathAnnotationFilePath
FileID string
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) file_path>)
StartIndex int64
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) start_index>)
Text string
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) text>)
Type FilePath
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) file_path_annotation > (schema)>)
[](<#(resource) beta.threads.messages > (model) text > (schema) > (property) annotations>)
Value string
The data that makes up the text.
[](<#(resource) beta.threads.messages > (model) text > (schema) > (property) value>)
[](<#(resource) beta.threads.messages > (model) text > (schema)>)
type TextContentBlock struct{…}
The text content that is part of a message.
Text [Text](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) text > (schema)>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) text>)
Type Text
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block > (schema)>)
type TextContentBlockParam struct{…}
The text content that is part of a message.
Text string
Text content to be sent to the model
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema) > (property) text>)
Type Text
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema) > (property) type>)
[](<#(resource) beta.threads.messages > (model) text_content_block_param > (schema)>)
type TextDelta struct{…}
Annotations [][AnnotationDeltaUnion](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) annotation_delta > (schema)>)Optional
One of the following:
type FileCitationDeltaAnnotation struct{…}
A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the “file\_search” tool to search files.
Index int64
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) index>)
Type FileCitation
Always `file\_citation`.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) type>)
EndIndex int64Optional
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) end_index>)
FileCitation FileCitationDeltaAnnotationFileCitationOptional
FileID stringOptional
The ID of the specific File the citation is from.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) file_id>)
Quote stringOptional
The specific quote in the file.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation > (property) quote>)
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) file_citation>)
StartIndex int64Optional
minimum0
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) start_index>)
Text stringOptional
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) file_citation_delta_annotation > (schema)>)
type FilePathDeltaAnnotation struct{…}
A URL for the file that’s generated when the assistant used the `code\_interpreter` tool to generate a file.
Index int64
The index of the annotation in the text content part.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) index>)
Type FilePath
Always `file\_path`.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) type>)
EndIndex int64Optional
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) end_index>)
FilePath FilePathDeltaAnnotationFilePathOptional
FileID stringOptional
The ID of the file that was generated.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path > (property) file_id>)
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) file_path>)
StartIndex int64Optional
minimum0
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) start_index>)
Text stringOptional
The text in the message content that needs to be replaced.
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) file_path_delta_annotation > (schema)>)
[](<#(resource) beta.threads.messages > (model) text_delta > (schema) > (property) annotations>)
Value stringOptional
The data that makes up the text.
[](<#(resource) beta.threads.messages > (model) text_delta > (schema) > (property) value>)
[](<#(resource) beta.threads.messages > (model) text_delta > (schema)>)
type TextDeltaBlock struct{…}
The text content that is part of a message.
Index int64
The index of the content part in the message.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) index>)
Type Text
Always `text`.
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) type>)
Text [TextDelta](</api/reference/go/resources/beta#(resource) beta.threads.messages > (model) text_delta > (schema)>)Optional
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema) > (property) text>)
[](<#(resource) beta.threads.messages > (model) text_delta_block > (schema)>)