Retrieve model | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Models](/api/reference/typescript/resources/models)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Retrieve model
client.models.retrieve(stringmodel, RequestOptionsoptions?): [Model](</api/reference/typescript/resources/models#(resource) models > (model) model > (schema)>) { id, created, object, owned\_by }
GET/models/{model}
Retrieves a model instance, providing basic information about the model such as the owner and permissioning.
##### ParametersExpand Collapse
model: string
[](<#(resource) models > (method) retrieve > (params) default > (param) model > (schema)>)
##### ReturnsExpand Collapse
Model { id, created, object, owned\_by }
Describes an OpenAI model offering that can be used with the API.
id: string
The model identifier, which can be referenced in the API endpoints.
[](<#(resource) models > (model) model > (schema) > (property) id>)
created: number
The Unix timestamp (in seconds) when the model was created.
formatunixtime
[](<#(resource) models > (model) model > (schema) > (property) created>)
object: "model"
The object type, which is always “model”.
[](<#(resource) models > (model) model > (schema) > (property) object>)
owned\_by: string
The organization that owns the model.
[](<#(resource) models > (model) model > (schema) > (property) owned_by>)
[](<#(resource) models > (model) model > (schema)>)
### Retrieve model
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
async function main() {
const model = await openai.models.retrieve("VAR\_chat\_model\_id");
console.log(model);
}
main();`
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