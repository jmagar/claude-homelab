Delete a container file | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Containers](/api/reference/java/resources/containers)
[Files](/api/reference/java/resources/containers/subresources/files)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete a container file
containers().files().delete(FileDeleteParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
DELETE/containers/{container\_id}/files/{file\_id}
Delete Container File
##### ParametersExpand Collapse
FileDeleteParams params
String containerId
[](<#(resource) containers.files > (method) delete > (params) default > (param) container_id > (schema)>)
Optional\<String\> fileId
[](<#(resource) containers.files > (method) delete > (params) default > (param) file_id > (schema)>)
[](<#(resource) containers.files > (method) delete > (params) default>)
### Delete a container file
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
import com.openai.models.containers.files.FileDeleteParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
FileDeleteParams params = FileDeleteParams.builder()
.containerId("container\_id")
.fileId("file\_id")
.build();
client.containers().files().delete(params);
}
}`
```
```
`{
"id": "cfile\_682e0e8a43c88191a7978f477a09bdf5",
"object": "container.file.deleted",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"id": "cfile\_682e0e8a43c88191a7978f477a09bdf5",
"object": "container.file.deleted",
"deleted": true
}
`
```