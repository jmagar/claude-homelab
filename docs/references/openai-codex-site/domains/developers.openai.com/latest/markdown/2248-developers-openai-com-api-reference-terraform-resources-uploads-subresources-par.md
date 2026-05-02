Parts | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/terraform)
[Uploads](/api/reference/terraform/resources/uploads)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Parts
Use Uploads to upload large files in multiple parts.
#### resource openai\_upload\_part
##### required Expand Collapse
upload\_id: String
[](<#(resource) uploads.parts > (terraform resource) > (attribute) upload_id>)
data: String
The chunk of bytes for this Part.
[](<#(resource) uploads.parts > (terraform resource) > (attribute) data>)
##### computed Expand Collapse
id: String
The upload Part unique identifier, which can be referenced in API endpoints.
[](<#(resource) uploads.parts > (terraform resource) > (attribute) id>)
created\_at: Int64
The Unix timestamp (in seconds) for when the Part was created.
[](<#(resource) uploads.parts > (terraform resource) > (attribute) created_at>)
object: String
The object type, which is always `upload.part`.
[](<#(resource) uploads.parts > (terraform resource) > (attribute) object>)
### openai\_upload\_part
Terraform
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
`resource "openai\_upload\_part" "example\_upload\_part" {
upload\_id = "upload\_abc123"
data = "Example data"
}
`
```