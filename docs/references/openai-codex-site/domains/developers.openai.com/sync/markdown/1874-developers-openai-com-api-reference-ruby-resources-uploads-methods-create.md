Create upload | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Uploads](/api/reference/ruby/resources/uploads)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create upload
uploads.create(\*\*kwargs) -\> [Upload](</api/reference/ruby/resources/uploads#(resource) uploads > (model) upload > (schema)>) { id, bytes, created\_at, 6 more }
POST/uploads
Creates an intermediate [Upload](https://platform.openai.com/docs/api-reference/uploads/object) object
that you can add [Parts](https://platform.openai.com/docs/api-reference/uploads/part-object) to.
Currently, an Upload can accept at most 8 GB in total and expires after an
hour after you create it.
Once you complete the Upload, we will create a
[File](https://platform.openai.com/docs/api-reference/files/object) object that contains all the parts
you uploaded. This File is usable in the rest of our platform as a regular
File object.
For certain `purpose` values, the correct `mime\_type` must be specified.
Please refer to documentation for the
[supported MIME types for your use case](https://platform.openai.com/docs/assistants/tools/file-search#supported-files).
For guidance on the proper filename extensions for each purpose, please
follow the documentation on [creating a
File](https://platform.openai.com/docs/api-reference/files/create).
Returns the Upload object with status `pending`.
##### ParametersExpand Collapse
bytes: Integer
The number of bytes in the file you are uploading.
[](<#(resource) uploads > (method) create > (params) default > (param) bytes > (schema)>)
filename: String
The name of the file to upload.
[](<#(resource) uploads > (method) create > (params) default > (param) filename > (schema)>)
mime\_type: String
The MIME type of the file.
This must fall within the supported MIME types for your file purpose. See
the supported MIME types for assistants and vision.
[](<#(resource) uploads > (method) create > (params) default > (param) mime_type > (schema)>)
purpose: [FilePurpose](</api/reference/ruby/resources/files#(resource) files > (model) file_purpose > (schema)>)
The intended purpose of the uploaded file.
See the [documentation on File
purposes](https://platform.openai.com/docs/api-reference/files/create#files-create-purpose).
One of the following:
:assistants
[](<#(resource) uploads > (method) create > (params) default > (param) purpose > (schema) + (resource) files > (model) file_purpose > (schema) > (member) 0>)
:batch
[](<#(resource) uploads > (method) create > (params) default > (param) purpose > (schema) + (resource) files > (model) file_purpose > (schema) > (member) 1>)
:"fine-tune"
[](<#(resource) uploads > (method) create > (params) default > (param) purpose > (schema) + (resource) files > (model) file_purpose > (schema) > (member) 2>)
:vision
[](<#(resource) uploads > (method) create > (params) default > (param) purpose > (schema) + (resource) files > (model) file_purpose > (schema) > (member) 3>)
:user\_data
[](<#(resource) uploads > (method) create > (params) default > (param) purpose > (schema) + (resource) files > (model) file_purpose > (schema) > (member) 4>)
:evals
[](<#(resource) uploads > (method) create > (params) default > (param) purpose > (schema) + (resource) files > (model) file_purpose > (schema) > (member) 5>)
[](<#(resource) uploads > (method) create > (params) default > (param) purpose > (schema)>)
expires\_after: ExpiresAfter{ anchor, seconds}
The expiration policy for a file. By default, files with `purpose=batch` expire after 30 days and all other files are persisted until they are manually deleted.
anchor: :created\_at
Anchor timestamp after which the expiration policy applies. Supported anchors: `created\_at`.
[](<#(resource) uploads > (method) create > (params) default > (param) expires_after > (schema) > (property) anchor>)
seconds: Integer
The number of seconds after the anchor time that the file will expire. Must be between 3600 (1 hour) and 2592000 (30 days).
formatint64
minimum3600
maximum2592000
[](<#(resource) uploads > (method) create > (params) default > (param) expires_after > (schema) > (property) seconds>)
[](<#(resource) uploads > (method) create > (params) default > (param) expires_after > (schema)>)
##### ReturnsExpand Collapse
class Upload { id, bytes, created\_at, 6 more }
The Upload object can accept byte chunks in the form of Parts.
id: String
The Upload unique identifier, which can be referenced in API endpoints.
[](<#(resource) uploads > (model) upload > (schema) > (property) id>)
bytes: Integer
The intended number of bytes to be uploaded.
[](<#(resource) uploads > (model) upload > (schema) > (property) bytes>)
created\_at: Integer
The Unix timestamp (in seconds) for when the Upload was created.
formatunixtime
[](<#(resource) uploads > (model) upload > (schema) > (property) created_at>)
expires\_at: Integer
The Unix timestamp (in seconds) for when the Upload will expire.
formatunixtime
[](<#(resource) uploads > (model) upload > (schema) > (property) expires_at>)
filename: String
The name of the file to be uploaded.
[](<#(resource) uploads > (model) upload > (schema) > (property) filename>)
object: :upload
The object type, which is always “upload”.
[](<#(resource) uploads > (model) upload > (schema) > (property) object>)
purpose: String
The intended purpose of the file. [Please refer here](https://platform.openai.com/docs/api-reference/files/object#files/object-purpose) for acceptable values.
[](<#(resource) uploads > (model) upload > (schema) > (property) purpose>)
status: :pending | :completed | :cancelled | :expired
The status of the Upload.
One of the following:
:pending
[](<#(resource) uploads > (model) upload > (schema) > (property) status > (member) 0>)
:completed
[](<#(resource) uploads > (model) upload > (schema) > (property) status > (member) 1>)
:cancelled
[](<#(resource) uploads > (model) upload > (schema) > (property) status > (member) 2>)
:expired
[](<#(resource) uploads > (model) upload > (schema) > (property) status > (member) 3>)
[](<#(resource) uploads > (model) upload > (schema) > (property) status>)
file: [FileObject](</api/reference/ruby/resources/files#(resource) files > (model) file_object > (schema)>) { id, bytes, created\_at, 6 more }
The `File` object represents a document that has been uploaded to OpenAI.
id: String
The file identifier, which can be referenced in the API endpoints.
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) id>)
bytes: Integer
The size of the file, in bytes.
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) bytes>)
created\_at: Integer
The Unix timestamp (in seconds) for when the file was created.
formatunixtime
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) created_at>)
filename: String
The name of the file.
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) filename>)
object: :file
The object type, which is always `file`.
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) object>)
purpose: :assistants | :assistants\_output | :batch | 5 more
The intended purpose of the file. Supported values are `assistants`, `assistants\_output`, `batch`, `batch\_output`, `fine-tune`, `fine-tune-results`, `vision`, and `user\_data`.
One of the following:
:assistants
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) purpose > (member) 0>)
:assistants\_output
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) purpose > (member) 1>)
:batch
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) purpose > (member) 2>)
:batch\_output
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) purpose > (member) 3>)
:"fine-tune"
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) purpose > (member) 4>)
:"fine-tune-results"
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) purpose > (member) 5>)
:vision
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) purpose > (member) 6>)
:user\_data
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) purpose > (member) 7>)
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) purpose>)
Deprecatedstatus: :uploaded | :processed | :error
Deprecated. The current status of the file, which can be either `uploaded`, `processed`, or `error`.
One of the following:
:uploaded
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) status > (member) 0>)
:processed
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) status > (member) 1>)
:error
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) status > (member) 2>)
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) status>)
expires\_at: Integer
The Unix timestamp (in seconds) for when the file will expire.
formatunixtime
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) expires_at>)
Deprecatedstatus\_details: String
Deprecated. For details on why a fine-tuning training file failed validation, see the `error` field on `fine\_tuning.job`.
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) status_details>)
[](<#(resource) uploads > (model) upload > (schema) > (property) file>)
[](<#(resource) uploads > (model) upload > (schema)>)
### Create upload
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
upload = openai.uploads.create(bytes: 0, filename: "filename", mime\_type: "mime\_type", purpose: :assistants)
puts(upload)`
```
```
`{
"id": "upload\_abc123",
"object": "upload",
"bytes": 2147483648,
"created\_at": 1719184911,
"filename": "training\_examples.jsonl",
"purpose": "fine-tune",
"status": "pending",
"expires\_at": 1719127296
}
`
```
##### Returns Examples
```
`{
"id": "upload\_abc123",
"object": "upload",
"bytes": 2147483648,
"created\_at": 1719184911,
"filename": "training\_examples.jsonl",
"purpose": "fine-tune",
"status": "pending",
"expires\_at": 1719127296
}
`
```