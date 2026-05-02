Calls | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/go)
[Realtime](/api/reference/go/resources/realtime)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Calls
##### [Accept call](/api/reference/go/resources/realtime/subresources/calls/methods/accept)
client.Realtime.Calls.Accept(ctx, callID, body) error
POST/realtime/calls/{call\_id}/accept
##### [Hang up call](/api/reference/go/resources/realtime/subresources/calls/methods/hangup)
client.Realtime.Calls.Hangup(ctx, callID) error
POST/realtime/calls/{call\_id}/hangup
##### [Refer call](/api/reference/go/resources/realtime/subresources/calls/methods/refer)
client.Realtime.Calls.Refer(ctx, callID, body) error
POST/realtime/calls/{call\_id}/refer
##### [Reject call](/api/reference/go/resources/realtime/subresources/calls/methods/reject)
client.Realtime.Calls.Reject(ctx, callID, body) error
POST/realtime/calls/{call\_id}/reject