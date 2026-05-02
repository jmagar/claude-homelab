Cancel upload | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Uploads](/api/reference/java/resources/uploads)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Cancel upload
[Upload](</api/reference/java/resources/uploads#(resource) uploads > (model) upload > (schema)>) uploads().cancel(UploadCancelParamsparams = UploadCancelParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
POST/uploads/{upload\_id}/cancel
Cancels the Upload. No Parts may be added after an Upload is cancelled.
Returns the Upload object with status `cancelled`.
##### ParametersExpand Collapse
UploadCancelParams params
Optional\<String\> uploadId
[](<#(resource) uploads > (method) cancel > (params) default > (param) upload_id > (schema)>)
[](<#(resource) uploads > (method) cancel > (params) default>)
##### ReturnsExpand Collapse
class Upload:
The Upload object can accept byte chunks in the form of Parts.
String id
The Upload unique identifier, which can be referenced in API endpoints.
[](<#(resource) uploads > (model) upload > (schema) > (property) id>)
long bytes
The intended number of bytes to be uploaded.
[](<#(resource) uploads > (model) upload > (schema) > (property) bytes>)
long createdAt
The Unix timestamp (in seconds) for when the Upload was created.
formatunixtime
[](<#(resource) uploads > (model) upload > (schema) > (property) created_at>)
long expiresAt
The Unix timestamp (in seconds) for when the Upload will expire.
formatunixtime
[](<#(resource) uploads > (model) upload > (schema) > (property) expires_at>)
String filename
The name of the file to be uploaded.
[](<#(resource) uploads > (model) upload > (schema) > (property) filename>)
JsonValue; object\_ "upload"constant"upload"constant
The object type, which is always “upload”.
[](<#(resource) uploads > (model) upload > (schema) > (property) object>)
String purpose
The intended purpose of the file. [Please refer here](https://platform.openai.com/docs/api-reference/files/object#files/object-purpose) for acceptable values.
[](<#(resource) uploads > (model) upload > (schema) > (property) purpose>)
Status status
The status of the Upload.
One of the following:
PENDING("pending")
[](<#(resource) uploads > (model) upload > (schema) > (property) status > (member) 0>)
COMPLETED("completed")
[](<#(resource) uploads > (model) upload > (schema) > (property) status > (member) 1>)
CANCELLED("cancelled")
[](<#(resource) uploads > (model) upload > (schema) > (property) status > (member) 2>)
EXPIRED("expired")
[](<#(resource) uploads > (model) upload > (schema) > (property) status > (member) 3>)
[](<#(resource) uploads > (model) upload > (schema) > (property) status>)
Optional\<[FileObject](</api/reference/java/resources/files#(resource) files > (model) file_object > (schema)>)\> file
The `File` object represents a document that has been uploaded to OpenAI.
String id
The file identifier, which can be referenced in the API endpoints.
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) id>)
long bytes
The size of the file, in bytes.
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) bytes>)
long createdAt
The Unix timestamp (in seconds) for when the file was created.
formatunixtime
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) created_at>)
String filename
The name of the file.
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) filename>)
JsonValue; object\_ "file"constant"file"constant
The object type, which is always `file`.
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) object>)
Purpose purpose
The intended purpose of the file. Supported values are `assistants`, `assistants\_output`, `batch`, `batch\_output`, `fine-tune`, `fine-tune-results`, `vision`, and `user\_data`.
One of the following:
ASSISTANTS("assistants")
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) purpose > (member) 0>)
ASSISTANTS\_OUTPUT("assistants\_output")
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) purpose > (member) 1>)
BATCH("batch")
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) purpose > (member) 2>)
BATCH\_OUTPUT("batch\_output")
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) purpose > (member) 3>)
FINE\_TUNE("fine-tune")
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) purpose > (member) 4>)
FINE\_TUNE\_RESULTS("fine-tune-results")
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) purpose > (member) 5>)
VISION("vision")
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) purpose > (member) 6>)
USER\_DATA("user\_data")
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) purpose > (member) 7>)
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) purpose>)
DeprecatedStatus status
Deprecated. The current status of the file, which can be either `uploaded`, `processed`, or `error`.
One of the following:
UPLOADED("uploaded")
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) status > (member) 0>)
PROCESSED("processed")
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) status > (member) 1>)
ERROR("error")
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) status > (member) 2>)
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) status>)
Optional\<Long\> expiresAt
The Unix timestamp (in seconds) for when the file will expire.
formatunixtime
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) expires_at>)
DeprecatedOptional\<String\> statusDetails
Deprecated. For details on why a fine-tuning training file failed validation, see the `error` field on `fine\_tuning.job`.
[](<#(resource) uploads > (model) upload > (schema) > (property) file + (resource) files > (model) file_object > (schema) > (property) status_details>)
[](<#(resource) uploads > (model) upload > (schema) > (property) file>)
[](<#(resource) uploads > (model) upload > (schema)>)
### Cancel upload
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
import com.openai.models.uploads.Upload;
import com.openai.models.uploads.UploadCancelParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
Upload upload = client.uploads().cancel("upload\_abc123");
}
}`
```
```
`{
"id": "upload\_abc123",
"object": "upload",
"bytes": 2147483648,
"created\_at": 1719184911,
"filename": "training\_examples.jsonl",
"purpose": "fine-tune",
"status": "cancelled",
"expires\_at": 1719127296
}
`
```
##### Returns Examples
```
`{
"id": "upload\_abc123",
"object": "upload",
"bytes": 2147483648,
"created\_at": 1719184911,
"filename": "training\_examples.jsonl",
"purpose": "fine-tune",
"status": "cancelled",
"expires\_at": 1719127296
}
`
```