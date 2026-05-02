Delete an eval | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Evals](/api/reference/typescript/resources/evals)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete an eval
client.evals.delete(stringevalID, RequestOptionsoptions?): [EvalDeleteResponse](</api/reference/typescript/resources/evals#(resource) evals > (model) eval_delete_response > (schema)>) { deleted, eval\_id, object }
DELETE/evals/{eval\_id}
Delete an evaluation.
##### ParametersExpand Collapse
evalID: string
[](<#(resource) evals > (method) delete > (params) default > (param) eval_id > (schema)>)
##### ReturnsExpand Collapse
EvalDeleteResponse { deleted, eval\_id, object }
deleted: boolean
[](<#(resource) evals > (model) eval_delete_response > (schema) > (property) deleted>)
eval\_id: string
[](<#(resource) evals > (model) eval_delete_response > (schema) > (property) eval_id>)
object: string
[](<#(resource) evals > (model) eval_delete_response > (schema) > (property) object>)
[](<#(resource) evals > (model) eval_delete_response > (schema)>)
### Delete an eval
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
const deleted = await openai.evals.delete("eval\_abc123");
console.log(deleted);
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