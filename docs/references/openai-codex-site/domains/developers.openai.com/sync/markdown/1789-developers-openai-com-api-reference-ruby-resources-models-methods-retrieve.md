Retrieve model | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Models](/api/reference/ruby/resources/models)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Retrieve model
models.retrieve(model) -\> [Model](</api/reference/ruby/resources/models#(resource) models > (model) model > (schema)>) { id, created, object, owned\_by }
GET/models/{model}
Retrieves a model instance, providing basic information about the model such as the owner and permissioning.
##### ParametersExpand Collapse
model: String
[](<#(resource) models > (method) retrieve > (params) default > (param) model > (schema)>)
##### ReturnsExpand Collapse
class Model { id, created, object, owned\_by }
Describes an OpenAI model offering that can be used with the API.
id: String
The model identifier, which can be referenced in the API endpoints.
[](<#(resource) models > (model) model > (schema) > (property) id>)
created: Integer
The Unix timestamp (in seconds) when the model was created.
formatunixtime
[](<#(resource) models > (model) model > (schema) > (property) created>)
object: :model
The object type, which is always “model”.
[](<#(resource) models > (model) model > (schema) > (property) object>)
owned\_by: String
The organization that owns the model.
[](<#(resource) models > (model) model > (schema) > (property) owned_by>)
[](<#(resource) models > (model) model > (schema)>)
### Retrieve model
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
model = openai.models.retrieve("gpt-4o-mini")
puts(model)`
```
```
`{
"id": "VAR\_chat\_model\_id",
"object": "model",
"created": 1686935002,
"owned\_by": "openai"
}
`
```
##### Returns Examples
```
`{
"id": "VAR\_chat\_model\_id",
"object": "model",
"created": 1686935002,
"owned\_by": "openai"
}
`
```