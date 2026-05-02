Uploads | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Uploads
Use Uploads to upload large files in multiple parts.
##### [Create upload](/api/reference/python/resources/uploads/methods/create)
uploads.create(UploadCreateParams\*\*kwargs) -\> [Upload](</api/reference/python/resources/uploads#(resource) uploads > (model) upload > (schema)>)
POST/uploads
##### [Complete upload](/api/reference/python/resources/uploads/methods/complete)
uploads.complete(strupload\_id, UploadCompleteParams\*\*kwargs) -\> [Upload](</api/reference/python/resources/uploads#(resource) uploads > (model) upload > (schema)>)
POST/uploads/{upload\_id}/complete
##### [Cancel upload](/api/reference/python/resources/uploads/methods/cancel)
uploads.cancel(strupload\_id) -\> [Upload](</api/reference/python/resources/uploads#(resource) uploads > (model) upload > (schema)>)
POST/uploads/{upload\_id}/cancel
##### ModelsExpand Collapse
class Upload: …
The Upload object can accept byte chunks in the form of Parts.
id: str
The Upload unique identifier, which can be referenced in API endpoints.
[](<#(resource) uploads > (model) upload > (schema) > (property) id>)
bytes: int
The intended number of bytes to be uploaded.
[](<#(resource) uploads > (model) upload > (schema) > (property) bytes>)
created\_at: int
The Unix timestamp (in seconds) for when the Upload was created.
formatunixtime
[](<#(resource) uploads > (model) upload > (schema) > (property) created_at>)
expires\_at: int
The Unix timestamp (in seconds) for when the Upload will expire.
formatunixtime
[](<#(resource) uploads > (model) upload > (schema) > (property) expires_at>)
filename: str
The name of the file to be uploaded.
[](<#(resource) uploads > (model) upload > (schema) > (property) filename>)
object: Literal["upload"]
The object type, which is always “upload”.
[](<#(resource) uploads > (model) upload > (schema) > (property) object>)
purpose: str
The intended purpose of the file. [Please refer here](https://platform.openai.com/docs/api-reference/files/object#files/object-purpose) for acceptable values.
[](<#(resource) uploads > (model) upload > (schema) > (property) purpose>)
status: Literal["pending", "completed", "cancelled", "expired"]
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
file: Optional[FileObject]
The `File` object represents a document that has been uploaded to OpenAI.
[](<#(resource) uploads > (model) upload > (schema) > (property) file>)
[](<#(resource) uploads > (model) upload > (schema)>)
#### UploadsParts
Use Uploads to upload large files in multiple parts.
##### [Add upload part](/api/reference/python/resources/uploads/subresources/parts/methods/create)
uploads.parts.create(strupload\_id, PartCreateParams\*\*kwargs) -\> [UploadPart](</api/reference/python/resources/uploads#(resource) uploads.parts > (model) upload_part > (schema)>)
POST/uploads/{upload\_id}/parts
##### ModelsExpand Collapse
class UploadPart: …
The upload Part represents a chunk of bytes we can add to an Upload object.
id: str
The upload Part unique identifier, which can be referenced in API endpoints.
[](<#(resource) uploads.parts > (model) upload_part > (schema) > (property) id>)
created\_at: int
The Unix timestamp (in seconds) for when the Part was created.
formatunixtime
[](<#(resource) uploads.parts > (model) upload_part > (schema) > (property) created_at>)
object: Literal["upload.part"]
The object type, which is always `upload.part`.
[](<#(resource) uploads.parts > (model) upload_part > (schema) > (property) object>)
upload\_id: str
The ID of the Upload object that this Part was added to.
[](<#(resource) uploads.parts > (model) upload_part > (schema) > (property) upload_id>)
[](<#(resource) uploads.parts > (model) upload_part > (schema)>)