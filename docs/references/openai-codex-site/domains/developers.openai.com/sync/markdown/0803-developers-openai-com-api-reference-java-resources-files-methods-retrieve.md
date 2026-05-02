Retrieve file | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Files](/api/reference/java/resources/files)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Retrieve file
[FileObject](</api/reference/java/resources/files#(resource) files > (model) file_object > (schema)>) files().retrieve(FileRetrieveParamsparams = FileRetrieveParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/files/{file\_id}
Returns information about a specific file.
##### ParametersExpand Collapse
FileRetrieveParams params
Optional\<String\> fileId
[](<#(resource) files > (method) retrieve > (params) default > (param) file_id > (schema)>)
[](<#(resource) files > (method) retrieve > (params) default>)
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
### Retrieve file
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
import com.openai.models.files.FileObject;
import com.openai.models.files.FileRetrieveParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
FileObject fileObject = client.files().retrieve("file\_id");
}
}`
```
```
`{
"id": "file-abc123",
"object": "file",
"bytes": 120000,
"created\_at": 1677610602,
"expires\_at": 1677614202,
"filename": "mydata.jsonl",
"purpose": "fine-tune",
}
`
```
##### Returns Examples
```
`{
"id": "file-abc123",
"object": "file",
"bytes": 120000,
"created\_at": 1677610602,
"expires\_at": 1677614202,
"filename": "mydata.jsonl",
"purpose": "fine-tune",
}
`
```