Batches | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/terraform)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Batches
Create large batches of API requests to run asynchronously.
#### resource openai\_batch
##### required Expand Collapse
completion\_window: String
The time frame within which the batch should be processed. Currently only `24h` is supported.
[](<#(resource) batches > (terraform resource) > (attribute) completion_window>)
endpoint: String
The endpoint to be used for all requests in the batch. Currently `/v1/responses`, `/v1/chat/completions`, `/v1/embeddings`, `/v1/completions`, `/v1/moderations`, `/v1/images/generations`, `/v1/images/edits`, and `/v1/videos` are supported. Note that `/v1/embeddings` batches are also restricted to a maximum of 50,000 embedding inputs across all requests in the batch.
[](<#(resource) batches > (terraform resource) > (attribute) endpoint>)
input\_file\_id: String
The ID of an uploaded file that contains requests for the new batch.
See [upload file](https://platform.openai.com/docs/api-reference/files/create) for how to upload a file.
Your input file must be formatted as a [JSONL file](https://platform.openai.com/docs/api-reference/batch/request-input), and must be uploaded with the purpose `batch`. The file can contain up to 50,000 requests, and can be up to 200 MB in size.
[](<#(resource) batches > (terraform resource) > (attribute) input_file_id>)
##### optional Expand Collapse
metadata?: Map[String]
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) batches > (terraform resource) > (attribute) metadata>)
output\_expires\_after?: Attributes
The expiration policy for the output and/or error file that are generated for a batch.
anchor: String
Anchor timestamp after which the expiration policy applies. Supported anchors: `created\_at`. Note that the anchor is the file creation time, not the time the batch is created.
[](<#(resource) batches > (terraform resource) > (attribute) output_expires_after > (attribute) anchor>)
seconds: Int64
The number of seconds after the anchor time that the file will expire. Must be between 3600 (1 hour) and 2592000 (30 days).
[](<#(resource) batches > (terraform resource) > (attribute) output_expires_after > (attribute) seconds>)
[](<#(resource) batches > (terraform resource) > (attribute) output_expires_after>)
##### computed Expand Collapse
id: String
[](<#(resource) batches > (terraform resource) > (attribute) id>)
cancelled\_at: Int64
The Unix timestamp (in seconds) for when the batch was cancelled.
[](<#(resource) batches > (terraform resource) > (attribute) cancelled_at>)
cancelling\_at: Int64
The Unix timestamp (in seconds) for when the batch started cancelling.
[](<#(resource) batches > (terraform resource) > (attribute) cancelling_at>)
completed\_at: Int64
The Unix timestamp (in seconds) for when the batch was completed.
[](<#(resource) batches > (terraform resource) > (attribute) completed_at>)
created\_at: Int64
The Unix timestamp (in seconds) for when the batch was created.
[](<#(resource) batches > (terraform resource) > (attribute) created_at>)
error\_file\_id: String
The ID of the file containing the outputs of requests with errors.
[](<#(resource) batches > (terraform resource) > (attribute) error_file_id>)
expired\_at: Int64
The Unix timestamp (in seconds) for when the batch expired.
[](<#(resource) batches > (terraform resource) > (attribute) expired_at>)
expires\_at: Int64
The Unix timestamp (in seconds) for when the batch will expire.
[](<#(resource) batches > (terraform resource) > (attribute) expires_at>)
failed\_at: Int64
The Unix timestamp (in seconds) for when the batch failed.
[](<#(resource) batches > (terraform resource) > (attribute) failed_at>)
finalizing\_at: Int64
The Unix timestamp (in seconds) for when the batch started finalizing.
[](<#(resource) batches > (terraform resource) > (attribute) finalizing_at>)
in\_progress\_at: Int64
The Unix timestamp (in seconds) for when the batch started processing.
[](<#(resource) batches > (terraform resource) > (attribute) in_progress_at>)
model: String
Model ID used to process the batch, like `gpt-5-2025-08-07`. OpenAI
offers a wide range of models with different capabilities, performance
characteristics, and price points. Refer to the [model
guide](https://platform.openai.com/docs/models) to browse and compare available models.
[](<#(resource) batches > (terraform resource) > (attribute) model>)
object: String
The object type, which is always `batch`.
[](<#(resource) batches > (terraform resource) > (attribute) object>)
output\_file\_id: String
The ID of the file containing the outputs of successfully executed requests.
[](<#(resource) batches > (terraform resource) > (attribute) output_file_id>)
status: String
The current status of the batch.
[](<#(resource) batches > (terraform resource) > (attribute) status>)
errors: Attributes
data: List[Attributes]
code: String
An error code identifying the error type.
[](<#(resource) batches > (terraform resource) > (attribute) errors > (attribute) data > (attribute) code>)
line: Int64
The line number of the input file where the error occurred, if applicable.
[](<#(resource) batches > (terraform resource) > (attribute) errors > (attribute) data > (attribute) line>)
message: String
A human-readable message providing more details about the error.
[](<#(resource) batches > (terraform resource) > (attribute) errors > (attribute) data > (attribute) message>)
param: String
The name of the parameter that caused the error, if applicable.
[](<#(resource) batches > (terraform resource) > (attribute) errors > (attribute) data > (attribute) param>)
[](<#(resource) batches > (terraform resource) > (attribute) errors > (attribute) data>)
object: String
The object type, which is always `list`.
[](<#(resource) batches > (terraform resource) > (attribute) errors > (attribute) object>)
[](<#(resource) batches > (terraform resource) > (attribute) errors>)
request\_counts: Attributes
The request counts for different statuses within the batch.
completed: Int64
Number of requests that have been completed successfully.
[](<#(resource) batches > (terraform resource) > (attribute) request_counts > (attribute) completed>)
failed: Int64
Number of requests that have failed.
[](<#(resource) batches > (terraform resource) > (attribute) request_counts > (attribute) failed>)
total: Int64
Total number of requests in the batch.
[](<#(resource) batches > (terraform resource) > (attribute) request_counts > (attribute) total>)
[](<#(resource) batches > (terraform resource) > (attribute) request_counts>)
usage: Attributes
Represents token usage details including input tokens, output tokens, a
breakdown of output tokens, and the total tokens used. Only populated on
batches created after September 7, 2025.
input\_tokens: Int64
The number of input tokens.
[](<#(resource) batches > (terraform resource) > (attribute) usage > (attribute) input_tokens>)
input\_tokens\_details: Attributes
A detailed breakdown of the input tokens.
cached\_tokens: Int64
The number of tokens that were retrieved from the cache. [More on
prompt caching](https://platform.openai.com/docs/guides/prompt-caching).
[](<#(resource) batches > (terraform resource) > (attribute) usage > (attribute) input_tokens_details > (attribute) cached_tokens>)
[](<#(resource) batches > (terraform resource) > (attribute) usage > (attribute) input_tokens_details>)
output\_tokens: Int64
The number of output tokens.
[](<#(resource) batches > (terraform resource) > (attribute) usage > (attribute) output_tokens>)
output\_tokens\_details: Attributes
A detailed breakdown of the output tokens.
reasoning\_tokens: Int64
The number of reasoning tokens.
[](<#(resource) batches > (terraform resource) > (attribute) usage > (attribute) output_tokens_details > (attribute) reasoning_tokens>)
[](<#(resource) batches > (terraform resource) > (attribute) usage > (attribute) output_tokens_details>)
total\_tokens: Int64
The total number of tokens used.
[](<#(resource) batches > (terraform resource) > (attribute) usage > (attribute) total_tokens>)
[](<#(resource) batches > (terraform resource) > (attribute) usage>)
### openai\_batch
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
`resource "openai\_batch" "example\_batch" {
completion\_window = "24h"
endpoint = "/v1/responses"
input\_file\_id = "input\_file\_id"
metadata = {
foo = "string"
}
output\_expires\_after = {
anchor = "created\_at"
seconds = 3600
}
}
`
```
#### data openai\_batch
##### required Expand Collapse
batch\_id: String
[](<#(resource) batches > (terraform datasource-single) > (attribute) batch_id>)
##### computed Expand Collapse
id: String
[](<#(resource) batches > (terraform datasource-single) > (attribute) id>)
cancelled\_at: Int64
The Unix timestamp (in seconds) for when the batch was cancelled.
[](<#(resource) batches > (terraform datasource-single) > (attribute) cancelled_at>)
cancelling\_at: Int64
The Unix timestamp (in seconds) for when the batch started cancelling.
[](<#(resource) batches > (terraform datasource-single) > (attribute) cancelling_at>)
completed\_at: Int64
The Unix timestamp (in seconds) for when the batch was completed.
[](<#(resource) batches > (terraform datasource-single) > (attribute) completed_at>)
completion\_window: String
The time frame within which the batch should be processed.
[](<#(resource) batches > (terraform datasource-single) > (attribute) completion_window>)
created\_at: Int64
The Unix timestamp (in seconds) for when the batch was created.
[](<#(resource) batches > (terraform datasource-single) > (attribute) created_at>)
endpoint: String
The OpenAI API endpoint used by the batch.
[](<#(resource) batches > (terraform datasource-single) > (attribute) endpoint>)
error\_file\_id: String
The ID of the file containing the outputs of requests with errors.
[](<#(resource) batches > (terraform datasource-single) > (attribute) error_file_id>)
expired\_at: Int64
The Unix timestamp (in seconds) for when the batch expired.
[](<#(resource) batches > (terraform datasource-single) > (attribute) expired_at>)
expires\_at: Int64
The Unix timestamp (in seconds) for when the batch will expire.
[](<#(resource) batches > (terraform datasource-single) > (attribute) expires_at>)
failed\_at: Int64
The Unix timestamp (in seconds) for when the batch failed.
[](<#(resource) batches > (terraform datasource-single) > (attribute) failed_at>)
finalizing\_at: Int64
The Unix timestamp (in seconds) for when the batch started finalizing.
[](<#(resource) batches > (terraform datasource-single) > (attribute) finalizing_at>)
in\_progress\_at: Int64
The Unix timestamp (in seconds) for when the batch started processing.
[](<#(resource) batches > (terraform datasource-single) > (attribute) in_progress_at>)
input\_file\_id: String
The ID of the input file for the batch.
[](<#(resource) batches > (terraform datasource-single) > (attribute) input_file_id>)
model: String
Model ID used to process the batch, like `gpt-5-2025-08-07`. OpenAI
offers a wide range of models with different capabilities, performance
characteristics, and price points. Refer to the [model
guide](https://platform.openai.com/docs/models) to browse and compare available models.
[](<#(resource) batches > (terraform datasource-single) > (attribute) model>)
object: String
The object type, which is always `batch`.
[](<#(resource) batches > (terraform datasource-single) > (attribute) object>)
output\_file\_id: String
The ID of the file containing the outputs of successfully executed requests.
[](<#(resource) batches > (terraform datasource-single) > (attribute) output_file_id>)
status: String
The current status of the batch.
[](<#(resource) batches > (terraform datasource-single) > (attribute) status>)
metadata: Map[String]
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) batches > (terraform datasource-single) > (attribute) metadata>)
errors: Attributes
data: List[Attributes]
code: String
An error code identifying the error type.
[](<#(resource) batches > (terraform datasource-single) > (attribute) errors > (attribute) data > (attribute) code>)
line: Int64
The line number of the input file where the error occurred, if applicable.
[](<#(resource) batches > (terraform datasource-single) > (attribute) errors > (attribute) data > (attribute) line>)
message: String
A human-readable message providing more details about the error.
[](<#(resource) batches > (terraform datasource-single) > (attribute) errors > (attribute) data > (attribute) message>)
param: String
The name of the parameter that caused the error, if applicable.
[](<#(resource) batches > (terraform datasource-single) > (attribute) errors > (attribute) data > (attribute) param>)
[](<#(resource) batches > (terraform datasource-single) > (attribute) errors > (attribute) data>)
object: String
The object type, which is always `list`.
[](<#(resource) batches > (terraform datasource-single) > (attribute) errors > (attribute) object>)
[](<#(resource) batches > (terraform datasource-single) > (attribute) errors>)
request\_counts: Attributes
The request counts for different statuses within the batch.
completed: Int64
Number of requests that have been completed successfully.
[](<#(resource) batches > (terraform datasource-single) > (attribute) request_counts > (attribute) completed>)
failed: Int64
Number of requests that have failed.
[](<#(resource) batches > (terraform datasource-single) > (attribute) request_counts > (attribute) failed>)
total: Int64
Total number of requests in the batch.
[](<#(resource) batches > (terraform datasource-single) > (attribute) request_counts > (attribute) total>)
[](<#(resource) batches > (terraform datasource-single) > (attribute) request_counts>)
usage: Attributes
Represents token usage details including input tokens, output tokens, a
breakdown of output tokens, and the total tokens used. Only populated on
batches created after September 7, 2025.
input\_tokens: Int64
The number of input tokens.
[](<#(resource) batches > (terraform datasource-single) > (attribute) usage > (attribute) input_tokens>)
input\_tokens\_details: Attributes
A detailed breakdown of the input tokens.
cached\_tokens: Int64
The number of tokens that were retrieved from the cache. [More on
prompt caching](https://platform.openai.com/docs/guides/prompt-caching).
[](<#(resource) batches > (terraform datasource-single) > (attribute) usage > (attribute) input_tokens_details > (attribute) cached_tokens>)
[](<#(resource) batches > (terraform datasource-single) > (attribute) usage > (attribute) input_tokens_details>)
output\_tokens: Int64
The number of output tokens.
[](<#(resource) batches > (terraform datasource-single) > (attribute) usage > (attribute) output_tokens>)
output\_tokens\_details: Attributes
A detailed breakdown of the output tokens.
reasoning\_tokens: Int64
The number of reasoning tokens.
[](<#(resource) batches > (terraform datasource-single) > (attribute) usage > (attribute) output_tokens_details > (attribute) reasoning_tokens>)
[](<#(resource) batches > (terraform datasource-single) > (attribute) usage > (attribute) output_tokens_details>)
total\_tokens: Int64
The total number of tokens used.
[](<#(resource) batches > (terraform datasource-single) > (attribute) usage > (attribute) total_tokens>)
[](<#(resource) batches > (terraform datasource-single) > (attribute) usage>)
### openai\_batch
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
`data "openai\_batch" "example\_batch" {
batch\_id = "batch\_id"
}
`
```
#### data openai\_batches
##### optional Expand Collapse
max\_items?: Int64
Max items to fetch, default: 1000
[](<#(resource) batches > (terraform datasource-plural) > (attribute) max_items>)
##### computed Expand Collapse
items: List[Attributes]
The items returned by the data source
id: String
[](<#(resource) batches > (terraform datasource-plural) > (attribute) items > (attribute) id>)
completion\_window: String
The time frame within which the batch should be processed.
[](<#(resource) batches > (terraform datasource-plural) > (attribute) items > (attribute) completion_window>)
created\_at: Int64
The Unix timestamp (in seconds) for when the batch was created.
[](<#(resource) batches > (terraform datasource-plural) > (attribute) items > (attribute) created_at>)
endpoint: String
The OpenAI API endpoint used by the batch.
[](<#(resource) batches > (terraform datasource-plural) > (attribute) items > (attribute) endpoint>)
input\_file\_id: String
The ID of the input file for the batch.
[](<#(resource) batches > (terraform datasource-plural) > (attribute) items > (attribute) input_file_id>)
object: String
The object type, which is always `batch`.
[](<#(resource) batches > (terraform datasource-plural) > (attribute) items > (attribute) object>)
status: String
The current status of the batch.
[](<#(resource) batches > (terraform datasource-plural) > (attribute) items > (attribute) status>)
cancelled\_at: Int64
The Unix timestamp (in seconds) for when the batch was cancelled.
[](<#(resource) batches > (terraform datasource-plural) > (attribute) items > (attribute) cancelled_at>)
cancelling\_at: Int64
The Unix timestamp (in seconds) for when the batch started cancelling.
[](<#(resource) batches > (terraform datasource-plural) > (attribute) items > (attribute) cancelling_at>)
completed\_at: Int64
The Unix timestamp (in seconds) for when the batch was completed.
[](<#(resource) batches > (terraform datasource-plural) > (attribute) items > (attribute) completed_at>)
error\_file\_id: String
The ID of the file containing the outputs of requests with errors.
[](<#(resource) batches > (terraform datasource-plural) > (attribute) items > (attribute) error_file_id>)
errors: Attributes
data: List[Attributes]
code: String
An error code identifying the error type.
[](<#(resource) batches > (terraform datasource-plural) > (attribute) items > (attribute) errors > (attribute) data > (attribute) code>)
line: Int64
The line number of the input file where the error occurred, if applicable.
[](<#(resource) batches > (terraform datasource-plural) > (attribute) items > (attribute) errors > (attribute) data > (attribute) line>)
message: String
A human-readable message providing more details about the error.
[](<#(resource) batches > (terraform datasource-plural) > (attribute) items > (attribute) errors > (attribute) data > (attribute) message>)
param: String
The name of the parameter that caused the error, if applicable.
[](<#(resource) batches > (terraform datasource-plural) > (attribute) items > (attribute) errors > (attribute) data > (attribute) param>)
[](<#(resource) batches > (terraform datasource-plural) > (attribute) items > (attribute) errors > (attribute) data>)
object: String
The object type, which is always `list`.
[](<#(resource) batches > (terraform datasource-plural) > (attribute) items > (attribute) errors > (attribute) object>)
[](<#(resource) batches > (terraform datasource-plural) > (attribute) items > (attribute) errors>)
expired\_at: Int64
The Unix timestamp (in seconds) for when the batch expired.
[](<#(resource) batches > (terraform datasource-plural) > (attribute) items > (attribute) expired_at>)
expires\_at: Int64
The Unix timestamp (in seconds) for when the batch will expire.
[](<#(resource) batches > (terraform datasource-plural) > (attribute) items > (attribute) expires_at>)
failed\_at: Int64
The Unix timestamp (in seconds) for when the batch failed.
[](<#(resource) batches > (terraform datasource-plural) > (attribute) items > (attribute) failed_at>)
finalizing\_at: Int64
The Unix timestamp (in seconds) for when the batch started finalizing.
[](<#(resource) batches > (terraform datasource-plural) > (attribute) items > (attribute) finalizing_at>)
in\_progress\_at: Int64
The Unix timestamp (in seconds) for when the batch started processing.
[](<#(resource) batches > (terraform datasource-plural) > (attribute) items > (attribute) in_progress_at>)
metadata: Map[String]
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) batches > (terraform datasource-plural) > (attribute) items > (attribute) metadata>)
model: String
Model ID used to process the batch, like `gpt-5-2025-08-07`. OpenAI
offers a wide range of models with different capabilities, performance
characteristics, and price points. Refer to the [model
guide](https://platform.openai.com/docs/models) to browse and compare available models.
[](<#(resource) batches > (terraform datasource-plural) > (attribute) items > (attribute) model>)
output\_file\_id: String
The ID of the file containing the outputs of successfully executed requests.
[](<#(resource) batches > (terraform datasource-plural) > (attribute) items > (attribute) output_file_id>)
request\_counts: Attributes
The request counts for different statuses within the batch.
completed: Int64
Number of requests that have been completed successfully.
[](<#(resource) batches > (terraform datasource-plural) > (attribute) items > (attribute) request_counts > (attribute) completed>)
failed: Int64
Number of requests that have failed.
[](<#(resource) batches > (terraform datasource-plural) > (attribute) items > (attribute) request_counts > (attribute) failed>)
total: Int64
Total number of requests in the batch.
[](<#(resource) batches > (terraform datasource-plural) > (attribute) items > (attribute) request_counts > (attribute) total>)
[](<#(resource) batches > (terraform datasource-plural) > (attribute) items > (attribute) request_counts>)
usage: Attributes
Represents token usage details including input tokens, output tokens, a
breakdown of output tokens, and the total tokens used. Only populated on
batches created after September 7, 2025.
input\_tokens: Int64
The number of input tokens.
[](<#(resource) batches > (terraform datasource-plural) > (attribute) items > (attribute) usage > (attribute) input_tokens>)
input\_tokens\_details: Attributes
A detailed breakdown of the input tokens.
cached\_tokens: Int64
The number of tokens that were retrieved from the cache. [More on
prompt caching](https://platform.openai.com/docs/guides/prompt-caching).
[](<#(resource) batches > (terraform datasource-plural) > (attribute) items > (attribute) usage > (attribute) input_tokens_details > (attribute) cached_tokens>)
[](<#(resource) batches > (terraform datasource-plural) > (attribute) items > (attribute) usage > (attribute) input_tokens_details>)
output\_tokens: Int64
The number of output tokens.
[](<#(resource) batches > (terraform datasource-plural) > (attribute) items > (attribute) usage > (attribute) output_tokens>)
output\_tokens\_details: Attributes
A detailed breakdown of the output tokens.
reasoning\_tokens: Int64
The number of reasoning tokens.
[](<#(resource) batches > (terraform datasource-plural) > (attribute) items > (attribute) usage > (attribute) output_tokens_details > (attribute) reasoning_tokens>)
[](<#(resource) batches > (terraform datasource-plural) > (attribute) items > (attribute) usage > (attribute) output_tokens_details>)
total\_tokens: Int64
The total number of tokens used.
[](<#(resource) batches > (terraform datasource-plural) > (attribute) items > (attribute) usage > (attribute) total_tokens>)
[](<#(resource) batches > (terraform datasource-plural) > (attribute) items > (attribute) usage>)
[](<#(resource) batches > (terraform datasource-plural) > (attribute) items>)
### openai\_batches
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
`data "openai\_batches" "example\_batches" {
}
`
```