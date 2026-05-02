Create batch | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Batches](/api/reference/typescript/resources/batches)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create batch
client.batches.create(BatchCreateParams { completion\_window, endpoint, input\_file\_id, 2 more } body, RequestOptionsoptions?): [Batch](</api/reference/typescript/resources/batches#(resource) batches > (model) batch > (schema)>) { id, completion\_window, created\_at, 19 more }
POST/batches
Creates and executes a batch from an uploaded file of requests
##### ParametersExpand Collapse
body: BatchCreateParams { completion\_window, endpoint, input\_file\_id, 2 more }
completion\_window: "24h"
The time frame within which the batch should be processed. Currently only `24h` is supported.
[](<#(resource) batches > (method) create > (params) default > (param) completion_window>)
endpoint: "/v1/responses" | "/v1/chat/completions" | "/v1/embeddings" | 5 more
The endpoint to be used for all requests in the batch. Currently `/v1/responses`, `/v1/chat/completions`, `/v1/embeddings`, `/v1/completions`, `/v1/moderations`, `/v1/images/generations`, `/v1/images/edits`, and `/v1/videos` are supported. Note that `/v1/embeddings` batches are also restricted to a maximum of 50,000 embedding inputs across all requests in the batch.
One of the following:
"/v1/responses"
[](<#(resource) batches > (method) create > (params) default > (param) endpoint > (schema) > (member) 0>)
"/v1/chat/completions"
[](<#(resource) batches > (method) create > (params) default > (param) endpoint > (schema) > (member) 1>)
"/v1/embeddings"
[](<#(resource) batches > (method) create > (params) default > (param) endpoint > (schema) > (member) 2>)
"/v1/completions"
[](<#(resource) batches > (method) create > (params) default > (param) endpoint > (schema) > (member) 3>)
"/v1/moderations"
[](<#(resource) batches > (method) create > (params) default > (param) endpoint > (schema) > (member) 4>)
"/v1/images/generations"
[](<#(resource) batches > (method) create > (params) default > (param) endpoint > (schema) > (member) 5>)
"/v1/images/edits"
[](<#(resource) batches > (method) create > (params) default > (param) endpoint > (schema) > (member) 6>)
"/v1/videos"
[](<#(resource) batches > (method) create > (params) default > (param) endpoint > (schema) > (member) 7>)
[](<#(resource) batches > (method) create > (params) default > (param) endpoint>)
input\_file\_id: string
The ID of an uploaded file that contains requests for the new batch.
See [upload file](https://platform.openai.com/docs/api-reference/files/create) for how to upload a file.
Your input file must be formatted as a [JSONL file](https://platform.openai.com/docs/api-reference/batch/request-input), and must be uploaded with the purpose `batch`. The file can contain up to 50,000 requests, and can be up to 200 MB in size.
[](<#(resource) batches > (method) create > (params) default > (param) input_file_id>)
metadata?: [Metadata](</api/reference/typescript/resources/$shared#(resource) $shared > (model) metadata > (schema)>) | null
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) batches > (method) create > (params) default > (param) metadata>)
output\_expires\_after?: [OutputExpiresAfter](</api/reference/typescript/resources/batches/methods/create#(resource) batches > (method) create > (params) default > (param) output_expires_after > (schema)>)
The expiration policy for the output and/or error file that are generated for a batch.
anchor: "created\_at"
Anchor timestamp after which the expiration policy applies. Supported anchors: `created\_at`. Note that the anchor is the file creation time, not the time the batch is created.
[](<#(resource) batches > (method) create > (params) default > (param) output_expires_after > (schema) > (property) anchor>)
seconds: number
The number of seconds after the anchor time that the file will expire. Must be between 3600 (1 hour) and 2592000 (30 days).
formatint64
minimum3600
maximum2592000
[](<#(resource) batches > (method) create > (params) default > (param) output_expires_after > (schema) > (property) seconds>)
[](<#(resource) batches > (method) create > (params) default > (param) output_expires_after>)
[](<#(resource) batches > (method) create > (params) default>)
##### ReturnsExpand Collapse
Batch { id, completion\_window, created\_at, 19 more }
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
status: "validating" | "failed" | "in\_progress" | 5 more
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
cancelled\_at?: number
The Unix timestamp (in seconds) for when the batch was cancelled.
formatunixtime
[](<#(resource) batches > (model) batch > (schema) > (property) cancelled_at>)
cancelling\_at?: number
The Unix timestamp (in seconds) for when the batch started cancelling.
formatunixtime
[](<#(resource) batches > (model) batch > (schema) > (property) cancelling_at>)
completed\_at?: number
The Unix timestamp (in seconds) for when the batch was completed.
formatunixtime
[](<#(resource) batches > (model) batch > (schema) > (property) completed_at>)
error\_file\_id?: string
The ID of the file containing the outputs of requests with errors.
[](<#(resource) batches > (model) batch > (schema) > (property) error_file_id>)
errors?: Errors { data, object }
data?: Array\<[BatchError](</api/reference/typescript/resources/batches#(resource) batches > (model) batch_error > (schema)>) { code, line, message, param } \>
code?: string
An error code identifying the error type.
[](<#(resource) batches > (model) batch_error > (schema) > (property) code>)
line?: number | null
The line number of the input file where the error occurred, if applicable.
[](<#(resource) batches > (model) batch_error > (schema) > (property) line>)
message?: string
A human-readable message providing more details about the error.
[](<#(resource) batches > (model) batch_error > (schema) > (property) message>)
param?: string | null
The name of the parameter that caused the error, if applicable.
[](<#(resource) batches > (model) batch_error > (schema) > (property) param>)
[](<#(resource) batches > (model) batch > (schema) > (property) errors > (property) data>)
object?: string
The object type, which is always `list`.
[](<#(resource) batches > (model) batch > (schema) > (property) errors > (property) object>)
[](<#(resource) batches > (model) batch > (schema) > (property) errors>)
expired\_at?: number
The Unix timestamp (in seconds) for when the batch expired.
formatunixtime
[](<#(resource) batches > (model) batch > (schema) > (property) expired_at>)
expires\_at?: number
The Unix timestamp (in seconds) for when the batch will expire.
formatunixtime
[](<#(resource) batches > (model) batch > (schema) > (property) expires_at>)
failed\_at?: number
The Unix timestamp (in seconds) for when the batch failed.
formatunixtime
[](<#(resource) batches > (model) batch > (schema) > (property) failed_at>)
finalizing\_at?: number
The Unix timestamp (in seconds) for when the batch started finalizing.
formatunixtime
[](<#(resource) batches > (model) batch > (schema) > (property) finalizing_at>)
in\_progress\_at?: number
The Unix timestamp (in seconds) for when the batch started processing.
formatunixtime
[](<#(resource) batches > (model) batch > (schema) > (property) in_progress_at>)
metadata?: [Metadata](</api/reference/typescript/resources/$shared#(resource) $shared > (model) metadata > (schema)>) | null
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) batches > (model) batch > (schema) > (property) metadata>)
model?: string
Model ID used to process the batch, like `gpt-5-2025-08-07`. OpenAI
offers a wide range of models with different capabilities, performance
characteristics, and price points. Refer to the [model
guide](https://platform.openai.com/docs/models) to browse and compare available models.
[](<#(resource) batches > (model) batch > (schema) > (property) model>)
output\_file\_id?: string
The ID of the file containing the outputs of successfully executed requests.
[](<#(resource) batches > (model) batch > (schema) > (property) output_file_id>)
request\_counts?: [BatchRequestCounts](</api/reference/typescript/resources/batches#(resource) batches > (model) batch_request_counts > (schema)>) { completed, failed, total }
The request counts for different statuses within the batch.
completed: number
Number of requests that have been completed successfully.
[](<#(resource) batches > (model) batch > (schema) > (property) request_counts + (resource) batches > (model) batch_request_counts > (schema) > (property) completed>)
failed: number
Number of requests that have failed.
[](<#(resource) batches > (model) batch > (schema) > (property) request_counts + (resource) batches > (model) batch_request_counts > (schema) > (property) failed>)
total: number
Total number of requests in the batch.
[](<#(resource) batches > (model) batch > (schema) > (property) request_counts + (resource) batches > (model) batch_request_counts > (schema) > (property) total>)
[](<#(resource) batches > (model) batch > (schema) > (property) request_counts>)
usage?: [BatchUsage](</api/reference/typescript/resources/batches#(resource) batches > (model) batch_usage > (schema)>) { input\_tokens, input\_tokens\_details, output\_tokens, 2 more }
Represents token usage details including input tokens, output tokens, a
breakdown of output tokens, and the total tokens used. Only populated on
batches created after September 7, 2025.
input\_tokens: number
The number of input tokens.
[](<#(resource) batches > (model) batch > (schema) > (property) usage + (resource) batches > (model) batch_usage > (schema) > (property) input_tokens>)
input\_tokens\_details: InputTokensDetails { cached\_tokens }
A detailed breakdown of the input tokens.
cached\_tokens: number
The number of tokens that were retrieved from the cache. [More on
prompt caching](https://platform.openai.com/docs/guides/prompt-caching).
[](<#(resource) batches > (model) batch > (schema) > (property) usage + (resource) batches > (model) batch_usage > (schema) > (property) input_tokens_details > (property) cached_tokens>)
[](<#(resource) batches > (model) batch > (schema) > (property) usage + (resource) batches > (model) batch_usage > (schema) > (property) input_tokens_details>)
output\_tokens: number
The number of output tokens.
[](<#(resource) batches > (model) batch > (schema) > (property) usage + (resource) batches > (model) batch_usage > (schema) > (property) output_tokens>)
output\_tokens\_details: OutputTokensDetails { reasoning\_tokens }
A detailed breakdown of the output tokens.
reasoning\_tokens: number
The number of reasoning tokens.
[](<#(resource) batches > (model) batch > (schema) > (property) usage + (resource) batches > (model) batch_usage > (schema) > (property) output_tokens_details > (property) reasoning_tokens>)
[](<#(resource) batches > (model) batch > (schema) > (property) usage + (resource) batches > (model) batch_usage > (schema) > (property) output_tokens_details>)
total\_tokens: number
The total number of tokens used.
[](<#(resource) batches > (model) batch > (schema) > (property) usage + (resource) batches > (model) batch_usage > (schema) > (property) total_tokens>)
[](<#(resource) batches > (model) batch > (schema) > (property) usage>)
[](<#(resource) batches > (model) batch > (schema)>)
### Create batch
TypeScript
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
`import OpenAI from "openai";
const openai = new OpenAI();
async function main() {
const batch = await openai.batches.create({
input\_file\_id: "file-abc123",
endpoint: "/v1/chat/completions",
completion\_window: "24h"
});
console.log(batch);
}
main();
`
```
```
`{
"id": "batch\_abc123",
"object": "batch",
"endpoint": "/v1/chat/completions",
"errors": null,
"input\_file\_id": "file-abc123",
"completion\_window": "24h",
"status": "validating",
"output\_file\_id": null,
"error\_file\_id": null,
"created\_at": 1711471533,
"in\_progress\_at": null,
"expires\_at": null,
"finalizing\_at": null,
"completed\_at": null,
"failed\_at": null,
"expired\_at": null,
"cancelling\_at": null,
"cancelled\_at": null,
"request\_counts": {
"total": 0,
"completed": 0,
"failed": 0
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
"endpoint": "/v1/chat/completions",
"errors": null,
"input\_file\_id": "file-abc123",
"completion\_window": "24h",
"status": "validating",
"output\_file\_id": null,
"error\_file\_id": null,
"created\_at": 1711471533,
"in\_progress\_at": null,
"expires\_at": null,
"finalizing\_at": null,
"completed\_at": null,
"failed\_at": null,
"expired\_at": null,
"cancelling\_at": null,
"cancelled\_at": null,
"request\_counts": {
"total": 0,
"completed": 0,
"failed": 0
},
"metadata": {
"customer\_id": "user\_123456789",
"batch\_description": "Nightly eval job",
}
}
`
```