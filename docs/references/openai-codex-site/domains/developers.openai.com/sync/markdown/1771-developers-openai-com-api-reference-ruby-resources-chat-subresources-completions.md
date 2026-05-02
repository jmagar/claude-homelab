Delete chat completion | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Chat](/api/reference/ruby/resources/chat)
[Completions](/api/reference/ruby/resources/chat/subresources/completions)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete chat completion
chat.completions.delete(completion\_id) -\> [ChatCompletionDeleted](</api/reference/ruby/resources/chat#(resource) chat.completions > (model) chat_completion_deleted > (schema)>) { id, deleted, object }
DELETE/chat/completions/{completion\_id}
Delete a stored chat completion. Only Chat Completions that have been
created with the `store` parameter set to `true` can be deleted.
##### ParametersExpand Collapse
completion\_id: String
[](<#(resource) chat.completions > (method) delete > (params) default > (param) completion_id > (schema)>)
##### ReturnsExpand Collapse
class ChatCompletionDeleted { id, deleted, object }
id: String
The ID of the chat completion that was deleted.
[](<#(resource) chat.completions > (model) chat_completion_deleted > (schema) > (property) id>)
deleted: bool
Whether the chat completion was deleted.
[](<#(resource) chat.completions > (model) chat_completion_deleted > (schema) > (property) deleted>)
object: :"chat.completion.deleted"
The type of object being deleted.
[](<#(resource) chat.completions > (model) chat_completion_deleted > (schema) > (property) object>)
[](<#(resource) chat.completions > (model) chat_completion_deleted > (schema)>)
### Delete chat completion
Ruby
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
`require "openai"
openai = OpenAI::Client.new(api\_key: "My API Key")
chat\_completion\_deleted = openai.chat.completions.delete("completion\_id")
puts(chat\_completion\_deleted)`
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