Create upload | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Uploads](/api/reference/java/resources/uploads)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create upload
[Upload](</api/reference/java/resources/uploads#(resource) uploads > (model) upload > (schema)>) uploads().create(UploadCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/uploads
Creates an intermediate [Upload](https://platform.openai.com/docs/api-reference/uploads/object) object
that you can add [Parts](https://platform.openai.com/docs/api-reference/uploads/part-object) to.
Currently, an Upload can accept at most 8 GB in total and expires after an
hour after you create it.
Once you complete the Upload, we will create a
[File](https://platform.openai.com/docs/api-reference/files/object) object that contains all the parts
you uploaded. This File is usable in the rest of our platform as a regular
File object.
For certain `purpose` values, the correct `mime\_type` must be specified.
Please refer to documentation for the
[supported MIME types for your use case](https://platform.openai.com/docs/assistants/tools/file-search#supported-files).
For guidance on the proper filename extensions for each purpose, please
follow the documentation on [creating a
File](https://platform.openai.com/docs/api-reference/files/create).
Returns the Upload object with status `pending`.
##### ParametersExpand Collapse
UploadCreateParams params
long bytes
The number of bytes in the file you are uploading.
[](<#(resource) uploads > (method) create > (params) default > (param) body > (schema) > (property) bytes>)
String filename
The name of the file to upload.
[](<#(resource) uploads > (method) create > (params) default > (param) body > (schema) > (property) filename>)
String mimeType
The MIME type of the file.
This must fall within the supported MIME types for your file purpose. See
the supported MIME types for assistants and vision.
[](<#(resource) uploads > (method) create > (params) default > (param) body > (schema) > (property) mime_type>)
[FilePurpose](</api/reference/java/resources/files#(resource) files > (model) file_purpose > (schema)>) purpose
The intended purpose of the uploaded file.
See the [documentation on File
purposes](https://platform.openai.com/docs/api-reference/files/create#files-create-purpose).
[](<#(resource) uploads > (method) create > (params) default > (param) body > (schema) > (property) purpose>)
Optional\<ExpiresAfter\> expiresAfter
The expiration policy for a file. By default, files with `purpose=batch` expire after 30 days and all other files are persisted until they are manually deleted.
JsonValue; anchor "created\_at"constant"created\_at"constant
Anchor timestamp after which the expiration policy applies. Supported anchors: `created\_at`.
[](<#(resource) uploads > (method) create > (params) default > (param) body > (schema) > (property) expires_after > (property) anchor>)
long seconds
The number of seconds after the anchor time that the file will expire. Must be between 3600 (1 hour) and 2592000 (30 days).
formatint64
minimum3600
maximum2592000
[](<#(resource) uploads > (method) create > (params) default > (param) body > (schema) > (property) expires_after > (property) seconds>)
[](<#(resource) uploads > (method) create > (params) default > (param) body > (schema) > (property) expires_after>)
[](<#(resource) uploads > (method) create > (params) default>)
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
### Create upload
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
import com.openai.models.files.FilePurpose;
import com.openai.models.uploads.Upload;
import com.openai.models.uploads.UploadCreateParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
UploadCreateParams params = UploadCreateParams.builder()
.bytes(0L)
.filename("filename")
.mimeType("mime\_type")
.purpose(FilePurpose.ASSISTANTS)
.build();
Upload upload = client.uploads().create(params);
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
"status": "pending",
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
"status": "pending",
"expires\_at": 1719127296
}
`
```