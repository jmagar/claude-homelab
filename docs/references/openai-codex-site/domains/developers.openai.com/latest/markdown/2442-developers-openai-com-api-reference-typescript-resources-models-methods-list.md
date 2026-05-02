List models | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Models](/api/reference/typescript/resources/models)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# List models
client.models.list(RequestOptionsoptions?): Page\<[Model](</api/reference/typescript/resources/models#(resource) models > (model) model > (schema)>) { id, created, object, owned\_by } \>
GET/models
Lists the currently available models, and provides basic information about each one such as the owner and availability.
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
### List models
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
const list = await openai.models.list();
for await (const model of list) {
console.log(model);
}
}
main();`
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