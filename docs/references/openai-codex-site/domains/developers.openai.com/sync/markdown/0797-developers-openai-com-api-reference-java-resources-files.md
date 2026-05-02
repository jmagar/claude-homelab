Files | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Files
Files are used to upload documents that can be used with features like Assistants and Fine-tuning.
##### [List files](/api/reference/java/resources/files/methods/list)
FileListPage files().list(FileListParamsparams = FileListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/files
##### [Upload file](/api/reference/java/resources/files/methods/create)
[FileObject](</api/reference/java/resources/files#(resource) files > (model) file_object > (schema)>) files().create(FileCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/files
##### [Delete file](/api/reference/java/resources/files/methods/delete)
[FileDeleted](</api/reference/java/resources/files#(resource) files > (model) file_deleted > (schema)>) files().delete(FileDeleteParamsparams = FileDeleteParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
DELETE/files/{file\_id}
##### [Retrieve file](/api/reference/java/resources/files/methods/retrieve)
[FileObject](</api/reference/java/resources/files#(resource) files > (model) file_object > (schema)>) files().retrieve(FileRetrieveParamsparams = FileRetrieveParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/files/{file\_id}
##### [Retrieve file content](/api/reference/java/resources/files/methods/content)
HttpResponse files().content(FileContentParamsparams = FileContentParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/files/{file\_id}/content
##### ModelsExpand Collapse
class FileDeleted:
String id
[](<#(resource) files > (model) file_deleted > (schema) > (property) id>)
boolean deleted
[](<#(resource) files > (model) file_deleted > (schema) > (property) deleted>)
JsonValue; object\_ "file"constant"file"constant
[](<#(resource) files > (model) file_deleted > (schema) > (property) object>)
[](<#(resource) files > (model) file_deleted > (schema)>)
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
enum FilePurpose:
The intended purpose of the uploaded file. One of:
* `assistants`: Used in the Assistants API
* `batch`: Used in the Batch API
* `fine-tune`: Used for fine-tuning
* `vision`: Images used for vision fine-tuning
* `user\_data`: Flexible file type for any purpose
* `evals`: Used for eval data sets
ASSISTANTS("assistants")
[](<#(resource) files > (model) file_purpose > (schema) > (member) 0>)
BATCH("batch")
[](<#(resource) files > (model) file_purpose > (schema) > (member) 1>)
FINE\_TUNE("fine-tune")
[](<#(resource) files > (model) file_purpose > (schema) > (member) 2>)
VISION("vision")
[](<#(resource) files > (model) file_purpose > (schema) > (member) 3>)
USER\_DATA("user\_data")
[](<#(resource) files > (model) file_purpose > (schema) > (member) 4>)
EVALS("evals")
[](<#(resource) files > (model) file_purpose > (schema) > (member) 5>)
[](<#(resource) files > (model) file_purpose > (schema)>)