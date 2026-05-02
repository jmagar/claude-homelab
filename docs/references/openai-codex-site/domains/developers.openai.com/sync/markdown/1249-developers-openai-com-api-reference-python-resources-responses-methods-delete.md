Delete a model response | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/python)
[Responses](/api/reference/python/resources/responses)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete a model response
responses.delete(strresponse\_id)
DELETE/responses/{response\_id}
Deletes a model response with the given ID.
##### ParametersExpand Collapse
response\_id: str
[](<#(resource) responses > (method) delete > (params) default > (param) response_id > (schema)>)
### Delete a model response
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
response = client.responses.delete("resp\_123")
print(response)
`
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