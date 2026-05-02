Delete a fine-tuned model | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Models](/api/reference/ruby/resources/models)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete a fine-tuned model
models.delete(model) -\> [ModelDeleted](</api/reference/ruby/resources/models#(resource) models > (model) model_deleted > (schema)>) { id, deleted, object }
DELETE/models/{model}
Delete a fine-tuned model. You must have the Owner role in your organization to delete a model.
##### ParametersExpand Collapse
model: String
[](<#(resource) models > (method) delete > (params) default > (param) model > (schema)>)
##### ReturnsExpand Collapse
class ModelDeleted { id, deleted, object }
id: String
[](<#(resource) models > (model) model_deleted > (schema) > (property) id>)
deleted: bool
[](<#(resource) models > (model) model_deleted > (schema) > (property) deleted>)
object: String
[](<#(resource) models > (model) model_deleted > (schema) > (property) object>)
[](<#(resource) models > (model) model_deleted > (schema)>)
### Delete a fine-tuned model
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
model\_deleted = openai.models.delete("ft:gpt-4o-mini:acemeco:suffix:abc123")
puts(model\_deleted)`
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