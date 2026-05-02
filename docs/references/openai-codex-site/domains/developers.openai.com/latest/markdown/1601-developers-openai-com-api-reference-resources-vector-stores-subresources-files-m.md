Retrieve vector store file content | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Vector Stores](/api/reference/resources/vector_stores)
[Files](/api/reference/resources/vector_stores/subresources/files)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Retrieve vector store file content
GET/vector\_stores/{vector\_store\_id}/files/{file\_id}/content
Retrieve the parsed contents of a vector store file.
##### Path ParametersExpand Collapse
vector\_store\_id: string
[](<#(resource) vector_stores.files > (method) content > (params) default > (param) vector_store_id > (schema)>)
file\_id: string
[](<#(resource) vector_stores.files > (method) content > (params) default > (param) file_id > (schema)>)
##### ReturnsExpand Collapse
data: array of object { text, type }
Parsed content of the file.
text: optional string
The text content
[](<#(resource) vector_stores.files > (model) file_content_response > (schema) > (property) text>)
type: optional string
The content type (currently only `"text"`)
[](<#(resource) vector_stores.files > (model) file_content_response > (schema) > (property) type>)
[](<#(resource) vector_stores.files > (method) content > (network schema) > (property) data>)
has\_more: boolean
Indicates if there are more content pages to fetch.
[](<#(resource) vector_stores.files > (method) content > (network schema) > (property) has_more>)
next\_page: string
The token for the next page, if any.
[](<#(resource) vector_stores.files > (method) content > (network schema) > (property) next_page>)
object: "vector\_store.file\_content.page"
The object type, which is always `vector\_store.file\_content.page`
[](<#(resource) vector_stores.files > (method) content > (network schema) > (property) object>)
### Retrieve vector store file content
HTTP
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
`curl \\
https://api.openai.com/v1/vector\_stores/vs\_abc123/files/file-abc123/content \\
-H "Authorization: Bearer $OPENAI\_API\_KEY"
`
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