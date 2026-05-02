Hang up call | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Realtime](/api/reference/resources/realtime)
[Calls](/api/reference/resources/realtime/subresources/calls)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Hang up call
POST/realtime/calls/{call\_id}/hangup
End an active Realtime API call, whether it was initiated over SIP or
WebRTC.
##### Path ParametersExpand Collapse
call\_id: string
[](<#(resource) realtime.calls > (method) hangup > (params) default > (param) call_id > (schema)>)
### Hang up call
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
`curl -X POST https://api.openai.com/v1/realtime/calls/$CALL\_ID/hangup \\
-H "Authorization: Bearer $OPENAI\_API\_KEY"`
```
##### Returns Examples