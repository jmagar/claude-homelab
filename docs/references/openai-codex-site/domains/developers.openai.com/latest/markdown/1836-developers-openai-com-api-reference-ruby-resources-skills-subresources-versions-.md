Download a skill version zip bundle. | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/ruby)
[Skills](/api/reference/ruby/resources/skills)
[Versions](/api/reference/ruby/resources/skills/subresources/versions)
[Content](/api/reference/ruby/resources/skills/subresources/versions/subresources/content)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Download a skill version zip bundle.
skills.versions.content.retrieve(version, \*\*kwargs) -\> StringIO
GET/skills/{skill\_id}/versions/{version}/content
Download a skill version zip bundle.
##### ParametersExpand Collapse
skill\_id: String
[](<#(resource) skills.versions.content > (method) retrieve > (params) default > (param) skill_id > (schema)>)
version: String
The skill version number.
[](<#(resource) skills.versions.content > (method) retrieve > (params) default > (param) version > (schema)>)
##### ReturnsExpand Collapse
StringIO
[](<#(resource) skills.versions.content > (method) retrieve > (network schema)>)
### Download a skill version zip bundle.
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
content = openai.skills.versions.content.retrieve("version", skill\_id: "skill\_123")
puts(content)`
```
##### Returns Examples