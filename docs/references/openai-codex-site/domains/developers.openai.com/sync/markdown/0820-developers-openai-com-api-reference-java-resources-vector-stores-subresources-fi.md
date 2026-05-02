Delete vector store file | OpenAI API Reference
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
# Delete vector store file
[VectorStoreFileDeleted](</api/reference/java/resources/vector_stores#(resource) vector_stores.files > (model) vector_store_file_deleted > (schema)>) vectorStores().files().delete(FileDeleteParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
DELETE/vector\_stores/{vector\_store\_id}/files/{file\_id}
Delete a vector store file. This will remove the file from the vector store but the file itself will not be deleted. To delete the file, use the [delete file](https://platform.openai.com/docs/api-reference/files/delete) endpoint.
##### ParametersExpand Collapse
FileDeleteParams params
String vectorStoreId
[](<#(resource) vector_stores.files > (method) delete > (params) default > (param) vector_store_id > (schema)>)
Optional\<String\> fileId
[](<#(resource) vector_stores.files > (method) delete > (params) default > (param) file_id > (schema)>)
[](<#(resource) vector_stores.files > (method) delete > (params) default>)
##### ReturnsExpand Collapse
class VectorStoreFileDeleted:
String id
[](<#(resource) vector_stores.files > (model) vector_store_file_deleted > (schema) > (property) id>)
boolean deleted
[](<#(resource) vector_stores.files > (model) vector_store_file_deleted > (schema) > (property) deleted>)
JsonValue; object\_ "vector\_store.file.deleted"constant"vector\_store.file.deleted"constant
[](<#(resource) vector_stores.files > (model) vector_store_file_deleted > (schema) > (property) object>)
[](<#(resource) vector_stores.files > (model) vector_store_file_deleted > (schema)>)
### Delete vector store file
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
import com.openai.models.vectorstores.files.FileDeleteParams;
import com.openai.models.vectorstores.files.VectorStoreFileDeleted;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
FileDeleteParams params = FileDeleteParams.builder()
.vectorStoreId("vector\_store\_id")
.fileId("file\_id")
.build();
VectorStoreFileDeleted vectorStoreFileDeleted = client.vectorStores().files().delete(params);
}
}`
```
```
`{
id: "file-abc123",
object: "vector\_store.file.deleted",
deleted: true
}
`
```
##### Returns Examples
```
`{
id: "file-abc123",
object: "vector\_store.file.deleted",
deleted: true
}
`
```