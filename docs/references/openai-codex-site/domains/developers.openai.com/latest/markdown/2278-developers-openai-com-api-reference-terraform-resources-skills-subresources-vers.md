Versions | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/terraform)
[Skills](/api/reference/terraform/resources/skills)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Versions
#### resource openai\_skill\_version
##### required Expand Collapse
skill\_id: String
[](<#(resource) skills.versions > (terraform resource) > (attribute) skill_id>)
##### optional Expand Collapse
default?: Bool
Whether to set this version as the default.
[](<#(resource) skills.versions > (terraform resource) > (attribute) default>)
files?: List[String]
Skill files to upload (directory upload) or a single zip file.
[](<#(resource) skills.versions > (terraform resource) > (attribute) files>)
##### computed Expand Collapse
id: String
Unique identifier for the skill version.
[](<#(resource) skills.versions > (terraform resource) > (attribute) id>)
created\_at: Int64
Unix timestamp (seconds) for when the version was created.
[](<#(resource) skills.versions > (terraform resource) > (attribute) created_at>)
description: String
Description of the skill version.
[](<#(resource) skills.versions > (terraform resource) > (attribute) description>)
name: String
Name of the skill version.
[](<#(resource) skills.versions > (terraform resource) > (attribute) name>)
object: String
The object type, which is `skill.version`.
[](<#(resource) skills.versions > (terraform resource) > (attribute) object>)
version: String
Version number for this skill.
[](<#(resource) skills.versions > (terraform resource) > (attribute) version>)
### openai\_skill\_version
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
`resource "openai\_skill\_version" "example\_skill\_version" {
skill\_id = "skill\_123"
default = true
files = ["Example data"]
}
`
```
#### data openai\_skill\_version
##### required Expand Collapse
skill\_id: String
[](<#(resource) skills.versions > (terraform datasource-single) > (attribute) skill_id>)
##### optional Expand Collapse
version?: String
The version number to retrieve.
[](<#(resource) skills.versions > (terraform datasource-single) > (attribute) version>)
find\_one\_by?: Attributes
order?: String
Sort order of results by version number.
[](<#(resource) skills.versions > (terraform datasource-single) > (attribute) find_one_by > (attribute) order>)
[](<#(resource) skills.versions > (terraform datasource-single) > (attribute) find_one_by>)
##### computed Expand Collapse
id: String
The version number to retrieve.
[](<#(resource) skills.versions > (terraform datasource-single) > (attribute) id>)
created\_at: Int64
Unix timestamp (seconds) for when the version was created.
[](<#(resource) skills.versions > (terraform datasource-single) > (attribute) created_at>)
description: String
Description of the skill version.
[](<#(resource) skills.versions > (terraform datasource-single) > (attribute) description>)
name: String
Name of the skill version.
[](<#(resource) skills.versions > (terraform datasource-single) > (attribute) name>)
object: String
The object type, which is `skill.version`.
[](<#(resource) skills.versions > (terraform datasource-single) > (attribute) object>)
### openai\_skill\_version
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
`data "openai\_skill\_version" "example\_skill\_version" {
skill\_id = "skill\_123"
version = "version"
}
`
```
#### data openai\_skill\_versions
##### required Expand Collapse
skill\_id: String
[](<#(resource) skills.versions > (terraform datasource-plural) > (attribute) skill_id>)
##### optional Expand Collapse
order?: String
Sort order of results by version number.
[](<#(resource) skills.versions > (terraform datasource-plural) > (attribute) order>)
max\_items?: Int64
Max items to fetch, default: 1000
[](<#(resource) skills.versions > (terraform datasource-plural) > (attribute) max_items>)
##### computed Expand Collapse
items: List[Attributes]
The items returned by the data source
id: String
Unique identifier for the skill version.
[](<#(resource) skills.versions > (terraform datasource-plural) > (attribute) items > (attribute) id>)
created\_at: Int64
Unix timestamp (seconds) for when the version was created.
[](<#(resource) skills.versions > (terraform datasource-plural) > (attribute) items > (attribute) created_at>)
description: String
Description of the skill version.
[](<#(resource) skills.versions > (terraform datasource-plural) > (attribute) items > (attribute) description>)
name: String
Name of the skill version.
[](<#(resource) skills.versions > (terraform datasource-plural) > (attribute) items > (attribute) name>)
object: String
The object type, which is `skill.version`.
[](<#(resource) skills.versions > (terraform datasource-plural) > (attribute) items > (attribute) object>)
skill\_id: String
Identifier of the skill for this version.
[](<#(resource) skills.versions > (terraform datasource-plural) > (attribute) items > (attribute) skill_id>)
version: String
Version number for this skill.
[](<#(resource) skills.versions > (terraform datasource-plural) > (attribute) items > (attribute) version>)
[](<#(resource) skills.versions > (terraform datasource-plural) > (attribute) items>)
### openai\_skill\_versions
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
`data "openai\_skill\_versions" "example\_skill\_versions" {
skill\_id = "skill\_123"
order = "asc"
}
`
```
#### VersionsContent
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