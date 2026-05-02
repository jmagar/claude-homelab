Skills | OpenAI API Reference
[Skip to content](#_top)
[API Reference](/api/reference/terraform)
Copy Markdown
Open in **Claude**
Open in **ChatGPT**
Open in **Cursor**
**Copy Markdown**
**View as Markdown**
# Skills
#### resource openai\_skill
##### optional Expand Collapse
files?: List[String]
Skill files to upload (directory upload) or a single zip file.
[](<#(resource) skills > (terraform resource) > (attribute) files>)
default\_version?: String
The skill version number to set as default.
[](<#(resource) skills > (terraform resource) > (attribute) default_version>)
##### computed Expand Collapse
id: String
Unique identifier for the skill.
[](<#(resource) skills > (terraform resource) > (attribute) id>)
created\_at: Int64
Unix timestamp (seconds) for when the skill was created.
[](<#(resource) skills > (terraform resource) > (attribute) created_at>)
description: String
Description of the skill.
[](<#(resource) skills > (terraform resource) > (attribute) description>)
latest\_version: String
Latest version for the skill.
[](<#(resource) skills > (terraform resource) > (attribute) latest_version>)
name: String
Name of the skill.
[](<#(resource) skills > (terraform resource) > (attribute) name>)
object: String
The object type, which is `skill`.
[](<#(resource) skills > (terraform resource) > (attribute) object>)
### openai\_skill
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
`resource "openai\_skill" "example\_skill" {
files = ["Example data"]
}
`
```
#### data openai\_skill
##### optional Expand Collapse
skill\_id?: String
[](<#(resource) skills > (terraform datasource-single) > (attribute) skill_id>)
find\_one\_by?: Attributes
order?: String
Sort order of results by timestamp. Use `asc` for ascending order or `desc` for descending order.
[](<#(resource) skills > (terraform datasource-single) > (attribute) find_one_by > (attribute) order>)
[](<#(resource) skills > (terraform datasource-single) > (attribute) find_one_by>)
##### computed Expand Collapse
id: String
[](<#(resource) skills > (terraform datasource-single) > (attribute) id>)
created\_at: Int64
Unix timestamp (seconds) for when the skill was created.
[](<#(resource) skills > (terraform datasource-single) > (attribute) created_at>)
default\_version: String
Default version for the skill.
[](<#(resource) skills > (terraform datasource-single) > (attribute) default_version>)
description: String
Description of the skill.
[](<#(resource) skills > (terraform datasource-single) > (attribute) description>)
latest\_version: String
Latest version for the skill.
[](<#(resource) skills > (terraform datasource-single) > (attribute) latest_version>)
name: String
Name of the skill.
[](<#(resource) skills > (terraform datasource-single) > (attribute) name>)
object: String
The object type, which is `skill`.
[](<#(resource) skills > (terraform datasource-single) > (attribute) object>)
### openai\_skill
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
`data "openai\_skill" "example\_skill" {
skill\_id = "skill\_123"
}
`
```
#### data openai\_skills
##### optional Expand Collapse
order?: String
Sort order of results by timestamp. Use `asc` for ascending order or `desc` for descending order.
[](<#(resource) skills > (terraform datasource-plural) > (attribute) order>)
max\_items?: Int64
Max items to fetch, default: 1000
[](<#(resource) skills > (terraform datasource-plural) > (attribute) max_items>)
##### computed Expand Collapse
items: List[Attributes]
The items returned by the data source
id: String
Unique identifier for the skill.
[](<#(resource) skills > (terraform datasource-plural) > (attribute) items > (attribute) id>)
created\_at: Int64
Unix timestamp (seconds) for when the skill was created.
[](<#(resource) skills > (terraform datasource-plural) > (attribute) items > (attribute) created_at>)
default\_version: String
Default version for the skill.
[](<#(resource) skills > (terraform datasource-plural) > (attribute) items > (attribute) default_version>)
description: String
Description of the skill.
[](<#(resource) skills > (terraform datasource-plural) > (attribute) items > (attribute) description>)
latest\_version: String
Latest version for the skill.
[](<#(resource) skills > (terraform datasource-plural) > (attribute) items > (attribute) latest_version>)
name: String
Name of the skill.
[](<#(resource) skills > (terraform datasource-plural) > (attribute) items > (attribute) name>)
object: String
The object type, which is `skill`.
[](<#(resource) skills > (terraform datasource-plural) > (attribute) items > (attribute) object>)
[](<#(resource) skills > (terraform datasource-plural) > (attribute) items>)
### openai\_skills
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
`data "openai\_skills" "example\_skills" {
order = "asc"
}
`
```
#### SkillsContent
#### data openai\_skill\_content
##### required Expand Collapse
skill\_id: String
[](<#(resource) skills.content > (terraform datasource-single) > (attribute) skill_id>)
##### computed Expand Collapse
content: JSON
[](<#(resource) skills.content > (terraform datasource-single) > (attribute) content>)
### openai\_skill\_content
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
`data "openai\_skill\_content" "example\_skill\_content" {
skill\_id = "skill\_123"
}
`
```
#### SkillsVersions
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
#### SkillsVersionsContent
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