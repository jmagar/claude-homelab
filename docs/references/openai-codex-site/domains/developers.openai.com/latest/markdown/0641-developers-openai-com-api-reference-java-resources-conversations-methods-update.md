Update a conversation | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Conversations](/api/reference/java/resources/conversations)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Update a conversation
[Conversation](</api/reference/java/resources/conversations#(resource) conversations > (model) conversation > (schema)>) conversations().update(ConversationUpdateParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
POST/conversations/{conversation\_id}
Update a conversation
##### ParametersExpand Collapse
ConversationUpdateParams params
Optional\<String\> conversationId
[](<#(resource) conversations > (method) update > (params) default > (param) conversation_id > (schema)>)
Optional\<Metadata\> metadata
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) conversations > (method) update > (params) default > (param) body > (schema) > (property) metadata>)
[](<#(resource) conversations > (method) update > (params) default>)
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
### Update a conversation
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
import com.openai.core.JsonValue;
import com.openai.models.conversations.Conversation;
import com.openai.models.conversations.ConversationUpdateParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
ConversationUpdateParams params = ConversationUpdateParams.builder()
.conversationId("conv\_123")
.metadata(ConversationUpdateParams.Metadata.builder()
.putAdditionalProperty("foo", JsonValue.from("string"))
.build())
.build();
Conversation conversation = client.conversations().update(params);
}
}`
```
```
`{
"id": "conv\_123",
"object": "conversation",
"created\_at": 1741900000,
"metadata": {"topic": "project-x"}
}
`
```
##### Returns Examples
```
`{
"id": "conv\_123",
"object": "conversation",
"created\_at": 1741900000,
"metadata": {"topic": "project-x"}
}
`
```