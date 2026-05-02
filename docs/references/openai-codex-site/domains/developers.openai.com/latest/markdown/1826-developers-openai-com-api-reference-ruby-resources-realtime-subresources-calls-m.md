Hang up call | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Realtime](/api/reference/ruby/resources/realtime)
[Calls](/api/reference/ruby/resources/realtime/subresources/calls)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Hang up call
realtime.calls.hangup(call\_id) -\> void
POST/realtime/calls/{call\_id}/hangup
End an active Realtime API call, whether it was initiated over SIP or
WebRTC.
##### ParametersExpand Collapse
call\_id: String
[](<#(resource) realtime.calls > (method) hangup > (params) default > (param) call_id > (schema)>)
### Hang up call
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
result = openai.realtime.calls.hangup("call\_id")
puts(result)`
```
##### Returns Examples