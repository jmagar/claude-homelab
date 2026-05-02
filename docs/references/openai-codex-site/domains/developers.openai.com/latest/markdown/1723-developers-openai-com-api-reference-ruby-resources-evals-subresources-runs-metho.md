Delete eval run | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Evals](/api/reference/ruby/resources/evals)
[Runs](/api/reference/ruby/resources/evals/subresources/runs)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete eval run
evals.runs.delete(run\_id, \*\*kwargs) -\> [RunDeleteResponse](</api/reference/ruby/resources/evals#(resource) evals.runs > (model) run_delete_response > (schema)>) { deleted, object, run\_id }
DELETE/evals/{eval\_id}/runs/{run\_id}
Delete an eval run.
##### ParametersExpand Collapse
eval\_id: String
[](<#(resource) evals.runs > (method) delete > (params) default > (param) eval_id > (schema)>)
run\_id: String
[](<#(resource) evals.runs > (method) delete > (params) default > (param) run_id > (schema)>)
##### ReturnsExpand Collapse
class RunDeleteResponse { deleted, object, run\_id }
deleted: bool
[](<#(resource) evals.runs > (model) run_delete_response > (schema) > (property) deleted>)
object: String
[](<#(resource) evals.runs > (model) run_delete_response > (schema) > (property) object>)
run\_id: String
[](<#(resource) evals.runs > (model) run_delete_response > (schema) > (property) run_id>)
[](<#(resource) evals.runs > (model) run_delete_response > (schema)>)
### Delete eval run
Ruby
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
`require "openai"
openai = OpenAI::Client.new(api\_key: "My API Key")
run = openai.evals.runs.delete("run\_id", eval\_id: "eval\_id")
puts(run)`
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