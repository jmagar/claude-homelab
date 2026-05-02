Content | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/terraform)
[Skills](/api/reference/terraform/resources/skills)
[Versions](/api/reference/terraform/resources/skills/subresources/versions)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Content
#### data openai\_skill\_version\_content
##### required Expand Collapse
skill\_id: String
[](<#(resource) skills.versions.content > (terraform datasource-single) > (attribute) skill_id>)
version: String
The skill version number.
[](<#(resource) skills.versions.content > (terraform datasource-single) > (attribute) version>)
##### computed Expand Collapse
content: JSON
[](<#(resource) skills.versions.content > (terraform datasource-single) > (attribute) content>)
### openai\_skill\_version\_content
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
`data "openai\_skill\_version\_content" "example\_skill\_version\_content" {
skill\_id = "skill\_123"
version = "version"
}
`
```