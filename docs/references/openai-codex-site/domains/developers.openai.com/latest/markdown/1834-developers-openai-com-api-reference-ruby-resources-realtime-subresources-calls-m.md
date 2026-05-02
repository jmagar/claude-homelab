Reject call | OpenAI API Reference
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
# Reject call
realtime.calls.reject(call\_id, \*\*kwargs) -\> void
POST/realtime/calls/{call\_id}/reject
Decline an incoming SIP call by returning a SIP status code to the caller.
##### ParametersExpand Collapse
call\_id: String
[](<#(resource) realtime.calls > (method) reject > (params) default > (param) call_id > (schema)>)
status\_code: Integer
SIP response code to send back to the caller. Defaults to `603` (Decline)
when omitted.
[](<#(resource) realtime.calls > (method) reject > (params) default > (param) status_code > (schema)>)
### Reject call
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
result = openai.realtime.calls.reject("call\_id")
puts(result)`
```
##### Returns Examples