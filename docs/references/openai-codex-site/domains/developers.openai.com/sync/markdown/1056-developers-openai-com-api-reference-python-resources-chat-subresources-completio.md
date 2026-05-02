Messages | OpenAI API Reference
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
# Messages
Given a list of messages comprising a conversation, the model will return a response.
##### [Get chat messages](/api/reference/python/resources/chat/subresources/completions/subresources/messages/methods/list)
chat.completions.messages.list(strcompletion\_id, MessageListParams\*\*kwargs) -\> SyncCursorPage[[ChatCompletionStoreMessage](</api/reference/python/resources/chat#(resource) chat.completions > (model) chat_completion_store_message > (schema)>)]
GET/chat/completions/{completion\_id}/messages