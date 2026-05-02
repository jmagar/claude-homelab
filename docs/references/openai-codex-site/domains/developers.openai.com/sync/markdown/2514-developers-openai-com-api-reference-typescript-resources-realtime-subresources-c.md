Refer call | OpenAI API Reference
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
# Refer call
client.realtime.calls.refer(stringcallID, CallReferParams { target\_uri } body, RequestOptionsoptions?): void
POST/realtime/calls/{call\_id}/refer
Transfer an active SIP call to a new destination using the SIP REFER verb.
##### ParametersExpand Collapse
callID: string
[](<#(resource) realtime.calls > (method) refer > (params) default > (param) call_id > (schema)>)
body: CallReferParams { target\_uri }
target\_uri: string
URI that should appear in the SIP Refer-To header. Supports values like
`tel:+14155550123` or `sip:agent@example.com`.
[](<#(resource) realtime.calls > (method) refer > (params) default > (param) target_uri>)
[](<#(resource) realtime.calls > (method) refer > (params) default>)
### Refer call
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
await client.realtime.calls.refer('call\_id', { target\_uri: 'tel:+14155550123' });`
```
##### Returns Examples