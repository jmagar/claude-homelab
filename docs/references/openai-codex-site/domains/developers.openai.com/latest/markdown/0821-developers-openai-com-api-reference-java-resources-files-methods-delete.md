Delete file | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Files](/api/reference/java/resources/files)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete file
[FileDeleted](</api/reference/java/resources/files#(resource) files > (model) file_deleted > (schema)>) files().delete(FileDeleteParamsparams = FileDeleteParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
DELETE/files/{file\_id}
Delete a file and remove it from all vector stores.
##### ParametersExpand Collapse
FileDeleteParams params
Optional\<String\> fileId
[](<#(resource) files > (method) delete > (params) default > (param) file_id > (schema)>)
[](<#(resource) files > (method) delete > (params) default>)
##### ReturnsExpand Collapse
class FileDeleted:
String id
[](<#(resource) files > (model) file_deleted > (schema) > (property) id>)
boolean deleted
[](<#(resource) files > (model) file_deleted > (schema) > (property) deleted>)
JsonValue; object\_ "file"constant"file"constant
[](<#(resource) files > (model) file_deleted > (schema) > (property) object>)
[](<#(resource) files > (model) file_deleted > (schema)>)
### Delete file
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
import com.openai.models.files.FileDeleteParams;
import com.openai.models.files.FileDeleted;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
FileDeleted fileDeleted = client.files().delete("file\_id");
}
}`
```
```
`{
"id": "file-abc123",
"object": "file",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"id": "file-abc123",
"object": "file",
"deleted": true
}
`
```