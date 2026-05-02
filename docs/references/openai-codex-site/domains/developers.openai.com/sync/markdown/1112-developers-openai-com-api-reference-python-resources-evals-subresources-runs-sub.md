Output Items | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Evals](/api/reference/python/resources/evals)
[Runs](/api/reference/python/resources/evals/subresources/runs)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Output Items
Manage and run evals in the OpenAI platform.
##### [Get eval run output items](/api/reference/python/resources/evals/subresources/runs/subresources/output_items/methods/list)
evals.runs.output\_items.list(strrun\_id, OutputItemListParams\*\*kwargs) -\> SyncCursorPage[[OutputItemListResponse](</api/reference/python/resources/evals#(resource) evals.runs.output_items > (model) output_item_list_response > (schema)>)]
GET/evals/{eval\_id}/runs/{run\_id}/output\_items
##### [Get an output item of an eval run](/api/reference/python/resources/evals/subresources/runs/subresources/output_items/methods/retrieve)
evals.runs.output\_items.retrieve(stroutput\_item\_id, OutputItemRetrieveParams\*\*kwargs) -\> [OutputItemRetrieveResponse](</api/reference/python/resources/evals#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema)>)
GET/evals/{eval\_id}/runs/{run\_id}/output\_items/{output\_item\_id}
##### ModelsExpand Collapse
class OutputItemListResponse: …
A schema representing an evaluation run output item.
id: str
Unique identifier for the evaluation run output item.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) id>)
created\_at: int
Unix timestamp (in seconds) when the evaluation run was created.
formatunixtime
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) created_at>)
datasource\_item: Dict[str, object]
Details of the input data source item.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) datasource_item>)
datasource\_item\_id: int
The identifier for the data source item.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) datasource_item_id>)
eval\_id: str
The identifier of the evaluation group.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) eval_id>)
object: Literal["eval.run.output\_item"]
The type of the object. Always “eval.run.output\_item”.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) object>)
results: List[Result]
A list of grader results for this output item.
name: str
The name of the grader.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) results > (items) > (property) name>)
passed: bool
Whether the grader considered the output a pass.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) results > (items) > (property) passed>)
score: float
The numeric score produced by the grader.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) results > (items) > (property) score>)
sample: Optional[Dict[str, object]]
Optional sample or intermediate data produced by the grader.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) results > (items) > (property) sample>)
type: Optional[str]
The grader type (for example, “string-check-grader”).
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) results > (items) > (property) type>)
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) results>)
run\_id: str
The identifier of the evaluation run associated with this output item.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) run_id>)
sample: Sample
A sample containing the input and output of the evaluation run.
error: [EvalAPIError](</api/reference/python/resources/evals#(resource) evals.runs > (model) eval_api_error > (schema)>)
An object representing an error response from the Eval API.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample > (property) error>)
finish\_reason: str
The reason why the sample generation was finished.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample > (property) finish_reason>)
input: List[SampleInput]
An array of input messages.
content: str
The content of the message.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample > (property) input > (items) > (property) content>)
role: str
The role of the message sender (e.g., system, user, developer).
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample > (property) input > (items) > (property) role>)
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample > (property) input>)
max\_completion\_tokens: int
The maximum number of tokens allowed for completion.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample > (property) max_completion_tokens>)
model: str
The model used for generating the sample.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample > (property) model>)
output: List[SampleOutput]
An array of output messages.
content: Optional[str]
The content of the message.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample > (property) output > (items) > (property) content>)
role: Optional[str]
The role of the message (e.g. “system”, “assistant”, “user”).
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample > (property) output > (items) > (property) role>)
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample > (property) output>)
seed: int
The seed used for generating the sample.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample > (property) seed>)
temperature: float
The sampling temperature used.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample > (property) temperature>)
top\_p: float
The top\_p value used for sampling.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample > (property) top_p>)
usage: SampleUsage
Token usage details for the sample.
cached\_tokens: int
The number of tokens retrieved from cache.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample > (property) usage > (property) cached_tokens>)
completion\_tokens: int
The number of completion tokens generated.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample > (property) usage > (property) completion_tokens>)
prompt\_tokens: int
The number of prompt tokens used.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample > (property) usage > (property) prompt_tokens>)
total\_tokens: int
The total number of tokens used.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample > (property) usage > (property) total_tokens>)
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample > (property) usage>)
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) sample>)
status: str
The status of the evaluation run.
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema) > (property) status>)
[](<#(resource) evals.runs.output_items > (model) output_item_list_response > (schema)>)
class OutputItemRetrieveResponse: …
A schema representing an evaluation run output item.
id: str
Unique identifier for the evaluation run output item.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) id>)
created\_at: int
Unix timestamp (in seconds) when the evaluation run was created.
formatunixtime
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) created_at>)
datasource\_item: Dict[str, object]
Details of the input data source item.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) datasource_item>)
datasource\_item\_id: int
The identifier for the data source item.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) datasource_item_id>)
eval\_id: str
The identifier of the evaluation group.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) eval_id>)
object: Literal["eval.run.output\_item"]
The type of the object. Always “eval.run.output\_item”.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) object>)
results: List[Result]
A list of grader results for this output item.
name: str
The name of the grader.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) results > (items) > (property) name>)
passed: bool
Whether the grader considered the output a pass.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) results > (items) > (property) passed>)
score: float
The numeric score produced by the grader.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) results > (items) > (property) score>)
sample: Optional[Dict[str, object]]
Optional sample or intermediate data produced by the grader.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) results > (items) > (property) sample>)
type: Optional[str]
The grader type (for example, “string-check-grader”).
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) results > (items) > (property) type>)
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) results>)
run\_id: str
The identifier of the evaluation run associated with this output item.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) run_id>)
sample: Sample
A sample containing the input and output of the evaluation run.
error: [EvalAPIError](</api/reference/python/resources/evals#(resource) evals.runs > (model) eval_api_error > (schema)>)
An object representing an error response from the Eval API.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample > (property) error>)
finish\_reason: str
The reason why the sample generation was finished.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample > (property) finish_reason>)
input: List[SampleInput]
An array of input messages.
content: str
The content of the message.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample > (property) input > (items) > (property) content>)
role: str
The role of the message sender (e.g., system, user, developer).
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample > (property) input > (items) > (property) role>)
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample > (property) input>)
max\_completion\_tokens: int
The maximum number of tokens allowed for completion.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample > (property) max_completion_tokens>)
model: str
The model used for generating the sample.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample > (property) model>)
output: List[SampleOutput]
An array of output messages.
content: Optional[str]
The content of the message.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample > (property) output > (items) > (property) content>)
role: Optional[str]
The role of the message (e.g. “system”, “assistant”, “user”).
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample > (property) output > (items) > (property) role>)
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample > (property) output>)
seed: int
The seed used for generating the sample.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample > (property) seed>)
temperature: float
The sampling temperature used.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample > (property) temperature>)
top\_p: float
The top\_p value used for sampling.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample > (property) top_p>)
usage: SampleUsage
Token usage details for the sample.
cached\_tokens: int
The number of tokens retrieved from cache.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample > (property) usage > (property) cached_tokens>)
completion\_tokens: int
The number of completion tokens generated.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample > (property) usage > (property) completion_tokens>)
prompt\_tokens: int
The number of prompt tokens used.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample > (property) usage > (property) prompt_tokens>)
total\_tokens: int
The total number of tokens used.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample > (property) usage > (property) total_tokens>)
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample > (property) usage>)
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) sample>)
status: str
The status of the evaluation run.
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema) > (property) status>)
[](<#(resource) evals.runs.output_items > (model) output_item_retrieve_response > (schema)>)