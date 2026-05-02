Delete chat completion | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Chat](/api/reference/typescript/resources/chat)
[Completions](/api/reference/typescript/resources/chat/subresources/completions)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete chat completion
client.chat.completions.delete(stringcompletionID, RequestOptionsoptions?): [ChatCompletionDeleted](</api/reference/typescript/resources/chat#(resource) chat.completions > (model) chat_completion_deleted > (schema)>) { id, deleted, object }
DELETE/chat/completions/{completion\_id}
Delete a stored chat completion. Only Chat Completions that have been
created with the `store` parameter set to `true` can be deleted.
##### ParametersExpand Collapse
completionID: string
[](<#(resource) chat.completions > (method) delete > (params) default > (param) completion_id > (schema)>)
##### ReturnsExpand Collapse
ChatCompletionDeleted { id, deleted, object }
id: string
The ID of the chat completion that was deleted.
[](<#(resource) chat.completions > (model) chat_completion_deleted > (schema) > (property) id>)
deleted: boolean
Whether the chat completion was deleted.
[](<#(resource) chat.completions > (model) chat_completion_deleted > (schema) > (property) deleted>)
object: "chat.completion.deleted"
The type of object being deleted.
[](<#(resource) chat.completions > (model) chat_completion_deleted > (schema) > (property) object>)
[](<#(resource) chat.completions > (model) chat_completion_deleted > (schema)>)
### Delete chat completion
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
const client = new OpenAI({
apiKey: process.env['OPENAI\_API\_KEY'], // This is the default and can be omitted
});
const chatCompletionDeleted = await client.chat.completions.delete('completion\_id');
console.log(chatCompletionDeleted.id);`
```
```
`{
"object": "chat.completion.deleted",
"id": "chatcmpl-AyPNinnUqUDYo9SAdA52NobMflmj2",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"object": "chat.completion.deleted",
"id": "chatcmpl-AyPNinnUqUDYo9SAdA52NobMflmj2",
"deleted": true
}
`
```