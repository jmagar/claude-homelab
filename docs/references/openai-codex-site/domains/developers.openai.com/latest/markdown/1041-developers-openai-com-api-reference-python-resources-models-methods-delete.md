Delete a fine-tuned model | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Models](/api/reference/python/resources/models)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete a fine-tuned model
models.delete(strmodel) -\> [ModelDeleted](</api/reference/python/resources/models#(resource) models > (model) model_deleted > (schema)>)
DELETE/models/{model}
Delete a fine-tuned model. You must have the Owner role in your organization to delete a model.
##### ParametersExpand Collapse
model: str
[](<#(resource) models > (method) delete > (params) default > (param) model > (schema)>)
##### ReturnsExpand Collapse
class ModelDeleted: …
id: str
[](<#(resource) models > (model) model_deleted > (schema) > (property) id>)
deleted: bool
[](<#(resource) models > (model) model_deleted > (schema) > (property) deleted>)
object: str
[](<#(resource) models > (model) model_deleted > (schema) > (property) object>)
[](<#(resource) models > (model) model_deleted > (schema)>)
### Delete a fine-tuned model
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
client.models.delete("ft:gpt-4o-mini:acemeco:suffix:abc123")
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