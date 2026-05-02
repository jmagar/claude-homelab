Delete a model response | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Responses](/api/reference/ruby/resources/responses)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete a model response
responses.delete(response\_id) -\> void
DELETE/responses/{response\_id}
Deletes a model response with the given ID.
##### ParametersExpand Collapse
response\_id: String
[](<#(resource) responses > (method) delete > (params) default > (param) response_id > (schema)>)
### Delete a model response
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
result = openai.responses.delete("resp\_677efb5139a88190b512bc3fef8e535d")
puts(result)`
```
```
`{
"id": "resp\_6786a1bec27481909a17d673315b29f6",
"object": "response",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"id": "resp\_6786a1bec27481909a17d673315b29f6",
"object": "response",
"deleted": true
}
`
```