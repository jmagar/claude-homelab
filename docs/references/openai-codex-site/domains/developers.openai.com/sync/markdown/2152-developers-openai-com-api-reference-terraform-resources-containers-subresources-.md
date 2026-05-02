Files | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/terraform)
[Containers](/api/reference/terraform/resources/containers)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Files
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
#### FilesContent
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