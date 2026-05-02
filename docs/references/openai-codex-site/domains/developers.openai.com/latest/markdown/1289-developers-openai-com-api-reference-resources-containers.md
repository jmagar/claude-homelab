Containers | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Containers
##### [List containers](/api/reference/resources/containers/methods/list)
GET/containers
##### [Create container](/api/reference/resources/containers/methods/create)
POST/containers
##### [Retrieve container](/api/reference/resources/containers/methods/retrieve)
GET/containers/{container\_id}
##### [Delete a container](/api/reference/resources/containers/methods/delete)
DELETE/containers/{container\_id}
##### ModelsExpand Collapse
ContainerListResponse object { id, created\_at, name, 6 more }
id: string
Unique identifier for the container.
[](<#(resource) containers > (model) container_list_response > (schema) > (property) id>)
created\_at: number
Unix timestamp (in seconds) when the container was created.
formatunixtime
[](<#(resource) containers > (model) container_list_response > (schema) > (property) created_at>)
name: string
Name of the container.
[](<#(resource) containers > (model) container_list_response > (schema) > (property) name>)
object: string
The type of this object.
[](<#(resource) containers > (model) container_list_response > (schema) > (property) object>)
status: string
Status of the container (e.g., active, deleted).
[](<#(resource) containers > (model) container_list_response > (schema) > (property) status>)
expires\_after: optional object { anchor, minutes }
The container will expire after this time period.
The anchor is the reference point for the expiration.
The minutes is the number of minutes after the anchor before the container expires.
anchor: optional "last\_active\_at"
The reference point for the expiration.
[](<#(resource) containers > (model) container_list_response > (schema) > (property) expires_after > (property) anchor>)
minutes: optional number
The number of minutes after the anchor before the container expires.
[](<#(resource) containers > (model) container_list_response > (schema) > (property) expires_after > (property) minutes>)
[](<#(resource) containers > (model) container_list_response > (schema) > (property) expires_after>)
last\_active\_at: optional number
Unix timestamp (in seconds) when the container was last active.
formatunixtime
[](<#(resource) containers > (model) container_list_response > (schema) > (property) last_active_at>)
memory\_limit: optional "1g" or "4g" or "16g" or "64g"
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
network\_policy: optional object { type, allowed\_domains }
Network access policy for the container.
type: "allowlist" or "disabled"
The network policy mode.
One of the following:
"allowlist"
[](<#(resource) containers > (model) container_list_response > (schema) > (property) network_policy > (property) type > (member) 0>)
"disabled"
[](<#(resource) containers > (model) container_list_response > (schema) > (property) network_policy > (property) type > (member) 1>)
[](<#(resource) containers > (model) container_list_response > (schema) > (property) network_policy > (property) type>)
allowed\_domains: optional array of string
Allowed outbound domains when `type` is `allowlist`.
[](<#(resource) containers > (model) container_list_response > (schema) > (property) network_policy > (property) allowed_domains>)
[](<#(resource) containers > (model) container_list_response > (schema) > (property) network_policy>)
[](<#(resource) containers > (model) container_list_response > (schema)>)
ContainerCreateResponse object { id, created\_at, name, 6 more }
id: string
Unique identifier for the container.
[](<#(resource) containers > (model) container_create_response > (schema) > (property) id>)
created\_at: number
Unix timestamp (in seconds) when the container was created.
formatunixtime
[](<#(resource) containers > (model) container_create_response > (schema) > (property) created_at>)
name: string
Name of the container.
[](<#(resource) containers > (model) container_create_response > (schema) > (property) name>)
object: string
The type of this object.
[](<#(resource) containers > (model) container_create_response > (schema) > (property) object>)
status: string
Status of the container (e.g., active, deleted).
[](<#(resource) containers > (model) container_create_response > (schema) > (property) status>)
expires\_after: optional object { anchor, minutes }
The container will expire after this time period.
The anchor is the reference point for the expiration.
The minutes is the number of minutes after the anchor before the container expires.
anchor: optional "last\_active\_at"
The reference point for the expiration.
[](<#(resource) containers > (model) container_create_response > (schema) > (property) expires_after > (property) anchor>)
minutes: optional number
The number of minutes after the anchor before the container expires.
[](<#(resource) containers > (model) container_create_response > (schema) > (property) expires_after > (property) minutes>)
[](<#(resource) containers > (model) container_create_response > (schema) > (property) expires_after>)
last\_active\_at: optional number
Unix timestamp (in seconds) when the container was last active.
formatunixtime
[](<#(resource) containers > (model) container_create_response > (schema) > (property) last_active_at>)
memory\_limit: optional "1g" or "4g" or "16g" or "64g"
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
network\_policy: optional object { type, allowed\_domains }
Network access policy for the container.
type: "allowlist" or "disabled"
The network policy mode.
One of the following:
"allowlist"
[](<#(resource) containers > (model) container_create_response > (schema) > (property) network_policy > (property) type > (member) 0>)
"disabled"
[](<#(resource) containers > (model) container_create_response > (schema) > (property) network_policy > (property) type > (member) 1>)
[](<#(resource) containers > (model) container_create_response > (schema) > (property) network_policy > (property) type>)
allowed\_domains: optional array of string
Allowed outbound domains when `type` is `allowlist`.
[](<#(resource) containers > (model) container_create_response > (schema) > (property) network_policy > (property) allowed_domains>)
[](<#(resource) containers > (model) container_create_response > (schema) > (property) network_policy>)
[](<#(resource) containers > (model) container_create_response > (schema)>)
ContainerRetrieveResponse object { id, created\_at, name, 6 more }
id: string
Unique identifier for the container.
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) id>)
created\_at: number
Unix timestamp (in seconds) when the container was created.
formatunixtime
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) created_at>)
name: string
Name of the container.
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) name>)
object: string
The type of this object.
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) object>)
status: string
Status of the container (e.g., active, deleted).
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) status>)
expires\_after: optional object { anchor, minutes }
The container will expire after this time period.
The anchor is the reference point for the expiration.
The minutes is the number of minutes after the anchor before the container expires.
anchor: optional "last\_active\_at"
The reference point for the expiration.
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) expires_after > (property) anchor>)
minutes: optional number
The number of minutes after the anchor before the container expires.
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) expires_after > (property) minutes>)
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) expires_after>)
last\_active\_at: optional number
Unix timestamp (in seconds) when the container was last active.
formatunixtime
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) last_active_at>)
memory\_limit: optional "1g" or "4g" or "16g" or "64g"
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
network\_policy: optional object { type, allowed\_domains }
Network access policy for the container.
type: "allowlist" or "disabled"
The network policy mode.
One of the following:
"allowlist"
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) network_policy > (property) type > (member) 0>)
"disabled"
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) network_policy > (property) type > (member) 1>)
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) network_policy > (property) type>)
allowed\_domains: optional array of string
Allowed outbound domains when `type` is `allowlist`.
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) network_policy > (property) allowed_domains>)
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) network_policy>)
[](<#(resource) containers > (model) container_retrieve_response > (schema)>)
#### ContainersFiles
##### [List container files](/api/reference/resources/containers/subresources/files/methods/list)
GET/containers/{container\_id}/files
##### [Create container file](/api/reference/resources/containers/subresources/files/methods/create)
POST/containers/{container\_id}/files
##### [Retrieve container file](/api/reference/resources/containers/subresources/files/methods/retrieve)
GET/containers/{container\_id}/files/{file\_id}
##### [Delete a container file](/api/reference/resources/containers/subresources/files/methods/delete)
DELETE/containers/{container\_id}/files/{file\_id}
##### ModelsExpand Collapse
FileListResponse object { id, bytes, container\_id, 4 more }
id: string
Unique identifier for the file.
[](<#(resource) containers.files > (model) file_list_response > (schema) > (property) id>)
bytes: number
Size of the file in bytes.
[](<#(resource) containers.files > (model) file_list_response > (schema) > (property) bytes>)
container\_id: string
The container this file belongs to.
[](<#(resource) containers.files > (model) file_list_response > (schema) > (property) container_id>)
created\_at: number
Unix timestamp (in seconds) when the file was created.
formatunixtime
[](<#(resource) containers.files > (model) file_list_response > (schema) > (property) created_at>)
object: string
The type of this object (`container.file`).
[](<#(resource) containers.files > (model) file_list_response > (schema) > (property) object>)
path: string
Path of the file in the container.
[](<#(resource) containers.files > (model) file_list_response > (schema) > (property) path>)
source: string
Source of the file (e.g., `user`, `assistant`).
[](<#(resource) containers.files > (model) file_list_response > (schema) > (property) source>)
[](<#(resource) containers.files > (model) file_list_response > (schema)>)
FileCreateResponse object { id, bytes, container\_id, 4 more }
id: string
Unique identifier for the file.
[](<#(resource) containers.files > (model) file_create_response > (schema) > (property) id>)
bytes: number
Size of the file in bytes.
[](<#(resource) containers.files > (model) file_create_response > (schema) > (property) bytes>)
container\_id: string
The container this file belongs to.
[](<#(resource) containers.files > (model) file_create_response > (schema) > (property) container_id>)
created\_at: number
Unix timestamp (in seconds) when the file was created.
formatunixtime
[](<#(resource) containers.files > (model) file_create_response > (schema) > (property) created_at>)
object: string
The type of this object (`container.file`).
[](<#(resource) containers.files > (model) file_create_response > (schema) > (property) object>)
path: string
Path of the file in the container.
[](<#(resource) containers.files > (model) file_create_response > (schema) > (property) path>)
source: string
Source of the file (e.g., `user`, `assistant`).
[](<#(resource) containers.files > (model) file_create_response > (schema) > (property) source>)
[](<#(resource) containers.files > (model) file_create_response > (schema)>)
FileRetrieveResponse object { id, bytes, container\_id, 4 more }
id: string
Unique identifier for the file.
[](<#(resource) containers.files > (model) file_retrieve_response > (schema) > (property) id>)
bytes: number
Size of the file in bytes.
[](<#(resource) containers.files > (model) file_retrieve_response > (schema) > (property) bytes>)
container\_id: string
The container this file belongs to.
[](<#(resource) containers.files > (model) file_retrieve_response > (schema) > (property) container_id>)
created\_at: number
Unix timestamp (in seconds) when the file was created.
formatunixtime
[](<#(resource) containers.files > (model) file_retrieve_response > (schema) > (property) created_at>)
object: string
The type of this object (`container.file`).
[](<#(resource) containers.files > (model) file_retrieve_response > (schema) > (property) object>)
path: string
Path of the file in the container.
[](<#(resource) containers.files > (model) file_retrieve_response > (schema) > (property) path>)
source: string
Source of the file (e.g., `user`, `assistant`).
[](<#(resource) containers.files > (model) file_retrieve_response > (schema) > (property) source>)
[](<#(resource) containers.files > (model) file_retrieve_response > (schema)>)
#### ContainersFilesContent
##### [Retrieve container file content](/api/reference/resources/containers/subresources/files/subresources/content/methods/retrieve)
GET/containers/{container\_id}/files/{file\_id}/content