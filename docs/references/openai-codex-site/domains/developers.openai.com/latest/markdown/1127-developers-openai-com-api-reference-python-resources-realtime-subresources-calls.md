Calls | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Realtime](/api/reference/python/resources/realtime)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Calls
##### [Accept call](/api/reference/python/resources/realtime/subresources/calls/methods/accept)
realtime.calls.accept(strcall\_id, CallAcceptParams\*\*kwargs)
POST/realtime/calls/{call\_id}/accept
##### [Hang up call](/api/reference/python/resources/realtime/subresources/calls/methods/hangup)
realtime.calls.hangup(strcall\_id)
POST/realtime/calls/{call\_id}/hangup
##### [Refer call](/api/reference/python/resources/realtime/subresources/calls/methods/refer)
realtime.calls.refer(strcall\_id, CallReferParams\*\*kwargs)
POST/realtime/calls/{call\_id}/refer
##### [Reject call](/api/reference/python/resources/realtime/subresources/calls/methods/reject)
realtime.calls.reject(strcall\_id, CallRejectParams\*\*kwargs)
POST/realtime/calls/{call\_id}/reject
##### [Create call](/api/reference/python/resources/realtime/subresources/calls/methods/create)
realtime.calls.create(CallCreateParams\*\*kwargs) -\> BinaryResponseContent
POST/realtime/calls