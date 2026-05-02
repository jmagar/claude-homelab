Delete assistant | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Beta](/api/reference/python/resources/beta)
[Assistants](/api/reference/python/resources/beta/subresources/assistants)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete assistant
Deprecated
beta.assistants.delete(strassistant\_id) -\> [AssistantDeleted](</api/reference/python/resources/beta#(resource) beta.assistants > (model) assistant_deleted > (schema)>)
DELETE/assistants/{assistant\_id}
Delete an assistant.
##### ParametersExpand Collapse
assistant\_id: str
[](<#(resource) beta.assistants > (method) delete > (params) default > (param) assistant_id > (schema)>)
##### ReturnsExpand Collapse
class AssistantDeleted: …
id: str
[](<#(resource) beta.assistants > (model) assistant_deleted > (schema) > (property) id>)
deleted: bool
[](<#(resource) beta.assistants > (model) assistant_deleted > (schema) > (property) deleted>)
object: Literal["assistant.deleted"]
[](<#(resource) beta.assistants > (model) assistant_deleted > (schema) > (property) object>)
[](<#(resource) beta.assistants > (model) assistant_deleted > (schema)>)
### Delete assistant
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
response = client.beta.assistants.delete("asst\_abc123")
print(response)
`
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