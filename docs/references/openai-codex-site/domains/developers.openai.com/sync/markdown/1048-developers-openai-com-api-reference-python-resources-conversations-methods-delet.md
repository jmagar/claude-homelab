Delete a conversation | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Conversations](/api/reference/python/resources/conversations)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete a conversation
conversations.delete(strconversation\_id) -\> [ConversationDeletedResource](</api/reference/python/resources/conversations#(resource) conversations > (model) conversation_deleted_resource > (schema)>)
DELETE/conversations/{conversation\_id}
Delete a conversation. Items in the conversation will not be deleted.
##### ParametersExpand Collapse
conversation\_id: str
[](<#(resource) conversations > (method) delete > (params) default > (param) conversation_id > (schema)>)
##### ReturnsExpand Collapse
class ConversationDeletedResource: …
id: str
[](<#(resource) conversations > (model) conversation_deleted_resource > (schema) > (property) id>)
deleted: bool
[](<#(resource) conversations > (model) conversation_deleted_resource > (schema) > (property) deleted>)
object: Literal["conversation.deleted"]
[](<#(resource) conversations > (model) conversation_deleted_resource > (schema) > (property) object>)
[](<#(resource) conversations > (model) conversation_deleted_resource > (schema)>)
### Delete a conversation
Python
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
`from openai import OpenAI
client = OpenAI()
deleted = client.conversations.delete("conv\_123")
print(deleted)
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