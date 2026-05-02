Batches | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Batches
Create large batches of API requests to run asynchronously.
##### [Create batch](/api/reference/resources/batches/methods/create)
POST/batches
##### [Retrieve batch](/api/reference/resources/batches/methods/retrieve)
GET/batches/{batch\_id}
##### [Cancel batch](/api/reference/resources/batches/methods/cancel)
POST/batches/{batch\_id}/cancel
##### [List batches](/api/reference/resources/batches/methods/list)
GET/batches
##### ModelsExpand Collapse
Batch object { id, completion\_window, created\_at, 19 more }
id: string
[](<#(resource) batches > (model) batch > (schema) > (property) id>)
completion\_window: string
The time frame within which the batch should be processed.
[](<#(resource) batches > (model) batch > (schema) > (property) completion_window>)
created\_at: number
The Unix timestamp (in seconds) for when the batch was created.
formatunixtime
[](<#(resource) batches > (model) batch > (schema) > (property) created_at>)
endpoint: string
The OpenAI API endpoint used by the batch.
[](<#(resource) batches > (model) batch > (schema) > (property) endpoint>)
input\_file\_id: string
The ID of the input file for the batch.
[](<#(resource) batches > (model) batch > (schema) > (property) input_file_id>)
object: "batch"
The object type, which is always `batch`.
[](<#(resource) batches > (model) batch > (schema) > (property) object>)
status: "validating" or "failed" or "in\_progress" or 5 more
The current status of the batch.
One of the following:
"validating"
[](<#(resource) batches > (model) batch > (schema) > (property) status > (member) 0>)
"failed"
[](<#(resource) batches > (model) batch > (schema) > (property) status > (member) 1>)
"in\_progress"
[](<#(resource) batches > (model) batch > (schema) > (property) status > (member) 2>)
"finalizing"
[](<#(resource) batches > (model) batch > (schema) > (property) status > (member) 3>)
"completed"
[](<#(resource) batches > (model) batch > (schema) > (property) status > (member) 4>)
"expired"
[](<#(resource) batches > (model) batch > (schema) > (property) status > (member) 5>)
"cancelling"
[](<#(resource) batches > (model) batch > (schema) > (property) status > (member) 6>)
"cancelled"
[](<#(resource) batches > (model) batch > (schema) > (property) status > (member) 7>)
[](<#(resource) batches > (model) batch > (schema) > (property) status>)
cancelled\_at: optional number
The Unix timestamp (in seconds) for when the batch was cancelled.
formatunixtime
[](<#(resource) batches > (model) batch > (schema) > (property) cancelled_at>)
cancelling\_at: optional number
The Unix timestamp (in seconds) for when the batch started cancelling.
formatunixtime
[](<#(resource) batches > (model) batch > (schema) > (property) cancelling_at>)
completed\_at: optional number
The Unix timestamp (in seconds) for when the batch was completed.
formatunixtime
[](<#(resource) batches > (model) batch > (schema) > (property) completed_at>)
error\_file\_id: optional string
The ID of the file containing the outputs of requests with errors.
[](<#(resource) batches > (model) batch > (schema) > (property) error_file_id>)
errors: optional object { data, object }
data: optional array of object { code, line, message, param }
code: optional string
An error code identifying the error type.
[](<#(resource) batches > (model) batch > (schema) > (property) errors > (property) data > (items) > (property) code>)
line: optional number
The line number of the input file where the error occurred, if applicable.
[](<#(resource) batches > (model) batch > (schema) > (property) errors > (property) data > (items) > (property) line>)
message: optional string
A human-readable message providing more details about the error.
[](<#(resource) batches > (model) batch > (schema) > (property) errors > (property) data > (items) > (property) message>)
param: optional string
The name of the parameter that caused the error, if applicable.
[](<#(resource) batches > (model) batch > (schema) > (property) errors > (property) data > (items) > (property) param>)
[](<#(resource) batches > (model) batch > (schema) > (property) errors > (property) data>)
object: optional string
The object type, which is always `list`.
[](<#(resource) batches > (model) batch > (schema) > (property) errors > (property) object>)
[](<#(resource) batches > (model) batch > (schema) > (property) errors>)
expired\_at: optional number
The Unix timestamp (in seconds) for when the batch expired.
formatunixtime
[](<#(resource) batches > (model) batch > (schema) > (property) expired_at>)
expires\_at: optional number
The Unix timestamp (in seconds) for when the batch will expire.
formatunixtime
[](<#(resource) batches > (model) batch > (schema) > (property) expires_at>)
failed\_at: optional number
The Unix timestamp (in seconds) for when the batch failed.
formatunixtime
[](<#(resource) batches > (model) batch > (schema) > (property) failed_at>)
finalizing\_at: optional number
The Unix timestamp (in seconds) for when the batch started finalizing.
formatunixtime
[](<#(resource) batches > (model) batch > (schema) > (property) finalizing_at>)
in\_progress\_at: optional number
The Unix timestamp (in seconds) for when the batch started processing.
formatunixtime
[](<#(resource) batches > (model) batch > (schema) > (property) in_progress_at>)
metadata: optional [Metadata](</api/reference/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) batches > (model) batch > (schema) > (property) metadata>)
model: optional string
Model ID used to process the batch, like `gpt-5-2025-08-07`. OpenAI
offers a wide range of models with different capabilities, performance
characteristics, and price points. Refer to the [model
guide](/docs/models) to browse and compare available models.
[](<#(resource) batches > (model) batch > (schema) > (property) model>)
output\_file\_id: optional string
The ID of the file containing the outputs of successfully executed requests.
[](<#(resource) batches > (model) batch > (schema) > (property) output_file_id>)
request\_counts: optional object { completed, failed, total }
The request counts for different statuses within the batch.
completed: number
Number of requests that have been completed successfully.
[](<#(resource) batches > (model) batch > (schema) > (property) request_counts > (property) completed>)
failed: number
Number of requests that have failed.
[](<#(resource) batches > (model) batch > (schema) > (property) request_counts > (property) failed>)
total: number
Total number of requests in the batch.
[](<#(resource) batches > (model) batch > (schema) > (property) request_counts > (property) total>)
[](<#(resource) batches > (model) batch > (schema) > (property) request_counts>)
usage: optional [BatchUsage](</api/reference/resources/batches#(resource) batches > (model) batch_usage > (schema)>) { input\_tokens, input\_tokens\_details, output\_tokens, 2 more }
Represents token usage details including input tokens, output tokens, a
breakdown of output tokens, and the total tokens used. Only populated on
batches created after September 7, 2025.
[](<#(resource) batches > (model) batch > (schema) > (property) usage>)
[](<#(resource) batches > (model) batch > (schema)>)
BatchUsage object { input\_tokens, input\_tokens\_details, output\_tokens, 2 more }
Represents token usage details including input tokens, output tokens, a
breakdown of output tokens, and the total tokens used. Only populated on
batches created after September 7, 2025.
input\_tokens: number
The number of input tokens.
[](<#(resource) batches > (model) batch_usage > (schema) > (property) input_tokens>)
input\_tokens\_details: object { cached\_tokens }
A detailed breakdown of the input tokens.
cached\_tokens: number
The number of tokens that were retrieved from the cache. [More on
prompt caching](/docs/guides/prompt-caching).
[](<#(resource) batches > (model) batch_usage > (schema) > (property) input_tokens_details > (property) cached_tokens>)
[](<#(resource) batches > (model) batch_usage > (schema) > (property) input_tokens_details>)
output\_tokens: number
The number of output tokens.
[](<#(resource) batches > (model) batch_usage > (schema) > (property) output_tokens>)
output\_tokens\_details: object { reasoning\_tokens }
A detailed breakdown of the output tokens.
reasoning\_tokens: number
The number of reasoning tokens.
[](<#(resource) batches > (model) batch_usage > (schema) > (property) output_tokens_details > (property) reasoning_tokens>)
[](<#(resource) batches > (model) batch_usage > (schema) > (property) output_tokens_details>)
total\_tokens: number
The total number of tokens used.
[](<#(resource) batches > (model) batch_usage > (schema) > (property) total_tokens>)
[](<#(resource) batches > (model) batch_usage > (schema)>)