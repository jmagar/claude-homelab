Uploads | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Uploads
Use Uploads to upload large files in multiple parts.
##### [Create upload](/api/reference/go/resources/uploads/methods/create)
client.Uploads.New(ctx, body) (\*[Upload](</api/reference/go/resources/uploads#(resource) uploads > (model) upload > (schema)>), error)
POST/uploads
##### [Complete upload](/api/reference/go/resources/uploads/methods/complete)
client.Uploads.Complete(ctx, uploadID, body) (\*[Upload](</api/reference/go/resources/uploads#(resource) uploads > (model) upload > (schema)>), error)
POST/uploads/{upload\_id}/complete
##### [Cancel upload](/api/reference/go/resources/uploads/methods/cancel)
client.Uploads.Cancel(ctx, uploadID) (\*[Upload](</api/reference/go/resources/uploads#(resource) uploads > (model) upload > (schema)>), error)
POST/uploads/{upload\_id}/cancel
##### ModelsExpand Collapse
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
[](<#(resource) uploads > (model) upload > (schema) > (property) file>)
[](<#(resource) uploads > (model) upload > (schema)>)
#### UploadsParts
Use Uploads to upload large files in multiple parts.
##### [Add upload part](/api/reference/go/resources/uploads/subresources/parts/methods/create)
client.Uploads.Parts.New(ctx, uploadID, body) (\*[UploadPart](</api/reference/go/resources/uploads#(resource) uploads.parts > (model) upload_part > (schema)>), error)
POST/uploads/{upload\_id}/parts
##### ModelsExpand Collapse
type UploadPart struct{…}
The upload Part represents a chunk of bytes we can add to an Upload object.
ID string
The upload Part unique identifier, which can be referenced in API endpoints.
[](<#(resource) uploads.parts > (model) upload_part > (schema) > (property) id>)
CreatedAt int64
The Unix timestamp (in seconds) for when the Part was created.
formatunixtime
[](<#(resource) uploads.parts > (model) upload_part > (schema) > (property) created_at>)
Object UploadPart
The object type, which is always `upload.part`.
[](<#(resource) uploads.parts > (model) upload_part > (schema) > (property) object>)
UploadID string
The ID of the Upload object that this Part was added to.
[](<#(resource) uploads.parts > (model) upload_part > (schema) > (property) upload_id>)
[](<#(resource) uploads.parts > (model) upload_part > (schema)>)