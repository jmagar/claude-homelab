Add upload part | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Uploads](/api/reference/ruby/resources/uploads)
[Parts](/api/reference/ruby/resources/uploads/subresources/parts)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Add upload part
uploads.parts.create(upload\_id, \*\*kwargs) -\> [UploadPart](</api/reference/ruby/resources/uploads#(resource) uploads.parts > (model) upload_part > (schema)>) { id, created\_at, object, upload\_id }
POST/uploads/{upload\_id}/parts
Adds a [Part](https://platform.openai.com/docs/api-reference/uploads/part-object) to an [Upload](https://platform.openai.com/docs/api-reference/uploads/object) object. A Part represents a chunk of bytes from the file you are trying to upload.
Each Part can be at most 64 MB, and you can add Parts until you hit the Upload maximum of 8 GB.
It is possible to add multiple Parts in parallel. You can decide the intended order of the Parts when you [complete the Upload](https://platform.openai.com/docs/api-reference/uploads/complete).
##### ParametersExpand Collapse
upload\_id: String
[](<#(resource) uploads.parts > (method) create > (params) default > (param) upload_id > (schema)>)
data: FileInput
The chunk of bytes for this Part.
[](<#(resource) uploads.parts > (method) create > (params) default > (param) data > (schema)>)
##### ReturnsExpand Collapse
class UploadPart { id, created\_at, object, upload\_id }
The upload Part represents a chunk of bytes we can add to an Upload object.
id: String
The upload Part unique identifier, which can be referenced in API endpoints.
[](<#(resource) uploads.parts > (model) upload_part > (schema) > (property) id>)
created\_at: Integer
The Unix timestamp (in seconds) for when the Part was created.
formatunixtime
[](<#(resource) uploads.parts > (model) upload_part > (schema) > (property) created_at>)
object: :"upload.part"
The object type, which is always `upload.part`.
[](<#(resource) uploads.parts > (model) upload_part > (schema) > (property) object>)
upload\_id: String
The ID of the Upload object that this Part was added to.
[](<#(resource) uploads.parts > (model) upload_part > (schema) > (property) upload_id>)
[](<#(resource) uploads.parts > (model) upload_part > (schema)>)
### Add upload part
Ruby
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
`require "openai"
openai = OpenAI::Client.new(api\_key: "My API Key")
upload\_part = openai.uploads.parts.create("upload\_abc123", data: StringIO.new("Example data"))
puts(upload\_part)`
```
```
`{
"id": "part\_def456",
"object": "upload.part",
"created\_at": 1719185911,
"upload\_id": "upload\_abc123"
}
`
```
##### Returns Examples
```
`{
"id": "part\_def456",
"object": "upload.part",
"created\_at": 1719185911,
"upload\_id": "upload\_abc123"
}
`
```