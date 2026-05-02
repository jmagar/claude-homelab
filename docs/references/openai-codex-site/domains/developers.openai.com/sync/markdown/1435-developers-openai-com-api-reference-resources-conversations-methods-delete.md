Delete a conversation | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference)
[Conversations](/api/reference/resources/conversations)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete a conversation
DELETE/conversations/{conversation\_id}
Delete a conversation. Items in the conversation will not be deleted.
##### Path ParametersExpand Collapse
conversation\_id: string
[](<#(resource) conversations > (method) delete > (params) default > (param) conversation_id > (schema)>)
##### ReturnsExpand Collapse
ConversationDeletedResource object { id, deleted, object }
id: string
[](<#(resource) conversations > (model) conversation_deleted_resource > (schema) > (property) id>)
deleted: boolean
[](<#(resource) conversations > (model) conversation_deleted_resource > (schema) > (property) deleted>)
object: "conversation.deleted"
[](<#(resource) conversations > (model) conversation_deleted_resource > (schema) > (property) object>)
[](<#(resource) conversations > (model) conversation_deleted_resource > (schema)>)
### Delete a conversation
HTTP
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
`curl -X DELETE https://api.openai.com/v1/conversations/conv\_123 \\
-H "Authorization: Bearer $OPENAI\_API\_KEY"
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