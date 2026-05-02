Parts | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Uploads](/api/reference/go/resources/uploads)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Parts
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