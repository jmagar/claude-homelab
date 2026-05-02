Delete chat completion | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Chat](/api/reference/resources/chat)
[Completions](/api/reference/resources/chat/subresources/completions)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete chat completion
DELETE/chat/completions/{completion\_id}
Delete a stored chat completion. Only Chat Completions that have been
created with the `store` parameter set to `true` can be deleted.
##### Path ParametersExpand Collapse
completion\_id: string
[](<#(resource) chat.completions > (method) delete > (params) default > (param) completion_id > (schema)>)
##### ReturnsExpand Collapse
ChatCompletionDeleted object { id, deleted, object }
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
HTTP
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
`curl -X DELETE https://api.openai.com/v1/chat/completions/chat\_abc123 \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-H "Content-Type: application/json"
`
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