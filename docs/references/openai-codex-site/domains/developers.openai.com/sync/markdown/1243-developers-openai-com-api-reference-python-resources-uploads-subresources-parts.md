Parts | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Uploads](/api/reference/python/resources/uploads)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Parts
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