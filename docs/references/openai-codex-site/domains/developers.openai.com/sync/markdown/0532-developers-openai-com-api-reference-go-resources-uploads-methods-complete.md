Complete upload | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Uploads](/api/reference/go/resources/uploads)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Complete upload
client.Uploads.Complete(ctx, uploadID, body) (\*[Upload](</api/reference/go/resources/uploads#(resource) uploads > (model) upload > (schema)>), error)
POST/uploads/{upload\_id}/complete
Completes the [Upload](https://platform.openai.com/docs/api-reference/uploads/object).
Within the returned Upload object, there is a nested [File](https://platform.openai.com/docs/api-reference/files/object) object that is ready to use in the rest of the platform.
You can specify the order of the Parts by passing in an ordered list of the Part IDs.
The number of bytes uploaded upon completion must match the number of bytes initially specified when creating the Upload object. No Parts may be added after an Upload is completed.
Returns the Upload object with status `completed`, including an additional `file` property containing the created usable File object.
##### ParametersExpand Collapse
uploadID string
[](<#(resource) uploads > (method) complete > (params) default > (param) upload_id > (schema)>)
body UploadCompleteParams
PartIDs param.Field[[]string]
The ordered list of Part IDs.
[](<#(resource) uploads > (method) complete > (params) default > (param) part_ids>)
Md5 param.Field[string]Optional
The optional md5 checksum for the file contents to verify if the bytes uploaded matches what you expect.
[](<#(resource) uploads > (method) complete > (params) default > (param) md5>)
[](<#(resource) uploads > (method) complete > (params) default>)
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
### Complete upload
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
upload, err := client.Uploads.Complete(
context.TODO(),
"upload\_abc123",
openai.UploadCompleteParams{
PartIDs: []string{"string"},
},
)
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