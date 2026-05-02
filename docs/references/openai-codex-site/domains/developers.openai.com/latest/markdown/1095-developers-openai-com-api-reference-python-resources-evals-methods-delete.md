Delete an eval | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Evals](/api/reference/python/resources/evals)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete an eval
evals.delete(streval\_id) -\> [EvalDeleteResponse](</api/reference/python/resources/evals#(resource) evals > (model) eval_delete_response > (schema)>)
DELETE/evals/{eval\_id}
Delete an evaluation.
##### ParametersExpand Collapse
eval\_id: str
[](<#(resource) evals > (method) delete > (params) default > (param) eval_id > (schema)>)
##### ReturnsExpand Collapse
class EvalDeleteResponse: …
deleted: bool
[](<#(resource) evals > (model) eval_delete_response > (schema) > (property) deleted>)
eval\_id: str
[](<#(resource) evals > (model) eval_delete_response > (schema) > (property) eval_id>)
object: str
[](<#(resource) evals > (model) eval_delete_response > (schema) > (property) object>)
[](<#(resource) evals > (model) eval_delete_response > (schema)>)
### Delete an eval
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
deleted = client.evals.delete("eval\_abc123")
print(deleted)
`
```
```
`{
"object": "eval.deleted",
"deleted": true,
"eval\_id": "eval\_abc123"
}
`
```
##### Returns Examples
```
`{
"object": "eval.deleted",
"deleted": true,
"eval\_id": "eval\_abc123"
}
`
```