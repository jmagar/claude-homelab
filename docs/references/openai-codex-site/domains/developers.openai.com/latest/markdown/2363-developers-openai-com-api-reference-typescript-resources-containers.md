Containers | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Containers
##### [List containers](/api/reference/typescript/resources/containers/methods/list)
client.containers.list(ContainerListParams { after, limit, name, order } query?, RequestOptionsoptions?): CursorPage\<[ContainerListResponse](</api/reference/typescript/resources/containers#(resource) containers > (model) container_list_response > (schema)>) { id, created\_at, name, 6 more } \>
GET/containers
##### [Create container](/api/reference/typescript/resources/containers/methods/create)
client.containers.create(ContainerCreateParams { name, expires\_after, file\_ids, 3 more } body, RequestOptionsoptions?): [ContainerCreateResponse](</api/reference/typescript/resources/containers#(resource) containers > (model) container_create_response > (schema)>) { id, created\_at, name, 6 more }
POST/containers
##### [Retrieve container](/api/reference/typescript/resources/containers/methods/retrieve)
client.containers.retrieve(stringcontainerID, RequestOptionsoptions?): [ContainerRetrieveResponse](</api/reference/typescript/resources/containers#(resource) containers > (model) container_retrieve_response > (schema)>) { id, created\_at, name, 6 more }
GET/containers/{container\_id}
##### [Delete a container](/api/reference/typescript/resources/containers/methods/delete)
client.containers.delete(stringcontainerID, RequestOptionsoptions?): void
DELETE/containers/{container\_id}
##### ModelsExpand Collapse
ContainerListResponse { id, created\_at, name, 6 more }
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
expires\_after?: ExpiresAfter { anchor, minutes }
The container will expire after this time period.
The anchor is the reference point for the expiration.
The minutes is the number of minutes after the anchor before the container expires.
anchor?: "last\_active\_at"
The reference point for the expiration.
[](<#(resource) containers > (model) container_list_response > (schema) > (property) expires_after > (property) anchor>)
minutes?: number
The number of minutes after the anchor before the container expires.
[](<#(resource) containers > (model) container_list_response > (schema) > (property) expires_after > (property) minutes>)
[](<#(resource) containers > (model) container_list_response > (schema) > (property) expires_after>)
last\_active\_at?: number
Unix timestamp (in seconds) when the container was last active.
formatunixtime
[](<#(resource) containers > (model) container_list_response > (schema) > (property) last_active_at>)
memory\_limit?: "1g" | "4g" | "16g" | "64g"
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
network\_policy?: NetworkPolicy { type, allowed\_domains }
Network access policy for the container.
type: "allowlist" | "disabled"
The network policy mode.
One of the following:
"allowlist"
[](<#(resource) containers > (model) container_list_response > (schema) > (property) network_policy > (property) type > (member) 0>)
"disabled"
[](<#(resource) containers > (model) container_list_response > (schema) > (property) network_policy > (property) type > (member) 1>)
[](<#(resource) containers > (model) container_list_response > (schema) > (property) network_policy > (property) type>)
allowed\_domains?: Array\<string\>
Allowed outbound domains when `type` is `allowlist`.
[](<#(resource) containers > (model) container_list_response > (schema) > (property) network_policy > (property) allowed_domains>)
[](<#(resource) containers > (model) container_list_response > (schema) > (property) network_policy>)
[](<#(resource) containers > (model) container_list_response > (schema)>)
ContainerCreateResponse { id, created\_at, name, 6 more }
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
expires\_after?: ExpiresAfter { anchor, minutes }
The container will expire after this time period.
The anchor is the reference point for the expiration.
The minutes is the number of minutes after the anchor before the container expires.
anchor?: "last\_active\_at"
The reference point for the expiration.
[](<#(resource) containers > (model) container_create_response > (schema) > (property) expires_after > (property) anchor>)
minutes?: number
The number of minutes after the anchor before the container expires.
[](<#(resource) containers > (model) container_create_response > (schema) > (property) expires_after > (property) minutes>)
[](<#(resource) containers > (model) container_create_response > (schema) > (property) expires_after>)
last\_active\_at?: number
Unix timestamp (in seconds) when the container was last active.
formatunixtime
[](<#(resource) containers > (model) container_create_response > (schema) > (property) last_active_at>)
memory\_limit?: "1g" | "4g" | "16g" | "64g"
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
network\_policy?: NetworkPolicy { type, allowed\_domains }
Network access policy for the container.
type: "allowlist" | "disabled"
The network policy mode.
One of the following:
"allowlist"
[](<#(resource) containers > (model) container_create_response > (schema) > (property) network_policy > (property) type > (member) 0>)
"disabled"
[](<#(resource) containers > (model) container_create_response > (schema) > (property) network_policy > (property) type > (member) 1>)
[](<#(resource) containers > (model) container_create_response > (schema) > (property) network_policy > (property) type>)
allowed\_domains?: Array\<string\>
Allowed outbound domains when `type` is `allowlist`.
[](<#(resource) containers > (model) container_create_response > (schema) > (property) network_policy > (property) allowed_domains>)
[](<#(resource) containers > (model) container_create_response > (schema) > (property) network_policy>)
[](<#(resource) containers > (model) container_create_response > (schema)>)
ContainerRetrieveResponse { id, created\_at, name, 6 more }
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
expires\_after?: ExpiresAfter { anchor, minutes }
The container will expire after this time period.
The anchor is the reference point for the expiration.
The minutes is the number of minutes after the anchor before the container expires.
anchor?: "last\_active\_at"
The reference point for the expiration.
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) expires_after > (property) anchor>)
minutes?: number
The number of minutes after the anchor before the container expires.
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) expires_after > (property) minutes>)
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) expires_after>)
last\_active\_at?: number
Unix timestamp (in seconds) when the container was last active.
formatunixtime
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) last_active_at>)
memory\_limit?: "1g" | "4g" | "16g" | "64g"
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
network\_policy?: NetworkPolicy { type, allowed\_domains }
Network access policy for the container.
type: "allowlist" | "disabled"
The network policy mode.
One of the following:
"allowlist"
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) network_policy > (property) type > (member) 0>)
"disabled"
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) network_policy > (property) type > (member) 1>)
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) network_policy > (property) type>)
allowed\_domains?: Array\<string\>
Allowed outbound domains when `type` is `allowlist`.
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) network_policy > (property) allowed_domains>)
[](<#(resource) containers > (model) container_retrieve_response > (schema) > (property) network_policy>)
[](<#(resource) containers > (model) container_retrieve_response > (schema)>)
#### ContainersFiles
##### [List container files](/api/reference/typescript/resources/containers/subresources/files/methods/list)
client.containers.files.list(stringcontainerID, FileListParams { after, limit, order } query?, RequestOptionsoptions?): CursorPage\<[FileListResponse](</api/reference/typescript/resources/containers#(resource) containers.files > (model) file_list_response > (schema)>) { id, bytes, container\_id, 4 more } \>
GET/containers/{container\_id}/files
##### [Create container file](/api/reference/typescript/resources/containers/subresources/files/methods/create)
client.containers.files.create(stringcontainerID, FileCreateParams { file, file\_id } body, RequestOptionsoptions?): [FileCreateResponse](</api/reference/typescript/resources/containers#(resource) containers.files > (model) file_create_response > (schema)>) { id, bytes, container\_id, 4 more }
POST/containers/{container\_id}/files
##### [Retrieve container file](/api/reference/typescript/resources/containers/subresources/files/methods/retrieve)
client.containers.files.retrieve(stringfileID, FileRetrieveParams { container\_id } params, RequestOptionsoptions?): [FileRetrieveResponse](</api/reference/typescript/resources/containers#(resource) containers.files > (model) file_retrieve_response > (schema)>) { id, bytes, container\_id, 4 more }
GET/containers/{container\_id}/files/{file\_id}
##### [Delete a container file](/api/reference/typescript/resources/containers/subresources/files/methods/delete)
client.containers.files.delete(stringfileID, FileDeleteParams { container\_id } params, RequestOptionsoptions?): void
DELETE/containers/{container\_id}/files/{file\_id}
##### ModelsExpand Collapse
FileListResponse { id, bytes, container\_id, 4 more }
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
object: "container.file"
The type of this object (`container.file`).
[](<#(resource) containers.files > (model) file_list_response > (schema) > (property) object>)
path: string
Path of the file in the container.
[](<#(resource) containers.files > (model) file_list_response > (schema) > (property) path>)
source: string
Source of the file (e.g., `user`, `assistant`).
[](<#(resource) containers.files > (model) file_list_response > (schema) > (property) source>)
[](<#(resource) containers.files > (model) file_list_response > (schema)>)
FileCreateResponse { id, bytes, container\_id, 4 more }
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
object: "container.file"
The type of this object (`container.file`).
[](<#(resource) containers.files > (model) file_create_response > (schema) > (property) object>)
path: string
Path of the file in the container.
[](<#(resource) containers.files > (model) file_create_response > (schema) > (property) path>)
source: string
Source of the file (e.g., `user`, `assistant`).
[](<#(resource) containers.files > (model) file_create_response > (schema) > (property) source>)
[](<#(resource) containers.files > (model) file_create_response > (schema)>)
FileRetrieveResponse { id, bytes, container\_id, 4 more }
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
object: "container.file"
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
##### [Retrieve container file content](/api/reference/typescript/resources/containers/subresources/files/subresources/content/methods/retrieve)
client.containers.files.content.retrieve(stringfileID, ContentRetrieveParams { container\_id } params, RequestOptionsoptions?): Response
GET/containers/{container\_id}/files/{file\_id}/content