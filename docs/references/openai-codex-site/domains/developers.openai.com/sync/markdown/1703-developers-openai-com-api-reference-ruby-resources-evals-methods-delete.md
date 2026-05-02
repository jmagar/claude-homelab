Delete an eval | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Evals](/api/reference/ruby/resources/evals)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete an eval
evals.delete(eval\_id) -\> [EvalDeleteResponse](</api/reference/ruby/resources/evals#(resource) evals > (model) eval_delete_response > (schema)>) { deleted, eval\_id, object }
DELETE/evals/{eval\_id}
Delete an evaluation.
##### ParametersExpand Collapse
eval\_id: String
[](<#(resource) evals > (method) delete > (params) default > (param) eval_id > (schema)>)
##### ReturnsExpand Collapse
class EvalDeleteResponse { deleted, eval\_id, object }
deleted: bool
[](<#(resource) evals > (model) eval_delete_response > (schema) > (property) deleted>)
eval\_id: String
[](<#(resource) evals > (model) eval_delete_response > (schema) > (property) eval_id>)
object: String
[](<#(resource) evals > (model) eval_delete_response > (schema) > (property) object>)
[](<#(resource) evals > (model) eval_delete_response > (schema)>)
### Delete an eval
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
eval\_ = openai.evals.delete("eval\_id")
puts(eval\_)`
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