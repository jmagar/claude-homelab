Create batch | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Batches](/api/reference/go/resources/batches)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Create batch
client.Batches.New(ctx, body) (\*[Batch](</api/reference/go/resources/batches#(resource) batches > (model) batch > (schema)>), error)
POST/batches
Creates and executes a batch from an uploaded file of requests
##### ParametersExpand Collapse
body BatchNewParams
CompletionWindow param.Field[[BatchNewParamsCompletionWindow](</api/reference/go/resources/batches/methods/create#(resource) batches > (method) create > (params) default > (param) completion_window > (schema)>)]
The time frame within which the batch should be processed. Currently only `24h` is supported.
const BatchNewParamsCompletionWindow24h [BatchNewParamsCompletionWindow](</api/reference/go/resources/batches/methods/create#(resource) batches > (method) create > (params) default > (param) completion_window > (schema)>) = "24h"
[](<#(resource) batches > (method) create > (params) default > (param) completion_window > (schema) > (member) 0>)
[](<#(resource) batches > (method) create > (params) default > (param) completion_window>)
Endpoint param.Field[[BatchNewParamsEndpoint](</api/reference/go/resources/batches/methods/create#(resource) batches > (method) create > (params) default > (param) endpoint > (schema)>)]
The endpoint to be used for all requests in the batch. Currently `/v1/responses`, `/v1/chat/completions`, `/v1/embeddings`, `/v1/completions`, `/v1/moderations`, `/v1/images/generations`, `/v1/images/edits`, and `/v1/videos` are supported. Note that `/v1/embeddings` batches are also restricted to a maximum of 50,000 embedding inputs across all requests in the batch.
const BatchNewParamsEndpointV1Responses [BatchNewParamsEndpoint](</api/reference/go/resources/batches/methods/create#(resource) batches > (method) create > (params) default > (param) endpoint > (schema)>) = "/v1/responses"
[](<#(resource) batches > (method) create > (params) default > (param) endpoint > (schema) > (member) 0>)
const BatchNewParamsEndpointV1ChatCompletions [BatchNewParamsEndpoint](</api/reference/go/resources/batches/methods/create#(resource) batches > (method) create > (params) default > (param) endpoint > (schema)>) = "/v1/chat/completions"
[](<#(resource) batches > (method) create > (params) default > (param) endpoint > (schema) > (member) 1>)
const BatchNewParamsEndpointV1Embeddings [BatchNewParamsEndpoint](</api/reference/go/resources/batches/methods/create#(resource) batches > (method) create > (params) default > (param) endpoint > (schema)>) = "/v1/embeddings"
[](<#(resource) batches > (method) create > (params) default > (param) endpoint > (schema) > (member) 2>)
const BatchNewParamsEndpointV1Completions [BatchNewParamsEndpoint](</api/reference/go/resources/batches/methods/create#(resource) batches > (method) create > (params) default > (param) endpoint > (schema)>) = "/v1/completions"
[](<#(resource) batches > (method) create > (params) default > (param) endpoint > (schema) > (member) 3>)
const BatchNewParamsEndpointV1Moderations [BatchNewParamsEndpoint](</api/reference/go/resources/batches/methods/create#(resource) batches > (method) create > (params) default > (param) endpoint > (schema)>) = "/v1/moderations"
[](<#(resource) batches > (method) create > (params) default > (param) endpoint > (schema) > (member) 4>)
const BatchNewParamsEndpointV1ImagesGenerations [BatchNewParamsEndpoint](</api/reference/go/resources/batches/methods/create#(resource) batches > (method) create > (params) default > (param) endpoint > (schema)>) = "/v1/images/generations"
[](<#(resource) batches > (method) create > (params) default > (param) endpoint > (schema) > (member) 5>)
const BatchNewParamsEndpointV1ImagesEdits [BatchNewParamsEndpoint](</api/reference/go/resources/batches/methods/create#(resource) batches > (method) create > (params) default > (param) endpoint > (schema)>) = "/v1/images/edits"
[](<#(resource) batches > (method) create > (params) default > (param) endpoint > (schema) > (member) 6>)
const BatchNewParamsEndpointV1Videos [BatchNewParamsEndpoint](</api/reference/go/resources/batches/methods/create#(resource) batches > (method) create > (params) default > (param) endpoint > (schema)>) = "/v1/videos"
[](<#(resource) batches > (method) create > (params) default > (param) endpoint > (schema) > (member) 7>)
[](<#(resource) batches > (method) create > (params) default > (param) endpoint>)
InputFileID param.Field[string]
The ID of an uploaded file that contains requests for the new batch.
See [upload file](https://platform.openai.com/docs/api-reference/files/create) for how to upload a file.
Your input file must be formatted as a [JSONL file](https://platform.openai.com/docs/api-reference/batch/request-input), and must be uploaded with the purpose `batch`. The file can contain up to 50,000 requests, and can be up to 200 MB in size.
[](<#(resource) batches > (method) create > (params) default > (param) input_file_id>)
Metadata param.Field[[Metadata](</api/reference/go/resources/$shared#(resource) $shared > (model) metadata > (schema)>)]Optional
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) batches > (method) create > (params) default > (param) metadata>)
OutputExpiresAfter param.Field[[BatchNewParamsOutputExpiresAfter](</api/reference/go/resources/batches/methods/create#(resource) batches > (method) create > (params) default > (param) output_expires_after > (schema)>)]Optional
The expiration policy for the output and/or error file that are generated for a batch.
Anchor CreatedAt
Anchor timestamp after which the expiration policy applies. Supported anchors: `created\_at`. Note that the anchor is the file creation time, not the time the batch is created.
[](<#(resource) batches > (method) create > (params) default > (param) output_expires_after > (schema) > (property) anchor>)
Seconds int64
The number of seconds after the anchor time that the file will expire. Must be between 3600 (1 hour) and 2592000 (30 days).
formatint64
minimum3600
maximum2592000
[](<#(resource) batches > (method) create > (params) default > (param) output_expires_after > (schema) > (property) seconds>)
[](<#(resource) batches > (method) create > (params) default > (param) output_expires_after>)
[](<#(resource) batches > (method) create > (params) default>)
##### ReturnsExpand Collapse
type Batch struct{…}
ID string
[](<#(resource) batches > (model) batch > (schema) > (property) id>)
CompletionWindow string
The time frame within which the batch should be processed.
[](<#(resource) batches > (model) batch > (schema) > (property) completion_window>)
CreatedAt int64
The Unix timestamp (in seconds) for when the batch was created.
formatunixtime
[](<#(resource) batches > (model) batch > (schema) > (property) created_at>)
Endpoint string
The OpenAI API endpoint used by the batch.
[](<#(resource) batches > (model) batch > (schema) > (property) endpoint>)
InputFileID string
The ID of the input file for the batch.
[](<#(resource) batches > (model) batch > (schema) > (property) input_file_id>)
Object Batch
The object type, which is always `batch`.
[](<#(resource) batches > (model) batch > (schema) > (property) object>)
Status BatchStatus
The current status of the batch.
One of the following:
const BatchStatusValidating BatchStatus = "validating"
[](<#(resource) batches > (model) batch > (schema) > (property) status > (member) 0>)
const BatchStatusFailed BatchStatus = "failed"
[](<#(resource) batches > (model) batch > (schema) > (property) status > (member) 1>)
const BatchStatusInProgress BatchStatus = "in\_progress"
[](<#(resource) batches > (model) batch > (schema) > (property) status > (member) 2>)
const BatchStatusFinalizing BatchStatus = "finalizing"
[](<#(resource) batches > (model) batch > (schema) > (property) status > (member) 3>)
const BatchStatusCompleted BatchStatus = "completed"
[](<#(resource) batches > (model) batch > (schema) > (property) status > (member) 4>)
const BatchStatusExpired BatchStatus = "expired"
[](<#(resource) batches > (model) batch > (schema) > (property) status > (member) 5>)
const BatchStatusCancelling BatchStatus = "cancelling"
[](<#(resource) batches > (model) batch > (schema) > (property) status > (member) 6>)
const BatchStatusCancelled BatchStatus = "cancelled"
[](<#(resource) batches > (model) batch > (schema) > (property) status > (member) 7>)
[](<#(resource) batches > (model) batch > (schema) > (property) status>)
CancelledAt int64Optional
The Unix timestamp (in seconds) for when the batch was cancelled.
formatunixtime
[](<#(resource) batches > (model) batch > (schema) > (property) cancelled_at>)
CancellingAt int64Optional
The Unix timestamp (in seconds) for when the batch started cancelling.
formatunixtime
[](<#(resource) batches > (model) batch > (schema) > (property) cancelling_at>)
CompletedAt int64Optional
The Unix timestamp (in seconds) for when the batch was completed.
formatunixtime
[](<#(resource) batches > (model) batch > (schema) > (property) completed_at>)
ErrorFileID stringOptional
The ID of the file containing the outputs of requests with errors.
[](<#(resource) batches > (model) batch > (schema) > (property) error_file_id>)
Errors BatchErrorsOptional
Data [][BatchError](</api/reference/go/resources/batches#(resource) batches > (model) batch_error > (schema)>)Optional
Code stringOptional
An error code identifying the error type.
[](<#(resource) batches > (model) batch_error > (schema) > (property) code>)
Line int64Optional
The line number of the input file where the error occurred, if applicable.
[](<#(resource) batches > (model) batch_error > (schema) > (property) line>)
Message stringOptional
A human-readable message providing more details about the error.
[](<#(resource) batches > (model) batch_error > (schema) > (property) message>)
Param stringOptional
The name of the parameter that caused the error, if applicable.
[](<#(resource) batches > (model) batch_error > (schema) > (property) param>)
[](<#(resource) batches > (model) batch > (schema) > (property) errors > (property) data>)
Object stringOptional
The object type, which is always `list`.
[](<#(resource) batches > (model) batch > (schema) > (property) errors > (property) object>)
[](<#(resource) batches > (model) batch > (schema) > (property) errors>)
ExpiredAt int64Optional
The Unix timestamp (in seconds) for when the batch expired.
formatunixtime
[](<#(resource) batches > (model) batch > (schema) > (property) expired_at>)
ExpiresAt int64Optional
The Unix timestamp (in seconds) for when the batch will expire.
formatunixtime
[](<#(resource) batches > (model) batch > (schema) > (property) expires_at>)
FailedAt int64Optional
The Unix timestamp (in seconds) for when the batch failed.
formatunixtime
[](<#(resource) batches > (model) batch > (schema) > (property) failed_at>)
FinalizingAt int64Optional
The Unix timestamp (in seconds) for when the batch started finalizing.
formatunixtime
[](<#(resource) batches > (model) batch > (schema) > (property) finalizing_at>)
InProgressAt int64Optional
The Unix timestamp (in seconds) for when the batch started processing.
formatunixtime
[](<#(resource) batches > (model) batch > (schema) > (property) in_progress_at>)
Metadata [Metadata](</api/reference/go/resources/$shared#(resource) $shared > (model) metadata > (schema)>)Optional
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) batches > (model) batch > (schema) > (property) metadata>)
Model stringOptional
Model ID used to process the batch, like `gpt-5-2025-08-07`. OpenAI
offers a wide range of models with different capabilities, performance
characteristics, and price points. Refer to the [model
guide](https://platform.openai.com/docs/models) to browse and compare available models.
[](<#(resource) batches > (model) batch > (schema) > (property) model>)
OutputFileID stringOptional
The ID of the file containing the outputs of successfully executed requests.
[](<#(resource) batches > (model) batch > (schema) > (property) output_file_id>)
RequestCounts [BatchRequestCounts](</api/reference/go/resources/batches#(resource) batches > (model) batch_request_counts > (schema)>)Optional
The request counts for different statuses within the batch.
Completed int64
Number of requests that have been completed successfully.
[](<#(resource) batches > (model) batch > (schema) > (property) request_counts + (resource) batches > (model) batch_request_counts > (schema) > (property) completed>)
Failed int64
Number of requests that have failed.
[](<#(resource) batches > (model) batch > (schema) > (property) request_counts + (resource) batches > (model) batch_request_counts > (schema) > (property) failed>)
Total int64
Total number of requests in the batch.
[](<#(resource) batches > (model) batch > (schema) > (property) request_counts + (resource) batches > (model) batch_request_counts > (schema) > (property) total>)
[](<#(resource) batches > (model) batch > (schema) > (property) request_counts>)
Usage [BatchUsage](</api/reference/go/resources/batches#(resource) batches > (model) batch_usage > (schema)>)Optional
Represents token usage details including input tokens, output tokens, a
breakdown of output tokens, and the total tokens used. Only populated on
batches created after September 7, 2025.
InputTokens int64
The number of input tokens.
[](<#(resource) batches > (model) batch > (schema) > (property) usage + (resource) batches > (model) batch_usage > (schema) > (property) input_tokens>)
InputTokensDetails BatchUsageInputTokensDetails
A detailed breakdown of the input tokens.
CachedTokens int64
The number of tokens that were retrieved from the cache. [More on
prompt caching](https://platform.openai.com/docs/guides/prompt-caching).
[](<#(resource) batches > (model) batch > (schema) > (property) usage + (resource) batches > (model) batch_usage > (schema) > (property) input_tokens_details > (property) cached_tokens>)
[](<#(resource) batches > (model) batch > (schema) > (property) usage + (resource) batches > (model) batch_usage > (schema) > (property) input_tokens_details>)
OutputTokens int64
The number of output tokens.
[](<#(resource) batches > (model) batch > (schema) > (property) usage + (resource) batches > (model) batch_usage > (schema) > (property) output_tokens>)
OutputTokensDetails BatchUsageOutputTokensDetails
A detailed breakdown of the output tokens.
ReasoningTokens int64
The number of reasoning tokens.
[](<#(resource) batches > (model) batch > (schema) > (property) usage + (resource) batches > (model) batch_usage > (schema) > (property) output_tokens_details > (property) reasoning_tokens>)
[](<#(resource) batches > (model) batch > (schema) > (property) usage + (resource) batches > (model) batch_usage > (schema) > (property) output_tokens_details>)
TotalTokens int64
The total number of tokens used.
[](<#(resource) batches > (model) batch > (schema) > (property) usage + (resource) batches > (model) batch_usage > (schema) > (property) total_tokens>)
[](<#(resource) batches > (model) batch > (schema) > (property) usage>)
[](<#(resource) batches > (model) batch > (schema)>)
### Create batch
Go
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
`package main
import (
"context"
"fmt"
"github.com/openai/openai-go"
"github.com/openai/openai-go/option"
)
func main() {
client := openai.NewClient(
option.WithAPIKey("My API Key"),
)
batch, err := client.Batches.New(context.TODO(), openai.BatchNewParams{
CompletionWindow: openai.BatchNewParamsCompletionWindow24h,
Endpoint: openai.BatchNewParamsEndpointV1Responses,
InputFileID: "input\_file\_id",
})
if err != nil {
panic(err.Error())
}
fmt.Printf("%+v\\n", batch.ID)
}
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