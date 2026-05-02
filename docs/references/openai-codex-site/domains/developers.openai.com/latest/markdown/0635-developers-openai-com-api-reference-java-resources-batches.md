Batches | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Batches
Create large batches of API requests to run asynchronously.
##### [Create batch](/api/reference/java/resources/batches/methods/create)
[Batch](</api/reference/java/resources/batches#(resource) batches > (model) batch > (schema)>) batches().create(BatchCreateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/batches
##### [Retrieve batch](/api/reference/java/resources/batches/methods/retrieve)
[Batch](</api/reference/java/resources/batches#(resource) batches > (model) batch > (schema)>) batches().retrieve(BatchRetrieveParamsparams = BatchRetrieveParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/batches/{batch\_id}
##### [Cancel batch](/api/reference/java/resources/batches/methods/cancel)
[Batch](</api/reference/java/resources/batches#(resource) batches > (model) batch > (schema)>) batches().cancel(BatchCancelParamsparams = BatchCancelParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
POST/batches/{batch\_id}/cancel
##### [List batches](/api/reference/java/resources/batches/methods/list)
BatchListPage batches().list(BatchListParamsparams = BatchListParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/batches
##### ModelsExpand Collapse
class Batch:
String id
[](<#(resource) batches > (model) batch > (schema) > (property) id>)
String completionWindow
The time frame within which the batch should be processed.
[](<#(resource) batches > (model) batch > (schema) > (property) completion_window>)
long createdAt
The Unix timestamp (in seconds) for when the batch was created.
formatunixtime
[](<#(resource) batches > (model) batch > (schema) > (property) created_at>)
String endpoint
The OpenAI API endpoint used by the batch.
[](<#(resource) batches > (model) batch > (schema) > (property) endpoint>)
String inputFileId
The ID of the input file for the batch.
[](<#(resource) batches > (model) batch > (schema) > (property) input_file_id>)
JsonValue; object\_ "batch"constant"batch"constant
The object type, which is always `batch`.
[](<#(resource) batches > (model) batch > (schema) > (property) object>)
Status status
The current status of the batch.
One of the following:
VALIDATING("validating")
[](<#(resource) batches > (model) batch > (schema) > (property) status > (member) 0>)
FAILED("failed")
[](<#(resource) batches > (model) batch > (schema) > (property) status > (member) 1>)
IN\_PROGRESS("in\_progress")
[](<#(resource) batches > (model) batch > (schema) > (property) status > (member) 2>)
FINALIZING("finalizing")
[](<#(resource) batches > (model) batch > (schema) > (property) status > (member) 3>)
COMPLETED("completed")
[](<#(resource) batches > (model) batch > (schema) > (property) status > (member) 4>)
EXPIRED("expired")
[](<#(resource) batches > (model) batch > (schema) > (property) status > (member) 5>)
CANCELLING("cancelling")
[](<#(resource) batches > (model) batch > (schema) > (property) status > (member) 6>)
CANCELLED("cancelled")
[](<#(resource) batches > (model) batch > (schema) > (property) status > (member) 7>)
[](<#(resource) batches > (model) batch > (schema) > (property) status>)
Optional\<Long\> cancelledAt
The Unix timestamp (in seconds) for when the batch was cancelled.
formatunixtime
[](<#(resource) batches > (model) batch > (schema) > (property) cancelled_at>)
Optional\<Long\> cancellingAt
The Unix timestamp (in seconds) for when the batch started cancelling.
formatunixtime
[](<#(resource) batches > (model) batch > (schema) > (property) cancelling_at>)
Optional\<Long\> completedAt
The Unix timestamp (in seconds) for when the batch was completed.
formatunixtime
[](<#(resource) batches > (model) batch > (schema) > (property) completed_at>)
Optional\<String\> errorFileId
The ID of the file containing the outputs of requests with errors.
[](<#(resource) batches > (model) batch > (schema) > (property) error_file_id>)
Optional\<Errors\> errors
Optional\<List\<[BatchError](</api/reference/java/resources/batches#(resource) batches > (model) batch_error > (schema)>)\>\> data
Optional\<String\> code
An error code identifying the error type.
[](<#(resource) batches > (model) batch_error > (schema) > (property) code>)
Optional\<Long\> line
The line number of the input file where the error occurred, if applicable.
[](<#(resource) batches > (model) batch_error > (schema) > (property) line>)
Optional\<String\> message
A human-readable message providing more details about the error.
[](<#(resource) batches > (model) batch_error > (schema) > (property) message>)
Optional\<String\> param
The name of the parameter that caused the error, if applicable.
[](<#(resource) batches > (model) batch_error > (schema) > (property) param>)
[](<#(resource) batches > (model) batch > (schema) > (property) errors > (property) data>)
Optional\<String\> object\_
The object type, which is always `list`.
[](<#(resource) batches > (model) batch > (schema) > (property) errors > (property) object>)
[](<#(resource) batches > (model) batch > (schema) > (property) errors>)
Optional\<Long\> expiredAt
The Unix timestamp (in seconds) for when the batch expired.
formatunixtime
[](<#(resource) batches > (model) batch > (schema) > (property) expired_at>)
Optional\<Long\> expiresAt
The Unix timestamp (in seconds) for when the batch will expire.
formatunixtime
[](<#(resource) batches > (model) batch > (schema) > (property) expires_at>)
Optional\<Long\> failedAt
The Unix timestamp (in seconds) for when the batch failed.
formatunixtime
[](<#(resource) batches > (model) batch > (schema) > (property) failed_at>)
Optional\<Long\> finalizingAt
The Unix timestamp (in seconds) for when the batch started finalizing.
formatunixtime
[](<#(resource) batches > (model) batch > (schema) > (property) finalizing_at>)
Optional\<Long\> inProgressAt
The Unix timestamp (in seconds) for when the batch started processing.
formatunixtime
[](<#(resource) batches > (model) batch > (schema) > (property) in_progress_at>)
Optional\<Metadata\> metadata
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) batches > (model) batch > (schema) > (property) metadata>)
Optional\<String\> model
Model ID used to process the batch, like `gpt-5-2025-08-07`. OpenAI
offers a wide range of models with different capabilities, performance
characteristics, and price points. Refer to the [model
guide](https://platform.openai.com/docs/models) to browse and compare available models.
[](<#(resource) batches > (model) batch > (schema) > (property) model>)
Optional\<String\> outputFileId
The ID of the file containing the outputs of successfully executed requests.
[](<#(resource) batches > (model) batch > (schema) > (property) output_file_id>)
Optional\<[BatchRequestCounts](</api/reference/java/resources/batches#(resource) batches > (model) batch_request_counts > (schema)>)\> requestCounts
The request counts for different statuses within the batch.
[](<#(resource) batches > (model) batch > (schema) > (property) request_counts>)
Optional\<[BatchUsage](</api/reference/java/resources/batches#(resource) batches > (model) batch_usage > (schema)>)\> usage
Represents token usage details including input tokens, output tokens, a
breakdown of output tokens, and the total tokens used. Only populated on
batches created after September 7, 2025.
[](<#(resource) batches > (model) batch > (schema) > (property) usage>)
[](<#(resource) batches > (model) batch > (schema)>)
class BatchError:
Optional\<String\> code
An error code identifying the error type.
[](<#(resource) batches > (model) batch_error > (schema) > (property) code>)
Optional\<Long\> line
The line number of the input file where the error occurred, if applicable.
[](<#(resource) batches > (model) batch_error > (schema) > (property) line>)
Optional\<String\> message
A human-readable message providing more details about the error.
[](<#(resource) batches > (model) batch_error > (schema) > (property) message>)
Optional\<String\> param
The name of the parameter that caused the error, if applicable.
[](<#(resource) batches > (model) batch_error > (schema) > (property) param>)
[](<#(resource) batches > (model) batch_error > (schema)>)
class BatchRequestCounts:
The request counts for different statuses within the batch.
long completed
Number of requests that have been completed successfully.
[](<#(resource) batches > (model) batch_request_counts > (schema) > (property) completed>)
long failed
Number of requests that have failed.
[](<#(resource) batches > (model) batch_request_counts > (schema) > (property) failed>)
long total
Total number of requests in the batch.
[](<#(resource) batches > (model) batch_request_counts > (schema) > (property) total>)
[](<#(resource) batches > (model) batch_request_counts > (schema)>)
class BatchUsage:
Represents token usage details including input tokens, output tokens, a
breakdown of output tokens, and the total tokens used. Only populated on
batches created after September 7, 2025.
long inputTokens
The number of input tokens.
[](<#(resource) batches > (model) batch_usage > (schema) > (property) input_tokens>)
InputTokensDetails inputTokensDetails
A detailed breakdown of the input tokens.
long cachedTokens
The number of tokens that were retrieved from the cache. [More on
prompt caching](https://platform.openai.com/docs/guides/prompt-caching).
[](<#(resource) batches > (model) batch_usage > (schema) > (property) input_tokens_details > (property) cached_tokens>)
[](<#(resource) batches > (model) batch_usage > (schema) > (property) input_tokens_details>)
long outputTokens
The number of output tokens.
[](<#(resource) batches > (model) batch_usage > (schema) > (property) output_tokens>)
OutputTokensDetails outputTokensDetails
A detailed breakdown of the output tokens.
long reasoningTokens
The number of reasoning tokens.
[](<#(resource) batches > (model) batch_usage > (schema) > (property) output_tokens_details > (property) reasoning_tokens>)
[](<#(resource) batches > (model) batch_usage > (schema) > (property) output_tokens_details>)
long totalTokens
The total number of tokens used.
[](<#(resource) batches > (model) batch_usage > (schema) > (property) total_tokens>)
[](<#(resource) batches > (model) batch_usage > (schema)>)