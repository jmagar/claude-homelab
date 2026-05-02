Delete eval run | OpenAI API Reference
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
# Delete eval run
client.evals.runs.delete(stringrunID, RunDeleteParams { eval\_id } params, RequestOptionsoptions?): [RunDeleteResponse](</api/reference/typescript/resources/evals#(resource) evals.runs > (model) run_delete_response > (schema)>) { deleted, object, run\_id }
DELETE/evals/{eval\_id}/runs/{run\_id}
Delete an eval run.
##### ParametersExpand Collapse
runID: string
[](<#(resource) evals.runs > (method) delete > (params) default > (param) run_id > (schema)>)
params: RunDeleteParams { eval\_id }
eval\_id: string
The ID of the evaluation to delete the run from.
[](<#(resource) evals.runs > (method) delete > (params) default > (param) eval_id>)
[](<#(resource) evals.runs > (method) delete > (params) default>)
##### ReturnsExpand Collapse
RunDeleteResponse { deleted, object, run\_id }
deleted?: boolean
[](<#(resource) evals.runs > (model) run_delete_response > (schema) > (property) deleted>)
object?: string
[](<#(resource) evals.runs > (model) run_delete_response > (schema) > (property) object>)
run\_id?: string
[](<#(resource) evals.runs > (model) run_delete_response > (schema) > (property) run_id>)
[](<#(resource) evals.runs > (model) run_delete_response > (schema)>)
### Delete eval run
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
const deleted = await openai.evals.runs.delete(
"eval\_123abc",
"evalrun\_abc456"
);
console.log(deleted);
`
```
```
`{
"object": "eval.run.deleted",
"deleted": true,
"run\_id": "evalrun\_abc456"
}
`
```
##### Returns Examples
```
`{
"object": "eval.run.deleted",
"deleted": true,
"run\_id": "evalrun\_abc456"
}
`
```