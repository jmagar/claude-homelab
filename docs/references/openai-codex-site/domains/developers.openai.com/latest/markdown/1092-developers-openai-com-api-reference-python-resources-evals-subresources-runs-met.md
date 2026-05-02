Delete eval run | OpenAI API Reference
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
# Delete eval run
evals.runs.delete(strrun\_id, RunDeleteParams\*\*kwargs) -\> [RunDeleteResponse](</api/reference/python/resources/evals#(resource) evals.runs > (model) run_delete_response > (schema)>)
DELETE/evals/{eval\_id}/runs/{run\_id}
Delete an eval run.
##### ParametersExpand Collapse
eval\_id: str
[](<#(resource) evals.runs > (method) delete > (params) default > (param) eval_id > (schema)>)
run\_id: str
[](<#(resource) evals.runs > (method) delete > (params) default > (param) run_id > (schema)>)
##### ReturnsExpand Collapse
class RunDeleteResponse: …
deleted: Optional[bool]
[](<#(resource) evals.runs > (model) run_delete_response > (schema) > (property) deleted>)
object: Optional[str]
[](<#(resource) evals.runs > (model) run_delete_response > (schema) > (property) object>)
run\_id: Optional[str]
[](<#(resource) evals.runs > (model) run_delete_response > (schema) > (property) run_id>)
[](<#(resource) evals.runs > (model) run_delete_response > (schema)>)
### Delete eval run
Python
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
`from openai import OpenAI
client = OpenAI()
deleted = client.evals.runs.delete(
"eval\_123abc",
"evalrun\_abc456"
)
print(deleted)
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