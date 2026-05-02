Delete a fine-tuned model | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Models](/api/reference/typescript/resources/models)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete a fine-tuned model
client.models.delete(stringmodel, RequestOptionsoptions?): [ModelDeleted](</api/reference/typescript/resources/models#(resource) models > (model) model_deleted > (schema)>) { id, deleted, object }
DELETE/models/{model}
Delete a fine-tuned model. You must have the Owner role in your organization to delete a model.
##### ParametersExpand Collapse
model: string
[](<#(resource) models > (method) delete > (params) default > (param) model > (schema)>)
##### ReturnsExpand Collapse
ModelDeleted { id, deleted, object }
id: string
[](<#(resource) models > (model) model_deleted > (schema) > (property) id>)
deleted: boolean
[](<#(resource) models > (model) model_deleted > (schema) > (property) deleted>)
object: string
[](<#(resource) models > (model) model_deleted > (schema) > (property) object>)
[](<#(resource) models > (model) model_deleted > (schema)>)
### Delete a fine-tuned model
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
const model = await openai.models.delete("ft:gpt-4o-mini:acemeco:suffix:abc123");
console.log(model);
}
main();`
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