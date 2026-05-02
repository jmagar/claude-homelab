Delete an item | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Conversations](/api/reference/typescript/resources/conversations)
[Items](/api/reference/typescript/resources/conversations/subresources/items)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete an item
client.conversations.items.delete(stringitemID, ItemDeleteParams { conversation\_id } params, RequestOptionsoptions?): [Conversation](</api/reference/typescript/resources/conversations#(resource) conversations > (model) conversation > (schema)>) { id, created\_at, metadata, object }
DELETE/conversations/{conversation\_id}/items/{item\_id}
Delete an item from a conversation with the given IDs.
##### ParametersExpand Collapse
itemID: string
[](<#(resource) conversations.items > (method) delete > (params) default > (param) item_id > (schema)>)
params: ItemDeleteParams { conversation\_id }
conversation\_id: string
The ID of the conversation that contains the item.
[](<#(resource) conversations.items > (method) delete > (params) default > (param) conversation_id>)
[](<#(resource) conversations.items > (method) delete > (params) default>)
##### ReturnsExpand Collapse
Conversation { id, created\_at, metadata, object }
id: string
The unique ID of the conversation.
[](<#(resource) conversations > (model) conversation > (schema) > (property) id>)
created\_at: number
The time at which the conversation was created, measured in seconds since the Unix epoch.
[](<#(resource) conversations > (model) conversation > (schema) > (property) created_at>)
metadata: unknown
Set of 16 key-value pairs that can be attached to an object. This can be useful for storing additional information about the object in a structured format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings with a maximum length of 512 characters.
[](<#(resource) conversations > (model) conversation > (schema) > (property) metadata>)
object: "conversation"
The object type, which is always `conversation`.
[](<#(resource) conversations > (model) conversation > (schema) > (property) object>)
[](<#(resource) conversations > (model) conversation > (schema)>)
### Delete an item
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
`import OpenAI from "openai";
const client = new OpenAI();
const conversation = await client.conversations.items.delete(
"conv\_123",
"msg\_abc"
);
console.log(conversation);
`
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