Upload file | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Files](/api/reference/java/resources/files)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Upload file
[FileObject](</api/reference/java/resources/files#(resource) files > (model) file_object > (schema)>) files().create(FileCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/files
Upload a file that can be used across various endpoints. Individual files
can be up to 512 MB, and each project can store up to 2.5 TB of files in
total. There is no organization-wide storage limit. Uploads to this
endpoint are rate-limited to 1,000 requests per minute per authenticated
user.
* The Assistants API supports files up to 2 million tokens and of specific
file types. See the [Assistants Tools guide](https://platform.openai.com/docs/assistants/tools) for
details.
* The Fine-tuning API only supports `.jsonl` files. The input also has
certain required formats for fine-tuning
[chat](https://platform.openai.com/docs/api-reference/fine-tuning/chat-input) or
[completions](https://platform.openai.com/docs/api-reference/fine-tuning/completions-input) models.
* The Batch API only supports `.jsonl` files up to 200 MB in size. The input
also has a specific required
[format](https://platform.openai.com/docs/api-reference/batch/request-input).
* For Retrieval or `file\_search` ingestion, upload files here first. If
you need to attach multiple uploaded files to the same vector store, use
[`/vector\_stores/{vector\_store\_id}/file\_batches`](https://platform.openai.com/docs/api-reference/vector-stores-file-batches/createBatch)
instead of attaching them one by one. Vector store attachment has separate
limits from file upload, including 2,000 attached files per minute per
organization.
Please [contact us](https://help.openai.com/) if you need to increase these
storage limits.
##### ParametersExpand Collapse
FileCreateParams params
InputStream file
The File object (not file name) to be uploaded.
[](<#(resource) files > (method) create > (params) default > (param) body > (schema) > (property) file>)
[FilePurpose](</api/reference/java/resources/files#(resource) files > (model) file_purpose > (schema)>) purpose
The intended purpose of the uploaded file. One of:
* `assistants`: Used in the Assistants API
* `batch`: Used in the Batch API
* `fine-tune`: Used for fine-tuning
* `vision`: Images used for vision fine-tuning
* `user\_data`: Flexible file type for any purpose
* `evals`: Used for eval data sets
[](<#(resource) files > (method) create > (params) default > (param) body > (schema) > (property) purpose>)
Optional\<ExpiresAfter\> expiresAfter
The expiration policy for a file. By default, files with `purpose=batch` expire after 30 days and all other files are persisted until they are manually deleted.
JsonValue; anchor "created\_at"constant"created\_at"constant
Anchor timestamp after which the expiration policy applies. Supported anchors: `created\_at`.
[](<#(resource) files > (method) create > (params) default > (param) body > (schema) > (property) expires_after > (property) anchor>)
long seconds
The number of seconds after the anchor time that the file will expire. Must be between 3600 (1 hour) and 2592000 (30 days).
formatint64
minimum3600
maximum2592000
[](<#(resource) files > (method) create > (params) default > (param) body > (schema) > (property) expires_after > (property) seconds>)
[](<#(resource) files > (method) create > (params) default > (param) body > (schema) > (property) expires_after>)
[](<#(resource) files > (method) create > (params) default>)
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
### Upload file
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
import com.openai.models.files.FileCreateParams;
import com.openai.models.files.FileObject;
import com.openai.models.files.FilePurpose;
import java.io.ByteArrayInputStream;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
FileCreateParams params = FileCreateParams.builder()
.file(new ByteArrayInputStream("Example data".getBytes()))
.purpose(FilePurpose.ASSISTANTS)
.build();
FileObject fileObject = client.files().create(params);
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