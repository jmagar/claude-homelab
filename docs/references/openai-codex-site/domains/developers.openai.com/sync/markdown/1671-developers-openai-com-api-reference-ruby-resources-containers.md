Containers | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Containers
##### [List containers](/api/reference/ruby/resources/containers/methods/list)
containers.list(\*\*kwargs) -\> CursorPage\<[ContainerListResponse](</api/reference/ruby/resources/containers#(resource) containers > (model) container_list_response > (schema)>) { id, created\_at, name, 6 more } \>
GET/containers
##### [Create container](/api/reference/ruby/resources/containers/methods/create)
containers.create(\*\*kwargs) -\> [ContainerCreateResponse](</api/reference/ruby/resources/containers#(resource) containers > (model) container_create_response > (schema)>) { id, created\_at, name, 6 more }
POST/containers
##### [Retrieve container](/api/reference/ruby/resources/containers/methods/retrieve)
containers.retrieve(container\_id) -\> [ContainerRetrieveResponse](</api/reference/ruby/resources/containers#(resource) containers > (model) container_retrieve_response > (schema)>) { id, created\_at, name, 6 more }
GET/containers/{container\_id}
##### [Delete a container](/api/reference/ruby/resources/containers/methods/delete)
containers.delete(container\_id) -\> void
DELETE/containers/{container\_id}
##### ModelsExpand Collapse
class ContainerListResponse { id, created\_at, name, 6 more }
id: String
Unique identifier for the container.
[](<#(resource) containers > (model) container_list_response > (schema) > (property) id>)
created\_at: Integer
Unix timestamp (in seconds) when the container was created.
formatunixtime
[](<#(resource) containers > (model) container_list_response > (schema) > (property) created_at>)
name: String
Name of the container.
[](<#(resource) containers > (model) container_list_response > (schema) > (property) name>)
object: String
The type of this object.
[](<#(resource) containers > (model) container_list_response > (schema) > (property) object>)
status: String
Status of the container (e.g., active, deleted).
[](<#(resource) containers > (model) container_list_response > (schema) > (property) status>)
expires\_after: ExpiresAfter{ anchor, minutes}
The container will expire after this time period.
The anchor is the reference point for the expiration.
The minutes is the number of minutes after the anchor before the container expires.
anchor: :last\_active\_at
The reference point for the expiration.
[](<#(resource) containers > (model) container_list_response > (schema) > (property) expires_after > (property) anchor>)
minutes: Integer
The number of minutes after the anchor before the container expires.
[](<#(resource) containers > (model) container_list_response > (schema) > (property) expires_after > (property) minutes>)
[](<#(resource) containers > (model) container_list_response > (schema) > (property) expires_after>)
last\_active\_at: Integer
Unix timestamp (in seconds) when the container was last active.
formatunixtime
[](<#(resource) containers > (model) container_list_response > (schema) > (property) last_active_at>)
memory\_limit: :"1g" | :"4g" | :"16g" | :"64g"
The memory limit configured for the container.
One of the following:
:"1g"
[](<#(resource) containers > (model) container_list_response > (schema) > (property) memory_limit > (member) 0>)
:"4g"
[](<#(resource) containers > (model) container_list_response > (schema) > (property) memory_limit > (member) 1>)
:"16g"
[](<#(resource) containers > (model) container_list_response > (schema) > (property) memory_limit > (member) 2>)
:"64g"
[](<#(resource) containers > (model) container_list_response > (schema) > (property) memory_limit > (member) 3>)
[](<#(resource) containers > (model) container_list_response > (schema) > (property) memory_limit>)
network\_policy: NetworkPolicy{ type, allowed\_domains}
Network access policy for the container.
type: :allowlist | :disabled
The network policy mode.
One of the following:
:allowlist
[](<#(resource) containers > (model) container_list_response > (schema) > (property) network_policy > (property) type > (member) 0>)
:disabled
[](<#(resource) containers > (model) container_list_response > (schema) > (property) network_policy > (property) type > (member) 1>)
[](<#(resource) containers > (model) container_list_response > (schema) > (property) network_policy > (property) type>)
allowed\_domains: Array[String]
Allowed outbound domains when `type` is `allowlist`.
[](<#(resource) containers > (model) container_list_response > (schema) > (property) network_policy > (property) allowed_domains>)
[](<#(resource) containers > (model) container_list_response > (schema) > (property) network_policy>)
[](<#(resource) containers > (model) container_list_response > (schema)>)
class ContainerCreateResponse { id, created\_at, name, 6 more }
id: String
Unique identifier for the container.
[](<#(resource) containers > (model) container_create_response > (schema) > (property) id>)
created\_at: Integer
Unix timestamp (in seconds) when the container was created.
formatunixtime
[](<#(resource) containers > (model) container_create_response > (schema) > (property) created_at>)
name: String
Name of the container.
[](<#(resource) containers > (model) container_create_response > (schema) > (property) name>)
object: String
The type of this object.
[](<#(resource) containers > (model) container_create_response > (schema) > (property) object>)
status: String
Status of the container (e.g., active, deleted).
[](<#(resource) containers > (model) container_create_response > (schema) > (property) status>)
expires\_after: ExpiresAfter{ anchor, minutes}
The container will expire after this time period.
The anchor is the reference point for the expiration.
The minutes is the number of minutes after the anchor before the container expires.
anchor: :last\_active\_at
The reference point for the expiration.
[](<#(resource) containers > (model) container_create_response > (schema) > (property) expires_after > (property) anchor>)
minutes: Integer
The number of minutes after the anchor before the container expires.
[](<#(resource) containers > (model) container_create_response > (schema) > (property) expires_after > (property) minutes>)
[](<#(resource) containers > (model) container_create_response > (schema) > (property) expires_after>)
last\_active\_at: Integer
Unix timestamp (in seconds) when the container was last active.
formatunixtime
[](<#(resource) containers > (model) container_create_response > (schema) > (property) last_active_at>)
memory\_limit: :"1g" | :"4g" | :"16g" | :"64g"
The memory limit configured for the container.
One of the following:
:"1g"
[](<#(resource) containers > (model) container_create_response > (schema) > (property) memory_limit > (member) 0>)
:"4g"
[](<#(resource) containers > (model) container_create_response > (schema) > (property) memory_limit > (member) 1>)
:"16g"
[](<#(resource) containers > (model) container_create_response > (schema) > (property) memory_limit > (member) 2>)
:"64g"
[](<#(resource) containers > (model) container_create_response > (schema) > (property) memory_limit > (member) 3>)
[](<#(resource) containers > (model) container_create_response > (schema) > (property) memory_limit>)
network\_policy: NetworkPolicy{ type, allowed\_domains}
Network access policy for the container.
type: :allowlist | :disabled
The network policy mode.
One of the following:
:allowlist
[](<#(resource) containers > (model) container_create_response > (schema) > (property) network_policy > (property) type > (member) 0>)
:disabled
[](<#(resource) containers > (model) container_create_response > (schema) > (property) network_policy > (property) type > (member) 1>)
[](<#(resource) containers > (model) container_create_response > (schema) > (property) network_policy > (property) type>)
allowed\_domains: Array[String]
Allowed outbound domains when `type` is `allowlist`.
[](<#(resource) containers > (model) container_create_response > (schema) > (property) network_policy > (property) allowed_domains>)
[](<#(resource) containers > (model) container_create_response > (schema) > (property) network_policy>)
[](<#(resource) containers > (model) container_create_response > (schema)>)
class ContainerRetrieveResponse { id, created\_at, name, 6 more }
id: String
Unique identifier for the container.
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) id>)
created\_at: Integer
Unix timestamp (in seconds) when the container was created.
formatunixtime
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) created_at>)
name: String
Name of the container.
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) name>)
object: String
The type of this object.
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) object>)
status: String
Status of the container (e.g., active, deleted).
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) status>)
expires\_after: ExpiresAfter{ anchor, minutes}
The container will expire after this time period.
The anchor is the reference point for the expiration.
The minutes is the number of minutes after the anchor before the container expires.
anchor: :last\_active\_at
The reference point for the expiration.
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) expires_after > (property) anchor>)
minutes: Integer
The number of minutes after the anchor before the container expires.
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) expires_after > (property) minutes>)
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) expires_after>)
last\_active\_at: Integer
Unix timestamp (in seconds) when the container was last active.
formatunixtime
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) last_active_at>)
memory\_limit: :"1g" | :"4g" | :"16g" | :"64g"
The memory limit configured for the container.
One of the following:
:"1g"
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) memory_limit > (member) 0>)
:"4g"
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) memory_limit > (member) 1>)
:"16g"
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) memory_limit > (member) 2>)
:"64g"
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) memory_limit > (member) 3>)
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) memory_limit>)
network\_policy: NetworkPolicy{ type, allowed\_domains}
Network access policy for the container.
type: :allowlist | :disabled
The network policy mode.
One of the following:
:allowlist
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) network_policy > (property) type > (member) 0>)
:disabled
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) network_policy > (property) type > (member) 1>)
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) network_policy > (property) type>)
allowed\_domains: Array[String]
Allowed outbound domains when `type` is `allowlist`.
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) network_policy > (property) allowed_domains>)
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) network_policy>)
[](<#(resource) containers > (model) container_retrieve_response > (schema)>)
#### ContainersFiles
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
#### ContainersFilesContent
##### [Retrieve container file content](/api/reference/ruby/resources/containers/subresources/files/subresources/content/methods/retrieve)
containers.files.content.retrieve(file\_id, \*\*kwargs) -\> StringIO
GET/containers/{container\_id}/files/{file\_id}/content