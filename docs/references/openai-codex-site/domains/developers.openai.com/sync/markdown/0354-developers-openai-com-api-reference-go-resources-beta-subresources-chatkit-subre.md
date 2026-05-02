Sessions | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Beta](/api/reference/go/resources/beta)
[ChatKit](/api/reference/go/resources/beta/subresources/chatkit)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Sessions
##### [Cancel chat session](/api/reference/go/resources/beta/subresources/chatkit/subresources/sessions/methods/cancel)
client.Beta.ChatKit.Sessions.Cancel(ctx, sessionID) (\*[ChatSession](</api/reference/go/resources/beta#(resource) beta.chatkit.threads > (model) chat_session > (schema)>), error)
POST/chatkit/sessions/{session\_id}/cancel
##### [Create ChatKit session](/api/reference/go/resources/beta/subresources/chatkit/subresources/sessions/methods/create)
client.Beta.ChatKit.Sessions.New(ctx, body) (\*[ChatSession](</api/reference/go/resources/beta#(resource) beta.chatkit.threads > (model) chat_session > (schema)>), error)
POST/chatkit/sessions