List models | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Models](/api/reference/ruby/resources/models)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List models
models.list() -\> Page\<[Model](</api/reference/ruby/resources/models#(resource) models > (model) model > (schema)>) { id, created, object, owned\_by } \>
GET/models
Lists the currently available models, and provides basic information about each one such as the owner and availability.
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
### List models
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
page = openai.models.list
puts(page)`
```
```
`{
"object": "list",
"data": [
{
"id": "model-id-0",
"object": "model",
"created": 1686935002,
"owned\_by": "organization-owner"
},
{
"id": "model-id-1",
"object": "model",
"created": 1686935002,
"owned\_by": "organization-owner",
},
{
"id": "model-id-2",
"object": "model",
"created": 1686935002,
"owned\_by": "openai"
},
]
}
`
```
##### Returns Examples
```
`{
"object": "list",
"data": [
{
"id": "model-id-0",
"object": "model",
"created": 1686935002,
"owned\_by": "organization-owner"
},
{
"id": "model-id-1",
"object": "model",
"created": 1686935002,
"owned\_by": "organization-owner",
},
{
"id": "model-id-2",
"object": "model",
"created": 1686935002,
"owned\_by": "openai"
},
]
}
`
```