Refer call | OpenAI API Reference
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
# Refer call
POST/realtime/calls/{call\_id}/refer
Transfer an active SIP call to a new destination using the SIP REFER verb.
##### Path ParametersExpand Collapse
call\_id: string
[](<#(resource) realtime.calls > (method) refer > (params) default > (param) call_id > (schema)>)
##### Body ParametersJSONExpand Collapse
target\_uri: string
URI that should appear in the SIP Refer-To header. Supports values like
`tel:+14155550123` or `sip:agent@example.com`.
[](<#(resource) realtime.calls > (method) refer > (params) 0 > (param) target_uri > (schema)>)
### Refer call
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
`curl -X POST https://api.openai.com/v1/realtime/calls/$CALL\_ID/refer \\
-H "Authorization: Bearer $OPENAI\_API\_KEY" \\
-H "Content-Type: application/json" \\
-d '{"target\_uri": "tel:+14155550123"}'`
```
##### Returns Examples