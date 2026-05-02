Upload file | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Files](/api/reference/resources/files)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Upload file
POST/files
Upload a file that can be used across various endpoints. Individual files
can be up to 512 MB, and each project can store up to 2.5 TB of files in
total. There is no organization-wide storage limit. Uploads to this
endpoint are rate-limited to 1,000 requests per minute per authenticated
user.
* The Assistants API supports files up to 2 million tokens and of specific
file types. See the [Assistants Tools guide](/docs/assistants/tools) for
details.
* The Fine-tuning API only supports `.jsonl` files. The input also has
certain required formats for fine-tuning
[chat](/docs/api-reference/fine-tuning/chat-input) or
[completions](/docs/api-reference/fine-tuning/completions-input) models.
* The Batch API only supports `.jsonl` files up to 200 MB in size. The input
also has a specific required
[format](/docs/api-reference/batch/request-input).
* For Retrieval or `file\_search` ingestion, upload files here first. If
you need to attach multiple uploaded files to the same vector store, use
[`/vector\_stores/{vector\_store\_id}/file\_batches`](/docs/api-reference/vector-stores-file-batches/createBatch)
instead of attaching them one by one. Vector store attachment has separate
limits from file upload, including 2,000 attached files per minute per
organization.
Please [contact us](https://help.openai.com/) if you need to increase these
storage limits.
##### Body ParametersForm DataExpand Collapse
file: file
The File object (not file name) to be uploaded.
[](<#(resource) files > (method) create > (params) 0 > (param) file > (schema)>)
purpose: "assistants" or "batch" or "fine-tune" or 3 more
The intended purpose of the uploaded file. One of:
* `assistants`: Used in the Assistants API
* `batch`: Used in the Batch API
* `fine-tune`: Used for fine-tuning
* `vision`: Images used for vision fine-tuning
* `user\_data`: Flexible file type for any purpose
* `evals`: Used for eval data sets
One of the following:
"assistants"
[](<#(resource) files > (method) create > (params) 0 > (param) purpose > (schema) > (member) 0>)
"batch"
[](<#(resource) files > (method) create > (params) 0 > (param) purpose > (schema) > (member) 1>)
"fine-tune"
[](<#(resource) files > (method) create > (params) 0 > (param) purpose > (schema) > (member) 2>)
"vision"
[](<#(resource) files > (method) create > (params) 0 > (param) purpose > (schema) > (member) 3>)
"user\_data"
[](<#(resource) files > (method) create > (params) 0 > (param) purpose > (schema) > (member) 4>)
"evals"
[](<#(resource) files > (method) create > (params) 0 > (param) purpose > (schema) > (member) 5>)
[](<#(resource) files > (method) create > (params) 0 > (param) purpose > (schema)>)
expires\_after: optional object { anchor, seconds }
The expiration policy for a file. By default, files with `purpose=batch` expire after 30 days and all other files are persisted until they are manually deleted.
anchor: "created\_at"
Anchor timestamp after which the expiration policy applies. Supported anchors: `created\_at`.
[](<#(resource) files > (method) create > (params) 0 > (param) expires_after > (schema) > (property) anchor>)
seconds: number
The number of seconds after the anchor time that the file will expire. Must be between 3600 (1 hour) and 2592000 (30 days).
formatint64
minimum3600
maximum2592000
[](<#(resource) files > (method) create > (params) 0 > (param) expires_after > (schema) > (property) seconds>)
[](<#(resource) files > (method) create > (params) 0 > (param) expires_after > (schema)>)
##### ReturnsExpand Collapse
FileObject object { id, bytes, created\_at, 6 more }
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
purpose: "assistants" or "assistants\_output" or "batch" or 5 more
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
Deprecatedstatus: "uploaded" or "processed" or "error"
Deprecated. The current status of the file, which can be either `uploaded`, `processed`, or `error`.
One of the following:
"uploaded"
[](<#(resource) files > (model) file_object > (schema) > (property) status > (member) 0>)
"processed"
[](<#(resource) files > (model) file_object > (schema) > (property) status > (member) 1>)
"error"
[](<#(resource) files > (model) file_object > (schema) > (property) status > (member) 2>)
[](<#(resource) files > (model) file_object > (schema) > (property) status>)
expires\_at: optional number
The Unix timestamp (in seconds) for when the file will expire.
formatunixtime
[](<#(resource) files > (model) file_object > (schema) > (property) expires_at>)
Deprecatedstatus\_details: optional string
Deprecated. For details on why a fine-tuning training file failed validation, see the `error` field on `fine\_tuning.job`.
[](<#(resource) files > (model) file_object > (schema) > (property) status_details>)
[](<#(resource) files > (model) file_object > (schema)>)
### Upload file
HTTP
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
`curl https://api.openai.com/v1/files \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-F purpose="fine-tune" \\
-F file="@mydata.jsonl"
-F expires\_after[anchor]="created\_at"
-F expires\_after[seconds]=2592000
`
```
```
`{
"id": "file-abc123",
"object": "file",
"bytes": 120000,
"created\_at": 1677610602,
"expires\_at": 1677614202,
"filename": "mydata.jsonl",
"purpose": "fine-tune",
}
`
```
##### Returns Examples
```
`{
"id": "file-abc123",
"object": "file",
"bytes": 120000,
"created\_at": 1677610602,
"expires\_at": 1677614202,
"filename": "mydata.jsonl",
"purpose": "fine-tune",
}
`
```