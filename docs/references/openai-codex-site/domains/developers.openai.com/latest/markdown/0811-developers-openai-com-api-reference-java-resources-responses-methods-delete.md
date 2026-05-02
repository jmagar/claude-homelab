Delete a model response | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Responses](/api/reference/java/resources/responses)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete a model response
responses().delete(ResponseDeleteParamsparams = ResponseDeleteParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
DELETE/responses/{response\_id}
Deletes a model response with the given ID.
##### ParametersExpand Collapse
ResponseDeleteParams params
Optional\<String\> responseId
[](<#(resource) responses > (method) delete > (params) default > (param) response_id > (schema)>)
[](<#(resource) responses > (method) delete > (params) default>)
### Delete a model response
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
import com.openai.models.responses.ResponseDeleteParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
client.responses().delete("resp\_677efb5139a88190b512bc3fef8e535d");
}
}`
```
```
`{
"id": "resp\_6786a1bec27481909a17d673315b29f6",
"object": "response",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"id": "resp\_6786a1bec27481909a17d673315b29f6",
"object": "response",
"deleted": true
}
`
```