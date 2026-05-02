Files | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Files
Files are used to upload documents that can be used with features like Assistants and Fine-tuning.
##### [List files](/api/reference/python/resources/files/methods/list)
files.list(FileListParams\*\*kwargs) -\> SyncCursorPage[[FileObject](</api/reference/python/resources/files#(resource) files > (model) file_object > (schema)>)]
GET/files
##### [Upload file](/api/reference/python/resources/files/methods/create)
files.create(FileCreateParams\*\*kwargs) -\> [FileObject](</api/reference/python/resources/files#(resource) files > (model) file_object > (schema)>)
POST/files
##### [Delete file](/api/reference/python/resources/files/methods/delete)
files.delete(strfile\_id) -\> [FileDeleted](</api/reference/python/resources/files#(resource) files > (model) file_deleted > (schema)>)
DELETE/files/{file\_id}
##### [Retrieve file](/api/reference/python/resources/files/methods/retrieve)
files.retrieve(strfile\_id) -\> [FileObject](</api/reference/python/resources/files#(resource) files > (model) file_object > (schema)>)
GET/files/{file\_id}
##### [Retrieve file content](/api/reference/python/resources/files/methods/content)
files.content(strfile\_id) -\> BinaryResponseContent
GET/files/{file\_id}/content
##### [Retrieve file content](/api/reference/python/resources/files/methods/retrieve_content)
Deprecated
files.retrieve\_content(strfile\_id) -\> [FileContent](</api/reference/python/resources/files#(resource) files > (model) file_content > (schema)>)
GET/files/{file\_id}/content
##### ModelsExpand Collapse
str
[](<#(resource) files > (model) file_content > (schema)>)
class FileDeleted: …
id: str
[](<#(resource) files > (model) file_deleted > (schema) > (property) id>)
deleted: bool
[](<#(resource) files > (model) file_deleted > (schema) > (property) deleted>)
object: Literal["file"]
[](<#(resource) files > (model) file_deleted > (schema) > (property) object>)
[](<#(resource) files > (model) file_deleted > (schema)>)
class FileObject: …
The `File` object represents a document that has been uploaded to OpenAI.
id: str
The file identifier, which can be referenced in the API endpoints.
[](<#(resource) files > (model) file_object > (schema) > (property) id>)
bytes: int
The size of the file, in bytes.
[](<#(resource) files > (model) file_object > (schema) > (property) bytes>)
created\_at: int
The Unix timestamp (in seconds) for when the file was created.
formatunixtime
[](<#(resource) files > (model) file_object > (schema) > (property) created_at>)
filename: str
The name of the file.
[](<#(resource) files > (model) file_object > (schema) > (property) filename>)
object: Literal["file"]
The object type, which is always `file`.
[](<#(resource) files > (model) file_object > (schema) > (property) object>)
purpose: Literal["assistants", "assistants\_output", "batch", 5 more]
The intended purpose of the file. Supported values are `assistants`, `assistants\_output`, `batch`, `batch\_output`, `fine-tune`, `fine-tune-results`, `vision`, and `user\_data`.
One of the following:
"assistants"
[](<#(resource) files > (model) file_object > (schema) > (property) purpose > (member) 0>)
"assistants\_output"
[](<#(resource) files > (model) file_object > (schema) > (property) purpose > (member) 1>)
"batch"
[](<#(resource) files > (model) file_object > (schema) > (property) purpose > (member) 2>)
"batch\_output"
[](<#(resource) files > (model) file_object > (schema) > (property) purpose > (member) 3>)
"fine-tune"
[](<#(resource) files > (model) file_object > (schema) > (property) purpose > (member) 4>)
"fine-tune-results"
[](<#(resource) files > (model) file_object > (schema) > (property) purpose > (member) 5>)
"vision"
[](<#(resource) files > (model) file_object > (schema) > (property) purpose > (member) 6>)
"user\_data"
[](<#(resource) files > (model) file_object > (schema) > (property) purpose > (member) 7>)
[](<#(resource) files > (model) file_object > (schema) > (property) purpose>)
Deprecatedstatus: Literal["uploaded", "processed", "error"]
Deprecated. The current status of the file, which can be either `uploaded`, `processed`, or `error`.
One of the following:
"uploaded"
[](<#(resource) files > (model) file_object > (schema) > (property) status > (member) 0>)
"processed"
[](<#(resource) files > (model) file_object > (schema) > (property) status > (member) 1>)
"error"
[](<#(resource) files > (model) file_object > (schema) > (property) status > (member) 2>)
[](<#(resource) files > (model) file_object > (schema) > (property) status>)
expires\_at: Optional[int]
The Unix timestamp (in seconds) for when the file will expire.
formatunixtime
[](<#(resource) files > (model) file_object > (schema) > (property) expires_at>)
Deprecatedstatus\_details: Optional[str]
Deprecated. For details on why a fine-tuning training file failed validation, see the `error` field on `fine\_tuning.job`.
[](<#(resource) files > (model) file_object > (schema) > (property) status_details>)
[](<#(resource) files > (model) file_object > (schema)>)
Literal["assistants", "batch", "fine-tune", 3 more]
The intended purpose of the uploaded file. One of:
* `assistants`: Used in the Assistants API
* `batch`: Used in the Batch API
* `fine-tune`: Used for fine-tuning
* `vision`: Images used for vision fine-tuning
* `user\_data`: Flexible file type for any purpose
* `evals`: Used for eval data sets
One of the following:
"assistants"
[](<#(resource) files > (model) file_purpose > (schema) > (member) 0>)
"batch"
[](<#(resource) files > (model) file_purpose > (schema) > (member) 1>)
"fine-tune"
[](<#(resource) files > (model) file_purpose > (schema) > (member) 2>)
"vision"
[](<#(resource) files > (model) file_purpose > (schema) > (member) 3>)
"user\_data"
[](<#(resource) files > (model) file_purpose > (schema) > (member) 4>)
"evals"
[](<#(resource) files > (model) file_purpose > (schema) > (member) 5>)
[](<#(resource) files > (model) file_purpose > (schema)>)