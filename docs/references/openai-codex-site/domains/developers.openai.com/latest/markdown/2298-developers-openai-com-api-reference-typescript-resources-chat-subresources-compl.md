Messages | OpenAI API Reference
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
# Messages
Given a list of messages comprising a conversation, the model will return a response.
##### [Get chat messages](/api/reference/typescript/resources/chat/subresources/completions/subresources/messages/methods/list)
client.chat.completions.messages.list(stringcompletionID, MessageListParams { after, limit, order } query?, RequestOptionsoptions?): CursorPage\<[ChatCompletionStoreMessage](</api/reference/typescript/resources/chat#(resource) chat.completions > (model) chat_completion_store_message > (schema)>) { id, content\_parts } \>
GET/chat/completions/{completion\_id}/messages