Containers | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/terraform)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Containers
#### resource openai\_container
##### required Expand Collapse
name: String
Name of the container to create.
[](<#(resource) containers > (terraform resource) > (attribute) name>)
##### optional Expand Collapse
memory\_limit?: String
Optional memory limit for the container. Defaults to “1g”.
[](<#(resource) containers > (terraform resource) > (attribute) memory_limit>)
file\_ids?: List[String]
IDs of files to copy to the container.
[](<#(resource) containers > (terraform resource) > (attribute) file_ids>)
expires\_after?: Attributes
Container expiration time in seconds relative to the ‘anchor’ time.
anchor: String
Time anchor for the expiration time. Currently only ‘last\_active\_at’ is supported.
[](<#(resource) containers > (terraform resource) > (attribute) expires_after > (attribute) anchor>)
minutes: Int64
[](<#(resource) containers > (terraform resource) > (attribute) expires_after > (attribute) minutes>)
[](<#(resource) containers > (terraform resource) > (attribute) expires_after>)
network\_policy?: Attributes
Network access policy for the container.
type?: String
Disable outbound network access. Always `disabled`.
[](<#(resource) containers > (terraform resource) > (attribute) network_policy > (attribute) type>)
allowed\_domains?: List[String]
A list of allowed domains when type is `allowlist`.
[](<#(resource) containers > (terraform resource) > (attribute) network_policy > (attribute) allowed_domains>)
domain\_secrets?: List[Attributes]
Optional domain-scoped secrets for allowlisted domains.
domain: String
The domain associated with the secret.
[](<#(resource) containers > (terraform resource) > (attribute) network_policy > (attribute) domain_secrets > (attribute) domain>)
name: String
The name of the secret to inject for the domain.
[](<#(resource) containers > (terraform resource) > (attribute) network_policy > (attribute) domain_secrets > (attribute) name>)
value: String
The secret value to inject for the domain.
[](<#(resource) containers > (terraform resource) > (attribute) network_policy > (attribute) domain_secrets > (attribute) value>)
[](<#(resource) containers > (terraform resource) > (attribute) network_policy > (attribute) domain_secrets>)
[](<#(resource) containers > (terraform resource) > (attribute) network_policy>)
skills?: List[Attributes]
An optional list of skills referenced by id or inline data.
skill\_id?: String
The ID of the referenced skill.
[](<#(resource) containers > (terraform resource) > (attribute) skills > (attribute) skill_id>)
type?: String
References a skill created with the /v1/skills endpoint.
[](<#(resource) containers > (terraform resource) > (attribute) skills > (attribute) type>)
version?: String
Optional skill version. Use a positive integer or ‘latest’. Omit for default.
[](<#(resource) containers > (terraform resource) > (attribute) skills > (attribute) version>)
description?: String
The description of the skill.
[](<#(resource) containers > (terraform resource) > (attribute) skills > (attribute) description>)
name?: String
The name of the skill.
[](<#(resource) containers > (terraform resource) > (attribute) skills > (attribute) name>)
source?: Attributes
Inline skill payload
data: String
Base64-encoded skill zip bundle.
[](<#(resource) containers > (terraform resource) > (attribute) skills > (attribute) source > (attribute) data>)
media\_type?: String
The media type of the inline skill payload. Must be `application/zip`.
[](<#(resource) containers > (terraform resource) > (attribute) skills > (attribute) source > (attribute) media_type>)
type?: String
The type of the inline skill source. Must be `base64`.
[](<#(resource) containers > (terraform resource) > (attribute) skills > (attribute) source > (attribute) type>)
[](<#(resource) containers > (terraform resource) > (attribute) skills > (attribute) source>)
[](<#(resource) containers > (terraform resource) > (attribute) skills>)
##### computed Expand Collapse
id: String
Unique identifier for the container.
[](<#(resource) containers > (terraform resource) > (attribute) id>)
created\_at: Int64
Unix timestamp (in seconds) when the container was created.
[](<#(resource) containers > (terraform resource) > (attribute) created_at>)
last\_active\_at: Int64
Unix timestamp (in seconds) when the container was last active.
[](<#(resource) containers > (terraform resource) > (attribute) last_active_at>)
object: String
The type of this object.
[](<#(resource) containers > (terraform resource) > (attribute) object>)
status: String
Status of the container (e.g., active, deleted).
[](<#(resource) containers > (terraform resource) > (attribute) status>)
### openai\_container
Terraform
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
`resource "openai\_container" "example\_container" {
name = "name"
expires\_after = {
anchor = "last\_active\_at"
minutes = 0
}
file\_ids = ["string"]
memory\_limit = "1g"
network\_policy = {
type = "disabled"
}
skills = [{
skill\_id = "x"
type = "skill\_reference"
version = "version"
}]
}
`
```
#### data openai\_container
##### optional Expand Collapse
container\_id?: String
[](<#(resource) containers > (terraform datasource-single) > (attribute) container_id>)
find\_one\_by?: Attributes
name?: String
Filter results by container name.
[](<#(resource) containers > (terraform datasource-single) > (attribute) find_one_by > (attribute) name>)
order?: String
Sort order by the `created\_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.
[](<#(resource) containers > (terraform datasource-single) > (attribute) find_one_by > (attribute) order>)
[](<#(resource) containers > (terraform datasource-single) > (attribute) find_one_by>)
##### computed Expand Collapse
id: String
[](<#(resource) containers > (terraform datasource-single) > (attribute) id>)
created\_at: Int64
Unix timestamp (in seconds) when the container was created.
[](<#(resource) containers > (terraform datasource-single) > (attribute) created_at>)
last\_active\_at: Int64
Unix timestamp (in seconds) when the container was last active.
[](<#(resource) containers > (terraform datasource-single) > (attribute) last_active_at>)
memory\_limit: String
The memory limit configured for the container.
[](<#(resource) containers > (terraform datasource-single) > (attribute) memory_limit>)
name: String
Name of the container.
[](<#(resource) containers > (terraform datasource-single) > (attribute) name>)
object: String
The type of this object.
[](<#(resource) containers > (terraform datasource-single) > (attribute) object>)
status: String
Status of the container (e.g., active, deleted).
[](<#(resource) containers > (terraform datasource-single) > (attribute) status>)
expires\_after: Attributes
The container will expire after this time period.
The anchor is the reference point for the expiration.
The minutes is the number of minutes after the anchor before the container expires.
anchor: String
The reference point for the expiration.
[](<#(resource) containers > (terraform datasource-single) > (attribute) expires_after > (attribute) anchor>)
minutes: Int64
The number of minutes after the anchor before the container expires.
[](<#(resource) containers > (terraform datasource-single) > (attribute) expires_after > (attribute) minutes>)
[](<#(resource) containers > (terraform datasource-single) > (attribute) expires_after>)
network\_policy: Attributes
Network access policy for the container.
type: String
The network policy mode.
[](<#(resource) containers > (terraform datasource-single) > (attribute) network_policy > (attribute) type>)
allowed\_domains: List[String]
Allowed outbound domains when `type` is `allowlist`.
[](<#(resource) containers > (terraform datasource-single) > (attribute) network_policy > (attribute) allowed_domains>)
[](<#(resource) containers > (terraform datasource-single) > (attribute) network_policy>)
### openai\_container
Terraform
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
`data "openai\_container" "example\_container" {
container\_id = "container\_id"
}
`
```
#### data openai\_containers
##### optional Expand Collapse
name?: String
Filter results by container name.
[](<#(resource) containers > (terraform datasource-plural) > (attribute) name>)
order?: String
Sort order by the `created\_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.
[](<#(resource) containers > (terraform datasource-plural) > (attribute) order>)
max\_items?: Int64
Max items to fetch, default: 1000
[](<#(resource) containers > (terraform datasource-plural) > (attribute) max_items>)
##### computed Expand Collapse
items: List[Attributes]
The items returned by the data source
id: String
Unique identifier for the container.
[](<#(resource) containers > (terraform datasource-plural) > (attribute) items > (attribute) id>)
created\_at: Int64
Unix timestamp (in seconds) when the container was created.
[](<#(resource) containers > (terraform datasource-plural) > (attribute) items > (attribute) created_at>)
name: String
Name of the container.
[](<#(resource) containers > (terraform datasource-plural) > (attribute) items > (attribute) name>)
object: String
The type of this object.
[](<#(resource) containers > (terraform datasource-plural) > (attribute) items > (attribute) object>)
status: String
Status of the container (e.g., active, deleted).
[](<#(resource) containers > (terraform datasource-plural) > (attribute) items > (attribute) status>)
expires\_after: Attributes
The container will expire after this time period.
The anchor is the reference point for the expiration.
The minutes is the number of minutes after the anchor before the container expires.
anchor: String
The reference point for the expiration.
[](<#(resource) containers > (terraform datasource-plural) > (attribute) items > (attribute) expires_after > (attribute) anchor>)
minutes: Int64
The number of minutes after the anchor before the container expires.
[](<#(resource) containers > (terraform datasource-plural) > (attribute) items > (attribute) expires_after > (attribute) minutes>)
[](<#(resource) containers > (terraform datasource-plural) > (attribute) items > (attribute) expires_after>)
last\_active\_at: Int64
Unix timestamp (in seconds) when the container was last active.
[](<#(resource) containers > (terraform datasource-plural) > (attribute) items > (attribute) last_active_at>)
memory\_limit: String
The memory limit configured for the container.
[](<#(resource) containers > (terraform datasource-plural) > (attribute) items > (attribute) memory_limit>)
network\_policy: Attributes
Network access policy for the container.
type: String
The network policy mode.
[](<#(resource) containers > (terraform datasource-plural) > (attribute) items > (attribute) network_policy > (attribute) type>)
allowed\_domains: List[String]
Allowed outbound domains when `type` is `allowlist`.
[](<#(resource) containers > (terraform datasource-plural) > (attribute) items > (attribute) network_policy > (attribute) allowed_domains>)
[](<#(resource) containers > (terraform datasource-plural) > (attribute) items > (attribute) network_policy>)
[](<#(resource) containers > (terraform datasource-plural) > (attribute) items>)
### openai\_containers
Terraform
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
`data "openai\_containers" "example\_containers" {
name = "name"
}
`
```
#### ContainersFiles
#### resource openai\_container\_file
##### required Expand Collapse
container\_id: String
[](<#(resource) containers.files > (terraform resource) > (attribute) container_id>)
##### optional Expand Collapse
file?: String
The File object (not file name) to be uploaded.
[](<#(resource) containers.files > (terraform resource) > (attribute) file>)
file\_id?: String
Name of the file to create.
[](<#(resource) containers.files > (terraform resource) > (attribute) file_id>)
##### computed Expand Collapse
id: String
Unique identifier for the file.
[](<#(resource) containers.files > (terraform resource) > (attribute) id>)
bytes: Int64
Size of the file in bytes.
[](<#(resource) containers.files > (terraform resource) > (attribute) bytes>)
created\_at: Int64
Unix timestamp (in seconds) when the file was created.
[](<#(resource) containers.files > (terraform resource) > (attribute) created_at>)
object: String
The type of this object (`container.file`).
[](<#(resource) containers.files > (terraform resource) > (attribute) object>)
path: String
Path of the file in the container.
[](<#(resource) containers.files > (terraform resource) > (attribute) path>)
source: String
Source of the file (e.g., `user`, `assistant`).
[](<#(resource) containers.files > (terraform resource) > (attribute) source>)
### openai\_container\_file
Terraform
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
`resource "openai\_container\_file" "example\_container\_file" {
container\_id = "container\_id"
file = "Example data"
file\_id = "file\_id"
}
`
```
#### data openai\_container\_file
##### required Expand Collapse
container\_id: String
[](<#(resource) containers.files > (terraform datasource-single) > (attribute) container_id>)
##### optional Expand Collapse
file\_id?: String
[](<#(resource) containers.files > (terraform datasource-single) > (attribute) file_id>)
find\_one\_by?: Attributes
order?: String
Sort order by the `created\_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.
[](<#(resource) containers.files > (terraform datasource-single) > (attribute) find_one_by > (attribute) order>)
[](<#(resource) containers.files > (terraform datasource-single) > (attribute) find_one_by>)
##### computed Expand Collapse
id: String
[](<#(resource) containers.files > (terraform datasource-single) > (attribute) id>)
bytes: Int64
Size of the file in bytes.
[](<#(resource) containers.files > (terraform datasource-single) > (attribute) bytes>)
created\_at: Int64
Unix timestamp (in seconds) when the file was created.
[](<#(resource) containers.files > (terraform datasource-single) > (attribute) created_at>)
object: String
The type of this object (`container.file`).
[](<#(resource) containers.files > (terraform datasource-single) > (attribute) object>)
path: String
Path of the file in the container.
[](<#(resource) containers.files > (terraform datasource-single) > (attribute) path>)
source: String
Source of the file (e.g., `user`, `assistant`).
[](<#(resource) containers.files > (terraform datasource-single) > (attribute) source>)
### openai\_container\_file
Terraform
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
`data "openai\_container\_file" "example\_container\_file" {
container\_id = "container\_id"
file\_id = "file\_id"
}
`
```
#### data openai\_container\_files
##### required Expand Collapse
container\_id: String
[](<#(resource) containers.files > (terraform datasource-plural) > (attribute) container_id>)
##### optional Expand Collapse
order?: String
Sort order by the `created\_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.
[](<#(resource) containers.files > (terraform datasource-plural) > (attribute) order>)
max\_items?: Int64
Max items to fetch, default: 1000
[](<#(resource) containers.files > (terraform datasource-plural) > (attribute) max_items>)
##### computed Expand Collapse
items: List[Attributes]
The items returned by the data source
id: String
Unique identifier for the file.
[](<#(resource) containers.files > (terraform datasource-plural) > (attribute) items > (attribute) id>)
bytes: Int64
Size of the file in bytes.
[](<#(resource) containers.files > (terraform datasource-plural) > (attribute) items > (attribute) bytes>)
container\_id: String
The container this file belongs to.
[](<#(resource) containers.files > (terraform datasource-plural) > (attribute) items > (attribute) container_id>)
created\_at: Int64
Unix timestamp (in seconds) when the file was created.
[](<#(resource) containers.files > (terraform datasource-plural) > (attribute) items > (attribute) created_at>)
object: String
The type of this object (`container.file`).
[](<#(resource) containers.files > (terraform datasource-plural) > (attribute) items > (attribute) object>)
path: String
Path of the file in the container.
[](<#(resource) containers.files > (terraform datasource-plural) > (attribute) items > (attribute) path>)
source: String
Source of the file (e.g., `user`, `assistant`).
[](<#(resource) containers.files > (terraform datasource-plural) > (attribute) items > (attribute) source>)
[](<#(resource) containers.files > (terraform datasource-plural) > (attribute) items>)
### openai\_container\_files
Terraform
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
`data "openai\_container\_files" "example\_container\_files" {
container\_id = "container\_id"
}
`
```
#### ContainersFilesContent
#### data openai\_container\_file\_content
##### required Expand Collapse
container\_id: String
[](<#(resource) containers.files.content > (terraform datasource-single) > (attribute) container_id>)
file\_id: String
[](<#(resource) containers.files.content > (terraform datasource-single) > (attribute) file_id>)
##### computed Expand Collapse
content: JSON
[](<#(resource) containers.files.content > (terraform datasource-single) > (attribute) content>)
### openai\_container\_file\_content
Terraform
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
`data "openai\_container\_file\_content" "example\_container\_file\_content" {
container\_id = "container\_id"
file\_id = "file\_id"
}
`
```