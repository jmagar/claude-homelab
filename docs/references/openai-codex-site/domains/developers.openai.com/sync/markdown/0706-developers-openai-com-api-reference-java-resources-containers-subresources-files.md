List container files | OpenAI API Reference
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
# List container files
FileListPage containers().files().list(FileListParamsparams = FileListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/containers/{container\_id}/files
List Container files
##### ParametersExpand Collapse
FileListParams params
Optional\<String\> containerId
[](<#(resource) containers.files > (method) list > (params) default > (param) container_id > (schema)>)
Optional\<String\> after
A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj\_foo, your subsequent call can include after=obj\_foo in order to fetch the next page of the list.
[](<#(resource) containers.files > (method) list > (params) default > (param) after > (schema)>)
Optional\<Long\> limit
A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
[](<#(resource) containers.files > (method) list > (params) default > (param) limit > (schema)>)
Optional\<[Order](</api/reference/java/resources/containers/subresources/files/methods/list#(resource) containers.files > (method) list > (params) default > (param) order > (schema)>)\> order
Sort order by the `created\_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.
ASC("asc")
[](<#(resource) containers.files > (method) list > (params) default > (param) order > (schema) > (member) 0>)
DESC("desc")
[](<#(resource) containers.files > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) containers.files > (method) list > (params) default > (param) order > (schema)>)
[](<#(resource) containers.files > (method) list > (params) default>)
##### ReturnsExpand Collapse
class FileListResponse:
String id
Unique identifier for the file.
[](<#(resource) containers.files > (model) FileListResponse > (schema) > (property) id>)
long bytes
Size of the file in bytes.
[](<#(resource) containers.files > (model) FileListResponse > (schema) > (property) bytes>)
String containerId
The container this file belongs to.
[](<#(resource) containers.files > (model) FileListResponse > (schema) > (property) container_id>)
long createdAt
Unix timestamp (in seconds) when the file was created.
formatunixtime
[](<#(resource) containers.files > (model) FileListResponse > (schema) > (property) created_at>)
JsonValue; object\_ "container.file"constant"container.file"constant
The type of this object (`container.file`).
[](<#(resource) containers.files > (model) FileListResponse > (schema) > (property) object>)
String path
Path of the file in the container.
[](<#(resource) containers.files > (model) FileListResponse > (schema) > (property) path>)
String source
Source of the file (e.g., `user`, `assistant`).
[](<#(resource) containers.files > (model) FileListResponse > (schema) > (property) source>)
[](<#(resource) containers.files > (model) FileListResponse > (schema)>)
### List container files
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
import com.openai.models.containers.files.FileListPage;
import com.openai.models.containers.files.FileListParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
FileListPage page = client.containers().files().list("container\_id");
}
}`
```
```
`{
"object": "list",
"data": [
{
"id": "cfile\_682e0e8a43c88191a7978f477a09bdf5",
"object": "container.file",
"created\_at": 1747848842,
"bytes": 880,
"container\_id": "cntr\_682e0e7318108198aa783fd921ff305e08e78805b9fdbb04",
"path": "/mnt/data/88e12fa445d32636f190a0b33daed6cb-tsconfig.json",
"source": "user"
}
],
"first\_id": "cfile\_682e0e8a43c88191a7978f477a09bdf5",
"has\_more": false,
"last\_id": "cfile\_682e0e8a43c88191a7978f477a09bdf5"
}
`
```
##### Returns Examples
```
`{
"object": "list",
"data": [
{
"id": "cfile\_682e0e8a43c88191a7978f477a09bdf5",
"object": "container.file",
"created\_at": 1747848842,
"bytes": 880,
"container\_id": "cntr\_682e0e7318108198aa783fd921ff305e08e78805b9fdbb04",
"path": "/mnt/data/88e12fa445d32636f190a0b33daed6cb-tsconfig.json",
"source": "user"
}
],
"first\_id": "cfile\_682e0e8a43c88191a7978f477a09bdf5",
"has\_more": false,
"last\_id": "cfile\_682e0e8a43c88191a7978f477a09bdf5"
}
`
```