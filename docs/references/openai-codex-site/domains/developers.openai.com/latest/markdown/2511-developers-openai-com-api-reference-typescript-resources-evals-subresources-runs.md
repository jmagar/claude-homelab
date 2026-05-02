Output Items | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Evals](/api/reference/typescript/resources/evals)
[Runs](/api/reference/typescript/resources/evals/subresources/runs)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Output Items
Manage and run evals in the OpenAI platform.
##### [Get eval run output items](/api/reference/typescript/resources/evals/subresources/runs/subresources/output_items/methods/list)
client.evals.runs.outputItems.list(stringrunID, OutputItemListParams { eval\_id, after, limit, 2 more } params, RequestOptionsoptions?): CursorPage\<[OutputItemListResponse](</api/reference/typescript/resources/evals#(resource) evals.runs.output_items > (model) output_item_list_response > (schema)>) { id, created\_at, datasource\_item, 7 more } \>
GET/evals/{eval\_id}/runs/{run\_id}/output\_items
##### [Get an output item of an eval run](/api/reference/typescript/resources/evals/subresources/runs/subresources/output_items/methods/retrieve)
client.evals.runs.outputItems.retrieve(stringoutputItemID, OutputItemRetrieveParams { eval\_id, run\_id } params, RequestOptionsoptions?): [OutputItemRetrieveResponse](</api/reference/typescript/resources/evals#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema)>) { id, created\_at, datasource\_item, 7 more }
GET/evals/{eval\_id}/runs/{run\_id}/output\_items/{output\_item\_id}
##### ModelsExpand Collapse
OutputItemListResponse { id, created\_at, datasource\_item, 7 more }
A schema representing an evaluation run output item.
id: string
Unique identifier for the evaluation run output item.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) id>)
created\_at: number
Unix timestamp (in seconds) when the evaluation run was created.
formatunixtime
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) created_at>)
datasource\_item: Record\<string, unknown\>
Details of the input data source item.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) datasource_item>)
datasource\_item\_id: number
The identifier for the data source item.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) datasource_item_id>)
eval\_id: string
The identifier of the evaluation group.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) eval_id>)
object: "eval.run.output\_item"
The type of the object. Always “eval.run.output\_item”.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) object>)
results: Array\<Result\>
A list of grader results for this output item.
name: string
The name of the grader.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) results > (items) > (property) name>)
passed: boolean
Whether the grader considered the output a pass.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) results > (items) > (property) passed>)
score: number
The numeric score produced by the grader.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) results > (items) > (property) score>)
sample?: Record\<string, unknown\> | null
Optional sample or intermediate data produced by the grader.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) results > (items) > (property) sample>)
type?: string
The grader type (for example, “string-check-grader”).
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) results > (items) > (property) type>)
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) results>)
run\_id: string
The identifier of the evaluation run associated with this output item.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) run_id>)
sample: Sample { error, finish\_reason, input, 7 more }
A sample containing the input and output of the evaluation run.
error: [EvalAPIError](</api/reference/typescript/resources/evals#(resource) evals.runs > (model) eval_api_error > (schema)>) { code, message }
An object representing an error response from the Eval API.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample > (property) error>)
finish\_reason: string
The reason why the sample generation was finished.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample > (property) finish_reason>)
input: Array\<Input\>
An array of input messages.
content: string
The content of the message.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample > (property) input > (items) > (property) content>)
role: string
The role of the message sender (e.g., system, user, developer).
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample > (property) input > (items) > (property) role>)
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample > (property) input>)
max\_completion\_tokens: number
The maximum number of tokens allowed for completion.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample > (property) max_completion_tokens>)
model: string
The model used for generating the sample.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample > (property) model>)
output: Array\<Output\>
An array of output messages.
content?: string
The content of the message.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample > (property) output > (items) > (property) content>)
role?: string
The role of the message (e.g. “system”, “assistant”, “user”).
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample > (property) output > (items) > (property) role>)
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample > (property) output>)
seed: number
The seed used for generating the sample.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample > (property) seed>)
temperature: number
The sampling temperature used.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample > (property) temperature>)
top\_p: number
The top\_p value used for sampling.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample > (property) top_p>)
usage: Usage { cached\_tokens, completion\_tokens, prompt\_tokens, total\_tokens }
Token usage details for the sample.
cached\_tokens: number
The number of tokens retrieved from cache.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample > (property) usage > (property) cached_tokens>)
completion\_tokens: number
The number of completion tokens generated.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample > (property) usage > (property) completion_tokens>)
prompt\_tokens: number
The number of prompt tokens used.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample > (property) usage > (property) prompt_tokens>)
total\_tokens: number
The total number of tokens used.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample > (property) usage > (property) total_tokens>)
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample > (property) usage>)
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample>)
status: string
The status of the evaluation run.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) status>)
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema)>)
OutputItemRetrieveResponse { id, created\_at, datasource\_item, 7 more }
A schema representing an evaluation run output item.
id: string
Unique identifier for the evaluation run output item.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) id>)
created\_at: number
Unix timestamp (in seconds) when the evaluation run was created.
formatunixtime
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) created_at>)
datasource\_item: Record\<string, unknown\>
Details of the input data source item.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) datasource_item>)
datasource\_item\_id: number
The identifier for the data source item.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) datasource_item_id>)
eval\_id: string
The identifier of the evaluation group.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) eval_id>)
object: "eval.run.output\_item"
The type of the object. Always “eval.run.output\_item”.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) object>)
results: Array\<Result\>
A list of grader results for this output item.
name: string
The name of the grader.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) results > (items) > (property) name>)
passed: boolean
Whether the grader considered the output a pass.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) results > (items) > (property) passed>)
score: number
The numeric score produced by the grader.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) results > (items) > (property) score>)
sample?: Record\<string, unknown\> | null
Optional sample or intermediate data produced by the grader.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) results > (items) > (property) sample>)
type?: string
The grader type (for example, “string-check-grader”).
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) results > (items) > (property) type>)
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) results>)
run\_id: string
The identifier of the evaluation run associated with this output item.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) run_id>)
sample: Sample { error, finish\_reason, input, 7 more }
A sample containing the input and output of the evaluation run.
error: [EvalAPIError](</api/reference/typescript/resources/evals#(resource) evals.runs > (model) eval_api_error > (schema)>) { code, message }
An object representing an error response from the Eval API.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample > (property) error>)
finish\_reason: string
The reason why the sample generation was finished.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample > (property) finish_reason>)
input: Array\<Input\>
An array of input messages.
content: string
The content of the message.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample > (property) input > (items) > (property) content>)
role: string
The role of the message sender (e.g., system, user, developer).
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample > (property) input > (items) > (property) role>)
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample > (property) input>)
max\_completion\_tokens: number
The maximum number of tokens allowed for completion.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample > (property) max_completion_tokens>)
model: string
The model used for generating the sample.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample > (property) model>)
output: Array\<Output\>
An array of output messages.
content?: string
The content of the message.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample > (property) output > (items) > (property) content>)
role?: string
The role of the message (e.g. “system”, “assistant”, “user”).
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample > (property) output > (items) > (property) role>)
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample > (property) output>)
seed: number
The seed used for generating the sample.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample > (property) seed>)
temperature: number
The sampling temperature used.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample > (property) temperature>)
top\_p: number
The top\_p value used for sampling.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample > (property) top_p>)
usage: Usage { cached\_tokens, completion\_tokens, prompt\_tokens, total\_tokens }
Token usage details for the sample.
cached\_tokens: number
The number of tokens retrieved from cache.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample > (property) usage > (property) cached_tokens>)
completion\_tokens: number
The number of completion tokens generated.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample > (property) usage > (property) completion_tokens>)
prompt\_tokens: number
The number of prompt tokens used.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample > (property) usage > (property) prompt_tokens>)
total\_tokens: number
The total number of tokens used.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample > (property) usage > (property) total_tokens>)
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample > (property) usage>)
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample>)
status: string
The status of the evaluation run.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) status>)
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema)>)