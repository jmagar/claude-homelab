Retrieve vector store file content | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Vector Stores](/api/reference/java/resources/vector_stores)
[Files](/api/reference/java/resources/vector_stores/subresources/files)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Retrieve vector store file content
FileContentPage vectorStores().files().content(FileContentParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/vector\_stores/{vector\_store\_id}/files/{file\_id}/content
Retrieve the parsed contents of a vector store file.
##### ParametersExpand Collapse
FileContentParams params
String vectorStoreId
[](<#(resource) vector_stores.files > (method) content > (params) default > (param) vector_store_id > (schema)>)
Optional\<String\> fileId
[](<#(resource) vector_stores.files > (method) content > (params) default > (param) file_id > (schema)>)
[](<#(resource) vector_stores.files > (method) content > (params) default>)
##### ReturnsExpand Collapse
class FileContentResponse:
Optional\<String\> text
The text content
[](<#(resource) vector_stores.files > (model) FileContentResponse > (schema) > (property) text>)
Optional\<String\> type
The content type (currently only `"text"`)
[](<#(resource) vector_stores.files > (model) FileContentResponse > (schema) > (property) type>)
[](<#(resource) vector_stores.files > (model) FileContentResponse > (schema)>)
### Retrieve vector store file content
Java
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
`package com.openai.example;
import com.openai.client.OpenAIClient;
import com.openai.client.okhttp.OpenAIOkHttpClient;
import com.openai.models.vectorstores.files.FileContentPage;
import com.openai.models.vectorstores.files.FileContentParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
FileContentParams params = FileContentParams.builder()
.vectorStoreId("vs\_abc123")
.fileId("file-abc123")
.build();
FileContentPage page = client.vectorStores().files().content(params);
}
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