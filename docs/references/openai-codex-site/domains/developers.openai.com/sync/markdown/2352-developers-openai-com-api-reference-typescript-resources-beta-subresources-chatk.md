Delete ChatKit thread | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Beta](/api/reference/typescript/resources/beta)
[ChatKit](/api/reference/typescript/resources/beta/subresources/chatkit)
[Threads](/api/reference/typescript/resources/beta/subresources/chatkit/subresources/threads)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete ChatKit thread
client.beta.chatkit.threads.delete(stringthreadID, RequestOptionsoptions?): [ThreadDeleteResponse](</api/reference/typescript/resources/beta#(resource) beta.chatkit.threads > (model) thread_delete_response > (schema)>) { id, deleted, object }
DELETE/chatkit/threads/{thread\_id}
Delete a ChatKit thread along with its items and stored attachments.
##### ParametersExpand Collapse
threadID: string
[](<#(resource) beta.chatkit.threads > (method) delete > (params) default > (param) thread_id > (schema)>)
##### ReturnsExpand Collapse
ThreadDeleteResponse { id, deleted, object }
Confirmation payload returned after deleting a thread.
id: string
Identifier of the deleted thread.
[](<#(resource) beta.chatkit.threads > (model) thread_delete_response > (schema) > (property) id>)
deleted: boolean
Indicates that the thread has been deleted.
[](<#(resource) beta.chatkit.threads > (model) thread_delete_response > (schema) > (property) deleted>)
object: "chatkit.thread.deleted"
Type discriminator that is always `chatkit.thread.deleted`.
[](<#(resource) beta.chatkit.threads > (model) thread_delete_response > (schema) > (property) object>)
[](<#(resource) beta.chatkit.threads > (model) thread_delete_response > (schema)>)
### Delete ChatKit thread
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
`import OpenAI from 'openai';
const client = new OpenAI();
const thread = await client.beta.chat\_kit.threads.delete('cthr\_123');
console.log(thread.id);
`
```
200 example
```
`{
"id": "id",
"deleted": true,
"object": "chatkit.thread.deleted"
}`
```
##### Returns Examples
200 example
```
`{
"id": "id",
"deleted": true,
"object": "chatkit.thread.deleted"
}`
```