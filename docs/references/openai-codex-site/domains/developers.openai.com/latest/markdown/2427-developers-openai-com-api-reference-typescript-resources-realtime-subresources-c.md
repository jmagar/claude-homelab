Calls | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Realtime](/api/reference/typescript/resources/realtime)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Calls
##### [Accept call](/api/reference/typescript/resources/realtime/subresources/calls/methods/accept)
client.realtime.calls.accept(stringcallID, CallAcceptParams { type, audio, include, 9 more } body, RequestOptionsoptions?): void
POST/realtime/calls/{call\_id}/accept
##### [Hang up call](/api/reference/typescript/resources/realtime/subresources/calls/methods/hangup)
client.realtime.calls.hangup(stringcallID, RequestOptionsoptions?): void
POST/realtime/calls/{call\_id}/hangup
##### [Refer call](/api/reference/typescript/resources/realtime/subresources/calls/methods/refer)
client.realtime.calls.refer(stringcallID, CallReferParams { target\_uri } body, RequestOptionsoptions?): void
POST/realtime/calls/{call\_id}/refer
##### [Reject call](/api/reference/typescript/resources/realtime/subresources/calls/methods/reject)
client.realtime.calls.reject(stringcallID, CallRejectParams { status\_code } body?, RequestOptionsoptions?): void
POST/realtime/calls/{call\_id}/reject