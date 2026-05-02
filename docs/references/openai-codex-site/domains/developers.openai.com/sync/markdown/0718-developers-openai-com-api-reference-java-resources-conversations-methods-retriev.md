Retrieve a conversation | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Conversations](/api/reference/java/resources/conversations)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Retrieve a conversation
[Conversation](</api/reference/java/resources/conversations#(resource) conversations > (model) conversation > (schema)>) conversations().retrieve(ConversationRetrieveParamsparams = ConversationRetrieveParams.none(), RequestOptionsrequestOptions = RequestOptions.none())
GET/conversations/{conversation\_id}
Get a conversation
##### ParametersExpand Collapse
ConversationRetrieveParams params
Optional\<String\> conversationId
[](<#(resource) conversations > (method) retrieve > (params) default > (param) conversation_id > (schema)>)
[](<#(resource) conversations > (method) retrieve > (params) default>)
##### ReturnsExpand Collapse
class Conversation:
String id
The unique ID of the conversation.
[](<#(resource) conversations > (model) conversation > (schema) > (property) id>)
long createdAt
The time at which the conversation was created, measured in seconds since the Unix epoch.
[](<#(resource) conversations > (model) conversation > (schema) > (property) created_at>)
JsonValue metadata
Set of 16 key-value pairs that can be attached to an object. This can be useful for storing additional information about the object in a structured format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings with a maximum length of 512 characters.
[](<#(resource) conversations > (model) conversation > (schema) > (property) metadata>)
JsonValue; object\_ "conversation"constant"conversation"constant
The object type, which is always `conversation`.
[](<#(resource) conversations > (model) conversation > (schema) > (property) object>)
[](<#(resource) conversations > (model) conversation > (schema)>)
### Retrieve a conversation
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
import com.openai.models.conversations.Conversation;
import com.openai.models.conversations.ConversationRetrieveParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
Conversation conversation = client.conversations().retrieve("conv\_123");
}
}`
```
```
`{
"id": "conv\_123",
"object": "conversation",
"created\_at": 1741900000,
"metadata": {"topic": "demo"}
}
`
```
##### Returns Examples
```
`{
"id": "conv\_123",
"object": "conversation",
"created\_at": 1741900000,
"metadata": {"topic": "demo"}
}
`
```