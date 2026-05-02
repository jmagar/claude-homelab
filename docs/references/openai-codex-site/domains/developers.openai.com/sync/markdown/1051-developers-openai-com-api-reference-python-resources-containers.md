Containers | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Containers
##### [List containers](/api/reference/python/resources/containers/methods/list)
containers.list(ContainerListParams\*\*kwargs) -\> SyncCursorPage[[ContainerListResponse](</api/reference/python/resources/containers#(resource) containers > (model) container_list_response > (schema)>)]
GET/containers
##### [Create container](/api/reference/python/resources/containers/methods/create)
containers.create(ContainerCreateParams\*\*kwargs) -\> [ContainerCreateResponse](</api/reference/python/resources/containers#(resource) containers > (model) container_create_response > (schema)>)
POST/containers
##### [Retrieve container](/api/reference/python/resources/containers/methods/retrieve)
containers.retrieve(strcontainer\_id) -\> [ContainerRetrieveResponse](</api/reference/python/resources/containers#(resource) containers > (model) container_retrieve_response > (schema)>)
GET/containers/{container\_id}
##### [Delete a container](/api/reference/python/resources/containers/methods/delete)
containers.delete(strcontainer\_id)
DELETE/containers/{container\_id}
##### ModelsExpand Collapse
class ContainerListResponse: …
id: str
Unique identifier for the container.
[](<#(resource) containers > (model) container_list_response > (schema) > (property) id>)
created\_at: int
Unix timestamp (in seconds) when the container was created.
formatunixtime
[](<#(resource) containers > (model) container_list_response > (schema) > (property) created_at>)
name: str
Name of the container.
[](<#(resource) containers > (model) container_list_response > (schema) > (property) name>)
object: str
The type of this object.
[](<#(resource) containers > (model) container_list_response > (schema) > (property) object>)
status: str
Status of the container (e.g., active, deleted).
[](<#(resource) containers > (model) container_list_response > (schema) > (property) status>)
expires\_after: Optional[ExpiresAfter]
The container will expire after this time period.
The anchor is the reference point for the expiration.
The minutes is the number of minutes after the anchor before the container expires.
anchor: Optional[Literal["last\_active\_at"]]
The reference point for the expiration.
[](<#(resource) containers > (model) container_list_response > (schema) > (property) expires_after > (property) anchor>)
minutes: Optional[int]
The number of minutes after the anchor before the container expires.
[](<#(resource) containers > (model) container_list_response > (schema) > (property) expires_after > (property) minutes>)
[](<#(resource) containers > (model) container_list_response > (schema) > (property) expires_after>)
last\_active\_at: Optional[int]
Unix timestamp (in seconds) when the container was last active.
formatunixtime
[](<#(resource) containers > (model) container_list_response > (schema) > (property) last_active_at>)
memory\_limit: Optional[Literal["1g", "4g", "16g", "64g"]]
The memory limit configured for the container.
One of the following:
"1g"
[](<#(resource) containers > (model) container_list_response > (schema) > (property) memory_limit > (member) 0>)
"4g"
[](<#(resource) containers > (model) container_list_response > (schema) > (property) memory_limit > (member) 1>)
"16g"
[](<#(resource) containers > (model) container_list_response > (schema) > (property) memory_limit > (member) 2>)
"64g"
[](<#(resource) containers > (model) container_list_response > (schema) > (property) memory_limit > (member) 3>)
[](<#(resource) containers > (model) container_list_response > (schema) > (property) memory_limit>)
network\_policy: Optional[NetworkPolicy]
Network access policy for the container.
type: Literal["allowlist", "disabled"]
The network policy mode.
One of the following:
"allowlist"
[](<#(resource) containers > (model) container_list_response > (schema) > (property) network_policy > (property) type > (member) 0>)
"disabled"
[](<#(resource) containers > (model) container_list_response > (schema) > (property) network_policy > (property) type > (member) 1>)
[](<#(resource) containers > (model) container_list_response > (schema) > (property) network_policy > (property) type>)
allowed\_domains: Optional[List[str]]
Allowed outbound domains when `type` is `allowlist`.
[](<#(resource) containers > (model) container_list_response > (schema) > (property) network_policy > (property) allowed_domains>)
[](<#(resource) containers > (model) container_list_response > (schema) > (property) network_policy>)
[](<#(resource) containers > (model) container_list_response > (schema)>)
class ContainerCreateResponse: …
id: str
Unique identifier for the container.
[](<#(resource) containers > (model) container_create_response > (schema) > (property) id>)
created\_at: int
Unix timestamp (in seconds) when the container was created.
formatunixtime
[](<#(resource) containers > (model) container_create_response > (schema) > (property) created_at>)
name: str
Name of the container.
[](<#(resource) containers > (model) container_create_response > (schema) > (property) name>)
object: str
The type of this object.
[](<#(resource) containers > (model) container_create_response > (schema) > (property) object>)
status: str
Status of the container (e.g., active, deleted).
[](<#(resource) containers > (model) container_create_response > (schema) > (property) status>)
expires\_after: Optional[ExpiresAfter]
The container will expire after this time period.
The anchor is the reference point for the expiration.
The minutes is the number of minutes after the anchor before the container expires.
anchor: Optional[Literal["last\_active\_at"]]
The reference point for the expiration.
[](<#(resource) containers > (model) container_create_response > (schema) > (property) expires_after > (property) anchor>)
minutes: Optional[int]
The number of minutes after the anchor before the container expires.
[](<#(resource) containers > (model) container_create_response > (schema) > (property) expires_after > (property) minutes>)
[](<#(resource) containers > (model) container_create_response > (schema) > (property) expires_after>)
last\_active\_at: Optional[int]
Unix timestamp (in seconds) when the container was last active.
formatunixtime
[](<#(resource) containers > (model) container_create_response > (schema) > (property) last_active_at>)
memory\_limit: Optional[Literal["1g", "4g", "16g", "64g"]]
The memory limit configured for the container.
One of the following:
"1g"
[](<#(resource) containers > (model) container_create_response > (schema) > (property) memory_limit > (member) 0>)
"4g"
[](<#(resource) containers > (model) container_create_response > (schema) > (property) memory_limit > (member) 1>)
"16g"
[](<#(resource) containers > (model) container_create_response > (schema) > (property) memory_limit > (member) 2>)
"64g"
[](<#(resource) containers > (model) container_create_response > (schema) > (property) memory_limit > (member) 3>)
[](<#(resource) containers > (model) container_create_response > (schema) > (property) memory_limit>)
network\_policy: Optional[NetworkPolicy]
Network access policy for the container.
type: Literal["allowlist", "disabled"]
The network policy mode.
One of the following:
"allowlist"
[](<#(resource) containers > (model) container_create_response > (schema) > (property) network_policy > (property) type > (member) 0>)
"disabled"
[](<#(resource) containers > (model) container_create_response > (schema) > (property) network_policy > (property) type > (member) 1>)
[](<#(resource) containers > (model) container_create_response > (schema) > (property) network_policy > (property) type>)
allowed\_domains: Optional[List[str]]
Allowed outbound domains when `type` is `allowlist`.
[](<#(resource) containers > (model) container_create_response > (schema) > (property) network_policy > (property) allowed_domains>)
[](<#(resource) containers > (model) container_create_response > (schema) > (property) network_policy>)
[](<#(resource) containers > (model) container_create_response > (schema)>)
class ContainerRetrieveResponse: …
id: str
Unique identifier for the container.
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) id>)
created\_at: int
Unix timestamp (in seconds) when the container was created.
formatunixtime
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) created_at>)
name: str
Name of the container.
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) name>)
object: str
The type of this object.
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) object>)
status: str
Status of the container (e.g., active, deleted).
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) status>)
expires\_after: Optional[ExpiresAfter]
The container will expire after this time period.
The anchor is the reference point for the expiration.
The minutes is the number of minutes after the anchor before the container expires.
anchor: Optional[Literal["last\_active\_at"]]
The reference point for the expiration.
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) expires_after > (property) anchor>)
minutes: Optional[int]
The number of minutes after the anchor before the container expires.
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) expires_after > (property) minutes>)
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) expires_after>)
last\_active\_at: Optional[int]
Unix timestamp (in seconds) when the container was last active.
formatunixtime
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) last_active_at>)
memory\_limit: Optional[Literal["1g", "4g", "16g", "64g"]]
The memory limit configured for the container.
One of the following:
"1g"
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) memory_limit > (member) 0>)
"4g"
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) memory_limit > (member) 1>)
"16g"
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) memory_limit > (member) 2>)
"64g"
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) memory_limit > (member) 3>)
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) memory_limit>)
network\_policy: Optional[NetworkPolicy]
Network access policy for the container.
type: Literal["allowlist", "disabled"]
The network policy mode.
One of the following:
"allowlist"
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) network_policy > (property) type > (member) 0>)
"disabled"
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) network_policy > (property) type > (member) 1>)
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) network_policy > (property) type>)
allowed\_domains: Optional[List[str]]
Allowed outbound domains when `type` is `allowlist`.
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) network_policy > (property) allowed_domains>)
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) network_policy>)
[](<#(resource) containers > (model) container_retrieve_response > (schema)>)
#### ContainersFiles
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
#### ContainersFilesContent
##### [Retrieve container file content](/api/reference/python/resources/containers/subresources/files/subresources/content/methods/retrieve)
containers.files.content.retrieve(strfile\_id, ContentRetrieveParams\*\*kwargs) -\> BinaryResponseContent
GET/containers/{container\_id}/files/{file\_id}/content