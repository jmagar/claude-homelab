Files | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Containers](/api/reference/python/resources/containers)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Files
##### [List container files](/api/reference/python/resources/containers/subresources/files/methods/list)
containers.files.list(strcontainer\_id, FileListParams\*\*kwargs) -\> SyncCursorPage[[FileListResponse](</api/reference/python/resources/containers#(resource) containers.files > (model) file_list_response > (schema)>)]
GET/containers/{container\_id}/files
##### [Create container file](/api/reference/python/resources/containers/subresources/files/methods/create)
containers.files.create(strcontainer\_id, FileCreateParams\*\*kwargs) -\> [FileCreateResponse](</api/reference/python/resources/containers#(resource) containers.files > (model) file_create_response > (schema)>)
POST/containers/{container\_id}/files
##### [Retrieve container file](/api/reference/python/resources/containers/subresources/files/methods/retrieve)
containers.files.retrieve(strfile\_id, FileRetrieveParams\*\*kwargs) -\> [FileRetrieveResponse](</api/reference/python/resources/containers#(resource) containers.files > (model) file_retrieve_response > (schema)>)
GET/containers/{container\_id}/files/{file\_id}
##### [Delete a container file](/api/reference/python/resources/containers/subresources/files/methods/delete)
containers.files.delete(strfile\_id, FileDeleteParams\*\*kwargs)
DELETE/containers/{container\_id}/files/{file\_id}
##### ModelsExpand Collapse
class FileListResponse: …
id: str
Unique identifier for the file.
[](<#(resource) containers.files > (model) file_list_response > (schema) > (property) id>)
bytes: int
Size of the file in bytes.
[](<#(resource) containers.files > (model) file_list_response > (schema) > (property) bytes>)
container\_id: str
The container this file belongs to.
[](<#(resource) containers.files > (model) file_list_response > (schema) > (property) container_id>)
created\_at: int
Unix timestamp (in seconds) when the file was created.
formatunixtime
[](<#(resource) containers.files > (model) file_list_response > (schema) > (property) created_at>)
object: Literal["container.file"]
The type of this object (`container.file`).
[](<#(resource) containers.files > (model) file_list_response > (schema) > (property) object>)
path: str
Path of the file in the container.
[](<#(resource) containers.files > (model) file_list_response > (schema) > (property) path>)
source: str
Source of the file (e.g., `user`, `assistant`).
[](<#(resource) containers.files > (model) file_list_response > (schema) > (property) source>)
[](<#(resource) containers.files > (model) file_list_response > (schema)>)
class FileCreateResponse: …
id: str
Unique identifier for the file.
[](<#(resource) containers.files > (model) file_create_response > (schema) > (property) id>)
bytes: int
Size of the file in bytes.
[](<#(resource) containers.files > (model) file_create_response > (schema) > (property) bytes>)
container\_id: str
The container this file belongs to.
[](<#(resource) containers.files > (model) file_create_response > (schema) > (property) container_id>)
created\_at: int
Unix timestamp (in seconds) when the file was created.
formatunixtime
[](<#(resource) containers.files > (model) file_create_response > (schema) > (property) created_at>)
object: Literal["container.file"]
The type of this object (`container.file`).
[](<#(resource) containers.files > (model) file_create_response > (schema) > (property) object>)
path: str
Path of the file in the container.
[](<#(resource) containers.files > (model) file_create_response > (schema) > (property) path>)
source: str
Source of the file (e.g., `user`, `assistant`).
[](<#(resource) containers.files > (model) file_create_response > (schema) > (property) source>)
[](<#(resource) containers.files > (model) file_create_response > (schema)>)
class FileRetrieveResponse: …
id: str
Unique identifier for the file.
[](<#(resource) containers.files > (model) file_retrieve_response > (schema) > (property) id>)
bytes: int
Size of the file in bytes.
[](<#(resource) containers.files > (model) file_retrieve_response > (schema) > (property) bytes>)
container\_id: str
The container this file belongs to.
[](<#(resource) containers.files > (model) file_retrieve_response > (schema) > (property) container_id>)
created\_at: int
Unix timestamp (in seconds) when the file was created.
formatunixtime
[](<#(resource) containers.files > (model) file_retrieve_response > (schema) > (property) created_at>)
object: Literal["container.file"]
The type of this object (`container.file`).
[](<#(resource) containers.files > (model) file_retrieve_response > (schema) > (property) object>)
path: str
Path of the file in the container.
[](<#(resource) containers.files > (model) file_retrieve_response > (schema) > (property) path>)
source: str
Source of the file (e.g., `user`, `assistant`).
[](<#(resource) containers.files > (model) file_retrieve_response > (schema) > (property) source>)
[](<#(resource) containers.files > (model) file_retrieve_response > (schema)>)
#### FilesContent
##### [Retrieve container file content](/api/reference/python/resources/containers/subresources/files/subresources/content/methods/retrieve)
containers.files.content.retrieve(strfile\_id, ContentRetrieveParams\*\*kwargs) -\> BinaryResponseContent
GET/containers/{container\_id}/files/{file\_id}/content