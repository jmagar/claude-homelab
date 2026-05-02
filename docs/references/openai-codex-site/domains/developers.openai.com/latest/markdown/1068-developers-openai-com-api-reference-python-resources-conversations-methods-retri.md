Retrieve a conversation | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Conversations](/api/reference/python/resources/conversations)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Retrieve a conversation
conversations.retrieve(strconversation\_id) -\> [Conversation](</api/reference/python/resources/conversations#(resource) conversations > (model) conversation > (schema)>)
GET/conversations/{conversation\_id}
Get a conversation
##### ParametersExpand Collapse
conversation\_id: str
[](<#(resource) conversations > (method) retrieve > (params) default > (param) conversation_id > (schema)>)
##### ReturnsExpand Collapse
class Conversation: …
id: str
The unique ID of the conversation.
[](<#(resource) conversations > (model) conversation > (schema) > (property) id>)
created\_at: int
The time at which the conversation was created, measured in seconds since the Unix epoch.
[](<#(resource) conversations > (model) conversation > (schema) > (property) created_at>)
metadata: object
Set of 16 key-value pairs that can be attached to an object. This can be useful for storing additional information about the object in a structured format, and querying for objects via API or the dashboard.
Keys are strings with a maximum length of 64 characters. Values are strings with a maximum length of 512 characters.
[](<#(resource) conversations > (model) conversation > (schema) > (property) metadata>)
object: Literal["conversation"]
The object type, which is always `conversation`.
[](<#(resource) conversations > (model) conversation > (schema) > (property) object>)
[](<#(resource) conversations > (model) conversation > (schema)>)
### Retrieve a conversation
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
conversation = client.conversations.retrieve("conv\_123")
print(conversation)
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