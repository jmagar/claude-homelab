Delete a fine-tuned model | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Models](/api/reference/resources/models)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete a fine-tuned model
DELETE/models/{model}
Delete a fine-tuned model. You must have the Owner role in your organization to delete a model.
##### Path ParametersExpand Collapse
model: string
[](<#(resource) models > (method) delete > (params) default > (param) model > (schema)>)
##### ReturnsExpand Collapse
ModelDeleted object { id, deleted, object }
id: string
[](<#(resource) models > (model) model_deleted > (schema) > (property) id>)
deleted: boolean
[](<#(resource) models > (model) model_deleted > (schema) > (property) deleted>)
object: string
[](<#(resource) models > (model) model_deleted > (schema) > (property) object>)
[](<#(resource) models > (model) model_deleted > (schema)>)
### Delete a fine-tuned model
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
`curl https://api.openai.com/v1/models/ft:gpt-4o-mini:acemeco:suffix:abc123 \\
-X DELETE \\
-H "Authorization: Bearer $OPENAI\_API\_KEY"
`
```
```
`{
"id": "ft:gpt-4o-mini:acemeco:suffix:abc123",
"object": "model",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"id": "ft:gpt-4o-mini:acemeco:suffix:abc123",
"object": "model",
"deleted": true
}
`
```