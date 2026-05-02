Upload file | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Files](/api/reference/ruby/resources/files)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Upload file
files.create(\*\*kwargs) -\> [FileObject](</api/reference/ruby/resources/files#(resource) files > (model) file_object > (schema)>) { id, bytes, created\_at, 6 more }
POST/files
Upload a file that can be used across various endpoints. Individual files
can be up to 512 MB, and each project can store up to 2.5 TB of files in
total. There is no organization-wide storage limit. Uploads to this
endpoint are rate-limited to 1,000 requests per minute per authenticated
user.
* The Assistants API supports files up to 2 million tokens and of specific
file types. See the [Assistants Tools guide](https://platform.openai.com/docs/assistants/tools) for
details.
* The Fine-tuning API only supports `.jsonl` files. The input also has
certain required formats for fine-tuning
[chat](https://platform.openai.com/docs/api-reference/fine-tuning/chat-input) or
[completions](https://platform.openai.com/docs/api-reference/fine-tuning/completions-input) models.
* The Batch API only supports `.jsonl` files up to 200 MB in size. The input
also has a specific required
[format](https://platform.openai.com/docs/api-reference/batch/request-input).
* For Retrieval or `file\_search` ingestion, upload files here first. If
you need to attach multiple uploaded files to the same vector store, use
[`/vector\_stores/{vector\_store\_id}/file\_batches`](https://platform.openai.com/docs/api-reference/vector-stores-file-batches/createBatch)
instead of attaching them one by one. Vector store attachment has separate
limits from file upload, including 2,000 attached files per minute per
organization.
Please [contact us](https://help.openai.com/) if you need to increase these
storage limits.
##### ParametersExpand Collapse
file: FileInput
The File object (not file name) to be uploaded.
[](<#(resource) files > (method) create > (params) default > (param) file > (schema)>)
purpose: [FilePurpose](</api/reference/ruby/resources/files#(resource) files > (model) file_purpose > (schema)>)
The intended purpose of the uploaded file. One of:
* `assistants`: Used in the Assistants API
* `batch`: Used in the Batch API
* `fine-tune`: Used for fine-tuning
* `vision`: Images used for vision fine-tuning
* `user\_data`: Flexible file type for any purpose
* `evals`: Used for eval data sets
One of the following:
:assistants
[](<#(resource) files > (method) create > (params) default > (param) purpose > (schema) + (resource) files > (model) file_purpose > (schema) > (member) 0>)
:batch
[](<#(resource) files > (method) create > (params) default > (param) purpose > (schema) + (resource) files > (model) file_purpose > (schema) > (member) 1>)
:"fine-tune"
[](<#(resource) files > (method) create > (params) default > (param) purpose > (schema) + (resource) files > (model) file_purpose > (schema) > (member) 2>)
:vision
[](<#(resource) files > (method) create > (params) default > (param) purpose > (schema) + (resource) files > (model) file_purpose > (schema) > (member) 3>)
:user\_data
[](<#(resource) files > (method) create > (params) default > (param) purpose > (schema) + (resource) files > (model) file_purpose > (schema) > (member) 4>)
:evals
[](<#(resource) files > (method) create > (params) default > (param) purpose > (schema) + (resource) files > (model) file_purpose > (schema) > (member) 5>)
[](<#(resource) files > (method) create > (params) default > (param) purpose > (schema)>)
expires\_after: ExpiresAfter{ anchor, seconds}
The expiration policy for a file. By default, files with `purpose=batch` expire after 30 days and all other files are persisted until they are manually deleted.
anchor: :created\_at
Anchor timestamp after which the expiration policy applies. Supported anchors: `created\_at`.
[](<#(resource) files > (method) create > (params) default > (param) expires_after > (schema) > (property) anchor>)
seconds: Integer
The number of seconds after the anchor time that the file will expire. Must be between 3600 (1 hour) and 2592000 (30 days).
formatint64
minimum3600
maximum2592000
[](<#(resource) files > (method) create > (params) default > (param) expires_after > (schema) > (property) seconds>)
[](<#(resource) files > (method) create > (params) default > (param) expires_after > (schema)>)
##### ReturnsExpand Collapse
class FileObject { id, bytes, created\_at, 6 more }
The `File` object represents a document that has been uploaded to OpenAI.
id: String
The file identifier, which can be referenced in the API endpoints.
[](<#(resource) files > (model) file_object > (schema) > (property) id>)
bytes: Integer
The size of the file, in bytes.
[](<#(resource) files > (model) file_object > (schema) > (property) bytes>)
created\_at: Integer
The Unix timestamp (in seconds) for when the file was created.
formatunixtime
[](<#(resource) files > (model) file_object > (schema) > (property) created_at>)
filename: String
The name of the file.
[](<#(resource) files > (model) file_object > (schema) > (property) filename>)
object: :file
The object type, which is always `file`.
[](<#(resource) files > (model) file_object > (schema) > (property) object>)
purpose: :assistants | :assistants\_output | :batch | 5 more
The intended purpose of the file. Supported values are `assistants`, `assistants\_output`, `batch`, `batch\_output`, `fine-tune`, `fine-tune-results`, `vision`, and `user\_data`.
One of the following:
:assistants
[](<#(resource) files > (model) file_object > (schema) > (property) purpose > (member) 0>)
:assistants\_output
[](<#(resource) files > (model) file_object > (schema) > (property) purpose > (member) 1>)
:batch
[](<#(resource) files > (model) file_object > (schema) > (property) purpose > (member) 2>)
:batch\_output
[](<#(resource) files > (model) file_object > (schema) > (property) purpose > (member) 3>)
:"fine-tune"
[](<#(resource) files > (model) file_object > (schema) > (property) purpose > (member) 4>)
:"fine-tune-results"
[](<#(resource) files > (model) file_object > (schema) > (property) purpose > (member) 5>)
:vision
[](<#(resource) files > (model) file_object > (schema) > (property) purpose > (member) 6>)
:user\_data
[](<#(resource) files > (model) file_object > (schema) > (property) purpose > (member) 7>)
[](<#(resource) files > (model) file_object > (schema) > (property) purpose>)
Deprecatedstatus: :uploaded | :processed | :error
Deprecated. The current status of the file, which can be either `uploaded`, `processed`, or `error`.
One of the following:
:uploaded
[](<#(resource) files > (model) file_object > (schema) > (property) status > (member) 0>)
:processed
[](<#(resource) files > (model) file_object > (schema) > (property) status > (member) 1>)
:error
[](<#(resource) files > (model) file_object > (schema) > (property) status > (member) 2>)
[](<#(resource) files > (model) file_object > (schema) > (property) status>)
expires\_at: Integer
The Unix timestamp (in seconds) for when the file will expire.
formatunixtime
[](<#(resource) files > (model) file_object > (schema) > (property) expires_at>)
Deprecatedstatus\_details: String
Deprecated. For details on why a fine-tuning training file failed validation, see the `error` field on `fine\_tuning.job`.
[](<#(resource) files > (model) file_object > (schema) > (property) status_details>)
[](<#(resource) files > (model) file_object > (schema)>)
### Upload file
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
file\_object = openai.files.create(file: StringIO.new("Example data"), purpose: :assistants)
puts(file\_object)`
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