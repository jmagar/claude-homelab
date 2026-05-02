Delete a container | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Containers](/api/reference/ruby/resources/containers)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Delete a container
containers.delete(container\_id) -\> void
DELETE/containers/{container\_id}
Delete Container
##### ParametersExpand Collapse
container\_id: String
[](<#(resource) containers > (method) delete > (params) default > (param) container_id > (schema)>)
### Delete a container
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
result = openai.containers.delete("container\_id")
puts(result)`
```
```
`{
"id": "cntr\_682dfebaacac8198bbfe9c2474fb6f4a085685cbe3cb5863",
"object": "container.deleted",
"deleted": true
}
`
```
##### Returns Examples
```
`{
"id": "cntr\_682dfebaacac8198bbfe9c2474fb6f4a085685cbe3cb5863",
"object": "container.deleted",
"deleted": true
}
`
```