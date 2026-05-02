Files | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Files
Files are used to upload documents that can be used with features like Assistants and Fine-tuning.
##### [List files](/api/reference/typescript/resources/files/methods/list)
client.files.list(FileListParams { after, limit, order, purpose } query?, RequestOptionsoptions?): CursorPage\<[FileObject](</api/reference/typescript/resources/files#(resource) files > (model) file_object > (schema)>) { id, bytes, created\_at, 6 more } \>
GET/files
##### [Upload file](/api/reference/typescript/resources/files/methods/create)
client.files.create(FileCreateParams { file, purpose, expires\_after } body, RequestOptionsoptions?): [FileObject](</api/reference/typescript/resources/files#(resource) files > (model) file_object > (schema)>) { id, bytes, created\_at, 6 more }
POST/files
##### [Delete file](/api/reference/typescript/resources/files/methods/delete)
client.files.delete(stringfileID, RequestOptionsoptions?): [FileDeleted](</api/reference/typescript/resources/files#(resource) files > (model) file_deleted > (schema)>) { id, deleted, object }
DELETE/files/{file\_id}
##### [Retrieve file](/api/reference/typescript/resources/files/methods/retrieve)
client.files.retrieve(stringfileID, RequestOptionsoptions?): [FileObject](</api/reference/typescript/resources/files#(resource) files > (model) file_object > (schema)>) { id, bytes, created\_at, 6 more }
GET/files/{file\_id}
##### [Retrieve file content](/api/reference/typescript/resources/files/methods/content)
client.files.content(stringfileID, RequestOptionsoptions?): Response
GET/files/{file\_id}/content
##### ModelsExpand Collapse
FileContent = string
[](<#(resource) files > (model) file_content > (schema)>)
FileDeleted { id, deleted, object }
id: string
[](<#(resource) files > (model) file_deleted > (schema) > (property) id>)
deleted: boolean
[](<#(resource) files > (model) file_deleted > (schema) > (property) deleted>)
object: "file"
[](<#(resource) files > (model) file_deleted > (schema) > (property) object>)
[](<#(resource) files > (model) file_deleted > (schema)>)
FileObject { id, bytes, created\_at, 6 more }
The `File` object represents a document that has been uploaded to OpenAI.
id: string
The file identifier, which can be referenced in the API endpoints.
[](<#(resource) files > (model) file_object > (schema) > (property) id>)
bytes: number
The size of the file, in bytes.
[](<#(resource) files > (model) file_object > (schema) > (property) bytes>)
created\_at: number
The Unix timestamp (in seconds) for when the file was created.
formatunixtime
[](<#(resource) files > (model) file_object > (schema) > (property) created_at>)
filename: string
The name of the file.
[](<#(resource) files > (model) file_object > (schema) > (property) filename>)
object: "file"
The object type, which is always `file`.
[](<#(resource) files > (model) file_object > (schema) > (property) object>)
purpose: "assistants" | "assistants\_output" | "batch" | 5 more
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
Deprecatedstatus: "uploaded" | "processed" | "error"
Deprecated. The current status of the file, which can be either `uploaded`, `processed`, or `error`.
One of the following:
"uploaded"
[](<#(resource) files > (model) file_object > (schema) > (property) status > (member) 0>)
"processed"
[](<#(resource) files > (model) file_object > (schema) > (property) status > (member) 1>)
"error"
[](<#(resource) files > (model) file_object > (schema) > (property) status > (member) 2>)
[](<#(resource) files > (model) file_object > (schema) > (property) status>)
expires\_at?: number
The Unix timestamp (in seconds) for when the file will expire.
formatunixtime
[](<#(resource) files > (model) file_object > (schema) > (property) expires_at>)
Deprecatedstatus\_details?: string
Deprecated. For details on why a fine-tuning training file failed validation, see the `error` field on `fine\_tuning.job`.
[](<#(resource) files > (model) file_object > (schema) > (property) status_details>)
[](<#(resource) files > (model) file_object > (schema)>)
FilePurpose = "assistants" | "batch" | "fine-tune" | 3 more
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