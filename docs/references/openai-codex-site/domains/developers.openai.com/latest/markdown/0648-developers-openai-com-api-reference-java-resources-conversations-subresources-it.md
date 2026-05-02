Delete an item | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/java)
[Conversations](/api/reference/java/resources/conversations)
[Items](/api/reference/java/resources/conversations/subresources/items)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete an item
[Conversation](</api/reference/java/resources/conversations#(resource) conversations > (model) conversation > (schema)>) conversations().items().delete(ItemDeleteParamsparams, RequestOptionsrequestOptions = RequestOptions.none())
DELETE/conversations/{conversation\_id}/items/{item\_id}
Delete an item from a conversation with the given IDs.
##### ParametersExpand Collapse
ItemDeleteParams params
String conversationId
[](<#(resource) conversations.items > (method) delete > (params) default > (param) conversation_id > (schema)>)
Optional\<String\> itemId
[](<#(resource) conversations.items > (method) delete > (params) default > (param) item_id > (schema)>)
[](<#(resource) conversations.items > (method) delete > (params) default>)
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
### Delete an item
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
import com.openai.models.conversations.items.ItemDeleteParams;
public final class Main {
private Main() {}
public static void main(String[] args) {
OpenAIClient client = OpenAIOkHttpClient.fromEnv();
ItemDeleteParams params = ItemDeleteParams.builder()
.conversationId("conv\_123")
.itemId("msg\_abc")
.build();
Conversation conversation = client.conversations().items().delete(params);
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