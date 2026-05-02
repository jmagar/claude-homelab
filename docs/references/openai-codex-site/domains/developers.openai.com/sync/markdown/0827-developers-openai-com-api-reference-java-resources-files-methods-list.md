List files | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Files](/api/reference/java/resources/files)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List files
FileListPage files().list(FileListParamsparams = FileListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/files
Returns a list of files.
##### ParametersExpand Collapse
FileListParams params
Optional\<String\> after
A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj\_foo, your subsequent call can include after=obj\_foo in order to fetch the next page of the list.
[](<#(resource) files > (method) list > (params) default > (param) after > (schema)>)
Optional\<Long\> limit
A limit on the number of objects to be returned. Limit can range between 1 and 10,000, and the default is 10,000.
[](<#(resource) files > (method) list > (params) default > (param) limit > (schema)>)
Optional\<[Order](</api/reference/java/resources/files/methods/list#(resource) files > (method) list > (params) default > (param) order > (schema)>)\> order
Sort order by the `created\_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.
ASC("asc")
[](<#(resource) files > (method) list > (params) default > (param) order > (schema) > (member) 0>)
DESC("desc")
[](<#(resource) files > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) files > (method) list > (params) default > (param) order > (schema)>)
Optional\<String\> purpose
Only return files with the given purpose.
[](<#(resource) files > (method) list > (params) default > (param) purpose > (schema)>)
[](<#(resource) files > (method) list > (params) default>)
##### ReturnsExpand Collapse
class FileObject:
The `File` object represents a document that has been uploaded to OpenAI.
String id
The file identifier, which can be referenced in the API endpoints.
[](<#(resource) files > (model) file_object > (schema) > (property) id>)
long bytes
The size of the file, in bytes.
[](<#(resource) files > (model) file_object > (schema) > (property) bytes>)
long createdAt
The Unix timestamp (in seconds) for when the file was created.
formatunixtime
[](<#(resource) files > (model) file_object > (schema) > (property) created_at>)
String filename
The name of the file.
[](<#(resource) files > (model) file_object > (schema) > (property) filename>)
JsonValue; object\_ "file"constant"file"constant
The object type, which is always `file`.
[](<#(resource) files > (model) file_object > (schema) > (property) object>)
Purpose purpose
The intended purpose of the file. Supported values are `assistants`, `assistants\_output`, `batch`, `batch\_output`, `fine-tune`, `fine-tune-results`, `vision`, and `user\_data`.
One of the following:
ASSISTANTS("assistants")
[](<#(resource) files > (model) file_object > (schema) > (property) purpose > (member) 0>)
ASSISTANTS\_OUTPUT("assistants\_output")
[](<#(resource) files > (model) file_object > (schema) > (property) purpose > (member) 1>)
BATCH("batch")
[](<#(resource) files > (model) file_object > (schema) > (property) purpose > (member) 2>)
BATCH\_OUTPUT("batch\_output")
[](<#(resource) files > (model) file_object > (schema) > (property) purpose > (member) 3>)
FINE\_TUNE("fine-tune")
[](<#(resource) files > (model) file_object > (schema) > (property) purpose > (member) 4>)
FINE\_TUNE\_RESULTS("fine-tune-results")
[](<#(resource) files > (model) file_object > (schema) > (property) purpose > (member) 5>)
VISION("vision")
[](<#(resource) files > (model) file_object > (schema) > (property) purpose > (member) 6>)
USER\_DATA("user\_data")
[](<#(resource) files > (model) file_object > (schema) > (property) purpose > (member) 7>)
[](<#(resource) files > (model) file_object > (schema) > (property) purpose>)
DeprecatedStatus status
Deprecated. The current status of the file, which can be either `uploaded`, `processed`, or `error`.
One of the following:
UPLOADED("uploaded")
[](<#(resource) files > (model) file_object > (schema) > (property) status > (member) 0>)
PROCESSED("processed")
[](<#(resource) files > (model) file_object > (schema) > (property) status > (member) 1>)
ERROR("error")
[](<#(resource) files > (model) file_object > (schema) > (property) status > (member) 2>)
[](<#(resource) files > (model) file_object > (schema) > (property) status>)
Optional\<Long\> expiresAt
The Unix timestamp (in seconds) for when the file will expire.
formatunixtime
[](<#(resource) files > (model) file_object > (schema) > (property) expires_at>)
DeprecatedOptional\<String\> statusDetails
Deprecated. For details on why a fine-tuning training file failed validation, see the `error` field on `fine\_tuning.job`.
[](<#(resource) files > (model) file_object > (schema) > (property) status_details>)
[](<#(resource) files > (model) file_object > (schema)>)
### List files
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
import com.openai.models.files.FileListPage;
import com.openai.models.files.FileListParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
FileListPage page = client.files().list();
}
}`
```
```
`{
"object": "list",
"data": [
{
"id": "file-abc123",
"object": "file",
"bytes": 175,
"created\_at": 1613677385,
"expires\_at": 1677614202,
"filename": "salesOverview.pdf",
"purpose": "assistants",
},
{
"id": "file-abc456",
"object": "file",
"bytes": 140,
"created\_at": 1613779121,
"expires\_at": 1677614202,
"filename": "puppy.jsonl",
"purpose": "fine-tune",
}
],
"first\_id": "file-abc123",
"last\_id": "file-abc456",
"has\_more": false
}
`
```
##### Returns Examples
```
`{
"object": "list",
"data": [
{
"id": "file-abc123",
"object": "file",
"bytes": 175,
"created\_at": 1613677385,
"expires\_at": 1677614202,
"filename": "salesOverview.pdf",
"purpose": "assistants",
},
{
"id": "file-abc456",
"object": "file",
"bytes": 140,
"created\_at": 1613779121,
"expires\_at": 1677614202,
"filename": "puppy.jsonl",
"purpose": "fine-tune",
}
],
"first\_id": "file-abc123",
"last\_id": "file-abc456",
"has\_more": false
}
`
```