Content | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/terraform)
[Containers](/api/reference/terraform/resources/containers)
[Files](/api/reference/terraform/resources/containers/subresources/files)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Content
#### data openai\_container\_file\_content
##### required Expand Collapse
container\_id: String
[](<#(resource) containers.files.content > (terraform datasource-single) > (attribute) container_id>)
file\_id: String
[](<#(resource) containers.files.content > (terraform datasource-single) > (attribute) file_id>)
##### computed Expand Collapse
content: JSON
[](<#(resource) containers.files.content > (terraform datasource-single) > (attribute) content>)
### openai\_container\_file\_content
Terraform
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
`data "openai\_container\_file\_content" "example\_container\_file\_content" {
container\_id = "container\_id"
file\_id = "file\_id"
}
`
```