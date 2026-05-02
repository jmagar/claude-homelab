Hang up call | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Realtime](/api/reference/typescript/resources/realtime)
[Calls](/api/reference/typescript/resources/realtime/subresources/calls)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Hang up call
client.realtime.calls.hangup(stringcallID, RequestOptionsoptions?): void
POST/realtime/calls/{call\_id}/hangup
End an active Realtime API call, whether it was initiated over SIP or
WebRTC.
##### ParametersExpand Collapse
callID: string
[](<#(resource) realtime.calls > (method) hangup > (params) default > (param) call_id > (schema)>)
### Hang up call
TypeScript
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
`import OpenAI from 'openai';
const client = new OpenAI({
apiKey: process.env['OPENAI\_API\_KEY'], // This is the default and can be omitted
});
await client.realtime.calls.hangup('call\_id');`
```
##### Returns Examples