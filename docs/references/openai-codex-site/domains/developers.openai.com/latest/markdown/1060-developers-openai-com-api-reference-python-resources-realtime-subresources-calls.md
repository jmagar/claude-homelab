Reject call | OpenAI API Reference
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
# Reject call
realtime.calls.reject(strcall\_id, CallRejectParams\*\*kwargs)
POST/realtime/calls/{call\_id}/reject
Decline an incoming SIP call by returning a SIP status code to the caller.
##### ParametersExpand Collapse
call\_id: str
[](<#(resource) realtime.calls > (method) reject > (params) default > (param) call_id > (schema)>)
status\_code: Optional[int]
SIP response code to send back to the caller. Defaults to `603` (Decline)
when omitted.
[](<#(resource) realtime.calls > (method) reject > (params) default > (param) status_code > (schema)>)
### Reject call
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
client.realtime.calls.reject(
call\_id="call\_id",
)`
```
##### Returns Examples