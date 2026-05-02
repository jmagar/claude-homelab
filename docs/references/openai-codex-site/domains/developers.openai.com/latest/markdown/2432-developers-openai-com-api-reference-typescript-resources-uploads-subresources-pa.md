Parts | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Uploads](/api/reference/typescript/resources/uploads)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Parts
Use Uploads to upload large files in multiple parts.
##### [Add upload part](/api/reference/typescript/resources/uploads/subresources/parts/methods/create)
client.uploads.parts.create(stringuploadID, PartCreateParams { data } body, RequestOptionsoptions?): [UploadPart](</api/reference/typescript/resources/uploads#(resource) uploads.parts > (model) upload_part > (schema)>) { id, created\_at, object, upload\_id }
POST/uploads/{upload\_id}/parts
##### ModelsExpand Collapse
UploadPart { id, created\_at, object, upload\_id }
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