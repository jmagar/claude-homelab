Hang up call | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Realtime](/api/reference/python/resources/realtime)
[Calls](/api/reference/python/resources/realtime/subresources/calls)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Hang up call
realtime.calls.hangup(strcall\_id)
POST/realtime/calls/{call\_id}/hangup
End an active Realtime API call, whether it was initiated over SIP or
WebRTC.
##### ParametersExpand Collapse
call\_id: str
[](<#(resource) realtime.calls > (method) hangup > (params) default > (param) call_id > (schema)>)
### Hang up call
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
`import os
from openai import OpenAI
client = OpenAI(
api\_key=os.environ.get("OPENAI\_API\_KEY"), # This is the default and can be omitted
)
client.realtime.calls.hangup(
"call\_id",
)`
```
##### Returns Examples