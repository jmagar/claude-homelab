Get eval run output items | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Evals](/api/reference/java/resources/evals)
[Runs](/api/reference/java/resources/evals/subresources/runs)
[Output Items](/api/reference/java/resources/evals/subresources/runs/subresources/output_items)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Get eval run output items
OutputItemListPage evals().runs().outputItems().list(OutputItemListParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
GET/evals/{eval\_id}/runs/{run\_id}/output\_items
Get a list of output items for an evaluation run.
##### ParametersExpand Collapse
OutputItemListParams params
String evalId
[](<#(resource) evals.runs.output_items > (method) list > (params) default > (param) eval_id > (schema)>)
Optional\<String\> runId
[](<#(resource) evals.runs.output_items > (method) list > (params) default > (param) run_id > (schema)>)
Optional\<String\> after
Identifier for the last output item from the previous pagination request.
[](<#(resource) evals.runs.output_items > (method) list > (params) default > (param) after > (schema)>)
Optional\<Long\> limit
Number of output items to retrieve.
[](<#(resource) evals.runs.output_items > (method) list > (params) default > (param) limit > (schema)>)
Optional\<[Order](</api/reference/java/resources/evals/subresources/runs/subresources/output_items/methods/list#(resource) evals.runs.output_items > (method) list > (params) default > (param) order > (schema)>)\> order
Sort order for output items by timestamp. Use `asc` for ascending order or `desc` for descending order. Defaults to `asc`.
ASC("asc")
[](<#(resource) evals.runs.output_items > (method) list > (params) default > (param) order > (schema) > (member) 0>)
DESC("desc")
[](<#(resource) evals.runs.output_items > (method) list > (params) default > (param) order > (schema) > (member) 1>)
[](<#(resource) evals.runs.output_items > (method) list > (params) default > (param) order > (schema)>)
Optional\<[Status](</api/reference/java/resources/evals/subresources/runs/subresources/output_items/methods/list#(resource) evals.runs.output_items > (method) list > (params) default > (param) status > (schema)>)\> status
Filter output items by status. Use `failed` to filter by failed output
items or `pass` to filter by passed output items.
FAIL("fail")
[](<#(resource) evals.runs.output_items > (method) list > (params) default > (param) status > (schema) > (member) 0>)
PASS("pass")
[](<#(resource) evals.runs.output_items > (method) list > (params) default > (param) status > (schema) > (member) 1>)
[](<#(resource) evals.runs.output_items > (method) list > (params) default > (param) status > (schema)>)
[](<#(resource) evals.runs.output_items > (method) list > (params) default>)
##### ReturnsExpand Collapse
class OutputItemListResponse:
A schema representing an evaluation run output item.
String id
Unique identifier for the evaluation run output item.
[](<#(resource) evals.runs.output_items > (model) OutputItemListResponse > (schema) > (property) id>)
long createdAt
Unix timestamp (in seconds) when the evaluation run was created.
formatunixtime
[](<#(resource) evals.runs.output_items > (model) OutputItemListResponse > (schema) > (property) created_at>)
DatasourceItem datasourceItem
Details of the input data source item.
[](<#(resource) evals.runs.output_items > (model) OutputItemListResponse > (schema) > (property) datasource_item>)
long datasourceItemId
The identifier for the data source item.
[](<#(resource) evals.runs.output_items > (model) OutputItemListResponse > (schema) > (property) datasource_item_id>)
String evalId
The identifier of the evaluation group.
[](<#(resource) evals.runs.output_items > (model) OutputItemListResponse > (schema) > (property) eval_id>)
JsonValue; object\_ "eval.run.output\_item"constant"eval.run.output\_item"constant
The type of the object. Always “eval.run.output\_item”.
[](<#(resource) evals.runs.output_items > (model) OutputItemListResponse > (schema) > (property) object>)
List\<Result\> results
A list of grader results for this output item.
String name
The name of the grader.
[](<#(resource) evals.runs.output_items > (model) OutputItemListResponse > (schema) > (property) results > (items) > (property) name>)
boolean passed
Whether the grader considered the output a pass.
[](<#(resource) evals.runs.output_items > (model) OutputItemListResponse > (schema) > (property) results > (items) > (property) passed>)
double score
The numeric score produced by the grader.
[](<#(resource) evals.runs.output_items > (model) OutputItemListResponse > (schema) > (property) results > (items) > (property) score>)
Optional\<Sample\> sample
Optional sample or intermediate data produced by the grader.
[](<#(resource) evals.runs.output_items > (model) OutputItemListResponse > (schema) > (property) results > (items) > (property) sample>)
Optional\<String\> type
The grader type (for example, “string-check-grader”).
[](<#(resource) evals.runs.output_items > (model) OutputItemListResponse > (schema) > (property) results > (items) > (property) type>)
[](<#(resource) evals.runs.output_items > (model) OutputItemListResponse > (schema) > (property) results>)
String runId
The identifier of the evaluation run associated with this output item.
[](<#(resource) evals.runs.output_items > (model) OutputItemListResponse > (schema) > (property) run_id>)
Sample sample
A sample containing the input and output of the evaluation run.
[EvalApiError](</api/reference/java/resources/evals#(resource) evals.runs > (model) eval_api_error > (schema)>) error
An object representing an error response from the Eval API.
String code
The error code.
[](<#(resource) evals.runs.output_items > (model) OutputItemListResponse > (schema) > (property) sample > (property) error + (resource) evals.runs > (model) eval_api_error > (schema) > (property) code>)
String message
The error message.
[](<#(resource) evals.runs.output_items > (model) OutputItemListResponse > (schema) > (property) sample > (property) error + (resource) evals.runs > (model) eval_api_error > (schema) > (property) message>)
[](<#(resource) evals.runs.output_items > (model) OutputItemListResponse > (schema) > (property) sample > (property) error>)
String finishReason
The reason why the sample generation was finished.
[](<#(resource) evals.runs.output_items > (model) OutputItemListResponse > (schema) > (property) sample > (property) finish_reason>)
List\<Input\> input
An array of input messages.
String content
The content of the message.
[](<#(resource) evals.runs.output_items > (model) OutputItemListResponse > (schema) > (property) sample > (property) input > (items) > (property) content>)
String role
The role of the message sender (e.g., system, user, developer).
[](<#(resource) evals.runs.output_items > (model) OutputItemListResponse > (schema) > (property) sample > (property) input > (items) > (property) role>)
[](<#(resource) evals.runs.output_items > (model) OutputItemListResponse > (schema) > (property) sample > (property) input>)
long maxCompletionTokens
The maximum number of tokens allowed for completion.
[](<#(resource) evals.runs.output_items > (model) OutputItemListResponse > (schema) > (property) sample > (property) max_completion_tokens>)
String model
The model used for generating the sample.
[](<#(resource) evals.runs.output_items > (model) OutputItemListResponse > (schema) > (property) sample > (property) model>)
List\<Output\> output
An array of output messages.
Optional\<String\> content
The content of the message.
[](<#(resource) evals.runs.output_items > (model) OutputItemListResponse > (schema) > (property) sample > (property) output > (items) > (property) content>)
Optional\<String\> role
The role of the message (e.g. “system”, “assistant”, “user”).
[](<#(resource) evals.runs.output_items > (model) OutputItemListResponse > (schema) > (property) sample > (property) output > (items) > (property) role>)
[](<#(resource) evals.runs.output_items > (model) OutputItemListResponse > (schema) > (property) sample > (property) output>)
long seed
The seed used for generating the sample.
[](<#(resource) evals.runs.output_items > (model) OutputItemListResponse > (schema) > (property) sample > (property) seed>)
double temperature
The sampling temperature used.
[](<#(resource) evals.runs.output_items > (model) OutputItemListResponse > (schema) > (property) sample > (property) temperature>)
double topP
The top\_p value used for sampling.
[](<#(resource) evals.runs.output_items > (model) OutputItemListResponse > (schema) > (property) sample > (property) top_p>)
Usage usage
Token usage details for the sample.
long cachedTokens
The number of tokens retrieved from cache.
[](<#(resource) evals.runs.output_items > (model) OutputItemListResponse > (schema) > (property) sample > (property) usage > (property) cached_tokens>)
long completionTokens
The number of completion tokens generated.
[](<#(resource) evals.runs.output_items > (model) OutputItemListResponse > (schema) > (property) sample > (property) usage > (property) completion_tokens>)
long promptTokens
The number of prompt tokens used.
[](<#(resource) evals.runs.output_items > (model) OutputItemListResponse > (schema) > (property) sample > (property) usage > (property) prompt_tokens>)
long totalTokens
The total number of tokens used.
[](<#(resource) evals.runs.output_items > (model) OutputItemListResponse > (schema) > (property) sample > (property) usage > (property) total_tokens>)
[](<#(resource) evals.runs.output_items > (model) OutputItemListResponse > (schema) > (property) sample > (property) usage>)
[](<#(resource) evals.runs.output_items > (model) OutputItemListResponse > (schema) > (property) sample>)
String status
The status of the evaluation run.
[](<#(resource) evals.runs.output_items > (model) OutputItemListResponse > (schema) > (property) status>)
[](<#(resource) evals.runs.output_items > (model) OutputItemListResponse > (schema)>)
### Get eval run output items
Java
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
`package com.openai.example;
import com.openai.client.OpenAIClient;
import com.openai.client.okhttp.OpenAIOkHttpClient;
import com.openai.models.evals.runs.outputitems.OutputItemListPage;
import com.openai.models.evals.runs.outputitems.OutputItemListParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
OutputItemListParams params = OutputItemListParams.builder()
.evalId("eval\_id")
.runId("run\_id")
.build();
OutputItemListPage page = client.evals().runs().outputItems().list(params);
}
}`
```
```
`{
"object": "list",
"data": [
{
"object": "eval.run.output\_item",
"id": "outputitem\_67e5796c28e081909917bf79f6e6214d",
"created\_at": 1743092076,
"run\_id": "evalrun\_67abd54d60ec8190832b46859da808f7",
"eval\_id": "eval\_67abd54d9b0081909a86353f6fb9317a",
"status": "pass",
"datasource\_item\_id": 5,
"datasource\_item": {
"input": "Stock Markets Rally After Positive Economic Data Released",
"ground\_truth": "Markets"
},
"results": [
{
"name": "String check-a2486074-d803-4445-b431-ad2262e85d47",
"sample": null,
"passed": true,
"score": 1.0
}
],
"sample": {
"input": [
{
"role": "developer",
"content": "Categorize a given news headline into one of the following topics: Technology, Markets, World, Business, or Sports.\\n\\n# Steps\\n\\n1. Analyze the content of the news headline to understand its primary focus.\\n2. Extract the subject matter, identifying any key indicators or keywords.\\n3. Use the identified indicators to determine the most suitable category out of the five options: Technology, Markets, World, Business, or Sports.\\n4. Ensure only one category is selected per headline.\\n\\n# Output Format\\n\\nRespond with the chosen category as a single word. For instance: \\"Technology\\", \\"Markets\\", \\"World\\", \\"Business\\", or \\"Sports\\".\\n\\n# Examples\\n\\n\*\*Input\*\*: \\"Apple Unveils New iPhone Model, Featuring Advanced AI Features\\" \\n\*\*Output\*\*: \\"Technology\\"\\n\\n\*\*Input\*\*: \\"Global Stocks Mixed as Investors Await Central Bank Decisions\\" \\n\*\*Output\*\*: \\"Markets\\"\\n\\n\*\*Input\*\*: \\"War in Ukraine: Latest Updates on Negotiation Status\\" \\n\*\*Output\*\*: \\"World\\"\\n\\n\*\*Input\*\*: \\"Microsoft in Talks to Acquire Gaming Company for $2 Billion\\" \\n\*\*Output\*\*: \\"Business\\"\\n\\n\*\*Input\*\*: \\"Manchester United Secures Win in Premier League Football Match\\" \\n\*\*Output\*\*: \\"Sports\\" \\n\\n# Notes\\n\\n- If the headline appears to fit into more than one category, choose the most dominant theme.\\n- Keywords or phrases such as \\"stocks\\", \\"company acquisition\\", \\"match\\", or technological brands can be good indicators for classification.\\n",
"tool\_call\_id": null,
"tool\_calls": null,
"function\_call": null
},
{
"role": "user",
"content": "Stock Markets Rally After Positive Economic Data Released",
"tool\_call\_id": null,
"tool\_calls": null,
"function\_call": null
}
],
"output": [
{
"role": "assistant",
"content": "Markets",
"tool\_call\_id": null,
"tool\_calls": null,
"function\_call": null
}
],
"finish\_reason": "stop",
"model": "gpt-4o-mini-2024-07-18",
"usage": {
"total\_tokens": 325,
"completion\_tokens": 2,
"prompt\_tokens": 323,
"cached\_tokens": 0
},
"error": null,
"temperature": 1.0,
"max\_completion\_tokens": 2048,
"top\_p": 1.0,
"seed": 42
}
}
],
"first\_id": "outputitem\_67e5796c28e081909917bf79f6e6214d",
"last\_id": "outputitem\_67e5796c28e081909917bf79f6e6214d",
"has\_more": true
}
`
```
##### Returns Examples
```
`{
"object": "list",
"data": [
{
"object": "eval.run.output\_item",
"id": "outputitem\_67e5796c28e081909917bf79f6e6214d",
"created\_at": 1743092076,
"run\_id": "evalrun\_67abd54d60ec8190832b46859da808f7",
"eval\_id": "eval\_67abd54d9b0081909a86353f6fb9317a",
"status": "pass",
"datasource\_item\_id": 5,
"datasource\_item": {
"input": "Stock Markets Rally After Positive Economic Data Released",
"ground\_truth": "Markets"
},
"results": [
{
"name": "String check-a2486074-d803-4445-b431-ad2262e85d47",
"sample": null,
"passed": true,
"score": 1.0
}
],
"sample": {
"input": [
{
"role": "developer",
"content": "Categorize a given news headline into one of the following topics: Technology, Markets, World, Business, or Sports.\\n\\n# Steps\\n\\n1. Analyze the content of the news headline to understand its primary focus.\\n2. Extract the subject matter, identifying any key indicators or keywords.\\n3. Use the identified indicators to determine the most suitable category out of the five options: Technology, Markets, World, Business, or Sports.\\n4. Ensure only one category is selected per headline.\\n\\n# Output Format\\n\\nRespond with the chosen category as a single word. For instance: \\"Technology\\", \\"Markets\\", \\"World\\", \\"Business\\", or \\"Sports\\".\\n\\n# Examples\\n\\n\*\*Input\*\*: \\"Apple Unveils New iPhone Model, Featuring Advanced AI Features\\" \\n\*\*Output\*\*: \\"Technology\\"\\n\\n\*\*Input\*\*: \\"Global Stocks Mixed as Investors Await Central Bank Decisions\\" \\n\*\*Output\*\*: \\"Markets\\"\\n\\n\*\*Input\*\*: \\"War in Ukraine: Latest Updates on Negotiation Status\\" \\n\*\*Output\*\*: \\"World\\"\\n\\n\*\*Input\*\*: \\"Microsoft in Talks to Acquire Gaming Company for $2 Billion\\" \\n\*\*Output\*\*: \\"Business\\"\\n\\n\*\*Input\*\*: \\"Manchester United Secures Win in Premier League Football Match\\" \\n\*\*Output\*\*: \\"Sports\\" \\n\\n# Notes\\n\\n- If the headline appears to fit into more than one category, choose the most dominant theme.\\n- Keywords or phrases such as \\"stocks\\", \\"company acquisition\\", \\"match\\", or technological brands can be good indicators for classification.\\n",
"tool\_call\_id": null,
"tool\_calls": null,
"function\_call": null
},
{
"role": "user",
"content": "Stock Markets Rally After Positive Economic Data Released",
"tool\_call\_id": null,
"tool\_calls": null,
"function\_call": null
}
],
"output": [
{
"role": "assistant",
"content": "Markets",
"tool\_call\_id": null,
"tool\_calls": null,
"function\_call": null
}
],
"finish\_reason": "stop",
"model": "gpt-4o-mini-2024-07-18",
"usage": {
"total\_tokens": 325,
"completion\_tokens": 2,
"prompt\_tokens": 323,
"cached\_tokens": 0
},
"error": null,
"temperature": 1.0,
"max\_completion\_tokens": 2048,
"top\_p": 1.0,
"seed": 42
}
}
],
"first\_id": "outputitem\_67e5796c28e081909917bf79f6e6214d",
"last\_id": "outputitem\_67e5796c28e081909917bf79f6e6214d",
"has\_more": true
}
`
```