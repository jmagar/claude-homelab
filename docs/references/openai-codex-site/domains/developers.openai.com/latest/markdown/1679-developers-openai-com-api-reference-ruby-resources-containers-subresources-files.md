Files | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Containers](/api/reference/ruby/resources/containers)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Files
##### [List container files](/api/reference/ruby/resources/containers/subresources/files/methods/list)
containers.files.list(container\_id, \*\*kwargs) -\> CursorPage\<[FileListResponse](</api/reference/ruby/resources/containers#(resource) containers.files > (model) file_list_response > (schema)>) { id, bytes, container\_id, 4 more } \>
GET/containers/{container\_id}/files
##### [Create container file](/api/reference/ruby/resources/containers/subresources/files/methods/create)
containers.files.create(container\_id, \*\*kwargs) -\> [FileCreateResponse](</api/reference/ruby/resources/containers#(resource) containers.files > (model) file_create_response > (schema)>) { id, bytes, container\_id, 4 more }
POST/containers/{container\_id}/files
##### [Retrieve container file](/api/reference/ruby/resources/containers/subresources/files/methods/retrieve)
containers.files.retrieve(file\_id, \*\*kwargs) -\> [FileRetrieveResponse](</api/reference/ruby/resources/containers#(resource) containers.files > (model) file_retrieve_response > (schema)>) { id, bytes, container\_id, 4 more }
GET/containers/{container\_id}/files/{file\_id}
##### [Delete a container file](/api/reference/ruby/resources/containers/subresources/files/methods/delete)
containers.files.delete(file\_id, \*\*kwargs) -\> void
DELETE/containers/{container\_id}/files/{file\_id}
##### ModelsExpand Collapse
class FileListResponse { id, bytes, container\_id, 4 more }
id: String
Unique identifier for the file.
[](<#(resource) containers.files > (model) file_list_response > (schema) > (property) id>)
bytes: Integer
Size of the file in bytes.
[](<#(resource) containers.files > (model) file_list_response > (schema) > (property) bytes>)
container\_id: String
The container this file belongs to.
[](<#(resource) containers.files > (model) file_list_response > (schema) > (property) container_id>)
created\_at: Integer
Unix timestamp (in seconds) when the file was created.
formatunixtime
[](<#(resource) containers.files > (model) file_list_response > (schema) > (property) created_at>)
object: :"container.file"
The type of this object (`container.file`).
[](<#(resource) containers.files > (model) file_list_response > (schema) > (property) object>)
path: String
Path of the file in the container.
[](<#(resource) containers.files > (model) file_list_response > (schema) > (property) path>)
source: String
Source of the file (e.g., `user`, `assistant`).
[](<#(resource) containers.files > (model) file_list_response > (schema) > (property) source>)
[](<#(resource) containers.files > (model) file_list_response > (schema)>)
class FileCreateResponse { id, bytes, container\_id, 4 more }
id: String
Unique identifier for the file.
[](<#(resource) containers.files > (model) file_create_response > (schema) > (property) id>)
bytes: Integer
Size of the file in bytes.
[](<#(resource) containers.files > (model) file_create_response > (schema) > (property) bytes>)
container\_id: String
The container this file belongs to.
[](<#(resource) containers.files > (model) file_create_response > (schema) > (property) container_id>)
created\_at: Integer
Unix timestamp (in seconds) when the file was created.
formatunixtime
[](<#(resource) containers.files > (model) file_create_response > (schema) > (property) created_at>)
object: :"container.file"
The type of this object (`container.file`).
[](<#(resource) containers.files > (model) file_create_response > (schema) > (property) object>)
path: String
Path of the file in the container.
[](<#(resource) containers.files > (model) file_create_response > (schema) > (property) path>)
source: String
Source of the file (e.g., `user`, `assistant`).
[](<#(resource) containers.files > (model) file_create_response > (schema) > (property) source>)
[](<#(resource) containers.files > (model) file_create_response > (schema)>)
class FileRetrieveResponse { id, bytes, container\_id, 4 more }
id: String
Unique identifier for the file.
[](<#(resource) containers.files > (model) file_retrieve_response > (schema) > (property) id>)
bytes: Integer
Size of the file in bytes.
[](<#(resource) containers.files > (model) file_retrieve_response > (schema) > (property) bytes>)
container\_id: String
The container this file belongs to.
[](<#(resource) containers.files > (model) file_retrieve_response > (schema) > (property) container_id>)
created\_at: Integer
Unix timestamp (in seconds) when the file was created.
formatunixtime
[](<#(resource) containers.files > (model) file_retrieve_response > (schema) > (property) created_at>)
object: :"container.file"
The type of this object (`container.file`).
[](<#(resource) containers.files > (model) file_retrieve_response > (schema) > (property) object>)
path: String
Path of the file in the container.
[](<#(resource) containers.files > (model) file_retrieve_response > (schema) > (property) path>)
source: String
Source of the file (e.g., `user`, `assistant`).
[](<#(resource) containers.files > (model) file_retrieve_response > (schema) > (property) source>)
[](<#(resource) containers.files > (model) file_retrieve_response > (schema)>)
#### FilesContent
##### [Retrieve container file content](/api/reference/ruby/resources/containers/subresources/files/subresources/content/methods/retrieve)
containers.files.content.retrieve(file\_id, \*\*kwargs) -\> StringIO
GET/containers/{container\_id}/files/{file\_id}/content