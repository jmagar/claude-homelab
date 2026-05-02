Refer call | OpenAI API Reference
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
# Refer call
realtime.calls.refer(strcall\_id, CallReferParams\*\*kwargs)
POST/realtime/calls/{call\_id}/refer
Transfer an active SIP call to a new destination using the SIP REFER verb.
##### ParametersExpand Collapse
call\_id: str
[](<#(resource) realtime.calls > (method) refer > (params) default > (param) call_id > (schema)>)
target\_uri: str
URI that should appear in the SIP Refer-To header. Supports values like
`tel:+14155550123` or `sip:agent@example.com`.
[](<#(resource) realtime.calls > (method) refer > (params) default > (param) target_uri > (schema)>)
### Refer call
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
client.realtime.calls.refer(
call\_id="call\_id",
target\_uri="tel:+14155550123",
)`
```
##### Returns Examples