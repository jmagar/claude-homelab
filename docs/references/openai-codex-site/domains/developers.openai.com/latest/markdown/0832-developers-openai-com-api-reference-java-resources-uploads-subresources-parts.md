Parts | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Uploads](/api/reference/java/resources/uploads)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Parts
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