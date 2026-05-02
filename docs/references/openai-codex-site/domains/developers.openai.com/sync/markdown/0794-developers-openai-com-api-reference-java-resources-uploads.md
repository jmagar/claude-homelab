Uploads | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Uploads
Use Uploads to upload large files in multiple parts.
##### [Create upload](/api/reference/java/resources/uploads/methods/create)
[Upload](</api/reference/java/resources/uploads#(resource) uploads > (model) upload > (schema)>) uploads().create(UploadCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/uploads
##### [Complete upload](/api/reference/java/resources/uploads/methods/complete)
[Upload](</api/reference/java/resources/uploads#(resource) uploads > (model) upload > (schema)>) uploads().complete(UploadCompleteParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/uploads/{upload\_id}/complete
##### [Cancel upload](/api/reference/java/resources/uploads/methods/cancel)
[Upload](</api/reference/java/resources/uploads#(resource) uploads > (model) upload > (schema)>) uploads().cancel(UploadCancelParamsparams = UploadCancelParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
POST/uploads/{upload\_id}/cancel
##### ModelsExpand Collapse
class Upload:
The Upload object can accept byte chunks in the form of Parts.
String id
The Upload unique identifier, which can be referenced in API endpoints.
[](<#(resource) uploads > (model) upload > (schema) > (property) id>)
long bytes
The intended number of bytes to be uploaded.
[](<#(resource) uploads > (model) upload > (schema) > (property) bytes>)
long createdAt
The Unix timestamp (in seconds) for when the Upload was created.
formatunixtime
[](<#(resource) uploads > (model) upload > (schema) > (property) created_at>)
long expiresAt
The Unix timestamp (in seconds) for when the Upload will expire.
formatunixtime
[](<#(resource) uploads > (model) upload > (schema) > (property) expires_at>)
String filename
The name of the file to be uploaded.
[](<#(resource) uploads > (model) upload > (schema) > (property) filename>)
JsonValue; object\_ "upload"constant"upload"constant
The object type, which is always “upload”.
[](<#(resource) uploads > (model) upload > (schema) > (property) object>)
String purpose
The intended purpose of the file. [Please refer here](https://platform.openai.com/docs/api-reference/files/object#files/object-purpose) for acceptable values.
[](<#(resource) uploads > (model) upload > (schema) > (property) purpose>)
Status status
The status of the Upload.
One of the following:
PENDING("pending")
[](<#(resource) uploads > (model) upload > (schema) > (property) status > (member) 0>)
COMPLETED("completed")
[](<#(resource) uploads > (model) upload > (schema) > (property) status > (member) 1>)
CANCELLED("cancelled")
[](<#(resource) uploads > (model) upload > (schema) > (property) status > (member) 2>)
EXPIRED("expired")
[](<#(resource) uploads > (model) upload > (schema) > (property) status > (member) 3>)
[](<#(resource) uploads > (model) upload > (schema) > (property) status>)
Optional\<[FileObject](</api/reference/java/resources/files#(resource) files > (model) file_object > (schema)>)\> file
The `File` object represents a document that has been uploaded to OpenAI.
[](<#(resource) uploads > (model) upload > (schema) > (property) file>)
[](<#(resource) uploads > (model) upload > (schema)>)
#### UploadsParts
Use Uploads to upload large files in multiple parts.
##### [Add upload part](/api/reference/java/resources/uploads/subresources/parts/methods/create)
[UploadPart](</api/reference/java/resources/uploads#(resource) uploads.parts > (model) upload_part > (schema)>) uploads().parts().create(PartCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/uploads/{upload\_id}/parts
##### ModelsExpand Collapse
class UploadPart:
The upload Part represents a chunk of bytes we can add to an Upload object.
String id
The upload Part unique identifier, which can be referenced in API endpoints.
[](<#(resource) uploads.parts > (model) upload_part > (schema) > (property) id>)
long createdAt
The Unix timestamp (in seconds) for when the Part was created.
formatunixtime
[](<#(resource) uploads.parts > (model) upload_part > (schema) > (property) created_at>)
JsonValue; object\_ "upload.part"constant"upload.part"constant
The object type, which is always `upload.part`.
[](<#(resource) uploads.parts > (model) upload_part > (schema) > (property) object>)
String uploadId
The ID of the Upload object that this Part was added to.
[](<#(resource) uploads.parts > (model) upload_part > (schema) > (property) upload_id>)
[](<#(resource) uploads.parts > (model) upload_part > (schema)>)