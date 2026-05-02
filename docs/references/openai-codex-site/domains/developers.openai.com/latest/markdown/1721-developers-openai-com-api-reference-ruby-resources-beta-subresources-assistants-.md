Delete assistant | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Beta](/api/reference/ruby/resources/beta)
[Assistants](/api/reference/ruby/resources/beta/subresources/assistants)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete assistant
Deprecated
beta.assistants.delete(assistant\_id) -\> [AssistantDeleted](</api/reference/ruby/resources/beta#(resource) beta.assistants > (model) assistant_deleted > (schema)>) { id, deleted, object }
DELETE/assistants/{assistant\_id}
Delete an assistant.
##### ParametersExpand Collapse
assistant\_id: String
[](<#(resource) beta.assistants > (method) delete > (params) default > (param) assistant_id > (schema)>)
##### ReturnsExpand Collapse
class AssistantDeleted { id, deleted, object }
id: String
[](<#(resource) beta.assistants > (model) assistant_deleted > (schema) > (property) id>)
deleted: bool
[](<#(resource) beta.assistants > (model) assistant_deleted > (schema) > (property) deleted>)
object: :"assistant.deleted"
[](<#(resource) beta.assistants > (model) assistant_deleted > (schema) > (property) object>)
[](<#(resource) beta.assistants > (model) assistant_deleted > (schema)>)
### Delete assistant
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
assistant\_deleted = openai.beta.assistants.delete("assistant\_id")
puts(assistant\_deleted)`
```
```
`{
"id": "asst\_abc123",
"object": "assistant.deleted",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"id": "asst\_abc123",
"object": "assistant.deleted",
"deleted": true
}
`
```