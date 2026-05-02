Delete vector store | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Vector Stores](/api/reference/java/resources/vector_stores)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete vector store
[VectorStoreDeleted](</api/reference/java/resources/vector_stores#(resource) vector_stores > (model) vector_store_deleted > (schema)>) vectorStores().delete(VectorStoreDeleteParamsparams = VectorStoreDeleteParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
DELETE/vector\_stores/{vector\_store\_id}
Delete a vector store.
##### ParametersExpand Collapse
VectorStoreDeleteParams params
Optional\<String\> vectorStoreId
[](<#(resource) vector_stores > (method) delete > (params) default > (param) vector_store_id > (schema)>)
[](<#(resource) vector_stores > (method) delete > (params) default>)
##### ReturnsExpand Collapse
class VectorStoreDeleted:
String id
[](<#(resource) vector_stores > (model) vector_store_deleted > (schema) > (property) id>)
boolean deleted
[](<#(resource) vector_stores > (model) vector_store_deleted > (schema) > (property) deleted>)
JsonValue; object\_ "vector\_store.deleted"constant"vector\_store.deleted"constant
[](<#(resource) vector_stores > (model) vector_store_deleted > (schema) > (property) object>)
[](<#(resource) vector_stores > (model) vector_store_deleted > (schema)>)
### Delete vector store
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
import com.openai.models.vectorstores.VectorStoreDeleteParams;
import com.openai.models.vectorstores.VectorStoreDeleted;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
VectorStoreDeleted vectorStoreDeleted = client.vectorStores().delete("vector\_store\_id");
}
}`
```
```
`{
id: "vs\_abc123",
object: "vector\_store.deleted",
deleted: true
}
`
```
##### Returns Examples
```
`{
id: "vs\_abc123",
object: "vector\_store.deleted",
deleted: true
}
`
```