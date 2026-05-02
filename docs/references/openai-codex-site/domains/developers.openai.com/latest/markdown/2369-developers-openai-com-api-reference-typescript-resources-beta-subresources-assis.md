Delete assistant | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Beta](/api/reference/typescript/resources/beta)
[Assistants](/api/reference/typescript/resources/beta/subresources/assistants)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete assistant
Deprecated
client.beta.assistants.delete(stringassistantID, RequestOptionsoptions?): [AssistantDeleted](</api/reference/typescript/resources/beta#(resource) beta.assistants > (model) assistant_deleted > (schema)>) { id, deleted, object }
DELETE/assistants/{assistant\_id}
Delete an assistant.
##### ParametersExpand Collapse
assistantID: string
[](<#(resource) beta.assistants > (method) delete > (params) default > (param) assistant_id > (schema)>)
##### ReturnsExpand Collapse
AssistantDeleted { id, deleted, object }
id: string
[](<#(resource) beta.assistants > (model) assistant_deleted > (schema) > (property) id>)
deleted: boolean
[](<#(resource) beta.assistants > (model) assistant_deleted > (schema) > (property) deleted>)
object: "assistant.deleted"
[](<#(resource) beta.assistants > (model) assistant_deleted > (schema) > (property) object>)
[](<#(resource) beta.assistants > (model) assistant_deleted > (schema)>)
### Delete assistant
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
const response = await openai.beta.assistants.delete("asst\_abc123");
console.log(response);
}
main();`
```
```
`{
"id": "asst\_abc123",
"object": "assistant.deleted",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"id": "asst\_abc123",
"object": "assistant.deleted",
"deleted": true
}
`
```