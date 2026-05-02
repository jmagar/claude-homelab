Retrieve vector store file content | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Vector Stores](/api/reference/python/resources/vector_stores)
[Files](/api/reference/python/resources/vector_stores/subresources/files)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Retrieve vector store file content
vector\_stores.files.content(strfile\_id, FileContentParams\*\*kwargs) -\> SyncPage[[FileContentResponse](</api/reference/python/resources/vector_stores#(resource) vector_stores.files > (model) file_content_response > (schema)>)]
GET/vector\_stores/{vector\_store\_id}/files/{file\_id}/content
Retrieve the parsed contents of a vector store file.
##### ParametersExpand Collapse
vector\_store\_id: str
[](<#(resource) vector_stores.files > (method) content > (params) default > (param) vector_store_id > (schema)>)
file\_id: str
[](<#(resource) vector_stores.files > (method) content > (params) default > (param) file_id > (schema)>)
##### ReturnsExpand Collapse
class FileContentResponse: …
text: Optional[str]
The text content
[](<#(resource) vector_stores.files > (model) file_content_response > (schema) > (property) text>)
type: Optional[str]
The content type (currently only `"text"`)
[](<#(resource) vector_stores.files > (model) file_content_response > (schema) > (property) type>)
[](<#(resource) vector_stores.files > (model) file_content_response > (schema)>)
### Retrieve vector store file content
Python
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
`import os
from openai import OpenAI
client = OpenAI(
api\_key=os.environ.get("OPENAI\_API\_KEY"), # This is the default and can be omitted
)
page = client.vector\_stores.files.content(
file\_id="file-abc123",
vector\_store\_id="vs\_abc123",
)
page = page.data[0]
print(page.text)`
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