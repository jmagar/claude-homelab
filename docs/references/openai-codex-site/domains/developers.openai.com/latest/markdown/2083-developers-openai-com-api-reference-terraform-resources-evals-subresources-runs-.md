Output Items | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/terraform)
[Evals](/api/reference/terraform/resources/evals)
[Runs](/api/reference/terraform/resources/evals/subresources/runs)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Output Items
Manage and run evals in the OpenAI platform.
#### data openai\_eval\_run\_output\_item
##### required Expand Collapse
eval\_id: String
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) eval_id>)
output\_item\_id: String
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) output_item_id>)
run\_id: String
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) run_id>)
##### computed Expand Collapse
created\_at: Int64
Unix timestamp (in seconds) when the evaluation run was created.
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) created_at>)
datasource\_item\_id: Int64
The identifier for the data source item.
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) datasource_item_id>)
id: String
Unique identifier for the evaluation run output item.
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) id>)
object: String
The type of the object. Always “eval.run.output\_item”.
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) object>)
status: String
The status of the evaluation run.
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) status>)
datasource\_item: Map[JSON]
Details of the input data source item.
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) datasource_item>)
results: List[Attributes]
A list of grader results for this output item.
name: String
The name of the grader.
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) results > (attribute) name>)
passed: Bool
Whether the grader considered the output a pass.
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) results > (attribute) passed>)
score: Float64
The numeric score produced by the grader.
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) results > (attribute) score>)
sample: Map[JSON]
Optional sample or intermediate data produced by the grader.
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) results > (attribute) sample>)
type: String
The grader type (for example, “string-check-grader”).
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) results > (attribute) type>)
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) results>)
sample: Attributes
A sample containing the input and output of the evaluation run.
error: Attributes
An object representing an error response from the Eval API.
code: String
The error code.
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) sample > (attribute) error > (attribute) code>)
message: String
The error message.
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) sample > (attribute) error > (attribute) message>)
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) sample > (attribute) error>)
finish\_reason: String
The reason why the sample generation was finished.
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) sample > (attribute) finish_reason>)
input: List[Attributes]
An array of input messages.
content: String
The content of the message.
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) sample > (attribute) input > (attribute) content>)
role: String
The role of the message sender (e.g., system, user, developer).
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) sample > (attribute) input > (attribute) role>)
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) sample > (attribute) input>)
max\_completion\_tokens: Int64
The maximum number of tokens allowed for completion.
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) sample > (attribute) max_completion_tokens>)
model: String
The model used for generating the sample.
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) sample > (attribute) model>)
output: List[Attributes]
An array of output messages.
content: String
The content of the message.
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) sample > (attribute) output > (attribute) content>)
role: String
The role of the message (e.g. “system”, “assistant”, “user”).
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) sample > (attribute) output > (attribute) role>)
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) sample > (attribute) output>)
seed: Int64
The seed used for generating the sample.
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) sample > (attribute) seed>)
temperature: Float64
The sampling temperature used.
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) sample > (attribute) temperature>)
top\_p: Float64
The top\_p value used for sampling.
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) sample > (attribute) top_p>)
usage: Attributes
Token usage details for the sample.
cached\_tokens: Int64
The number of tokens retrieved from cache.
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) sample > (attribute) usage > (attribute) cached_tokens>)
completion\_tokens: Int64
The number of completion tokens generated.
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) sample > (attribute) usage > (attribute) completion_tokens>)
prompt\_tokens: Int64
The number of prompt tokens used.
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) sample > (attribute) usage > (attribute) prompt_tokens>)
total\_tokens: Int64
The total number of tokens used.
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) sample > (attribute) usage > (attribute) total_tokens>)
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) sample > (attribute) usage>)
[](<#(resource) evals.runs.output_items > (terraform datasource-single) > (attribute) sample>)
#### data openai\_eval\_run\_output\_items
##### required Expand Collapse
eval\_id: String
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) eval_id>)
run\_id: String
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) run_id>)
##### optional Expand Collapse
status?: String
Filter output items by status. Use `failed` to filter by failed output
items or `pass` to filter by passed output items.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) status>)
order?: String
Sort order for output items by timestamp. Use `asc` for ascending order or `desc` for descending order. Defaults to `asc`.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) order>)
max\_items?: Int64
Max items to fetch, default: 1000
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) max_items>)
##### computed Expand Collapse
items: List[Attributes]
The items returned by the data source
id: String
Unique identifier for the evaluation run output item.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) id>)
created\_at: Int64
Unix timestamp (in seconds) when the evaluation run was created.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) created_at>)
datasource\_item: Map[JSON]
Details of the input data source item.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) datasource_item>)
datasource\_item\_id: Int64
The identifier for the data source item.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) datasource_item_id>)
eval\_id: String
The identifier of the evaluation group.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) eval_id>)
object: String
The type of the object. Always “eval.run.output\_item”.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) object>)
results: List[Attributes]
A list of grader results for this output item.
name: String
The name of the grader.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) results > (attribute) name>)
passed: Bool
Whether the grader considered the output a pass.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) results > (attribute) passed>)
score: Float64
The numeric score produced by the grader.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) results > (attribute) score>)
sample: Map[JSON]
Optional sample or intermediate data produced by the grader.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) results > (attribute) sample>)
type: String
The grader type (for example, “string-check-grader”).
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) results > (attribute) type>)
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) results>)
run\_id: String
The identifier of the evaluation run associated with this output item.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) run_id>)
sample: Attributes
A sample containing the input and output of the evaluation run.
error: Attributes
An object representing an error response from the Eval API.
code: String
The error code.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) sample > (attribute) error > (attribute) code>)
message: String
The error message.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) sample > (attribute) error > (attribute) message>)
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) sample > (attribute) error>)
finish\_reason: String
The reason why the sample generation was finished.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) sample > (attribute) finish_reason>)
input: List[Attributes]
An array of input messages.
content: String
The content of the message.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) sample > (attribute) input > (attribute) content>)
role: String
The role of the message sender (e.g., system, user, developer).
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) sample > (attribute) input > (attribute) role>)
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) sample > (attribute) input>)
max\_completion\_tokens: Int64
The maximum number of tokens allowed for completion.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) sample > (attribute) max_completion_tokens>)
model: String
The model used for generating the sample.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) sample > (attribute) model>)
output: List[Attributes]
An array of output messages.
content: String
The content of the message.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) sample > (attribute) output > (attribute) content>)
role: String
The role of the message (e.g. “system”, “assistant”, “user”).
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) sample > (attribute) output > (attribute) role>)
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) sample > (attribute) output>)
seed: Int64
The seed used for generating the sample.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) sample > (attribute) seed>)
temperature: Float64
The sampling temperature used.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) sample > (attribute) temperature>)
top\_p: Float64
The top\_p value used for sampling.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) sample > (attribute) top_p>)
usage: Attributes
Token usage details for the sample.
cached\_tokens: Int64
The number of tokens retrieved from cache.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) sample > (attribute) usage > (attribute) cached_tokens>)
completion\_tokens: Int64
The number of completion tokens generated.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) sample > (attribute) usage > (attribute) completion_tokens>)
prompt\_tokens: Int64
The number of prompt tokens used.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) sample > (attribute) usage > (attribute) prompt_tokens>)
total\_tokens: Int64
The total number of tokens used.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) sample > (attribute) usage > (attribute) total_tokens>)
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) sample > (attribute) usage>)
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) sample>)
status: String
The status of the evaluation run.
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items > (attribute) status>)
[](<#(resource) evals.runs.output_items > (terraform datasource-plural) > (attribute) items>)