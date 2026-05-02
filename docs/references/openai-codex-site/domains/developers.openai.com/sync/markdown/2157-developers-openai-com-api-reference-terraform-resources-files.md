Files | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/terraform)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Files
Files are used to upload documents that can be used with features like Assistants and Fine-tuning.
#### resource openai\_file
##### required Expand Collapse
file: String
The File object (not file name) to be uploaded.
[](<#(resource) files > (terraform resource) > (attribute) file>)
purpose: String
The intended purpose of the uploaded file. One of:
* `assistants`: Used in the Assistants API
* `batch`: Used in the Batch API
* `fine-tune`: Used for fine-tuning
* `vision`: Images used for vision fine-tuning
* `user\_data`: Flexible file type for any purpose
* `evals`: Used for eval data sets
[](<#(resource) files > (terraform resource) > (attribute) purpose>)
##### optional Expand Collapse
expires\_after?: Attributes
The expiration policy for a file. By default, files with `purpose=batch` expire after 30 days and all other files are persisted until they are manually deleted.
anchor: String
Anchor timestamp after which the expiration policy applies. Supported anchors: `created\_at`.
[](<#(resource) files > (terraform resource) > (attribute) expires_after > (attribute) anchor>)
seconds: Int64
The number of seconds after the anchor time that the file will expire. Must be between 3600 (1 hour) and 2592000 (30 days).
[](<#(resource) files > (terraform resource) > (attribute) expires_after > (attribute) seconds>)
[](<#(resource) files > (terraform resource) > (attribute) expires_after>)
##### computed Expand Collapse
id: String
The file identifier, which can be referenced in the API endpoints.
[](<#(resource) files > (terraform resource) > (attribute) id>)
bytes: Int64
The size of the file, in bytes.
[](<#(resource) files > (terraform resource) > (attribute) bytes>)
created\_at: Int64
The Unix timestamp (in seconds) for when the file was created.
[](<#(resource) files > (terraform resource) > (attribute) created_at>)
expires\_at: Int64
The Unix timestamp (in seconds) for when the file will expire.
[](<#(resource) files > (terraform resource) > (attribute) expires_at>)
filename: String
The name of the file.
[](<#(resource) files > (terraform resource) > (attribute) filename>)
object: String
The object type, which is always `file`.
[](<#(resource) files > (terraform resource) > (attribute) object>)
Deprecatedstatus: String
Deprecated. The current status of the file, which can be either `uploaded`, `processed`, or `error`.
[](<#(resource) files > (terraform resource) > (attribute) status>)
Deprecatedstatus\_details: String
Deprecated. For details on why a fine-tuning training file failed validation, see the `error` field on `fine\_tuning.job`.
[](<#(resource) files > (terraform resource) > (attribute) status_details>)
### openai\_file
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
`resource "openai\_file" "example\_file" {
file = "Example data"
purpose = "assistants"
expires\_after = {
anchor = "created\_at"
seconds = 3600
}
}
`
```
#### data openai\_file
##### optional Expand Collapse
file\_id?: String
[](<#(resource) files > (terraform datasource-single) > (attribute) file_id>)
find\_one\_by?: Attributes
order?: String
Sort order by the `created\_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.
[](<#(resource) files > (terraform datasource-single) > (attribute) find_one_by > (attribute) order>)
purpose?: String
Only return files with the given purpose.
[](<#(resource) files > (terraform datasource-single) > (attribute) find_one_by > (attribute) purpose>)
[](<#(resource) files > (terraform datasource-single) > (attribute) find_one_by>)
##### computed Expand Collapse
id: String
[](<#(resource) files > (terraform datasource-single) > (attribute) id>)
bytes: Int64
The size of the file, in bytes.
[](<#(resource) files > (terraform datasource-single) > (attribute) bytes>)
created\_at: Int64
The Unix timestamp (in seconds) for when the file was created.
[](<#(resource) files > (terraform datasource-single) > (attribute) created_at>)
expires\_at: Int64
The Unix timestamp (in seconds) for when the file will expire.
[](<#(resource) files > (terraform datasource-single) > (attribute) expires_at>)
filename: String
The name of the file.
[](<#(resource) files > (terraform datasource-single) > (attribute) filename>)
object: String
The object type, which is always `file`.
[](<#(resource) files > (terraform datasource-single) > (attribute) object>)
purpose: String
The intended purpose of the file. Supported values are `assistants`, `assistants\_output`, `batch`, `batch\_output`, `fine-tune`, `fine-tune-results`, `vision`, and `user\_data`.
[](<#(resource) files > (terraform datasource-single) > (attribute) purpose>)
Deprecatedstatus: String
Deprecated. The current status of the file, which can be either `uploaded`, `processed`, or `error`.
[](<#(resource) files > (terraform datasource-single) > (attribute) status>)
Deprecatedstatus\_details: String
Deprecated. For details on why a fine-tuning training file failed validation, see the `error` field on `fine\_tuning.job`.
[](<#(resource) files > (terraform datasource-single) > (attribute) status_details>)
### openai\_file
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
`data "openai\_file" "example\_file" {
file\_id = "file\_id"
}
`
```
#### data openai\_files
##### optional Expand Collapse
purpose?: String
Only return files with the given purpose.
[](<#(resource) files > (terraform datasource-plural) > (attribute) purpose>)
order?: String
Sort order by the `created\_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.
[](<#(resource) files > (terraform datasource-plural) > (attribute) order>)
max\_items?: Int64
Max items to fetch, default: 1000
[](<#(resource) files > (terraform datasource-plural) > (attribute) max_items>)
##### computed Expand Collapse
items: List[Attributes]
The items returned by the data source
id: String
The file identifier, which can be referenced in the API endpoints.
[](<#(resource) files > (terraform datasource-plural) > (attribute) items > (attribute) id>)
bytes: Int64
The size of the file, in bytes.
[](<#(resource) files > (terraform datasource-plural) > (attribute) items > (attribute) bytes>)
created\_at: Int64
The Unix timestamp (in seconds) for when the file was created.
[](<#(resource) files > (terraform datasource-plural) > (attribute) items > (attribute) created_at>)
filename: String
The name of the file.
[](<#(resource) files > (terraform datasource-plural) > (attribute) items > (attribute) filename>)
object: String
The object type, which is always `file`.
[](<#(resource) files > (terraform datasource-plural) > (attribute) items > (attribute) object>)
purpose: String
The intended purpose of the file. Supported values are `assistants`, `assistants\_output`, `batch`, `batch\_output`, `fine-tune`, `fine-tune-results`, `vision`, and `user\_data`.
[](<#(resource) files > (terraform datasource-plural) > (attribute) items > (attribute) purpose>)
Deprecatedstatus: String
Deprecated. The current status of the file, which can be either `uploaded`, `processed`, or `error`.
[](<#(resource) files > (terraform datasource-plural) > (attribute) items > (attribute) status>)
expires\_at: Int64
The Unix timestamp (in seconds) for when the file will expire.
[](<#(resource) files > (terraform datasource-plural) > (attribute) items > (attribute) expires_at>)
Deprecatedstatus\_details: String
Deprecated. For details on why a fine-tuning training file failed validation, see the `error` field on `fine\_tuning.job`.
[](<#(resource) files > (terraform datasource-plural) > (attribute) items > (attribute) status_details>)
[](<#(resource) files > (terraform datasource-plural) > (attribute) items>)
### openai\_files
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
`data "openai\_files" "example\_files" {
purpose = "purpose"
}
`
```