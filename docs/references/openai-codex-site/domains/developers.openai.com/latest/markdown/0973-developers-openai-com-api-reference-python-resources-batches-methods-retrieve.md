Retrieve batch | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Batches](/api/reference/python/resources/batches)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Retrieve batch
batches.retrieve(strbatch\_id) -\> [Batch](</api/reference/python/resources/batches#(resource) batches > (model) batch > (schema)>)
GET/batches/{batch\_id}
Retrieves a batch.
##### ParametersExpand Collapse
batch\_id: str
[](<#(resource) batches > (method) retrieve > (params) default > (param) batch_id > (schema)>)
##### ReturnsExpand Collapse
class Batch: …
id: str
[](<#(resource) batches > (model) batch > (schema) > (property) id>)
completion\_window: str
The time frame within which the batch should be processed.
[](<#(resource) batches > (model) batch > (schema) > (property) completion_window>)
created\_at: int
The Unix timestamp (in seconds) for when the batch was created.
formatunixtime
[](<#(resource) batches > (model) batch > (schema) > (property) created_at>)
endpoint: str
The OpenAI API endpoint used by the batch.
[](<#(resource) batches > (model) batch > (schema) > (property) endpoint>)
input\_file\_id: str
The ID of the input file for the batch.
[](<#(resource) batches > (model) batch > (schema) > (property) input_file_id>)
object: Literal["batch"]
The object type, which is always `batch`.
[](<#(resource) batches > (model) batch > (schema) > (property) object>)
status: Literal["validating", "failed", "in\_progress", 5 more]
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
cancelled\_at: Optional[int]
The Unix timestamp (in seconds) for when the batch was cancelled.
formatunixtime
[](<#(resource) batches > (model) batch > (schema) > (property) cancelled_at>)
cancelling\_at: Optional[int]
The Unix timestamp (in seconds) for when the batch started cancelling.
formatunixtime
[](<#(resource) batches > (model) batch > (schema) > (property) cancelling_at>)
completed\_at: Optional[int]
The Unix timestamp (in seconds) for when the batch was completed.
formatunixtime
[](<#(resource) batches > (model) batch > (schema) > (property) completed_at>)
error\_file\_id: Optional[str]
The ID of the file containing the outputs of requests with errors.
[](<#(resource) batches > (model) batch > (schema) > (property) error_file_id>)
errors: Optional[Errors]
data: Optional[List[[BatchError](</api/reference/python/resources/batches#(resource) batches > (model) batch_error > (schema)>)]]
code: Optional[str]
An error code identifying the error type.
[](<#(resource) batches > (model) batch_error > (schema) > (property) code>)
line: Optional[int]
The line number of the input file where the error occurred, if applicable.
[](<#(resource) batches > (model) batch_error > (schema) > (property) line>)
message: Optional[str]
A human-readable message providing more details about the error.
[](<#(resource) batches > (model) batch_error > (schema) > (property) message>)
param: Optional[str]
The name of the parameter that caused the error, if applicable.
[](<#(resource) batches > (model) batch_error > (schema) > (property) param>)
[](<#(resource) batches > (model) batch > (schema) > (property) errors > (property) data>)
object: Optional[str]
The object type, which is always `list`.
[](<#(resource) batches > (model) batch > (schema) > (property) errors > (property) object>)
[](<#(resource) batches > (model) batch > (schema) > (property) errors>)
expired\_at: Optional[int]
The Unix timestamp (in seconds) for when the batch expired.
formatunixtime
[](<#(resource) batches > (model) batch > (schema) > (property) expired_at>)
expires\_at: Optional[int]
The Unix timestamp (in seconds) for when the batch will expire.
formatunixtime
[](<#(resource) batches > (model) batch > (schema) > (property) expires_at>)
failed\_at: Optional[int]
The Unix timestamp (in seconds) for when the batch failed.
formatunixtime
[](<#(resource) batches > (model) batch > (schema) > (property) failed_at>)
finalizing\_at: Optional[int]
The Unix timestamp (in seconds) for when the batch started finalizing.
formatunixtime
[](<#(resource) batches > (model) batch > (schema) > (property) finalizing_at>)
in\_progress\_at: Optional[int]
The Unix timestamp (in seconds) for when the batch started processing.
formatunixtime
[](<#(resource) batches > (model) batch > (schema) > (property) in_progress_at>)
metadata: Optional[Metadata]
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) batches > (model) batch > (schema) > (property) metadata>)
model: Optional[str]
Model ID used to process the batch, like `gpt-5-2025-08-07`. OpenAI
offers a wide range of models with different capabilities, performance
characteristics, and price points. Refer to the [model
guide](https://platform.openai.com/docs/models) to browse and compare available models.
[](<#(resource) batches > (model) batch > (schema) > (property) model>)
output\_file\_id: Optional[str]
The ID of the file containing the outputs of successfully executed requests.
[](<#(resource) batches > (model) batch > (schema) > (property) output_file_id>)
request\_counts: Optional[BatchRequestCounts]
The request counts for different statuses within the batch.
completed: int
Number of requests that have been completed successfully.
[](<#(resource) batches > (model) batch > (schema) > (property) request_counts + (resource) batches > (model) batch_request_counts > (schema) > (property) completed>)
failed: int
Number of requests that have failed.
[](<#(resource) batches > (model) batch > (schema) > (property) request_counts + (resource) batches > (model) batch_request_counts > (schema) > (property) failed>)
total: int
Total number of requests in the batch.
[](<#(resource) batches > (model) batch > (schema) > (property) request_counts + (resource) batches > (model) batch_request_counts > (schema) > (property) total>)
[](<#(resource) batches > (model) batch > (schema) > (property) request_counts>)
usage: Optional[BatchUsage]
Represents token usage details including input tokens, output tokens, a
breakdown of output tokens, and the total tokens used. Only populated on
batches created after September 7, 2025.
input\_tokens: int
The number of input tokens.
[](<#(resource) batches > (model) batch > (schema) > (property) usage + (resource) batches > (model) batch_usage > (schema) > (property) input_tokens>)
input\_tokens\_details: InputTokensDetails
A detailed breakdown of the input tokens.
cached\_tokens: int
The number of tokens that were retrieved from the cache. [More on
prompt caching](https://platform.openai.com/docs/guides/prompt-caching).
[](<#(resource) batches > (model) batch > (schema) > (property) usage + (resource) batches > (model) batch_usage > (schema) > (property) input_tokens_details > (property) cached_tokens>)
[](<#(resource) batches > (model) batch > (schema) > (property) usage + (resource) batches > (model) batch_usage > (schema) > (property) input_tokens_details>)
output\_tokens: int
The number of output tokens.
[](<#(resource) batches > (model) batch > (schema) > (property) usage + (resource) batches > (model) batch_usage > (schema) > (property) output_tokens>)
output\_tokens\_details: OutputTokensDetails
A detailed breakdown of the output tokens.
reasoning\_tokens: int
The number of reasoning tokens.
[](<#(resource) batches > (model) batch > (schema) > (property) usage + (resource) batches > (model) batch_usage > (schema) > (property) output_tokens_details > (property) reasoning_tokens>)
[](<#(resource) batches > (model) batch > (schema) > (property) usage + (resource) batches > (model) batch_usage > (schema) > (property) output_tokens_details>)
total\_tokens: int
The total number of tokens used.
[](<#(resource) batches > (model) batch > (schema) > (property) usage + (resource) batches > (model) batch_usage > (schema) > (property) total_tokens>)
[](<#(resource) batches > (model) batch > (schema) > (property) usage>)
[](<#(resource) batches > (model) batch > (schema)>)
### Retrieve batch
Python
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
`from openai import OpenAI
client = OpenAI()
client.batches.retrieve("batch\_abc123")
`
```
```
`{
"id": "batch\_abc123",
"object": "batch",
"endpoint": "/v1/completions",
"errors": null,
"input\_file\_id": "file-abc123",
"completion\_window": "24h",
"status": "completed",
"output\_file\_id": "file-cvaTdG",
"error\_file\_id": "file-HOWS94",
"created\_at": 1711471533,
"in\_progress\_at": 1711471538,
"expires\_at": 1711557933,
"finalizing\_at": 1711493133,
"completed\_at": 1711493163,
"failed\_at": null,
"expired\_at": null,
"cancelling\_at": null,
"cancelled\_at": null,
"request\_counts": {
"total": 100,
"completed": 95,
"failed": 5
},
"metadata": {
"customer\_id": "user\_123456789",
"batch\_description": "Nightly eval job",
}
}
`
```
##### Returns Examples
```
`{
"id": "batch\_abc123",
"object": "batch",
"endpoint": "/v1/completions",
"errors": null,
"input\_file\_id": "file-abc123",
"completion\_window": "24h",
"status": "completed",
"output\_file\_id": "file-cvaTdG",
"error\_file\_id": "file-HOWS94",
"created\_at": 1711471533,
"in\_progress\_at": 1711471538,
"expires\_at": 1711557933,
"finalizing\_at": 1711493133,
"completed\_at": 1711493163,
"failed\_at": null,
"expired\_at": null,
"cancelling\_at": null,
"cancelled\_at": null,
"request\_counts": {
"total": 100,
"completed": 95,
"failed": 5
},
"metadata": {
"customer\_id": "user\_123456789",
"batch\_description": "Nightly eval job",
}
}
`
```