Retrieve container file | OpenAI API Reference
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
# Retrieve container file
[FileRetrieveResponse](</api/reference/java/resources/containers#(resource) containers.files > (model) FileRetrieveResponse > (schema)>) containers().files().retrieve(FileRetrieveParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/containers/{container\_id}/files/{file\_id}
Retrieve Container File
##### ParametersExpand Collapse
FileRetrieveParams params
String containerId
[](<#(resource) containers.files > (method) retrieve > (params) default > (param) container_id > (schema)>)
Optional\<String\> fileId
[](<#(resource) containers.files > (method) retrieve > (params) default > (param) file_id > (schema)>)
[](<#(resource) containers.files > (method) retrieve > (params) default>)
##### ReturnsExpand Collapse
class FileRetrieveResponse:
String id
Unique identifier for the file.
[](<#(resource) containers.files > (model) FileRetrieveResponse > (schema) > (property) id>)
long bytes
Size of the file in bytes.
[](<#(resource) containers.files > (model) FileRetrieveResponse > (schema) > (property) bytes>)
String containerId
The container this file belongs to.
[](<#(resource) containers.files > (model) FileRetrieveResponse > (schema) > (property) container_id>)
long createdAt
Unix timestamp (in seconds) when the file was created.
formatunixtime
[](<#(resource) containers.files > (model) FileRetrieveResponse > (schema) > (property) created_at>)
JsonValue; object\_ "container.file"constant"container.file"constant
The type of this object (`container.file`).
[](<#(resource) containers.files > (model) FileRetrieveResponse > (schema) > (property) object>)
String path
Path of the file in the container.
[](<#(resource) containers.files > (model) FileRetrieveResponse > (schema) > (property) path>)
String source
Source of the file (e.g., `user`, `assistant`).
[](<#(resource) containers.files > (model) FileRetrieveResponse > (schema) > (property) source>)
[](<#(resource) containers.files > (model) FileRetrieveResponse > (schema)>)
### Retrieve container file
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
import com.openai.models.containers.files.FileRetrieveParams;
import com.openai.models.containers.files.FileRetrieveResponse;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
FileRetrieveParams params = FileRetrieveParams.builder()
.containerId("container\_id")
.fileId("file\_id")
.build();
FileRetrieveResponse file = client.containers().files().retrieve(params);
}
}`
```
```
`{
"id": "cfile\_682e0e8a43c88191a7978f477a09bdf5",
"object": "container.file",
"created\_at": 1747848842,
"bytes": 880,
"container\_id": "cntr\_682e0e7318108198aa783fd921ff305e08e78805b9fdbb04",
"path": "/mnt/data/88e12fa445d32636f190a0b33daed6cb-tsconfig.json",
"source": "user"
}
`
```
##### Returns Examples
```
`{
"id": "cfile\_682e0e8a43c88191a7978f477a09bdf5",
"object": "container.file",
"created\_at": 1747848842,
"bytes": 880,
"container\_id": "cntr\_682e0e7318108198aa783fd921ff305e08e78805b9fdbb04",
"path": "/mnt/data/88e12fa445d32636f190a0b33daed6cb-tsconfig.json",
"source": "user"
}
`
```