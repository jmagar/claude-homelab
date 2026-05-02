Retrieve vector store file content | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Vector Stores](/api/reference/typescript/resources/vector_stores)
[Files](/api/reference/typescript/resources/vector_stores/subresources/files)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Retrieve vector store file content
client.vectorStores.files.content(stringfileID, FileContentParams { vector\_store\_id } params, RequestOptionsoptions?): Page\<[FileContentResponse](</api/reference/typescript/resources/vector_stores#(resource) vector_stores.files > (model) file_content_response > (schema)>) { text, type } \>
GET/vector\_stores/{vector\_store\_id}/files/{file\_id}/content
Retrieve the parsed contents of a vector store file.
##### ParametersExpand Collapse
fileID: string
[](<#(resource) vector_stores.files > (method) content > (params) default > (param) file_id > (schema)>)
params: FileContentParams { vector\_store\_id }
vector\_store\_id: string
The ID of the vector store.
[](<#(resource) vector_stores.files > (method) content > (params) default > (param) vector_store_id>)
[](<#(resource) vector_stores.files > (method) content > (params) default>)
##### ReturnsExpand Collapse
FileContentResponse { text, type }
text?: string
The text content
[](<#(resource) vector_stores.files > (model) file_content_response > (schema) > (property) text>)
type?: string
The content type (currently only `"text"`)
[](<#(resource) vector_stores.files > (model) file_content_response > (schema) > (property) type>)
[](<#(resource) vector_stores.files > (model) file_content_response > (schema)>)
### Retrieve vector store file content
TypeScript
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
`import OpenAI from 'openai';
const client = new OpenAI({
apiKey: process.env['OPENAI\_API\_KEY'], // This is the default and can be omitted
});
// Automatically fetches more pages as needed.
for await (const fileContentResponse of client.vectorStores.files.content('file-abc123', {
vector\_store\_id: 'vs\_abc123',
})) {
console.log(fileContentResponse.text);
}`
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