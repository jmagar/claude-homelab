Files | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Files
Files are used to upload documents that can be used with features like Assistants and Fine-tuning.
##### [List files](/api/reference/go/resources/files/methods/list)
client.Files.List(ctx, query) (\*CursorPage[[FileObject](</api/reference/go/resources/files#(resource) files > (model) file_object > (schema)>)], error)
GET/files
##### [Upload file](/api/reference/go/resources/files/methods/create)
client.Files.New(ctx, body) (\*[FileObject](</api/reference/go/resources/files#(resource) files > (model) file_object > (schema)>), error)
POST/files
##### [Delete file](/api/reference/go/resources/files/methods/delete)
client.Files.Delete(ctx, fileID) (\*[FileDeleted](</api/reference/go/resources/files#(resource) files > (model) file_deleted > (schema)>), error)
DELETE/files/{file\_id}
##### [Retrieve file](/api/reference/go/resources/files/methods/retrieve)
client.Files.Get(ctx, fileID) (\*[FileObject](</api/reference/go/resources/files#(resource) files > (model) file_object > (schema)>), error)
GET/files/{file\_id}
##### [Retrieve file content](/api/reference/go/resources/files/methods/content)
client.Files.Content(ctx, fileID) (\*Response, error)
GET/files/{file\_id}/content
##### ModelsExpand Collapse
type FileContent string
[](<#(resource) files > (model) file_content > (schema)>)
type FileDeleted struct{…}
ID string
[](<#(resource) files > (model) file_deleted > (schema) > (property) id>)
Deleted bool
[](<#(resource) files > (model) file_deleted > (schema) > (property) deleted>)
Object File
[](<#(resource) files > (model) file_deleted > (schema) > (property) object>)
[](<#(resource) files > (model) file_deleted > (schema)>)
type FileObject struct{…}
The `File` object represents a document that has been uploaded to OpenAI.
ID string
The file identifier, which can be referenced in the API endpoints.
[](<#(resource) files > (model) file_object > (schema) > (property) id>)
Bytes int64
The size of the file, in bytes.
[](<#(resource) files > (model) file_object > (schema) > (property) bytes>)
CreatedAt int64
The Unix timestamp (in seconds) for when the file was created.
formatunixtime
[](<#(resource) files > (model) file_object > (schema) > (property) created_at>)
Filename string
The name of the file.
[](<#(resource) files > (model) file_object > (schema) > (property) filename>)
Object File
The object type, which is always `file`.
[](<#(resource) files > (model) file_object > (schema) > (property) object>)
Purpose FileObjectPurpose
The intended purpose of the file. Supported values are `assistants`, `assistants\_output`, `batch`, `batch\_output`, `fine-tune`, `fine-tune-results`, `vision`, and `user\_data`.
One of the following:
const FileObjectPurposeAssistants FileObjectPurpose = "assistants"
[](<#(resource) files > (model) file_object > (schema) > (property) purpose > (member) 0>)
const FileObjectPurposeAssistantsOutput FileObjectPurpose = "assistants\_output"
[](<#(resource) files > (model) file_object > (schema) > (property) purpose > (member) 1>)
const FileObjectPurposeBatch FileObjectPurpose = "batch"
[](<#(resource) files > (model) file_object > (schema) > (property) purpose > (member) 2>)
const FileObjectPurposeBatchOutput FileObjectPurpose = "batch\_output"
[](<#(resource) files > (model) file_object > (schema) > (property) purpose > (member) 3>)
const FileObjectPurposeFineTune FileObjectPurpose = "fine-tune"
[](<#(resource) files > (model) file_object > (schema) > (property) purpose > (member) 4>)
const FileObjectPurposeFineTuneResults FileObjectPurpose = "fine-tune-results"
[](<#(resource) files > (model) file_object > (schema) > (property) purpose > (member) 5>)
const FileObjectPurposeVision FileObjectPurpose = "vision"
[](<#(resource) files > (model) file_object > (schema) > (property) purpose > (member) 6>)
const FileObjectPurposeUserData FileObjectPurpose = "user\_data"
[](<#(resource) files > (model) file_object > (schema) > (property) purpose > (member) 7>)
[](<#(resource) files > (model) file_object > (schema) > (property) purpose>)
DeprecatedStatus FileObjectStatus
Deprecated. The current status of the file, which can be either `uploaded`, `processed`, or `error`.
One of the following:
const FileObjectStatusUploaded FileObjectStatus = "uploaded"
[](<#(resource) files > (model) file_object > (schema) > (property) status > (member) 0>)
const FileObjectStatusProcessed FileObjectStatus = "processed"
[](<#(resource) files > (model) file_object > (schema) > (property) status > (member) 1>)
const FileObjectStatusError FileObjectStatus = "error"
[](<#(resource) files > (model) file_object > (schema) > (property) status > (member) 2>)
[](<#(resource) files > (model) file_object > (schema) > (property) status>)
ExpiresAt int64Optional
The Unix timestamp (in seconds) for when the file will expire.
formatunixtime
[](<#(resource) files > (model) file_object > (schema) > (property) expires_at>)
DeprecatedStatusDetails stringOptional
Deprecated. For details on why a fine-tuning training file failed validation, see the `error` field on `fine\_tuning.job`.
[](<#(resource) files > (model) file_object > (schema) > (property) status_details>)
[](<#(resource) files > (model) file_object > (schema)>)
type FilePurpose string
The intended purpose of the uploaded file. One of:
* `assistants`: Used in the Assistants API
* `batch`: Used in the Batch API
* `fine-tune`: Used for fine-tuning
* `vision`: Images used for vision fine-tuning
* `user\_data`: Flexible file type for any purpose
* `evals`: Used for eval data sets
One of the following:
const FilePurposeAssistants [FilePurpose](</api/reference/go/resources/files#(resource) files > (model) file_purpose > (schema)>) = "assistants"
[](<#(resource) files > (model) file_purpose > (schema) > (member) 0>)
const FilePurposeBatch [FilePurpose](</api/reference/go/resources/files#(resource) files > (model) file_purpose > (schema)>) = "batch"
[](<#(resource) files > (model) file_purpose > (schema) > (member) 1>)
const FilePurposeFineTune [FilePurpose](</api/reference/go/resources/files#(resource) files > (model) file_purpose > (schema)>) = "fine-tune"
[](<#(resource) files > (model) file_purpose > (schema) > (member) 2>)
const FilePurposeVision [FilePurpose](</api/reference/go/resources/files#(resource) files > (model) file_purpose > (schema)>) = "vision"
[](<#(resource) files > (model) file_purpose > (schema) > (member) 3>)
const FilePurposeUserData [FilePurpose](</api/reference/go/resources/files#(resource) files > (model) file_purpose > (schema)>) = "user\_data"
[](<#(resource) files > (model) file_purpose > (schema) > (member) 4>)
const FilePurposeEvals [FilePurpose](</api/reference/go/resources/files#(resource) files > (model) file_purpose > (schema)>) = "evals"
[](<#(resource) files > (model) file_purpose > (schema) > (member) 5>)
[](<#(resource) files > (model) file_purpose > (schema)>)