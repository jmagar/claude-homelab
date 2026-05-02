Delete message | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Beta](/api/reference/typescript/resources/beta)
[Threads](/api/reference/typescript/resources/beta/subresources/threads)
[Messages](/api/reference/typescript/resources/beta/subresources/threads/subresources/messages)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete message
Deprecated: The Assistants API is deprecated in favor of the Responses API
client.beta.threads.messages.delete(stringmessageID, MessageDeleteParams { thread\_id } params, RequestOptionsoptions?): [MessageDeleted](</api/reference/typescript/resources/beta#(resource) beta.threads.messages > (model) message_deleted > (schema)>) { id, deleted, object }
DELETE/threads/{thread\_id}/messages/{message\_id}
Deletes a message.
##### ParametersExpand Collapse
messageID: string
[](<#(resource) beta.threads.messages > (method) delete > (params) default > (param) message_id > (schema)>)
params: MessageDeleteParams { thread\_id }
thread\_id: string
The ID of the thread to which this message belongs.
[](<#(resource) beta.threads.messages > (method) delete > (params) default > (param) thread_id>)
[](<#(resource) beta.threads.messages > (method) delete > (params) default>)
##### ReturnsExpand Collapse
MessageDeleted { id, deleted, object }
id: string
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema) > (property) id>)
deleted: boolean
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema) > (property) deleted>)
object: "thread.message.deleted"
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema) > (property) object>)
[](<#(resource) beta.threads.messages > (model) message_deleted > (schema)>)
### Delete message
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
const deletedMessage = await openai.beta.threads.messages.delete(
"msg\_abc123",
{ thread\_id: "thread\_abc123" }
);
console.log(deletedMessage);
}`
```
```
`{
"id": "msg\_abc123",
"object": "thread.message.deleted",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"id": "msg\_abc123",
"object": "thread.message.deleted",
"deleted": true
}
`
```