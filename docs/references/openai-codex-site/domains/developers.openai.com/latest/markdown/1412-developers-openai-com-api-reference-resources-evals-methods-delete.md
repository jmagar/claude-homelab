Delete an eval | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Evals](/api/reference/resources/evals)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete an eval
DELETE/evals/{eval\_id}
Delete an evaluation.
##### Path ParametersExpand Collapse
eval\_id: string
[](<#(resource) evals > (method) delete > (params) default > (param) eval_id > (schema)>)
##### ReturnsExpand Collapse
deleted: boolean
[](<#(resource) evals > (model) eval_delete_response > (schema) > (property) deleted>)
eval\_id: string
[](<#(resource) evals > (model) eval_delete_response > (schema) > (property) eval_id>)
object: string
[](<#(resource) evals > (model) eval_delete_response > (schema) > (property) object>)
### Delete an eval
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
`curl https://api.openai.com/v1/evals/eval\_abc123 \\
-X DELETE \\
-H "Authorization: Bearer $OPENAI\_API\_KEY"
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