Delete a conversation | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Conversations](/api/reference/ruby/resources/conversations)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete a conversation
conversations.delete(conversation\_id) -\> [ConversationDeletedResource](</api/reference/ruby/resources/conversations#(resource) conversations > (model) conversation_deleted_resource > (schema)>) { id, deleted, object }
DELETE/conversations/{conversation\_id}
Delete a conversation. Items in the conversation will not be deleted.
##### ParametersExpand Collapse
conversation\_id: String
[](<#(resource) conversations > (method) delete > (params) default > (param) conversation_id > (schema)>)
##### ReturnsExpand Collapse
class ConversationDeletedResource { id, deleted, object }
id: String
[](<#(resource) conversations > (model) conversation_deleted_resource > (schema) > (property) id>)
deleted: bool
[](<#(resource) conversations > (model) conversation_deleted_resource > (schema) > (property) deleted>)
object: :"conversation.deleted"
[](<#(resource) conversations > (model) conversation_deleted_resource > (schema) > (property) object>)
[](<#(resource) conversations > (model) conversation_deleted_resource > (schema)>)
### Delete a conversation
Ruby
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
`require "openai"
openai = OpenAI::Client.new(api\_key: "My API Key")
conversation\_deleted\_resource = openai.conversations.delete("conv\_123")
puts(conversation\_deleted\_resource)`
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