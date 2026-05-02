Delete eval run | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Evals](/api/reference/resources/evals)
[Runs](/api/reference/resources/evals/subresources/runs)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete eval run
DELETE/evals/{eval\_id}/runs/{run\_id}
Delete an eval run.
##### Path ParametersExpand Collapse
eval\_id: string
[](<#(resource) evals.runs > (method) delete > (params) default > (param) eval_id > (schema)>)
run\_id: string
[](<#(resource) evals.runs > (method) delete > (params) default > (param) run_id > (schema)>)
##### ReturnsExpand Collapse
deleted: optional boolean
[](<#(resource) evals.runs > (model) run_delete_response > (schema) > (property) deleted>)
object: optional string
[](<#(resource) evals.runs > (model) run_delete_response > (schema) > (property) object>)
run\_id: optional string
[](<#(resource) evals.runs > (model) run_delete_response > (schema) > (property) run_id>)
### Delete eval run
HTTP
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
`curl https://api.openai.com/v1/evals/eval\_123abc/runs/evalrun\_abc456 \\
-X DELETE \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-H "Content-Type: application/json"
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