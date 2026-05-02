Delete thread | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Beta](/api/reference/typescript/resources/beta)
[Threads](/api/reference/typescript/resources/beta/subresources/threads)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete thread
Deprecated: The Assistants API is deprecated in favor of the Responses API
client.beta.threads.delete(stringthreadID, RequestOptionsoptions?): [ThreadDeleted](</api/reference/typescript/resources/beta#(resource) beta.threads > (model) thread_deleted > (schema)>) { id, deleted, object }
DELETE/threads/{thread\_id}
Delete a thread.
##### ParametersExpand Collapse
threadID: string
[](<#(resource) beta.threads > (method) delete > (params) default > (param) thread_id > (schema)>)
##### ReturnsExpand Collapse
ThreadDeleted { id, deleted, object }
id: string
[](<#(resource) beta.threads > (model) thread_deleted > (schema) > (property) id>)
deleted: boolean
[](<#(resource) beta.threads > (model) thread_deleted > (schema) > (property) deleted>)
object: "thread.deleted"
[](<#(resource) beta.threads > (model) thread_deleted > (schema) > (property) object>)
[](<#(resource) beta.threads > (model) thread_deleted > (schema)>)
### Delete thread
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
const response = await openai.beta.threads.delete("thread\_abc123");
console.log(response);
}
main();`
```
```
`{
"id": "thread\_abc123",
"object": "thread.deleted",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"id": "thread\_abc123",
"object": "thread.deleted",
"deleted": true
}
`
```