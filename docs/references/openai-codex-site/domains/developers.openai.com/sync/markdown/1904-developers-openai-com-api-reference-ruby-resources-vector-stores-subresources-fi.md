Retrieve vector store file content | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Vector Stores](/api/reference/ruby/resources/vector_stores)
[Files](/api/reference/ruby/resources/vector_stores/subresources/files)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Retrieve vector store file content
vector\_stores.files.content(file\_id, \*\*kwargs) -\> Page\<[FileContentResponse](</api/reference/ruby/resources/vector_stores#(resource) vector_stores.files > (model) file_content_response > (schema)>) { text, type } \>
GET/vector\_stores/{vector\_store\_id}/files/{file\_id}/content
Retrieve the parsed contents of a vector store file.
##### ParametersExpand Collapse
vector\_store\_id: String
[](<#(resource) vector_stores.files > (method) content > (params) default > (param) vector_store_id > (schema)>)
file\_id: String
[](<#(resource) vector_stores.files > (method) content > (params) default > (param) file_id > (schema)>)
##### ReturnsExpand Collapse
class FileContentResponse { text, type }
text: String
The text content
[](<#(resource) vector_stores.files > (model) file_content_response > (schema) > (property) text>)
type: String
The content type (currently only `"text"`)
[](<#(resource) vector_stores.files > (model) file_content_response > (schema) > (property) type>)
[](<#(resource) vector_stores.files > (model) file_content_response > (schema)>)
### Retrieve vector store file content
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
page = openai.vector\_stores.files.content("file-abc123", vector\_store\_id: "vs\_abc123")
puts(page)`
```
```
`{
"file\_id": "file-abc123",
"filename": "example.txt",
"attributes": {"key": "value"},
"content": [
{"type": "text", "text": "..."},
...
]
}
`
```
##### Returns Examples
```
`{
"file\_id": "file-abc123",
"filename": "example.txt",
"attributes": {"key": "value"},
"content": [
{"type": "text", "text": "..."},
...
]
}
`
```