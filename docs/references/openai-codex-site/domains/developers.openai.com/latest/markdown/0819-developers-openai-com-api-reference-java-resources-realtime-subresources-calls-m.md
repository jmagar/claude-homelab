Refer call | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Realtime](/api/reference/java/resources/realtime)
[Calls](/api/reference/java/resources/realtime/subresources/calls)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Refer call
realtime().calls().refer(CallReferParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/realtime/calls/{call\_id}/refer
Transfer an active SIP call to a new destination using the SIP REFER verb.
##### ParametersExpand Collapse
CallReferParams params
Optional\<String\> callId
[](<#(resource) realtime.calls > (method) refer > (params) default > (param) call_id > (schema)>)
String targetUri
URI that should appear in the SIP Refer-To header. Supports values like
`tel:+14155550123` or `sip:agent@example.com`.
[](<#(resource) realtime.calls > (method) refer > (params) default > (param) body > (schema) > (property) target_uri>)
[](<#(resource) realtime.calls > (method) refer > (params) default>)
### Refer call
Java
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
`package com.openai.example;
import com.openai.client.OpenAIClient;
import com.openai.client.okhttp.OpenAIOkHttpClient;
import com.openai.models.realtime.calls.CallReferParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
CallReferParams params = CallReferParams.builder()
.callId("call\_id")
.targetUri("tel:+14155550123")
.build();
client.realtime().calls().refer(params);
}
}`
```
##### Returns Examples