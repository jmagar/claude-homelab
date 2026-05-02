Delete chat completion | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Chat](/api/reference/python/resources/chat)
[Completions](/api/reference/python/resources/chat/subresources/completions)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete chat completion
chat.completions.delete(strcompletion\_id) -\> [ChatCompletionDeleted](</api/reference/python/resources/chat#(resource) chat.completions > (model) chat_completion_deleted > (schema)>)
DELETE/chat/completions/{completion\_id}
Delete a stored chat completion. Only Chat Completions that have been
created with the `store` parameter set to `true` can be deleted.
##### ParametersExpand Collapse
completion\_id: str
[](<#(resource) chat.completions > (method) delete > (params) default > (param) completion_id > (schema)>)
##### ReturnsExpand Collapse
class ChatCompletionDeleted: …
id: str
The ID of the chat completion that was deleted.
[](<#(resource) chat.completions > (model) chat_completion_deleted > (schema) > (property) id>)
deleted: bool
Whether the chat completion was deleted.
[](<#(resource) chat.completions > (model) chat_completion_deleted > (schema) > (property) deleted>)
object: Literal["chat.completion.deleted"]
The type of object being deleted.
[](<#(resource) chat.completions > (model) chat_completion_deleted > (schema) > (property) object>)
[](<#(resource) chat.completions > (model) chat_completion_deleted > (schema)>)
### Delete chat completion
Python
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
`from openai import OpenAI
client = OpenAI()
completions = client.chat.completions.list()
first\_id = completions[0].id
delete\_response = client.chat.completions.delete(completion\_id=first\_id)
print(delete\_response)
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