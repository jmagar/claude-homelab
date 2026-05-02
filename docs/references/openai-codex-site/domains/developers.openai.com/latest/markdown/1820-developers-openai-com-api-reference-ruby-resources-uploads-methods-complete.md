Complete upload | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Uploads](/api/reference/ruby/resources/uploads)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Complete upload
uploads.complete(upload\_id, \*\*kwargs) -\> [Upload](</api/reference/ruby/resources/uploads#(resource) uploads > (model) upload > (schema)>) { id, bytes, created\_at, 6 more }
POST/uploads/{upload\_id}/complete
Completes the [Upload](https://platform.openai.com/docs/api-reference/uploads/object).
Within the returned Upload object, there is a nested [File](https://platform.openai.com/docs/api-reference/files/object) object that is ready to use in the rest of the platform.
You can specify the order of the Parts by passing in an ordered list of the Part IDs.
The number of bytes uploaded upon completion must match the number of bytes initially specified when creating the Upload object. No Parts may be added after an Upload is completed.
Returns the Upload object with status `completed`, including an additional `file` property containing the created usable File object.
##### ParametersExpand Collapse
upload\_id: String
[](<#(resource) uploads > (method) complete > (params) default > (param) upload_id > (schema)>)
part\_ids: Array[String]
The ordered list of Part IDs.
[](<#(resource) uploads > (method) complete > (params) default > (param) part_ids > (schema)>)
md5: String
The optional md5 checksum for the file contents to verify if the bytes uploaded matches what you expect.
[](<#(resource) uploads > (method) complete > (params) default > (param) md5 > (schema)>)
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
### Complete upload
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
upload = openai.uploads.complete("upload\_abc123", part\_ids: ["string"])
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
"status": "completed",
"expires\_at": 1719127296,
"file": {
"id": "file-xyz321",
"object": "file",
"bytes": 2147483648,
"created\_at": 1719186911,
"expires\_at": 1719127296,
"filename": "training\_examples.jsonl",
"purpose": "fine-tune",
}
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
"status": "completed",
"expires\_at": 1719127296,
"file": {
"id": "file-xyz321",
"object": "file",
"bytes": 2147483648,
"created\_at": 1719186911,
"expires\_at": 1719127296,
"filename": "training\_examples.jsonl",
"purpose": "fine-tune",
}
}
`
```