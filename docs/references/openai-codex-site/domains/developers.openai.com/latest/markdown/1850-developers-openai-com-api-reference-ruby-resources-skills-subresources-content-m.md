Download a skill zip bundle by its ID. | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Skills](/api/reference/ruby/resources/skills)
[Content](/api/reference/ruby/resources/skills/subresources/content)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Download a skill zip bundle by its ID.
skills.content.retrieve(skill\_id) -\> StringIO
GET/skills/{skill\_id}/content
Download a skill zip bundle by its ID.
##### ParametersExpand Collapse
skill\_id: String
[](<#(resource) skills.content > (method) retrieve > (params) default > (param) skill_id > (schema)>)
##### ReturnsExpand Collapse
StringIO
[](<#(resource) skills.content > (method) retrieve > (network schema)>)
### Download a skill zip bundle by its ID.
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
content = openai.skills.content.retrieve("skill\_123")
puts(content)`
```
##### Returns Examples