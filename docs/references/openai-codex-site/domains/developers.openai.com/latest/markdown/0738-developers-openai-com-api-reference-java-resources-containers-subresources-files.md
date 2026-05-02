Create container file | OpenAI API Reference
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
# Create container file
[FileCreateResponse](</api/reference/java/resources/containers#(resource) containers.files > (model) FileCreateResponse > (schema)>) containers().files().create(FileCreateParamsparams = FileCreateParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
POST/containers/{container\_id}/files
Create a Container File
You can send either a multipart/form-data request with the raw file content, or a JSON request with a file ID.
##### ParametersExpand Collapse
FileCreateParams params
Optional\<String\> containerId
[](<#(resource) containers.files > (method) create > (params) default > (param) container_id > (schema)>)
Optional\<InputStream\> file
The File object (not file name) to be uploaded.
[](<#(resource) containers.files > (method) create > (params) default > (param) body > (schema) > (property) file>)
Optional\<String\> fileId
Name of the file to create.
[](<#(resource) containers.files > (method) create > (params) default > (param) body > (schema) > (property) file_id>)
[](<#(resource) containers.files > (method) create > (params) default>)
##### ReturnsExpand Collapse
class FileCreateResponse:
String id
Unique identifier for the file.
[](<#(resource) containers.files > (model) FileCreateResponse > (schema) > (property) id>)
long bytes
Size of the file in bytes.
[](<#(resource) containers.files > (model) FileCreateResponse > (schema) > (property) bytes>)
String containerId
The container this file belongs to.
[](<#(resource) containers.files > (model) FileCreateResponse > (schema) > (property) container_id>)
long createdAt
Unix timestamp (in seconds) when the file was created.
formatunixtime
[](<#(resource) containers.files > (model) FileCreateResponse > (schema) > (property) created_at>)
JsonValue; object\_ "container.file"constant"container.file"constant
The type of this object (`container.file`).
[](<#(resource) containers.files > (model) FileCreateResponse > (schema) > (property) object>)
String path
Path of the file in the container.
[](<#(resource) containers.files > (model) FileCreateResponse > (schema) > (property) path>)
String source
Source of the file (e.g., `user`, `assistant`).
[](<#(resource) containers.files > (model) FileCreateResponse > (schema) > (property) source>)
[](<#(resource) containers.files > (model) FileCreateResponse > (schema)>)
### Create container file
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
import com.openai.models.containers.files.FileCreateParams;
import com.openai.models.containers.files.FileCreateResponse;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
FileCreateResponse file = client.containers().files().create("container\_id");
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