Uploads | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/terraform)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Uploads
Use Uploads to upload large files in multiple parts.
#### resource openai\_upload
##### required Expand Collapse
bytes: Int64
The number of bytes in the file you are uploading.
[](<#(resource) uploads > (terraform resource) > (attribute) bytes>)
filename: String
The name of the file to upload.
[](<#(resource) uploads > (terraform resource) > (attribute) filename>)
mime\_type: String
The MIME type of the file.
This must fall within the supported MIME types for your file purpose. See
the supported MIME types for assistants and vision.
[](<#(resource) uploads > (terraform resource) > (attribute) mime_type>)
purpose: String
The intended purpose of the uploaded file.
See the [documentation on File
purposes](https://platform.openai.com/docs/api-reference/files/create#files-create-purpose).
[](<#(resource) uploads > (terraform resource) > (attribute) purpose>)
##### optional Expand Collapse
expires\_after?: Attributes
The expiration policy for a file. By default, files with `purpose=batch` expire after 30 days and all other files are persisted until they are manually deleted.
anchor: String
Anchor timestamp after which the expiration policy applies. Supported anchors: `created\_at`.
[](<#(resource) uploads > (terraform resource) > (attribute) expires_after > (attribute) anchor>)
seconds: Int64
The number of seconds after the anchor time that the file will expire. Must be between 3600 (1 hour) and 2592000 (30 days).
[](<#(resource) uploads > (terraform resource) > (attribute) expires_after > (attribute) seconds>)
[](<#(resource) uploads > (terraform resource) > (attribute) expires_after>)
##### computed Expand Collapse
id: String
The Upload unique identifier, which can be referenced in API endpoints.
[](<#(resource) uploads > (terraform resource) > (attribute) id>)
created\_at: Int64
The Unix timestamp (in seconds) for when the Upload was created.
[](<#(resource) uploads > (terraform resource) > (attribute) created_at>)
expires\_at: Int64
The Unix timestamp (in seconds) for when the Upload will expire.
[](<#(resource) uploads > (terraform resource) > (attribute) expires_at>)
object: String
The object type, which is always “upload”.
[](<#(resource) uploads > (terraform resource) > (attribute) object>)
status: String
The status of the Upload.
[](<#(resource) uploads > (terraform resource) > (attribute) status>)
file: Attributes
The `File` object represents a document that has been uploaded to OpenAI.
id: String
The file identifier, which can be referenced in the API endpoints.
[](<#(resource) uploads > (terraform resource) > (attribute) file > (attribute) id>)
bytes: Int64
The size of the file, in bytes.
[](<#(resource) uploads > (terraform resource) > (attribute) file > (attribute) bytes>)
created\_at: Int64
The Unix timestamp (in seconds) for when the file was created.
[](<#(resource) uploads > (terraform resource) > (attribute) file > (attribute) created_at>)
filename: String
The name of the file.
[](<#(resource) uploads > (terraform resource) > (attribute) file > (attribute) filename>)
object: String
The object type, which is always `file`.
[](<#(resource) uploads > (terraform resource) > (attribute) file > (attribute) object>)
purpose: String
The intended purpose of the file. Supported values are `assistants`, `assistants\_output`, `batch`, `batch\_output`, `fine-tune`, `fine-tune-results`, `vision`, and `user\_data`.
[](<#(resource) uploads > (terraform resource) > (attribute) file > (attribute) purpose>)
Deprecatedstatus: String
Deprecated. The current status of the file, which can be either `uploaded`, `processed`, or `error`.
[](<#(resource) uploads > (terraform resource) > (attribute) file > (attribute) status>)
expires\_at: Int64
The Unix timestamp (in seconds) for when the file will expire.
[](<#(resource) uploads > (terraform resource) > (attribute) file > (attribute) expires_at>)
Deprecatedstatus\_details: String
Deprecated. For details on why a fine-tuning training file failed validation, see the `error` field on `fine\_tuning.job`.
[](<#(resource) uploads > (terraform resource) > (attribute) file > (attribute) status_details>)
[](<#(resource) uploads > (terraform resource) > (attribute) file>)
### openai\_upload
Terraform
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
`resource "openai\_upload" "example\_upload" {
bytes = 0
filename = "filename"
mime\_type = "mime\_type"
purpose = "assistants"
expires\_after = {
anchor = "created\_at"
seconds = 3600
}
}
`
```
#### UploadsParts
Use Uploads to upload large files in multiple parts.
#### resource openai\_upload\_part
##### required Expand Collapse
upload\_id: String
[](<#(resource) uploads.parts > (terraform resource) > (attribute) upload_id>)
data: String
The chunk of bytes for this Part.
[](<#(resource) uploads.parts > (terraform resource) > (attribute) data>)
##### computed Expand Collapse
id: String
The upload Part unique identifier, which can be referenced in API endpoints.
[](<#(resource) uploads.parts > (terraform resource) > (attribute) id>)
created\_at: Int64
The Unix timestamp (in seconds) for when the Part was created.
[](<#(resource) uploads.parts > (terraform resource) > (attribute) created_at>)
object: String
The object type, which is always `upload.part`.
[](<#(resource) uploads.parts > (terraform resource) > (attribute) object>)
### openai\_upload\_part
Terraform
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
`resource "openai\_upload\_part" "example\_upload\_part" {
upload\_id = "upload\_abc123"
data = "Example data"
}
`
```