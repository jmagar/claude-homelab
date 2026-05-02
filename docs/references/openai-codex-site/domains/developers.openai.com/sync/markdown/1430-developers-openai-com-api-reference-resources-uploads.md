Uploads | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Uploads
Use Uploads to upload large files in multiple parts.
##### [Create upload](/api/reference/resources/uploads/methods/create)
POST/uploads
##### [Complete upload](/api/reference/resources/uploads/methods/complete)
POST/uploads/{upload\_id}/complete
##### [Cancel upload](/api/reference/resources/uploads/methods/cancel)
POST/uploads/{upload\_id}/cancel
##### ModelsExpand Collapse
Upload object { id, bytes, created\_at, 6 more }
The Upload object can accept byte chunks in the form of Parts.
id: string
The Upload unique identifier, which can be referenced in API endpoints.
[](<#(resource) uploads > (model) upload > (schema) > (property) id>)
bytes: number
The intended number of bytes to be uploaded.
[](<#(resource) uploads > (model) upload > (schema) > (property) bytes>)
created\_at: number
The Unix timestamp (in seconds) for when the Upload was created.
formatunixtime
[](<#(resource) uploads > (model) upload > (schema) > (property) created_at>)
expires\_at: number
The Unix timestamp (in seconds) for when the Upload will expire.
formatunixtime
[](<#(resource) uploads > (model) upload > (schema) > (property) expires_at>)
filename: string
The name of the file to be uploaded.
[](<#(resource) uploads > (model) upload > (schema) > (property) filename>)
purpose: string
The intended purpose of the file. [Please refer here](/docs/api-reference/files/object#files/object-purpose) for acceptable values.
[](<#(resource) uploads > (model) upload > (schema) > (property) purpose>)
status: "pending" or "completed" or "cancelled" or "expired"
The status of the Upload.
One of the following:
"pending"
[](<#(resource) uploads > (model) upload > (schema) > (property) status > (member) 0>)
"completed"
[](<#(resource) uploads > (model) upload > (schema) > (property) status > (member) 1>)
"cancelled"
[](<#(resource) uploads > (model) upload > (schema) > (property) status > (member) 2>)
"expired"
[](<#(resource) uploads > (model) upload > (schema) > (property) status > (member) 3>)
[](<#(resource) uploads > (model) upload > (schema) > (property) status>)
file: optional [FileObject](</api/reference/resources/files#(resource) files > (model) file_object > (schema)>) { id, bytes, created\_at, 6 more }
The `File` object represents a document that has been uploaded to OpenAI.
[](<#(resource) uploads > (model) upload > (schema) > (property) file>)
object: optional "upload"
The object type, which is always “upload”.
[](<#(resource) uploads > (model) upload > (schema) > (property) object>)
[](<#(resource) uploads > (model) upload > (schema)>)
#### UploadsParts
Use Uploads to upload large files in multiple parts.
##### [Add upload part](/api/reference/resources/uploads/subresources/parts/methods/create)
POST/uploads/{upload\_id}/parts
##### ModelsExpand Collapse
UploadPart object { id, created\_at, object, upload\_id }
The upload Part represents a chunk of bytes we can add to an Upload object.
id: string
The upload Part unique identifier, which can be referenced in API endpoints.
[](<#(resource) uploads.parts > (model) upload_part > (schema) > (property) id>)
created\_at: number
The Unix timestamp (in seconds) for when the Part was created.
formatunixtime
[](<#(resource) uploads.parts > (model) upload_part > (schema) > (property) created_at>)
object: "upload.part"
The object type, which is always `upload.part`.
[](<#(resource) uploads.parts > (model) upload_part > (schema) > (property) object>)
upload\_id: string
The ID of the Upload object that this Part was added to.
[](<#(resource) uploads.parts > (model) upload_part > (schema) > (property) upload_id>)
[](<#(resource) uploads.parts > (model) upload_part > (schema)>)