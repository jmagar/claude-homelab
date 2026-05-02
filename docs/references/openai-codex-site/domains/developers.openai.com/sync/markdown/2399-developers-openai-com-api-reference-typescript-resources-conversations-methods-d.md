Delete a conversation | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/typescript)
[Conversations](/api/reference/typescript/resources/conversations)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete a conversation
client.conversations.delete(stringconversationID, RequestOptionsoptions?): [ConversationDeletedResource](</api/reference/typescript/resources/conversations#(resource) conversations > (model) conversation_deleted_resource > (schema)>) { id, deleted, object }
DELETE/conversations/{conversation\_id}
Delete a conversation. Items in the conversation will not be deleted.
##### ParametersExpand Collapse
conversationID: string
[](<#(resource) conversations > (method) delete > (params) default > (param) conversation_id > (schema)>)
##### ReturnsExpand Collapse
ConversationDeletedResource { id, deleted, object }
id: string
[](<#(resource) conversations > (model) conversation_deleted_resource > (schema) > (property) id>)
deleted: boolean
[](<#(resource) conversations > (model) conversation_deleted_resource > (schema) > (property) deleted>)
object: "conversation.deleted"
[](<#(resource) conversations > (model) conversation_deleted_resource > (schema) > (property) object>)
[](<#(resource) conversations > (model) conversation_deleted_resource > (schema)>)
### Delete a conversation
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
const deleted = await client.conversations.delete("conv\_123");
console.log(deleted);
`
```
```
`{
"id": "conv\_123",
"object": "conversation.deleted",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"id": "conv\_123",
"object": "conversation.deleted",
"deleted": true
}
`
```