Create upload | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Uploads](/api/reference/go/resources/uploads)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create upload
client.Uploads.New(ctx, body) (\*[Upload](</api/reference/go/resources/uploads#(resource) uploads > (model) upload > (schema)>), error)
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
body UploadNewParams
Bytes param.Field[int64]
The number of bytes in the file you are uploading.
[](<#(resource) uploads > (method) create > (params) default > (param) bytes>)
Filename param.Field[string]
The name of the file to upload.
[](<#(resource) uploads > (method) create > (params) default > (param) filename>)
MimeType param.Field[string]
The MIME type of the file.
This must fall within the supported MIME types for your file purpose. See
the supported MIME types for assistants and vision.
[](<#(resource) uploads > (method) create > (params) default > (param) mime_type>)
Purpose param.Field[[FilePurpose](</api/reference/go/resources/files#(resource) files > (model) file_purpose > (schema)>)]
The intended purpose of the uploaded file.
See the [documentation on File
purposes](https://platform.openai.com/docs/api-reference/files/create#files-create-purpose).
[](<#(resource) uploads > (method) create > (params) default > (param) purpose>)
ExpiresAfter param.Field[[UploadNewParamsExpiresAfter](</api/reference/go/resources/uploads/methods/create#(resource) uploads > (method) create > (params) default > (param) expires_after > (schema)>)]Optional
The expiration policy for a file. By default, files with `purpose=batch` expire after 30 days and all other files are persisted until they are manually deleted.
Anchor CreatedAt
Anchor timestamp after which the expiration policy applies. Supported anchors: `created\_at`.
[](<#(resource) uploads > (method) create > (params) default > (param) expires_after > (schema) > (property) anchor>)
Seconds int64
The number of seconds after the anchor time that the file will expire. Must be between 3600 (1 hour) and 2592000 (30 days).
formatint64
minimum3600
maximum2592000
[](<#(resource) uploads > (method) create > (params) default > (param) expires_after > (schema) > (property) seconds>)
[](<#(resource) uploads > (method) create > (params) default > (param) expires_after>)
[](<#(resource) uploads > (method) create > (params) default>)
##### ReturnsExpand Collapse
type Upload struct{…}
The Upload object can accept byte chunks in the form of Parts.
ID string
The Upload unique identifier, which can be referenced in API endpoints.
[](<#(resource) uploads > (model) upload > (schema) > (property) id>)
Bytes int64
The intended number of bytes to be uploaded.
[](<#(resource) uploads > (model) upload > (schema) > (property) bytes>)
CreatedAt int64
The Unix timestamp (in seconds) for when the Upload was created.
formatunixtime
[](<#(resource) uploads > (model) upload > (schema) > (property) created_at>)
ExpiresAt int64
The Unix timestamp (in seconds) for when the Upload will expire.
formatunixtime
[](<#(resource) uploads > (model) upload > (schema) > (property) expires_at>)
Filename string
The name of the file to be uploaded.
[](<#(resource) uploads > (model) upload > (schema) > (property) filename>)
Object Upload
The object type, which is always “upload”.
[](<#(resource) uploads > (model) upload > (schema) > (property) object>)
Purpose string
The intended purpose of the file. [Please refer here](https://platform.openai.com/docs/api-reference/files/object#files/object-purpose) for acceptable values.
[](<#(resource) uploads > (model) upload > (schema) > (property) purpose>)
Status UploadStatus
The status of the Upload.
One of the following:
const UploadStatusPending UploadStatus = "pending"
[](<#(resource) uploads > (model) upload > (schema) > (property) status > (member) 0>)
const UploadStatusCompleted UploadStatus = "completed"
[](<#(resource) uploads > (model) upload > (schema) > (property) status > (member) 1>)
const UploadStatusCancelled UploadStatus = "cancelled"
[](<#(resource) uploads > (model) upload > (schema) > (property) status > (member) 2>)
const UploadStatusExpired UploadStatus = "expired"
[](<#(resource) uploads > (model) upload > (schema) > (property) status > (member) 3>)
[](<#(resource) uploads > (model) upload > (schema) > (property) status>)
File [FileObject](</api/reference/go/resources/files#(resource) files > (model) file_object > (schema)>)Optional
The `File` object represents a document that has been uploaded to OpenAI.
ID string
The file identifier, which can be referenced in the API endpoints.
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) id>)
Bytes int64
The size of the file, in bytes.
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) bytes>)
CreatedAt int64
The Unix timestamp (in seconds) for when the file was created.
formatunixtime
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) created_at>)
Filename string
The name of the file.
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) filename>)
Object File
The object type, which is always `file`.
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) object>)
Purpose FileObjectPurpose
The intended purpose of the file. Supported values are `assistants`, `assistants\_output`, `batch`, `batch\_output`, `fine-tune`, `fine-tune-results`, `vision`, and `user\_data`.
One of the following:
const FileObjectPurposeAssistants FileObjectPurpose = "assistants"
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) purpose > (member) 0>)
const FileObjectPurposeAssistantsOutput FileObjectPurpose = "assistants\_output"
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) purpose > (member) 1>)
const FileObjectPurposeBatch FileObjectPurpose = "batch"
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) purpose > (member) 2>)
const FileObjectPurposeBatchOutput FileObjectPurpose = "batch\_output"
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) purpose > (member) 3>)
const FileObjectPurposeFineTune FileObjectPurpose = "fine-tune"
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) purpose > (member) 4>)
const FileObjectPurposeFineTuneResults FileObjectPurpose = "fine-tune-results"
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) purpose > (member) 5>)
const FileObjectPurposeVision FileObjectPurpose = "vision"
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) purpose > (member) 6>)
const FileObjectPurposeUserData FileObjectPurpose = "user\_data"
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) purpose > (member) 7>)
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) purpose>)
DeprecatedStatus FileObjectStatus
Deprecated. The current status of the file, which can be either `uploaded`, `processed`, or `error`.
One of the following:
const FileObjectStatusUploaded FileObjectStatus = "uploaded"
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) status > (member) 0>)
const FileObjectStatusProcessed FileObjectStatus = "processed"
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) status > (member) 1>)
const FileObjectStatusError FileObjectStatus = "error"
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) status > (member) 2>)
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) status>)
ExpiresAt int64Optional
The Unix timestamp (in seconds) for when the file will expire.
formatunixtime
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) expires_at>)
DeprecatedStatusDetails stringOptional
Deprecated. For details on why a fine-tuning training file failed validation, see the `error` field on `fine\_tuning.job`.
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) status_details>)
[](<#(resource) uploads > (model) upload > (schema) > (property) file>)
[](<#(resource) uploads > (model) upload > (schema)>)
### Create upload
Go
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
`package main
import (
"context"
"fmt"
"github.com/openai/openai-go"
"github.com/openai/openai-go/option"
)
func main() {
client := openai.NewClient(
option.WithAPIKey("My API Key"),
)
upload, err := client.Uploads.New(context.TODO(), openai.UploadNewParams{
Bytes: 0,
Filename: "filename",
MimeType: "mime\_type",
Purpose: openai.FilePurposeAssistants,
})
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", upload.ID)
}
`
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