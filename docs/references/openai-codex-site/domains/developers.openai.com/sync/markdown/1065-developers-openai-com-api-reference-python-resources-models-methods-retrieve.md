Retrieve model | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Models](/api/reference/python/resources/models)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Retrieve model
models.retrieve(strmodel) -\> [Model](</api/reference/python/resources/models#(resource) models > (model) model > (schema)>)
GET/models/{model}
Retrieves a model instance, providing basic information about the model such as the owner and permissioning.
##### ParametersExpand Collapse
model: str
[](<#(resource) models > (method) retrieve > (params) default > (param) model > (schema)>)
##### ReturnsExpand Collapse
class Model: …
Describes an OpenAI model offering that can be used with the API.
id: str
The model identifier, which can be referenced in the API endpoints.
[](<#(resource) models > (model) model > (schema) > (property) id>)
created: int
The Unix timestamp (in seconds) when the model was created.
formatunixtime
[](<#(resource) models > (model) model > (schema) > (property) created>)
object: Literal["model"]
The object type, which is always “model”.
[](<#(resource) models > (model) model > (schema) > (property) object>)
owned\_by: str
The organization that owns the model.
[](<#(resource) models > (model) model > (schema) > (property) owned_by>)
[](<#(resource) models > (model) model > (schema)>)
### Retrieve model
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
client.models.retrieve("VAR\_chat\_model\_id")
`
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