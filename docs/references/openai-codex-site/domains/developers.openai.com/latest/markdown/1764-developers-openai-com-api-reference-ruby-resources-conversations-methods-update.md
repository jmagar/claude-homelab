Update a conversation | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Conversations](/api/reference/ruby/resources/conversations)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Update a conversation
conversations.update(conversation\_id, \*\*kwargs) -\> [Conversation](</api/reference/ruby/resources/conversations#(resource) conversations > (model) conversation > (schema)>) { id, created\_at, metadata, object }
POST/conversations/{conversation\_id}
Update a conversation
##### ParametersExpand Collapse
conversation\_id: String
[](<#(resource) conversations > (method) update > (params) default > (param) conversation_id > (schema)>)
metadata: [Metadata](</api/reference/ruby/resources/$shared#(resource) $shared > (model) metadata > (schema)>)
Set of 16 key-value pairs that can be attached to an object. This can be
useful for storing additional information about the object in a structured
format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings
with a maximum length of 512 characters.
[](<#(resource) conversations > (method) update > (params) default > (param) metadata > (schema)>)
##### ReturnsExpand Collapse
class Conversation { id, created\_at, metadata, object }
id: String
The unique ID of the conversation.
[](<#(resource) conversations > (model) conversation > (schema) > (property) id>)
created\_at: Integer
The time at which the conversation was created, measured in seconds since the Unix epoch.
[](<#(resource) conversations > (model) conversation > (schema) > (property) created_at>)
metadata: untyped
Set of 16 key-value pairs that can be attached to an object. This can be useful for storing additional information about the object in a structured format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings with a maximum length of 512 characters.
[](<#(resource) conversations > (model) conversation > (schema) > (property) metadata>)
object: :conversation
The object type, which is always `conversation`.
[](<#(resource) conversations > (model) conversation > (schema) > (property) object>)
[](<#(resource) conversations > (model) conversation > (schema)>)
### Update a conversation
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
conversation = openai.conversations.update("conv\_123", metadata: {foo: "string"})
puts(conversation)`
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